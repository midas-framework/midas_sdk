import email_octopus/operations
import gleam/http/request
import gleam/string
import midas/task as t
import snag

pub const api_host = "api.emailoctopus.com"

pub fn base_request(token) {
  request.new()
  |> request.set_host(api_host)
  |> request.prepend_header("Authorization", string.append("Bearer ", token))
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

pub fn api_campaigns_campaign_idreportssummary_get(token, campaign_id) {
  let request = base_request(token)
  let request =
    operations.api_campaigns_campaign_idreportssummary_get_request(
      request,
      campaign_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.api_campaigns_campaign_idreportssummary_get_response(response),
    ),
  )
  t.Done(data)
}

pub fn api_lists_list_idcontactsbatch_put(token, list_id, data) {
  let request = base_request(token)
  let request =
    operations.api_lists_list_idcontactsbatch_put_request(
      request,
      list_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_lists_list_idcontactsbatch_put_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn api_lists_list_idtags_post(token, list_id, data) {
  let request = base_request(token)
  let request =
    operations.api_lists_list_idtags_post_request(request, list_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_lists_list_idtags_post_response(response)),
  )
  t.Done(data)
}

pub fn api_lists_list_idtags_get(
  token,
  list_id,
  limit limit,
  starting_after starting_after,
) {
  let request = base_request(token)
  let request =
    operations.api_lists_list_idtags_get_request(
      request,
      list_id,
      limit,
      starting_after,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_lists_list_idtags_get_response(response)),
  )
  t.Done(data)
}

pub fn api_automations_automation_idqueue_post(token, automation_id, data) {
  let request = base_request(token)
  let request =
    operations.api_automations_automation_idqueue_post_request(
      request,
      automation_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_automations_automation_idqueue_post_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn api_lists_list_idfields_post(token, list_id, data) {
  let request = base_request(token)
  let request =
    operations.api_lists_list_idfields_post_request(request, list_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_lists_list_idfields_post_response(response)),
  )
  t.Done(data)
}

pub fn api_campaigns_get(token, limit limit, starting_after starting_after) {
  let request = base_request(token)
  let request =
    operations.api_campaigns_get_request(request, limit, starting_after)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_campaigns_get_response(response)),
  )
  t.Done(data)
}

pub fn api_lists_list_id_delete(token, list_id) {
  let request = base_request(token)
  let request = operations.api_lists_list_id_delete_request(request, list_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_lists_list_id_delete_response(response)),
  )
  t.Done(data)
}

pub fn api_lists_list_id_put(token, list_id, data) {
  let request = base_request(token)
  let request = operations.api_lists_list_id_put_request(request, list_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_lists_list_id_put_response(response)),
  )
  t.Done(data)
}

pub fn api_lists_list_id_get(token, list_id) {
  let request = base_request(token)
  let request = operations.api_lists_list_id_get_request(request, list_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_lists_list_id_get_response(response)),
  )
  t.Done(data)
}

pub fn api_campaigns_campaign_id_get(token, campaign_id) {
  let request = base_request(token)
  let request =
    operations.api_campaigns_campaign_id_get_request(request, campaign_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_campaigns_campaign_id_get_response(response)),
  )
  t.Done(data)
}

pub fn api_lists_list_idcontacts_post(token, list_id, data) {
  let request = base_request(token)
  let request =
    operations.api_lists_list_idcontacts_post_request(request, list_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_lists_list_idcontacts_post_response(response)),
  )
  t.Done(data)
}

pub fn api_lists_list_idcontacts_put(token, list_id, data) {
  let request = base_request(token)
  let request =
    operations.api_lists_list_idcontacts_put_request(request, list_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_lists_list_idcontacts_put_response(response)),
  )
  t.Done(data)
}

pub fn api_lists_list_idcontacts_get(
  token,
  list_id,
  limit limit,
  starting_after starting_after,
  tag tag,
  status status,
  created_at_lte created_at_lte,
  created_at_gte created_at_gte,
  last_updated_at_lte last_updated_at_lte,
  last_updated_at_gte last_updated_at_gte,
) {
  let request = base_request(token)
  let request =
    operations.api_lists_list_idcontacts_get_request(
      request,
      list_id,
      limit,
      starting_after,
      tag,
      status,
      created_at_lte,
      created_at_gte,
      last_updated_at_lte,
      last_updated_at_gte,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_lists_list_idcontacts_get_response(response)),
  )
  t.Done(data)
}

pub fn api_campaigns_campaign_idreportslinks_get(token, campaign_id) {
  let request = base_request(token)
  let request =
    operations.api_campaigns_campaign_idreportslinks_get_request(
      request,
      campaign_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_campaigns_campaign_idreportslinks_get_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn api_lists_list_idcontacts_contact_id_delete(token, list_id, contact_id) {
  let request = base_request(token)
  let request =
    operations.api_lists_list_idcontacts_contact_id_delete_request(
      request,
      list_id,
      contact_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.api_lists_list_idcontacts_contact_id_delete_response(response),
    ),
  )
  t.Done(data)
}

pub fn api_lists_list_idcontacts_contact_id_put(
  token,
  list_id,
  contact_id,
  data,
) {
  let request = base_request(token)
  let request =
    operations.api_lists_list_idcontacts_contact_id_put_request(
      request,
      list_id,
      contact_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_lists_list_idcontacts_contact_id_put_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn api_lists_list_idcontacts_contact_id_get(token, list_id, contact_id) {
  let request = base_request(token)
  let request =
    operations.api_lists_list_idcontacts_contact_id_get_request(
      request,
      list_id,
      contact_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_lists_list_idcontacts_contact_id_get_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn api_lists_post(token, data) {
  let request = base_request(token)
  let request = operations.api_lists_post_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.api_lists_post_response(response)))
  t.Done(data)
}

pub fn api_lists_get(token, limit limit, starting_after starting_after) {
  let request = base_request(token)
  let request = operations.api_lists_get_request(request, limit, starting_after)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.api_lists_get_response(response)))
  t.Done(data)
}

pub fn api_lists_list_idtags_tag_delete(token, list_id, tag) {
  let request = base_request(token)
  let request =
    operations.api_lists_list_idtags_tag_delete_request(request, list_id, tag)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_lists_list_idtags_tag_delete_response(response)),
  )
  t.Done(data)
}

pub fn api_lists_list_idtags_tag_put(token, list_id, tag, data) {
  let request = base_request(token)
  let request =
    operations.api_lists_list_idtags_tag_put_request(
      request,
      list_id,
      tag,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_lists_list_idtags_tag_put_response(response)),
  )
  t.Done(data)
}

pub fn api_lists_list_idfields_tag_delete(token, list_id, tag) {
  let request = base_request(token)
  let request =
    operations.api_lists_list_idfields_tag_delete_request(request, list_id, tag)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_lists_list_idfields_tag_delete_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn api_lists_list_idfields_tag_put(token, list_id, tag, data) {
  let request = base_request(token)
  let request =
    operations.api_lists_list_idfields_tag_put_request(
      request,
      list_id,
      tag,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_lists_list_idfields_tag_put_response(response)),
  )
  t.Done(data)
}

pub fn api_campaigns_campaign_idreports_get(
  token,
  campaign_id,
  limit limit,
  starting_after starting_after,
  status status,
) {
  let request = base_request(token)
  let request =
    operations.api_campaigns_campaign_idreports_get_request(
      request,
      campaign_id,
      limit,
      starting_after,
      status,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_campaigns_campaign_idreports_get_response(
      response,
    )),
  )
  t.Done(data)
}
