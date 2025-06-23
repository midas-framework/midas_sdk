import github_sdk/operations
import gleam/bit_array
import gleam/dynamic/decode
import gleam/http
import gleam/http/request
import gleam/http/response
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{None, Some}
import gleam/result
import gleam/string
import gleam/uri.{Uri}
import midas/task as t
import snag

pub type App {
  App(client_id: String, client_secret: String, redirect_uri: String)
}

const auth_host = "github.com"

const auth_path = "/login/oauth/authorize"

pub fn authenticate(app) {
  let state = int.to_string(int.random(1_000_000_000))
  do_authenticate(app, state)
}

pub fn do_authenticate(app, state) {
  let App(client_id, client_secret, redirect_uri) = app
  let url = auth_url(client_id, redirect_uri, state)
  use redirect <- t.do(t.follow(url))
  use #(code, returned_state) <- t.try(
    auth_redirect(redirect) |> result.map_error(snag.new),
  )
  use Nil <- t.try(case returned_state == state {
    True -> Ok(Nil)
    False -> Error(snag.new("returned state was not equal to sent state"))
  })

  let request = token_request(client_id, client_secret, redirect_uri, code)
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
  use query <- result.try(case query {
    Some(query) -> Ok(query)
    None -> Error("uri did not have a query: " <> string.inspect(redirect))
  })
  use parts <- result.try(
    uri.parse_query(query)
    |> result.replace_error("Failed to parse query: " <> query),
  )
  use code <- result.try(key_find(parts, "code"))
  use returned_state <- result.try(key_find(parts, "state"))
  Ok(#(code, returned_state))
}

fn key_find(items, key) {
  list.key_find(items, key)
  |> result.replace_error("Did not find key: " <> key)
}

pub const api_host = "api.github.com"

const token_path = "/login/oauth/access_token"

pub fn token_request(client_id, client_secret, redirect_uri, code) {
  let query = [
    #("client_id", client_id),
    #("client_secret", client_secret),
    #("code", code),
    #("redirect_uri", redirect_uri),
  ]

  request.new()
  |> request.set_host(auth_host)
  |> request.set_method(http.Post)
  |> request.set_path(token_path)
  |> request.prepend_header("content-type", "application/x-www-form-urlencoded")
  |> request.prepend_header("accept", "application/json")
  |> request.set_body(bit_array.from_string(uri.query_to_string(query)))
}

pub fn token_response(response) {
  let response.Response(status: status, body: body, ..) = response

  case status {
    200 -> {
      let assert Ok(token) =
        json.parse_bits(body, {
          use error <- decode.field("access_token", decode.string)
          decode.success(error)
        })
      Ok(token)
    }
    _ -> {
      let assert Ok(error) =
        json.parse_bits(body, {
          use error <- decode.field("error", decode.string)
          decode.success(error)
        })
      snag.error(error)
      |> snag.context("fetching token")
    }
  }
}

pub fn base_request(token) {
  request.new()
  |> request.set_host(api_host)
  |> request.prepend_header("Authorization", string.append("Bearer ", token))
  |> request.prepend_header("Accept", "application/vnd.github+json")
  |> request.prepend_header("X-GitHub-Api-Version", "2022-11-28")
  |> request.set_body(<<>>)
}

fn handle_errors(response) {
  case response {
    Ok(response) -> Ok(response)
    Error(reason) ->
      snag.new(string.inspect(reason))
      |> snag.layer("failed to decode")
      |> Error
  }
}

// GENERATED -------------

pub fn repos_list_for_org(
  token,
  org,
  type_ type_,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_for_org_request(
      request,
      org,
      type_,
      sort,
      direction,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_for_org_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_for_user(
  token,
  username,
  type_ type_,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_for_user_request(
      request,
      username,
      type_,
      sort,
      direction,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_for_user_response(response)),
  )
  t.Done(data)
}
