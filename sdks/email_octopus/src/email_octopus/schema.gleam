import gleam/option.{type Option, None}
import email_octopus/utils
import gleam/json
import gleam/dynamic
import gleam/dynamic/decode
import gleam/dict

pub type PagingResourceGet {
  PagingResourceGet(next: Option(PagingNextResourceGet))
}

pub type ListGet {
  ListGet(
    last_updated_at: Option(String),
    counts: Option(List(Internal0)),
    created_at: Option(String),
    name: String,
    tags: Option(List(String)),
    fields: Option(List(Internal1)),
    id: Option(String),
    double_opt_in: Option(Bool),
  )
}

pub type CampaignReportContactCollectionGetReport {
  CampaignReportContactCollectionGetReport(
    data: Option(List(Internal2)),
    paging: Option(Internal4),
    status: Option(String),
  )
}

pub type CampaignSummaryReport {
  CampaignSummaryReport(
    clicked: Option(Internal5),
    complained: Option(Int),
    opened: Option(Internal6),
    unsubscribed: Option(Int),
    sent: Option(Int),
    id: Option(String),
    bounced: Option(Internal7),
  )
}

pub type ListContactGet {
  ListContactGet(
    last_updated_at: Option(String),
    created_at: Option(String),
    email_address: String,
    status: Option(String),
    tags: Option(List(String)),
    fields: Option(dict.Dict(String, json.Json)),
    id: Option(String),
  )
}

pub type ListTagsCollectionGet {
  ListTagsCollectionGet(data: Option(List(ListTag)), paging: Option(Internal9))
}

pub type PagingNextResource {
  PagingNextResource(url: Option(String), starting_after: Option(String))
}

pub type ListContactsCollectionGet {
  ListContactsCollectionGet(
    data: Option(List(ListContactGet)),
    paging: Option(Internal11),
  )
}

pub type PagingNextResourceGet {
  PagingNextResourceGet(url: Option(String), starting_after: Option(String))
}

pub type Automation {
  Automation(contact_id: Option(String), id: Option(String))
}

pub type ListCollectionGet {
  ListCollectionGet(
    data: Option(List(ListGet)),
    paging: Option(PagingResourceGet),
  )
}

pub type CampaignReportLinkCollectionGet {
  CampaignReportLinkCollectionGet(data: Option(List(Internal12)))
}

pub type CampaignGet {
  CampaignGet(
    created_at: Option(String),
    from: Option(Internal13),
    name: Option(String),
    subject: Option(String),
    status: Option(String),
    content: Option(Internal14),
    sent_at: Option(String),
    id: Option(String),
    to: Option(List(String)),
  )
}

pub type ListContactBatchPut {
  ListContactBatchPut(contacts: Option(List(ListContactBatchItemResourcePut)))
}

pub type PagingResource {
  PagingResource(next: Option(PagingNextResource))
}

pub type ListContactBatchItemResourcePut {
  ListContactBatchItemResourcePut(
    email_address: Option(String),
    status: Option(String),
    tags: Option(dict.Dict(String, Bool)),
    fields: Option(dict.Dict(String, json.Json)),
    id: String,
  )
}

pub type ListTag {
  ListTag(tag: Option(String))
}

pub type CampaignCollection {
  CampaignCollection(
    data: Option(List(CampaignGet)),
    paging: Option(PagingResource),
  )
}

pub type ListField {
  ListField(
    fallback: Option(String),
    choices: Option(List(String)),
    label: Option(String),
    type_: Option(String),
    tag: Option(String),
  )
}

pub type Internal0 {
  Internal0(
    unsubscribed: Option(Int),
    pending: Option(Int),
    subscribed: Option(Int),
  )
}

pub type Internal1 {
  Internal1(fallback: Option(String), label: String, type_: String, tag: String)
}

pub type Internal2 {
  Internal2(
    occurred_at: Option(String),
    contact_email_address: Option(String),
    contact_id: Option(String),
  )
}

pub type Internal3 {
  Internal3(url: Option(String), starting_after: Option(String))
}

pub type Internal4 {
  Internal4(next: Option(Internal3))
}

pub type Internal5 {
  Internal5(total: Option(Int), unique: Option(Int))
}

pub type Internal6 {
  Internal6(total: Option(Int), unique: Option(Int))
}

pub type Internal7 {
  Internal7(soft: Option(Int), hard: Option(Int))
}

pub type Internal8 {
  Internal8(url: Option(String), starting_after: Option(String))
}

pub type Internal9 {
  Internal9(next: Option(Internal8))
}

pub type Internal10 {
  Internal10(url: Option(String), starting_after: Option(String))
}

pub type Internal11 {
  Internal11(next: Option(Internal10))
}

pub type Internal12 {
  Internal12(
    clicked_unique: Option(Int),
    clicked_total: Option(Int),
    url: Option(String),
  )
}

pub type Internal13 {
  Internal13(name: Option(String), email_address: Option(String))
}

pub type Internal14 {
  Internal14(html: Option(String))
}

pub fn internal_14_decoder() {
  use html <- decode.optional_field("html", None, decode.optional(decode.string))
  decode.success(Internal14(html: html))
}

pub fn internal_14_encode(data: Internal14) {
  utils.object([#("html", json.nullable(data.html, json.string))])
}

pub fn internal_13_decoder() {
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use email_address <- decode.optional_field(
    "email_address",
    None,
    decode.optional(decode.string),
  )
  decode.success(Internal13(name: name, email_address: email_address))
}

pub fn internal_13_encode(data: Internal13) {
  utils.object(
    [
      #("name", json.nullable(data.name, json.string)),
      #("email_address", json.nullable(data.email_address, json.string))
    ],
  )
}

pub fn internal_12_decoder() {
  use clicked_unique <- decode.optional_field(
    "clicked_unique",
    None,
    decode.optional(decode.int),
  )
  use clicked_total <- decode.optional_field(
    "clicked_total",
    None,
    decode.optional(decode.int),
  )
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  decode.success(
    Internal12(
      clicked_unique: clicked_unique,
      clicked_total: clicked_total,
      url: url,
    ),
  )
}

pub fn internal_12_encode(data: Internal12) {
  utils.object(
    [
      #("clicked_unique", json.nullable(data.clicked_unique, json.int)),
      #("clicked_total", json.nullable(data.clicked_total, json.int)),
      #("url", json.nullable(data.url, json.string))
    ],
  )
}

pub fn internal_11_decoder() {
  use next <- decode.optional_field(
    "next",
    None,
    decode.optional(internal_10_decoder()),
  )
  decode.success(Internal11(next: next))
}

pub fn internal_11_encode(data: Internal11) {
  utils.object([#("next", json.nullable(data.next, internal_10_encode))])
}

pub fn internal_10_decoder() {
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  use starting_after <- decode.optional_field(
    "starting_after",
    None,
    decode.optional(decode.string),
  )
  decode.success(Internal10(url: url, starting_after: starting_after))
}

pub fn internal_10_encode(data: Internal10) {
  utils.object(
    [
      #("url", json.nullable(data.url, json.string)),
      #("starting_after", json.nullable(data.starting_after, json.string))
    ],
  )
}

pub fn internal_9_decoder() {
  use next <- decode.optional_field(
    "next",
    None,
    decode.optional(internal_8_decoder()),
  )
  decode.success(Internal9(next: next))
}

pub fn internal_9_encode(data: Internal9) {
  utils.object([#("next", json.nullable(data.next, internal_8_encode))])
}

pub fn internal_8_decoder() {
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  use starting_after <- decode.optional_field(
    "starting_after",
    None,
    decode.optional(decode.string),
  )
  decode.success(Internal8(url: url, starting_after: starting_after))
}

pub fn internal_8_encode(data: Internal8) {
  utils.object(
    [
      #("url", json.nullable(data.url, json.string)),
      #("starting_after", json.nullable(data.starting_after, json.string))
    ],
  )
}

pub fn internal_7_decoder() {
  use soft <- decode.optional_field("soft", None, decode.optional(decode.int))
  use hard <- decode.optional_field("hard", None, decode.optional(decode.int))
  decode.success(Internal7(soft: soft, hard: hard))
}

pub fn internal_7_encode(data: Internal7) {
  utils.object(
    [
      #("soft", json.nullable(data.soft, json.int)),
      #("hard", json.nullable(data.hard, json.int))
    ],
  )
}

pub fn internal_6_decoder() {
  use total <- decode.optional_field("total", None, decode.optional(decode.int))
  use unique <- decode.optional_field(
    "unique",
    None,
    decode.optional(decode.int),
  )
  decode.success(Internal6(total: total, unique: unique))
}

pub fn internal_6_encode(data: Internal6) {
  utils.object(
    [
      #("total", json.nullable(data.total, json.int)),
      #("unique", json.nullable(data.unique, json.int))
    ],
  )
}

pub fn internal_5_decoder() {
  use total <- decode.optional_field("total", None, decode.optional(decode.int))
  use unique <- decode.optional_field(
    "unique",
    None,
    decode.optional(decode.int),
  )
  decode.success(Internal5(total: total, unique: unique))
}

pub fn internal_5_encode(data: Internal5) {
  utils.object(
    [
      #("total", json.nullable(data.total, json.int)),
      #("unique", json.nullable(data.unique, json.int))
    ],
  )
}

pub fn internal_4_decoder() {
  use next <- decode.optional_field(
    "next",
    None,
    decode.optional(internal_3_decoder()),
  )
  decode.success(Internal4(next: next))
}

pub fn internal_4_encode(data: Internal4) {
  utils.object([#("next", json.nullable(data.next, internal_3_encode))])
}

pub fn internal_3_decoder() {
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  use starting_after <- decode.optional_field(
    "starting_after",
    None,
    decode.optional(decode.string),
  )
  decode.success(Internal3(url: url, starting_after: starting_after))
}

pub fn internal_3_encode(data: Internal3) {
  utils.object(
    [
      #("url", json.nullable(data.url, json.string)),
      #("starting_after", json.nullable(data.starting_after, json.string))
    ],
  )
}

pub fn internal_2_decoder() {
  use occurred_at <- decode.optional_field(
    "occurred_at",
    None,
    decode.optional(decode.string),
  )
  use contact_email_address <- decode.optional_field(
    "contact_email_address",
    None,
    decode.optional(decode.string),
  )
  use contact_id <- decode.optional_field(
    "contact_id",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    Internal2(
      occurred_at: occurred_at,
      contact_email_address: contact_email_address,
      contact_id: contact_id,
    ),
  )
}

pub fn internal_2_encode(data: Internal2) {
  utils.object(
    [
      #("occurred_at", json.nullable(data.occurred_at, json.string)),
      #(
        "contact_email_address",
        json.nullable(data.contact_email_address, json.string),
      ),
      #("contact_id", json.nullable(data.contact_id, json.string))
    ],
  )
}

pub fn internal_1_decoder() {
  use fallback <- decode.optional_field(
    "fallback",
    None,
    decode.optional(decode.string),
  )
  use label <- decode.field("label", decode.string)
  use type_ <- decode.field("type", decode.string)
  use tag <- decode.field("tag", decode.string)
  decode.success(
    Internal1(fallback: fallback, label: label, type_: type_, tag: tag),
  )
}

pub fn internal_1_encode(data: Internal1) {
  utils.object(
    [
      #("fallback", json.nullable(data.fallback, json.string)),
      #("label", json.string(data.label)),
      #("type", json.string(data.type_)),
      #("tag", json.string(data.tag))
    ],
  )
}

pub fn internal_0_decoder() {
  use unsubscribed <- decode.optional_field(
    "unsubscribed",
    None,
    decode.optional(decode.int),
  )
  use pending <- decode.optional_field(
    "pending",
    None,
    decode.optional(decode.int),
  )
  use subscribed <- decode.optional_field(
    "subscribed",
    None,
    decode.optional(decode.int),
  )
  decode.success(
    Internal0(
      unsubscribed: unsubscribed,
      pending: pending,
      subscribed: subscribed,
    ),
  )
}

pub fn internal_0_encode(data: Internal0) {
  utils.object(
    [
      #("unsubscribed", json.nullable(data.unsubscribed, json.int)),
      #("pending", json.nullable(data.pending, json.int)),
      #("subscribed", json.nullable(data.subscribed, json.int))
    ],
  )
}

pub fn list_field_decoder() {
  use fallback <- decode.optional_field(
    "fallback",
    None,
    decode.optional(decode.string),
  )
  use choices <- decode.optional_field(
    "choices",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use label <- decode.optional_field(
    "label",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  use tag <- decode.optional_field("tag", None, decode.optional(decode.string))
  decode.success(
    ListField(
      fallback: fallback,
      choices: choices,
      label: label,
      type_: type_,
      tag: tag,
    ),
  )
}

pub fn list_field_encode(data: ListField) {
  utils.object(
    [
      #("fallback", json.nullable(data.fallback, json.string)),
      #("choices", json.nullable(data.choices, json.array(_, json.string))),
      #("label", json.nullable(data.label, json.string)),
      #("type", json.nullable(data.type_, json.string)),
      #("tag", json.nullable(data.tag, json.string))
    ],
  )
}

pub fn campaign_collection_decoder() {
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(decode.list(campaign_get_decoder())),
  )
  use paging <- decode.optional_field(
    "paging",
    None,
    decode.optional(paging_resource_decoder()),
  )
  decode.success(CampaignCollection(data: data, paging: paging))
}

pub fn campaign_collection_encode(data: CampaignCollection) {
  utils.object(
    [
      #("data", json.nullable(data.data, json.array(_, campaign_get_encode))),
      #("paging", json.nullable(data.paging, paging_resource_encode))
    ],
  )
}

pub fn list_tag_decoder() {
  use tag <- decode.optional_field("tag", None, decode.optional(decode.string))
  decode.success(ListTag(tag: tag))
}

pub fn list_tag_encode(data: ListTag) {
  utils.object([#("tag", json.nullable(data.tag, json.string))])
}

pub fn list_contact_batch_item_resource_put_decoder() {
  use email_address <- decode.optional_field(
    "email_address",
    None,
    decode.optional(decode.string),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.string),
  )
  use tags <- decode.optional_field(
    "tags",
    None,
    decode.optional(decode.dict(decode.string, decode.bool)),
  )
  use fields <- decode.optional_field(
    "fields",
    None,
    decode.optional(decode.dict(decode.string, utils.dynamic_to_json())),
  )
  use id <- decode.field("id", decode.string)
  decode.success(
    ListContactBatchItemResourcePut(
      email_address: email_address,
      status: status,
      tags: tags,
      fields: fields,
      id: id,
    ),
  )
}

pub fn list_contact_batch_item_resource_put_encode(
  data: ListContactBatchItemResourcePut,
) {
  utils.object(
    [
      #("email_address", json.nullable(data.email_address, json.string)),
      #("status", json.nullable(data.status, json.string)),
      #("tags", json.nullable(data.tags, utils.dict(_, json.bool))),
      #("fields", json.nullable(data.fields, utils.dict(_, fn(data) { data }))),
      #("id", json.string(data.id))
    ],
  )
}

pub fn paging_resource_decoder() {
  use next <- decode.optional_field(
    "next",
    None,
    decode.optional(paging_next_resource_decoder()),
  )
  decode.success(PagingResource(next: next))
}

pub fn paging_resource_encode(data: PagingResource) {
  utils.object(
    [#("next", json.nullable(data.next, paging_next_resource_encode))],
  )
}

pub fn list_contact_batch_put_decoder() {
  use contacts <- decode.optional_field(
    "contacts",
    None,
    decode.optional(decode.list(list_contact_batch_item_resource_put_decoder())),
  )
  decode.success(ListContactBatchPut(contacts: contacts))
}

pub fn list_contact_batch_put_encode(data: ListContactBatchPut) {
  utils.object(
    [
      #(
        "contacts",
        json.nullable(
          data.contacts,
          json.array(_, list_contact_batch_item_resource_put_encode),
        ),
      )
    ],
  )
}

pub fn campaign_get_decoder() {
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use from <- decode.optional_field(
    "from",
    None,
    decode.optional(internal_13_decoder()),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use subject <- decode.optional_field(
    "subject",
    None,
    decode.optional(decode.string),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.string),
  )
  use content <- decode.optional_field(
    "content",
    None,
    decode.optional(internal_14_decoder()),
  )
  use sent_at <- decode.optional_field(
    "sent_at",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use to <- decode.optional_field(
    "to",
    None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(
    CampaignGet(
      created_at: created_at,
      from: from,
      name: name,
      subject: subject,
      status: status,
      content: content,
      sent_at: sent_at,
      id: id,
      to: to,
    ),
  )
}

pub fn campaign_get_encode(data: CampaignGet) {
  utils.object(
    [
      #("created_at", json.nullable(data.created_at, json.string)),
      #("from", json.nullable(data.from, internal_13_encode)),
      #("name", json.nullable(data.name, json.string)),
      #("subject", json.nullable(data.subject, json.string)),
      #("status", json.nullable(data.status, json.string)),
      #("content", json.nullable(data.content, internal_14_encode)),
      #("sent_at", json.nullable(data.sent_at, json.string)),
      #("id", json.nullable(data.id, json.string)),
      #("to", json.nullable(data.to, json.array(_, json.string)))
    ],
  )
}

pub fn campaign_report_link_collection_get_decoder() {
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(decode.list(internal_12_decoder())),
  )
  decode.success(CampaignReportLinkCollectionGet(data: data))
}

pub fn campaign_report_link_collection_get_encode(
  data: CampaignReportLinkCollectionGet,
) {
  utils.object(
    [#("data", json.nullable(data.data, json.array(_, internal_12_encode)))],
  )
}

pub fn list_collection_get_decoder() {
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(decode.list(list_get_decoder())),
  )
  use paging <- decode.optional_field(
    "paging",
    None,
    decode.optional(paging_resource_get_decoder()),
  )
  decode.success(ListCollectionGet(data: data, paging: paging))
}

pub fn list_collection_get_encode(data: ListCollectionGet) {
  utils.object(
    [
      #("data", json.nullable(data.data, json.array(_, list_get_encode))),
      #("paging", json.nullable(data.paging, paging_resource_get_encode))
    ],
  )
}

pub fn automation_decoder() {
  use contact_id <- decode.optional_field(
    "contact_id",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  decode.success(Automation(contact_id: contact_id, id: id))
}

pub fn automation_encode(data: Automation) {
  utils.object(
    [
      #("contact_id", json.nullable(data.contact_id, json.string)),
      #("id", json.nullable(data.id, json.string))
    ],
  )
}

pub fn paging_next_resource_get_decoder() {
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  use starting_after <- decode.optional_field(
    "starting_after",
    None,
    decode.optional(decode.string),
  )
  decode.success(PagingNextResourceGet(url: url, starting_after: starting_after))
}

pub fn paging_next_resource_get_encode(data: PagingNextResourceGet) {
  utils.object(
    [
      #("url", json.nullable(data.url, json.string)),
      #("starting_after", json.nullable(data.starting_after, json.string))
    ],
  )
}

pub fn list_contacts_collection_get_decoder() {
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(decode.list(list_contact_get_decoder())),
  )
  use paging <- decode.optional_field(
    "paging",
    None,
    decode.optional(internal_11_decoder()),
  )
  decode.success(ListContactsCollectionGet(data: data, paging: paging))
}

pub fn list_contacts_collection_get_encode(data: ListContactsCollectionGet) {
  utils.object(
    [
      #("data", json.nullable(data.data, json.array(_, list_contact_get_encode))),
      #("paging", json.nullable(data.paging, internal_11_encode))
    ],
  )
}

pub fn paging_next_resource_decoder() {
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  use starting_after <- decode.optional_field(
    "starting_after",
    None,
    decode.optional(decode.string),
  )
  decode.success(PagingNextResource(url: url, starting_after: starting_after))
}

pub fn paging_next_resource_encode(data: PagingNextResource) {
  utils.object(
    [
      #("url", json.nullable(data.url, json.string)),
      #("starting_after", json.nullable(data.starting_after, json.string))
    ],
  )
}

pub fn list_tags_collection_get_decoder() {
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(decode.list(list_tag_decoder())),
  )
  use paging <- decode.optional_field(
    "paging",
    None,
    decode.optional(internal_9_decoder()),
  )
  decode.success(ListTagsCollectionGet(data: data, paging: paging))
}

pub fn list_tags_collection_get_encode(data: ListTagsCollectionGet) {
  utils.object(
    [
      #("data", json.nullable(data.data, json.array(_, list_tag_encode))),
      #("paging", json.nullable(data.paging, internal_9_encode))
    ],
  )
}

pub fn list_contact_get_decoder() {
  use last_updated_at <- decode.optional_field(
    "last_updated_at",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use email_address <- decode.field("email_address", decode.string)
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.string),
  )
  use tags <- decode.optional_field(
    "tags",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use fields <- decode.optional_field(
    "fields",
    None,
    decode.optional(decode.dict(decode.string, utils.dynamic_to_json())),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  decode.success(
    ListContactGet(
      last_updated_at: last_updated_at,
      created_at: created_at,
      email_address: email_address,
      status: status,
      tags: tags,
      fields: fields,
      id: id,
    ),
  )
}

pub fn list_contact_get_encode(data: ListContactGet) {
  utils.object(
    [
      #("last_updated_at", json.nullable(data.last_updated_at, json.string)),
      #("created_at", json.nullable(data.created_at, json.string)),
      #("email_address", json.string(data.email_address)),
      #("status", json.nullable(data.status, json.string)),
      #("tags", json.nullable(data.tags, json.array(_, json.string))),
      #("fields", json.nullable(data.fields, utils.dict(_, fn(data) { data }))),
      #("id", json.nullable(data.id, json.string))
    ],
  )
}

pub fn campaign_summary_report_decoder() {
  use clicked <- decode.optional_field(
    "clicked",
    None,
    decode.optional(internal_5_decoder()),
  )
  use complained <- decode.optional_field(
    "complained",
    None,
    decode.optional(decode.int),
  )
  use opened <- decode.optional_field(
    "opened",
    None,
    decode.optional(internal_6_decoder()),
  )
  use unsubscribed <- decode.optional_field(
    "unsubscribed",
    None,
    decode.optional(decode.int),
  )
  use sent <- decode.optional_field("sent", None, decode.optional(decode.int))
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use bounced <- decode.optional_field(
    "bounced",
    None,
    decode.optional(internal_7_decoder()),
  )
  decode.success(
    CampaignSummaryReport(
      clicked: clicked,
      complained: complained,
      opened: opened,
      unsubscribed: unsubscribed,
      sent: sent,
      id: id,
      bounced: bounced,
    ),
  )
}

pub fn campaign_summary_report_encode(data: CampaignSummaryReport) {
  utils.object(
    [
      #("clicked", json.nullable(data.clicked, internal_5_encode)),
      #("complained", json.nullable(data.complained, json.int)),
      #("opened", json.nullable(data.opened, internal_6_encode)),
      #("unsubscribed", json.nullable(data.unsubscribed, json.int)),
      #("sent", json.nullable(data.sent, json.int)),
      #("id", json.nullable(data.id, json.string)),
      #("bounced", json.nullable(data.bounced, internal_7_encode))
    ],
  )
}

pub fn campaign_report_contact_collection_get_report_decoder() {
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(decode.list(internal_2_decoder())),
  )
  use paging <- decode.optional_field(
    "paging",
    None,
    decode.optional(internal_4_decoder()),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    CampaignReportContactCollectionGetReport(
      data: data,
      paging: paging,
      status: status,
    ),
  )
}

pub fn campaign_report_contact_collection_get_report_encode(
  data: CampaignReportContactCollectionGetReport,
) {
  utils.object(
    [
      #("data", json.nullable(data.data, json.array(_, internal_2_encode))),
      #("paging", json.nullable(data.paging, internal_4_encode)),
      #("status", json.nullable(data.status, json.string))
    ],
  )
}

pub fn list_get_decoder() {
  use last_updated_at <- decode.optional_field(
    "last_updated_at",
    None,
    decode.optional(decode.string),
  )
  use counts <- decode.optional_field(
    "counts",
    None,
    decode.optional(decode.list(internal_0_decoder())),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.field("name", decode.string)
  use tags <- decode.optional_field(
    "tags",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use fields <- decode.optional_field(
    "fields",
    None,
    decode.optional(decode.list(internal_1_decoder())),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use double_opt_in <- decode.optional_field(
    "double_opt_in",
    None,
    decode.optional(decode.bool),
  )
  decode.success(
    ListGet(
      last_updated_at: last_updated_at,
      counts: counts,
      created_at: created_at,
      name: name,
      tags: tags,
      fields: fields,
      id: id,
      double_opt_in: double_opt_in,
    ),
  )
}

pub fn list_get_encode(data: ListGet) {
  utils.object(
    [
      #("last_updated_at", json.nullable(data.last_updated_at, json.string)),
      #("counts", json.nullable(data.counts, json.array(_, internal_0_encode))),
      #("created_at", json.nullable(data.created_at, json.string)),
      #("name", json.string(data.name)),
      #("tags", json.nullable(data.tags, json.array(_, json.string))),
      #("fields", json.nullable(data.fields, json.array(_, internal_1_encode))),
      #("id", json.nullable(data.id, json.string)),
      #("double_opt_in", json.nullable(data.double_opt_in, json.bool))
    ],
  )
}

pub fn paging_resource_get_decoder() {
  use next <- decode.optional_field(
    "next",
    None,
    decode.optional(paging_next_resource_get_decoder()),
  )
  decode.success(PagingResourceGet(next: next))
}

pub fn paging_resource_get_encode(data: PagingResourceGet) {
  utils.object(
    [#("next", json.nullable(data.next, paging_next_resource_get_encode))],
  )
}
