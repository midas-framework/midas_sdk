import github_sdk/schema
import github_sdk/utils
import gleam/bool
import gleam/dynamic/decode
import gleam/float
import gleam/http
import gleam/http/response
import gleam/int
import gleam/json
import gleam/option.{type Option, None}
import gleam/result

pub fn repos_list_for_org_request(
  base,
  org,
  type_ type_,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/repos"
  let query = [
    #("type_", type_),
    #("sort", sort),
    #("direction", direction),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_for_org_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, decode.list(schema.minimal_repository_decoder()))
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn repos_list_for_user_request(
  base,
  username,
  type_ type_,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/repos"
  let query = [
    #("type_", type_),
    #("sort", sort),
    #("direction", direction),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_for_user_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, decode.list(schema.minimal_repository_decoder()))
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}
