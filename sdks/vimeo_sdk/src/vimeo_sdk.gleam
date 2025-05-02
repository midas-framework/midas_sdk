import gleam/http/request
import gleam/string
import midas/task as t
import snag
import vimeo_sdk/operations

const api_host = "api.vimeo.com"

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

pub fn set_live_event_whitelist(token, user_id, live_event_id, data) {
  let request = base_request(token)
  let request =
    operations.set_live_event_whitelist_request(
      request,
      user_id,
      live_event_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.set_live_event_whitelist_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_whitelist(token, user_id, live_event_id) {
  let request = base_request(token)
  let request =
    operations.get_live_event_whitelist_request(request, user_id, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_whitelist_response(response)),
  )
  t.Done(data)
}

pub fn create_video_version(token, video_id) {
  let request = base_request(token)
  let request = operations.create_video_version_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_video_version_response(response)),
  )
  t.Done(data)
}

pub fn get_video_versions(token, video_id, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.get_video_versions_request(request, video_id, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_video_versions_response(response)),
  )
  t.Done(data)
}

pub fn get_tag(token, word) {
  let request = base_request(token)
  let request = operations.get_tag_request(request, word)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_tag_response(response)))
  t.Done(data)
}

pub fn create_showcase_logo(token, user_id, album_id) {
  let request = base_request(token)
  let request =
    operations.create_showcase_logo_request(request, user_id, album_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_showcase_logo_response(response)),
  )
  t.Done(data)
}

pub fn get_showcase_logos(
  token,
  user_id,
  album_id,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.get_showcase_logos_request(
      request,
      user_id,
      album_id,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_showcase_logos_response(response)),
  )
  t.Done(data)
}

pub fn create_audio_track(token, video_id, version_id) {
  let request = base_request(token)
  let request =
    operations.create_audio_track_request(request, video_id, version_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_audio_track_response(response)),
  )
  t.Done(data)
}

pub fn get_category_videos(
  token,
  category,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_category_videos_request(
      request,
      category,
      direction,
      filter,
      filter_embeddable,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_category_videos_response(response)),
  )
  t.Done(data)
}

pub fn delete_folder_items_altone(
  token,
  project_id,
  should_delete_items should_delete_items,
  uris uris,
) {
  let request = base_request(token)
  let request =
    operations.delete_folder_items_altone_request(
      request,
      project_id,
      should_delete_items,
      uris,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_folder_items_altone_response(response)),
  )
  t.Done(data)
}

pub fn create_channel(token) {
  let request = base_request(token)
  let request = operations.create_channel_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.create_channel_response(response)))
  t.Done(data)
}

pub fn get_channels(
  token,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_channels_request(
      request,
      direction,
      filter,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_channels_response(response)))
  t.Done(data)
}

pub fn delete_fragments(token, video_id) {
  let request = base_request(token)
  let request = operations.delete_fragments_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_fragments_response(response)),
  )
  t.Done(data)
}

pub fn put_fragments(token, video_id) {
  let request = base_request(token)
  let request = operations.put_fragments_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.put_fragments_response(response)))
  t.Done(data)
}

pub fn get_fragments(token, video_id) {
  let request = base_request(token)
  let request = operations.get_fragments_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_fragments_response(response)))
  t.Done(data)
}

pub fn end_live_event_altone(token, live_event_id, clip_id clip_id) {
  let request = base_request(token)
  let request =
    operations.end_live_event_altone_request(request, live_event_id, clip_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.end_live_event_altone_response(response)),
  )
  t.Done(data)
}

pub fn create_live_event_thumbnail(token, user_id, live_event_id) {
  let request = base_request(token)
  let request =
    operations.create_live_event_thumbnail_request(
      request,
      user_id,
      live_event_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_live_event_thumbnail_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_thumbnails(token, user_id, live_event_id) {
  let request = base_request(token)
  let request =
    operations.get_live_event_thumbnails_request(
      request,
      user_id,
      live_event_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_thumbnails_response(response)),
  )
  t.Done(data)
}

pub fn create_text_track_altone(token, channel_id, video_id) {
  let request = base_request(token)
  let request =
    operations.create_text_track_altone_request(request, channel_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_text_track_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_text_tracks_alt2(
  token,
  channel_id,
  video_id,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.get_text_tracks_alt2_request(
      request,
      channel_id,
      video_id,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_text_tracks_alt2_response(response)),
  )
  t.Done(data)
}

pub fn edit_video_credit(token, video_id, credit_id) {
  let request = base_request(token)
  let request =
    operations.edit_video_credit_request(request, video_id, credit_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_video_credit_response(response)),
  )
  t.Done(data)
}

pub fn delete_video_credit(token, video_id, credit_id) {
  let request = base_request(token)
  let request =
    operations.delete_video_credit_request(request, video_id, credit_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_video_credit_response(response)),
  )
  t.Done(data)
}

pub fn get_video_credit(token, video_id, credit_id) {
  let request = base_request(token)
  let request =
    operations.get_video_credit_request(request, video_id, credit_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_video_credit_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_video_altone(token, live_event_id, video_id) {
  let request = base_request(token)
  let request =
    operations.get_live_event_video_altone_request(
      request,
      live_event_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_video_altone_response(response)),
  )
  t.Done(data)
}

pub fn unlike_video_altone(token, video_id) {
  let request = base_request(token)
  let request = operations.unlike_video_altone_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.unlike_video_altone_response(response)),
  )
  t.Done(data)
}

pub fn like_video_altone(token, video_id) {
  let request = base_request(token)
  let request = operations.like_video_altone_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.like_video_altone_response(response)),
  )
  t.Done(data)
}

pub fn check_if_user_liked_video_altone(token, video_id) {
  let request = base_request(token)
  let request =
    operations.check_if_user_liked_video_altone_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_if_user_liked_video_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_available_video_showcases(
  token,
  video_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_available_video_showcases_request(
      request,
      video_id,
      direction,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_available_video_showcases_response(response)),
  )
  t.Done(data)
}

pub fn delete_video_embed_preset(token, video_id, preset_id) {
  let request = base_request(token)
  let request =
    operations.delete_video_embed_preset_request(request, video_id, preset_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_video_embed_preset_response(response)),
  )
  t.Done(data)
}

pub fn add_video_embed_preset(token, video_id, preset_id) {
  let request = base_request(token)
  let request =
    operations.add_video_embed_preset_request(request, video_id, preset_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_video_embed_preset_response(response)),
  )
  t.Done(data)
}

pub fn get_video_embed_preset(token, video_id, preset_id) {
  let request = base_request(token)
  let request =
    operations.get_video_embed_preset_request(request, video_id, preset_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_video_embed_preset_response(response)),
  )
  t.Done(data)
}

pub fn toggle_rle_low_latency_alt2(token, live_event_id) {
  let request = base_request(token)
  let request =
    operations.toggle_rle_low_latency_alt2_request(request, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.toggle_rle_low_latency_alt2_response(response)),
  )
  t.Done(data)
}

pub fn get_user_analytics_altone(
  token,
  dimension dimension,
  direction direction,
  filter_content filter_content,
  filter_countries filter_countries,
  filter_device_types filter_device_types,
  filter_embed_domains filter_embed_domains,
  filter_regions filter_regions,
  filter_streaming_types filter_streaming_types,
  from from,
  page page,
  per_page per_page,
  sort sort,
  time_interval time_interval,
  to to,
) {
  let request = base_request(token)
  let request =
    operations.get_user_analytics_altone_request(
      request,
      dimension,
      direction,
      filter_content,
      filter_countries,
      filter_device_types,
      filter_embed_domains,
      filter_regions,
      filter_streaming_types,
      from,
      page,
      per_page,
      sort,
      time_interval,
      to,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_user_analytics_altone_response(response)),
  )
  t.Done(data)
}

pub fn check_if_user_owns_video(token, user_id, video_id) {
  let request = base_request(token)
  let request =
    operations.check_if_user_owns_video_request(request, user_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_if_user_owns_video_response(response)),
  )
  t.Done(data)
}

pub fn create_video_thumbnail_altone(token, channel_id, video_id) {
  let request = base_request(token)
  let request =
    operations.create_video_thumbnail_altone_request(
      request,
      channel_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_video_thumbnail_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_video_thumbnails_altone(
  token,
  channel_id,
  video_id,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.get_video_thumbnails_altone_request(
      request,
      channel_id,
      video_id,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_video_thumbnails_altone_response(response)),
  )
  t.Done(data)
}

pub fn create_ott_destination(token, user_id, live_event_id) {
  let request = base_request(token)
  let request =
    operations.create_ott_destination_request(request, user_id, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_ott_destination_response(response)),
  )
  t.Done(data)
}

pub fn get_ott_destinations(token, user_id, live_event_id) {
  let request = base_request(token)
  let request =
    operations.get_ott_destinations_request(request, user_id, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_ott_destinations_response(response)),
  )
  t.Done(data)
}

pub fn delete_video_from_group(token, group_id, video_id) {
  let request = base_request(token)
  let request =
    operations.delete_video_from_group_request(request, group_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_video_from_group_response(response)),
  )
  t.Done(data)
}

pub fn add_video_to_group(token, group_id, video_id) {
  let request = base_request(token)
  let request =
    operations.add_video_to_group_request(request, group_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_video_to_group_response(response)),
  )
  t.Done(data)
}

pub fn get_group_video(token, group_id, video_id) {
  let request = base_request(token)
  let request = operations.get_group_video_request(request, group_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_group_video_response(response)),
  )
  t.Done(data)
}

pub fn edit_comment(token, video_id, comment_id) {
  let request = base_request(token)
  let request = operations.edit_comment_request(request, video_id, comment_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.edit_comment_response(response)))
  t.Done(data)
}

pub fn delete_comment(token, video_id, comment_id) {
  let request = base_request(token)
  let request = operations.delete_comment_request(request, video_id, comment_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_comment_response(response)))
  t.Done(data)
}

pub fn get_comment(token, video_id, comment_id) {
  let request = base_request(token)
  let request = operations.get_comment_request(request, video_id, comment_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_comment_response(response)))
  t.Done(data)
}

pub fn create_comment_altone(token, channel_id, video_id) {
  let request = base_request(token)
  let request =
    operations.create_comment_altone_request(request, channel_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_comment_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_comments_altone(
  token,
  channel_id,
  video_id,
  direction direction,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.get_comments_altone_request(
      request,
      channel_id,
      video_id,
      direction,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_comments_altone_response(response)),
  )
  t.Done(data)
}

pub fn add_video_privacy_users(token, video_id) {
  let request = base_request(token)
  let request = operations.add_video_privacy_users_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_video_privacy_users_response(response)),
  )
  t.Done(data)
}

pub fn get_video_privacy_users(token, video_id, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.get_video_privacy_users_request(
      request,
      video_id,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_video_privacy_users_response(response)),
  )
  t.Done(data)
}

pub fn add_vod_poster(token, ondemand_id) {
  let request = base_request(token)
  let request = operations.add_vod_poster_request(request, ondemand_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.add_vod_poster_response(response)))
  t.Done(data)
}

pub fn get_vod_posters(token, ondemand_id, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.get_vod_posters_request(request, ondemand_id, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_vod_posters_response(response)),
  )
  t.Done(data)
}

pub fn create_picture_altone(token) {
  let request = base_request(token)
  let request = operations.create_picture_altone_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_picture_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_pictures_altone(token, page page, per_page per_page) {
  let request = base_request(token)
  let request = operations.get_pictures_altone_request(request, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_pictures_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_transcript_metadata(token, container_uuid, texttrack_id) {
  let request = base_request(token)
  let request =
    operations.get_transcript_metadata_request(
      request,
      container_uuid,
      texttrack_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_transcript_metadata_response(response)),
  )
  t.Done(data)
}

pub fn add_video_tags(token, video_id, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.add_video_tags_request(request, video_id, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.add_video_tags_response(response)))
  t.Done(data)
}

pub fn get_video_tags(token, video_id, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.get_video_tags_request(request, video_id, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_video_tags_response(response)))
  t.Done(data)
}

pub fn create_vod_background(token, ondemand_id) {
  let request = base_request(token)
  let request = operations.create_vod_background_request(request, ondemand_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_vod_background_response(response)),
  )
  t.Done(data)
}

pub fn get_vod_backgrounds(token, ondemand_id, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.get_vod_backgrounds_request(request, ondemand_id, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_vod_backgrounds_response(response)),
  )
  t.Done(data)
}

pub fn delete_live_events_altone(token) {
  let request = base_request(token)
  let request = operations.delete_live_events_altone_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_live_events_altone_response(response)),
  )
  t.Done(data)
}

pub fn create_live_event_altone(token) {
  let request = base_request(token)
  let request = operations.create_live_event_altone_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_live_event_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_live_events_altone(
  token,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
  type_ type_,
) {
  let request = base_request(token)
  let request =
    operations.get_live_events_altone_request(
      request,
      direction,
      filter,
      page,
      per_page,
      query,
      sort,
      type_,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_events_altone_response(response)),
  )
  t.Done(data)
}

pub fn edit_video_thumbnail(token, video_id, picture_id) {
  let request = base_request(token)
  let request =
    operations.edit_video_thumbnail_request(request, video_id, picture_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_video_thumbnail_response(response)),
  )
  t.Done(data)
}

pub fn delete_video_thumbnail(token, video_id, picture_id) {
  let request = base_request(token)
  let request =
    operations.delete_video_thumbnail_request(request, video_id, picture_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_video_thumbnail_response(response)),
  )
  t.Done(data)
}

pub fn get_video_thumbnail(token, video_id, picture_id) {
  let request = base_request(token)
  let request =
    operations.get_video_thumbnail_request(request, video_id, picture_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_video_thumbnail_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_m3u8_playback_altone(
  token,
  live_event_id,
  max_fps_fhd max_fps_fhd,
  ttl ttl,
) {
  let request = base_request(token)
  let request =
    operations.get_live_event_m3u8_playback_altone_request(
      request,
      live_event_id,
      max_fps_fhd,
      ttl,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_m3u8_playback_altone_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn get_user_groups_altone(
  token,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_user_groups_altone_request(
      request,
      direction,
      filter,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_user_groups_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_transcript(token, video_id, texttrack_id) {
  let request = base_request(token)
  let request =
    operations.get_transcript_request(request, video_id, texttrack_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_transcript_response(response)))
  t.Done(data)
}

pub fn activate_live_event(token, user_id, live_event_id) {
  let request = base_request(token)
  let request =
    operations.activate_live_event_request(request, user_id, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activate_live_event_response(response)),
  )
  t.Done(data)
}

pub fn remove_channel_moderator(token, channel_id, user_id) {
  let request = base_request(token)
  let request =
    operations.remove_channel_moderator_request(request, channel_id, user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.remove_channel_moderator_response(response)),
  )
  t.Done(data)
}

pub fn add_channel_moderator(token, channel_id, user_id) {
  let request = base_request(token)
  let request =
    operations.add_channel_moderator_request(request, channel_id, user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_channel_moderator_response(response)),
  )
  t.Done(data)
}

pub fn get_channel_moderator(token, channel_id, user_id) {
  let request = base_request(token)
  let request =
    operations.get_channel_moderator_request(request, channel_id, user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_channel_moderator_response(response)),
  )
  t.Done(data)
}

pub fn edit_text_track(token, video_id, texttrack_id) {
  let request = base_request(token)
  let request =
    operations.edit_text_track_request(request, video_id, texttrack_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_text_track_response(response)),
  )
  t.Done(data)
}

pub fn delete_text_track(token, video_id, texttrack_id) {
  let request = base_request(token)
  let request =
    operations.delete_text_track_request(request, video_id, texttrack_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_text_track_response(response)),
  )
  t.Done(data)
}

pub fn get_text_track(token, video_id, texttrack_id) {
  let request = base_request(token)
  let request =
    operations.get_text_track_request(request, video_id, texttrack_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_text_track_response(response)))
  t.Done(data)
}

pub fn get_region(token, country) {
  let request = base_request(token)
  let request = operations.get_region_request(request, country)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_region_response(response)))
  t.Done(data)
}

pub fn get_related_videos(
  token,
  video_id,
  filter filter,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.get_related_videos_request(
      request,
      video_id,
      filter,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_related_videos_response(response)),
  )
  t.Done(data)
}

pub fn get_portfolio_videos_altone(
  token,
  portfolio_id,
  containing_uri containing_uri,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_portfolio_videos_altone_request(
      request,
      portfolio_id,
      containing_uri,
      filter,
      filter_embeddable,
      page,
      per_page,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_portfolio_videos_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_category_groups(
  token,
  category,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_category_groups_request(
      request,
      category,
      direction,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_category_groups_response(response)),
  )
  t.Done(data)
}

pub fn get_animated_thumbset_status(token, video_id, picture_id) {
  let request = base_request(token)
  let request =
    operations.get_animated_thumbset_status_request(
      request,
      video_id,
      picture_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_animated_thumbset_status_response(response)),
  )
  t.Done(data)
}

pub fn create_custom_logo(token, user_id) {
  let request = base_request(token)
  let request = operations.create_custom_logo_request(request, user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_custom_logo_response(response)),
  )
  t.Done(data)
}

pub fn get_custom_logos(
  token,
  user_id,
  page page,
  per_page per_page,
  sizes sizes,
) {
  let request = base_request(token)
  let request =
    operations.get_custom_logos_request(request, user_id, page, per_page, sizes)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_custom_logos_response(response)),
  )
  t.Done(data)
}

pub fn create_vod(token, user_id, data) {
  let request = base_request(token)
  let request = operations.create_vod_request(request, user_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.create_vod_response(response)))
  t.Done(data)
}

pub fn get_user_vods(
  token,
  user_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_user_vods_request(
      request,
      user_id,
      direction,
      filter,
      page,
      per_page,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_user_vods_response(response)))
  t.Done(data)
}

pub fn edit_channel(token, channel_id) {
  let request = base_request(token)
  let request = operations.edit_channel_request(request, channel_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.edit_channel_response(response)))
  t.Done(data)
}

pub fn delete_channel(token, channel_id) {
  let request = base_request(token)
  let request = operations.delete_channel_request(request, channel_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_channel_response(response)))
  t.Done(data)
}

pub fn get_channel(token, channel_id) {
  let request = base_request(token)
  let request = operations.get_channel_request(request, channel_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_channel_response(response)))
  t.Done(data)
}

pub fn edit_live_event_auto_cc_alt2(token, live_event_id) {
  let request = base_request(token)
  let request =
    operations.edit_live_event_auto_cc_alt2_request(request, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_live_event_auto_cc_alt2_response(response)),
  )
  t.Done(data)
}

pub fn unsubscribe_from_category(token, user_id, category) {
  let request = base_request(token)
  let request =
    operations.unsubscribe_from_category_request(request, user_id, category)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.unsubscribe_from_category_response(response)),
  )
  t.Done(data)
}

pub fn subscribe_to_category(token, user_id, category) {
  let request = base_request(token)
  let request =
    operations.subscribe_to_category_request(request, user_id, category)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.subscribe_to_category_response(response)),
  )
  t.Done(data)
}

pub fn check_if_user_subscribed_to_category(token, user_id, category) {
  let request = base_request(token)
  let request =
    operations.check_if_user_subscribed_to_category_request(
      request,
      user_id,
      category,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_if_user_subscribed_to_category_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn unfollow_user(token, user_id, follow_user_id) {
  let request = base_request(token)
  let request =
    operations.unfollow_user_request(request, user_id, follow_user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.unfollow_user_response(response)))
  t.Done(data)
}

pub fn follow_user(token, user_id, follow_user_id) {
  let request = base_request(token)
  let request = operations.follow_user_request(request, user_id, follow_user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.follow_user_response(response)))
  t.Done(data)
}

pub fn check_if_user_is_following(token, user_id, follow_user_id) {
  let request = base_request(token)
  let request =
    operations.check_if_user_is_following_request(
      request,
      user_id,
      follow_user_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_if_user_is_following_response(response)),
  )
  t.Done(data)
}

pub fn leave_group_altone(token, group_id) {
  let request = base_request(token)
  let request = operations.leave_group_altone_request(request, group_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.leave_group_altone_response(response)),
  )
  t.Done(data)
}

pub fn join_group_altone(token, group_id) {
  let request = base_request(token)
  let request = operations.join_group_altone_request(request, group_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.join_group_altone_response(response)),
  )
  t.Done(data)
}

pub fn check_if_user_joined_group_altone(token, group_id) {
  let request = base_request(token)
  let request =
    operations.check_if_user_joined_group_altone_request(request, group_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_if_user_joined_group_altone_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn edit_embed_preset_altone(token, preset_id) {
  let request = base_request(token)
  let request = operations.edit_embed_preset_altone_request(request, preset_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_embed_preset_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_embed_preset_altone(token, preset_id) {
  let request = base_request(token)
  let request = operations.get_embed_preset_altone_request(request, preset_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_embed_preset_altone_response(response)),
  )
  t.Done(data)
}

pub fn edit_showcase_alt2(token, album_id) {
  let request = base_request(token)
  let request = operations.edit_showcase_alt2_request(request, album_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_showcase_alt2_response(response)),
  )
  t.Done(data)
}

pub fn delete_showcase_alt2(token, album_id) {
  let request = base_request(token)
  let request = operations.delete_showcase_alt2_request(request, album_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_showcase_alt2_response(response)),
  )
  t.Done(data)
}

pub fn get_showcase_alt2(token, album_id) {
  let request = base_request(token)
  let request = operations.get_showcase_alt2_request(request, album_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_showcase_alt2_response(response)),
  )
  t.Done(data)
}

pub fn get_feed(
  token,
  user_id,
  offset offset,
  page page,
  per_page per_page,
  type_ type_,
) {
  let request = base_request(token)
  let request =
    operations.get_feed_request(request, user_id, offset, page, per_page, type_)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_feed_response(response)))
  t.Done(data)
}

pub fn delete_tag_from_channel(token, channel_id, word) {
  let request = base_request(token)
  let request =
    operations.delete_tag_from_channel_request(request, channel_id, word)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_tag_from_channel_response(response)),
  )
  t.Done(data)
}

pub fn add_channel_tag(token, channel_id, word) {
  let request = base_request(token)
  let request = operations.add_channel_tag_request(request, channel_id, word)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_channel_tag_response(response)),
  )
  t.Done(data)
}

pub fn check_if_channel_has_tag(token, channel_id, word) {
  let request = base_request(token)
  let request =
    operations.check_if_channel_has_tag_request(request, channel_id, word)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_if_channel_has_tag_response(response)),
  )
  t.Done(data)
}

pub fn edit_project(token, user_id, project_id, data) {
  let request = base_request(token)
  let request =
    operations.edit_project_request(request, user_id, project_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.edit_project_response(response)))
  t.Done(data)
}

pub fn delete_project(
  token,
  user_id,
  project_id,
  should_delete_clips should_delete_clips,
) {
  let request = base_request(token)
  let request =
    operations.delete_project_request(
      request,
      user_id,
      project_id,
      should_delete_clips,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_project_response(response)))
  t.Done(data)
}

pub fn get_project(token, user_id, project_id) {
  let request = base_request(token)
  let request = operations.get_project_request(request, user_id, project_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_project_response(response)))
  t.Done(data)
}

pub fn delete_payment_method(token, payment_method_id) {
  let request = base_request(token)
  let request =
    operations.delete_payment_method_request(request, payment_method_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_payment_method_response(response)),
  )
  t.Done(data)
}

pub fn get_payment_method_info(token, payment_method_id) {
  let request = base_request(token)
  let request =
    operations.get_payment_method_info_request(request, payment_method_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_payment_method_info_response(response)),
  )
  t.Done(data)
}

pub fn create_live_event_destination(token, live_event_id) {
  let request = base_request(token)
  let request =
    operations.create_live_event_destination_request(request, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_live_event_destination_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_destinations(token, live_event_id) {
  let request = base_request(token)
  let request =
    operations.get_live_event_destinations_request(request, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_destinations_response(response)),
  )
  t.Done(data)
}

pub fn update_live_event_alt2(token, live_event_id) {
  let request = base_request(token)
  let request =
    operations.update_live_event_alt2_request(request, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_live_event_alt2_response(response)),
  )
  t.Done(data)
}

pub fn delete_live_event_alt2(token, live_event_id) {
  let request = base_request(token)
  let request =
    operations.delete_live_event_alt2_request(request, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_live_event_alt2_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_alt2(token, live_event_id, password password) {
  let request = base_request(token)
  let request =
    operations.get_live_event_alt2_request(request, live_event_id, password)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_alt2_response(response)),
  )
  t.Done(data)
}

pub fn edit_chapter(token, video_id, chapter_id) {
  let request = base_request(token)
  let request = operations.edit_chapter_request(request, video_id, chapter_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.edit_chapter_response(response)))
  t.Done(data)
}

pub fn delete_chapter(token, video_id, chapter_id) {
  let request = base_request(token)
  let request = operations.delete_chapter_request(request, video_id, chapter_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_chapter_response(response)))
  t.Done(data)
}

pub fn get_chapter(token, video_id, chapter_id) {
  let request = base_request(token)
  let request = operations.get_chapter_request(request, video_id, chapter_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_chapter_response(response)))
  t.Done(data)
}

pub fn get_vod_season(token, ondemand_id, season_id) {
  let request = base_request(token)
  let request =
    operations.get_vod_season_request(request, ondemand_id, season_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_vod_season_response(response)))
  t.Done(data)
}

pub fn edit_vod_background(token, ondemand_id, background_id) {
  let request = base_request(token)
  let request =
    operations.edit_vod_background_request(request, ondemand_id, background_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_vod_background_response(response)),
  )
  t.Done(data)
}

pub fn delete_vod_background(token, ondemand_id, background_id) {
  let request = base_request(token)
  let request =
    operations.delete_vod_background_request(
      request,
      ondemand_id,
      background_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_vod_background_response(response)),
  )
  t.Done(data)
}

pub fn get_vod_background(token, ondemand_id, background_id) {
  let request = base_request(token)
  let request =
    operations.get_vod_background_request(request, ondemand_id, background_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_vod_background_response(response)),
  )
  t.Done(data)
}

pub fn replace_showcase_logo(token, user_id, album_id, logo_id) {
  let request = base_request(token)
  let request =
    operations.replace_showcase_logo_request(
      request,
      user_id,
      album_id,
      logo_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.replace_showcase_logo_response(response)),
  )
  t.Done(data)
}

pub fn delete_showcase_logo(token, user_id, album_id, logo_id) {
  let request = base_request(token)
  let request =
    operations.delete_showcase_logo_request(request, user_id, album_id, logo_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_showcase_logo_response(response)),
  )
  t.Done(data)
}

pub fn get_showcase_logo(token, user_id, album_id, logo_id) {
  let request = base_request(token)
  let request =
    operations.get_showcase_logo_request(request, user_id, album_id, logo_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_showcase_logo_response(response)),
  )
  t.Done(data)
}

pub fn get_followers(
  token,
  user_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_followers_request(
      request,
      user_id,
      direction,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_followers_response(response)))
  t.Done(data)
}

pub fn search_users(
  token,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.search_users_request(
      request,
      direction,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.search_users_response(response)))
  t.Done(data)
}

pub fn create_video_thumbnail(token, video_id) {
  let request = base_request(token)
  let request = operations.create_video_thumbnail_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_video_thumbnail_response(response)),
  )
  t.Done(data)
}

pub fn get_video_thumbnails(token, video_id, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.get_video_thumbnails_request(request, video_id, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_video_thumbnails_response(response)),
  )
  t.Done(data)
}

pub fn create_text_track(token, video_id) {
  let request = base_request(token)
  let request = operations.create_text_track_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_text_track_response(response)),
  )
  t.Done(data)
}

pub fn get_text_tracks(token, video_id, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.get_text_tracks_request(request, video_id, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_text_tracks_response(response)),
  )
  t.Done(data)
}

pub fn edit_vod_poster(token, ondemand_id, poster_id) {
  let request = base_request(token)
  let request =
    operations.edit_vod_poster_request(request, ondemand_id, poster_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_vod_poster_response(response)),
  )
  t.Done(data)
}

pub fn get_vod_poster(token, ondemand_id, poster_id) {
  let request = base_request(token)
  let request =
    operations.get_vod_poster_request(request, ondemand_id, poster_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_vod_poster_response(response)))
  t.Done(data)
}

pub fn delete_video_from_watch_later(token, user_id, video_id) {
  let request = base_request(token)
  let request =
    operations.delete_video_from_watch_later_request(request, user_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_video_from_watch_later_response(response)),
  )
  t.Done(data)
}

pub fn add_video_to_watch_later(token, user_id, video_id) {
  let request = base_request(token)
  let request =
    operations.add_video_to_watch_later_request(request, user_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_video_to_watch_later_response(response)),
  )
  t.Done(data)
}

pub fn check_watch_later_queue(token, user_id, video_id) {
  let request = base_request(token)
  let request =
    operations.check_watch_later_queue_request(request, user_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_watch_later_queue_response(response)),
  )
  t.Done(data)
}

pub fn get_vod_promotion_codes(
  token,
  ondemand_id,
  promotion_id,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.get_vod_promotion_codes_request(
      request,
      ondemand_id,
      promotion_id,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_vod_promotion_codes_response(response)),
  )
  t.Done(data)
}

pub fn remove_videos_from_project_altone(
  token,
  project_id,
  should_delete_clips should_delete_clips,
  uris uris,
) {
  let request = base_request(token)
  let request =
    operations.remove_videos_from_project_altone_request(
      request,
      project_id,
      should_delete_clips,
      uris,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.remove_videos_from_project_altone_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn add_videos_to_project_altone(token, project_id, uris uris) {
  let request = base_request(token)
  let request =
    operations.add_videos_to_project_altone_request(request, project_id, uris)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_videos_to_project_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_project_videos_altone(
  token,
  project_id,
  direction direction,
  filter_tag filter_tag,
  filter_tag_all_of filter_tag_all_of,
  filter_tag_exclude filter_tag_exclude,
  include_subfolders include_subfolders,
  page page,
  per_page per_page,
  query query,
  query_fields query_fields,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_project_videos_altone_request(
      request,
      project_id,
      direction,
      filter_tag,
      filter_tag_all_of,
      filter_tag_exclude,
      include_subfolders,
      page,
      per_page,
      query,
      query_fields,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_project_videos_altone_response(response)),
  )
  t.Done(data)
}

pub fn available_users(
  token,
  video_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.available_users_request(
      request,
      video_id,
      direction,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.available_users_response(response)),
  )
  t.Done(data)
}

pub fn remove_video_from_project_altone(token, project_id, video_id) {
  let request = base_request(token)
  let request =
    operations.remove_video_from_project_altone_request(
      request,
      project_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.remove_video_from_project_altone_response(response)),
  )
  t.Done(data)
}

pub fn add_video_to_project_altone(token, project_id, video_id) {
  let request = base_request(token)
  let request =
    operations.add_video_to_project_altone_request(
      request,
      project_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_video_to_project_altone_response(response)),
  )
  t.Done(data)
}

pub fn edit_live_event_thumbnail_alt2(token, live_event_id, thumbnail_id) {
  let request = base_request(token)
  let request =
    operations.edit_live_event_thumbnail_alt2_request(
      request,
      live_event_id,
      thumbnail_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_live_event_thumbnail_alt2_response(response)),
  )
  t.Done(data)
}

pub fn delete_live_event_thumbnail_alt2(token, live_event_id, thumbnail_id) {
  let request = base_request(token)
  let request =
    operations.delete_live_event_thumbnail_alt2_request(
      request,
      live_event_id,
      thumbnail_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_live_event_thumbnail_alt2_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_thumbnail_alt2(token, live_event_id, thumbnail_id) {
  let request = base_request(token)
  let request =
    operations.get_live_event_thumbnail_alt2_request(
      request,
      live_event_id,
      thumbnail_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_thumbnail_alt2_response(response)),
  )
  t.Done(data)
}

pub fn get_watch_later_queue(
  token,
  user_id,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_watch_later_queue_request(
      request,
      user_id,
      direction,
      filter,
      filter_embeddable,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_watch_later_queue_response(response)),
  )
  t.Done(data)
}

pub fn get_private_to_me_folder(token, owner_id) {
  let request = base_request(token)
  let request = operations.get_private_to_me_folder_request(request, owner_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_private_to_me_folder_response(response)),
  )
  t.Done(data)
}

pub fn get_category_subscriptions(
  token,
  user_id,
  direction direction,
  page page,
  per_page per_page,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_category_subscriptions_request(
      request,
      user_id,
      direction,
      page,
      per_page,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_category_subscriptions_response(response)),
  )
  t.Done(data)
}

pub fn get_channel_subscriptions_altone(
  token,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_channel_subscriptions_altone_request(
      request,
      direction,
      filter,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_channel_subscriptions_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_video_likes(
  token,
  video_id,
  direction direction,
  page page,
  per_page per_page,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_video_likes_request(
      request,
      video_id,
      direction,
      page,
      per_page,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_video_likes_response(response)),
  )
  t.Done(data)
}

pub fn create_embed_presets(token, user_id) {
  let request = base_request(token)
  let request = operations.create_embed_presets_request(request, user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_embed_presets_response(response)),
  )
  t.Done(data)
}

pub fn get_embed_presets(token, user_id, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.get_embed_presets_request(request, user_id, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_embed_presets_response(response)),
  )
  t.Done(data)
}

pub fn create_comment(token, video_id) {
  let request = base_request(token)
  let request = operations.create_comment_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.create_comment_response(response)))
  t.Done(data)
}

pub fn get_comments(
  token,
  video_id,
  direction direction,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.get_comments_request(
      request,
      video_id,
      direction,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_comments_response(response)))
  t.Done(data)
}

pub fn create_unsaved_chapter_thumbnail_or_upload_link(token, video_id, data) {
  let request = base_request(token)
  let request =
    operations.create_unsaved_chapter_thumbnail_or_upload_link_request(
      request,
      video_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.create_unsaved_chapter_thumbnail_or_upload_link_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn create_vod_promotion(token, ondemand_id) {
  let request = base_request(token)
  let request = operations.create_vod_promotion_request(request, ondemand_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_vod_promotion_response(response)),
  )
  t.Done(data)
}

pub fn get_vod_promotions(
  token,
  ondemand_id,
  filter filter,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.get_vod_promotions_request(
      request,
      ondemand_id,
      filter,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_vod_promotions_response(response)),
  )
  t.Done(data)
}

pub fn get_plan(token, tier) {
  let request = base_request(token)
  let request = operations.get_plan_request(request, tier)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_plan_response(response)))
  t.Done(data)
}

pub fn add_video_privacy_users_altone(token, channel_id, video_id) {
  let request = base_request(token)
  let request =
    operations.add_video_privacy_users_altone_request(
      request,
      channel_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_video_privacy_users_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_video_privacy_users_altone(
  token,
  channel_id,
  video_id,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.get_video_privacy_users_altone_request(
      request,
      channel_id,
      video_id,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_video_privacy_users_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_vod_genres_by_ondemand_id(token, ondemand_id) {
  let request = base_request(token)
  let request =
    operations.get_vod_genres_by_ondemand_id_request(request, ondemand_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_vod_genres_by_ondemand_id_response(response)),
  )
  t.Done(data)
}

pub fn get_portfolio(token, user_id, portfolio_id) {
  let request = base_request(token)
  let request = operations.get_portfolio_request(request, user_id, portfolio_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_portfolio_response(response)))
  t.Done(data)
}

pub fn client_auth(token) {
  let request = base_request(token)
  let request = operations.client_auth_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.client_auth_response(response)))
  t.Done(data)
}

pub fn delete_vod_regions(token, ondemand_id) {
  let request = base_request(token)
  let request = operations.delete_vod_regions_request(request, ondemand_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_vod_regions_response(response)),
  )
  t.Done(data)
}

pub fn set_vod_regions(token, ondemand_id) {
  let request = base_request(token)
  let request = operations.set_vod_regions_request(request, ondemand_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.set_vod_regions_response(response)),
  )
  t.Done(data)
}

pub fn get_vod_regions(token, ondemand_id) {
  let request = base_request(token)
  let request = operations.get_vod_regions_request(request, ondemand_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_vod_regions_response(response)),
  )
  t.Done(data)
}

pub fn get_category_channels(
  token,
  category,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_category_channels_request(
      request,
      category,
      direction,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_category_channels_response(response)),
  )
  t.Done(data)
}

pub fn replace_showcase_custom_thumb(token, user_id, album_id, thumbnail_id) {
  let request = base_request(token)
  let request =
    operations.replace_showcase_custom_thumb_request(
      request,
      user_id,
      album_id,
      thumbnail_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.replace_showcase_custom_thumb_response(response)),
  )
  t.Done(data)
}

pub fn delete_showcase_custom_thumbnail(token, user_id, album_id, thumbnail_id) {
  let request = base_request(token)
  let request =
    operations.delete_showcase_custom_thumbnail_request(
      request,
      user_id,
      album_id,
      thumbnail_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_showcase_custom_thumbnail_response(response)),
  )
  t.Done(data)
}

pub fn get_showcase_custom_thumbnail(token, user_id, album_id, thumbnail_id) {
  let request = base_request(token)
  let request =
    operations.get_showcase_custom_thumbnail_request(
      request,
      user_id,
      album_id,
      thumbnail_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_showcase_custom_thumbnail_response(response)),
  )
  t.Done(data)
}

pub fn toggle_rle_low_latency_altone(token, live_event_id) {
  let request = base_request(token)
  let request =
    operations.toggle_rle_low_latency_altone_request(request, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.toggle_rle_low_latency_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_video_custom_logo(token, video_id, thumbnail_id) {
  let request = base_request(token)
  let request =
    operations.get_video_custom_logo_request(request, video_id, thumbnail_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_video_custom_logo_response(response)),
  )
  t.Done(data)
}

pub fn delete_video_from_portfolio_altone(token, portfolio_id, video_id) {
  let request = base_request(token)
  let request =
    operations.delete_video_from_portfolio_altone_request(
      request,
      portfolio_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_video_from_portfolio_altone_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn add_video_to_portfolio_altone(token, portfolio_id, video_id) {
  let request = base_request(token)
  let request =
    operations.add_video_to_portfolio_altone_request(
      request,
      portfolio_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_video_to_portfolio_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_portfolio_video_altone(token, portfolio_id, video_id) {
  let request = base_request(token)
  let request =
    operations.get_portfolio_video_altone_request(
      request,
      portfolio_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_portfolio_video_altone_response(response)),
  )
  t.Done(data)
}

pub fn delete_video_privacy_user(token, video_id, user_id) {
  let request = base_request(token)
  let request =
    operations.delete_video_privacy_user_request(request, video_id, user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_video_privacy_user_response(response)),
  )
  t.Done(data)
}

pub fn add_video_privacy_user(token, video_id, user_id) {
  let request = base_request(token)
  let request =
    operations.add_video_privacy_user_request(request, video_id, user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_video_privacy_user_response(response)),
  )
  t.Done(data)
}

pub fn create_comment_reply(token, video_id, comment_id) {
  let request = base_request(token)
  let request =
    operations.create_comment_reply_request(request, video_id, comment_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_comment_reply_response(response)),
  )
  t.Done(data)
}

pub fn get_comment_replies(
  token,
  video_id,
  comment_id,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.get_comment_replies_request(
      request,
      video_id,
      comment_id,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_comment_replies_response(response)),
  )
  t.Done(data)
}

pub fn create_one_time_event_destination(token, user_id, video_id) {
  let request = base_request(token)
  let request =
    operations.create_one_time_event_destination_request(
      request,
      user_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_one_time_event_destination_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn get_one_time_event_destinations(token, user_id, video_id) {
  let request = base_request(token)
  let request =
    operations.get_one_time_event_destinations_request(
      request,
      user_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_one_time_event_destinations_response(response)),
  )
  t.Done(data)
}

pub fn create_project(token, user_id, data) {
  let request = base_request(token)
  let request = operations.create_project_request(request, user_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.create_project_response(response)))
  t.Done(data)
}

pub fn get_projects(
  token,
  user_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_projects_request(
      request,
      user_id,
      direction,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_projects_response(response)))
  t.Done(data)
}

pub fn add_video_credit(token, video_id) {
  let request = base_request(token)
  let request = operations.add_video_credit_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_video_credit_response(response)),
  )
  t.Done(data)
}

pub fn get_video_credits(
  token,
  video_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_video_credits_request(
      request,
      video_id,
      direction,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_video_credits_response(response)),
  )
  t.Done(data)
}

pub fn set_video_as_showcase_thumbnail_alt2(token, album_id, video_id, data) {
  let request = base_request(token)
  let request =
    operations.set_video_as_showcase_thumbnail_alt2_request(
      request,
      album_id,
      video_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.set_video_as_showcase_thumbnail_alt2_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn follow_users(token, user_id, data) {
  let request = base_request(token)
  let request = operations.follow_users_request(request, user_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.follow_users_response(response)))
  t.Done(data)
}

pub fn get_user_following(
  token,
  user_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_user_following_request(
      request,
      user_id,
      direction,
      filter,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_user_following_response(response)),
  )
  t.Done(data)
}

pub fn get_vod_purchases_altone(
  token,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_vod_purchases_altone_request(
      request,
      direction,
      filter,
      page,
      per_page,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_vod_purchases_altone_response(response)),
  )
  t.Done(data)
}

pub fn delete_custom_logo(token, user_id, logo_id) {
  let request = base_request(token)
  let request = operations.delete_custom_logo_request(request, user_id, logo_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_custom_logo_response(response)),
  )
  t.Done(data)
}

pub fn get_custom_logo(token, user_id, logo_id) {
  let request = base_request(token)
  let request = operations.get_custom_logo_request(request, user_id, logo_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_custom_logo_response(response)),
  )
  t.Done(data)
}

pub fn get_one_time_event_m3u8_playback_altone(token, video_id) {
  let request = base_request(token)
  let request =
    operations.get_one_time_event_m3u8_playback_altone_request(
      request,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_one_time_event_m3u8_playback_altone_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn get_group_videos(
  token,
  group_id,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_group_videos_request(
      request,
      group_id,
      direction,
      filter,
      filter_embeddable,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_group_videos_response(response)),
  )
  t.Done(data)
}

pub fn delete_videos(token, user_id, uris uris) {
  let request = base_request(token)
  let request = operations.delete_videos_request(request, user_id, uris)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_videos_response(response)))
  t.Done(data)
}

pub fn upload_video(token, user_id) {
  let request = base_request(token)
  let request = operations.upload_video_request(request, user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.upload_video_response(response)))
  t.Done(data)
}

pub fn get_videos(
  token,
  user_id,
  containing_uri containing_uri,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  filter_playable filter_playable,
  filter_screen_recorded filter_screen_recorded,
  filter_tag filter_tag,
  filter_tag_all_of filter_tag_all_of,
  filter_tag_exclude filter_tag_exclude,
  filter_uploader filter_uploader,
  include_team_content include_team_content,
  page page,
  per_page per_page,
  query query,
  query_fields query_fields,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_videos_request(
      request,
      user_id,
      containing_uri,
      direction,
      filter,
      filter_embeddable,
      filter_playable,
      filter_screen_recorded,
      filter_tag,
      filter_tag_all_of,
      filter_tag_exclude,
      filter_uploader,
      include_team_content,
      page,
      per_page,
      query,
      query_fields,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_videos_response(response)))
  t.Done(data)
}

pub fn edit_live_event_auto_cc_altone(token, live_event_id) {
  let request = base_request(token)
  let request =
    operations.edit_live_event_auto_cc_altone_request(request, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_live_event_auto_cc_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_likes_altone(
  token,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_likes_altone_request(
      request,
      filter,
      filter_embeddable,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_likes_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_vod_genre(token, genre_id) {
  let request = base_request(token)
  let request = operations.get_vod_genre_request(request, genre_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_vod_genre_response(response)))
  t.Done(data)
}

pub fn get_vod_likes(
  token,
  ondemand_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_vod_likes_request(
      request,
      ondemand_id,
      direction,
      filter,
      page,
      per_page,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_vod_likes_response(response)))
  t.Done(data)
}

pub fn remove_videos_from_live_event_altone(token, live_event_id, data) {
  let request = base_request(token)
  let request =
    operations.remove_videos_from_live_event_altone_request(
      request,
      live_event_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.remove_videos_from_live_event_altone_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn add_videos_to_live_event_altone(token, live_event_id, data) {
  let request = base_request(token)
  let request =
    operations.add_videos_to_live_event_altone_request(
      request,
      live_event_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_videos_to_live_event_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_videos_altone(
  token,
  live_event_id,
  containing_uri containing_uri,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_live_event_videos_altone_request(
      request,
      live_event_id,
      containing_uri,
      direction,
      filter,
      filter_embeddable,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_videos_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_channel_subscribers(
  token,
  channel_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_channel_subscribers_request(
      request,
      channel_id,
      direction,
      filter,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_channel_subscribers_response(response)),
  )
  t.Done(data)
}

pub fn update_live_event_altone(token, live_event_id) {
  let request = base_request(token)
  let request =
    operations.update_live_event_altone_request(request, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_live_event_altone_response(response)),
  )
  t.Done(data)
}

pub fn delete_live_event_altone(token, live_event_id) {
  let request = base_request(token)
  let request =
    operations.delete_live_event_altone_request(request, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_live_event_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_altone(token, live_event_id, password password) {
  let request = base_request(token)
  let request =
    operations.get_live_event_altone_request(request, live_event_id, password)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_appearances(
  token,
  user_id,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_appearances_request(
      request,
      user_id,
      direction,
      filter,
      filter_embeddable,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_appearances_response(response)),
  )
  t.Done(data)
}

pub fn get_video_likes_altone(
  token,
  channel_id,
  video_id,
  direction direction,
  page page,
  per_page per_page,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_video_likes_altone_request(
      request,
      channel_id,
      video_id,
      direction,
      page,
      per_page,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_video_likes_altone_response(response)),
  )
  t.Done(data)
}

pub fn edit_user(token, user_id) {
  let request = base_request(token)
  let request = operations.edit_user_request(request, user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.edit_user_response(response)))
  t.Done(data)
}

pub fn get_user(token, user_id) {
  let request = base_request(token)
  let request = operations.get_user_request(request, user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_user_response(response)))
  t.Done(data)
}

pub fn check_category_for_video(token, category, video_id) {
  let request = base_request(token)
  let request =
    operations.check_category_for_video_request(request, category, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_category_for_video_response(response)),
  )
  t.Done(data)
}

pub fn delete_group(token, group_id) {
  let request = base_request(token)
  let request = operations.delete_group_request(request, group_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_group_response(response)))
  t.Done(data)
}

pub fn get_group(token, group_id) {
  let request = base_request(token)
  let request = operations.get_group_request(request, group_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_group_response(response)))
  t.Done(data)
}

pub fn set_live_event_whitelist_alt2(token, live_event_id, data) {
  let request = base_request(token)
  let request =
    operations.set_live_event_whitelist_alt2_request(
      request,
      live_event_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.set_live_event_whitelist_alt2_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_whitelist_alt2(token, live_event_id) {
  let request = base_request(token)
  let request =
    operations.get_live_event_whitelist_alt2_request(request, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_whitelist_alt2_response(response)),
  )
  t.Done(data)
}

pub fn get_portfolios_altone(
  token,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_portfolios_altone_request(
      request,
      direction,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_portfolios_altone_response(response)),
  )
  t.Done(data)
}

pub fn check_if_user_owns_video_altone(token, video_id) {
  let request = base_request(token)
  let request =
    operations.check_if_user_owns_video_altone_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_if_user_owns_video_altone_response(response)),
  )
  t.Done(data)
}

pub fn edit_live_event_thumbnail_altone(token, live_event_id, thumbnail_id) {
  let request = base_request(token)
  let request =
    operations.edit_live_event_thumbnail_altone_request(
      request,
      live_event_id,
      thumbnail_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_live_event_thumbnail_altone_response(response)),
  )
  t.Done(data)
}

pub fn delete_live_event_thumbnail_altone(token, live_event_id, thumbnail_id) {
  let request = base_request(token)
  let request =
    operations.delete_live_event_thumbnail_altone_request(
      request,
      live_event_id,
      thumbnail_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_live_event_thumbnail_altone_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn get_live_event_thumbnail_altone(token, live_event_id, thumbnail_id) {
  let request = base_request(token)
  let request =
    operations.get_live_event_thumbnail_altone_request(
      request,
      live_event_id,
      thumbnail_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_thumbnail_altone_response(response)),
  )
  t.Done(data)
}

pub fn delete_video_from_vod(token, ondemand_id, video_id) {
  let request = base_request(token)
  let request =
    operations.delete_video_from_vod_request(request, ondemand_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_video_from_vod_response(response)),
  )
  t.Done(data)
}

pub fn add_video_to_vod(token, ondemand_id, video_id) {
  let request = base_request(token)
  let request =
    operations.add_video_to_vod_request(request, ondemand_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_video_to_vod_response(response)),
  )
  t.Done(data)
}

pub fn get_vod_video(token, ondemand_id, video_id) {
  let request = base_request(token)
  let request = operations.get_vod_video_request(request, ondemand_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_vod_video_response(response)))
  t.Done(data)
}

pub fn unlike_video(token, user_id, video_id) {
  let request = base_request(token)
  let request = operations.unlike_video_request(request, user_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.unlike_video_response(response)))
  t.Done(data)
}

pub fn like_video(token, user_id, video_id) {
  let request = base_request(token)
  let request = operations.like_video_request(request, user_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.like_video_response(response)))
  t.Done(data)
}

pub fn check_if_user_liked_video(token, user_id, video_id) {
  let request = base_request(token)
  let request =
    operations.check_if_user_liked_video_request(request, user_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_if_user_liked_video_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_video(token, user_id, live_event_id, video_id) {
  let request = base_request(token)
  let request =
    operations.get_live_event_video_request(
      request,
      user_id,
      live_event_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_video_response(response)),
  )
  t.Done(data)
}

pub fn create_picture(token, user_id) {
  let request = base_request(token)
  let request = operations.create_picture_request(request, user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.create_picture_response(response)))
  t.Done(data)
}

pub fn get_pictures(token, user_id, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.get_pictures_request(request, user_id, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_pictures_response(response)))
  t.Done(data)
}

pub fn list_payment_methods(
  token,
  data,
  cardmember_name cardmember_name,
  page page,
  per_page per_page,
  show_disabled show_disabled,
) {
  let request = base_request(token)
  let request =
    operations.list_payment_methods_request(
      request,
      data,
      cardmember_name,
      page,
      per_page,
      show_disabled,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_payment_methods_response(response)),
  )
  t.Done(data)
}

pub fn create_live_event_thumbnail_altone(token, live_event_id) {
  let request = base_request(token)
  let request =
    operations.create_live_event_thumbnail_altone_request(
      request,
      live_event_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_live_event_thumbnail_altone_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn get_live_event_thumbnails_altone(token, live_event_id) {
  let request = base_request(token)
  let request =
    operations.get_live_event_thumbnails_altone_request(request, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_thumbnails_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_unsaved_chapter_thumbnail(token, video_id, uid) {
  let request = base_request(token)
  let request =
    operations.get_unsaved_chapter_thumbnail_request(request, video_id, uid)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_unsaved_chapter_thumbnail_response(response)),
  )
  t.Done(data)
}

pub fn set_video_as_showcase_featured_alt2(token, album_id, video_id) {
  let request = base_request(token)
  let request =
    operations.set_video_as_showcase_featured_alt2_request(
      request,
      album_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.set_video_as_showcase_featured_alt2_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn delete_from_watch_history(token, video_id) {
  let request = base_request(token)
  let request = operations.delete_from_watch_history_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_from_watch_history_response(response)),
  )
  t.Done(data)
}

pub fn add_video_credit_altone(token, channel_id, video_id) {
  let request = base_request(token)
  let request =
    operations.add_video_credit_altone_request(request, channel_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_video_credit_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_video_credits_altone(
  token,
  channel_id,
  video_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_video_credits_altone_request(
      request,
      channel_id,
      video_id,
      direction,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_video_credits_altone_response(response)),
  )
  t.Done(data)
}

pub fn remove_video_from_showcase(token, user_id, album_id, video_id) {
  let request = base_request(token)
  let request =
    operations.remove_video_from_showcase_request(
      request,
      user_id,
      album_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.remove_video_from_showcase_response(response)),
  )
  t.Done(data)
}

pub fn add_video_to_showcase(token, user_id, album_id, video_id) {
  let request = base_request(token)
  let request =
    operations.add_video_to_showcase_request(
      request,
      user_id,
      album_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_video_to_showcase_response(response)),
  )
  t.Done(data)
}

pub fn get_showcase_video(token, user_id, album_id, video_id, password password) {
  let request = base_request(token)
  let request =
    operations.get_showcase_video_request(
      request,
      user_id,
      album_id,
      video_id,
      password,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_showcase_video_response(response)),
  )
  t.Done(data)
}

pub fn add_channel_categories(token, channel_id, data) {
  let request = base_request(token)
  let request =
    operations.add_channel_categories_request(request, channel_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_channel_categories_response(response)),
  )
  t.Done(data)
}

pub fn get_channel_categories(token, channel_id) {
  let request = base_request(token)
  let request = operations.get_channel_categories_request(request, channel_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_channel_categories_response(response)),
  )
  t.Done(data)
}

pub fn get_audio_tracks(token, video_id, version_id) {
  let request = base_request(token)
  let request =
    operations.get_audio_tracks_request(request, video_id, version_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_audio_tracks_response(response)),
  )
  t.Done(data)
}

pub fn delete_live_events(token, user_id) {
  let request = base_request(token)
  let request = operations.delete_live_events_request(request, user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_live_events_response(response)),
  )
  t.Done(data)
}

pub fn create_live_event(token, user_id) {
  let request = base_request(token)
  let request = operations.create_live_event_request(request, user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_live_event_response(response)),
  )
  t.Done(data)
}

pub fn get_live_events(
  token,
  user_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
  type_ type_,
) {
  let request = base_request(token)
  let request =
    operations.get_live_events_request(
      request,
      user_id,
      direction,
      filter,
      page,
      per_page,
      query,
      sort,
      type_,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_events_response(response)),
  )
  t.Done(data)
}

pub fn edit_video_version(token, video_id, version_id) {
  let request = base_request(token)
  let request =
    operations.edit_video_version_request(request, video_id, version_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_video_version_response(response)),
  )
  t.Done(data)
}

pub fn delete_video_version(token, video_id, version_id) {
  let request = base_request(token)
  let request =
    operations.delete_video_version_request(request, video_id, version_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_video_version_response(response)),
  )
  t.Done(data)
}

pub fn get_video_version(token, video_id, version_id) {
  let request = base_request(token)
  let request =
    operations.get_video_version_request(request, video_id, version_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_video_version_response(response)),
  )
  t.Done(data)
}

pub fn get_user_groups(
  token,
  user_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_user_groups_request(
      request,
      user_id,
      direction,
      filter,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_user_groups_response(response)),
  )
  t.Done(data)
}

pub fn create_custom_logo_altone(token) {
  let request = base_request(token)
  let request = operations.create_custom_logo_altone_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_custom_logo_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_custom_logos_altone(token, page page, per_page per_page, sizes sizes) {
  let request = base_request(token)
  let request =
    operations.get_custom_logos_altone_request(request, page, per_page, sizes)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_custom_logos_altone_response(response)),
  )
  t.Done(data)
}

pub fn create_animated_thumbset(token, video_id) {
  let request = base_request(token)
  let request = operations.create_animated_thumbset_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_animated_thumbset_response(response)),
  )
  t.Done(data)
}

pub fn get_all_animated_thumbset(token, video_id, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.get_all_animated_thumbset_request(
      request,
      video_id,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_all_animated_thumbset_response(response)),
  )
  t.Done(data)
}

pub fn unsubscribe_from_category_altone(token, category) {
  let request = base_request(token)
  let request =
    operations.unsubscribe_from_category_altone_request(request, category)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.unsubscribe_from_category_altone_response(response)),
  )
  t.Done(data)
}

pub fn subscribe_to_category_altone(token, category) {
  let request = base_request(token)
  let request =
    operations.subscribe_to_category_altone_request(request, category)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.subscribe_to_category_altone_response(response)),
  )
  t.Done(data)
}

pub fn check_if_user_subscribed_to_category_altone(token, category) {
  let request = base_request(token)
  let request =
    operations.check_if_user_subscribed_to_category_altone_request(
      request,
      category,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.check_if_user_subscribed_to_category_altone_response(response),
    ),
  )
  t.Done(data)
}

pub fn get_portfolio_videos(
  token,
  user_id,
  portfolio_id,
  containing_uri containing_uri,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_portfolio_videos_request(
      request,
      user_id,
      portfolio_id,
      containing_uri,
      filter,
      filter_embeddable,
      page,
      per_page,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_portfolio_videos_response(response)),
  )
  t.Done(data)
}

pub fn get_endpoints(token, openapi openapi, version version) {
  let request = base_request(token)
  let request = operations.get_endpoints_request(request, openapi, version)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_endpoints_response(response)))
  t.Done(data)
}

pub fn activate_live_event_altone(token, live_event_id) {
  let request = base_request(token)
  let request =
    operations.activate_live_event_altone_request(request, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activate_live_event_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_available_video_groups(token, video_id) {
  let request = base_request(token)
  let request = operations.get_available_video_groups_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_available_video_groups_response(response)),
  )
  t.Done(data)
}

pub fn unsubscribe_from_channel(token, user_id, channel_id) {
  let request = base_request(token)
  let request =
    operations.unsubscribe_from_channel_request(request, user_id, channel_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.unsubscribe_from_channel_response(response)),
  )
  t.Done(data)
}

pub fn subscribe_to_channel(token, user_id, channel_id) {
  let request = base_request(token)
  let request =
    operations.subscribe_to_channel_request(request, user_id, channel_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.subscribe_to_channel_response(response)),
  )
  t.Done(data)
}

pub fn check_if_user_subscribed_to_channel(token, user_id, channel_id) {
  let request = base_request(token)
  let request =
    operations.check_if_user_subscribed_to_channel_request(
      request,
      user_id,
      channel_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_if_user_subscribed_to_channel_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn check_if_vod_was_purchased_altone(token, ondemand_id) {
  let request = base_request(token)
  let request =
    operations.check_if_vod_was_purchased_altone_request(request, ondemand_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_if_vod_was_purchased_altone_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn edit_project_altone(token, project_id, data) {
  let request = base_request(token)
  let request =
    operations.edit_project_altone_request(request, project_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_project_altone_response(response)),
  )
  t.Done(data)
}

pub fn delete_project_altone(
  token,
  project_id,
  should_delete_clips should_delete_clips,
) {
  let request = base_request(token)
  let request =
    operations.delete_project_altone_request(
      request,
      project_id,
      should_delete_clips,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_project_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_project_altone(token, project_id) {
  let request = base_request(token)
  let request = operations.get_project_altone_request(request, project_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_project_altone_response(response)),
  )
  t.Done(data)
}

pub fn create_live_event_destination_altone(token, user_id, live_event_id) {
  let request = base_request(token)
  let request =
    operations.create_live_event_destination_altone_request(
      request,
      user_id,
      live_event_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_live_event_destination_altone_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn get_live_event_destinations_altone(token, user_id, live_event_id) {
  let request = base_request(token)
  let request =
    operations.get_live_event_destinations_altone_request(
      request,
      user_id,
      live_event_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_destinations_altone_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn replace_videos_in_showcase_alt2(token, album_id, data) {
  let request = base_request(token)
  let request =
    operations.replace_videos_in_showcase_alt2_request(request, album_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.replace_videos_in_showcase_alt2_response(response)),
  )
  t.Done(data)
}

pub fn get_showcase_videos_alt2(
  token,
  album_id,
  containing_uri containing_uri,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  password password,
  per_page per_page,
  query query,
  sort sort,
  weak_search weak_search,
) {
  let request = base_request(token)
  let request =
    operations.get_showcase_videos_alt2_request(
      request,
      album_id,
      containing_uri,
      direction,
      filter,
      filter_embeddable,
      page,
      password,
      per_page,
      query,
      sort,
      weak_search,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_showcase_videos_alt2_response(response)),
  )
  t.Done(data)
}

pub fn delete_video_from_watch_later_altone(token, video_id) {
  let request = base_request(token)
  let request =
    operations.delete_video_from_watch_later_altone_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_video_from_watch_later_altone_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn add_video_to_watch_later_altone(token, video_id) {
  let request = base_request(token)
  let request =
    operations.add_video_to_watch_later_altone_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_video_to_watch_later_altone_response(response)),
  )
  t.Done(data)
}

pub fn check_watch_later_queue_altone(token, video_id) {
  let request = base_request(token)
  let request =
    operations.check_watch_later_queue_altone_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_watch_later_queue_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_embed_preset_videos_altone(
  token,
  preset_id,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.get_embed_preset_videos_altone_request(
      request,
      preset_id,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_embed_preset_videos_altone_response(response)),
  )
  t.Done(data)
}

pub fn set_channel_privacy_users(token, channel_id) {
  let request = base_request(token)
  let request =
    operations.set_channel_privacy_users_request(request, channel_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.set_channel_privacy_users_response(response)),
  )
  t.Done(data)
}

pub fn get_channel_privacy_users(
  token,
  channel_id,
  direction direction,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.get_channel_privacy_users_request(
      request,
      channel_id,
      direction,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_channel_privacy_users_response(response)),
  )
  t.Done(data)
}

pub fn get_vod_season_videos(
  token,
  ondemand_id,
  season_id,
  filter filter,
  page page,
  per_page per_page,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_vod_season_videos_request(
      request,
      ondemand_id,
      season_id,
      filter,
      page,
      per_page,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_vod_season_videos_response(response)),
  )
  t.Done(data)
}

pub fn edit_picture(token, user_id, portraitset_id) {
  let request = base_request(token)
  let request =
    operations.edit_picture_request(request, user_id, portraitset_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.edit_picture_response(response)))
  t.Done(data)
}

pub fn delete_picture(token, user_id, portraitset_id) {
  let request = base_request(token)
  let request =
    operations.delete_picture_request(request, user_id, portraitset_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_picture_response(response)))
  t.Done(data)
}

pub fn get_picture(token, user_id, portraitset_id) {
  let request = base_request(token)
  let request = operations.get_picture_request(request, user_id, portraitset_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_picture_response(response)))
  t.Done(data)
}

pub fn get_followers_altone(
  token,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_followers_altone_request(
      request,
      direction,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_followers_altone_response(response)),
  )
  t.Done(data)
}

pub fn remove_videos_from_live_event_alt2(token, live_event_id, data) {
  let request = base_request(token)
  let request =
    operations.remove_videos_from_live_event_alt2_request(
      request,
      live_event_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.remove_videos_from_live_event_alt2_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn add_videos_to_live_event_alt2(token, live_event_id, data) {
  let request = base_request(token)
  let request =
    operations.add_videos_to_live_event_alt2_request(
      request,
      live_event_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_videos_to_live_event_alt2_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_videos_alt2(
  token,
  live_event_id,
  containing_uri containing_uri,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_live_event_videos_alt2_request(
      request,
      live_event_id,
      containing_uri,
      direction,
      filter,
      filter_embeddable,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_videos_alt2_response(response)),
  )
  t.Done(data)
}

pub fn get_available_destinations_altone(token) {
  let request = base_request(token)
  let request = operations.get_available_destinations_altone_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_available_destinations_altone_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn remove_videos_from_project(
  token,
  user_id,
  project_id,
  should_delete_clips should_delete_clips,
  uris uris,
) {
  let request = base_request(token)
  let request =
    operations.remove_videos_from_project_request(
      request,
      user_id,
      project_id,
      should_delete_clips,
      uris,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.remove_videos_from_project_response(response)),
  )
  t.Done(data)
}

pub fn add_videos_to_project(token, user_id, project_id, uris uris) {
  let request = base_request(token)
  let request =
    operations.add_videos_to_project_request(request, user_id, project_id, uris)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_videos_to_project_response(response)),
  )
  t.Done(data)
}

pub fn get_project_videos(
  token,
  user_id,
  project_id,
  direction direction,
  filter_tag filter_tag,
  filter_tag_all_of filter_tag_all_of,
  filter_tag_exclude filter_tag_exclude,
  include_subfolders include_subfolders,
  page page,
  per_page per_page,
  query query,
  query_fields query_fields,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_project_videos_request(
      request,
      user_id,
      project_id,
      direction,
      filter_tag,
      filter_tag_all_of,
      filter_tag_exclude,
      include_subfolders,
      page,
      per_page,
      query,
      query_fields,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_project_videos_response(response)),
  )
  t.Done(data)
}

pub fn developer_tutorial(token) {
  let request = base_request(token)
  let request = operations.developer_tutorial_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.developer_tutorial_response(response)),
  )
  t.Done(data)
}

pub fn add_tags_to_channel(token, channel_id) {
  let request = base_request(token)
  let request = operations.add_tags_to_channel_request(request, channel_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_tags_to_channel_response(response)),
  )
  t.Done(data)
}

pub fn get_channel_tags(token, channel_id) {
  let request = base_request(token)
  let request = operations.get_channel_tags_request(request, channel_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_channel_tags_response(response)),
  )
  t.Done(data)
}

pub fn get_channel_subscriptions(
  token,
  user_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_channel_subscriptions_request(
      request,
      user_id,
      direction,
      filter,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_channel_subscriptions_response(response)),
  )
  t.Done(data)
}

pub fn get_portfolio_altone(token, portfolio_id) {
  let request = base_request(token)
  let request = operations.get_portfolio_altone_request(request, portfolio_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_portfolio_altone_response(response)),
  )
  t.Done(data)
}

pub fn create_video_custom_logo(token, video_id) {
  let request = base_request(token)
  let request = operations.create_video_custom_logo_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_video_custom_logo_response(response)),
  )
  t.Done(data)
}

pub fn remove_videos_from_channel(token, channel_id, data) {
  let request = base_request(token)
  let request =
    operations.remove_videos_from_channel_request(request, channel_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.remove_videos_from_channel_response(response)),
  )
  t.Done(data)
}

pub fn add_videos_to_channel(token, channel_id, data) {
  let request = base_request(token)
  let request =
    operations.add_videos_to_channel_request(request, channel_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_videos_to_channel_response(response)),
  )
  t.Done(data)
}

pub fn get_channel_videos(
  token,
  channel_id,
  containing_uri containing_uri,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_channel_videos_request(
      request,
      channel_id,
      containing_uri,
      direction,
      filter,
      filter_embeddable,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_channel_videos_response(response)),
  )
  t.Done(data)
}

pub fn get_group_members(
  token,
  group_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_group_members_request(
      request,
      group_id,
      direction,
      filter,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_group_members_response(response)),
  )
  t.Done(data)
}

pub fn set_live_event_whitelist_altone(token, live_event_id, data) {
  let request = base_request(token)
  let request =
    operations.set_live_event_whitelist_altone_request(
      request,
      live_event_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.set_live_event_whitelist_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_whitelist_altone(token, live_event_id) {
  let request = base_request(token)
  let request =
    operations.get_live_event_whitelist_altone_request(request, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_whitelist_altone_response(response)),
  )
  t.Done(data)
}

pub fn create_showcase_custom_thumb(token, user_id, album_id) {
  let request = base_request(token)
  let request =
    operations.create_showcase_custom_thumb_request(request, user_id, album_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_showcase_custom_thumb_response(response)),
  )
  t.Done(data)
}

pub fn get_showcase_custom_thumbs(
  token,
  user_id,
  album_id,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.get_showcase_custom_thumbs_request(
      request,
      user_id,
      album_id,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_showcase_custom_thumbs_response(response)),
  )
  t.Done(data)
}

pub fn get_content_ratings(token) {
  let request = base_request(token)
  let request = operations.get_content_ratings_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_content_ratings_response(response)),
  )
  t.Done(data)
}

pub fn create_embed_presets_altone(token) {
  let request = base_request(token)
  let request = operations.create_embed_presets_altone_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_embed_presets_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_embed_presets_altone(token, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.get_embed_presets_altone_request(request, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_embed_presets_altone_response(response)),
  )
  t.Done(data)
}

pub fn create_showcase_altone(token) {
  let request = base_request(token)
  let request = operations.create_showcase_altone_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_showcase_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_showcases_altone(
  token,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_showcases_altone_request(
      request,
      direction,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_showcases_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_languages(token, filter filter, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.get_languages_request(request, filter, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_languages_response(response)))
  t.Done(data)
}

pub fn get_team_role_information(token, user_id) {
  let request = base_request(token)
  let request = operations.get_team_role_information_request(request, user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_team_role_information_response(response)),
  )
  t.Done(data)
}

pub fn get_categories(
  token,
  direction direction,
  page page,
  per_page per_page,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_categories_request(request, direction, page, per_page, sort)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_categories_response(response)))
  t.Done(data)
}

pub fn edit_video(token, video_id) {
  let request = base_request(token)
  let request = operations.edit_video_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.edit_video_response(response)))
  t.Done(data)
}

pub fn delete_video(token, video_id) {
  let request = base_request(token)
  let request = operations.delete_video_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_video_response(response)))
  t.Done(data)
}

pub fn get_video(token, video_id, time_links time_links) {
  let request = base_request(token)
  let request = operations.get_video_request(request, video_id, time_links)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_video_response(response)))
  t.Done(data)
}

pub fn delete_video_tag(token, video_id, word) {
  let request = base_request(token)
  let request = operations.delete_video_tag_request(request, video_id, word)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_video_tag_response(response)),
  )
  t.Done(data)
}

pub fn add_video_tag(token, video_id, word) {
  let request = base_request(token)
  let request = operations.add_video_tag_request(request, video_id, word)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.add_video_tag_response(response)))
  t.Done(data)
}

pub fn check_video_for_tag(token, video_id, word) {
  let request = base_request(token)
  let request = operations.check_video_for_tag_request(request, video_id, word)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_video_for_tag_response(response)),
  )
  t.Done(data)
}

pub fn get_available_video_channels(token, video_id) {
  let request = base_request(token)
  let request =
    operations.get_available_video_channels_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_available_video_channels_response(response)),
  )
  t.Done(data)
}

pub fn get_user_analytics(
  token,
  user_id,
  dimension dimension,
  direction direction,
  filter_content filter_content,
  filter_countries filter_countries,
  filter_device_types filter_device_types,
  filter_embed_domains filter_embed_domains,
  filter_regions filter_regions,
  filter_streaming_types filter_streaming_types,
  from from,
  page page,
  per_page per_page,
  sort sort,
  time_interval time_interval,
  to to,
) {
  let request = base_request(token)
  let request =
    operations.get_user_analytics_request(
      request,
      user_id,
      dimension,
      direction,
      filter_content,
      filter_countries,
      filter_device_types,
      filter_embed_domains,
      filter_regions,
      filter_streaming_types,
      from,
      page,
      per_page,
      sort,
      time_interval,
      to,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_user_analytics_response(response)),
  )
  t.Done(data)
}

pub fn get_available_showcase_videos(
  token,
  album_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_available_showcase_videos_request(
      request,
      album_id,
      direction,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_available_showcase_videos_response(response)),
  )
  t.Done(data)
}

pub fn toggle_rle_low_latency(token, user_id, live_event_id) {
  let request = base_request(token)
  let request =
    operations.toggle_rle_low_latency_request(request, user_id, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.toggle_rle_low_latency_response(response)),
  )
  t.Done(data)
}

pub fn create_chapter(token, video_id) {
  let request = base_request(token)
  let request = operations.create_chapter_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.create_chapter_response(response)))
  t.Done(data)
}

pub fn get_chapters(token, video_id, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.get_chapters_request(request, video_id, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_chapters_response(response)))
  t.Done(data)
}

pub fn get_cc_licenses(token, page page, per_page per_page) {
  let request = base_request(token)
  let request = operations.get_cc_licenses_request(request, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_cc_licenses_response(response)),
  )
  t.Done(data)
}

pub fn create_chapter_thumbnail_or_upload_link(
  token,
  video_id,
  chapter_id,
  data,
) {
  let request = base_request(token)
  let request =
    operations.create_chapter_thumbnail_or_upload_link_request(
      request,
      video_id,
      chapter_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_chapter_thumbnail_or_upload_link_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn get_chapter_thumbnails(token, video_id, chapter_id) {
  let request = base_request(token)
  let request =
    operations.get_chapter_thumbnails_request(request, video_id, chapter_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_chapter_thumbnails_response(response)),
  )
  t.Done(data)
}

pub fn delete_vod_region(token, ondemand_id, country) {
  let request = base_request(token)
  let request =
    operations.delete_vod_region_request(request, ondemand_id, country)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_vod_region_response(response)),
  )
  t.Done(data)
}

pub fn add_vod_region(token, ondemand_id, country) {
  let request = base_request(token)
  let request = operations.add_vod_region_request(request, ondemand_id, country)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.add_vod_region_response(response)))
  t.Done(data)
}

pub fn get_vod_region(token, ondemand_id, country) {
  let request = base_request(token)
  let request = operations.get_vod_region_request(request, ondemand_id, country)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_vod_region_response(response)))
  t.Done(data)
}

pub fn create_live_event_thumbnail_alt2(token, live_event_id) {
  let request = base_request(token)
  let request =
    operations.create_live_event_thumbnail_alt2_request(request, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_live_event_thumbnail_alt2_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_thumbnails_alt2(token, live_event_id) {
  let request = base_request(token)
  let request =
    operations.get_live_event_thumbnails_alt2_request(request, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_thumbnails_alt2_response(response)),
  )
  t.Done(data)
}

pub fn get_genre_vods(
  token,
  genre_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_genre_vods_request(
      request,
      genre_id,
      direction,
      filter,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_genre_vods_response(response)))
  t.Done(data)
}

pub fn delete_token(token) {
  let request = base_request(token)
  let request = operations.delete_token_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_token_response(response)))
  t.Done(data)
}

pub fn get_regions(token) {
  let request = base_request(token)
  let request = operations.get_regions_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_regions_response(response)))
  t.Done(data)
}

pub fn get_vod_purchases(
  token,
  user_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_vod_purchases_request(
      request,
      user_id,
      direction,
      filter,
      page,
      per_page,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_vod_purchases_response(response)),
  )
  t.Done(data)
}

pub fn delete_custom_logo_altone(token, logo_id) {
  let request = base_request(token)
  let request = operations.delete_custom_logo_altone_request(request, logo_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_custom_logo_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_custom_logo_altone(token, logo_id) {
  let request = base_request(token)
  let request = operations.get_custom_logo_altone_request(request, logo_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_custom_logo_altone_response(response)),
  )
  t.Done(data)
}

pub fn delete_video_privacy_domain(token, video_id, domain) {
  let request = base_request(token)
  let request =
    operations.delete_video_privacy_domain_request(request, video_id, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_video_privacy_domain_response(response)),
  )
  t.Done(data)
}

pub fn add_video_privacy_domain(token, video_id, domain) {
  let request = base_request(token)
  let request =
    operations.add_video_privacy_domain_request(request, video_id, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_video_privacy_domain_response(response)),
  )
  t.Done(data)
}

pub fn follow_users_altone(token, data) {
  let request = base_request(token)
  let request = operations.follow_users_altone_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.follow_users_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_user_following_altone(
  token,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_user_following_altone_request(
      request,
      direction,
      filter,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_user_following_altone_response(response)),
  )
  t.Done(data)
}

pub fn activate_live_event_alt2(token, live_event_id) {
  let request = base_request(token)
  let request =
    operations.activate_live_event_alt2_request(request, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activate_live_event_alt2_response(response)),
  )
  t.Done(data)
}

pub fn get_category(token, category) {
  let request = base_request(token)
  let request = operations.get_category_request(request, category)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_category_response(response)))
  t.Done(data)
}

pub fn get_vod_seasons(
  token,
  ondemand_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_vod_seasons_request(
      request,
      ondemand_id,
      direction,
      filter,
      page,
      per_page,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_vod_seasons_response(response)),
  )
  t.Done(data)
}

pub fn get_videos_with_tag(
  token,
  word,
  direction direction,
  page page,
  per_page per_page,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_videos_with_tag_request(
      request,
      word,
      direction,
      page,
      per_page,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_videos_with_tag_response(response)),
  )
  t.Done(data)
}

pub fn add_or_remove_multiple_albums(token, video_id) {
  let request = base_request(token)
  let request =
    operations.add_or_remove_multiple_albums_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_or_remove_multiple_albums_response(response)),
  )
  t.Done(data)
}

pub fn get_video_albums(token, video_id, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.get_video_albums_request(request, video_id, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_video_albums_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_m3u8_playback(
  token,
  user_id,
  live_event_id,
  max_fps_fhd max_fps_fhd,
  ttl ttl,
) {
  let request = base_request(token)
  let request =
    operations.get_live_event_m3u8_playback_request(
      request,
      user_id,
      live_event_id,
      max_fps_fhd,
      ttl,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_m3u8_playback_response(response)),
  )
  t.Done(data)
}

pub fn create_vod_altone(token, data) {
  let request = base_request(token)
  let request = operations.create_vod_altone_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_vod_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_user_vods_altone(
  token,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_user_vods_altone_request(
      request,
      direction,
      filter,
      page,
      per_page,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_user_vods_altone_response(response)),
  )
  t.Done(data)
}

pub fn edit_live_event_auto_cc(token, user_id, live_event_id) {
  let request = base_request(token)
  let request =
    operations.edit_live_event_auto_cc_request(request, user_id, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_live_event_auto_cc_response(response)),
  )
  t.Done(data)
}

pub fn edit_user_altone(token) {
  let request = base_request(token)
  let request = operations.edit_user_altone_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_user_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_user_altone(token) {
  let request = base_request(token)
  let request = operations.get_user_altone_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_user_altone_response(response)),
  )
  t.Done(data)
}

pub fn edit_vod(token, ondemand_id) {
  let request = base_request(token)
  let request = operations.edit_vod_request(request, ondemand_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.edit_vod_response(response)))
  t.Done(data)
}

pub fn delete_vod_draft(token, ondemand_id) {
  let request = base_request(token)
  let request = operations.delete_vod_draft_request(request, ondemand_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_vod_draft_response(response)),
  )
  t.Done(data)
}

pub fn get_vod(token, ondemand_id) {
  let request = base_request(token)
  let request = operations.get_vod_request(request, ondemand_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_vod_response(response)))
  t.Done(data)
}

pub fn get_portfolios(
  token,
  user_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_portfolios_request(
      request,
      user_id,
      direction,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_portfolios_response(response)))
  t.Done(data)
}

pub fn delete_channel_privacy_user(token, channel_id, user_id) {
  let request = base_request(token)
  let request =
    operations.delete_channel_privacy_user_request(request, channel_id, user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_channel_privacy_user_response(response)),
  )
  t.Done(data)
}

pub fn set_channel_privacy_user(token, channel_id, user_id) {
  let request = base_request(token)
  let request =
    operations.set_channel_privacy_user_request(request, channel_id, user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.set_channel_privacy_user_response(response)),
  )
  t.Done(data)
}

pub fn get_appearances_altone(
  token,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_appearances_altone_request(
      request,
      direction,
      filter,
      filter_embeddable,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_appearances_altone_response(response)),
  )
  t.Done(data)
}

pub fn search_videos(
  token,
  direction direction,
  filter filter,
  links links,
  page page,
  per_page per_page,
  query query,
  sort sort,
  uris uris,
) {
  let request = base_request(token)
  let request =
    operations.search_videos_request(
      request,
      direction,
      filter,
      links,
      page,
      per_page,
      query,
      sort,
      uris,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.search_videos_response(response)))
  t.Done(data)
}

pub fn unfollow_user_altone(token, follow_user_id) {
  let request = base_request(token)
  let request = operations.unfollow_user_altone_request(request, follow_user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.unfollow_user_altone_response(response)),
  )
  t.Done(data)
}

pub fn follow_user_altone(token, follow_user_id) {
  let request = base_request(token)
  let request = operations.follow_user_altone_request(request, follow_user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.follow_user_altone_response(response)),
  )
  t.Done(data)
}

pub fn check_if_user_is_following_altone(token, follow_user_id) {
  let request = base_request(token)
  let request =
    operations.check_if_user_is_following_altone_request(
      request,
      follow_user_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_if_user_is_following_altone_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn update_live_event(token, user_id, live_event_id) {
  let request = base_request(token)
  let request =
    operations.update_live_event_request(request, user_id, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_live_event_response(response)),
  )
  t.Done(data)
}

pub fn delete_live_event(token, user_id, live_event_id) {
  let request = base_request(token)
  let request =
    operations.delete_live_event_request(request, user_id, live_event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_live_event_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event(token, user_id, live_event_id, password password) {
  let request = base_request(token)
  let request =
    operations.get_live_event_request(request, user_id, live_event_id, password)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_live_event_response(response)))
  t.Done(data)
}

pub fn edit_embed_preset(token, user_id, preset_id) {
  let request = base_request(token)
  let request =
    operations.edit_embed_preset_request(request, user_id, preset_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_embed_preset_response(response)),
  )
  t.Done(data)
}

pub fn get_embed_preset(token, user_id, preset_id) {
  let request = base_request(token)
  let request = operations.get_embed_preset_request(request, user_id, preset_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_embed_preset_response(response)),
  )
  t.Done(data)
}

pub fn end_live_event_alt2(token, live_event_id, clip_id clip_id) {
  let request = base_request(token)
  let request =
    operations.end_live_event_alt2_request(request, live_event_id, clip_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.end_live_event_alt2_response(response)),
  )
  t.Done(data)
}

pub fn delete_video_from_channel(token, channel_id, video_id) {
  let request = base_request(token)
  let request =
    operations.delete_video_from_channel_request(request, channel_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_video_from_channel_response(response)),
  )
  t.Done(data)
}

pub fn add_video_to_channel(token, channel_id, video_id) {
  let request = base_request(token)
  let request =
    operations.add_video_to_channel_request(request, channel_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_video_to_channel_response(response)),
  )
  t.Done(data)
}

pub fn get_channel_video(token, channel_id, video_id) {
  let request = base_request(token)
  let request =
    operations.get_channel_video_request(request, channel_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_channel_video_response(response)),
  )
  t.Done(data)
}

pub fn clip_trim(token, video_id, data) {
  let request = base_request(token)
  let request = operations.clip_trim_request(request, video_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.clip_trim_response(response)))
  t.Done(data)
}

pub fn leave_group(token, user_id, group_id) {
  let request = base_request(token)
  let request = operations.leave_group_request(request, user_id, group_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.leave_group_response(response)))
  t.Done(data)
}

pub fn join_group(token, user_id, group_id) {
  let request = base_request(token)
  let request = operations.join_group_request(request, user_id, group_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.join_group_response(response)))
  t.Done(data)
}

pub fn check_if_user_joined_group(token, user_id, group_id) {
  let request = base_request(token)
  let request =
    operations.check_if_user_joined_group_request(request, user_id, group_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_if_user_joined_group_response(response)),
  )
  t.Done(data)
}

pub fn edit_showcase(token, user_id, album_id) {
  let request = base_request(token)
  let request = operations.edit_showcase_request(request, user_id, album_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.edit_showcase_response(response)))
  t.Done(data)
}

pub fn delete_showcase(token, user_id, album_id) {
  let request = base_request(token)
  let request = operations.delete_showcase_request(request, user_id, album_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_showcase_response(response)),
  )
  t.Done(data)
}

pub fn get_showcase(token, user_id, album_id) {
  let request = base_request(token)
  let request = operations.get_showcase_request(request, user_id, album_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_showcase_response(response)))
  t.Done(data)
}

pub fn update_live_event_destination(token, destination_id) {
  let request = base_request(token)
  let request =
    operations.update_live_event_destination_request(request, destination_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_live_event_destination_response(response)),
  )
  t.Done(data)
}

pub fn delete_live_event_destination(token, destination_id) {
  let request = base_request(token)
  let request =
    operations.delete_live_event_destination_request(request, destination_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_live_event_destination_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_destination(token, destination_id) {
  let request = base_request(token)
  let request =
    operations.get_live_event_destination_request(request, destination_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_destination_response(response)),
  )
  t.Done(data)
}

pub fn get_feed_altone(
  token,
  offset offset,
  page page,
  per_page per_page,
  type_ type_,
) {
  let request = base_request(token)
  let request =
    operations.get_feed_altone_request(request, offset, page, per_page, type_)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_feed_altone_response(response)),
  )
  t.Done(data)
}

pub fn complete_streaming_upload(
  token,
  user_id,
  upload_id,
  signature signature,
  video_file_id video_file_id,
) {
  let request = base_request(token)
  let request =
    operations.complete_streaming_upload_request(
      request,
      user_id,
      upload_id,
      signature,
      video_file_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.complete_streaming_upload_response(response)),
  )
  t.Done(data)
}

pub fn get_upload_attempt(token, user_id, upload_id) {
  let request = base_request(token)
  let request =
    operations.get_upload_attempt_request(request, user_id, upload_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_upload_attempt_response(response)),
  )
  t.Done(data)
}

pub fn delete_animated_thumbset(token, video_id, picture_id) {
  let request = base_request(token)
  let request =
    operations.delete_animated_thumbset_request(request, video_id, picture_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_animated_thumbset_response(response)),
  )
  t.Done(data)
}

pub fn get_animated_thumbset(token, video_id, picture_id) {
  let request = base_request(token)
  let request =
    operations.get_animated_thumbset_request(request, video_id, picture_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_animated_thumbset_response(response)),
  )
  t.Done(data)
}

pub fn get_vod_genres(token) {
  let request = base_request(token)
  let request = operations.get_vod_genres_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_vod_genres_response(response)))
  t.Done(data)
}

pub fn remove_video_from_showcase_alt2(token, album_id, video_id) {
  let request = base_request(token)
  let request =
    operations.remove_video_from_showcase_alt2_request(
      request,
      album_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.remove_video_from_showcase_alt2_response(response)),
  )
  t.Done(data)
}

pub fn add_video_to_showcase_alt2(token, album_id, video_id) {
  let request = base_request(token)
  let request =
    operations.add_video_to_showcase_alt2_request(request, album_id, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_video_to_showcase_alt2_response(response)),
  )
  t.Done(data)
}

pub fn get_showcase_video_alt2(token, album_id, video_id, password password) {
  let request = base_request(token)
  let request =
    operations.get_showcase_video_alt2_request(
      request,
      album_id,
      video_id,
      password,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_showcase_video_alt2_response(response)),
  )
  t.Done(data)
}

pub fn edit_live_event_thumbnail(token, user_id, live_event_id, thumbnail_id) {
  let request = base_request(token)
  let request =
    operations.edit_live_event_thumbnail_request(
      request,
      user_id,
      live_event_id,
      thumbnail_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_live_event_thumbnail_response(response)),
  )
  t.Done(data)
}

pub fn delete_live_event_thumbnail(token, user_id, live_event_id, thumbnail_id) {
  let request = base_request(token)
  let request =
    operations.delete_live_event_thumbnail_request(
      request,
      user_id,
      live_event_id,
      thumbnail_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_live_event_thumbnail_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_thumbnail(token, user_id, live_event_id, thumbnail_id) {
  let request = base_request(token)
  let request =
    operations.get_live_event_thumbnail_request(
      request,
      user_id,
      live_event_id,
      thumbnail_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_thumbnail_response(response)),
  )
  t.Done(data)
}

pub fn exchange_auth_code(token) {
  let request = base_request(token)
  let request = operations.exchange_auth_code_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.exchange_auth_code_response(response)),
  )
  t.Done(data)
}

pub fn remove_video_from_project(token, user_id, project_id, video_id) {
  let request = base_request(token)
  let request =
    operations.remove_video_from_project_request(
      request,
      user_id,
      project_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.remove_video_from_project_response(response)),
  )
  t.Done(data)
}

pub fn add_video_to_project(token, user_id, project_id, video_id) {
  let request = base_request(token)
  let request =
    operations.add_video_to_project_request(
      request,
      user_id,
      project_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_video_to_project_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_video_alt2(token, live_event_id, video_id) {
  let request = base_request(token)
  let request =
    operations.get_live_event_video_alt2_request(
      request,
      live_event_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_video_alt2_response(response)),
  )
  t.Done(data)
}

pub fn get_watch_later_queue_altone(
  token,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_watch_later_queue_altone_request(
      request,
      direction,
      filter,
      filter_embeddable,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_watch_later_queue_altone_response(response)),
  )
  t.Done(data)
}

pub fn set_video_as_showcase_featured(token, user_id, album_id, video_id) {
  let request = base_request(token)
  let request =
    operations.set_video_as_showcase_featured_request(
      request,
      user_id,
      album_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.set_video_as_showcase_featured_response(response)),
  )
  t.Done(data)
}

pub fn delete_live_events_alt2(token) {
  let request = base_request(token)
  let request = operations.delete_live_events_alt2_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_live_events_alt2_response(response)),
  )
  t.Done(data)
}

pub fn create_live_event_alt2(token) {
  let request = base_request(token)
  let request = operations.create_live_event_alt2_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_live_event_alt2_response(response)),
  )
  t.Done(data)
}

pub fn get_live_events_alt2(
  token,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
  type_ type_,
) {
  let request = base_request(token)
  let request =
    operations.get_live_events_alt2_request(
      request,
      direction,
      filter,
      page,
      per_page,
      query,
      sort,
      type_,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_events_alt2_response(response)),
  )
  t.Done(data)
}

pub fn get_category_subscriptions_altone(
  token,
  direction direction,
  page page,
  per_page per_page,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_category_subscriptions_altone_request(
      request,
      direction,
      page,
      per_page,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_category_subscriptions_altone_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn get_video_versions_altone(
  token,
  channel_id,
  video_id,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.get_video_versions_altone_request(
      request,
      channel_id,
      video_id,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_video_versions_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_video_privacy_domains(
  token,
  video_id,
  direction direction,
  page page,
  per_page per_page,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_video_privacy_domains_request(
      request,
      video_id,
      direction,
      page,
      per_page,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_video_privacy_domains_response(response)),
  )
  t.Done(data)
}

pub fn edit_audio_track(token, video_id, version_id, audiotrack_id) {
  let request = base_request(token)
  let request =
    operations.edit_audio_track_request(
      request,
      video_id,
      version_id,
      audiotrack_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_audio_track_response(response)),
  )
  t.Done(data)
}

pub fn delete_audio_track(token, video_id, version_id, audiotrack_id) {
  let request = base_request(token)
  let request =
    operations.delete_audio_track_request(
      request,
      video_id,
      version_id,
      audiotrack_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_audio_track_response(response)),
  )
  t.Done(data)
}

pub fn get_audio_track(token, video_id, version_id, audiotrack_id) {
  let request = base_request(token)
  let request =
    operations.get_audio_track_request(
      request,
      video_id,
      version_id,
      audiotrack_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_audio_track_response(response)),
  )
  t.Done(data)
}

pub fn create_group(token) {
  let request = base_request(token)
  let request = operations.create_group_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.create_group_response(response)))
  t.Done(data)
}

pub fn get_groups(
  token,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_groups_request(
      request,
      direction,
      filter,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_groups_response(response)))
  t.Done(data)
}

pub fn delete_channel_category(token, channel_id, category) {
  let request = base_request(token)
  let request =
    operations.delete_channel_category_request(request, channel_id, category)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_channel_category_response(response)),
  )
  t.Done(data)
}

pub fn categorize_channel(token, channel_id, category) {
  let request = base_request(token)
  let request =
    operations.categorize_channel_request(request, channel_id, category)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.categorize_channel_response(response)),
  )
  t.Done(data)
}

pub fn delete_video_from_portfolio(token, user_id, portfolio_id, video_id) {
  let request = base_request(token)
  let request =
    operations.delete_video_from_portfolio_request(
      request,
      user_id,
      portfolio_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_video_from_portfolio_response(response)),
  )
  t.Done(data)
}

pub fn add_video_to_portfolio(token, user_id, portfolio_id, video_id) {
  let request = base_request(token)
  let request =
    operations.add_video_to_portfolio_request(
      request,
      user_id,
      portfolio_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_video_to_portfolio_response(response)),
  )
  t.Done(data)
}

pub fn get_portfolio_video(token, user_id, portfolio_id, video_id) {
  let request = base_request(token)
  let request =
    operations.get_portfolio_video_request(
      request,
      user_id,
      portfolio_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_portfolio_video_response(response)),
  )
  t.Done(data)
}

pub fn create_project_altone(token, data) {
  let request = base_request(token)
  let request = operations.create_project_altone_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_project_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_projects_altone(
  token,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_projects_altone_request(
      request,
      direction,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_projects_altone_response(response)),
  )
  t.Done(data)
}

pub fn delete_vod_promotion(token, ondemand_id, promotion_id) {
  let request = base_request(token)
  let request =
    operations.delete_vod_promotion_request(request, ondemand_id, promotion_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_vod_promotion_response(response)),
  )
  t.Done(data)
}

pub fn get_vod_promotion(token, ondemand_id, promotion_id) {
  let request = base_request(token)
  let request =
    operations.get_vod_promotion_request(request, ondemand_id, promotion_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_vod_promotion_response(response)),
  )
  t.Done(data)
}

pub fn get_genre_vod(token, genre_id, ondemand_id) {
  let request = base_request(token)
  let request = operations.get_genre_vod_request(request, genre_id, ondemand_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_genre_vod_response(response)))
  t.Done(data)
}

pub fn delete_vod_genre(token, ondemand_id, genre_id) {
  let request = base_request(token)
  let request =
    operations.delete_vod_genre_request(request, ondemand_id, genre_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_vod_genre_response(response)),
  )
  t.Done(data)
}

pub fn add_vod_genre(token, ondemand_id, genre_id) {
  let request = base_request(token)
  let request = operations.add_vod_genre_request(request, ondemand_id, genre_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.add_vod_genre_response(response)))
  t.Done(data)
}

pub fn get_vod_genre_by_ondemand_id(token, ondemand_id, genre_id) {
  let request = base_request(token)
  let request =
    operations.get_vod_genre_by_ondemand_id_request(
      request,
      ondemand_id,
      genre_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_vod_genre_by_ondemand_id_response(response)),
  )
  t.Done(data)
}

pub fn convert_access_token(token) {
  let request = base_request(token)
  let request = operations.convert_access_token_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.convert_access_token_response(response)),
  )
  t.Done(data)
}

pub fn replace_channel_moderators(token, channel_id, data) {
  let request = base_request(token)
  let request =
    operations.replace_channel_moderators_request(request, channel_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.replace_channel_moderators_response(response)),
  )
  t.Done(data)
}

pub fn remove_channel_moderators(token, channel_id) {
  let request = base_request(token)
  let request =
    operations.remove_channel_moderators_request(request, channel_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.remove_channel_moderators_response(response)),
  )
  t.Done(data)
}

pub fn add_channel_moderators(token, channel_id) {
  let request = base_request(token)
  let request = operations.add_channel_moderators_request(request, channel_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_channel_moderators_response(response)),
  )
  t.Done(data)
}

pub fn get_channel_moderators(
  token,
  channel_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_channel_moderators_request(
      request,
      channel_id,
      direction,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_channel_moderators_response(response)),
  )
  t.Done(data)
}

pub fn create_one_time_event_destination_altone(token, video_id) {
  let request = base_request(token)
  let request =
    operations.create_one_time_event_destination_altone_request(
      request,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_one_time_event_destination_altone_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn get_one_time_event_destinations_altone(token, video_id) {
  let request = base_request(token)
  let request =
    operations.get_one_time_event_destinations_altone_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_one_time_event_destinations_altone_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn federated_search_user_items(
  token,
  user_id,
  direction direction,
  filter filter,
  filter_privacy filter_privacy,
  modified_end_date modified_end_date,
  modified_start_date modified_start_date,
  page page,
  per_page per_page,
  query query,
  query_fields query_fields,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.federated_search_user_items_request(
      request,
      user_id,
      direction,
      filter,
      filter_privacy,
      modified_end_date,
      modified_start_date,
      page,
      per_page,
      query,
      query_fields,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.federated_search_user_items_response(response)),
  )
  t.Done(data)
}

pub fn unsubscribe_from_channel_altone(token, channel_id) {
  let request = base_request(token)
  let request =
    operations.unsubscribe_from_channel_altone_request(request, channel_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.unsubscribe_from_channel_altone_response(response)),
  )
  t.Done(data)
}

pub fn subscribe_to_channel_altone(token, channel_id) {
  let request = base_request(token)
  let request =
    operations.subscribe_to_channel_altone_request(request, channel_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.subscribe_to_channel_altone_response(response)),
  )
  t.Done(data)
}

pub fn check_if_user_subscribed_to_channel_altone(token, channel_id) {
  let request = base_request(token)
  let request =
    operations.check_if_user_subscribed_to_channel_altone_request(
      request,
      channel_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.check_if_user_subscribed_to_channel_altone_response(response),
    ),
  )
  t.Done(data)
}

pub fn delete_watch_history(token) {
  let request = base_request(token)
  let request = operations.delete_watch_history_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_watch_history_response(response)),
  )
  t.Done(data)
}

pub fn get_watch_history(token, page page, per_page per_page) {
  let request = base_request(token)
  let request = operations.get_watch_history_request(request, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_watch_history_response(response)),
  )
  t.Done(data)
}

pub fn set_video_as_showcase_thumbnail(token, user_id, album_id, video_id, data) {
  let request = base_request(token)
  let request =
    operations.set_video_as_showcase_thumbnail_request(
      request,
      user_id,
      album_id,
      video_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.set_video_as_showcase_thumbnail_response(response)),
  )
  t.Done(data)
}

pub fn get_embed_preset_videos(
  token,
  user_id,
  preset_id,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.get_embed_preset_videos_request(
      request,
      user_id,
      preset_id,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_embed_preset_videos_response(response)),
  )
  t.Done(data)
}

pub fn remove_videos_from_live_event(token, user_id, live_event_id, data) {
  let request = base_request(token)
  let request =
    operations.remove_videos_from_live_event_request(
      request,
      user_id,
      live_event_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.remove_videos_from_live_event_response(response)),
  )
  t.Done(data)
}

pub fn add_videos_to_live_event(token, user_id, live_event_id, data) {
  let request = base_request(token)
  let request =
    operations.add_videos_to_live_event_request(
      request,
      user_id,
      live_event_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_videos_to_live_event_response(response)),
  )
  t.Done(data)
}

pub fn get_live_event_videos(
  token,
  user_id,
  live_event_id,
  containing_uri containing_uri,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_live_event_videos_request(
      request,
      user_id,
      live_event_id,
      containing_uri,
      direction,
      filter,
      filter_embeddable,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_event_videos_response(response)),
  )
  t.Done(data)
}

pub fn edit_picture_altone(token, portraitset_id) {
  let request = base_request(token)
  let request = operations.edit_picture_altone_request(request, portraitset_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.edit_picture_altone_response(response)),
  )
  t.Done(data)
}

pub fn delete_picture_altone(token, portraitset_id) {
  let request = base_request(token)
  let request =
    operations.delete_picture_altone_request(request, portraitset_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_picture_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_picture_altone(token, portraitset_id) {
  let request = base_request(token)
  let request = operations.get_picture_altone_request(request, portraitset_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_picture_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_available_destinations(token, user_id) {
  let request = base_request(token)
  let request = operations.get_available_destinations_request(request, user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_available_destinations_response(response)),
  )
  t.Done(data)
}

pub fn replace_videos_in_showcase(token, user_id, album_id, data) {
  let request = base_request(token)
  let request =
    operations.replace_videos_in_showcase_request(
      request,
      user_id,
      album_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.replace_videos_in_showcase_response(response)),
  )
  t.Done(data)
}

pub fn get_showcase_videos(
  token,
  user_id,
  album_id,
  containing_uri containing_uri,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  password password,
  per_page per_page,
  query query,
  sort sort,
  weak_search weak_search,
) {
  let request = base_request(token)
  let request =
    operations.get_showcase_videos_request(
      request,
      user_id,
      album_id,
      containing_uri,
      direction,
      filter,
      filter_embeddable,
      page,
      password,
      per_page,
      query,
      sort,
      weak_search,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_showcase_videos_response(response)),
  )
  t.Done(data)
}

pub fn update_showcases(
  token,
  user_id,
  album_item_uris album_item_uris,
  album_uris album_uris,
) {
  let request = base_request(token)
  let request =
    operations.update_showcases_request(
      request,
      user_id,
      album_item_uris,
      album_uris,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_showcases_response(response)),
  )
  t.Done(data)
}

pub fn create_showcase(token, user_id) {
  let request = base_request(token)
  let request = operations.create_showcase_request(request, user_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_showcase_response(response)),
  )
  t.Done(data)
}

pub fn get_showcases(
  token,
  user_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_showcases_request(
      request,
      user_id,
      direction,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_showcases_response(response)))
  t.Done(data)
}

pub fn get_live_ingest_status(token, video_id) {
  let request = base_request(token)
  let request = operations.get_live_ingest_status_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_live_ingest_status_response(response)),
  )
  t.Done(data)
}

pub fn get_likes(
  token,
  user_id,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_likes_request(
      request,
      user_id,
      filter,
      filter_embeddable,
      page,
      per_page,
      query,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_likes_response(response)))
  t.Done(data)
}

pub fn suggest_video_category(token, video_id) {
  let request = base_request(token)
  let request = operations.suggest_video_category_request(request, video_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.suggest_video_category_response(response)),
  )
  t.Done(data)
}

pub fn get_video_categories(token, video_id, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.get_video_categories_request(request, video_id, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_video_categories_response(response)),
  )
  t.Done(data)
}

pub fn verify_token(token) {
  let request = base_request(token)
  let request = operations.verify_token_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.verify_token_response(response)))
  t.Done(data)
}

pub fn get_vod_videos(
  token,
  ondemand_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_vod_videos_request(
      request,
      ondemand_id,
      direction,
      filter,
      page,
      per_page,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_vod_videos_response(response)))
  t.Done(data)
}

pub fn delete_videos_altone(token, uris uris) {
  let request = base_request(token)
  let request = operations.delete_videos_altone_request(request, uris)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_videos_altone_response(response)),
  )
  t.Done(data)
}

pub fn upload_video_altone(token) {
  let request = base_request(token)
  let request = operations.upload_video_altone_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.upload_video_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_videos_altone(
  token,
  containing_uri containing_uri,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  filter_playable filter_playable,
  filter_screen_recorded filter_screen_recorded,
  filter_tag filter_tag,
  filter_tag_all_of filter_tag_all_of,
  filter_tag_exclude filter_tag_exclude,
  filter_uploader filter_uploader,
  include_team_content include_team_content,
  page page,
  per_page per_page,
  query query,
  query_fields query_fields,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.get_videos_altone_request(
      request,
      containing_uri,
      direction,
      filter,
      filter_embeddable,
      filter_playable,
      filter_screen_recorded,
      filter_tag,
      filter_tag_all_of,
      filter_tag_exclude,
      filter_uploader,
      include_team_content,
      page,
      per_page,
      query,
      query_fields,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_videos_altone_response(response)),
  )
  t.Done(data)
}

pub fn get_one_time_event_m3u8_playback(token, user_id, video_id) {
  let request = base_request(token)
  let request =
    operations.get_one_time_event_m3u8_playback_request(
      request,
      user_id,
      video_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_one_time_event_m3u8_playback_response(response)),
  )
  t.Done(data)
}
