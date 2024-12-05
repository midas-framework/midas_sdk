import gleam/dynamic
import gleam/http
import gleam/http/request
import gleam/json
import gleam/string
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
