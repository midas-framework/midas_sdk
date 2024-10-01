import gleam/bit_array
import gleam/dynamic
import gleam/http
import gleam/http/request
import gleam/http/response.{Response}
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{None, Some}
import gleam/result.{try}
import gleam/string
import gleam/uri.{Uri}
import midas/task as t
import snag

pub type App {
  App(client_id: String, client_secret: String, redirect_uri: String)
}

const auth_host = "dnsimple.com"

const auth_path = "/oauth/authorize"

pub fn authenticate(app) {
  let App(client_id, client_secret, redirect_uri) = app
  let state = int.to_string(int.random(1_000_000_000))
  let url = auth_url(client_id, redirect_uri, state)
  use redirect <- t.do(t.follow(url))
  use #(code, returned_state) <- t.try(
    auth_redirect(redirect) |> result.map_error(snag.new),
  )
  use Nil <- t.try(case returned_state == state {
    True -> Ok(Nil)
    False -> Error(snag.new("returned state was not equal to sent state"))
  })

  let request =
    token_request(client_id, client_secret, redirect_uri, code, state)
  use response <- t.do(t.fetch(request))
  use token <- t.try(token_response(response))
  t.Done(token)
}

fn auth_url(client_id, redirect_uri, state) {
  let query = [
    #("client_id", client_id),
    #("response_type", "code"),
    #("redirect_uri", redirect_uri),
    #("state", state),
  ]
  let query = Some(uri.query_to_string(query))
  Uri(Some("https"), None, Some(auth_host), None, auth_path, query, None)
  |> uri.to_string
}

pub fn auth_redirect(redirect) {
  let Uri(query: query, ..) = redirect
  use query <- try(case query {
    Some(query) -> Ok(query)
    None -> Error("uri did not have a query: " <> string.inspect(redirect))
  })
  use parts <- try(
    uri.parse_query(query)
    |> result.replace_error("Failed to parse query: " <> query),
  )
  use code <- try(key_find(parts, "code"))
  use returned_state <- try(key_find(parts, "state"))
  Ok(#(code, returned_state))
}

fn key_find(items, key) {
  list.key_find(items, key)
  |> result.replace_error("Did not find key: " <> key)
}

const token_path = "/v2/oauth/access_token"

pub fn token_request(client_id, client_secret, redirect_uri, code, state) {
  let query = [
    #("grant_type", "authorization_code"),
    #("client_id", client_id),
    #("client_secret", client_secret),
    #("code", code),
    #("redirect_uri", redirect_uri),
    #("state", state),
  ]

  request.new()
  |> request.set_host(api_host)
  |> request.set_method(http.Post)
  |> request.set_path(token_path)
  |> request.prepend_header("content-type", "application/x-www-form-urlencoded")
  |> request.set_body(bit_array.from_string(uri.query_to_string(query)))
}

pub fn token_response(response) {
  let Response(body: body, ..) = response
  let assert Ok(body) = bit_array.to_string(body)
  let decoder =
    dynamic.decode2(
      fn(a, b) { #(a, b) },
      dynamic.field("access_token", dynamic.string),
      dynamic.field("account_id", dynamic.int),
    )
  let assert Ok(token) = json.decode(body, decoder)
  Ok(token)
}

const api_host = "api.dnsimple.com"

fn base_request(token) {
  request.new()
  |> request.set_host(api_host)
  |> request.prepend_header("Authorization", string.append("Bearer ", token))
}

fn get(token, path) {
  base_request(token)
  |> request.set_path(path)
  |> request.set_body(<<>>)
}

// fn post(token, path, mime, content) {
//   base_request(token)
//   |> request.set_method(http.Post)
//   |> request.set_path(path)
//   |> request.prepend_header("content-type", mime)
//   |> request.set_body(content)
// }

pub fn list_domains(token, account) {
  let request = list_domains_request(token, account)
  use response <- t.do(t.fetch(request))
  use response <- t.try(list_domains_response(response))
  t.Done(response)
}

pub fn list_domains_request(token, account) {
  let path = "/v2/" <> int.to_string(account) <> "/domains"
  get(token, path)
}

pub fn list_domains_response(response: response.Response(BitArray)) {
  use json <- try(
    bit_array.to_string(response.body)
    |> result.replace_error(snag.new("not utf8 encoded")),
  )
  let decoder = dynamic.field("data", dynamic.list(domain_decoder))
  use videos <- try(
    json.decode_bits(response.body, decoder)
    |> result.replace_error(snag.new("failed to decode vieos")),
  )
  Ok(videos)
}

pub type Domain {
  Domain(id: Int, name: String)
}

fn domain_decoder(raw) {
  dynamic.decode2(
    Domain,
    dynamic.field("id", dynamic.int),
    dynamic.field("name", dynamic.string),
  )(raw)
}
