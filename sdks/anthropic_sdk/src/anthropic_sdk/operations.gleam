import gleam/bool
import gleam/result
import gleam/dynamic/decode
import gleam/json
import gleam/float
import gleam/int
import gleam/http/response
import gleam/http
import anthropic_sdk/schema
import anthropic_sdk/utils
import gleam/option.{type Option, None}

pub fn complete_post_request(base, completion_request) {
  let method = http.Post
  let path = "/v1/complete"
  let query = []
  let body = utils.json_to_bits(
    schema.completion_request_encode(completion_request),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn complete_post_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.completion_response_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn message_batches_cancel_request(base, message_batch_id) {
  let method = http.Post
  let path = "/v1/messages/batches/" <> message_batch_id <> "/cancel"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn message_batches_cancel_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.message_batch_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn message_batches_results_request(base, message_batch_id) {
  let method = http.Get
  let path = "/v1/messages/batches/" <> message_batch_id <> "/results"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn message_batches_results_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn beta_message_batches_cancel_request(base, message_batch_id) {
  let method = http.Post
  let path = "/v1/messages/batches/" <> message_batch_id <> "/cancel"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn beta_message_batches_cancel_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.beta_message_batch_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.beta_error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn beta_message_batches_results_request(base, message_batch_id) {
  let method = http.Get
  let path = "/v1/messages/batches/" <> message_batch_id <> "/results"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn beta_message_batches_results_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.beta_error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn models_get_request(base, model_id) {
  let method = http.Get
  let path = "/v1/models/" <> model_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn models_get_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.model_info_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn messages_post_request(base, create_message_params) {
  let method = http.Post
  let path = "/v1/messages"
  let query = []
  let body = utils.json_to_bits(
    schema.create_message_params_encode(create_message_params),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn messages_post_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.message_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn models_list_request(
  base,
  before_id before_id,
  after_id after_id,
  limit limit,
) {
  let method = http.Get
  let path = "/v1/models"
  let query = [
    #("before_id", before_id),
    #("after_id", after_id),
    #("limit", option.map(limit, int.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn models_list_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.list_response_model_info_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn message_batches_delete_request(base, message_batch_id) {
  let method = http.Delete
  let path = "/v1/messages/batches/" <> message_batch_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn message_batches_delete_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.delete_message_batch_response_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn message_batches_retrieve_request(base, message_batch_id) {
  let method = http.Get
  let path = "/v1/messages/batches/" <> message_batch_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn message_batches_retrieve_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.message_batch_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn beta_messages_post_request(base, beta_create_message_params) {
  let method = http.Post
  let path = "/v1/messages"
  let query = []
  let body = utils.json_to_bits(
    schema.beta_create_message_params_encode(beta_create_message_params),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn beta_messages_post_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.beta_message_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.beta_error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn beta_models_get_request(base, model_id) {
  let method = http.Get
  let path = "/v1/models/" <> model_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn beta_models_get_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.beta_model_info_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.beta_error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn beta_models_list_request(
  base,
  before_id before_id,
  after_id after_id,
  limit limit,
) {
  let method = http.Get
  let path = "/v1/models"
  let query = [
    #("before_id", before_id),
    #("after_id", after_id),
    #("limit", option.map(limit, int.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn beta_models_list_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.beta_list_response_model_info_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.beta_error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn beta_message_batches_delete_request(base, message_batch_id) {
  let method = http.Delete
  let path = "/v1/messages/batches/" <> message_batch_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn beta_message_batches_delete_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(
      body,
      schema.beta_delete_message_batch_response_decoder(),
    ) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.beta_error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn beta_message_batches_retrieve_request(base, message_batch_id) {
  let method = http.Get
  let path = "/v1/messages/batches/" <> message_batch_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn beta_message_batches_retrieve_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.beta_message_batch_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.beta_error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn message_batches_post_request(base, create_message_batch_params) {
  let method = http.Post
  let path = "/v1/messages/batches"
  let query = []
  let body = utils.json_to_bits(
    schema.create_message_batch_params_encode(create_message_batch_params),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn message_batches_post_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.message_batch_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn message_batches_list_request(
  base,
  before_id before_id,
  after_id after_id,
  limit limit,
) {
  let method = http.Get
  let path = "/v1/messages/batches"
  let query = [
    #("before_id", before_id),
    #("after_id", after_id),
    #("limit", option.map(limit, int.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn message_batches_list_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.list_response_message_batch_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn messages_count_tokens_post_request(base, count_message_tokens_params) {
  let method = http.Post
  let path = "/v1/messages/count_tokens"
  let query = []
  let body = utils.json_to_bits(
    schema.count_message_tokens_params_encode(count_message_tokens_params),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn messages_count_tokens_post_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.count_message_tokens_response_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn beta_message_batches_post_request(base, beta_create_message_batch_params) {
  let method = http.Post
  let path = "/v1/messages/batches"
  let query = []
  let body = utils.json_to_bits(
    schema.beta_create_message_batch_params_encode(
      beta_create_message_batch_params,
    ),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn beta_message_batches_post_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.beta_message_batch_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.beta_error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn beta_message_batches_list_request(
  base,
  before_id before_id,
  after_id after_id,
  limit limit,
) {
  let method = http.Get
  let path = "/v1/messages/batches"
  let query = [
    #("before_id", before_id),
    #("after_id", after_id),
    #("limit", option.map(limit, int.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn beta_message_batches_list_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(
      body,
      schema.beta_list_response_message_batch_decoder(),
    ) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.beta_error_response_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn beta_messages_count_tokens_post_request(
  base,
  beta_count_message_tokens_params,
) {
  let method = http.Post
  let path = "/v1/messages/count_tokens"
  let query = []
  let body = utils.json_to_bits(
    schema.beta_count_message_tokens_params_encode(
      beta_count_message_tokens_params,
    ),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn beta_messages_count_tokens_post_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(
      body,
      schema.beta_count_message_tokens_response_decoder(),
    ) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.beta_error_response_decoder()) |> result.map(
      Error,
    )
  }
}
