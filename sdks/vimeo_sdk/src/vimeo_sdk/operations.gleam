import gleam/option
import gleam/bool
import gleam/result
import gleam/dynamic/decode
import gleam/json
import gleam/float
import gleam/int
import gleam/http/response
import gleam/http
import vimeo_sdk/schema
import vimeo_sdk/utils

pub fn set_live_event_whitelist_request(base, user_id, live_event_id, data) {
  let method = http.Put
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/privacy/domains"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn set_live_event_whitelist_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_whitelist_request(base, user_id, live_event_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/privacy/domains"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_whitelist_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.domain_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_video_version_request(base, video_id, data) {
  let method = http.Post
  let path = "/videos/" <> video_id <> "/versions"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_video_version_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.video_version_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_video_versions_request(base, video_id, page page, per_page per_page) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/versions"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_versions_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_version_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_tag_request(base, word) {
  let method = http.Get
  let path = "/tags/" <> word
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_tag_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.tag_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn create_showcase_logo_request(base, user_id, album_id) {
  let method = http.Post
  let path = "/users/" <> user_id <> "/albums/" <> album_id <> "/logos"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn create_showcase_logo_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_showcase_logos_request(
  base,
  user_id,
  album_id,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/albums/" <> album_id <> "/logos"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_showcase_logos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.picture_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn create_audio_track_request(base, video_id, version_id, data) {
  let method = http.Post
  let path = "/videos/" <> video_id <> "/versions/" <> version_id <> "/audiotracks"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_audio_track_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.alternate_audio_track_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_category_videos_request(
  base,
  category,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/categories/" <> category <> "/videos"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("filter_embeddable", option.map(filter_embeddable, bool.to_string)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_category_videos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_folder_items_altone_request(
  base,
  project_id,
  should_delete_items should_delete_items,
  uris uris,
) {
  let method = http.Delete
  let path = "/me/projects/" <> project_id <> "/items"
  let query = [
    #("should_delete_items", option.map(should_delete_items, bool.to_string)),
    #("uris", option.Some(uris))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_folder_items_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_channel_request(base, data) {
  let method = http.Post
  let path = "/channels"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_channel_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.channel_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_channels_request(
  base,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/channels"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_channels_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.channel_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn delete_fragments_request(base, video_id) {
  let method = http.Delete
  let path = "/videos/" <> video_id <> "/fragments"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_fragments_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn put_fragments_request(base, video_id) {
  let method = http.Put
  let path = "/videos/" <> video_id <> "/fragments"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn put_fragments_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn get_fragments_request(base, video_id) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/fragments"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_fragments_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.fragments_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn end_live_event_altone_request(base, live_event_id, clip_id clip_id) {
  let method = http.Post
  let path = "/live_events/" <> live_event_id <> "/end"
  let query = [#("clip_id", option.map(clip_id, float.to_string))]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn end_live_event_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_live_event_thumbnail_request(base, user_id, live_event_id, data) {
  let method = http.Post
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/pictures"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_live_event_thumbnail_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_thumbnails_request(base, user_id, live_event_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/pictures"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_thumbnails_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.picture_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_text_track_altone_request(base, channel_id, video_id, data) {
  let method = http.Post
  let path = "/channels/" <> channel_id <> "/videos/" <> video_id <> "/texttracks"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_text_track_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.text_track_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_text_tracks_alt2_request(
  base,
  channel_id,
  video_id,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/channels/" <> channel_id <> "/videos/" <> video_id <> "/texttracks"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_text_tracks_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.text_track_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn edit_video_credit_request(base, video_id, credit_id, data) {
  let method = http.Patch
  let path = "/videos/" <> video_id <> "/credits/" <> credit_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_video_credit_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.credit_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_video_credit_request(base, video_id, credit_id) {
  let method = http.Delete
  let path = "/videos/" <> video_id <> "/credits/" <> credit_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_video_credit_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_video_credit_request(base, video_id, credit_id) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/credits/" <> credit_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_credit_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.credit_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_live_event_video_altone_request(base, live_event_id, video_id) {
  let method = http.Get
  let path = "/live_events/" <> live_event_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_video_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn unlike_video_altone_request(base, video_id) {
  let method = http.Delete
  let path = "/me/likes/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn unlike_video_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn like_video_altone_request(base, video_id) {
  let method = http.Put
  let path = "/me/likes/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn like_video_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn check_if_user_liked_video_altone_request(base, video_id) {
  let method = http.Get
  let path = "/me/likes/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn check_if_user_liked_video_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_available_video_showcases_request(
  base,
  video_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/available_albums"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_available_video_showcases_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.album_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_video_embed_preset_request(base, video_id, preset_id) {
  let method = http.Delete
  let path = "/videos/" <> video_id <> "/presets/" <> preset_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_video_embed_preset_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn add_video_embed_preset_request(base, video_id, preset_id) {
  let method = http.Put
  let path = "/videos/" <> video_id <> "/presets/" <> preset_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_video_embed_preset_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn get_video_embed_preset_request(base, video_id, preset_id) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/presets/" <> preset_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_embed_preset_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn toggle_rle_low_latency_alt2_request(base, live_event_id, data) {
  let method = http.Patch
  let path = "/me/live_events/" <> live_event_id <> "/low_latency"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn toggle_rle_low_latency_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.recurring_event_low_latency_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_user_analytics_altone_request(
  base,
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
  let method = http.Get
  let path = "/me/analytics"
  let query = [
    #("dimension", option.Some(dimension)),
    #("direction", direction),
    #("filter_content", filter_content),
    #(
      "filter_countries",
      option.map(
        filter_countries,
        fn(_) { panic as "query parameter is not supported" },
      ),
    ),
    #(
      "filter_device_types",
      option.map(
        filter_device_types,
        fn(_) { panic as "query parameter is not supported" },
      ),
    ),
    #(
      "filter_embed_domains",
      option.map(
        filter_embed_domains,
        fn(_) { panic as "query parameter is not supported" },
      ),
    ),
    #(
      "filter_regions",
      option.map(
        filter_regions,
        fn(_) { panic as "query parameter is not supported" },
      ),
    ),
    #(
      "filter_streaming_types",
      option.map(
        filter_streaming_types,
        fn(_) { panic as "query parameter is not supported" },
      ),
    ),
    #("from", option.Some(from)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort),
    #("time_interval", time_interval),
    #("to", option.Some(to))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_user_analytics_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.analytics_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn check_if_user_owns_video_request(base, user_id, video_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn check_if_user_owns_video_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn create_video_thumbnail_altone_request(base, channel_id, video_id, data) {
  let method = http.Post
  let path = "/channels/" <> channel_id <> "/videos/" <> video_id <> "/pictures"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_video_thumbnail_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_video_thumbnails_altone_request(
  base,
  channel_id,
  video_id,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/channels/" <> channel_id <> "/videos/" <> video_id <> "/pictures"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_thumbnails_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.picture_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn create_ott_destination_request(base, user_id, live_event_id) {
  let method = http.Post
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/ott_destinations"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn create_ott_destination_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.ott_destination_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_ott_destinations_request(base, user_id, live_event_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/ott_destinations"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_ott_destinations_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.ott_destination_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_video_from_group_request(base, group_id, video_id) {
  let method = http.Delete
  let path = "/groups/" <> group_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_video_from_group_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn add_video_to_group_request(base, group_id, video_id) {
  let method = http.Put
  let path = "/groups/" <> group_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_video_to_group_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_group_video_request(base, group_id, video_id) {
  let method = http.Get
  let path = "/groups/" <> group_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_group_video_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn edit_comment_request(base, video_id, comment_id, data) {
  let method = http.Patch
  let path = "/videos/" <> video_id <> "/comments/" <> comment_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_comment_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.comment_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_comment_request(base, video_id, comment_id) {
  let method = http.Delete
  let path = "/videos/" <> video_id <> "/comments/" <> comment_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_comment_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn get_comment_request(base, video_id, comment_id) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/comments/" <> comment_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_comment_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.comment_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn create_comment_altone_request(base, channel_id, video_id, data) {
  let method = http.Post
  let path = "/channels/" <> channel_id <> "/videos/" <> video_id <> "/comments"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_comment_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.comment_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_comments_altone_request(
  base,
  channel_id,
  video_id,
  direction direction,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/channels/" <> channel_id <> "/videos/" <> video_id <> "/comments"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_comments_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.comment_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn add_video_privacy_users_request(base, video_id) {
  let method = http.Put
  let path = "/videos/" <> video_id <> "/privacy/users"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_video_privacy_users_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_video_privacy_users_request(
  base,
  video_id,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/privacy/users"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_privacy_users_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn add_vod_poster_request(base, ondemand_id) {
  let method = http.Post
  let path = "/ondemand/pages/" <> ondemand_id <> "/pictures"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_vod_poster_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_vod_posters_request(base, ondemand_id, page page, per_page per_page) {
  let method = http.Get
  let path = "/ondemand/pages/" <> ondemand_id <> "/pictures"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_posters_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.picture_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn create_picture_altone_request(base) {
  let method = http.Post
  let path = "/me/pictures"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn create_picture_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_pictures_altone_request(base, page page, per_page per_page) {
  let method = http.Get
  let path = "/me/pictures"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_pictures_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.picture_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_transcript_metadata_request(base, container_uuid, texttrack_id) {
  let method = http.Get
  let path = "/videos/" <> container_uuid <> "/transcript/" <> texttrack_id <> "/metadata"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_transcript_metadata_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> Error(Nil) |> Ok
  }
}

pub fn add_video_tags_request(base, video_id, page page, per_page per_page) {
  let method = http.Put
  let path = "/videos/" <> video_id <> "/tags"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_video_tags_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.tag_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_video_tags_request(base, video_id, page page, per_page per_page) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/tags"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_tags_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.tag_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn create_vod_background_request(base, ondemand_id) {
  let method = http.Post
  let path = "/ondemand/pages/" <> ondemand_id <> "/backgrounds"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn create_vod_background_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_vod_backgrounds_request(
  base,
  ondemand_id,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/ondemand/pages/" <> ondemand_id <> "/backgrounds"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_backgrounds_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.picture_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_live_events_altone_request(base, data) {
  let method = http.Delete
  let path = "/live_events"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn delete_live_events_altone_response(response) {
  let response.Response(status:, ..) = response
  case status {
    _ -> response |> Error |> Ok
  }
}

pub fn create_live_event_altone_request(base, data) {
  let method = http.Post
  let path = "/live_events"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_live_event_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.recurring_event_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_events_altone_request(
  base,
  data,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
  type_ type_,
) {
  let method = http.Get
  let path = "/live_events"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort),
    #("type_", type_)
  ]
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn get_live_events_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.event_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn edit_video_thumbnail_request(base, video_id, picture_id, data) {
  let method = http.Patch
  let path = "/videos/" <> video_id <> "/pictures/" <> picture_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_video_thumbnail_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn delete_video_thumbnail_request(base, video_id, picture_id) {
  let method = http.Delete
  let path = "/videos/" <> video_id <> "/pictures/" <> picture_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_video_thumbnail_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn get_video_thumbnail_request(base, video_id, picture_id) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/pictures/" <> picture_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_thumbnail_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_live_event_m3u8_playback_altone_request(
  base,
  live_event_id,
  max_fps_fhd max_fps_fhd,
  ttl ttl,
) {
  let method = http.Get
  let path = "/me/live_events/" <> live_event_id <> "/m3u8_playback"
  let query = [
    #("max_fps_fhd", option.map(max_fps_fhd, float.to_string)),
    #("ttl", option.map(ttl, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_m3u8_playback_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_user_groups_altone_request(
  base,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/me/groups"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_user_groups_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.group_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_transcript_request(base, video_id, texttrack_id) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/transcripts/" <> texttrack_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_transcript_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> Error(Nil) |> Ok
  }
}

pub fn activate_live_event_request(base, user_id, live_event_id, data) {
  let method = http.Post
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/activate"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn activate_live_event_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn remove_channel_moderator_request(base, channel_id, user_id) {
  let method = http.Delete
  let path = "/channels/" <> channel_id <> "/moderators/" <> user_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn remove_channel_moderator_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn add_channel_moderator_request(base, channel_id, user_id) {
  let method = http.Put
  let path = "/channels/" <> channel_id <> "/moderators/" <> user_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_channel_moderator_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_channel_moderator_request(base, channel_id, user_id) {
  let method = http.Get
  let path = "/channels/" <> channel_id <> "/moderators/" <> user_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_channel_moderator_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.user_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn edit_text_track_request(base, video_id, texttrack_id, data) {
  let method = http.Patch
  let path = "/videos/" <> video_id <> "/texttracks/" <> texttrack_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_text_track_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.text_track_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_text_track_request(base, video_id, texttrack_id) {
  let method = http.Delete
  let path = "/videos/" <> video_id <> "/texttracks/" <> texttrack_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_text_track_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn get_text_track_request(base, video_id, texttrack_id) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/texttracks/" <> texttrack_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_text_track_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.text_track_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_region_request(base, country) {
  let method = http.Get
  let path = "/ondemand/regions/" <> country
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_region_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.on_demand_region_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_related_videos_request(
  base,
  video_id,
  filter filter,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/videos"
  let query = [
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_related_videos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_portfolio_videos_altone_request(
  base,
  portfolio_id,
  containing_uri containing_uri,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  sort sort,
) {
  let method = http.Get
  let path = "/me/portfolios/" <> portfolio_id <> "/videos"
  let query = [
    #("containing_uri", containing_uri),
    #("filter", filter),
    #("filter_embeddable", option.map(filter_embeddable, bool.to_string)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_portfolio_videos_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_category_groups_request(
  base,
  category,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/categories/" <> category <> "/groups"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_category_groups_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.group_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_animated_thumbset_status_request(base, video_id, picture_id) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/animated_thumbsets/" <> picture_id <> "/status"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_animated_thumbset_status_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.animated_thumbset_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_custom_logo_request(base, user_id) {
  let method = http.Post
  let path = "/users/" <> user_id <> "/customlogos"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn create_custom_logo_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_custom_logos_request(
  base,
  user_id,
  page page,
  per_page per_page,
  sizes sizes,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/customlogos"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sizes", sizes)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_custom_logos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.picture_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn create_vod_request(base, user_id, data) {
  let method = http.Post
  let path = "/users/" <> user_id <> "/ondemand/pages"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_vod_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.on_demand_page_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_user_vods_request(
  base,
  user_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  sort sort,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/ondemand/pages"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_user_vods_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.on_demand_page_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn edit_channel_request(base, channel_id, data) {
  let method = http.Patch
  let path = "/channels/" <> channel_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_channel_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.channel_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_channel_request(base, channel_id) {
  let method = http.Delete
  let path = "/channels/" <> channel_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_channel_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_channel_request(base, channel_id) {
  let method = http.Get
  let path = "/channels/" <> channel_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_channel_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.channel_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn edit_live_event_auto_cc_alt2_request(base, live_event_id, data) {
  let method = http.Patch
  let path = "/me/live_events/" <> live_event_id <> "/auto_cc"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_live_event_auto_cc_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(
      body,
      schema.event_automated_closed_captions_decoder(),
    ) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn unsubscribe_from_category_request(base, user_id, category) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/categories/" <> category
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn unsubscribe_from_category_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn subscribe_to_category_request(base, user_id, category) {
  let method = http.Put
  let path = "/users/" <> user_id <> "/categories/" <> category
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn subscribe_to_category_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn check_if_user_subscribed_to_category_request(base, user_id, category) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/categories/" <> category
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn check_if_user_subscribed_to_category_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn unfollow_user_request(base, user_id, follow_user_id) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/following/" <> follow_user_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn unfollow_user_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn follow_user_request(base, user_id, follow_user_id) {
  let method = http.Put
  let path = "/users/" <> user_id <> "/following/" <> follow_user_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn follow_user_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn check_if_user_is_following_request(base, user_id, follow_user_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/following/" <> follow_user_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn check_if_user_is_following_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn leave_group_altone_request(base, group_id) {
  let method = http.Delete
  let path = "/me/groups/" <> group_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn leave_group_altone_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn join_group_altone_request(base, group_id) {
  let method = http.Put
  let path = "/me/groups/" <> group_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn join_group_altone_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn check_if_user_joined_group_altone_request(base, group_id) {
  let method = http.Get
  let path = "/me/groups/" <> group_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn check_if_user_joined_group_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn edit_embed_preset_altone_request(base, preset_id, data) {
  let method = http.Patch
  let path = "/me/presets/" <> preset_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_embed_preset_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.preset_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_embed_preset_altone_request(base, preset_id) {
  let method = http.Get
  let path = "/me/presets/" <> preset_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_embed_preset_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.preset_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn edit_showcase_alt2_request(base, album_id, data) {
  let method = http.Patch
  let path = "/me/albums/" <> album_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_showcase_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.album_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_showcase_alt2_request(base, album_id) {
  let method = http.Delete
  let path = "/me/albums/" <> album_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_showcase_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_showcase_alt2_request(base, album_id) {
  let method = http.Get
  let path = "/me/albums/" <> album_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_showcase_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.album_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_feed_request(
  base,
  user_id,
  offset offset,
  page page,
  per_page per_page,
  type_ type_,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/feed"
  let query = [
    #("offset", offset),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("type_", type_)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_feed_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.activity_3_one_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_tag_from_channel_request(base, channel_id, word) {
  let method = http.Delete
  let path = "/channels/" <> channel_id <> "/tags/" <> word
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_tag_from_channel_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn add_channel_tag_request(base, channel_id, word) {
  let method = http.Put
  let path = "/channels/" <> channel_id <> "/tags/" <> word
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_channel_tag_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn check_if_channel_has_tag_request(base, channel_id, word) {
  let method = http.Get
  let path = "/channels/" <> channel_id <> "/tags/" <> word
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn check_if_channel_has_tag_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn edit_project_request(base, user_id, project_id, data) {
  let method = http.Patch
  let path = "/users/" <> user_id <> "/projects/" <> project_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_project_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.project_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_project_request(
  base,
  user_id,
  project_id,
  should_delete_clips should_delete_clips,
) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/projects/" <> project_id
  let query = [
    #("should_delete_clips", option.map(should_delete_clips, bool.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_project_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_project_request(base, user_id, project_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/projects/" <> project_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_project_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.project_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_payment_method_request(base, payment_method_id) {
  let method = http.Delete
  let path = "/me/payment_methods/" <> payment_method_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_payment_method_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_payment_method_info_request(base, payment_method_id) {
  let method = http.Get
  let path = "/me/payment_methods/" <> payment_method_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_payment_method_info_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.payment_method_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_live_event_destination_request(base, live_event_id, data) {
  let method = http.Post
  let path = "/me/live_events/" <> live_event_id <> "/destinations"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_live_event_destination_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.event_destination_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_destinations_request(base, live_event_id) {
  let method = http.Get
  let path = "/me/live_events/" <> live_event_id <> "/destinations"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_destinations_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.event_destination_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn update_live_event_alt2_request(base, live_event_id, data) {
  let method = http.Patch
  let path = "/me/live_events/" <> live_event_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn update_live_event_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.recurring_event_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_live_event_alt2_request(base, live_event_id) {
  let method = http.Delete
  let path = "/me/live_events/" <> live_event_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_live_event_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_alt2_request(base, live_event_id, password password) {
  let method = http.Get
  let path = "/me/live_events/" <> live_event_id
  let query = [#("password", password)]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.recurring_event_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn edit_chapter_request(base, video_id, chapter_id, data) {
  let method = http.Patch
  let path = "/videos/" <> video_id <> "/chapters/" <> chapter_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_chapter_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.chapter_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn delete_chapter_request(base, video_id, chapter_id) {
  let method = http.Delete
  let path = "/videos/" <> video_id <> "/chapters/" <> chapter_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_chapter_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_chapter_request(base, video_id, chapter_id) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/chapters/" <> chapter_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_chapter_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.chapter_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_vod_season_request(base, ondemand_id, season_id) {
  let method = http.Get
  let path = "/ondemand/pages/" <> ondemand_id <> "/seasons/" <> season_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_season_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.on_demand_season_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn edit_vod_background_request(base, ondemand_id, background_id, data) {
  let method = http.Patch
  let path = "/ondemand/pages/" <> ondemand_id <> "/backgrounds/" <> background_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_vod_background_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_vod_background_request(base, ondemand_id, background_id) {
  let method = http.Delete
  let path = "/ondemand/pages/" <> ondemand_id <> "/backgrounds/" <> background_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_vod_background_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_vod_background_request(base, ondemand_id, background_id) {
  let method = http.Get
  let path = "/ondemand/pages/" <> ondemand_id <> "/backgrounds/" <> background_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_background_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn replace_showcase_logo_request(base, user_id, album_id, logo_id, data) {
  let method = http.Patch
  let path = "/users/" <> user_id <> "/albums/" <> album_id <> "/logos/" <> logo_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn replace_showcase_logo_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_showcase_logo_request(base, user_id, album_id, logo_id) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/albums/" <> album_id <> "/logos/" <> logo_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_showcase_logo_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_showcase_logo_request(base, user_id, album_id, logo_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/albums/" <> album_id <> "/logos/" <> logo_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_showcase_logo_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_followers_request(
  base,
  user_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/followers"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_followers_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn search_users_request(
  base,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/users"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn search_users_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn create_video_thumbnail_request(base, video_id, data) {
  let method = http.Post
  let path = "/videos/" <> video_id <> "/pictures"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_video_thumbnail_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_video_thumbnails_request(base, video_id, page page, per_page per_page) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/pictures"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_thumbnails_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.picture_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn create_text_track_request(base, video_id, data) {
  let method = http.Post
  let path = "/videos/" <> video_id <> "/texttracks"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_text_track_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.text_track_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_text_tracks_request(base, video_id, page page, per_page per_page) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/texttracks"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_text_tracks_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.text_track_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn edit_vod_poster_request(base, ondemand_id, poster_id, data) {
  let method = http.Patch
  let path = "/ondemand/pages/" <> ondemand_id <> "/pictures/" <> poster_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_vod_poster_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_vod_poster_request(base, ondemand_id, poster_id) {
  let method = http.Get
  let path = "/ondemand/pages/" <> ondemand_id <> "/pictures/" <> poster_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_poster_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn delete_video_from_watch_later_request(base, user_id, video_id) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/watchlater/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_video_from_watch_later_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn add_video_to_watch_later_request(base, user_id, video_id) {
  let method = http.Put
  let path = "/users/" <> user_id <> "/watchlater/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_video_to_watch_later_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn check_watch_later_queue_request(base, user_id, video_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/watchlater/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn check_watch_later_queue_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_vod_promotion_codes_request(
  base,
  ondemand_id,
  promotion_id,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/ondemand/pages/" <> ondemand_id <> "/promotions/" <> promotion_id <> "/codes"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_promotion_codes_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.on_demand_promotion_code_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn remove_videos_from_project_altone_request(
  base,
  project_id,
  should_delete_clips should_delete_clips,
  uris uris,
) {
  let method = http.Delete
  let path = "/me/projects/" <> project_id <> "/videos"
  let query = [
    #("should_delete_clips", option.map(should_delete_clips, bool.to_string)),
    #("uris", option.Some(uris))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn remove_videos_from_project_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn add_videos_to_project_altone_request(base, project_id, uris uris) {
  let method = http.Put
  let path = "/me/projects/" <> project_id <> "/videos"
  let query = [#("uris", option.Some(uris))]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_videos_to_project_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_project_videos_altone_request(
  base,
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
  let method = http.Get
  let path = "/me/projects/" <> project_id <> "/videos"
  let query = [
    #("direction", direction),
    #("filter_tag", filter_tag),
    #("filter_tag_all_of", filter_tag_all_of),
    #("filter_tag_exclude", filter_tag_exclude),
    #("include_subfolders", option.map(include_subfolders, bool.to_string)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("query_fields", query_fields),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_project_videos_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn available_users_request(
  base,
  video_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/credits/available_users"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn available_users_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn remove_video_from_project_altone_request(base, project_id, video_id) {
  let method = http.Delete
  let path = "/me/projects/" <> project_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn remove_video_from_project_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn add_video_to_project_altone_request(base, project_id, video_id) {
  let method = http.Put
  let path = "/me/projects/" <> project_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_video_to_project_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn edit_live_event_thumbnail_alt2_request(
  base,
  live_event_id,
  thumbnail_id,
  data,
) {
  let method = http.Patch
  let path = "/me/live_events/" <> live_event_id <> "/pictures/" <> thumbnail_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_live_event_thumbnail_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_live_event_thumbnail_alt2_request(
  base,
  live_event_id,
  thumbnail_id,
) {
  let method = http.Delete
  let path = "/me/live_events/" <> live_event_id <> "/pictures/" <> thumbnail_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_live_event_thumbnail_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_thumbnail_alt2_request(base, live_event_id, thumbnail_id) {
  let method = http.Get
  let path = "/me/live_events/" <> live_event_id <> "/pictures/" <> thumbnail_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_thumbnail_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_watch_later_queue_request(
  base,
  user_id,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/watchlater"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("filter_embeddable", option.map(filter_embeddable, bool.to_string)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_watch_later_queue_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_private_to_me_folder_request(base, owner_id) {
  let method = http.Get
  let path = "/users/" <> owner_id <> "/folders/private_to_me"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_private_to_me_folder_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.project_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_category_subscriptions_request(
  base,
  user_id,
  direction direction,
  page page,
  per_page per_page,
  sort sort,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/categories"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_category_subscriptions_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.category_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_channel_subscriptions_altone_request(
  base,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/me/channels"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_channel_subscriptions_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.channel_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_video_likes_request(
  base,
  video_id,
  direction direction,
  page page,
  per_page per_page,
  sort sort,
) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/likes"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_likes_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn create_embed_presets_request(base, user_id, data) {
  let method = http.Post
  let path = "/users/" <> user_id <> "/presets"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_embed_presets_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.preset_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_embed_presets_request(base, user_id, page page, per_page per_page) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/presets"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_embed_presets_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.preset_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn create_comment_request(base, video_id, data) {
  let method = http.Post
  let path = "/videos/" <> video_id <> "/comments"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_comment_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.comment_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_comments_request(
  base,
  video_id,
  direction direction,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/comments"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_comments_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.comment_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn create_unsaved_chapter_thumbnail_or_upload_link_request(
  base,
  video_id,
  data,
) {
  let method = http.Post
  let path = "/videos/" <> video_id <> "/chapters/temporary/pictures"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_unsaved_chapter_thumbnail_or_upload_link_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn create_vod_promotion_request(base, ondemand_id, data) {
  let method = http.Post
  let path = "/ondemand/pages/" <> ondemand_id <> "/promotions"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_vod_promotion_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.on_demand_promotion_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_vod_promotions_request(
  base,
  ondemand_id,
  filter filter,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/ondemand/pages/" <> ondemand_id <> "/promotions"
  let query = [
    #("filter", option.Some(filter)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_promotions_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.on_demand_promotion_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_plan_request(base, tier) {
  let method = http.Get
  let path = "/subscription_plans/" <> tier
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_plan_response(response) {
  let response.Response(status:, ..) = response
  case status {
    _ -> response |> Error |> Ok
  }
}

pub fn add_video_privacy_users_altone_request(base, channel_id, video_id) {
  let method = http.Put
  let path = "/channels/" <> channel_id <> "/videos/" <> video_id <> "/privacy/users"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_video_privacy_users_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_video_privacy_users_altone_request(
  base,
  channel_id,
  video_id,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/channels/" <> channel_id <> "/videos/" <> video_id <> "/privacy/users"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_privacy_users_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_vod_genres_by_ondemand_id_request(base, ondemand_id) {
  let method = http.Get
  let path = "/ondemand/pages/" <> ondemand_id <> "/genres"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_genres_by_ondemand_id_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.on_demand_genre_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_portfolio_request(base, user_id, portfolio_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/portfolios/" <> portfolio_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_portfolio_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.portfolio_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn client_auth_request(base, data) {
  let method = http.Post
  let path = "/oauth/authorize/client"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn client_auth_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.auth_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_vod_regions_request(base, ondemand_id, data) {
  let method = http.Delete
  let path = "/ondemand/pages/" <> ondemand_id <> "/regions"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn delete_vod_regions_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.on_demand_region_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn set_vod_regions_request(base, ondemand_id, data) {
  let method = http.Put
  let path = "/ondemand/pages/" <> ondemand_id <> "/regions"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn set_vod_regions_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.on_demand_region_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_vod_regions_request(base, ondemand_id) {
  let method = http.Get
  let path = "/ondemand/pages/" <> ondemand_id <> "/regions"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_regions_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.on_demand_region_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_category_channels_request(
  base,
  category,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/categories/" <> category <> "/channels"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_category_channels_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.channel_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn replace_showcase_custom_thumb_request(
  base,
  user_id,
  album_id,
  thumbnail_id,
  data,
) {
  let method = http.Patch
  let path = "/users/" <> user_id <> "/albums/" <> album_id <> "/custom_thumbnails/" <> thumbnail_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn replace_showcase_custom_thumb_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_showcase_custom_thumbnail_request(
  base,
  user_id,
  album_id,
  thumbnail_id,
) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/albums/" <> album_id <> "/custom_thumbnails/" <> thumbnail_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_showcase_custom_thumbnail_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_showcase_custom_thumbnail_request(
  base,
  user_id,
  album_id,
  thumbnail_id,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/albums/" <> album_id <> "/custom_thumbnails/" <> thumbnail_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_showcase_custom_thumbnail_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn toggle_rle_low_latency_altone_request(base, live_event_id, data) {
  let method = http.Patch
  let path = "/live_events/" <> live_event_id <> "/low_latency"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn toggle_rle_low_latency_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.recurring_event_low_latency_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_video_custom_logo_request(base, video_id, thumbnail_id) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/timelinethumbnails/" <> thumbnail_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_custom_logo_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_video_from_portfolio_altone_request(base, portfolio_id, video_id) {
  let method = http.Delete
  let path = "/me/portfolios/" <> portfolio_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_video_from_portfolio_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn add_video_to_portfolio_altone_request(base, portfolio_id, video_id) {
  let method = http.Put
  let path = "/me/portfolios/" <> portfolio_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_video_to_portfolio_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_portfolio_video_altone_request(base, portfolio_id, video_id) {
  let method = http.Get
  let path = "/me/portfolios/" <> portfolio_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_portfolio_video_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn delete_video_privacy_user_request(base, video_id, user_id) {
  let method = http.Delete
  let path = "/videos/" <> video_id <> "/privacy/users/" <> user_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_video_privacy_user_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn add_video_privacy_user_request(base, video_id, user_id) {
  let method = http.Put
  let path = "/videos/" <> video_id <> "/privacy/users/" <> user_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_video_privacy_user_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.user_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn create_comment_reply_request(base, video_id, comment_id, data) {
  let method = http.Post
  let path = "/videos/" <> video_id <> "/comments/" <> comment_id <> "/replies"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_comment_reply_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.comment_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_comment_replies_request(
  base,
  video_id,
  comment_id,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/comments/" <> comment_id <> "/replies"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_comment_replies_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.comment_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn create_one_time_event_destination_request(base, user_id, video_id, data) {
  let method = http.Post
  let path = "/users/" <> user_id <> "/videos/" <> video_id <> "/destinations"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_one_time_event_destination_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_one_time_event_destinations_request(base, user_id, video_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/videos/" <> video_id <> "/destinations"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_one_time_event_destinations_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.event_destination_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_project_request(base, user_id, data) {
  let method = http.Post
  let path = "/users/" <> user_id <> "/projects"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_project_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.project_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_projects_request(
  base,
  user_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/projects"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_projects_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.project_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn add_video_credit_request(base, video_id, data) {
  let method = http.Post
  let path = "/videos/" <> video_id <> "/credits"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn add_video_credit_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.credit_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_video_credits_request(
  base,
  video_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/credits"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_credits_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.credit_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn set_video_as_showcase_thumbnail_alt2_request(
  base,
  album_id,
  video_id,
  data,
) {
  let method = http.Post
  let path = "/me/albums/" <> album_id <> "/videos/" <> video_id <> "/set_album_thumbnail"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn set_video_as_showcase_thumbnail_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.album_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn follow_users_request(base, user_id, data) {
  let method = http.Post
  let path = "/users/" <> user_id <> "/following"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn follow_users_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_user_following_request(
  base,
  user_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/following"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_user_following_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_vod_purchases_altone_request(
  base,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  sort sort,
) {
  let method = http.Get
  let path = "/me/ondemand/purchases"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_purchases_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.on_demand_page_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_custom_logo_request(base, user_id, logo_id) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/customlogos/" <> logo_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_custom_logo_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_custom_logo_request(base, user_id, logo_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/customlogos/" <> logo_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_custom_logo_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_one_time_event_m3u8_playback_altone_request(base, video_id) {
  let method = http.Get
  let path = "/me/videos/" <> video_id <> "/m3u8_playback"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_one_time_event_m3u8_playback_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_group_videos_request(
  base,
  group_id,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/groups/" <> group_id <> "/videos"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("filter_embeddable", option.map(filter_embeddable, bool.to_string)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_group_videos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_videos_request(base, user_id, uris uris) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/videos"
  let query = [#("uris", option.Some(uris))]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_videos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn upload_video_request(base, user_id, data) {
  let method = http.Post
  let path = "/users/" <> user_id <> "/videos"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn upload_video_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_videos_request(
  base,
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
  let method = http.Get
  let path = "/users/" <> user_id <> "/videos"
  let query = [
    #("containing_uri", containing_uri),
    #("direction", direction),
    #("filter", filter),
    #("filter_embeddable", option.map(filter_embeddable, bool.to_string)),
    #("filter_playable", option.map(filter_playable, bool.to_string)),
    #(
      "filter_screen_recorded",
      option.map(filter_screen_recorded, bool.to_string),
    ),
    #("filter_tag", filter_tag),
    #("filter_tag_all_of", filter_tag_all_of),
    #("filter_tag_exclude", filter_tag_exclude),
    #("filter_uploader", option.map(filter_uploader, float.to_string)),
    #("include_team_content", include_team_content),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #(
      "query_fields",
      option.map(
        query_fields,
        fn(_) { panic as "query parameter is not supported" },
      ),
    ),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_videos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn edit_live_event_auto_cc_altone_request(base, live_event_id, data) {
  let method = http.Patch
  let path = "/live_events/" <> live_event_id <> "/auto_cc"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_live_event_auto_cc_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(
      body,
      schema.event_automated_closed_captions_decoder(),
    ) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_likes_altone_request(
  base,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/me/likes"
  let query = [
    #("filter", filter),
    #("filter_embeddable", option.map(filter_embeddable, bool.to_string)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_likes_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_vod_genre_request(base, genre_id) {
  let method = http.Get
  let path = "/ondemand/genres/" <> genre_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_genre_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.on_demand_genre_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_vod_likes_request(
  base,
  ondemand_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  sort sort,
) {
  let method = http.Get
  let path = "/ondemand/pages/" <> ondemand_id <> "/likes"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_likes_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn remove_videos_from_live_event_altone_request(base, live_event_id, data) {
  let method = http.Delete
  let path = "/live_events/" <> live_event_id <> "/videos"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn remove_videos_from_live_event_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn add_videos_to_live_event_altone_request(base, live_event_id, data) {
  let method = http.Post
  let path = "/live_events/" <> live_event_id <> "/videos"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn add_videos_to_live_event_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_videos_altone_request(
  base,
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
  let method = http.Get
  let path = "/live_events/" <> live_event_id <> "/videos"
  let query = [
    #("containing_uri", containing_uri),
    #("direction", direction),
    #("filter", filter),
    #("filter_embeddable", option.map(filter_embeddable, bool.to_string)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_videos_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_channel_subscribers_request(
  base,
  channel_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/channels/" <> channel_id <> "/users"
  let query = [
    #("direction", direction),
    #("filter", option.Some(filter)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_channel_subscribers_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn update_live_event_altone_request(base, live_event_id, data) {
  let method = http.Patch
  let path = "/live_events/" <> live_event_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn update_live_event_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.recurring_event_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_live_event_altone_request(base, live_event_id) {
  let method = http.Delete
  let path = "/live_events/" <> live_event_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_live_event_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_altone_request(base, live_event_id, password password) {
  let method = http.Get
  let path = "/live_events/" <> live_event_id
  let query = [#("password", password)]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.recurring_event_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_appearances_request(
  base,
  user_id,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/appearances"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("filter_embeddable", option.map(filter_embeddable, bool.to_string)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_appearances_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_video_likes_altone_request(
  base,
  channel_id,
  video_id,
  direction direction,
  page page,
  per_page per_page,
  sort sort,
) {
  let method = http.Get
  let path = "/channels/" <> channel_id <> "/videos/" <> video_id <> "/likes"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_likes_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn edit_user_request(base, user_id, data) {
  let method = http.Patch
  let path = "/users/" <> user_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_user_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.user_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_user_request(base, user_id) {
  let method = http.Get
  let path = "/users/" <> user_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_user_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.user_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn check_category_for_video_request(base, category, video_id) {
  let method = http.Get
  let path = "/categories/" <> category <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn check_category_for_video_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_group_request(base, group_id) {
  let method = http.Delete
  let path = "/groups/" <> group_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_group_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn get_group_request(base, group_id) {
  let method = http.Get
  let path = "/groups/" <> group_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_group_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.group_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn set_live_event_whitelist_alt2_request(base, live_event_id, data) {
  let method = http.Put
  let path = "/me/live_events/" <> live_event_id <> "/privacy/domains"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn set_live_event_whitelist_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_whitelist_alt2_request(base, live_event_id) {
  let method = http.Get
  let path = "/me/live_events/" <> live_event_id <> "/privacy/domains"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_whitelist_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.domain_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_portfolios_altone_request(
  base,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/me/portfolios"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_portfolios_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.portfolio_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn check_if_user_owns_video_altone_request(base, video_id) {
  let method = http.Get
  let path = "/me/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn check_if_user_owns_video_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn edit_live_event_thumbnail_altone_request(
  base,
  live_event_id,
  thumbnail_id,
  data,
) {
  let method = http.Patch
  let path = "/live_events/" <> live_event_id <> "/pictures/" <> thumbnail_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_live_event_thumbnail_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_live_event_thumbnail_altone_request(
  base,
  live_event_id,
  thumbnail_id,
) {
  let method = http.Delete
  let path = "/live_events/" <> live_event_id <> "/pictures/" <> thumbnail_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_live_event_thumbnail_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_thumbnail_altone_request(base, live_event_id, thumbnail_id) {
  let method = http.Get
  let path = "/live_events/" <> live_event_id <> "/pictures/" <> thumbnail_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_thumbnail_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_video_from_vod_request(base, ondemand_id, video_id) {
  let method = http.Delete
  let path = "/ondemand/pages/" <> ondemand_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_video_from_vod_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn add_video_to_vod_request(base, ondemand_id, video_id, data) {
  let method = http.Put
  let path = "/ondemand/pages/" <> ondemand_id <> "/videos/" <> video_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn add_video_to_vod_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.on_demand_video_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_vod_video_request(base, ondemand_id, video_id) {
  let method = http.Get
  let path = "/ondemand/pages/" <> ondemand_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_video_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn unlike_video_request(base, user_id, video_id) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/likes/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn unlike_video_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn like_video_request(base, user_id, video_id) {
  let method = http.Put
  let path = "/users/" <> user_id <> "/likes/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn like_video_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn check_if_user_liked_video_request(base, user_id, video_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/likes/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn check_if_user_liked_video_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_live_event_video_request(base, user_id, live_event_id, video_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_video_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_picture_request(base, user_id) {
  let method = http.Post
  let path = "/users/" <> user_id <> "/pictures"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn create_picture_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_pictures_request(base, user_id, page page, per_page per_page) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/pictures"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_pictures_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.picture_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn list_payment_methods_request(
  base,
  data,
  cardmember_name cardmember_name,
  page page,
  per_page per_page,
  show_disabled show_disabled,
) {
  let method = http.Get
  let path = "/me/payment_methods"
  let query = [
    #("cardmember_name", cardmember_name),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("show_disabled", option.map(show_disabled, bool.to_string))
  ]
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn list_payment_methods_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.payment_method_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_live_event_thumbnail_altone_request(base, live_event_id, data) {
  let method = http.Post
  let path = "/live_events/" <> live_event_id <> "/pictures"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_live_event_thumbnail_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_thumbnails_altone_request(base, live_event_id) {
  let method = http.Get
  let path = "/live_events/" <> live_event_id <> "/pictures"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_thumbnails_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.picture_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_unsaved_chapter_thumbnail_request(base, video_id, uid) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/chapters/temporary/pictures/" <> uid
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_unsaved_chapter_thumbnail_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn set_video_as_showcase_featured_alt2_request(base, album_id, video_id) {
  let method = http.Patch
  let path = "/me/albums/" <> album_id <> "/videos/" <> video_id <> "/set_featured_video"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn set_video_as_showcase_featured_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.album_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_from_watch_history_request(base, video_id) {
  let method = http.Delete
  let path = "/me/watched/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_from_watch_history_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn add_video_credit_altone_request(base, channel_id, video_id, data) {
  let method = http.Post
  let path = "/channels/" <> channel_id <> "/videos/" <> video_id <> "/credits"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn add_video_credit_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.credit_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_video_credits_altone_request(
  base,
  channel_id,
  video_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/channels/" <> channel_id <> "/videos/" <> video_id <> "/credits"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_credits_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.credit_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn remove_video_from_showcase_request(base, user_id, album_id, video_id) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/albums/" <> album_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn remove_video_from_showcase_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn add_video_to_showcase_request(base, user_id, album_id, video_id) {
  let method = http.Put
  let path = "/users/" <> user_id <> "/albums/" <> album_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_video_to_showcase_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_showcase_video_request(
  base,
  user_id,
  album_id,
  video_id,
  password password,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/albums/" <> album_id <> "/videos/" <> video_id
  let query = [#("password", password)]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_showcase_video_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn add_channel_categories_request(base, channel_id, data) {
  let method = http.Put
  let path = "/channels/" <> channel_id <> "/categories"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn add_channel_categories_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn get_channel_categories_request(base, channel_id) {
  let method = http.Get
  let path = "/channels/" <> channel_id <> "/categories"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_channel_categories_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.category_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_audio_tracks_request(base, video_id, version_id) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/versions/" <> version_id <> "/audiotracks/"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_audio_tracks_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(
      body,
      decode.list(schema.alternate_audio_track_decoder()),
    ) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_live_events_request(base, user_id, data) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/live_events"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn delete_live_events_response(response) {
  let response.Response(status:, ..) = response
  case status {
    _ -> response |> Error |> Ok
  }
}

pub fn create_live_event_request(base, user_id, data) {
  let method = http.Post
  let path = "/users/" <> user_id <> "/live_events"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_live_event_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.recurring_event_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_events_request(
  base,
  user_id,
  data,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
  type_ type_,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/live_events"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort),
    #("type_", type_)
  ]
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn get_live_events_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.event_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn edit_video_version_request(base, video_id, version_id, data) {
  let method = http.Patch
  let path = "/videos/" <> video_id <> "/versions/" <> version_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_video_version_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_version_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn delete_video_version_request(base, video_id, version_id) {
  let method = http.Delete
  let path = "/videos/" <> video_id <> "/versions/" <> version_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_video_version_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_video_version_request(base, video_id, version_id) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/versions/" <> version_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_version_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_version_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_user_groups_request(
  base,
  user_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/groups"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_user_groups_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.group_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_custom_logo_altone_request(base) {
  let method = http.Post
  let path = "/me/customlogos"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn create_custom_logo_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_custom_logos_altone_request(
  base,
  page page,
  per_page per_page,
  sizes sizes,
) {
  let method = http.Get
  let path = "/me/customlogos"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sizes", sizes)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_custom_logos_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.picture_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn create_animated_thumbset_request(base, video_id, data) {
  let method = http.Post
  let path = "/videos/" <> video_id <> "/animated_thumbsets"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_animated_thumbset_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.animated_thumbset_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_all_animated_thumbset_request(
  base,
  video_id,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/animated_thumbsets"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_all_animated_thumbset_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.animated_thumbset_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn unsubscribe_from_category_altone_request(base, category) {
  let method = http.Delete
  let path = "/me/categories/" <> category
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn unsubscribe_from_category_altone_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn subscribe_to_category_altone_request(base, category) {
  let method = http.Put
  let path = "/me/categories/" <> category
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn subscribe_to_category_altone_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn check_if_user_subscribed_to_category_altone_request(base, category) {
  let method = http.Get
  let path = "/me/categories/" <> category
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn check_if_user_subscribed_to_category_altone_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn get_portfolio_videos_request(
  base,
  user_id,
  portfolio_id,
  containing_uri containing_uri,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  sort sort,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/portfolios/" <> portfolio_id <> "/videos"
  let query = [
    #("containing_uri", containing_uri),
    #("filter", filter),
    #("filter_embeddable", option.map(filter_embeddable, bool.to_string)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_portfolio_videos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_endpoints_request(base, openapi openapi, version version) {
  let method = http.Get
  let path = "/"
  let query = [
    #("openapi", option.map(openapi, bool.to_string)),
    #("version", version)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_endpoints_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.endpoint_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn activate_live_event_altone_request(base, live_event_id, data) {
  let method = http.Post
  let path = "/live_events/" <> live_event_id <> "/activate"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn activate_live_event_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_available_video_groups_request(base, video_id) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/available_groups"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_available_video_groups_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.group_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn unsubscribe_from_channel_request(base, user_id, channel_id) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/channels/" <> channel_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn unsubscribe_from_channel_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn subscribe_to_channel_request(base, user_id, channel_id) {
  let method = http.Put
  let path = "/users/" <> user_id <> "/channels/" <> channel_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn subscribe_to_channel_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn check_if_user_subscribed_to_channel_request(base, user_id, channel_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/channels/" <> channel_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn check_if_user_subscribed_to_channel_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn check_if_vod_was_purchased_altone_request(base, ondemand_id) {
  let method = http.Get
  let path = "/me/ondemand/purchases/" <> ondemand_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn check_if_vod_was_purchased_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.on_demand_page_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn edit_project_altone_request(base, project_id, data) {
  let method = http.Patch
  let path = "/me/projects/" <> project_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_project_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.project_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_project_altone_request(
  base,
  project_id,
  should_delete_clips should_delete_clips,
) {
  let method = http.Delete
  let path = "/me/projects/" <> project_id
  let query = [
    #("should_delete_clips", option.map(should_delete_clips, bool.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_project_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_project_altone_request(base, project_id) {
  let method = http.Get
  let path = "/me/projects/" <> project_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_project_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.project_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_live_event_destination_altone_request(
  base,
  user_id,
  live_event_id,
  data,
) {
  let method = http.Post
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/destinations"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_live_event_destination_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.event_destination_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_destinations_altone_request(base, user_id, live_event_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/destinations"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_destinations_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.event_destination_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn replace_videos_in_showcase_alt2_request(base, album_id, data) {
  let method = http.Put
  let path = "/me/albums/" <> album_id <> "/videos"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn replace_videos_in_showcase_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_showcase_videos_alt2_request(
  base,
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
  let method = http.Get
  let path = "/me/albums/" <> album_id <> "/videos"
  let query = [
    #("containing_uri", containing_uri),
    #("direction", direction),
    #("filter", filter),
    #("filter_embeddable", option.map(filter_embeddable, bool.to_string)),
    #("page", option.map(page, float.to_string)),
    #("password", password),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort),
    #("weak_search", option.map(weak_search, bool.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_showcase_videos_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_video_from_watch_later_altone_request(base, video_id) {
  let method = http.Delete
  let path = "/me/watchlater/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_video_from_watch_later_altone_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn add_video_to_watch_later_altone_request(base, video_id) {
  let method = http.Put
  let path = "/me/watchlater/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_video_to_watch_later_altone_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn check_watch_later_queue_altone_request(base, video_id) {
  let method = http.Get
  let path = "/me/watchlater/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn check_watch_later_queue_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_embed_preset_videos_altone_request(
  base,
  preset_id,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/me/presets/" <> preset_id <> "/videos"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_embed_preset_videos_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn set_channel_privacy_users_request(base, channel_id, data) {
  let method = http.Put
  let path = "/channels/" <> channel_id <> "/privacy/users"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn set_channel_privacy_users_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_channel_privacy_users_request(
  base,
  channel_id,
  direction direction,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/channels/" <> channel_id <> "/privacy/users"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_channel_privacy_users_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_vod_season_videos_request(
  base,
  ondemand_id,
  season_id,
  filter filter,
  page page,
  per_page per_page,
  sort sort,
) {
  let method = http.Get
  let path = "/ondemand/pages/" <> ondemand_id <> "/seasons/" <> season_id <> "/videos"
  let query = [
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_season_videos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn edit_picture_request(base, user_id, portraitset_id, data) {
  let method = http.Patch
  let path = "/users/" <> user_id <> "/pictures/" <> portraitset_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_picture_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn delete_picture_request(base, user_id, portraitset_id) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/pictures/" <> portraitset_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_picture_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn get_picture_request(base, user_id, portraitset_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/pictures/" <> portraitset_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_picture_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_followers_altone_request(
  base,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/me/followers"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_followers_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn remove_videos_from_live_event_alt2_request(base, live_event_id, data) {
  let method = http.Delete
  let path = "/me/live_events/" <> live_event_id <> "/videos"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn remove_videos_from_live_event_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn add_videos_to_live_event_alt2_request(base, live_event_id, data) {
  let method = http.Post
  let path = "/me/live_events/" <> live_event_id <> "/videos"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn add_videos_to_live_event_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_videos_alt2_request(
  base,
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
  let method = http.Get
  let path = "/me/live_events/" <> live_event_id <> "/videos"
  let query = [
    #("containing_uri", containing_uri),
    #("direction", direction),
    #("filter", filter),
    #("filter_embeddable", option.map(filter_embeddable, bool.to_string)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_videos_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_available_destinations_altone_request(base) {
  let method = http.Get
  let path = "/me/destinations"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_available_destinations_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn remove_videos_from_project_request(
  base,
  user_id,
  project_id,
  should_delete_clips should_delete_clips,
  uris uris,
) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/projects/" <> project_id <> "/videos"
  let query = [
    #("should_delete_clips", option.map(should_delete_clips, bool.to_string)),
    #("uris", option.Some(uris))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn remove_videos_from_project_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn add_videos_to_project_request(base, user_id, project_id, uris uris) {
  let method = http.Put
  let path = "/users/" <> user_id <> "/projects/" <> project_id <> "/videos"
  let query = [#("uris", option.Some(uris))]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_videos_to_project_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_project_videos_request(
  base,
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
  let method = http.Get
  let path = "/users/" <> user_id <> "/projects/" <> project_id <> "/videos"
  let query = [
    #("direction", direction),
    #("filter_tag", filter_tag),
    #("filter_tag_all_of", filter_tag_all_of),
    #("filter_tag_exclude", filter_tag_exclude),
    #("include_subfolders", option.map(include_subfolders, bool.to_string)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("query_fields", query_fields),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_project_videos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn developer_tutorial_request(base) {
  let method = http.Get
  let path = "/tutorial"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn developer_tutorial_response(response) {
  let response.Response(status:, ..) = response
  case status {
    _ -> response |> Error |> Ok
  }
}

pub fn add_tags_to_channel_request(base, channel_id) {
  let method = http.Put
  let path = "/channels/" <> channel_id <> "/tags"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_tags_to_channel_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.tag_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_channel_tags_request(base, channel_id) {
  let method = http.Get
  let path = "/channels/" <> channel_id <> "/tags"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_channel_tags_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.tag_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_channel_subscriptions_request(
  base,
  user_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/channels"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_channel_subscriptions_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.channel_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_portfolio_altone_request(base, portfolio_id) {
  let method = http.Get
  let path = "/me/portfolios/" <> portfolio_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_portfolio_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.portfolio_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn create_video_custom_logo_request(base, video_id) {
  let method = http.Post
  let path = "/videos/" <> video_id <> "/timelinethumbnails"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn create_video_custom_logo_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn remove_videos_from_channel_request(base, channel_id, data) {
  let method = http.Delete
  let path = "/channels/" <> channel_id <> "/videos"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn remove_videos_from_channel_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn add_videos_to_channel_request(base, channel_id, data) {
  let method = http.Put
  let path = "/channels/" <> channel_id <> "/videos"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn add_videos_to_channel_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_channel_videos_request(
  base,
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
  let method = http.Get
  let path = "/channels/" <> channel_id <> "/videos"
  let query = [
    #("containing_uri", containing_uri),
    #("direction", direction),
    #("filter", filter),
    #("filter_embeddable", option.map(filter_embeddable, bool.to_string)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_channel_videos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_group_members_request(
  base,
  group_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/groups/" <> group_id <> "/users"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_group_members_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn set_live_event_whitelist_altone_request(base, live_event_id, data) {
  let method = http.Put
  let path = "/live_events/" <> live_event_id <> "/privacy/domains"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn set_live_event_whitelist_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_whitelist_altone_request(base, live_event_id) {
  let method = http.Get
  let path = "/live_events/" <> live_event_id <> "/privacy/domains"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_whitelist_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.domain_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_showcase_custom_thumb_request(base, user_id, album_id) {
  let method = http.Post
  let path = "/users/" <> user_id <> "/albums/" <> album_id <> "/custom_thumbnails"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn create_showcase_custom_thumb_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_showcase_custom_thumbs_request(
  base,
  user_id,
  album_id,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/albums/" <> album_id <> "/custom_thumbnails"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_showcase_custom_thumbs_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.picture_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_content_ratings_request(base) {
  let method = http.Get
  let path = "/contentratings"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_content_ratings_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.content_rating_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn create_embed_presets_altone_request(base, data) {
  let method = http.Post
  let path = "/me/presets"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_embed_presets_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.preset_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_embed_presets_altone_request(base, page page, per_page per_page) {
  let method = http.Get
  let path = "/me/presets"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_embed_presets_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.preset_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn create_showcase_altone_request(base, data) {
  let method = http.Post
  let path = "/me/albums"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_showcase_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.album_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_showcases_altone_request(
  base,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/me/albums"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_showcases_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.album_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_languages_request(base, filter filter, page page, per_page per_page) {
  let method = http.Get
  let path = "/languages"
  let query = [
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_languages_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.language_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_team_role_information_request(base, user_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/team/role"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_team_role_information_response(response) {
  let response.Response(status:, ..) = response
  case status {
    _ -> response |> Error |> Ok
  }
}

pub fn get_categories_request(
  base,
  direction direction,
  page page,
  per_page per_page,
  sort sort,
) {
  let method = http.Get
  let path = "/categories"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_categories_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.category_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn edit_video_request(base, video_id, data) {
  let method = http.Patch
  let path = "/videos/" <> video_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_video_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_video_request(base, video_id) {
  let method = http.Delete
  let path = "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_video_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_video_request(base, video_id, time_links time_links) {
  let method = http.Get
  let path = "/videos/" <> video_id
  let query = [#("time_links", option.map(time_links, bool.to_string))]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_video_tag_request(base, video_id, word) {
  let method = http.Delete
  let path = "/videos/" <> video_id <> "/tags/" <> word
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_video_tag_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn add_video_tag_request(base, video_id, word) {
  let method = http.Put
  let path = "/videos/" <> video_id <> "/tags/" <> word
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_video_tag_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.tag_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn check_video_for_tag_request(base, video_id, word) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/tags/" <> word
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn check_video_for_tag_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.tag_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_available_video_channels_request(base, video_id) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/available_channels"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_available_video_channels_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.channel_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_user_analytics_request(
  base,
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
  let method = http.Get
  let path = "/users/" <> user_id <> "/analytics"
  let query = [
    #("dimension", option.Some(dimension)),
    #("direction", direction),
    #("filter_content", filter_content),
    #(
      "filter_countries",
      option.map(
        filter_countries,
        fn(_) { panic as "query parameter is not supported" },
      ),
    ),
    #(
      "filter_device_types",
      option.map(
        filter_device_types,
        fn(_) { panic as "query parameter is not supported" },
      ),
    ),
    #(
      "filter_embed_domains",
      option.map(
        filter_embed_domains,
        fn(_) { panic as "query parameter is not supported" },
      ),
    ),
    #(
      "filter_regions",
      option.map(
        filter_regions,
        fn(_) { panic as "query parameter is not supported" },
      ),
    ),
    #(
      "filter_streaming_types",
      option.map(
        filter_streaming_types,
        fn(_) { panic as "query parameter is not supported" },
      ),
    ),
    #("from", option.Some(from)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort),
    #("time_interval", time_interval),
    #("to", option.Some(to))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_user_analytics_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.analytics_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_available_showcase_videos_request(
  base,
  album_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/albums/" <> album_id <> "/available_videos"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_available_showcase_videos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn toggle_rle_low_latency_request(base, user_id, live_event_id, data) {
  let method = http.Patch
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/low_latency"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn toggle_rle_low_latency_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.recurring_event_low_latency_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_chapter_request(base, video_id, data) {
  let method = http.Post
  let path = "/videos/" <> video_id <> "/chapters"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_chapter_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.chapter_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_chapters_request(base, video_id, page page, per_page per_page) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/chapters"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_chapters_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.chapter_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_cc_licenses_request(base, page page, per_page per_page) {
  let method = http.Get
  let path = "/creativecommons"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_cc_licenses_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.creative_commons_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn create_chapter_thumbnail_or_upload_link_request(
  base,
  video_id,
  chapter_id,
  data,
) {
  let method = http.Post
  let path = "/videos/" <> video_id <> "/chapters/" <> chapter_id <> "/pictures"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_chapter_thumbnail_or_upload_link_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_chapter_thumbnails_request(base, video_id, chapter_id) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/chapters/" <> chapter_id <> "/pictures"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_chapter_thumbnails_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_vod_region_request(base, ondemand_id, country) {
  let method = http.Delete
  let path = "/ondemand/pages/" <> ondemand_id <> "/regions/" <> country
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_vod_region_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn add_vod_region_request(base, ondemand_id, country) {
  let method = http.Put
  let path = "/ondemand/pages/" <> ondemand_id <> "/regions/" <> country
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_vod_region_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.on_demand_region_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_vod_region_request(base, ondemand_id, country) {
  let method = http.Get
  let path = "/ondemand/pages/" <> ondemand_id <> "/regions/" <> country
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_region_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.on_demand_region_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn create_live_event_thumbnail_alt2_request(base, live_event_id, data) {
  let method = http.Post
  let path = "/me/live_events/" <> live_event_id <> "/pictures"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_live_event_thumbnail_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_thumbnails_alt2_request(base, live_event_id) {
  let method = http.Get
  let path = "/me/live_events/" <> live_event_id <> "/pictures"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_thumbnails_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.picture_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_genre_vods_request(
  base,
  genre_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/ondemand/genres/" <> genre_id <> "/pages"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_genre_vods_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.on_demand_page_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_token_request(base) {
  let method = http.Delete
  let path = "/tokens"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_token_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_regions_request(base) {
  let method = http.Get
  let path = "/ondemand/regions"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_regions_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.on_demand_region_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_vod_purchases_request(
  base,
  user_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  sort sort,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/ondemand/purchases"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_purchases_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.on_demand_page_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_custom_logo_altone_request(base, logo_id) {
  let method = http.Delete
  let path = "/me/customlogos/" <> logo_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_custom_logo_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_custom_logo_altone_request(base, logo_id) {
  let method = http.Get
  let path = "/me/customlogos/" <> logo_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_custom_logo_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_video_privacy_domain_request(base, video_id, domain) {
  let method = http.Delete
  let path = "/videos/" <> video_id <> "/privacy/domains/" <> domain
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_video_privacy_domain_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn add_video_privacy_domain_request(base, video_id, domain) {
  let method = http.Put
  let path = "/videos/" <> video_id <> "/privacy/domains/" <> domain
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_video_privacy_domain_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn follow_users_altone_request(base, data) {
  let method = http.Post
  let path = "/me/following"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn follow_users_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_user_following_altone_request(
  base,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/me/following"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_user_following_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn activate_live_event_alt2_request(base, live_event_id, data) {
  let method = http.Post
  let path = "/me/live_events/" <> live_event_id <> "/activate"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn activate_live_event_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_category_request(base, category) {
  let method = http.Get
  let path = "/categories/" <> category
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_category_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.category_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_vod_seasons_request(
  base,
  ondemand_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  sort sort,
) {
  let method = http.Get
  let path = "/ondemand/pages/" <> ondemand_id <> "/seasons"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_seasons_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.on_demand_season_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_videos_with_tag_request(
  base,
  word,
  direction direction,
  page page,
  per_page per_page,
  sort sort,
) {
  let method = http.Get
  let path = "/tags/" <> word <> "/videos"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_videos_with_tag_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn add_or_remove_multiple_albums_request(base, video_id, data) {
  let method = http.Patch
  let path = "/videos/" <> video_id <> "/albums"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn add_or_remove_multiple_albums_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.album_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_video_albums_request(base, video_id, page page, per_page per_page) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/albums"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_albums_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.album_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_m3u8_playback_request(
  base,
  user_id,
  live_event_id,
  max_fps_fhd max_fps_fhd,
  ttl ttl,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/m3u8_playback"
  let query = [
    #("max_fps_fhd", option.map(max_fps_fhd, float.to_string)),
    #("ttl", option.map(ttl, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_m3u8_playback_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_vod_altone_request(base, data) {
  let method = http.Post
  let path = "/me/ondemand/pages"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_vod_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.on_demand_page_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_user_vods_altone_request(
  base,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  sort sort,
) {
  let method = http.Get
  let path = "/me/ondemand/pages"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_user_vods_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.on_demand_page_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn edit_live_event_auto_cc_request(base, user_id, live_event_id, data) {
  let method = http.Patch
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/auto_cc"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_live_event_auto_cc_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(
      body,
      schema.event_automated_closed_captions_decoder(),
    ) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn edit_user_altone_request(base, data) {
  let method = http.Patch
  let path = "/me"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_user_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.user_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_user_altone_request(base) {
  let method = http.Get
  let path = "/me"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_user_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.user_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn edit_vod_request(base, ondemand_id, data) {
  let method = http.Patch
  let path = "/ondemand/pages/" <> ondemand_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_vod_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.on_demand_page_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_vod_draft_request(base, ondemand_id) {
  let method = http.Delete
  let path = "/ondemand/pages/" <> ondemand_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_vod_draft_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_vod_request(base, ondemand_id) {
  let method = http.Get
  let path = "/ondemand/pages/" <> ondemand_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.on_demand_page_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_portfolios_request(
  base,
  user_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/portfolios"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_portfolios_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.portfolio_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn delete_channel_privacy_user_request(base, channel_id, user_id) {
  let method = http.Delete
  let path = "/channels/" <> channel_id <> "/privacy/users/" <> user_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_channel_privacy_user_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn set_channel_privacy_user_request(base, channel_id, user_id) {
  let method = http.Put
  let path = "/channels/" <> channel_id <> "/privacy/users/" <> user_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn set_channel_privacy_user_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_appearances_altone_request(
  base,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/me/appearances"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("filter_embeddable", option.map(filter_embeddable, bool.to_string)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_appearances_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn search_videos_request(
  base,
  direction direction,
  filter filter,
  links links,
  page page,
  per_page per_page,
  query query,
  sort sort,
  uris uris,
) {
  let method = http.Get
  let path = "/videos"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("links", links),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort),
    #("uris", uris)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn search_videos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn unfollow_user_altone_request(base, follow_user_id) {
  let method = http.Delete
  let path = "/me/following/" <> follow_user_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn unfollow_user_altone_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn follow_user_altone_request(base, follow_user_id) {
  let method = http.Put
  let path = "/me/following/" <> follow_user_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn follow_user_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn check_if_user_is_following_altone_request(base, follow_user_id) {
  let method = http.Get
  let path = "/me/following/" <> follow_user_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn check_if_user_is_following_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn update_live_event_request(base, user_id, live_event_id, data) {
  let method = http.Patch
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn update_live_event_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.recurring_event_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_live_event_request(base, user_id, live_event_id) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_live_event_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_request(base, user_id, live_event_id, password password) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id
  let query = [#("password", password)]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.recurring_event_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn edit_embed_preset_request(base, user_id, preset_id, data) {
  let method = http.Patch
  let path = "/users/" <> user_id <> "/presets/" <> preset_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_embed_preset_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.preset_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_embed_preset_request(base, user_id, preset_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/presets/" <> preset_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_embed_preset_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.preset_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn end_live_event_alt2_request(base, live_event_id, clip_id clip_id) {
  let method = http.Post
  let path = "/me/live_events/" <> live_event_id <> "/end"
  let query = [#("clip_id", option.map(clip_id, float.to_string))]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn end_live_event_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_video_from_channel_request(base, channel_id, video_id) {
  let method = http.Delete
  let path = "/channels/" <> channel_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_video_from_channel_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn add_video_to_channel_request(base, channel_id, video_id) {
  let method = http.Put
  let path = "/channels/" <> channel_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_video_to_channel_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_channel_video_request(base, channel_id, video_id) {
  let method = http.Get
  let path = "/channels/" <> channel_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_channel_video_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn clip_trim_request(base, video_id, data) {
  let method = http.Post
  let path = "/videos/" <> video_id <> "/trim"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn clip_trim_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.trimmed_video_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn leave_group_request(base, user_id, group_id) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/groups/" <> group_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn leave_group_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn join_group_request(base, user_id, group_id) {
  let method = http.Put
  let path = "/users/" <> user_id <> "/groups/" <> group_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn join_group_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn check_if_user_joined_group_request(base, user_id, group_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/groups/" <> group_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn check_if_user_joined_group_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn edit_showcase_request(base, user_id, album_id, data) {
  let method = http.Patch
  let path = "/users/" <> user_id <> "/albums/" <> album_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_showcase_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.album_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_showcase_request(base, user_id, album_id) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/albums/" <> album_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_showcase_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_showcase_request(base, user_id, album_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/albums/" <> album_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_showcase_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.album_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn update_live_event_destination_request(base, destination_id, data) {
  let method = http.Patch
  let path = "/destination/" <> destination_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn update_live_event_destination_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.event_destination_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_live_event_destination_request(base, destination_id) {
  let method = http.Delete
  let path = "/destination/" <> destination_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_live_event_destination_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_destination_request(base, destination_id) {
  let method = http.Get
  let path = "/destination/" <> destination_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_destination_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.event_destination_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_feed_altone_request(
  base,
  offset offset,
  page page,
  per_page per_page,
  type_ type_,
) {
  let method = http.Get
  let path = "/me/feed"
  let query = [
    #("offset", offset),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("type_", type_)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_feed_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.activity_3_one_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn complete_streaming_upload_request(
  base,
  user_id,
  upload_id,
  signature signature,
  video_file_id video_file_id,
) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/uploads/" <> upload_id
  let query = [
    #("signature", option.Some(signature)),
    #("video_file_id", option.Some(float.to_string(video_file_id)))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn complete_streaming_upload_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_upload_attempt_request(base, user_id, upload_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/uploads/" <> upload_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_upload_attempt_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.upload_attempt_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn delete_animated_thumbset_request(base, video_id, picture_id) {
  let method = http.Delete
  let path = "/videos/" <> video_id <> "/animated_thumbsets/" <> picture_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_animated_thumbset_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_animated_thumbset_request(base, video_id, picture_id) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/animated_thumbsets/" <> picture_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_animated_thumbset_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.animated_thumbset_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_vod_genres_request(base) {
  let method = http.Get
  let path = "/ondemand/genres"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_genres_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.on_demand_genre_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn remove_video_from_showcase_alt2_request(base, album_id, video_id) {
  let method = http.Delete
  let path = "/me/albums/" <> album_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn remove_video_from_showcase_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn add_video_to_showcase_alt2_request(base, album_id, video_id) {
  let method = http.Put
  let path = "/me/albums/" <> album_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_video_to_showcase_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_showcase_video_alt2_request(
  base,
  album_id,
  video_id,
  password password,
) {
  let method = http.Get
  let path = "/me/albums/" <> album_id <> "/videos/" <> video_id
  let query = [#("password", password)]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_showcase_video_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn edit_live_event_thumbnail_request(
  base,
  user_id,
  live_event_id,
  thumbnail_id,
  data,
) {
  let method = http.Patch
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/pictures/" <> thumbnail_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_live_event_thumbnail_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_live_event_thumbnail_request(
  base,
  user_id,
  live_event_id,
  thumbnail_id,
) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/pictures/" <> thumbnail_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_live_event_thumbnail_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_thumbnail_request(
  base,
  user_id,
  live_event_id,
  thumbnail_id,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/pictures/" <> thumbnail_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_thumbnail_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn exchange_auth_code_request(base, data) {
  let method = http.Post
  let path = "/oauth/access_token"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn exchange_auth_code_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.auth_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.auth_error_decoder()) |> result.map(Error)
  }
}

pub fn remove_video_from_project_request(base, user_id, project_id, video_id) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/projects/" <> project_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn remove_video_from_project_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn add_video_to_project_request(base, user_id, project_id, video_id) {
  let method = http.Put
  let path = "/users/" <> user_id <> "/projects/" <> project_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_video_to_project_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_video_alt2_request(base, live_event_id, video_id) {
  let method = http.Get
  let path = "/me/live_events/" <> live_event_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_video_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_watch_later_queue_altone_request(
  base,
  direction direction,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/me/watchlater"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("filter_embeddable", option.map(filter_embeddable, bool.to_string)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_watch_later_queue_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn set_video_as_showcase_featured_request(base, user_id, album_id, video_id) {
  let method = http.Patch
  let path = "/users/" <> user_id <> "/albums/" <> album_id <> "/videos/" <> video_id <> "/set_featured_video"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn set_video_as_showcase_featured_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.album_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_live_events_alt2_request(base, data) {
  let method = http.Delete
  let path = "/me/live_events"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn delete_live_events_alt2_response(response) {
  let response.Response(status:, ..) = response
  case status {
    _ -> response |> Error |> Ok
  }
}

pub fn create_live_event_alt2_request(base, data) {
  let method = http.Post
  let path = "/me/live_events"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_live_event_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.recurring_event_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_events_alt2_request(
  base,
  data,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
  type_ type_,
) {
  let method = http.Get
  let path = "/me/live_events"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort),
    #("type_", type_)
  ]
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn get_live_events_alt2_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.event_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_category_subscriptions_altone_request(
  base,
  direction direction,
  page page,
  per_page per_page,
  sort sort,
) {
  let method = http.Get
  let path = "/me/categories"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_category_subscriptions_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.category_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_video_versions_altone_request(
  base,
  channel_id,
  video_id,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/channels/" <> channel_id <> "/videos/" <> video_id <> "/versions"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_versions_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_version_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_video_privacy_domains_request(
  base,
  video_id,
  direction direction,
  page page,
  per_page per_page,
  sort sort,
) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/privacy/domains"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_privacy_domains_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.domain_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn edit_audio_track_request(base, video_id, version_id, audiotrack_id, data) {
  let method = http.Patch
  let path = "/videos/" <> video_id <> "/versions/" <> version_id <> "/audiotracks/" <> audiotrack_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_audio_track_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.alternate_audio_track_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_audio_track_request(base, video_id, version_id, audiotrack_id) {
  let method = http.Delete
  let path = "/videos/" <> video_id <> "/versions/" <> version_id <> "/audiotracks/" <> audiotrack_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_audio_track_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_audio_track_request(base, video_id, version_id, audiotrack_id) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/versions/" <> version_id <> "/audiotracks/" <> audiotrack_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_audio_track_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.alternate_audio_track_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn create_group_request(base, data) {
  let method = http.Post
  let path = "/groups"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_group_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.group_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_groups_request(
  base,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/groups"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_groups_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.group_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_channel_category_request(base, channel_id, category) {
  let method = http.Delete
  let path = "/channels/" <> channel_id <> "/categories/" <> category
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_channel_category_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn categorize_channel_request(base, channel_id, category) {
  let method = http.Put
  let path = "/channels/" <> channel_id <> "/categories/" <> category
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn categorize_channel_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn delete_video_from_portfolio_request(base, user_id, portfolio_id, video_id) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/portfolios/" <> portfolio_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_video_from_portfolio_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn add_video_to_portfolio_request(base, user_id, portfolio_id, video_id) {
  let method = http.Put
  let path = "/users/" <> user_id <> "/portfolios/" <> portfolio_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_video_to_portfolio_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_portfolio_video_request(base, user_id, portfolio_id, video_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/portfolios/" <> portfolio_id <> "/videos/" <> video_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_portfolio_video_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn create_project_altone_request(base, data) {
  let method = http.Post
  let path = "/me/projects"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_project_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.project_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_projects_altone_request(
  base,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/me/projects"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_projects_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.project_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_vod_promotion_request(base, ondemand_id, promotion_id) {
  let method = http.Delete
  let path = "/ondemand/pages/" <> ondemand_id <> "/promotions/" <> promotion_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_vod_promotion_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_vod_promotion_request(base, ondemand_id, promotion_id) {
  let method = http.Get
  let path = "/ondemand/pages/" <> ondemand_id <> "/promotions/" <> promotion_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_promotion_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.on_demand_promotion_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_genre_vod_request(base, genre_id, ondemand_id) {
  let method = http.Get
  let path = "/ondemand/genres/" <> genre_id <> "/pages/" <> ondemand_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_genre_vod_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.on_demand_page_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_vod_genre_request(base, ondemand_id, genre_id) {
  let method = http.Delete
  let path = "/ondemand/pages/" <> ondemand_id <> "/genres/" <> genre_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_vod_genre_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn add_vod_genre_request(base, ondemand_id, genre_id) {
  let method = http.Put
  let path = "/ondemand/pages/" <> ondemand_id <> "/genres/" <> genre_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_vod_genre_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.on_demand_genre_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_vod_genre_by_ondemand_id_request(base, ondemand_id, genre_id) {
  let method = http.Get
  let path = "/ondemand/pages/" <> ondemand_id <> "/genres/" <> genre_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_genre_by_ondemand_id_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.on_demand_genre_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn convert_access_token_request(base, data) {
  let method = http.Post
  let path = "/oauth/authorize/vimeo_oauth1"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn convert_access_token_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.auth_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.auth_error_decoder()) |> result.map(Error)
  }
}

pub fn replace_channel_moderators_request(base, channel_id, data) {
  let method = http.Patch
  let path = "/channels/" <> channel_id <> "/moderators"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn replace_channel_moderators_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn remove_channel_moderators_request(base, channel_id, data) {
  let method = http.Delete
  let path = "/channels/" <> channel_id <> "/moderators"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn remove_channel_moderators_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn add_channel_moderators_request(base, channel_id) {
  let method = http.Put
  let path = "/channels/" <> channel_id <> "/moderators"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn add_channel_moderators_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn get_channel_moderators_request(
  base,
  channel_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/channels/" <> channel_id <> "/moderators"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_channel_moderators_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn create_one_time_event_destination_altone_request(base, video_id, data) {
  let method = http.Post
  let path = "/me/videos/" <> video_id <> "/destinations"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_one_time_event_destination_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_one_time_event_destinations_altone_request(base, video_id) {
  let method = http.Get
  let path = "/me/videos/" <> video_id <> "/destinations"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_one_time_event_destinations_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.event_destination_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn federated_search_user_items_request(
  base,
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
  let method = http.Get
  let path = "/search/" <> user_id <> "/items"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("filter_privacy", filter_privacy),
    #("modified_end_date", modified_end_date),
    #("modified_start_date", modified_start_date),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("query_fields", query_fields),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn federated_search_user_items_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(
      body,
      decode.list(schema.federated_search_items_decoder()),
    ) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn unsubscribe_from_channel_altone_request(base, channel_id) {
  let method = http.Delete
  let path = "/me/channels/" <> channel_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn unsubscribe_from_channel_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn subscribe_to_channel_altone_request(base, channel_id) {
  let method = http.Put
  let path = "/me/channels/" <> channel_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn subscribe_to_channel_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn check_if_user_subscribed_to_channel_altone_request(base, channel_id) {
  let method = http.Get
  let path = "/me/channels/" <> channel_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn check_if_user_subscribed_to_channel_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn delete_watch_history_request(base) {
  let method = http.Delete
  let path = "/me/watched/videos"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_watch_history_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn get_watch_history_request(base, page page, per_page per_page) {
  let method = http.Get
  let path = "/me/watched/videos"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_watch_history_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn set_video_as_showcase_thumbnail_request(
  base,
  user_id,
  album_id,
  video_id,
  data,
) {
  let method = http.Post
  let path = "/users/" <> user_id <> "/albums/" <> album_id <> "/videos/" <> video_id <> "/set_album_thumbnail"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn set_video_as_showcase_thumbnail_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.album_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_embed_preset_videos_request(
  base,
  user_id,
  preset_id,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/presets/" <> preset_id <> "/videos"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_embed_preset_videos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn remove_videos_from_live_event_request(base, user_id, live_event_id, data) {
  let method = http.Delete
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/videos"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn remove_videos_from_live_event_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn add_videos_to_live_event_request(base, user_id, live_event_id, data) {
  let method = http.Post
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/videos"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn add_videos_to_live_event_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_live_event_videos_request(
  base,
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
  let method = http.Get
  let path = "/users/" <> user_id <> "/live_events/" <> live_event_id <> "/videos"
  let query = [
    #("containing_uri", containing_uri),
    #("direction", direction),
    #("filter", filter),
    #("filter_embeddable", option.map(filter_embeddable, bool.to_string)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_event_videos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn edit_picture_altone_request(base, portraitset_id, data) {
  let method = http.Patch
  let path = "/me/pictures/" <> portraitset_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn edit_picture_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn delete_picture_altone_request(base, portraitset_id) {
  let method = http.Delete
  let path = "/me/pictures/" <> portraitset_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_picture_altone_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn get_picture_altone_request(base, portraitset_id) {
  let method = http.Get
  let path = "/me/pictures/" <> portraitset_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_picture_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.picture_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_available_destinations_request(base, user_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/destinations"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_available_destinations_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn replace_videos_in_showcase_request(base, user_id, album_id, data) {
  let method = http.Put
  let path = "/users/" <> user_id <> "/albums/" <> album_id <> "/videos"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn replace_videos_in_showcase_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_showcase_videos_request(
  base,
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
  let method = http.Get
  let path = "/users/" <> user_id <> "/albums/" <> album_id <> "/videos"
  let query = [
    #("containing_uri", containing_uri),
    #("direction", direction),
    #("filter", filter),
    #("filter_embeddable", option.map(filter_embeddable, bool.to_string)),
    #("page", option.map(page, float.to_string)),
    #("password", password),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort),
    #("weak_search", option.map(weak_search, bool.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_showcase_videos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn update_showcases_request(
  base,
  user_id,
  album_item_uris album_item_uris,
  album_uris album_uris,
) {
  let method = http.Patch
  let path = "/users/" <> user_id <> "/albums"
  let query = [
    #("album_item_uris", option.Some(album_item_uris)),
    #("album_uris", option.Some(album_uris))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn update_showcases_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn create_showcase_request(base, user_id, data) {
  let method = http.Post
  let path = "/users/" <> user_id <> "/albums"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_showcase_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.album_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_showcases_request(
  base,
  user_id,
  direction direction,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/albums"
  let query = [
    #("direction", direction),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_showcases_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.album_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_live_ingest_status_request(base, video_id) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/sessions/status"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_live_ingest_status_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.event_session_status_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_likes_request(
  base,
  user_id,
  filter filter,
  filter_embeddable filter_embeddable,
  page page,
  per_page per_page,
  query query,
  sort sort,
) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/likes"
  let query = [
    #("filter", filter),
    #("filter_embeddable", option.map(filter_embeddable, bool.to_string)),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_likes_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn suggest_video_category_request(base, video_id, data) {
  let method = http.Put
  let path = "/videos/" <> video_id <> "/categories"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn suggest_video_category_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.category_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_video_categories_request(base, video_id, page page, per_page per_page) {
  let method = http.Get
  let path = "/videos/" <> video_id <> "/categories"
  let query = [
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_video_categories_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.category_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn verify_token_request(base) {
  let method = http.Get
  let path = "/oauth/verify"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn verify_token_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.auth_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.legacy_error_decoder()) |> result.map(
      Error,
    )
  }
}

pub fn get_vod_videos_request(
  base,
  ondemand_id,
  direction direction,
  filter filter,
  page page,
  per_page per_page,
  sort sort,
) {
  let method = http.Get
  let path = "/ondemand/pages/" <> ondemand_id <> "/videos"
  let query = [
    #("direction", direction),
    #("filter", filter),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_vod_videos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.on_demand_video_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn delete_videos_altone_request(base, uris uris) {
  let method = http.Delete
  let path = "/me/videos"
  let query = [#("uris", option.Some(uris))]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_videos_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn upload_video_altone_request(base, data) {
  let method = http.Post
  let path = "/me/videos"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn upload_video_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.video_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_videos_altone_request(
  base,
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
  let method = http.Get
  let path = "/me/videos"
  let query = [
    #("containing_uri", containing_uri),
    #("direction", direction),
    #("filter", filter),
    #("filter_embeddable", option.map(filter_embeddable, bool.to_string)),
    #("filter_playable", option.map(filter_playable, bool.to_string)),
    #(
      "filter_screen_recorded",
      option.map(filter_screen_recorded, bool.to_string),
    ),
    #("filter_tag", filter_tag),
    #("filter_tag_all_of", filter_tag_all_of),
    #("filter_tag_exclude", filter_tag_exclude),
    #("filter_uploader", option.map(filter_uploader, float.to_string)),
    #("include_team_content", include_team_content),
    #("page", option.map(page, float.to_string)),
    #("per_page", option.map(per_page, float.to_string)),
    #("query", query),
    #(
      "query_fields",
      option.map(
        query_fields,
        fn(_) { panic as "query parameter is not supported" },
      ),
    ),
    #("sort", sort)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_videos_altone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.video_decoder())) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn get_one_time_event_m3u8_playback_request(base, user_id, video_id) {
  let method = http.Get
  let path = "/users/" <> user_id <> "/videos/" <> video_id <> "/m3u8_playback"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_one_time_event_m3u8_playback_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}
