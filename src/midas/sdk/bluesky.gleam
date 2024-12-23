import gleam/dynamic
import gleam/http
import gleam/http/request
import gleam/int
import gleam/json
import gleam/option.{None, Some}
import gleam/string
import gleam/uri.{Uri}
import midas/task as t
import snag

const api_host = "bsky.social"

pub fn create_session(handle, password) {
  let body =
    json.object([
      #("identifier", json.string(handle)),
      #("password", json.string(password)),
    ])
  let request =
    request.new()
    |> request.set_host(api_host)
    |> request.set_path("/xrpc/com.atproto.server.createSession")
    |> request.set_method(http.Post)
    |> request.set_body(<<json.to_string(body):utf8>>)
    |> request.prepend_header("content-type", "application/json")
  use response <- t.do(t.fetch(request))
  let decoder = dynamic.field("accessJwt", dynamic.string)

  use token <- t.try(case response.status {
    200 ->
      case json.decode_bits(response.body, decoder) {
        Ok(token) -> Ok(token)
        Error(reason) ->
          Error(snag.new("failed to decode response " <> string.inspect(reason)))
      }
    _ -> Error(snag.new("Did not get a 200 response"))
  })
  t.done(token)
}

pub fn create_post(access_token, handle, text, at) {
  let post =
    json.object([
      #("$type", json.string("app.bsky.feed.post")),
      #("text", json.string(text)),
      #("createdAt", json.string(at)),
    ])
  let body =
    json.object([
      #("repo", json.string(handle)),
      #("collection", json.string("app.bsky.feed.post")),
      #("record", post),
    ])
  let request =
    request.new()
    |> request.set_host(api_host)
    |> request.set_path("/xrpc/com.atproto.repo.createRecord")
    |> request.set_method(http.Post)
    |> request.set_body(<<json.to_string(body):utf8>>)
    |> request.prepend_header("content-type", "application/json")
    |> request.prepend_header("authorization", "Bearer " <> access_token)
  use response <- t.do(t.fetch(request))
  let decoder = dynamic.field("uri", dynamic.string)
  use uri <- t.try(case response.status {
    200 ->
      case json.decode_bits(response.body, decoder) {
        Ok(uri) -> Ok(uri)
        Error(reason) ->
          Error(snag.new("failed to decode response " <> string.inspect(reason)))
      }
    _ -> Error(snag.new("Did not get a 200 response"))
  })
  t.done(uri)
}

// oauth uses well know to specify
// https://bsky.social/.well-known/oauth-authorization-server

const auth_host = api_host

const authorization_path = "/oauth/authorize"

pub type App {
  App(client_id: String, redirect_uri: String)
}

pub fn authorize(app) {
  let state = int.to_string(int.random(1_000_000_000))
  do_authorize(app, state)
}

fn do_authorize(app, state) {
  let App(client_id, redirect_uri) = app
  let url = auth_url(client_id, redirect_uri, state)
  use redirect <- t.do(t.follow(url))
  todo
  t.done(Nil)
}

fn auth_url(client_id, redirect_uri, state) {
  let query = [
    #("client_id", client_id),
    #("response_type", "code"),
    // #("grant_type", "authorization_code"),
    #("state", state),
    #("redirect_uri", redirect_uri),
    #("scope", "atproto"),
    #("dpop_bound_access_tokens", "true"),
  ]
  let query = Some(uri.query_to_string(query))
  Uri(
    Some("https"),
    None,
    Some(auth_host),
    None,
    authorization_path,
    query,
    None,
  )
  |> uri.to_string
}
