import gleam/bit_array
import gleam/dynamic
import gleam/http/request
import gleam/http/response
import gleam/json
import gleam/result.{try}
import gleam/string
import midas/task as t
import snag

const api_host = "dataservice.accuweather.com"

fn get(api_key, path, params) {
  request.new()
  |> request.set_host(api_host)
  |> request.set_path(path)
  |> request.set_query([#("apikey", api_key), ..params])
  |> request.set_body(<<>>)
}

pub fn five_day_forecast(api_key, location) {
  let request = five_day_forecast_request(api_key, location)
  use response <- t.do(t.fetch(request))
  use response <- t.try(five_day_forecast_response(response))
  t.Done(response)
}

pub fn five_day_forecast_request(api_key, location) {
  let path = "/forecasts/v1/daily/5day/" <> location
  get(api_key, path, [#("metric", "true"), #("details", "true")])
}

pub fn five_day_forecast_response(response: response.Response(BitArray)) {
  use json <- try(
    bit_array.to_string(response.body)
    |> result.replace_error(snag.new("not utf8 encoded")),
  )
  let decoder =
    dynamic.field("DailyForecasts", dynamic.list(daily_forcast_decoder))
  use message <- try(
    json.decode_bits(response.body, decoder)
    |> result.map_error(fn(reason) {
      snag.new(string.inspect(reason))
      |> snag.layer("failed to decode message")
    }),
  )
  Ok(message)
}

pub type DailyForecast {
  DailyForecast(
    date: String,
    sunrise: String,
    sunset: String,
    minimum_temperature: Float,
    maximum_temperature: Float,
    day: Detail,
    night: Detail,
  )
}

pub fn daily_forcast_decoder(raw) {
  dynamic.decode7(
    DailyForecast,
    dynamic.field("Date", dynamic.string),
    dynamic.field("Sun", dynamic.field("Rise", dynamic.string)),
    dynamic.field("Sun", dynamic.field("Set", dynamic.string)),
    dynamic.field(
      "Temperature",
      dynamic.field("Minimum", dynamic.field("Value", dynamic.float)),
    ),
    dynamic.field(
      "Temperature",
      dynamic.field("Maximum", dynamic.field("Value", dynamic.float)),
    ),
    dynamic.field("Day", detail_decoder),
    dynamic.field("Night", detail_decoder),
  )(raw)
}

pub type Detail {
  Detail(
    precipitation_probability: Int,
    wind_speed: Float,
    wind_direction: String,
  )
}

fn detail_decoder(raw) {
  dynamic.decode3(
    Detail,
    dynamic.field("PrecipitationProbability", dynamic.int),
    dynamic.field(
      "Wind",
      dynamic.field("Speed", dynamic.field("Value", dynamic.float)),
    ),
    dynamic.field(
      "Wind",
      dynamic.field("Direction", dynamic.field("English", dynamic.string)),
    ),
  )(raw)
}
