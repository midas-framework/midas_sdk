import gleam/dynamic/decode
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
  let decoder = {
    use daily_forecasts <- decode.field(
      "DailyForecasts",
      decode.list(daily_forcast_decoder()),
    )
    decode.success(daily_forecasts)
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

pub fn daily_forcast_decoder() {
  use date <- decode.field("Date", decode.string)
  use sunrise <- decode.field("Sun", {
    use sunrise <- decode.field("Rise", decode.string)
    decode.success(sunrise)
  })
  use sunset <- decode.field("Sun", {
    use sunrise <- decode.field("Set", decode.string)
    decode.success(sunrise)
  })
  use minimum_temperature <- decode.field("Temperature", {
    use minimum_temperature <- decode.field("Minimum", {
      use minimum_temperature <- decode.field("Value", decode.float)
      decode.success(minimum_temperature)
    })
    decode.success(minimum_temperature)
  })
  use maximum_temperature <- decode.field("Temperature", {
    use minimum_temperature <- decode.field("Maximum", {
      use minimum_temperature <- decode.field("Value", decode.float)
      decode.success(minimum_temperature)
    })
    decode.success(minimum_temperature)
  })
  use day <- decode.field("Day", detail_decoder())
  use night <- decode.field("Night", detail_decoder())
  decode.success(DailyForecast(
    date,
    sunrise,
    sunset,
    minimum_temperature,
    maximum_temperature,
    day,
    night,
  ))
}

pub type Detail {
  Detail(
    precipitation_probability: Int,
    wind_speed: Float,
    wind_direction: String,
  )
}

fn detail_decoder() {
  use precipitation_probability <- decode.field(
    "PrecipitationProbability",
    decode.int,
  )
  use wind_speed <- decode.field("Wind", {
    use wind_speed <- decode.field("Speed", {
      use wind_speed <- decode.field("Value", decode.float)
      decode.success(wind_speed)
    })
    decode.success(wind_speed)
  })
  use wind_direction <- decode.field("Wind", {
    use wind_direction <- decode.field("Direction", {
      use wind_direction <- decode.field("English", decode.string)
      decode.success(wind_direction)
    })
    decode.success(wind_direction)
  })
  decode.success(Detail(precipitation_probability, wind_speed, wind_direction))
}
