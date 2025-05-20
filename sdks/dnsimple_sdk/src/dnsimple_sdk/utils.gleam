import gleam/bit_array
import gleam/http/request
import gleam/json
import gleam/list
import gleam/option

pub fn set_method(request, method) {
  request.set_method(request, method)
}

pub fn append_path(request, path) {
  request.set_path(request, request.path <> path)
}

pub fn set_query(request, query) {
  let query =
    list.filter_map(query, fn(q) {
      let #(k, v) = q
      case v {
        option.Some(v) -> Ok(#(k, v))
        option.None -> Error(Nil)
      }
    })
  case query {
    [] -> request
    _ -> request.set_query(request, query)
  }
}

pub fn set_body(request, mime, content) {
  request
  |> request.prepend_header("content-type", mime)
  |> request.set_body(content)
}

pub fn json_to_bits(json) {
  json
  |> json.to_string
  |> bit_array.from_string
}
