import gleam/bit_array
import gleam/dynamic/decode
import gleam/http
import gleam/http/request
import gleam/http/response
import gleam/json
import gleam/result.{try}
import gleam/string
import midas/task as t
import snag

const api_host = "gmail.googleapis.com"

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

fn post(token, path, mime, content) {
  base_request(token)
  |> request.set_method(http.Post)
  |> request.set_path(path)
  |> request.prepend_header("content-type", mime)
  |> request.set_body(content)
}

pub fn send(token, from, to, message) {
  let request = send_request(token, from, to, message)
  use response <- t.do(t.fetch(request))
  use response <- t.try(send_response(response))
  t.Done(response)
}

pub fn send_request(token, from, to, message) {
  let path = "/gmail/v1/users/" <> from <> "/messages/send"
  let mime = "application/json; charset=UTF-8"
  let email =
    "From: "
    <> from
    <> "\r\nTo: "
    <> to
    <> "\r\nContent-Type: text/html; charset=utf-8 "
    <> "\r\n"
    <> message
  let raw = bit_array.base64_encode(<<email:utf8>>, True)
  let body = json.object([#("raw", json.string(raw))]) |> json.to_string
  post(token, path, mime, <<body:utf8>>)
  |> request.set_query([#("alt", "json")])
}

pub fn send_response(response) {
  let response.Response(body:, ..) = response

  use message <- try(
    json.parse_bits(body, message_decoder())
    |> result.map_error(fn(reason) {
      snag.new(string.inspect(reason))
      |> snag.layer("failed to decode message")
    }),
  )
  Ok(message)
}

pub type Message {
  Message(id: String, thread_id: String)
}

fn message_decoder() {
  use id <- decode.field("id", decode.string)
  use thread_id <- decode.field("threadId", decode.string)
  decode.success(Message(id, thread_id))
}

pub fn list_messages(token, user_id) {
  let request = list_messages_request(token, user_id)
  use response <- t.do(t.fetch(request))
  use response <- t.try(list_messages_response(response))
  t.Done(response)
}

pub fn list_messages_request(token, user_id) {
  let path = "/gmail/v1/users/" <> user_id <> "/messages"
  get(token, path)
}

pub fn list_messages_response(response: response.Response(BitArray)) {
  let decoder = {
    use messages <- decode.field("messages", decode.list(message_decoder()))
    decode.success(messages)
  }
  use message <- try(
    json.parse_bits(response.body, decoder)
    |> result.map_error(fn(reason) {
      snag.new(string.inspect(reason))
      |> snag.layer("failed to decode messages")
    }),
  )
  Ok(message)
}
