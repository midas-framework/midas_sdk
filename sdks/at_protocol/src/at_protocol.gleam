import at_protocol/operations
import gleam/http/request
import gleam/string
import midas/task as t
import snag

pub fn base_request(host) {
  request.new()
  |> request.set_host(host)
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

pub fn com_atproto_server_create_account(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_create_account_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_create_account_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn chat_bsky_convo_get_convo_availability(token, members members) {
  let request = base_request(token)
  let request =
    operations.chat_bsky_convo_get_convo_availability_request(request, members)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_convo_get_convo_availability_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_admin_get_invite_codes(
  token,
  sort sort,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.com_atproto_admin_get_invite_codes_request(
      request,
      sort,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_admin_get_invite_codes_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_repo_apply_writes(token, data) {
  let request = base_request(token)
  let request = operations.com_atproto_repo_apply_writes_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_repo_apply_writes_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_feed_get_post_thread(
  token,
  uri uri,
  depth depth,
  parent_height parent_height,
) {
  let request = base_request(token)
  let request =
    operations.app_bsky_feed_get_post_thread_request(
      request,
      uri,
      depth,
      parent_height,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_feed_get_post_thread_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_moderation_create_report(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_moderation_create_report_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_moderation_create_report_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_repo_delete_record(token, data) {
  let request = base_request(token)
  let request = operations.com_atproto_repo_delete_record_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_repo_delete_record_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_feed_get_posts(token, uris uris) {
  let request = base_request(token)
  let request = operations.app_bsky_feed_get_posts_request(request, uris)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_feed_get_posts_response(response)),
  )
  t.Done(data)
}

pub fn chat_bsky_convo_update_read(token, data) {
  let request = base_request(token)
  let request = operations.chat_bsky_convo_update_read_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_convo_update_read_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_sync_list_blobs(
  token,
  did did,
  since since,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.com_atproto_sync_list_blobs_request(
      request,
      did,
      since,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_sync_list_blobs_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_notification_get_unread_count(
  token,
  priority priority,
  seen_at seen_at,
) {
  let request = base_request(token)
  let request =
    operations.app_bsky_notification_get_unread_count_request(
      request,
      priority,
      seen_at,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_notification_get_unread_count_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_sync_list_repos_by_collection(
  token,
  collection collection,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.com_atproto_sync_list_repos_by_collection_request(
      request,
      collection,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_sync_list_repos_by_collection_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_feed_get_author_feed(
  token,
  actor actor,
  limit limit,
  cursor cursor,
  filter filter,
  include_pins include_pins,
) {
  let request = base_request(token)
  let request =
    operations.app_bsky_feed_get_author_feed_request(
      request,
      actor,
      limit,
      cursor,
      filter,
      include_pins,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_feed_get_author_feed_response(response)),
  )
  t.Done(data)
}

pub fn tools_ozone_set_add_values(token, data) {
  let request = base_request(token)
  let request = operations.tools_ozone_set_add_values_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_set_add_values_response(response)),
  )
  t.Done(data)
}

pub fn chat_bsky_actor_export_account_data(token) {
  let request = base_request(token)
  let request = operations.chat_bsky_actor_export_account_data_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_actor_export_account_data_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_feed_get_reposted_by(
  token,
  uri uri,
  cid cid,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.app_bsky_feed_get_reposted_by_request(
      request,
      uri,
      cid,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_feed_get_reposted_by_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_admin_update_subject_status(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_admin_update_subject_status_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_admin_update_subject_status_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn tools_ozone_team_delete_member(token, data) {
  let request = base_request(token)
  let request = operations.tools_ozone_team_delete_member_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_team_delete_member_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_notification_put_preferences(token, data) {
  let request = base_request(token)
  let request =
    operations.app_bsky_notification_put_preferences_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_notification_put_preferences_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn tools_ozone_signature_search_accounts(
  token,
  values values,
  cursor cursor,
  limit limit,
) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_signature_search_accounts_request(
      request,
      values,
      cursor,
      limit,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_signature_search_accounts_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn chat_bsky_actor_delete_account(token) {
  let request = base_request(token)
  let request = operations.chat_bsky_actor_delete_account_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_actor_delete_account_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_identity_resolve_handle(token, handle handle) {
  let request = base_request(token)
  let request =
    operations.com_atproto_identity_resolve_handle_request(request, handle)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_identity_resolve_handle_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_admin_get_account_info(token, did did) {
  let request = base_request(token)
  let request =
    operations.com_atproto_admin_get_account_info_request(request, did)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_admin_get_account_info_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_repo_put_record(token, data) {
  let request = base_request(token)
  let request = operations.com_atproto_repo_put_record_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_repo_put_record_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_feed_get_actor_likes(
  token,
  actor actor,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.app_bsky_feed_get_actor_likes_request(
      request,
      actor,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_feed_get_actor_likes_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_admin_send_email(token, data) {
  let request = base_request(token)
  let request = operations.com_atproto_admin_send_email_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_admin_send_email_response(response)),
  )
  t.Done(data)
}

pub fn tools_ozone_team_update_member(token, data) {
  let request = base_request(token)
  let request = operations.tools_ozone_team_update_member_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_team_update_member_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_server_request_account_delete(token) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_request_account_delete_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_request_account_delete_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn tools_ozone_moderation_get_records(token, uris uris) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_moderation_get_records_request(request, uris)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_moderation_get_records_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_graph_get_follows(
  token,
  actor actor,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.app_bsky_graph_get_follows_request(request, actor, limit, cursor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_get_follows_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_actor_get_profile(token, actor actor) {
  let request = base_request(token)
  let request = operations.app_bsky_actor_get_profile_request(request, actor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_actor_get_profile_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_video_get_job_status(token, job_id job_id) {
  let request = base_request(token)
  let request =
    operations.app_bsky_video_get_job_status_request(request, job_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_video_get_job_status_response(response)),
  )
  t.Done(data)
}

pub fn tools_ozone_setting_upsert_option(token, data) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_setting_upsert_option_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_setting_upsert_option_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn tools_ozone_moderation_get_repos(token, dids dids) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_moderation_get_repos_request(request, dids)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_moderation_get_repos_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_sync_get_latest_commit(token, did did) {
  let request = base_request(token)
  let request =
    operations.com_atproto_sync_get_latest_commit_request(request, did)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_sync_get_latest_commit_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn chat_bsky_convo_send_message_batch(token, data) {
  let request = base_request(token)
  let request =
    operations.chat_bsky_convo_send_message_batch_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_convo_send_message_batch_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn tools_ozone_signature_find_correlation(token, dids dids) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_signature_find_correlation_request(request, dids)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_signature_find_correlation_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_repo_import_repo(token) {
  let request = base_request(token)
  let request = operations.com_atproto_repo_import_repo_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_repo_import_repo_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_server_delete_session(token) {
  let request = base_request(token)
  let request = operations.com_atproto_server_delete_session_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_delete_session_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_actor_search_actors_typeahead(token, q q, limit limit) {
  let request = base_request(token)
  let request =
    operations.app_bsky_actor_search_actors_typeahead_request(request, q, limit)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_actor_search_actors_typeahead_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_graph_get_known_followers(
  token,
  actor actor,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.app_bsky_graph_get_known_followers_request(
      request,
      actor,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_get_known_followers_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn tools_ozone_moderation_query_statuses(
  token,
  queue_count queue_count,
  queue_index queue_index,
  queue_seed queue_seed,
  include_all_user_records include_all_user_records,
  subject subject,
  comment comment,
  reported_after reported_after,
  reported_before reported_before,
  reviewed_after reviewed_after,
  hosting_deleted_after hosting_deleted_after,
  hosting_deleted_before hosting_deleted_before,
  hosting_updated_after hosting_updated_after,
  hosting_updated_before hosting_updated_before,
  hosting_statuses hosting_statuses,
  reviewed_before reviewed_before,
  include_muted include_muted,
  only_muted only_muted,
  review_state review_state,
  ignore_subjects ignore_subjects,
  last_reviewed_by last_reviewed_by,
  sort_field sort_field,
  sort_direction sort_direction,
  takendown takendown,
  appealed appealed,
  limit limit,
  tags tags,
  exclude_tags exclude_tags,
  cursor cursor,
  collections collections,
  subject_type subject_type,
  min_account_suspend_count min_account_suspend_count,
  min_reported_records_count min_reported_records_count,
  min_takendown_records_count min_takendown_records_count,
  min_priority_score min_priority_score,
) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_moderation_query_statuses_request(
      request,
      queue_count,
      queue_index,
      queue_seed,
      include_all_user_records,
      subject,
      comment,
      reported_after,
      reported_before,
      reviewed_after,
      hosting_deleted_after,
      hosting_deleted_before,
      hosting_updated_after,
      hosting_updated_before,
      hosting_statuses,
      reviewed_before,
      include_muted,
      only_muted,
      review_state,
      ignore_subjects,
      last_reviewed_by,
      sort_field,
      sort_direction,
      takendown,
      appealed,
      limit,
      tags,
      exclude_tags,
      cursor,
      collections,
      subject_type,
      min_account_suspend_count,
      min_reported_records_count,
      min_takendown_records_count,
      min_priority_score,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_moderation_query_statuses_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn tools_ozone_moderation_get_repo(token, did did) {
  let request = base_request(token)
  let request = operations.tools_ozone_moderation_get_repo_request(request, did)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_moderation_get_repo_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_server_get_service_auth(token, aud aud, exp exp, lxm lxm) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_get_service_auth_request(
      request,
      aud,
      exp,
      lxm,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_get_service_auth_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_sync_get_blob(token, did did, cid cid) {
  let request = base_request(token)
  let request = operations.com_atproto_sync_get_blob_request(request, did, cid)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_sync_get_blob_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_graph_get_actor_starter_packs(
  token,
  actor actor,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.app_bsky_graph_get_actor_starter_packs_request(
      request,
      actor,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_get_actor_starter_packs_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_identity_get_recommended_did_credentials(token) {
  let request = base_request(token)
  let request =
    operations.com_atproto_identity_get_recommended_did_credentials_request(
      request,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.com_atproto_identity_get_recommended_did_credentials_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn tools_ozone_moderation_emit_event(token, data) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_moderation_emit_event_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_moderation_emit_event_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_admin_enable_account_invites(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_admin_enable_account_invites_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_admin_enable_account_invites_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn tools_ozone_verification_revoke_verifications(token, data) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_verification_revoke_verifications_request(
      request,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.tools_ozone_verification_revoke_verifications_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn chat_bsky_convo_delete_message_for_self(token, data) {
  let request = base_request(token)
  let request =
    operations.chat_bsky_convo_delete_message_for_self_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_convo_delete_message_for_self_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_graph_get_suggested_follows_by_actor(token, actor actor) {
  let request = base_request(token)
  let request =
    operations.app_bsky_graph_get_suggested_follows_by_actor_request(
      request,
      actor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.app_bsky_graph_get_suggested_follows_by_actor_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn com_atproto_server_reset_password(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_reset_password_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_reset_password_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_notification_update_seen(token, data) {
  let request = base_request(token)
  let request =
    operations.app_bsky_notification_update_seen_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_notification_update_seen_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_actor_get_profiles(token, actors actors) {
  let request = base_request(token)
  let request = operations.app_bsky_actor_get_profiles_request(request, actors)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_actor_get_profiles_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_video_upload_video(token) {
  let request = base_request(token)
  let request = operations.app_bsky_video_upload_video_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_video_upload_video_response(response)),
  )
  t.Done(data)
}

pub fn tools_ozone_moderation_get_record(token, uri uri, cid cid) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_moderation_get_record_request(request, uri, cid)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_moderation_get_record_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_labeler_get_services(token, dids dids, detailed detailed) {
  let request = base_request(token)
  let request =
    operations.app_bsky_labeler_get_services_request(request, dids, detailed)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_labeler_get_services_response(response)),
  )
  t.Done(data)
}

pub fn tools_ozone_moderation_get_reporter_stats(token, dids dids) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_moderation_get_reporter_stats_request(request, dids)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_moderation_get_reporter_stats_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_server_request_password_reset(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_request_password_reset_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_request_password_reset_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_admin_get_account_infos(token, dids dids) {
  let request = base_request(token)
  let request =
    operations.com_atproto_admin_get_account_infos_request(request, dids)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_admin_get_account_infos_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_notification_list_notifications(
  token,
  reasons reasons,
  limit limit,
  priority priority,
  cursor cursor,
  seen_at seen_at,
) {
  let request = base_request(token)
  let request =
    operations.app_bsky_notification_list_notifications_request(
      request,
      reasons,
      limit,
      priority,
      cursor,
      seen_at,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_notification_list_notifications_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn tools_ozone_communication_delete_template(token, data) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_communication_delete_template_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_communication_delete_template_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn tools_ozone_verification_grant_verifications(token, data) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_verification_grant_verifications_request(
      request,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.tools_ozone_verification_grant_verifications_response(response),
    ),
  )
  t.Done(data)
}

pub fn app_bsky_feed_get_timeline(
  token,
  algorithm algorithm,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.app_bsky_feed_get_timeline_request(
      request,
      algorithm,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_feed_get_timeline_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_sync_get_host_status(token, hostname hostname) {
  let request = base_request(token)
  let request =
    operations.com_atproto_sync_get_host_status_request(request, hostname)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_sync_get_host_status_response(response)),
  )
  t.Done(data)
}

pub fn chat_bsky_convo_list_convos(
  token,
  limit limit,
  cursor cursor,
  read_state read_state,
  status status,
) {
  let request = base_request(token)
  let request =
    operations.chat_bsky_convo_list_convos_request(
      request,
      limit,
      cursor,
      read_state,
      status,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_convo_list_convos_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_graph_get_list_mutes(token, limit limit, cursor cursor) {
  let request = base_request(token)
  let request =
    operations.app_bsky_graph_get_list_mutes_request(request, limit, cursor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_get_list_mutes_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_feed_get_actor_feeds(
  token,
  actor actor,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.app_bsky_feed_get_actor_feeds_request(
      request,
      actor,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_feed_get_actor_feeds_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_identity_sign_plc_operation(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_identity_sign_plc_operation_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_identity_sign_plc_operation_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn chat_bsky_moderation_update_actor_access(token, data) {
  let request = base_request(token)
  let request =
    operations.chat_bsky_moderation_update_actor_access_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_moderation_update_actor_access_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_server_get_account_invite_codes(
  token,
  include_used include_used,
  create_available create_available,
) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_get_account_invite_codes_request(
      request,
      include_used,
      create_available,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.com_atproto_server_get_account_invite_codes_response(response),
    ),
  )
  t.Done(data)
}

pub fn app_bsky_graph_unmute_actor(token, data) {
  let request = base_request(token)
  let request = operations.app_bsky_graph_unmute_actor_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_unmute_actor_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_admin_update_account_handle(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_admin_update_account_handle_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_admin_update_account_handle_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn chat_bsky_convo_get_convo_for_members(token, members members) {
  let request = base_request(token)
  let request =
    operations.chat_bsky_convo_get_convo_for_members_request(request, members)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_convo_get_convo_for_members_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_graph_get_relationships(token, actor actor, others others) {
  let request = base_request(token)
  let request =
    operations.app_bsky_graph_get_relationships_request(request, actor, others)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_get_relationships_response(response)),
  )
  t.Done(data)
}

pub fn chat_bsky_convo_accept_convo(token, data) {
  let request = base_request(token)
  let request = operations.chat_bsky_convo_accept_convo_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_convo_accept_convo_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_server_request_email_confirmation(token) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_request_email_confirmation_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.com_atproto_server_request_email_confirmation_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn com_atproto_label_query_labels(
  token,
  uri_patterns uri_patterns,
  sources sources,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.com_atproto_label_query_labels_request(
      request,
      uri_patterns,
      sources,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_label_query_labels_response(response)),
  )
  t.Done(data)
}

pub fn tools_ozone_set_query_sets(
  token,
  limit limit,
  cursor cursor,
  name_prefix name_prefix,
  sort_by sort_by,
  sort_direction sort_direction,
) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_set_query_sets_request(
      request,
      limit,
      cursor,
      name_prefix,
      sort_by,
      sort_direction,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_set_query_sets_response(response)),
  )
  t.Done(data)
}

pub fn tools_ozone_communication_update_template(token, data) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_communication_update_template_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_communication_update_template_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn tools_ozone_set_get_values(token, name name, limit limit, cursor cursor) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_set_get_values_request(request, name, limit, cursor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_set_get_values_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_graph_get_mutes(token, limit limit, cursor cursor) {
  let request = base_request(token)
  let request =
    operations.app_bsky_graph_get_mutes_request(request, limit, cursor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_get_mutes_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_identity_resolve_identity(token, identifier identifier) {
  let request = base_request(token)
  let request =
    operations.com_atproto_identity_resolve_identity_request(
      request,
      identifier,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_identity_resolve_identity_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn tools_ozone_moderation_get_event(token, id id) {
  let request = base_request(token)
  let request = operations.tools_ozone_moderation_get_event_request(request, id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_moderation_get_event_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_sync_list_hosts(token, limit limit, cursor cursor) {
  let request = base_request(token)
  let request =
    operations.com_atproto_sync_list_hosts_request(request, limit, cursor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_sync_list_hosts_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_feed_get_feed_generators(token, feeds feeds) {
  let request = base_request(token)
  let request =
    operations.app_bsky_feed_get_feed_generators_request(request, feeds)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_feed_get_feed_generators_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_feed_get_feed(token, feed feed, limit limit, cursor cursor) {
  let request = base_request(token)
  let request =
    operations.app_bsky_feed_get_feed_request(request, feed, limit, cursor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_feed_get_feed_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_server_get_session(token) {
  let request = base_request(token)
  let request = operations.com_atproto_server_get_session_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_get_session_response(response)),
  )
  t.Done(data)
}

pub fn tools_ozone_set_delete_set(token, data) {
  let request = base_request(token)
  let request = operations.tools_ozone_set_delete_set_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_set_delete_set_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_graph_get_starter_packs(token, uris uris) {
  let request = base_request(token)
  let request =
    operations.app_bsky_graph_get_starter_packs_request(request, uris)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_get_starter_packs_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_graph_unmute_actor_list(token, data) {
  let request = base_request(token)
  let request =
    operations.app_bsky_graph_unmute_actor_list_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_unmute_actor_list_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_graph_mute_thread(token, data) {
  let request = base_request(token)
  let request = operations.app_bsky_graph_mute_thread_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_mute_thread_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_sync_request_crawl(token, data) {
  let request = base_request(token)
  let request = operations.com_atproto_sync_request_crawl_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_sync_request_crawl_response(response)),
  )
  t.Done(data)
}

pub fn tools_ozone_set_delete_values(token, data) {
  let request = base_request(token)
  let request = operations.tools_ozone_set_delete_values_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_set_delete_values_response(response)),
  )
  t.Done(data)
}

pub fn tools_ozone_moderation_query_events(
  token,
  types types,
  created_by created_by,
  sort_direction sort_direction,
  created_after created_after,
  created_before created_before,
  subject subject,
  collections collections,
  subject_type subject_type,
  include_all_user_records include_all_user_records,
  limit limit,
  has_comment has_comment,
  comment comment,
  added_labels added_labels,
  removed_labels removed_labels,
  added_tags added_tags,
  removed_tags removed_tags,
  report_types report_types,
  policies policies,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_moderation_query_events_request(
      request,
      types,
      created_by,
      sort_direction,
      created_after,
      created_before,
      subject,
      collections,
      subject_type,
      include_all_user_records,
      limit,
      has_comment,
      comment,
      added_labels,
      removed_labels,
      added_tags,
      removed_tags,
      report_types,
      policies,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_moderation_query_events_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_repo_list_missing_blobs(token, limit limit, cursor cursor) {
  let request = base_request(token)
  let request =
    operations.com_atproto_repo_list_missing_blobs_request(
      request,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_repo_list_missing_blobs_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_feed_get_list_feed(token, list list, limit limit, cursor cursor) {
  let request = base_request(token)
  let request =
    operations.app_bsky_feed_get_list_feed_request(request, list, limit, cursor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_feed_get_list_feed_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_notification_register_push(token, data) {
  let request = base_request(token)
  let request =
    operations.app_bsky_notification_register_push_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_notification_register_push_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_actor_put_preferences(token, data) {
  let request = base_request(token)
  let request = operations.app_bsky_actor_put_preferences_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_actor_put_preferences_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_repo_create_record(token, data) {
  let request = base_request(token)
  let request = operations.com_atproto_repo_create_record_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_repo_create_record_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_server_delete_account(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_delete_account_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_delete_account_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn tools_ozone_hosting_get_account_history(
  token,
  did did,
  events events,
  cursor cursor,
  limit limit,
) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_hosting_get_account_history_request(
      request,
      did,
      events,
      cursor,
      limit,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_hosting_get_account_history_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_admin_update_account_email(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_admin_update_account_email_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_admin_update_account_email_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_identity_submit_plc_operation(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_identity_submit_plc_operation_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_identity_submit_plc_operation_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_server_create_invite_codes(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_create_invite_codes_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_create_invite_codes_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn chat_bsky_convo_update_all_read(token, data) {
  let request = base_request(token)
  let request =
    operations.chat_bsky_convo_update_all_read_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_convo_update_all_read_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_actor_search_actors(token, q q, limit limit, cursor cursor) {
  let request = base_request(token)
  let request =
    operations.app_bsky_actor_search_actors_request(request, q, limit, cursor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_actor_search_actors_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_server_create_app_password(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_create_app_password_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_create_app_password_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn tools_ozone_moderation_get_subjects(token, subjects subjects) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_moderation_get_subjects_request(request, subjects)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_moderation_get_subjects_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_server_confirm_email(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_confirm_email_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_confirm_email_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_graph_get_lists(token, actor actor, limit limit, cursor cursor) {
  let request = base_request(token)
  let request =
    operations.app_bsky_graph_get_lists_request(request, actor, limit, cursor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_get_lists_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_graph_get_followers(
  token,
  actor actor,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.app_bsky_graph_get_followers_request(
      request,
      actor,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_get_followers_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_sync_get_repo(token, did did, since since) {
  let request = base_request(token)
  let request =
    operations.com_atproto_sync_get_repo_request(request, did, since)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_sync_get_repo_response(response)),
  )
  t.Done(data)
}

pub fn tools_ozone_set_upsert_set(token, data) {
  let request = base_request(token)
  let request = operations.tools_ozone_set_upsert_set_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_set_upsert_set_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_server_refresh_session(token) {
  let request = base_request(token)
  let request = operations.com_atproto_server_refresh_session_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_refresh_session_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_admin_disable_invite_codes(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_admin_disable_invite_codes_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_admin_disable_invite_codes_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_sync_get_record(
  token,
  did did,
  collection collection,
  rkey rkey,
) {
  let request = base_request(token)
  let request =
    operations.com_atproto_sync_get_record_request(
      request,
      did,
      collection,
      rkey,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_sync_get_record_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_graph_get_blocks(token, limit limit, cursor cursor) {
  let request = base_request(token)
  let request =
    operations.app_bsky_graph_get_blocks_request(request, limit, cursor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_get_blocks_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_video_get_upload_limits(token) {
  let request = base_request(token)
  let request = operations.app_bsky_video_get_upload_limits_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_video_get_upload_limits_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_graph_mute_actor(token, data) {
  let request = base_request(token)
  let request = operations.app_bsky_graph_mute_actor_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_mute_actor_response(response)),
  )
  t.Done(data)
}

pub fn chat_bsky_convo_get_log(token, cursor cursor) {
  let request = base_request(token)
  let request = operations.chat_bsky_convo_get_log_request(request, cursor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_convo_get_log_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_admin_disable_account_invites(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_admin_disable_account_invites_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_admin_disable_account_invites_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_feed_get_quotes(
  token,
  uri uri,
  cid cid,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.app_bsky_feed_get_quotes_request(
      request,
      uri,
      cid,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_feed_get_quotes_response(response)),
  )
  t.Done(data)
}

pub fn chat_bsky_convo_remove_reaction(token, data) {
  let request = base_request(token)
  let request =
    operations.chat_bsky_convo_remove_reaction_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_convo_remove_reaction_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_graph_mute_actor_list(token, data) {
  let request = base_request(token)
  let request = operations.app_bsky_graph_mute_actor_list_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_mute_actor_list_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_graph_get_list_blocks(token, limit limit, cursor cursor) {
  let request = base_request(token)
  let request =
    operations.app_bsky_graph_get_list_blocks_request(request, limit, cursor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_get_list_blocks_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_graph_unmute_thread(token, data) {
  let request = base_request(token)
  let request = operations.app_bsky_graph_unmute_thread_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_unmute_thread_response(response)),
  )
  t.Done(data)
}

pub fn chat_bsky_convo_add_reaction(token, data) {
  let request = base_request(token)
  let request = operations.chat_bsky_convo_add_reaction_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_convo_add_reaction_response(response)),
  )
  t.Done(data)
}

pub fn chat_bsky_moderation_get_actor_metadata(token, actor actor) {
  let request = base_request(token)
  let request =
    operations.chat_bsky_moderation_get_actor_metadata_request(request, actor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_moderation_get_actor_metadata_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn tools_ozone_moderation_search_repos(
  token,
  q q,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_moderation_search_repos_request(
      request,
      q,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_moderation_search_repos_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_actor_get_preferences(token) {
  let request = base_request(token)
  let request = operations.app_bsky_actor_get_preferences_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_actor_get_preferences_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_identity_resolve_did(token, did did) {
  let request = base_request(token)
  let request =
    operations.com_atproto_identity_resolve_did_request(request, did)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_identity_resolve_did_response(response)),
  )
  t.Done(data)
}

pub fn tools_ozone_communication_list_templates(token) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_communication_list_templates_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_communication_list_templates_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_feed_search_posts(
  token,
  q q,
  sort sort,
  since since,
  until until,
  mentions mentions,
  author author,
  lang lang,
  domain domain,
  url url,
  tag tag,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.app_bsky_feed_search_posts_request(
      request,
      q,
      sort,
      since,
      until,
      mentions,
      author,
      lang,
      domain,
      url,
      tag,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_feed_search_posts_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_admin_delete_account(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_admin_delete_account_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_admin_delete_account_response(response)),
  )
  t.Done(data)
}

pub fn chat_bsky_convo_unmute_convo(token, data) {
  let request = base_request(token)
  let request = operations.chat_bsky_convo_unmute_convo_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_convo_unmute_convo_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_feed_send_interactions(token, data) {
  let request = base_request(token)
  let request =
    operations.app_bsky_feed_send_interactions_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_feed_send_interactions_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_server_check_account_status(token) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_check_account_status_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_check_account_status_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn tools_ozone_setting_list_options(
  token,
  limit limit,
  cursor cursor,
  scope scope,
  prefix prefix,
  keys keys,
) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_setting_list_options_request(
      request,
      limit,
      cursor,
      scope,
      prefix,
      keys,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_setting_list_options_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_feed_describe_feed_generator(token) {
  let request = base_request(token)
  let request =
    operations.app_bsky_feed_describe_feed_generator_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_feed_describe_feed_generator_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_sync_list_repos(token, limit limit, cursor cursor) {
  let request = base_request(token)
  let request =
    operations.com_atproto_sync_list_repos_request(request, limit, cursor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_sync_list_repos_response(response)),
  )
  t.Done(data)
}

pub fn tools_ozone_signature_find_related_accounts(
  token,
  did did,
  cursor cursor,
  limit limit,
) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_signature_find_related_accounts_request(
      request,
      did,
      cursor,
      limit,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.tools_ozone_signature_find_related_accounts_response(response),
    ),
  )
  t.Done(data)
}

pub fn com_atproto_server_activate_account(token) {
  let request = base_request(token)
  let request = operations.com_atproto_server_activate_account_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_activate_account_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_server_create_session(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_create_session_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_create_session_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_identity_update_handle(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_identity_update_handle_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_identity_update_handle_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_server_request_email_update(token) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_request_email_update_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_request_email_update_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_server_list_app_passwords(token) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_list_app_passwords_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_list_app_passwords_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_admin_update_account_password(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_admin_update_account_password_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_admin_update_account_password_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_feed_get_likes(
  token,
  uri uri,
  cid cid,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.app_bsky_feed_get_likes_request(request, uri, cid, limit, cursor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_feed_get_likes_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_feed_get_suggested_feeds(token, limit limit, cursor cursor) {
  let request = base_request(token)
  let request =
    operations.app_bsky_feed_get_suggested_feeds_request(request, limit, cursor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_feed_get_suggested_feeds_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn tools_ozone_communication_create_template(token, data) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_communication_create_template_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_communication_create_template_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_server_deactivate_account(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_deactivate_account_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_deactivate_account_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_admin_search_accounts(
  token,
  email email,
  cursor cursor,
  limit limit,
) {
  let request = base_request(token)
  let request =
    operations.com_atproto_admin_search_accounts_request(
      request,
      email,
      cursor,
      limit,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_admin_search_accounts_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn tools_ozone_server_get_config(token) {
  let request = base_request(token)
  let request = operations.tools_ozone_server_get_config_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_server_get_config_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_admin_update_account_signing_key(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_admin_update_account_signing_key_request(
      request,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.com_atproto_admin_update_account_signing_key_response(response),
    ),
  )
  t.Done(data)
}

pub fn app_bsky_graph_get_list(token, list list, limit limit, cursor cursor) {
  let request = base_request(token)
  let request =
    operations.app_bsky_graph_get_list_request(request, list, limit, cursor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_get_list_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_server_revoke_app_password(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_revoke_app_password_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_revoke_app_password_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn chat_bsky_convo_get_convo(token, convo_id convo_id) {
  let request = base_request(token)
  let request = operations.chat_bsky_convo_get_convo_request(request, convo_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_convo_get_convo_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_repo_get_record(
  token,
  repo repo,
  collection collection,
  rkey rkey,
  cid cid,
) {
  let request = base_request(token)
  let request =
    operations.com_atproto_repo_get_record_request(
      request,
      repo,
      collection,
      rkey,
      cid,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_repo_get_record_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_server_reserve_signing_key(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_reserve_signing_key_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_reserve_signing_key_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_server_create_invite_code(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_create_invite_code_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_create_invite_code_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_sync_notify_of_update(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_sync_notify_of_update_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_sync_notify_of_update_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn chat_bsky_convo_mute_convo(token, data) {
  let request = base_request(token)
  let request = operations.chat_bsky_convo_mute_convo_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_convo_mute_convo_response(response)),
  )
  t.Done(data)
}

pub fn tools_ozone_team_add_member(token, data) {
  let request = base_request(token)
  let request = operations.tools_ozone_team_add_member_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_team_add_member_response(response)),
  )
  t.Done(data)
}

pub fn tools_ozone_setting_remove_options(token, data) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_setting_remove_options_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_setting_remove_options_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn chat_bsky_convo_get_messages(
  token,
  convo_id convo_id,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.chat_bsky_convo_get_messages_request(
      request,
      convo_id,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_convo_get_messages_response(response)),
  )
  t.Done(data)
}

pub fn tools_ozone_team_list_members(
  token,
  q q,
  disabled disabled,
  roles roles,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_team_list_members_request(
      request,
      q,
      disabled,
      roles,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.tools_ozone_team_list_members_response(response)),
  )
  t.Done(data)
}

pub fn chat_bsky_convo_leave_convo(token, data) {
  let request = base_request(token)
  let request = operations.chat_bsky_convo_leave_convo_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_convo_leave_convo_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_identity_refresh_identity(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_identity_refresh_identity_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_identity_refresh_identity_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn chat_bsky_moderation_get_message_context(
  token,
  convo_id convo_id,
  message_id message_id,
  before before,
  after after,
) {
  let request = base_request(token)
  let request =
    operations.chat_bsky_moderation_get_message_context_request(
      request,
      convo_id,
      message_id,
      before,
      after,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_moderation_get_message_context_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_graph_search_starter_packs(
  token,
  q q,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.app_bsky_graph_search_starter_packs_request(
      request,
      q,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_search_starter_packs_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn com_atproto_sync_get_blocks(token, did did, cids cids) {
  let request = base_request(token)
  let request =
    operations.com_atproto_sync_get_blocks_request(request, did, cids)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_sync_get_blocks_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_actor_get_suggestions(token, limit limit, cursor cursor) {
  let request = base_request(token)
  let request =
    operations.app_bsky_actor_get_suggestions_request(request, limit, cursor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_actor_get_suggestions_response(response)),
  )
  t.Done(data)
}

pub fn app_bsky_graph_get_starter_pack(token, starter_pack starter_pack) {
  let request = base_request(token)
  let request =
    operations.app_bsky_graph_get_starter_pack_request(request, starter_pack)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_graph_get_starter_pack_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_repo_upload_blob(token) {
  let request = base_request(token)
  let request = operations.com_atproto_repo_upload_blob_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_repo_upload_blob_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_server_update_email(token, data) {
  let request = base_request(token)
  let request =
    operations.com_atproto_server_update_email_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_update_email_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_repo_list_records(
  token,
  repo repo,
  collection collection,
  limit limit,
  cursor cursor,
  reverse reverse,
) {
  let request = base_request(token)
  let request =
    operations.com_atproto_repo_list_records_request(
      request,
      repo,
      collection,
      limit,
      cursor,
      reverse,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_repo_list_records_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_repo_describe_repo(token, repo repo) {
  let request = base_request(token)
  let request = operations.com_atproto_repo_describe_repo_request(request, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_repo_describe_repo_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_admin_get_subject_status(token, did did, uri uri, blob blob) {
  let request = base_request(token)
  let request =
    operations.com_atproto_admin_get_subject_status_request(
      request,
      did,
      uri,
      blob,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_admin_get_subject_status_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_feed_get_feed_generator(token, feed feed) {
  let request = base_request(token)
  let request =
    operations.app_bsky_feed_get_feed_generator_request(request, feed)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_feed_get_feed_generator_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_sync_get_repo_status(token, did did) {
  let request = base_request(token)
  let request =
    operations.com_atproto_sync_get_repo_status_request(request, did)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_sync_get_repo_status_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_server_describe_server(token) {
  let request = base_request(token)
  let request = operations.com_atproto_server_describe_server_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.com_atproto_server_describe_server_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn app_bsky_feed_get_feed_skeleton(
  token,
  feed feed,
  limit limit,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.app_bsky_feed_get_feed_skeleton_request(
      request,
      feed,
      limit,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.app_bsky_feed_get_feed_skeleton_response(response)),
  )
  t.Done(data)
}

pub fn chat_bsky_convo_send_message(token, data) {
  let request = base_request(token)
  let request = operations.chat_bsky_convo_send_message_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.chat_bsky_convo_send_message_response(response)),
  )
  t.Done(data)
}

pub fn com_atproto_identity_request_plc_operation_signature(token) {
  let request = base_request(token)
  let request =
    operations.com_atproto_identity_request_plc_operation_signature_request(
      request,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.com_atproto_identity_request_plc_operation_signature_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn tools_ozone_verification_list_verifications(
  token,
  cursor cursor,
  limit limit,
  created_after created_after,
  created_before created_before,
  issuers issuers,
  subjects subjects,
  sort_direction sort_direction,
  is_revoked is_revoked,
) {
  let request = base_request(token)
  let request =
    operations.tools_ozone_verification_list_verifications_request(
      request,
      cursor,
      limit,
      created_after,
      created_before,
      issuers,
      subjects,
      sort_direction,
      is_revoked,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.tools_ozone_verification_list_verifications_response(response),
    ),
  )
  t.Done(data)
}
