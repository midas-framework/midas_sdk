import gleam/bit_array
import gleam/dict
import gleam/dynamic
import gleam/dynamic/decode
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

pub fn dynamic_to_json(d) {
  let assert Ok(json) = decode.run(d, decoder())
  json
}

fn decoder() {
  {
    use <- decode.recursive
    decode.one_of(
      decode.dict(decode.string, decoder())
        |> decode.map(fn(data) {
          let entries = dict.to_list(data)
          json.object(entries)
        }),
      [
        decode.string |> decode.map(json.string),
        decode.bool |> decode.map(json.bool),
        decode.int |> decode.map(json.int),
        decode.float |> decode.map(json.float),
        decode.list(decoder()) |> decode.map(json.array(_, fn(x) { x })),
        decode.new_primitive_decoder("Nil", fn(x) {
          case x == dynamic.from(json.null()) {
            True -> Ok(json.null())
            False -> panic as "unexpected json type"
          }
        }),
      ],
    )
  }
}

pub fn object(entries) {
  list.filter(entries, fn(e: #(_, _)) { e.1 != json.null() })
  |> json.object
}
