import gleam/dynamic/decode
import gleam/http/request
import gleam/http/response
import gleam/int
import gleam/json
import gleam/result.{try}
import gleam/string
import midas/task as t
import snag

pub const eyvind_johnsons_gata = "1254"

pub const moa_martinsons_torg = "1251"

// https://journeyplanner.integration.sl.se/v1/typeahead.json?key=4fd47adc31654bdd9e3ad9f0acae4246&searchstring=eyvind
// https://api.sl.se/api2/realtimedeparturesV4.json?key=b8aa9e4c5e9741ca87f4371c93d0c4f6&siteid=1251&timewindow=120
pub fn departures(api_key, site_id, time_window) {
  let request = departures_request(api_key, site_id, time_window)
  use response <- t.do(t.fetch(request))
  use response <- t.try(departures_response(response))
  t.Done(response)
}

pub fn departures_request(api_key, site_id, time_window) {
  request.new()
  |> request.set_host("api.sl.se")
  |> request.set_path("/api2/realtimedeparturesV4.json")
  |> request.set_query([
    #("key", api_key),
    #("siteid", site_id),
    #("timewindow", int.to_string(time_window)),
  ])
  |> request.set_body(<<>>)
}

pub fn departures_response(response: response.Response(BitArray)) {
  let decoder = {
    use departures <- decode.field("ResponseData", {
      use buses <- decode.field("Buses", decode.list(bus_departure_decoder()))
      decode.success(buses)
    })
    decode.success(departures)
  }

  use departures <- try(
    json.parse_bits(response.body, decoder)
    |> result.map_error(fn(reason) {
      snag.new(string.inspect(reason))
      |> snag.layer("failed to decode sites")
    }),
  )
  Ok(departures)
}

pub type BusDeparture {
  BusDeparture(
    journey_direction: Int,
    destination: String,
    timetabled: String,
    expected: String,
    display: String,
  )
}

pub fn bus_departure_decoder() {
  use journey_direction <- decode.field("JourneyDirection", decode.int)
  use destination <- decode.field("Destination", decode.string)
  use timetabled <- decode.field("TimeTabledDateTime", decode.string)
  use expected <- decode.field("ExpectedDateTime", decode.string)
  use display <- decode.field("DisplayTime", decode.string)
  decode.success(BusDeparture(
    journey_direction,
    destination,
    timetabled,
    expected,
    display,
  ))
}
