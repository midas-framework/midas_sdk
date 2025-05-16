import anthropic_sdk/operations
import gleam/http/request
import gleam/string
import midas/task as t
import snag

pub fn base_request(token) {
  request.new()
  |> request.set_host("api.anthropic.com")
  |> request.prepend_header("x-api-key", token)
  |> request.prepend_header("anthropic-version", "2023-06-01")
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

pub fn complete_post(token, completion_request) {
  let request = base_request(token)
  let request = operations.complete_post_request(request, completion_request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.complete_post_response(response)))
  t.Done(data)
}

pub fn message_batches_cancel(token, message_batch_id) {
  let request = base_request(token)
  let request =
    operations.message_batches_cancel_request(request, message_batch_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.message_batches_cancel_response(response)),
  )
  t.Done(data)
}

pub fn message_batches_results(token, message_batch_id) {
  let request = base_request(token)
  let request =
    operations.message_batches_results_request(request, message_batch_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.message_batches_results_response(response)),
  )
  t.Done(data)
}

pub fn beta_message_batches_cancel(token, message_batch_id) {
  let request = base_request(token)
  let request =
    operations.beta_message_batches_cancel_request(request, message_batch_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.beta_message_batches_cancel_response(response)),
  )
  t.Done(data)
}

pub fn beta_message_batches_results(token, message_batch_id) {
  let request = base_request(token)
  let request =
    operations.beta_message_batches_results_request(request, message_batch_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.beta_message_batches_results_response(response)),
  )
  t.Done(data)
}

pub fn models_get(token, model_id) {
  let request = base_request(token)
  let request = operations.models_get_request(request, model_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.models_get_response(response)))
  t.Done(data)
}

pub fn messages_post(token, create_message_params) {
  let request = base_request(token)
  let request = operations.messages_post_request(request, create_message_params)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.messages_post_response(response)))
  t.Done(data)
}

pub fn models_list(token, before_id before_id, after_id after_id, limit limit) {
  let request = base_request(token)
  let request =
    operations.models_list_request(request, before_id, after_id, limit)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.models_list_response(response)))
  t.Done(data)
}

pub fn message_batches_delete(token, message_batch_id) {
  let request = base_request(token)
  let request =
    operations.message_batches_delete_request(request, message_batch_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.message_batches_delete_response(response)),
  )
  t.Done(data)
}

pub fn message_batches_retrieve(token, message_batch_id) {
  let request = base_request(token)
  let request =
    operations.message_batches_retrieve_request(request, message_batch_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.message_batches_retrieve_response(response)),
  )
  t.Done(data)
}

pub fn beta_messages_post(token, beta_create_message_params) {
  let request = base_request(token)
  let request =
    operations.beta_messages_post_request(request, beta_create_message_params)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.beta_messages_post_response(response)),
  )
  t.Done(data)
}

pub fn beta_models_get(token, model_id) {
  let request = base_request(token)
  let request = operations.beta_models_get_request(request, model_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.beta_models_get_response(response)),
  )
  t.Done(data)
}

pub fn beta_models_list(
  token,
  before_id before_id,
  after_id after_id,
  limit limit,
) {
  let request = base_request(token)
  let request =
    operations.beta_models_list_request(request, before_id, after_id, limit)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.beta_models_list_response(response)),
  )
  t.Done(data)
}

pub fn beta_message_batches_delete(token, message_batch_id) {
  let request = base_request(token)
  let request =
    operations.beta_message_batches_delete_request(request, message_batch_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.beta_message_batches_delete_response(response)),
  )
  t.Done(data)
}

pub fn beta_message_batches_retrieve(token, message_batch_id) {
  let request = base_request(token)
  let request =
    operations.beta_message_batches_retrieve_request(request, message_batch_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.beta_message_batches_retrieve_response(response)),
  )
  t.Done(data)
}

pub fn message_batches_post(token, create_message_batch_params) {
  let request = base_request(token)
  let request =
    operations.message_batches_post_request(
      request,
      create_message_batch_params,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.message_batches_post_response(response)),
  )
  t.Done(data)
}

pub fn message_batches_list(
  token,
  before_id before_id,
  after_id after_id,
  limit limit,
) {
  let request = base_request(token)
  let request =
    operations.message_batches_list_request(request, before_id, after_id, limit)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.message_batches_list_response(response)),
  )
  t.Done(data)
}

pub fn messages_count_tokens_post(token, count_message_tokens_params) {
  let request = base_request(token)
  let request =
    operations.messages_count_tokens_post_request(
      request,
      count_message_tokens_params,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.messages_count_tokens_post_response(response)),
  )
  t.Done(data)
}

pub fn beta_message_batches_post(token, beta_create_message_batch_params) {
  let request = base_request(token)
  let request =
    operations.beta_message_batches_post_request(
      request,
      beta_create_message_batch_params,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.beta_message_batches_post_response(response)),
  )
  t.Done(data)
}

pub fn beta_message_batches_list(
  token,
  before_id before_id,
  after_id after_id,
  limit limit,
) {
  let request = base_request(token)
  let request =
    operations.beta_message_batches_list_request(
      request,
      before_id,
      after_id,
      limit,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.beta_message_batches_list_response(response)),
  )
  t.Done(data)
}

pub fn beta_messages_count_tokens_post(token, beta_count_message_tokens_params) {
  let request = base_request(token)
  let request =
    operations.beta_messages_count_tokens_post_request(
      request,
      beta_count_message_tokens_params,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.beta_messages_count_tokens_post_response(response)),
  )
  t.Done(data)
}
