import gleam/http
import gleam/http/response
import gleam/int
import gleam/json
import gleam/option
import gleam/result
import ldbws/schema
import ldbws/utils

pub fn n20220120_get_departure_board_request(
  base,
  crs,
  num_rows num_rows,
  filter_crs filter_crs,
  filter_type filter_type,
  time_offset time_offset,
  time_window time_window,
) {
  let method = http.Get
  let path = "/api/20220120/GetDepartureBoard/" <> crs
  let query = [
    #("num_rows", option.map(num_rows, int.to_string)),
    #("filter_crs", filter_crs),
    #("filter_type", filter_type),
    #("time_offset", option.map(time_offset, int.to_string)),
    #("time_window", option.map(time_window, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn n20220120_get_departure_board_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.station_board_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn n20220120_get_next_departures_request(
  base,
  crs,
  filter_list,
  time_offset time_offset,
  time_window time_window,
) {
  let method = http.Get
  let path = "/api/20220120/GetNextDepartures/" <> crs <> "/" <> filter_list
  let query = [
    #("time_offset", option.map(time_offset, int.to_string)),
    #("time_window", option.map(time_window, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn n20220120_get_next_departures_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.departures_board_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn n20220120_get_fastest_departures_with_details_request(
  base,
  crs,
  filter_list,
  time_offset time_offset,
  time_window time_window,
) {
  let method = http.Get
  let path =
    "/api/20220120/GetFastestDeparturesWithDetails/"
    <> crs
    <> "/"
    <> filter_list
  let query = [
    #("time_offset", option.map(time_offset, int.to_string)),
    #("time_window", option.map(time_window, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn n20220120_get_fastest_departures_with_details_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.departures_board_with_details_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn n20220120_get_arrival_board_request(
  base,
  crs,
  num_rows num_rows,
  filter_crs filter_crs,
  filter_type filter_type,
  time_offset time_offset,
  time_window time_window,
) {
  let method = http.Get
  let path = "/api/20220120/GetArrivalBoard/" <> crs
  let query = [
    #("num_rows", option.map(num_rows, int.to_string)),
    #("filter_crs", filter_crs),
    #("filter_type", filter_type),
    #("time_offset", option.map(time_offset, int.to_string)),
    #("time_window", option.map(time_window, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn n20220120_get_arrival_board_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.station_board_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn n20220120_get_fastest_departures_request(
  base,
  crs,
  filter_list,
  time_offset time_offset,
  time_window time_window,
) {
  let method = http.Get
  let path = "/api/20220120/GetFastestDepartures/" <> crs <> "/" <> filter_list
  let query = [
    #("time_offset", option.map(time_offset, int.to_string)),
    #("time_window", option.map(time_window, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn n20220120_get_fastest_departures_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.departures_board_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn n20220120_get_arr_board_with_details_request(
  base,
  crs,
  num_rows num_rows,
  filter_crs filter_crs,
  filter_type filter_type,
  time_offset time_offset,
  time_window time_window,
) {
  let method = http.Get
  let path = "/api/20220120/GetArrBoardWithDetails/" <> crs
  let query = [
    #("num_rows", option.map(num_rows, int.to_string)),
    #("filter_crs", filter_crs),
    #("filter_type", filter_type),
    #("time_offset", option.map(time_offset, int.to_string)),
    #("time_window", option.map(time_window, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn n20220120_get_arr_board_with_details_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.station_board_with_details_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn n20220120_get_next_departures_with_details_request(
  base,
  crs,
  filter_list,
  time_offset time_offset,
  time_window time_window,
) {
  let method = http.Get
  let path =
    "/api/20220120/GetNextDeparturesWithDetails/" <> crs <> "/" <> filter_list
  let query = [
    #("time_offset", option.map(time_offset, int.to_string)),
    #("time_window", option.map(time_window, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn n20220120_get_next_departures_with_details_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.departures_board_with_details_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn n20220120_get_arr_dep_board_with_details_request(
  base,
  crs,
  num_rows num_rows,
  filter_crs filter_crs,
  filter_type filter_type,
  time_offset time_offset,
  time_window time_window,
) {
  let method = http.Get
  let path = "/api/20220120/GetArrDepBoardWithDetails/" <> crs
  let query = [
    #("num_rows", option.map(num_rows, int.to_string)),
    #("filter_crs", filter_crs),
    #("filter_type", filter_type),
    #("time_offset", option.map(time_offset, int.to_string)),
    #("time_window", option.map(time_window, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn n20220120_get_arr_dep_board_with_details_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.station_board_with_details_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn n20220120_get_service_details_request(base, service_id) {
  let method = http.Get
  let path = "/api/20220120/GetServiceDetails/" <> service_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn n20220120_get_service_details_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.service_details_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn n20220120_get_arrival_departure_board_request(
  base,
  crs,
  num_rows num_rows,
  filter_crs filter_crs,
  filter_type filter_type,
  time_offset time_offset,
  time_window time_window,
) {
  let method = http.Get
  let path = "/api/20220120/GetArrivalDepartureBoard/" <> crs
  let query = [
    #("num_rows", option.map(num_rows, int.to_string)),
    #("filter_crs", filter_crs),
    #("filter_type", filter_type),
    #("time_offset", option.map(time_offset, int.to_string)),
    #("time_window", option.map(time_window, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn n20220120_get_arrival_departure_board_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.station_board_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn n20220120_get_dep_board_with_details_request(
  base,
  crs,
  num_rows num_rows,
  filter_crs filter_crs,
  filter_type filter_type,
  time_offset time_offset,
  time_window time_window,
) {
  let method = http.Get
  let path = "/api/20220120/GetDepBoardWithDetails/" <> crs
  let query = [
    #("num_rows", option.map(num_rows, int.to_string)),
    #("filter_crs", filter_crs),
    #("filter_type", filter_type),
    #("time_offset", option.map(time_offset, int.to_string)),
    #("time_window", option.map(time_window, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn n20220120_get_dep_board_with_details_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.station_board_with_details_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}
