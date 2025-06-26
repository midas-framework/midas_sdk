import gleam/dict
import gleam/bool
import gleam/result
import gleam/dynamic/decode
import gleam/json
import gleam/float
import gleam/int
import gleam/http/response
import gleam/http
import email_octopus/schema
import email_octopus/utils
import gleam/option.{type Option, None}

pub type ApiListsListIdfieldsTagPutRequest {
  ApiListsListIdfieldsTagPutRequest(
    fallback: Option(String),
    label: String,
    tag: String,
  )
}

pub type ApiListsPostRequest {
  ApiListsPostRequest(name: String)
}

pub type ApiListsListIdcontactsContactIdPutRequest {
  ApiListsListIdcontactsContactIdPutRequest(
    email_address: Option(String),
    status: Option(String),
    tags: Option(dict.Dict(String, Bool)),
    fields: Option(dict.Dict(String, json.Json)),
  )
}

pub type ApiListsListIdcontactsPutRequest {
  ApiListsListIdcontactsPutRequest(
    email_address: String,
    status: Option(String),
    tags: Option(dict.Dict(String, Bool)),
    fields: Option(dict.Dict(String, json.Json)),
  )
}

pub type ApiListsListIdcontactsPostRequest {
  ApiListsListIdcontactsPostRequest(
    email_address: String,
    status: Option(String),
    tags: Option(List(String)),
    fields: Option(dict.Dict(String, json.Json)),
  )
}

pub type ApiListsListIdPutRequest {
  ApiListsListIdPutRequest(name: String)
}

pub type ApiListsListIdfieldsPostRequest {
  ApiListsListIdfieldsPostRequest(
    fallback: Option(String),
    label: String,
    type_: String,
    tag: String,
  )
}

pub type ApiAutomationsAutomationIdqueuePostRequest {
  ApiAutomationsAutomationIdqueuePostRequest(contact_id: String)
}

pub type ApiListsListIdcontactsbatchPutResponse {
  ApiListsListIdcontactsbatchPutResponse(
    success: Option(List(Internal0)),
    errors: Option(List(Internal1)),
  )
}

pub type ApiListsListIdfieldsPostResponse {
  ApiListsListIdfieldsPostResponse(
    fallback: Option(String),
    label: String,
    type_: String,
    tag: String,
  )
}

pub type ApiListsListIdfieldsTagPutResponse {
  ApiListsListIdfieldsTagPutResponse(
    fallback: Option(String),
    label: String,
    type_: String,
    tag: String,
  )
}

pub type Internal1 {
  Internal1(success: Option(Bool), data: Option(schema.ListContactGet))
}

pub type Internal0 {
  Internal0(
    success: Option(Bool),
    data: Option(Nil),
    detail: Option(String),
    status: Option(Int),
    title: Option(String),
    type_: Option(String),
    id: Option(String),
  )
}

pub fn api_campaigns_campaign_idreportssummary_get_request(base, campaign_id) {
  let method = http.Get
  let path = "/campaigns/" <> campaign_id <> "/reports/summary"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn api_campaigns_campaign_idreportssummary_get_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.campaign_summary_report_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_list_idcontactsbatch_put_request(base, list_id, data) {
  let method = http.Put
  let path = "/lists/" <> list_id <> "/contacts/batch"
  let query = []
  let body = utils.json_to_bits(schema.list_contact_batch_put_encode(data))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn api_lists_list_idcontactsbatch_put_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, {
        use success <- decode.optional_field(
          "success",
          None,
          decode.optional(decode.list(internal_0_decoder())),
        )
        use errors <- decode.optional_field(
          "errors",
          None,
          decode.optional(decode.list(internal_1_decoder())),
        )
        decode.success(
          ApiListsListIdcontactsbatchPutResponse(
            success: success,
            errors: errors,
          ),
        )
      }) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_list_idtags_post_request(base, list_id, data) {
  let method = http.Post
  let path = "/lists/" <> list_id <> "/tags"
  let query = []
  let body = utils.json_to_bits(schema.list_tag_encode(data))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn api_lists_list_idtags_post_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.list_tag_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_list_idtags_get_request(
  base,
  list_id,
  limit limit,
  starting_after starting_after,
) {
  let method = http.Get
  let path = "/lists/" <> list_id <> "/tags"
  let query = [
    #("limit", option.map(limit, int.to_string)),
    #("starting_after", starting_after)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn api_lists_list_idtags_get_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.list_tags_collection_get_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn api_automations_automation_idqueue_post_request(
  base,
  automation_id,
  data: ApiAutomationsAutomationIdqueuePostRequest,
) {
  let method = http.Post
  let path = "/automations/" <> automation_id <> "/queue"
  let query = []
  let body = utils.json_to_bits(
    utils.object([#("contact_id", json.string(data.contact_id))]),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn api_automations_automation_idqueue_post_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_list_idfields_post_request(
  base,
  list_id,
  data: ApiListsListIdfieldsPostRequest,
) {
  let method = http.Post
  let path = "/lists/" <> list_id <> "/fields"
  let query = []
  let body = utils.json_to_bits(
    utils.object(
      [
        #("fallback", json.nullable(data.fallback, json.string)),
        #("label", json.string(data.label)),
        #("type", json.string(data.type_)),
        #("tag", json.string(data.tag))
      ],
    ),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn api_lists_list_idfields_post_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, {
        use fallback <- decode.optional_field(
          "fallback",
          None,
          decode.optional(decode.string),
        )
        use label <- decode.field("label", decode.string)
        use type_ <- decode.field("type", decode.string)
        use tag <- decode.field("tag", decode.string)
        decode.success(
          ApiListsListIdfieldsPostResponse(
            fallback: fallback,
            label: label,
            type_: type_,
            tag: tag,
          ),
        )
      }) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn api_campaigns_get_request(
  base,
  limit limit,
  starting_after starting_after,
) {
  let method = http.Get
  let path = "/campaigns"
  let query = [
    #("limit", option.map(limit, int.to_string)),
    #("starting_after", starting_after)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn api_campaigns_get_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.campaign_collection_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_list_id_delete_request(base, list_id) {
  let method = http.Delete
  let path = "/lists/" <> list_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn api_lists_list_id_delete_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_list_id_put_request(
  base,
  list_id,
  data: ApiListsListIdPutRequest,
) {
  let method = http.Put
  let path = "/lists/" <> list_id
  let query = []
  let body = utils.json_to_bits(
    utils.object([#("name", json.string(data.name))]),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn api_lists_list_id_put_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.list_get_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_list_id_get_request(base, list_id) {
  let method = http.Get
  let path = "/lists/" <> list_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn api_lists_list_id_get_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.list_get_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn api_campaigns_campaign_id_get_request(base, campaign_id) {
  let method = http.Get
  let path = "/campaigns/" <> campaign_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn api_campaigns_campaign_id_get_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.campaign_get_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_list_idcontacts_post_request(
  base,
  list_id,
  data: ApiListsListIdcontactsPostRequest,
) {
  let method = http.Post
  let path = "/lists/" <> list_id <> "/contacts"
  let query = []
  let body = utils.json_to_bits(
    utils.object(
      [
        #("email_address", json.string(data.email_address)),
        #("status", json.nullable(data.status, json.string)),
        #("tags", json.nullable(data.tags, json.array(_, json.string))),
        #("fields", json.nullable(data.fields, utils.dict(_, fn(data) { data })))
      ],
    ),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn api_lists_list_idcontacts_post_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.list_contact_get_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_list_idcontacts_put_request(
  base,
  list_id,
  data: ApiListsListIdcontactsPutRequest,
) {
  let method = http.Put
  let path = "/lists/" <> list_id <> "/contacts"
  let query = []
  let body = utils.json_to_bits(
    utils.object(
      [
        #("email_address", json.string(data.email_address)),
        #("status", json.nullable(data.status, json.string)),
        #("tags", json.nullable(data.tags, utils.dict(_, json.bool))),
        #("fields", json.nullable(data.fields, utils.dict(_, fn(data) { data })))
      ],
    ),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn api_lists_list_idcontacts_put_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.list_contact_get_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_list_idcontacts_get_request(
  base,
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
  let method = http.Get
  let path = "/lists/" <> list_id <> "/contacts"
  let query = [
    #("limit", option.map(limit, int.to_string)),
    #("starting_after", starting_after),
    #("tag", tag),
    #("status", status),
    #("created_at_lte", created_at_lte),
    #("created_at_gte", created_at_gte),
    #("last_updated_at_lte", last_updated_at_lte),
    #("last_updated_at_gte", last_updated_at_gte)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn api_lists_list_idcontacts_get_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.list_contacts_collection_get_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn api_campaigns_campaign_idreportslinks_get_request(base, campaign_id) {
  let method = http.Get
  let path = "/campaigns/" <> campaign_id <> "/reports/links"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn api_campaigns_campaign_idreportslinks_get_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(
      body,
      schema.campaign_report_link_collection_get_decoder(),
    ) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_list_idcontacts_contact_id_delete_request(
  base,
  list_id,
  contact_id,
) {
  let method = http.Delete
  let path = "/lists/" <> list_id <> "/contacts/" <> contact_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn api_lists_list_idcontacts_contact_id_delete_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_list_idcontacts_contact_id_put_request(
  base,
  list_id,
  contact_id,
  data: ApiListsListIdcontactsContactIdPutRequest,
) {
  let method = http.Put
  let path = "/lists/" <> list_id <> "/contacts/" <> contact_id
  let query = []
  let body = utils.json_to_bits(
    utils.object(
      [
        #("email_address", json.nullable(data.email_address, json.string)),
        #("status", json.nullable(data.status, json.string)),
        #("tags", json.nullable(data.tags, utils.dict(_, json.bool))),
        #("fields", json.nullable(data.fields, utils.dict(_, fn(data) { data })))
      ],
    ),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn api_lists_list_idcontacts_contact_id_put_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.list_contact_get_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_list_idcontacts_contact_id_get_request(
  base,
  list_id,
  contact_id,
) {
  let method = http.Get
  let path = "/lists/" <> list_id <> "/contacts/" <> contact_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn api_lists_list_idcontacts_contact_id_get_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.list_contact_get_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_post_request(base, data: ApiListsPostRequest) {
  let method = http.Post
  let path = "/lists"
  let query = []
  let body = utils.json_to_bits(
    utils.object([#("name", json.string(data.name))]),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn api_lists_post_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.list_get_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_get_request(base, limit limit, starting_after starting_after) {
  let method = http.Get
  let path = "/lists"
  let query = [
    #("limit", option.map(limit, int.to_string)),
    #("starting_after", starting_after)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn api_lists_get_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.list_collection_get_decoder()) |> result.map(
      Ok,
    )
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_list_idtags_tag_delete_request(base, list_id, tag) {
  let method = http.Delete
  let path = "/lists/" <> list_id <> "/tags/" <> tag
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn api_lists_list_idtags_tag_delete_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_list_idtags_tag_put_request(base, list_id, tag, data) {
  let method = http.Put
  let path = "/lists/" <> list_id <> "/tags/" <> tag
  let query = []
  let body = utils.json_to_bits(schema.list_tag_encode(data))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn api_lists_list_idtags_tag_put_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.list_tag_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_list_idfields_tag_delete_request(base, list_id, tag) {
  let method = http.Delete
  let path = "/lists/" <> list_id <> "/fields/" <> tag
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn api_lists_list_idfields_tag_delete_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn api_lists_list_idfields_tag_put_request(
  base,
  list_id,
  tag,
  data: ApiListsListIdfieldsTagPutRequest,
) {
  let method = http.Put
  let path = "/lists/" <> list_id <> "/fields/" <> tag
  let query = []
  let body = utils.json_to_bits(
    utils.object(
      [
        #("fallback", json.nullable(data.fallback, json.string)),
        #("label", json.string(data.label)),
        #("tag", json.string(data.tag))
      ],
    ),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn api_lists_list_idfields_tag_put_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, {
        use fallback <- decode.optional_field(
          "fallback",
          None,
          decode.optional(decode.string),
        )
        use label <- decode.field("label", decode.string)
        use type_ <- decode.field("type", decode.string)
        use tag <- decode.field("tag", decode.string)
        decode.success(
          ApiListsListIdfieldsTagPutResponse(
            fallback: fallback,
            label: label,
            type_: type_,
            tag: tag,
          ),
        )
      }) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn api_campaigns_campaign_idreports_get_request(
  base,
  campaign_id,
  limit limit,
  starting_after starting_after,
  status status,
) {
  let method = http.Get
  let path = "/campaigns/" <> campaign_id <> "/reports"
  let query = [
    #("limit", option.map(limit, int.to_string)),
    #("starting_after", starting_after),
    #("status", option.Some(status))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn api_campaigns_campaign_idreports_get_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(
      body,
      schema.campaign_report_contact_collection_get_report_decoder(),
    ) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn internal_1_decoder() {
  use success <- decode.optional_field(
    "success",
    None,
    decode.optional(decode.bool),
  )
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(schema.list_contact_get_decoder()),
  )
  decode.success(Internal1(success: success, data: data))
}

pub fn internal_1_encode(data: Internal1) {
  utils.object(
    [
      #("success", json.nullable(data.success, json.bool)),
      #("data", json.nullable(data.data, schema.list_contact_get_encode))
    ],
  )
}

pub fn internal_0_decoder() {
  use success <- decode.optional_field(
    "success",
    None,
    decode.optional(decode.bool),
  )
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use detail <- decode.optional_field(
    "detail",
    None,
    decode.optional(decode.string),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.int),
  )
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  decode.success(
    Internal0(
      success: success,
      data: data,
      detail: detail,
      status: status,
      title: title,
      type_: type_,
      id: id,
    ),
  )
}

pub fn internal_0_encode(data: Internal0) {
  utils.object(
    [
      #("success", json.nullable(data.success, json.bool)),
      #("data", json.nullable(data.data, fn(_: Nil) { json.null() })),
      #("detail", json.nullable(data.detail, json.string)),
      #("status", json.nullable(data.status, json.int)),
      #("title", json.nullable(data.title, json.string)),
      #("type", json.nullable(data.type_, json.string)),
      #("id", json.nullable(data.id, json.string))
    ],
  )
}
