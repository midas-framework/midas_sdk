import gleam/dynamic/decode
import gleam/http/request
import gleam/http/response
import gleam/json
import gleam/option.{type Option, None, Some}
import gleam/result.{try}
import gleam/string
import midas/task as t
import snag

const api_host = "www.googleapis.com"

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

// https://developers.google.com/calendar/api/v3/reference/events/list
pub fn list_events(token, calendar_id, time_min) {
  let request = list_events_request(token, calendar_id, time_min)
  use response <- t.do(t.fetch(request))
  use response <- t.try(list_events_response(response))
  t.Done(response)
}

pub fn list_events_request(token, calendar_id, time_min) {
  let path = "/calendar/v3/calendars/" <> calendar_id <> "/events"
  get(token, path)
  |> request.set_query([
    #("timeMin", time_min),
    #("orderBy", "startTime"),
    #("singleEvents", "true"),
  ])
}

pub fn list_events_response(response: response.Response(BitArray)) {
  let decoder = {
    use items <- decode.field("items", decode.list(event_decoder()))
    decode.success(items)
  }
  use message <- try(
    json.parse_bits(response.body, decoder)
    |> result.map_error(fn(reason) {
      snag.new(string.inspect(reason))
      |> snag.layer("failed to decode message")
    }),
  )
  Ok(message)
}

pub type Event {
  Event(
    summary: String,
    location: Option(String),
    start: DateOrDatetime,
    end: DateOrDatetime,
  )
}

pub fn event_decoder() {
  use summary <- decode.field("summary", decode.string)
  use location <- decode.optional_field(
    "location",
    None,
    decode.string |> decode.map(Some),
  )
  use start <- decode.field("start", date_or_datetime_decoder())
  use end <- decode.field("end", date_or_datetime_decoder())
  decode.success(Event(summary, location, start, end))
}

pub type DateOrDatetime {
  Date(String)
  Datetime(String)
}

pub fn date_or_datetime_decoder() {
  decode.one_of(
    {
      use date <- decode.field("date", decode.string)
      decode.success(Date(date))
    },
    [
      {
        use datetime <- decode.field("dateTime", decode.string)
        decode.success(Datetime(datetime))
      },
    ],
  )
}
