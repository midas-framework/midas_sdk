import gleam/http/request
import gleam/string
import ldbws/operations
import midas/task as t
import snag

pub fn base_request(token) {
  request.new()
  |> request.set_host(todo as "api_host")
  |> request.prepend_header("Authorization", string.append("Basic ", token))
  |> request.set_body(<<>>)
}

fn handle_errors(response) {
  case response {
    Ok(response) -> Ok(response)
    Error(reason) ->
      snag.new(string.inspect(reason))
      |> snag.layer("failed to decode")
      |> Error
  }
}

// GENERATED -------------

pub fn n20220120_get_departure_board(
  token,
  crs,
  num_rows num_rows,
  filter_crs filter_crs,
  filter_type filter_type,
  time_offset time_offset,
  time_window time_window,
) {
  let request = base_request(token)
  let request =
    operations.n20220120_get_departure_board_request(
      request,
      crs,
      num_rows,
      filter_crs,
      filter_type,
      time_offset,
      time_window,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.n20220120_get_departure_board_response(response)),
  )
  t.Done(data)
}

pub fn n20220120_get_next_departures(
  token,
  crs,
  filter_list,
  time_offset time_offset,
  time_window time_window,
) {
  let request = base_request(token)
  let request =
    operations.n20220120_get_next_departures_request(
      request,
      crs,
      filter_list,
      time_offset,
      time_window,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.n20220120_get_next_departures_response(response)),
  )
  t.Done(data)
}

pub fn n20220120_get_fastest_departures_with_details(
  token,
  crs,
  filter_list,
  time_offset time_offset,
  time_window time_window,
) {
  let request = base_request(token)
  let request =
    operations.n20220120_get_fastest_departures_with_details_request(
      request,
      crs,
      filter_list,
      time_offset,
      time_window,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.n20220120_get_fastest_departures_with_details_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn n20220120_get_arrival_board(
  token,
  crs,
  num_rows num_rows,
  filter_crs filter_crs,
  filter_type filter_type,
  time_offset time_offset,
  time_window time_window,
) {
  let request = base_request(token)
  let request =
    operations.n20220120_get_arrival_board_request(
      request,
      crs,
      num_rows,
      filter_crs,
      filter_type,
      time_offset,
      time_window,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.n20220120_get_arrival_board_response(response)),
  )
  t.Done(data)
}

pub fn n20220120_get_fastest_departures(
  token,
  crs,
  filter_list,
  time_offset time_offset,
  time_window time_window,
) {
  let request = base_request(token)
  let request =
    operations.n20220120_get_fastest_departures_request(
      request,
      crs,
      filter_list,
      time_offset,
      time_window,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.n20220120_get_fastest_departures_response(response)),
  )
  t.Done(data)
}

pub fn n20220120_get_arr_board_with_details(
  token,
  crs,
  num_rows num_rows,
  filter_crs filter_crs,
  filter_type filter_type,
  time_offset time_offset,
  time_window time_window,
) {
  let request = base_request(token)
  let request =
    operations.n20220120_get_arr_board_with_details_request(
      request,
      crs,
      num_rows,
      filter_crs,
      filter_type,
      time_offset,
      time_window,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.n20220120_get_arr_board_with_details_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn n20220120_get_next_departures_with_details(
  token,
  crs,
  filter_list,
  time_offset time_offset,
  time_window time_window,
) {
  let request = base_request(token)
  let request =
    operations.n20220120_get_next_departures_with_details_request(
      request,
      crs,
      filter_list,
      time_offset,
      time_window,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.n20220120_get_next_departures_with_details_response(response),
    ),
  )
  t.Done(data)
}

pub fn n20220120_get_arr_dep_board_with_details(
  token,
  crs,
  num_rows num_rows,
  filter_crs filter_crs,
  filter_type filter_type,
  time_offset time_offset,
  time_window time_window,
) {
  let request = base_request(token)
  let request =
    operations.n20220120_get_arr_dep_board_with_details_request(
      request,
      crs,
      num_rows,
      filter_crs,
      filter_type,
      time_offset,
      time_window,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.n20220120_get_arr_dep_board_with_details_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn n20220120_get_service_details(token, service_id) {
  let request = base_request(token)
  let request =
    operations.n20220120_get_service_details_request(request, service_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.n20220120_get_service_details_response(response)),
  )
  t.Done(data)
}

pub fn n20220120_get_arrival_departure_board(
  token,
  crs,
  num_rows num_rows,
  filter_crs filter_crs,
  filter_type filter_type,
  time_offset time_offset,
  time_window time_window,
) {
  let request = base_request(token)
  let request =
    operations.n20220120_get_arrival_departure_board_request(
      request,
      crs,
      num_rows,
      filter_crs,
      filter_type,
      time_offset,
      time_window,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.n20220120_get_arrival_departure_board_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn n20220120_get_dep_board_with_details(
  token,
  crs,
  num_rows num_rows,
  filter_crs filter_crs,
  filter_type filter_type,
  time_offset time_offset,
  time_window time_window,
) {
  let request = base_request(token)
  let request =
    operations.n20220120_get_dep_board_with_details_request(
      request,
      crs,
      num_rows,
      filter_crs,
      filter_type,
      time_offset,
      time_window,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.n20220120_get_dep_board_with_details_response(
      response,
    )),
  )
  t.Done(data)
}
