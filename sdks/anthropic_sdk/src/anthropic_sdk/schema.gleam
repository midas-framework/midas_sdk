import anthropic_sdk/utils
import gleam/dynamic
import gleam/dynamic/decode
import gleam/json
import gleam/option.{type Option, None}

pub type BetaMessageDeltaUsage {
  BetaMessageDeltaUsage(output_tokens: Int)
}

pub type BetaInvalidRequestError {
  BetaInvalidRequestError(message: String, type_: String)
}

pub type BetaAuthenticationError {
  BetaAuthenticationError(message: String, type_: String)
}

pub type BetaResponseContentBlockLocationCitation {
  BetaResponseContentBlockLocationCitation(
    start_block_index: Int,
    document_index: Int,
    document_title: Nil,
    type_: String,
    end_block_index: Int,
    cited_text: String,
  )
}

pub type BetaCreateMessageParams {
  BetaCreateMessageParams(
    stream: Option(Bool),
    top_k: Option(Int),
    top_p: Option(Float),
    tool_choice: Option(BetaToolChoice),
    model: Model,
    messages: List(BetaInputMessage),
    system: Option(Nil),
    metadata: Option(Nil),
    temperature: Option(Float),
    max_tokens: Int,
    stop_sequences: Option(List(String)),
    tools: Option(List(Nil)),
  )
}

pub type BetaToolChoiceTool {
  BetaToolChoiceTool(
    disable_parallel_tool_use: Option(Bool),
    name: String,
    type_: String,
  )
}

pub type Usage {
  Usage(
    input_tokens: Int,
    cache_creation_input_tokens: Nil,
    output_tokens: Int,
    cache_read_input_tokens: Nil,
  )
}

pub type BetaMessageStopEvent {
  BetaMessageStopEvent(type_: String)
}

pub type BetaMessageDelta {
  BetaMessageDelta(stop_reason: Nil, stop_sequence: Nil)
}

pub type RequestCharLocationCitation {
  RequestCharLocationCitation(
    start_char_index: Int,
    end_char_index: Int,
    document_index: Int,
    document_title: Nil,
    type_: String,
    cited_text: String,
  )
}

pub type BetaRequestTextBlock {
  BetaRequestTextBlock(
    cache_control: Option(Nil),
    citations: Option(Nil),
    text: String,
    type_: String,
  )
}

pub type RequestImageBlock {
  RequestImageBlock(cache_control: Option(Nil), type_: String, source: Nil)
}

pub type CacheControlEphemeral {
  CacheControlEphemeral(type_: String)
}

pub type BetaPlainTextSource {
  BetaPlainTextSource(data: String, media_type: String, type_: String)
}

pub type BetaInputJsonContentBlockDelta {
  BetaInputJsonContentBlockDelta(partial_json: String, type_: String)
}

pub type BetaBashTool20241022 {
  BetaBashTool20241022(cache_control: Option(Nil), name: String, type_: String)
}

pub type ExpiredResult {
  ExpiredResult(type_: String)
}

pub type BetaCountMessageTokensResponse {
  BetaCountMessageTokensResponse(input_tokens: Int)
}

pub type BetaRequestCounts {
  BetaRequestCounts(
    succeeded: Int,
    expired: Int,
    errored: Int,
    processing: Int,
    canceled: Int,
  )
}

pub type BetaResponseCharLocationCitation {
  BetaResponseCharLocationCitation(
    start_char_index: Int,
    end_char_index: Int,
    document_index: Int,
    document_title: Nil,
    type_: String,
    cited_text: String,
  )
}

pub type BetaMessageBatch {
  BetaMessageBatch(
    results_url: Nil,
    created_at: String,
    cancel_initiated_at: Nil,
    archived_at: Nil,
    request_counts: Nil,
    ended_at: Nil,
    type_: String,
    id: String,
    expires_at: String,
    processing_status: String,
  )
}

pub type BetaToolChoiceAny {
  BetaToolChoiceAny(disable_parallel_tool_use: Option(Bool), type_: String)
}

pub type RequestDocumentBlock {
  RequestDocumentBlock(
    cache_control: Option(Nil),
    citations: Option(RequestCitationsConfig),
    context: Option(Nil),
    title: Option(Nil),
    type_: String,
    source: Nil,
  )
}

pub type ContentBlockStopEvent {
  ContentBlockStopEvent(index: Int, type_: String)
}

pub type ErroredResult {
  ErroredResult(error: ErrorResponse, type_: String)
}

pub type BetaCreateMessageBatchParams {
  BetaCreateMessageBatchParams(
    requests: List(BetaMessageBatchIndividualRequestParams),
  )
}

pub type BetaCanceledResult {
  BetaCanceledResult(type_: String)
}

pub type BetaContentBlockDeltaEvent {
  BetaContentBlockDeltaEvent(index: Int, delta: Nil, type_: String)
}

pub type Base64ImageSource {
  Base64ImageSource(data: String, media_type: String, type_: String)
}

pub type BetaTextContentBlockDelta {
  BetaTextContentBlockDelta(text: String, type_: String)
}

pub type BetaModelInfo {
  BetaModelInfo(
    display_name: String,
    created_at: String,
    type_: String,
    id: String,
  )
}

pub type Message {
  Message(
    stop_reason: Nil,
    usage: Nil,
    model: Model,
    role: String,
    content: List(ContentBlock),
    type_: String,
    id: String,
    stop_sequence: Nil,
  )
}

pub type ListResponseModelInfo {
  ListResponseModelInfo(
    last_id: Nil,
    first_id: Nil,
    data: List(ModelInfo),
    has_more: Bool,
  )
}

pub type BetaCountMessageTokensParams {
  BetaCountMessageTokensParams(
    tool_choice: Option(BetaToolChoice),
    model: Model,
    messages: List(BetaInputMessage),
    system: Option(Nil),
    tools: Option(List(Nil)),
  )
}

pub type ToolChoiceAuto {
  ToolChoiceAuto(disable_parallel_tool_use: Option(Bool), type_: String)
}

pub type BetaTool {
  BetaTool(
    cache_control: Option(Nil),
    name: String,
    input_schema: Nil,
    type_: Option(Nil),
    description: Option(String),
  )
}

pub type MessageDeltaEvent {
  MessageDeltaEvent(usage: Nil, delta: MessageDelta, type_: String)
}

pub type BetaPermissionError {
  BetaPermissionError(message: String, type_: String)
}

pub type MessageBatchIndividualRequestParams {
  MessageBatchIndividualRequestParams(params: Nil, custom_id: String)
}

pub type ErrorResponse {
  ErrorResponse(error: Nil, type_: String)
}

pub type BetaNotFoundError {
  BetaNotFoundError(message: String, type_: String)
}

pub type RequestToolResultBlock {
  RequestToolResultBlock(
    cache_control: Option(Nil),
    is_error: Option(Bool),
    content: Option(Nil),
    type_: String,
    tool_use_id: String,
  )
}

pub type BetaComputerUseTool20241022 {
  BetaComputerUseTool20241022(
    cache_control: Option(Nil),
    display_height_px: Int,
    display_number: Option(Nil),
    name: String,
    type_: String,
    display_width_px: Int,
  )
}

pub type BetaRequestPageLocationCitation {
  BetaRequestPageLocationCitation(
    document_index: Int,
    document_title: Nil,
    end_page_number: Int,
    type_: String,
    start_page_number: Int,
    cited_text: String,
  )
}

pub type GatewayTimeoutError {
  GatewayTimeoutError(message: String, type_: String)
}

pub type InputSchema {
  InputSchema(properties: Option(Nil), type_: String)
}

pub type ResponsePageLocationCitation {
  ResponsePageLocationCitation(
    document_index: Int,
    document_title: Nil,
    end_page_number: Int,
    type_: String,
    start_page_number: Int,
    cited_text: String,
  )
}

pub type CitationsDelta {
  CitationsDelta(citation: Nil, type_: String)
}

pub type ListResponseMessageBatch {
  ListResponseMessageBatch(
    last_id: Nil,
    first_id: Nil,
    data: List(MessageBatch),
    has_more: Bool,
  )
}

pub type ContentBlockStartEvent {
  ContentBlockStartEvent(content_block: Nil, index: Int, type_: String)
}

pub type RateLimitError {
  RateLimitError(message: String, type_: String)
}

pub type BillingError {
  BillingError(message: String, type_: String)
}

pub type RequestToolUseBlock {
  RequestToolUseBlock(
    cache_control: Option(Nil),
    input: Nil,
    name: String,
    type_: String,
    id: String,
  )
}

pub type MessageBatchIndividualResponse {
  MessageBatchIndividualResponse(custom_id: String, result: Nil)
}

pub type BetaInputMessage {
  BetaInputMessage(role: String, content: Nil)
}

pub type Apierror {
  Apierror(message: String, type_: String)
}

pub type BetaSucceededResult {
  BetaSucceededResult(message: BetaMessage, type_: String)
}

pub type BetaBase64Pdfsource {
  BetaBase64Pdfsource(data: String, media_type: String, type_: String)
}

pub type BetaRequestCitationsConfig {
  BetaRequestCitationsConfig(enabled: Option(Bool))
}

pub type ContentBlockSource {
  ContentBlockSource(content: Nil, type_: String)
}

pub type BetaDeleteMessageBatchResponse {
  BetaDeleteMessageBatchResponse(type_: String, id: String)
}

pub type BetaResponseToolUseBlock {
  BetaResponseToolUseBlock(input: Nil, name: String, type_: String, id: String)
}

pub type BetaMessageStartEvent {
  BetaMessageStartEvent(message: BetaMessage, type_: String)
}

pub type Metadata {
  Metadata(user_id: Option(Nil))
}

pub type BetaRequestContentBlockLocationCitation {
  BetaRequestContentBlockLocationCitation(
    start_block_index: Int,
    document_index: Int,
    document_title: Nil,
    type_: String,
    end_block_index: Int,
    cited_text: String,
  )
}

pub type OverloadedError {
  OverloadedError(message: String, type_: String)
}

pub type BetaResponseTextBlock {
  BetaResponseTextBlock(citations: Nil, text: String, type_: String)
}

pub type MessageDeltaUsage {
  MessageDeltaUsage(output_tokens: Int)
}

pub type InvalidRequestError {
  InvalidRequestError(message: String, type_: String)
}

pub type AuthenticationError {
  AuthenticationError(message: String, type_: String)
}

pub type MessageDelta {
  MessageDelta(stop_reason: Nil, stop_sequence: Nil)
}

pub type CreateMessageParams {
  CreateMessageParams(
    stream: Option(Bool),
    top_k: Option(Int),
    top_p: Option(Float),
    tool_choice: Option(ToolChoice),
    model: Model,
    messages: List(InputMessage),
    system: Option(Nil),
    metadata: Option(Nil),
    temperature: Option(Float),
    max_tokens: Int,
    stop_sequences: Option(List(String)),
    tools: Option(List(Tool)),
  )
}

pub type BetaUsage {
  BetaUsage(
    input_tokens: Int,
    cache_creation_input_tokens: Nil,
    output_tokens: Int,
    cache_read_input_tokens: Nil,
  )
}

pub type RequestTextBlock {
  RequestTextBlock(
    cache_control: Option(Nil),
    citations: Option(Nil),
    text: String,
    type_: String,
  )
}

pub type BetaRequestCharLocationCitation {
  BetaRequestCharLocationCitation(
    start_char_index: Int,
    end_char_index: Int,
    document_index: Int,
    document_title: Nil,
    type_: String,
    cited_text: String,
  )
}

pub type ResponseContentBlockLocationCitation {
  ResponseContentBlockLocationCitation(
    start_block_index: Int,
    document_index: Int,
    document_title: Nil,
    type_: String,
    end_block_index: Int,
    cited_text: String,
  )
}

pub type ToolChoiceTool {
  ToolChoiceTool(
    disable_parallel_tool_use: Option(Bool),
    name: String,
    type_: String,
  )
}

pub type MessageStopEvent {
  MessageStopEvent(type_: String)
}

pub type BetaRequestImageBlock {
  BetaRequestImageBlock(cache_control: Option(Nil), type_: String, source: Nil)
}

pub type BetaCacheControlEphemeral {
  BetaCacheControlEphemeral(type_: String)
}

pub type PlainTextSource {
  PlainTextSource(data: String, media_type: String, type_: String)
}

pub type InputJsonContentBlockDelta {
  InputJsonContentBlockDelta(partial_json: String, type_: String)
}

pub type BetaExpiredResult {
  BetaExpiredResult(type_: String)
}

pub type BetaRequestDocumentBlock {
  BetaRequestDocumentBlock(
    cache_control: Option(Nil),
    citations: Option(BetaRequestCitationsConfig),
    context: Option(Nil),
    title: Option(Nil),
    type_: String,
    source: Nil,
  )
}

pub type RequestCounts {
  RequestCounts(
    succeeded: Int,
    expired: Int,
    errored: Int,
    processing: Int,
    canceled: Int,
  )
}

pub type ToolChoiceAny {
  ToolChoiceAny(disable_parallel_tool_use: Option(Bool), type_: String)
}

pub type CountMessageTokensResponse {
  CountMessageTokensResponse(input_tokens: Int)
}

pub type CompletionRequest {
  CompletionRequest(
    stream: Option(Bool),
    top_k: Option(Int),
    max_tokens_to_sample: Int,
    prompt: String,
    top_p: Option(Float),
    model: Model,
    metadata: Option(Nil),
    temperature: Option(Float),
    stop_sequences: Option(List(String)),
  )
}

pub type ResponseCharLocationCitation {
  ResponseCharLocationCitation(
    start_char_index: Int,
    end_char_index: Int,
    document_index: Int,
    document_title: Nil,
    type_: String,
    cited_text: String,
  )
}

pub type MessageBatch {
  MessageBatch(
    results_url: Nil,
    created_at: String,
    cancel_initiated_at: Nil,
    archived_at: Nil,
    request_counts: Nil,
    ended_at: Nil,
    type_: String,
    id: String,
    expires_at: String,
    processing_status: String,
  )
}

pub type BetaContentBlockStopEvent {
  BetaContentBlockStopEvent(index: Int, type_: String)
}

pub type BetaTextEditor20241022 {
  BetaTextEditor20241022(
    cache_control: Option(Nil),
    name: String,
    type_: String,
  )
}

pub type BetaErroredResult {
  BetaErroredResult(error: BetaErrorResponse, type_: String)
}

pub type CreateMessageBatchParams {
  CreateMessageBatchParams(requests: List(MessageBatchIndividualRequestParams))
}

pub type ContentBlockDeltaEvent {
  ContentBlockDeltaEvent(index: Int, delta: Nil, type_: String)
}

pub type CanceledResult {
  CanceledResult(type_: String)
}

pub type BetaBase64ImageSource {
  BetaBase64ImageSource(data: String, media_type: String, type_: String)
}

pub type CreateMessageParamsWithoutStream {
  CreateMessageParamsWithoutStream(
    top_k: Option(Int),
    top_p: Option(Float),
    tool_choice: Option(ToolChoice),
    model: Model,
    messages: List(InputMessage),
    system: Option(Nil),
    metadata: Option(Nil),
    temperature: Option(Float),
    max_tokens: Int,
    stop_sequences: Option(List(String)),
    tools: Option(List(Tool)),
  )
}

pub type TextContentBlockDelta {
  TextContentBlockDelta(text: String, type_: String)
}

pub type ModelInfo {
  ModelInfo(display_name: String, created_at: String, type_: String, id: String)
}

pub type BetaMessage {
  BetaMessage(
    stop_reason: Nil,
    usage: Nil,
    model: Model,
    role: String,
    content: List(BetaContentBlock),
    type_: String,
    id: String,
    stop_sequence: Nil,
  )
}

pub type BetaToolChoiceAuto {
  BetaToolChoiceAuto(disable_parallel_tool_use: Option(Bool), type_: String)
}

pub type BetaListResponseModelInfo {
  BetaListResponseModelInfo(
    last_id: Nil,
    first_id: Nil,
    data: List(BetaModelInfo),
    has_more: Bool,
  )
}

pub type Tool {
  Tool(
    cache_control: Option(Nil),
    name: String,
    input_schema: Nil,
    description: Option(String),
  )
}

pub type CountMessageTokensParams {
  CountMessageTokensParams(
    tool_choice: Option(ToolChoice),
    model: Model,
    messages: List(InputMessage),
    system: Option(Nil),
    tools: Option(List(Tool)),
  )
}

pub type BetaMessageDeltaEvent {
  BetaMessageDeltaEvent(usage: Nil, delta: BetaMessageDelta, type_: String)
}

pub type PermissionError {
  PermissionError(message: String, type_: String)
}

pub type BetaRequestToolResultBlock {
  BetaRequestToolResultBlock(
    cache_control: Option(Nil),
    is_error: Option(Bool),
    content: Option(Nil),
    type_: String,
    tool_use_id: String,
  )
}

pub type BetaMessageBatchIndividualRequestParams {
  BetaMessageBatchIndividualRequestParams(params: Nil, custom_id: String)
}

pub type BetaErrorResponse {
  BetaErrorResponse(error: Nil, type_: String)
}

pub type NotFoundError {
  NotFoundError(message: String, type_: String)
}

pub type RequestPageLocationCitation {
  RequestPageLocationCitation(
    document_index: Int,
    document_title: Nil,
    end_page_number: Int,
    type_: String,
    start_page_number: Int,
    cited_text: String,
  )
}

pub type BetaGatewayTimeoutError {
  BetaGatewayTimeoutError(message: String, type_: String)
}

pub type BetaInputSchema {
  BetaInputSchema(properties: Option(Nil), type_: String)
}

pub type BetaListResponseMessageBatch {
  BetaListResponseMessageBatch(
    last_id: Nil,
    first_id: Nil,
    data: List(BetaMessageBatch),
    has_more: Bool,
  )
}

pub type BetaContentBlockStartEvent {
  BetaContentBlockStartEvent(content_block: Nil, index: Int, type_: String)
}

pub type BetaResponsePageLocationCitation {
  BetaResponsePageLocationCitation(
    document_index: Int,
    document_title: Nil,
    end_page_number: Int,
    type_: String,
    start_page_number: Int,
    cited_text: String,
  )
}

pub type BetaCitationsDelta {
  BetaCitationsDelta(citation: Nil, type_: String)
}

pub type CompletionResponse {
  CompletionResponse(
    stop_reason: Nil,
    model: Model,
    type_: String,
    id: String,
    completion: String,
  )
}

pub type InputMessage {
  InputMessage(role: String, content: String)
}

pub type BetaMessageBatchIndividualResponse {
  BetaMessageBatchIndividualResponse(custom_id: String, result: Nil)
}

pub type BetaRequestToolUseBlock {
  BetaRequestToolUseBlock(
    cache_control: Option(Nil),
    input: Nil,
    name: String,
    type_: String,
    id: String,
  )
}

pub type BetaRateLimitError {
  BetaRateLimitError(message: String, type_: String)
}

pub type BetaBillingError {
  BetaBillingError(message: String, type_: String)
}

pub type SucceededResult {
  SucceededResult(message: Message, type_: String)
}

pub type BetaApierror {
  BetaApierror(message: String, type_: String)
}

pub type Base64Pdfsource {
  Base64Pdfsource(data: String, media_type: String, type_: String)
}

pub type BetaMetadata {
  BetaMetadata(user_id: Option(Nil))
}

pub type RequestCitationsConfig {
  RequestCitationsConfig(enabled: Option(Bool))
}

pub type MessageStartEvent {
  MessageStartEvent(message: Message, type_: String)
}

pub type BetaContentBlockSource {
  BetaContentBlockSource(content: Nil, type_: String)
}

pub type DeleteMessageBatchResponse {
  DeleteMessageBatchResponse(type_: String, id: String)
}

pub type RequestContentBlockLocationCitation {
  RequestContentBlockLocationCitation(
    start_block_index: Int,
    document_index: Int,
    document_title: Nil,
    type_: String,
    end_block_index: Int,
    cited_text: String,
  )
}

pub type BetaOverloadedError {
  BetaOverloadedError(message: String, type_: String)
}

pub type ResponseTextBlock {
  ResponseTextBlock(citations: Nil, text: String, type_: String)
}

pub type ResponseToolUseBlock {
  ResponseToolUseBlock(input: Nil, name: String, type_: String, id: String)
}

pub type BetaMessageStreamEvent =
  Nil

pub type BetaContentBlock =
  Nil

pub type Model =
  String

pub type BetaToolChoice =
  Nil

pub type BetaInputContentBlock =
  Nil

pub type MessageStreamEvent =
  Nil

pub type ContentBlock =
  Nil

pub type ToolChoice =
  Nil

pub type AnthropicBeta =
  Nil

pub type InputContentBlock =
  Nil

pub fn response_tool_use_block_decoder() {
  use input <- decode.field(
    "input",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use name <- decode.field("name", decode.string)
  use type_ <- decode.field("type", decode.string)
  use id <- decode.field("id", decode.string)
  decode.success(ResponseToolUseBlock(
    input: input,
    name: name,
    type_: type_,
    id: id,
  ))
}

pub fn response_tool_use_block_encode(data: ResponseToolUseBlock) {
  json.object([
    #("input", fn(_) { panic as "Literal object inside field" }(data.input)),
    #("name", json.string(data.name)),
    #("type", json.string(data.type_)),
    #("id", json.string(data.id)),
  ])
}

pub fn response_text_block_decoder() {
  use citations <- decode.field(
    "citations",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use text <- decode.field("text", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(ResponseTextBlock(
    citations: citations,
    text: text,
    type_: type_,
  ))
}

pub fn response_text_block_encode(data: ResponseTextBlock) {
  json.object([
    #("citations", fn(_) { panic as "AnyOf inside field" }(data.citations)),
    #("text", json.string(data.text)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_overloaded_error_decoder() {
  use message <- decode.field("message", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaOverloadedError(message: message, type_: type_))
}

pub fn beta_overloaded_error_encode(data: BetaOverloadedError) {
  json.object([
    #("message", json.string(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn request_content_block_location_citation_decoder() {
  use start_block_index <- decode.field("start_block_index", decode.int)
  use document_index <- decode.field("document_index", decode.int)
  use document_title <- decode.field(
    "document_title",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  use end_block_index <- decode.field("end_block_index", decode.int)
  use cited_text <- decode.field("cited_text", decode.string)
  decode.success(RequestContentBlockLocationCitation(
    start_block_index: start_block_index,
    document_index: document_index,
    document_title: document_title,
    type_: type_,
    end_block_index: end_block_index,
    cited_text: cited_text,
  ))
}

pub fn request_content_block_location_citation_encode(
  data: RequestContentBlockLocationCitation,
) {
  json.object([
    #("start_block_index", json.int(data.start_block_index)),
    #("document_index", json.int(data.document_index)),
    #(
      "document_title",
      fn(_) { panic as "AnyOf inside field" }(data.document_title),
    ),
    #("type", json.string(data.type_)),
    #("end_block_index", json.int(data.end_block_index)),
    #("cited_text", json.string(data.cited_text)),
  ])
}

pub fn delete_message_batch_response_decoder() {
  use type_ <- decode.field("type", decode.string)
  use id <- decode.field("id", decode.string)
  decode.success(DeleteMessageBatchResponse(type_: type_, id: id))
}

pub fn delete_message_batch_response_encode(data: DeleteMessageBatchResponse) {
  json.object([
    #("type", json.string(data.type_)),
    #("id", json.string(data.id)),
  ])
}

pub fn beta_content_block_source_decoder() {
  use content <- decode.field(
    "content",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaContentBlockSource(content: content, type_: type_))
}

pub fn beta_content_block_source_encode(data: BetaContentBlockSource) {
  json.object([
    #("content", fn(_) { panic as "AnyOf inside field" }(data.content)),
    #("type", json.string(data.type_)),
  ])
}

pub fn message_start_event_decoder() {
  use message <- decode.field("message", message_decoder())
  use type_ <- decode.field("type", decode.string)
  decode.success(MessageStartEvent(message: message, type_: type_))
}

pub fn message_start_event_encode(data: MessageStartEvent) {
  json.object([
    #("message", message_encode(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn request_citations_config_decoder() {
  use enabled <- decode.optional_field(
    "enabled",
    None,
    decode.optional(decode.bool),
  )
  decode.success(RequestCitationsConfig(enabled: enabled))
}

pub fn request_citations_config_encode(data: RequestCitationsConfig) {
  json.object([#("enabled", json.nullable(data.enabled, json.bool))])
}

pub fn beta_metadata_decoder() {
  use user_id <- decode.optional_field(
    "user_id",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  decode.success(BetaMetadata(user_id: user_id))
}

pub fn beta_metadata_encode(data: BetaMetadata) {
  json.object([
    #(
      "user_id",
      json.nullable(data.user_id, fn(_) { panic as "AnyOf inside field" }),
    ),
  ])
}

pub fn base64_pdfsource_decoder() {
  use data <- decode.field("data", decode.string)
  use media_type <- decode.field("media_type", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(Base64Pdfsource(
    data: data,
    media_type: media_type,
    type_: type_,
  ))
}

pub fn base64_pdfsource_encode(data: Base64Pdfsource) {
  json.object([
    #("data", json.string(data.data)),
    #("media_type", json.string(data.media_type)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_apierror_decoder() {
  use message <- decode.field("message", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaApierror(message: message, type_: type_))
}

pub fn beta_apierror_encode(data: BetaApierror) {
  json.object([
    #("message", json.string(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn succeeded_result_decoder() {
  use message <- decode.field("message", message_decoder())
  use type_ <- decode.field("type", decode.string)
  decode.success(SucceededResult(message: message, type_: type_))
}

pub fn succeeded_result_encode(data: SucceededResult) {
  json.object([
    #("message", message_encode(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn input_content_block_decoder() {
  panic as "OneOf"
}

pub fn input_content_block_encode(_data: InputContentBlock) {
  panic as "OneOf"
}

pub fn beta_billing_error_decoder() {
  use message <- decode.field("message", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaBillingError(message: message, type_: type_))
}

pub fn beta_billing_error_encode(data: BetaBillingError) {
  json.object([
    #("message", json.string(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_rate_limit_error_decoder() {
  use message <- decode.field("message", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaRateLimitError(message: message, type_: type_))
}

pub fn beta_rate_limit_error_encode(data: BetaRateLimitError) {
  json.object([
    #("message", json.string(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_request_tool_use_block_decoder() {
  use cache_control <- decode.optional_field(
    "cache_control",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use input <- decode.field(
    "input",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use name <- decode.field("name", decode.string)
  use type_ <- decode.field("type", decode.string)
  use id <- decode.field("id", decode.string)
  decode.success(BetaRequestToolUseBlock(
    cache_control: cache_control,
    input: input,
    name: name,
    type_: type_,
    id: id,
  ))
}

pub fn beta_request_tool_use_block_encode(data: BetaRequestToolUseBlock) {
  json.object([
    #(
      "cache_control",
      json.nullable(data.cache_control, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("input", fn(_) { panic as "Literal object inside field" }(data.input)),
    #("name", json.string(data.name)),
    #("type", json.string(data.type_)),
    #("id", json.string(data.id)),
  ])
}

pub fn beta_message_batch_individual_response_decoder() {
  use custom_id <- decode.field("custom_id", decode.string)
  use result <- decode.field(
    "result",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  decode.success(BetaMessageBatchIndividualResponse(
    custom_id: custom_id,
    result: result,
  ))
}

pub fn beta_message_batch_individual_response_encode(
  data: BetaMessageBatchIndividualResponse,
) {
  json.object([
    #("custom_id", json.string(data.custom_id)),
    #("result", fn(_) { panic as "OneOf inside field" }(data.result)),
  ])
}

pub fn input_message_decoder() {
  use role <- decode.field("role", decode.string)
  use content <- decode.field("content", decode.string)
  decode.success(InputMessage(role: role, content: content))
}

pub fn input_message_encode(data: InputMessage) {
  json.object([
    #("role", json.string(data.role)),
    #("content", json.string(data.content)),
  ])
}

pub fn completion_response_decoder() {
  use stop_reason <- decode.field(
    "stop_reason",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use model <- decode.field("model", model_decoder())
  use type_ <- decode.field("type", decode.string)
  use id <- decode.field("id", decode.string)
  use completion <- decode.field("completion", decode.string)
  decode.success(CompletionResponse(
    stop_reason: stop_reason,
    model: model,
    type_: type_,
    id: id,
    completion: completion,
  ))
}

pub fn completion_response_encode(data: CompletionResponse) {
  json.object([
    #("stop_reason", fn(_) { panic as "AnyOf inside field" }(data.stop_reason)),
    #("model", model_encode(data.model)),
    #("type", json.string(data.type_)),
    #("id", json.string(data.id)),
    #("completion", json.string(data.completion)),
  ])
}

pub fn anthropic_beta_decoder() {
  panic as "AnyOf"
}

pub fn anthropic_beta_encode(_data: AnthropicBeta) {
  panic as "AnyOf"
}

pub fn beta_citations_delta_decoder() {
  use citation <- decode.field(
    "citation",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaCitationsDelta(citation: citation, type_: type_))
}

pub fn beta_citations_delta_encode(data: BetaCitationsDelta) {
  json.object([
    #("citation", fn(_) { panic as "OneOf inside field" }(data.citation)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_response_page_location_citation_decoder() {
  use document_index <- decode.field("document_index", decode.int)
  use document_title <- decode.field(
    "document_title",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use end_page_number <- decode.field("end_page_number", decode.int)
  use type_ <- decode.field("type", decode.string)
  use start_page_number <- decode.field("start_page_number", decode.int)
  use cited_text <- decode.field("cited_text", decode.string)
  decode.success(BetaResponsePageLocationCitation(
    document_index: document_index,
    document_title: document_title,
    end_page_number: end_page_number,
    type_: type_,
    start_page_number: start_page_number,
    cited_text: cited_text,
  ))
}

pub fn beta_response_page_location_citation_encode(
  data: BetaResponsePageLocationCitation,
) {
  json.object([
    #("document_index", json.int(data.document_index)),
    #(
      "document_title",
      fn(_) { panic as "AnyOf inside field" }(data.document_title),
    ),
    #("end_page_number", json.int(data.end_page_number)),
    #("type", json.string(data.type_)),
    #("start_page_number", json.int(data.start_page_number)),
    #("cited_text", json.string(data.cited_text)),
  ])
}

pub fn beta_content_block_start_event_decoder() {
  use content_block <- decode.field(
    "content_block",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use index <- decode.field("index", decode.int)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaContentBlockStartEvent(
    content_block: content_block,
    index: index,
    type_: type_,
  ))
}

pub fn beta_content_block_start_event_encode(data: BetaContentBlockStartEvent) {
  json.object([
    #(
      "content_block",
      fn(_) { panic as "OneOf inside field" }(data.content_block),
    ),
    #("index", json.int(data.index)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_list_response_message_batch_decoder() {
  use last_id <- decode.field(
    "last_id",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use first_id <- decode.field(
    "first_id",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use data <- decode.field("data", decode.list(beta_message_batch_decoder()))
  use has_more <- decode.field("has_more", decode.bool)
  decode.success(BetaListResponseMessageBatch(
    last_id: last_id,
    first_id: first_id,
    data: data,
    has_more: has_more,
  ))
}

pub fn beta_list_response_message_batch_encode(
  data: BetaListResponseMessageBatch,
) {
  json.object([
    #("last_id", fn(_) { panic as "AnyOf inside field" }(data.last_id)),
    #("first_id", fn(_) { panic as "AnyOf inside field" }(data.first_id)),
    #("data", json.array(_, beta_message_batch_encode)(data.data)),
    #("has_more", json.bool(data.has_more)),
  ])
}

pub fn beta_input_schema_decoder() {
  use properties <- decode.optional_field(
    "properties",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaInputSchema(properties: properties, type_: type_))
}

pub fn beta_input_schema_encode(data: BetaInputSchema) {
  json.object([
    #(
      "properties",
      json.nullable(data.properties, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_gateway_timeout_error_decoder() {
  use message <- decode.field("message", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaGatewayTimeoutError(message: message, type_: type_))
}

pub fn beta_gateway_timeout_error_encode(data: BetaGatewayTimeoutError) {
  json.object([
    #("message", json.string(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn request_page_location_citation_decoder() {
  use document_index <- decode.field("document_index", decode.int)
  use document_title <- decode.field(
    "document_title",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use end_page_number <- decode.field("end_page_number", decode.int)
  use type_ <- decode.field("type", decode.string)
  use start_page_number <- decode.field("start_page_number", decode.int)
  use cited_text <- decode.field("cited_text", decode.string)
  decode.success(RequestPageLocationCitation(
    document_index: document_index,
    document_title: document_title,
    end_page_number: end_page_number,
    type_: type_,
    start_page_number: start_page_number,
    cited_text: cited_text,
  ))
}

pub fn request_page_location_citation_encode(data: RequestPageLocationCitation) {
  json.object([
    #("document_index", json.int(data.document_index)),
    #(
      "document_title",
      fn(_) { panic as "AnyOf inside field" }(data.document_title),
    ),
    #("end_page_number", json.int(data.end_page_number)),
    #("type", json.string(data.type_)),
    #("start_page_number", json.int(data.start_page_number)),
    #("cited_text", json.string(data.cited_text)),
  ])
}

pub fn not_found_error_decoder() {
  use message <- decode.field("message", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(NotFoundError(message: message, type_: type_))
}

pub fn not_found_error_encode(data: NotFoundError) {
  json.object([
    #("message", json.string(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_error_response_decoder() {
  use error <- decode.field(
    "error",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaErrorResponse(error: error, type_: type_))
}

pub fn beta_error_response_encode(data: BetaErrorResponse) {
  json.object([
    #("error", fn(_) { panic as "OneOf inside field" }(data.error)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_message_batch_individual_request_params_decoder() {
  use params <- decode.field(
    "params",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use custom_id <- decode.field("custom_id", decode.string)
  decode.success(BetaMessageBatchIndividualRequestParams(
    params: params,
    custom_id: custom_id,
  ))
}

pub fn beta_message_batch_individual_request_params_encode(
  data: BetaMessageBatchIndividualRequestParams,
) {
  json.object([
    #("params", fn(_) { panic as "AllOf inside field" }(data.params)),
    #("custom_id", json.string(data.custom_id)),
  ])
}

pub fn tool_choice_decoder() {
  panic as "OneOf"
}

pub fn tool_choice_encode(_data: ToolChoice) {
  panic as "OneOf"
}

pub fn beta_request_tool_result_block_decoder() {
  use cache_control <- decode.optional_field(
    "cache_control",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use is_error <- decode.optional_field(
    "is_error",
    None,
    decode.optional(decode.bool),
  )
  use content <- decode.optional_field(
    "content",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use type_ <- decode.field("type", decode.string)
  use tool_use_id <- decode.field("tool_use_id", decode.string)
  decode.success(BetaRequestToolResultBlock(
    cache_control: cache_control,
    is_error: is_error,
    content: content,
    type_: type_,
    tool_use_id: tool_use_id,
  ))
}

pub fn beta_request_tool_result_block_encode(data: BetaRequestToolResultBlock) {
  json.object([
    #(
      "cache_control",
      json.nullable(data.cache_control, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("is_error", json.nullable(data.is_error, json.bool)),
    #(
      "content",
      json.nullable(data.content, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("type", json.string(data.type_)),
    #("tool_use_id", json.string(data.tool_use_id)),
  ])
}

pub fn permission_error_decoder() {
  use message <- decode.field("message", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(PermissionError(message: message, type_: type_))
}

pub fn permission_error_encode(data: PermissionError) {
  json.object([
    #("message", json.string(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_message_delta_event_decoder() {
  use usage <- decode.field(
    "usage",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use delta <- decode.field("delta", beta_message_delta_decoder())
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaMessageDeltaEvent(usage: usage, delta: delta, type_: type_))
}

pub fn beta_message_delta_event_encode(data: BetaMessageDeltaEvent) {
  json.object([
    #("usage", fn(_) { panic as "AllOf inside field" }(data.usage)),
    #("delta", beta_message_delta_encode(data.delta)),
    #("type", json.string(data.type_)),
  ])
}

pub fn count_message_tokens_params_decoder() {
  use tool_choice <- decode.optional_field(
    "tool_choice",
    None,
    decode.optional(tool_choice_decoder()),
  )
  use model <- decode.field("model", model_decoder())
  use messages <- decode.field("messages", decode.list(input_message_decoder()))
  use system <- decode.optional_field(
    "system",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use tools <- decode.optional_field(
    "tools",
    None,
    decode.optional(decode.list(tool_decoder())),
  )
  decode.success(CountMessageTokensParams(
    tool_choice: tool_choice,
    model: model,
    messages: messages,
    system: system,
    tools: tools,
  ))
}

pub fn count_message_tokens_params_encode(data: CountMessageTokensParams) {
  json.object([
    #("tool_choice", json.nullable(data.tool_choice, tool_choice_encode)),
    #("model", model_encode(data.model)),
    #("messages", json.array(_, input_message_encode)(data.messages)),
    #(
      "system",
      json.nullable(data.system, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("tools", json.nullable(data.tools, json.array(_, tool_encode))),
  ])
}

pub fn tool_decoder() {
  use cache_control <- decode.optional_field(
    "cache_control",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use name <- decode.field("name", decode.string)
  use input_schema <- decode.field(
    "input_schema",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  decode.success(Tool(
    cache_control: cache_control,
    name: name,
    input_schema: input_schema,
    description: description,
  ))
}

pub fn tool_encode(data: Tool) {
  json.object([
    #(
      "cache_control",
      json.nullable(data.cache_control, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("name", json.string(data.name)),
    #(
      "input_schema",
      fn(_) { panic as "AllOf inside field" }(data.input_schema),
    ),
    #("description", json.nullable(data.description, json.string)),
  ])
}

pub fn beta_list_response_model_info_decoder() {
  use last_id <- decode.field(
    "last_id",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use first_id <- decode.field(
    "first_id",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use data <- decode.field("data", decode.list(beta_model_info_decoder()))
  use has_more <- decode.field("has_more", decode.bool)
  decode.success(BetaListResponseModelInfo(
    last_id: last_id,
    first_id: first_id,
    data: data,
    has_more: has_more,
  ))
}

pub fn beta_list_response_model_info_encode(data: BetaListResponseModelInfo) {
  json.object([
    #("last_id", fn(_) { panic as "AnyOf inside field" }(data.last_id)),
    #("first_id", fn(_) { panic as "AnyOf inside field" }(data.first_id)),
    #("data", json.array(_, beta_model_info_encode)(data.data)),
    #("has_more", json.bool(data.has_more)),
  ])
}

pub fn beta_tool_choice_auto_decoder() {
  use disable_parallel_tool_use <- decode.optional_field(
    "disable_parallel_tool_use",
    None,
    decode.optional(decode.bool),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaToolChoiceAuto(
    disable_parallel_tool_use: disable_parallel_tool_use,
    type_: type_,
  ))
}

pub fn beta_tool_choice_auto_encode(data: BetaToolChoiceAuto) {
  json.object([
    #(
      "disable_parallel_tool_use",
      json.nullable(data.disable_parallel_tool_use, json.bool),
    ),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_message_decoder() {
  use stop_reason <- decode.field(
    "stop_reason",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use usage <- decode.field(
    "usage",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use model <- decode.field("model", model_decoder())
  use role <- decode.field("role", decode.string)
  use content <- decode.field(
    "content",
    decode.list(beta_content_block_decoder()),
  )
  use type_ <- decode.field("type", decode.string)
  use id <- decode.field("id", decode.string)
  use stop_sequence <- decode.field(
    "stop_sequence",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  decode.success(BetaMessage(
    stop_reason: stop_reason,
    usage: usage,
    model: model,
    role: role,
    content: content,
    type_: type_,
    id: id,
    stop_sequence: stop_sequence,
  ))
}

pub fn beta_message_encode(data: BetaMessage) {
  json.object([
    #("stop_reason", fn(_) { panic as "AnyOf inside field" }(data.stop_reason)),
    #("usage", fn(_) { panic as "AllOf inside field" }(data.usage)),
    #("model", model_encode(data.model)),
    #("role", json.string(data.role)),
    #("content", json.array(_, beta_content_block_encode)(data.content)),
    #("type", json.string(data.type_)),
    #("id", json.string(data.id)),
    #(
      "stop_sequence",
      fn(_) { panic as "AnyOf inside field" }(data.stop_sequence),
    ),
  ])
}

pub fn model_info_decoder() {
  use display_name <- decode.field("display_name", decode.string)
  use created_at <- decode.field("created_at", decode.string)
  use type_ <- decode.field("type", decode.string)
  use id <- decode.field("id", decode.string)
  decode.success(ModelInfo(
    display_name: display_name,
    created_at: created_at,
    type_: type_,
    id: id,
  ))
}

pub fn model_info_encode(data: ModelInfo) {
  json.object([
    #("display_name", json.string(data.display_name)),
    #("created_at", json.string(data.created_at)),
    #("type", json.string(data.type_)),
    #("id", json.string(data.id)),
  ])
}

pub fn text_content_block_delta_decoder() {
  use text <- decode.field("text", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(TextContentBlockDelta(text: text, type_: type_))
}

pub fn text_content_block_delta_encode(data: TextContentBlockDelta) {
  json.object([
    #("text", json.string(data.text)),
    #("type", json.string(data.type_)),
  ])
}

pub fn create_message_params_without_stream_decoder() {
  use top_k <- decode.optional_field("top_k", None, decode.optional(decode.int))
  use top_p <- decode.optional_field(
    "top_p",
    None,
    decode.optional(decode.float),
  )
  use tool_choice <- decode.optional_field(
    "tool_choice",
    None,
    decode.optional(tool_choice_decoder()),
  )
  use model <- decode.field("model", model_decoder())
  use messages <- decode.field("messages", decode.list(input_message_decoder()))
  use system <- decode.optional_field(
    "system",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use metadata <- decode.optional_field(
    "metadata",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use temperature <- decode.optional_field(
    "temperature",
    None,
    decode.optional(decode.float),
  )
  use max_tokens <- decode.field("max_tokens", decode.int)
  use stop_sequences <- decode.optional_field(
    "stop_sequences",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use tools <- decode.optional_field(
    "tools",
    None,
    decode.optional(decode.list(tool_decoder())),
  )
  decode.success(CreateMessageParamsWithoutStream(
    top_k: top_k,
    top_p: top_p,
    tool_choice: tool_choice,
    model: model,
    messages: messages,
    system: system,
    metadata: metadata,
    temperature: temperature,
    max_tokens: max_tokens,
    stop_sequences: stop_sequences,
    tools: tools,
  ))
}

pub fn create_message_params_without_stream_encode(
  data: CreateMessageParamsWithoutStream,
) {
  json.object([
    #("top_k", json.nullable(data.top_k, json.int)),
    #("top_p", json.nullable(data.top_p, json.float)),
    #("tool_choice", json.nullable(data.tool_choice, tool_choice_encode)),
    #("model", model_encode(data.model)),
    #("messages", json.array(_, input_message_encode)(data.messages)),
    #(
      "system",
      json.nullable(data.system, fn(_) { panic as "AnyOf inside field" }),
    ),
    #(
      "metadata",
      json.nullable(data.metadata, fn(_) { panic as "AllOf inside field" }),
    ),
    #("temperature", json.nullable(data.temperature, json.float)),
    #("max_tokens", json.int(data.max_tokens)),
    #(
      "stop_sequences",
      json.nullable(data.stop_sequences, json.array(_, json.string)),
    ),
    #("tools", json.nullable(data.tools, json.array(_, tool_encode))),
  ])
}

pub fn beta_base64_image_source_decoder() {
  use data <- decode.field("data", decode.string)
  use media_type <- decode.field("media_type", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaBase64ImageSource(
    data: data,
    media_type: media_type,
    type_: type_,
  ))
}

pub fn beta_base64_image_source_encode(data: BetaBase64ImageSource) {
  json.object([
    #("data", json.string(data.data)),
    #("media_type", json.string(data.media_type)),
    #("type", json.string(data.type_)),
  ])
}

pub fn canceled_result_decoder() {
  use type_ <- decode.field("type", decode.string)
  decode.success(CanceledResult(type_: type_))
}

pub fn canceled_result_encode(data: CanceledResult) {
  json.object([#("type", json.string(data.type_))])
}

pub fn content_block_delta_event_decoder() {
  use index <- decode.field("index", decode.int)
  use delta <- decode.field(
    "delta",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(ContentBlockDeltaEvent(
    index: index,
    delta: delta,
    type_: type_,
  ))
}

pub fn content_block_delta_event_encode(data: ContentBlockDeltaEvent) {
  json.object([
    #("index", json.int(data.index)),
    #("delta", fn(_) { panic as "OneOf inside field" }(data.delta)),
    #("type", json.string(data.type_)),
  ])
}

pub fn create_message_batch_params_decoder() {
  use requests <- decode.field(
    "requests",
    decode.list(message_batch_individual_request_params_decoder()),
  )
  decode.success(CreateMessageBatchParams(requests: requests))
}

pub fn create_message_batch_params_encode(data: CreateMessageBatchParams) {
  json.object([
    #(
      "requests",
      json.array(_, message_batch_individual_request_params_encode)(
        data.requests,
      ),
    ),
  ])
}

pub fn content_block_decoder() {
  panic as "OneOf"
}

pub fn content_block_encode(_data: ContentBlock) {
  panic as "OneOf"
}

pub fn beta_errored_result_decoder() {
  use error <- decode.field("error", beta_error_response_decoder())
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaErroredResult(error: error, type_: type_))
}

pub fn beta_errored_result_encode(data: BetaErroredResult) {
  json.object([
    #("error", beta_error_response_encode(data.error)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_text_editor_2024one022_decoder() {
  use cache_control <- decode.optional_field(
    "cache_control",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use name <- decode.field("name", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaTextEditor20241022(
    cache_control: cache_control,
    name: name,
    type_: type_,
  ))
}

pub fn beta_text_editor_2024one022_encode(data: BetaTextEditor20241022) {
  json.object([
    #(
      "cache_control",
      json.nullable(data.cache_control, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("name", json.string(data.name)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_content_block_stop_event_decoder() {
  use index <- decode.field("index", decode.int)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaContentBlockStopEvent(index: index, type_: type_))
}

pub fn beta_content_block_stop_event_encode(data: BetaContentBlockStopEvent) {
  json.object([
    #("index", json.int(data.index)),
    #("type", json.string(data.type_)),
  ])
}

pub fn message_batch_decoder() {
  use results_url <- decode.field(
    "results_url",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use created_at <- decode.field("created_at", decode.string)
  use cancel_initiated_at <- decode.field(
    "cancel_initiated_at",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use archived_at <- decode.field(
    "archived_at",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use request_counts <- decode.field(
    "request_counts",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use ended_at <- decode.field(
    "ended_at",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  use id <- decode.field("id", decode.string)
  use expires_at <- decode.field("expires_at", decode.string)
  use processing_status <- decode.field("processing_status", decode.string)
  decode.success(MessageBatch(
    results_url: results_url,
    created_at: created_at,
    cancel_initiated_at: cancel_initiated_at,
    archived_at: archived_at,
    request_counts: request_counts,
    ended_at: ended_at,
    type_: type_,
    id: id,
    expires_at: expires_at,
    processing_status: processing_status,
  ))
}

pub fn message_batch_encode(data: MessageBatch) {
  json.object([
    #("results_url", fn(_) { panic as "AnyOf inside field" }(data.results_url)),
    #("created_at", json.string(data.created_at)),
    #(
      "cancel_initiated_at",
      fn(_) { panic as "AnyOf inside field" }(data.cancel_initiated_at),
    ),
    #("archived_at", fn(_) { panic as "AnyOf inside field" }(data.archived_at)),
    #(
      "request_counts",
      fn(_) { panic as "AllOf inside field" }(data.request_counts),
    ),
    #("ended_at", fn(_) { panic as "AnyOf inside field" }(data.ended_at)),
    #("type", json.string(data.type_)),
    #("id", json.string(data.id)),
    #("expires_at", json.string(data.expires_at)),
    #("processing_status", json.string(data.processing_status)),
  ])
}

pub fn response_char_location_citation_decoder() {
  use start_char_index <- decode.field("start_char_index", decode.int)
  use end_char_index <- decode.field("end_char_index", decode.int)
  use document_index <- decode.field("document_index", decode.int)
  use document_title <- decode.field(
    "document_title",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  use cited_text <- decode.field("cited_text", decode.string)
  decode.success(ResponseCharLocationCitation(
    start_char_index: start_char_index,
    end_char_index: end_char_index,
    document_index: document_index,
    document_title: document_title,
    type_: type_,
    cited_text: cited_text,
  ))
}

pub fn response_char_location_citation_encode(
  data: ResponseCharLocationCitation,
) {
  json.object([
    #("start_char_index", json.int(data.start_char_index)),
    #("end_char_index", json.int(data.end_char_index)),
    #("document_index", json.int(data.document_index)),
    #(
      "document_title",
      fn(_) { panic as "AnyOf inside field" }(data.document_title),
    ),
    #("type", json.string(data.type_)),
    #("cited_text", json.string(data.cited_text)),
  ])
}

pub fn completion_request_decoder() {
  use stream <- decode.optional_field(
    "stream",
    None,
    decode.optional(decode.bool),
  )
  use top_k <- decode.optional_field("top_k", None, decode.optional(decode.int))
  use max_tokens_to_sample <- decode.field("max_tokens_to_sample", decode.int)
  use prompt <- decode.field("prompt", decode.string)
  use top_p <- decode.optional_field(
    "top_p",
    None,
    decode.optional(decode.float),
  )
  use model <- decode.field("model", model_decoder())
  use metadata <- decode.optional_field(
    "metadata",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use temperature <- decode.optional_field(
    "temperature",
    None,
    decode.optional(decode.float),
  )
  use stop_sequences <- decode.optional_field(
    "stop_sequences",
    None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(CompletionRequest(
    stream: stream,
    top_k: top_k,
    max_tokens_to_sample: max_tokens_to_sample,
    prompt: prompt,
    top_p: top_p,
    model: model,
    metadata: metadata,
    temperature: temperature,
    stop_sequences: stop_sequences,
  ))
}

pub fn completion_request_encode(data: CompletionRequest) {
  json.object([
    #("stream", json.nullable(data.stream, json.bool)),
    #("top_k", json.nullable(data.top_k, json.int)),
    #("max_tokens_to_sample", json.int(data.max_tokens_to_sample)),
    #("prompt", json.string(data.prompt)),
    #("top_p", json.nullable(data.top_p, json.float)),
    #("model", model_encode(data.model)),
    #(
      "metadata",
      json.nullable(data.metadata, fn(_) { panic as "AllOf inside field" }),
    ),
    #("temperature", json.nullable(data.temperature, json.float)),
    #(
      "stop_sequences",
      json.nullable(data.stop_sequences, json.array(_, json.string)),
    ),
  ])
}

pub fn count_message_tokens_response_decoder() {
  use input_tokens <- decode.field("input_tokens", decode.int)
  decode.success(CountMessageTokensResponse(input_tokens: input_tokens))
}

pub fn count_message_tokens_response_encode(data: CountMessageTokensResponse) {
  json.object([#("input_tokens", json.int(data.input_tokens))])
}

pub fn tool_choice_any_decoder() {
  use disable_parallel_tool_use <- decode.optional_field(
    "disable_parallel_tool_use",
    None,
    decode.optional(decode.bool),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(ToolChoiceAny(
    disable_parallel_tool_use: disable_parallel_tool_use,
    type_: type_,
  ))
}

pub fn tool_choice_any_encode(data: ToolChoiceAny) {
  json.object([
    #(
      "disable_parallel_tool_use",
      json.nullable(data.disable_parallel_tool_use, json.bool),
    ),
    #("type", json.string(data.type_)),
  ])
}

pub fn request_counts_decoder() {
  use succeeded <- decode.field("succeeded", decode.int)
  use expired <- decode.field("expired", decode.int)
  use errored <- decode.field("errored", decode.int)
  use processing <- decode.field("processing", decode.int)
  use canceled <- decode.field("canceled", decode.int)
  decode.success(RequestCounts(
    succeeded: succeeded,
    expired: expired,
    errored: errored,
    processing: processing,
    canceled: canceled,
  ))
}

pub fn request_counts_encode(data: RequestCounts) {
  json.object([
    #("succeeded", json.int(data.succeeded)),
    #("expired", json.int(data.expired)),
    #("errored", json.int(data.errored)),
    #("processing", json.int(data.processing)),
    #("canceled", json.int(data.canceled)),
  ])
}

pub fn message_stream_event_decoder() {
  panic as "OneOf"
}

pub fn message_stream_event_encode(_data: MessageStreamEvent) {
  panic as "OneOf"
}

pub fn beta_request_document_block_decoder() {
  use cache_control <- decode.optional_field(
    "cache_control",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use citations <- decode.optional_field(
    "citations",
    None,
    decode.optional(beta_request_citations_config_decoder()),
  )
  use context <- decode.optional_field(
    "context",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use type_ <- decode.field("type", decode.string)
  use source <- decode.field(
    "source",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  decode.success(BetaRequestDocumentBlock(
    cache_control: cache_control,
    citations: citations,
    context: context,
    title: title,
    type_: type_,
    source: source,
  ))
}

pub fn beta_request_document_block_encode(data: BetaRequestDocumentBlock) {
  json.object([
    #(
      "cache_control",
      json.nullable(data.cache_control, fn(_) { panic as "AnyOf inside field" }),
    ),
    #(
      "citations",
      json.nullable(data.citations, beta_request_citations_config_encode),
    ),
    #(
      "context",
      json.nullable(data.context, fn(_) { panic as "AnyOf inside field" }),
    ),
    #(
      "title",
      json.nullable(data.title, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("type", json.string(data.type_)),
    #("source", fn(_) { panic as "OneOf inside field" }(data.source)),
  ])
}

pub fn beta_expired_result_decoder() {
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaExpiredResult(type_: type_))
}

pub fn beta_expired_result_encode(data: BetaExpiredResult) {
  json.object([#("type", json.string(data.type_))])
}

pub fn input_json_content_block_delta_decoder() {
  use partial_json <- decode.field("partial_json", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(InputJsonContentBlockDelta(
    partial_json: partial_json,
    type_: type_,
  ))
}

pub fn input_json_content_block_delta_encode(data: InputJsonContentBlockDelta) {
  json.object([
    #("partial_json", json.string(data.partial_json)),
    #("type", json.string(data.type_)),
  ])
}

pub fn plain_text_source_decoder() {
  use data <- decode.field("data", decode.string)
  use media_type <- decode.field("media_type", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(PlainTextSource(
    data: data,
    media_type: media_type,
    type_: type_,
  ))
}

pub fn plain_text_source_encode(data: PlainTextSource) {
  json.object([
    #("data", json.string(data.data)),
    #("media_type", json.string(data.media_type)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_cache_control_ephemeral_decoder() {
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaCacheControlEphemeral(type_: type_))
}

pub fn beta_cache_control_ephemeral_encode(data: BetaCacheControlEphemeral) {
  json.object([#("type", json.string(data.type_))])
}

pub fn beta_request_image_block_decoder() {
  use cache_control <- decode.optional_field(
    "cache_control",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use type_ <- decode.field("type", decode.string)
  use source <- decode.field(
    "source",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  decode.success(BetaRequestImageBlock(
    cache_control: cache_control,
    type_: type_,
    source: source,
  ))
}

pub fn beta_request_image_block_encode(data: BetaRequestImageBlock) {
  json.object([
    #(
      "cache_control",
      json.nullable(data.cache_control, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("type", json.string(data.type_)),
    #("source", fn(_) { panic as "AllOf inside field" }(data.source)),
  ])
}

pub fn message_stop_event_decoder() {
  use type_ <- decode.field("type", decode.string)
  decode.success(MessageStopEvent(type_: type_))
}

pub fn message_stop_event_encode(data: MessageStopEvent) {
  json.object([#("type", json.string(data.type_))])
}

pub fn tool_choice_tool_decoder() {
  use disable_parallel_tool_use <- decode.optional_field(
    "disable_parallel_tool_use",
    None,
    decode.optional(decode.bool),
  )
  use name <- decode.field("name", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(ToolChoiceTool(
    disable_parallel_tool_use: disable_parallel_tool_use,
    name: name,
    type_: type_,
  ))
}

pub fn tool_choice_tool_encode(data: ToolChoiceTool) {
  json.object([
    #(
      "disable_parallel_tool_use",
      json.nullable(data.disable_parallel_tool_use, json.bool),
    ),
    #("name", json.string(data.name)),
    #("type", json.string(data.type_)),
  ])
}

pub fn response_content_block_location_citation_decoder() {
  use start_block_index <- decode.field("start_block_index", decode.int)
  use document_index <- decode.field("document_index", decode.int)
  use document_title <- decode.field(
    "document_title",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  use end_block_index <- decode.field("end_block_index", decode.int)
  use cited_text <- decode.field("cited_text", decode.string)
  decode.success(ResponseContentBlockLocationCitation(
    start_block_index: start_block_index,
    document_index: document_index,
    document_title: document_title,
    type_: type_,
    end_block_index: end_block_index,
    cited_text: cited_text,
  ))
}

pub fn response_content_block_location_citation_encode(
  data: ResponseContentBlockLocationCitation,
) {
  json.object([
    #("start_block_index", json.int(data.start_block_index)),
    #("document_index", json.int(data.document_index)),
    #(
      "document_title",
      fn(_) { panic as "AnyOf inside field" }(data.document_title),
    ),
    #("type", json.string(data.type_)),
    #("end_block_index", json.int(data.end_block_index)),
    #("cited_text", json.string(data.cited_text)),
  ])
}

pub fn beta_request_char_location_citation_decoder() {
  use start_char_index <- decode.field("start_char_index", decode.int)
  use end_char_index <- decode.field("end_char_index", decode.int)
  use document_index <- decode.field("document_index", decode.int)
  use document_title <- decode.field(
    "document_title",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  use cited_text <- decode.field("cited_text", decode.string)
  decode.success(BetaRequestCharLocationCitation(
    start_char_index: start_char_index,
    end_char_index: end_char_index,
    document_index: document_index,
    document_title: document_title,
    type_: type_,
    cited_text: cited_text,
  ))
}

pub fn beta_request_char_location_citation_encode(
  data: BetaRequestCharLocationCitation,
) {
  json.object([
    #("start_char_index", json.int(data.start_char_index)),
    #("end_char_index", json.int(data.end_char_index)),
    #("document_index", json.int(data.document_index)),
    #(
      "document_title",
      fn(_) { panic as "AnyOf inside field" }(data.document_title),
    ),
    #("type", json.string(data.type_)),
    #("cited_text", json.string(data.cited_text)),
  ])
}

pub fn request_text_block_decoder() {
  use cache_control <- decode.optional_field(
    "cache_control",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use citations <- decode.optional_field(
    "citations",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use text <- decode.field("text", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(RequestTextBlock(
    cache_control: cache_control,
    citations: citations,
    text: text,
    type_: type_,
  ))
}

pub fn request_text_block_encode(data: RequestTextBlock) {
  json.object([
    #(
      "cache_control",
      json.nullable(data.cache_control, fn(_) { panic as "AnyOf inside field" }),
    ),
    #(
      "citations",
      json.nullable(data.citations, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("text", json.string(data.text)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_usage_decoder() {
  use input_tokens <- decode.field("input_tokens", decode.int)
  use cache_creation_input_tokens <- decode.field(
    "cache_creation_input_tokens",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use output_tokens <- decode.field("output_tokens", decode.int)
  use cache_read_input_tokens <- decode.field(
    "cache_read_input_tokens",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  decode.success(BetaUsage(
    input_tokens: input_tokens,
    cache_creation_input_tokens: cache_creation_input_tokens,
    output_tokens: output_tokens,
    cache_read_input_tokens: cache_read_input_tokens,
  ))
}

pub fn beta_usage_encode(data: BetaUsage) {
  json.object([
    #("input_tokens", json.int(data.input_tokens)),
    #(
      "cache_creation_input_tokens",
      fn(_) { panic as "AnyOf inside field" }(data.cache_creation_input_tokens),
    ),
    #("output_tokens", json.int(data.output_tokens)),
    #(
      "cache_read_input_tokens",
      fn(_) { panic as "AnyOf inside field" }(data.cache_read_input_tokens),
    ),
  ])
}

pub fn create_message_params_decoder() {
  use stream <- decode.optional_field(
    "stream",
    None,
    decode.optional(decode.bool),
  )
  use top_k <- decode.optional_field("top_k", None, decode.optional(decode.int))
  use top_p <- decode.optional_field(
    "top_p",
    None,
    decode.optional(decode.float),
  )
  use tool_choice <- decode.optional_field(
    "tool_choice",
    None,
    decode.optional(tool_choice_decoder()),
  )
  use model <- decode.field("model", model_decoder())
  use messages <- decode.field("messages", decode.list(input_message_decoder()))
  use system <- decode.optional_field(
    "system",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use metadata <- decode.optional_field(
    "metadata",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use temperature <- decode.optional_field(
    "temperature",
    None,
    decode.optional(decode.float),
  )
  use max_tokens <- decode.field("max_tokens", decode.int)
  use stop_sequences <- decode.optional_field(
    "stop_sequences",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use tools <- decode.optional_field(
    "tools",
    None,
    decode.optional(decode.list(tool_decoder())),
  )
  decode.success(CreateMessageParams(
    stream: stream,
    top_k: top_k,
    top_p: top_p,
    tool_choice: tool_choice,
    model: model,
    messages: messages,
    system: system,
    metadata: metadata,
    temperature: temperature,
    max_tokens: max_tokens,
    stop_sequences: stop_sequences,
    tools: tools,
  ))
}

pub fn create_message_params_encode(data: CreateMessageParams) {
  utils.object([
    #("stream", json.nullable(data.stream, json.bool)),
    #("top_k", json.nullable(data.top_k, json.int)),
    #("top_p", json.nullable(data.top_p, json.float)),
    #("tool_choice", json.nullable(data.tool_choice, tool_choice_encode)),
    #("model", model_encode(data.model)),
    #("messages", json.array(_, input_message_encode)(data.messages)),
    #(
      "system",
      json.nullable(data.system, fn(_) { panic as "AnyOf inside field" }),
    ),
    #(
      "metadata",
      json.nullable(data.metadata, fn(_) { panic as "AllOf inside field" }),
    ),
    #("temperature", json.nullable(data.temperature, json.float)),
    #("max_tokens", json.int(data.max_tokens)),
    #(
      "stop_sequences",
      json.nullable(data.stop_sequences, json.array(_, json.string)),
    ),
    #("tools", json.nullable(data.tools, json.array(_, tool_encode))),
  ])
}

pub fn message_delta_decoder() {
  use stop_reason <- decode.field(
    "stop_reason",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use stop_sequence <- decode.field(
    "stop_sequence",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  decode.success(MessageDelta(
    stop_reason: stop_reason,
    stop_sequence: stop_sequence,
  ))
}

pub fn message_delta_encode(data: MessageDelta) {
  json.object([
    #("stop_reason", fn(_) { panic as "AnyOf inside field" }(data.stop_reason)),
    #(
      "stop_sequence",
      fn(_) { panic as "AnyOf inside field" }(data.stop_sequence),
    ),
  ])
}

pub fn authentication_error_decoder() {
  use message <- decode.field("message", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(AuthenticationError(message: message, type_: type_))
}

pub fn authentication_error_encode(data: AuthenticationError) {
  json.object([
    #("message", json.string(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn invalid_request_error_decoder() {
  use message <- decode.field("message", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(InvalidRequestError(message: message, type_: type_))
}

pub fn invalid_request_error_encode(data: InvalidRequestError) {
  json.object([
    #("message", json.string(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn message_delta_usage_decoder() {
  use output_tokens <- decode.field("output_tokens", decode.int)
  decode.success(MessageDeltaUsage(output_tokens: output_tokens))
}

pub fn message_delta_usage_encode(data: MessageDeltaUsage) {
  json.object([#("output_tokens", json.int(data.output_tokens))])
}

pub fn beta_response_text_block_decoder() {
  use citations <- decode.field(
    "citations",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use text <- decode.field("text", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaResponseTextBlock(
    citations: citations,
    text: text,
    type_: type_,
  ))
}

pub fn beta_response_text_block_encode(data: BetaResponseTextBlock) {
  json.object([
    #("citations", fn(_) { panic as "AnyOf inside field" }(data.citations)),
    #("text", json.string(data.text)),
    #("type", json.string(data.type_)),
  ])
}

pub fn overloaded_error_decoder() {
  use message <- decode.field("message", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(OverloadedError(message: message, type_: type_))
}

pub fn overloaded_error_encode(data: OverloadedError) {
  json.object([
    #("message", json.string(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_request_content_block_location_citation_decoder() {
  use start_block_index <- decode.field("start_block_index", decode.int)
  use document_index <- decode.field("document_index", decode.int)
  use document_title <- decode.field(
    "document_title",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  use end_block_index <- decode.field("end_block_index", decode.int)
  use cited_text <- decode.field("cited_text", decode.string)
  decode.success(BetaRequestContentBlockLocationCitation(
    start_block_index: start_block_index,
    document_index: document_index,
    document_title: document_title,
    type_: type_,
    end_block_index: end_block_index,
    cited_text: cited_text,
  ))
}

pub fn beta_request_content_block_location_citation_encode(
  data: BetaRequestContentBlockLocationCitation,
) {
  json.object([
    #("start_block_index", json.int(data.start_block_index)),
    #("document_index", json.int(data.document_index)),
    #(
      "document_title",
      fn(_) { panic as "AnyOf inside field" }(data.document_title),
    ),
    #("type", json.string(data.type_)),
    #("end_block_index", json.int(data.end_block_index)),
    #("cited_text", json.string(data.cited_text)),
  ])
}

pub fn metadata_decoder() {
  use user_id <- decode.optional_field(
    "user_id",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  decode.success(Metadata(user_id: user_id))
}

pub fn metadata_encode(data: Metadata) {
  json.object([
    #(
      "user_id",
      json.nullable(data.user_id, fn(_) { panic as "AnyOf inside field" }),
    ),
  ])
}

pub fn beta_message_start_event_decoder() {
  use message <- decode.field("message", beta_message_decoder())
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaMessageStartEvent(message: message, type_: type_))
}

pub fn beta_message_start_event_encode(data: BetaMessageStartEvent) {
  json.object([
    #("message", beta_message_encode(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_response_tool_use_block_decoder() {
  use input <- decode.field(
    "input",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use name <- decode.field("name", decode.string)
  use type_ <- decode.field("type", decode.string)
  use id <- decode.field("id", decode.string)
  decode.success(BetaResponseToolUseBlock(
    input: input,
    name: name,
    type_: type_,
    id: id,
  ))
}

pub fn beta_response_tool_use_block_encode(data: BetaResponseToolUseBlock) {
  json.object([
    #("input", fn(_) { panic as "Literal object inside field" }(data.input)),
    #("name", json.string(data.name)),
    #("type", json.string(data.type_)),
    #("id", json.string(data.id)),
  ])
}

pub fn beta_delete_message_batch_response_decoder() {
  use type_ <- decode.field("type", decode.string)
  use id <- decode.field("id", decode.string)
  decode.success(BetaDeleteMessageBatchResponse(type_: type_, id: id))
}

pub fn beta_delete_message_batch_response_encode(
  data: BetaDeleteMessageBatchResponse,
) {
  json.object([
    #("type", json.string(data.type_)),
    #("id", json.string(data.id)),
  ])
}

pub fn content_block_source_decoder() {
  use content <- decode.field(
    "content",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(ContentBlockSource(content: content, type_: type_))
}

pub fn content_block_source_encode(data: ContentBlockSource) {
  json.object([
    #("content", fn(_) { panic as "AnyOf inside field" }(data.content)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_request_citations_config_decoder() {
  use enabled <- decode.optional_field(
    "enabled",
    None,
    decode.optional(decode.bool),
  )
  decode.success(BetaRequestCitationsConfig(enabled: enabled))
}

pub fn beta_request_citations_config_encode(data: BetaRequestCitationsConfig) {
  json.object([#("enabled", json.nullable(data.enabled, json.bool))])
}

pub fn beta_base64_pdfsource_decoder() {
  use data <- decode.field("data", decode.string)
  use media_type <- decode.field("media_type", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaBase64Pdfsource(
    data: data,
    media_type: media_type,
    type_: type_,
  ))
}

pub fn beta_base64_pdfsource_encode(data: BetaBase64Pdfsource) {
  json.object([
    #("data", json.string(data.data)),
    #("media_type", json.string(data.media_type)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_succeeded_result_decoder() {
  use message <- decode.field("message", beta_message_decoder())
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaSucceededResult(message: message, type_: type_))
}

pub fn beta_succeeded_result_encode(data: BetaSucceededResult) {
  json.object([
    #("message", beta_message_encode(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_input_content_block_decoder() {
  panic as "OneOf"
}

pub fn beta_input_content_block_encode(_data: BetaInputContentBlock) {
  panic as "OneOf"
}

pub fn apierror_decoder() {
  use message <- decode.field("message", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(Apierror(message: message, type_: type_))
}

pub fn apierror_encode(data: Apierror) {
  json.object([
    #("message", json.string(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_input_message_decoder() {
  use role <- decode.field("role", decode.string)
  use content <- decode.field(
    "content",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  decode.success(BetaInputMessage(role: role, content: content))
}

pub fn beta_input_message_encode(data: BetaInputMessage) {
  json.object([
    #("role", json.string(data.role)),
    #("content", fn(_) { panic as "AnyOf inside field" }(data.content)),
  ])
}

pub fn message_batch_individual_response_decoder() {
  use custom_id <- decode.field("custom_id", decode.string)
  use result <- decode.field(
    "result",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  decode.success(MessageBatchIndividualResponse(
    custom_id: custom_id,
    result: result,
  ))
}

pub fn message_batch_individual_response_encode(
  data: MessageBatchIndividualResponse,
) {
  json.object([
    #("custom_id", json.string(data.custom_id)),
    #("result", fn(_) { panic as "OneOf inside field" }(data.result)),
  ])
}

pub fn request_tool_use_block_decoder() {
  use cache_control <- decode.optional_field(
    "cache_control",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use input <- decode.field(
    "input",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use name <- decode.field("name", decode.string)
  use type_ <- decode.field("type", decode.string)
  use id <- decode.field("id", decode.string)
  decode.success(RequestToolUseBlock(
    cache_control: cache_control,
    input: input,
    name: name,
    type_: type_,
    id: id,
  ))
}

pub fn request_tool_use_block_encode(data: RequestToolUseBlock) {
  json.object([
    #(
      "cache_control",
      json.nullable(data.cache_control, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("input", fn(_) { panic as "Literal object inside field" }(data.input)),
    #("name", json.string(data.name)),
    #("type", json.string(data.type_)),
    #("id", json.string(data.id)),
  ])
}

pub fn billing_error_decoder() {
  use message <- decode.field("message", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BillingError(message: message, type_: type_))
}

pub fn billing_error_encode(data: BillingError) {
  json.object([
    #("message", json.string(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn rate_limit_error_decoder() {
  use message <- decode.field("message", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(RateLimitError(message: message, type_: type_))
}

pub fn rate_limit_error_encode(data: RateLimitError) {
  json.object([
    #("message", json.string(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn content_block_start_event_decoder() {
  use content_block <- decode.field(
    "content_block",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use index <- decode.field("index", decode.int)
  use type_ <- decode.field("type", decode.string)
  decode.success(ContentBlockStartEvent(
    content_block: content_block,
    index: index,
    type_: type_,
  ))
}

pub fn content_block_start_event_encode(data: ContentBlockStartEvent) {
  json.object([
    #(
      "content_block",
      fn(_) { panic as "OneOf inside field" }(data.content_block),
    ),
    #("index", json.int(data.index)),
    #("type", json.string(data.type_)),
  ])
}

pub fn list_response_message_batch_decoder() {
  use last_id <- decode.field(
    "last_id",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use first_id <- decode.field(
    "first_id",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use data <- decode.field("data", decode.list(message_batch_decoder()))
  use has_more <- decode.field("has_more", decode.bool)
  decode.success(ListResponseMessageBatch(
    last_id: last_id,
    first_id: first_id,
    data: data,
    has_more: has_more,
  ))
}

pub fn list_response_message_batch_encode(data: ListResponseMessageBatch) {
  json.object([
    #("last_id", fn(_) { panic as "AnyOf inside field" }(data.last_id)),
    #("first_id", fn(_) { panic as "AnyOf inside field" }(data.first_id)),
    #("data", json.array(_, message_batch_encode)(data.data)),
    #("has_more", json.bool(data.has_more)),
  ])
}

pub fn citations_delta_decoder() {
  use citation <- decode.field(
    "citation",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(CitationsDelta(citation: citation, type_: type_))
}

pub fn citations_delta_encode(data: CitationsDelta) {
  json.object([
    #("citation", fn(_) { panic as "OneOf inside field" }(data.citation)),
    #("type", json.string(data.type_)),
  ])
}

pub fn response_page_location_citation_decoder() {
  use document_index <- decode.field("document_index", decode.int)
  use document_title <- decode.field(
    "document_title",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use end_page_number <- decode.field("end_page_number", decode.int)
  use type_ <- decode.field("type", decode.string)
  use start_page_number <- decode.field("start_page_number", decode.int)
  use cited_text <- decode.field("cited_text", decode.string)
  decode.success(ResponsePageLocationCitation(
    document_index: document_index,
    document_title: document_title,
    end_page_number: end_page_number,
    type_: type_,
    start_page_number: start_page_number,
    cited_text: cited_text,
  ))
}

pub fn response_page_location_citation_encode(
  data: ResponsePageLocationCitation,
) {
  json.object([
    #("document_index", json.int(data.document_index)),
    #(
      "document_title",
      fn(_) { panic as "AnyOf inside field" }(data.document_title),
    ),
    #("end_page_number", json.int(data.end_page_number)),
    #("type", json.string(data.type_)),
    #("start_page_number", json.int(data.start_page_number)),
    #("cited_text", json.string(data.cited_text)),
  ])
}

pub fn input_schema_decoder() {
  use properties <- decode.optional_field(
    "properties",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(InputSchema(properties: properties, type_: type_))
}

pub fn input_schema_encode(data: InputSchema) {
  json.object([
    #(
      "properties",
      json.nullable(data.properties, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("type", json.string(data.type_)),
  ])
}

pub fn gateway_timeout_error_decoder() {
  use message <- decode.field("message", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(GatewayTimeoutError(message: message, type_: type_))
}

pub fn gateway_timeout_error_encode(data: GatewayTimeoutError) {
  json.object([
    #("message", json.string(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_request_page_location_citation_decoder() {
  use document_index <- decode.field("document_index", decode.int)
  use document_title <- decode.field(
    "document_title",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use end_page_number <- decode.field("end_page_number", decode.int)
  use type_ <- decode.field("type", decode.string)
  use start_page_number <- decode.field("start_page_number", decode.int)
  use cited_text <- decode.field("cited_text", decode.string)
  decode.success(BetaRequestPageLocationCitation(
    document_index: document_index,
    document_title: document_title,
    end_page_number: end_page_number,
    type_: type_,
    start_page_number: start_page_number,
    cited_text: cited_text,
  ))
}

pub fn beta_request_page_location_citation_encode(
  data: BetaRequestPageLocationCitation,
) {
  json.object([
    #("document_index", json.int(data.document_index)),
    #(
      "document_title",
      fn(_) { panic as "AnyOf inside field" }(data.document_title),
    ),
    #("end_page_number", json.int(data.end_page_number)),
    #("type", json.string(data.type_)),
    #("start_page_number", json.int(data.start_page_number)),
    #("cited_text", json.string(data.cited_text)),
  ])
}

pub fn beta_computer_use_tool_2024one022_decoder() {
  use cache_control <- decode.optional_field(
    "cache_control",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use display_height_px <- decode.field("display_height_px", decode.int)
  use display_number <- decode.optional_field(
    "display_number",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use name <- decode.field("name", decode.string)
  use type_ <- decode.field("type", decode.string)
  use display_width_px <- decode.field("display_width_px", decode.int)
  decode.success(BetaComputerUseTool20241022(
    cache_control: cache_control,
    display_height_px: display_height_px,
    display_number: display_number,
    name: name,
    type_: type_,
    display_width_px: display_width_px,
  ))
}

pub fn beta_computer_use_tool_2024one022_encode(
  data: BetaComputerUseTool20241022,
) {
  json.object([
    #(
      "cache_control",
      json.nullable(data.cache_control, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("display_height_px", json.int(data.display_height_px)),
    #(
      "display_number",
      json.nullable(data.display_number, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("name", json.string(data.name)),
    #("type", json.string(data.type_)),
    #("display_width_px", json.int(data.display_width_px)),
  ])
}

pub fn beta_tool_choice_decoder() {
  panic as "OneOf"
}

pub fn beta_tool_choice_encode(_data: BetaToolChoice) {
  panic as "OneOf"
}

pub fn request_tool_result_block_decoder() {
  use cache_control <- decode.optional_field(
    "cache_control",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use is_error <- decode.optional_field(
    "is_error",
    None,
    decode.optional(decode.bool),
  )
  use content <- decode.optional_field(
    "content",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use type_ <- decode.field("type", decode.string)
  use tool_use_id <- decode.field("tool_use_id", decode.string)
  decode.success(RequestToolResultBlock(
    cache_control: cache_control,
    is_error: is_error,
    content: content,
    type_: type_,
    tool_use_id: tool_use_id,
  ))
}

pub fn request_tool_result_block_encode(data: RequestToolResultBlock) {
  json.object([
    #(
      "cache_control",
      json.nullable(data.cache_control, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("is_error", json.nullable(data.is_error, json.bool)),
    #(
      "content",
      json.nullable(data.content, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("type", json.string(data.type_)),
    #("tool_use_id", json.string(data.tool_use_id)),
  ])
}

pub fn model_decoder() {
  decode.string
}

pub fn model_encode(data: Model) {
  json.string(data)
}

pub fn beta_not_found_error_decoder() {
  use message <- decode.field("message", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaNotFoundError(message: message, type_: type_))
}

pub fn beta_not_found_error_encode(data: BetaNotFoundError) {
  json.object([
    #("message", json.string(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn error_response_decoder() {
  use error <- decode.field(
    "error",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(ErrorResponse(error: error, type_: type_))
}

pub fn error_response_encode(data: ErrorResponse) {
  json.object([
    #("error", fn(_) { panic as "OneOf inside field" }(data.error)),
    #("type", json.string(data.type_)),
  ])
}

pub fn message_batch_individual_request_params_decoder() {
  use params <- decode.field(
    "params",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use custom_id <- decode.field("custom_id", decode.string)
  decode.success(MessageBatchIndividualRequestParams(
    params: params,
    custom_id: custom_id,
  ))
}

pub fn message_batch_individual_request_params_encode(
  data: MessageBatchIndividualRequestParams,
) {
  json.object([
    #("params", fn(_) { panic as "AllOf inside field" }(data.params)),
    #("custom_id", json.string(data.custom_id)),
  ])
}

pub fn beta_permission_error_decoder() {
  use message <- decode.field("message", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaPermissionError(message: message, type_: type_))
}

pub fn beta_permission_error_encode(data: BetaPermissionError) {
  json.object([
    #("message", json.string(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn message_delta_event_decoder() {
  use usage <- decode.field(
    "usage",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use delta <- decode.field("delta", message_delta_decoder())
  use type_ <- decode.field("type", decode.string)
  decode.success(MessageDeltaEvent(usage: usage, delta: delta, type_: type_))
}

pub fn message_delta_event_encode(data: MessageDeltaEvent) {
  json.object([
    #("usage", fn(_) { panic as "AllOf inside field" }(data.usage)),
    #("delta", message_delta_encode(data.delta)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_tool_decoder() {
  use cache_control <- decode.optional_field(
    "cache_control",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use name <- decode.field("name", decode.string)
  use input_schema <- decode.field(
    "input_schema",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  decode.success(BetaTool(
    cache_control: cache_control,
    name: name,
    input_schema: input_schema,
    type_: type_,
    description: description,
  ))
}

pub fn beta_tool_encode(data: BetaTool) {
  json.object([
    #(
      "cache_control",
      json.nullable(data.cache_control, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("name", json.string(data.name)),
    #(
      "input_schema",
      fn(_) { panic as "AllOf inside field" }(data.input_schema),
    ),
    #(
      "type",
      json.nullable(data.type_, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("description", json.nullable(data.description, json.string)),
  ])
}

pub fn tool_choice_auto_decoder() {
  use disable_parallel_tool_use <- decode.optional_field(
    "disable_parallel_tool_use",
    None,
    decode.optional(decode.bool),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(ToolChoiceAuto(
    disable_parallel_tool_use: disable_parallel_tool_use,
    type_: type_,
  ))
}

pub fn tool_choice_auto_encode(data: ToolChoiceAuto) {
  json.object([
    #(
      "disable_parallel_tool_use",
      json.nullable(data.disable_parallel_tool_use, json.bool),
    ),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_count_message_tokens_params_decoder() {
  use tool_choice <- decode.optional_field(
    "tool_choice",
    None,
    decode.optional(beta_tool_choice_decoder()),
  )
  use model <- decode.field("model", model_decoder())
  use messages <- decode.field(
    "messages",
    decode.list(beta_input_message_decoder()),
  )
  use system <- decode.optional_field(
    "system",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use tools <- decode.optional_field(
    "tools",
    None,
    decode.optional(
      decode.list(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
    ),
  )
  decode.success(BetaCountMessageTokensParams(
    tool_choice: tool_choice,
    model: model,
    messages: messages,
    system: system,
    tools: tools,
  ))
}

pub fn beta_count_message_tokens_params_encode(
  data: BetaCountMessageTokensParams,
) {
  json.object([
    #("tool_choice", json.nullable(data.tool_choice, beta_tool_choice_encode)),
    #("model", model_encode(data.model)),
    #("messages", json.array(_, beta_input_message_encode)(data.messages)),
    #(
      "system",
      json.nullable(data.system, fn(_) { panic as "AnyOf inside field" }),
    ),
    #(
      "tools",
      json.nullable(
        data.tools,
        json.array(_, fn(_) { panic as "Oneoas.OneOf in array" }),
      ),
    ),
  ])
}

pub fn list_response_model_info_decoder() {
  use last_id <- decode.field(
    "last_id",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use first_id <- decode.field(
    "first_id",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use data <- decode.field("data", decode.list(model_info_decoder()))
  use has_more <- decode.field("has_more", decode.bool)
  decode.success(ListResponseModelInfo(
    last_id: last_id,
    first_id: first_id,
    data: data,
    has_more: has_more,
  ))
}

pub fn list_response_model_info_encode(data: ListResponseModelInfo) {
  json.object([
    #("last_id", fn(_) { panic as "AnyOf inside field" }(data.last_id)),
    #("first_id", fn(_) { panic as "AnyOf inside field" }(data.first_id)),
    #("data", json.array(_, model_info_encode)(data.data)),
    #("has_more", json.bool(data.has_more)),
  ])
}

pub fn message_decoder() {
  use stop_reason <- decode.field(
    "stop_reason",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use usage <- decode.field(
    "usage",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use model <- decode.field("model", model_decoder())
  use role <- decode.field("role", decode.string)
  use content <- decode.field("content", decode.list(content_block_decoder()))
  use type_ <- decode.field("type", decode.string)
  use id <- decode.field("id", decode.string)
  use stop_sequence <- decode.field(
    "stop_sequence",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  decode.success(Message(
    stop_reason: stop_reason,
    usage: usage,
    model: model,
    role: role,
    content: content,
    type_: type_,
    id: id,
    stop_sequence: stop_sequence,
  ))
}

pub fn message_encode(data: Message) {
  json.object([
    #("stop_reason", fn(_) { panic as "AnyOf inside field" }(data.stop_reason)),
    #("usage", fn(_) { panic as "AllOf inside field" }(data.usage)),
    #("model", model_encode(data.model)),
    #("role", json.string(data.role)),
    #("content", json.array(_, content_block_encode)(data.content)),
    #("type", json.string(data.type_)),
    #("id", json.string(data.id)),
    #(
      "stop_sequence",
      fn(_) { panic as "AnyOf inside field" }(data.stop_sequence),
    ),
  ])
}

pub fn beta_model_info_decoder() {
  use display_name <- decode.field("display_name", decode.string)
  use created_at <- decode.field("created_at", decode.string)
  use type_ <- decode.field("type", decode.string)
  use id <- decode.field("id", decode.string)
  decode.success(BetaModelInfo(
    display_name: display_name,
    created_at: created_at,
    type_: type_,
    id: id,
  ))
}

pub fn beta_model_info_encode(data: BetaModelInfo) {
  json.object([
    #("display_name", json.string(data.display_name)),
    #("created_at", json.string(data.created_at)),
    #("type", json.string(data.type_)),
    #("id", json.string(data.id)),
  ])
}

pub fn beta_text_content_block_delta_decoder() {
  use text <- decode.field("text", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaTextContentBlockDelta(text: text, type_: type_))
}

pub fn beta_text_content_block_delta_encode(data: BetaTextContentBlockDelta) {
  json.object([
    #("text", json.string(data.text)),
    #("type", json.string(data.type_)),
  ])
}

pub fn base64_image_source_decoder() {
  use data <- decode.field("data", decode.string)
  use media_type <- decode.field("media_type", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(Base64ImageSource(
    data: data,
    media_type: media_type,
    type_: type_,
  ))
}

pub fn base64_image_source_encode(data: Base64ImageSource) {
  json.object([
    #("data", json.string(data.data)),
    #("media_type", json.string(data.media_type)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_content_block_delta_event_decoder() {
  use index <- decode.field("index", decode.int)
  use delta <- decode.field(
    "delta",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaContentBlockDeltaEvent(
    index: index,
    delta: delta,
    type_: type_,
  ))
}

pub fn beta_content_block_delta_event_encode(data: BetaContentBlockDeltaEvent) {
  json.object([
    #("index", json.int(data.index)),
    #("delta", fn(_) { panic as "OneOf inside field" }(data.delta)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_canceled_result_decoder() {
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaCanceledResult(type_: type_))
}

pub fn beta_canceled_result_encode(data: BetaCanceledResult) {
  json.object([#("type", json.string(data.type_))])
}

pub fn beta_create_message_batch_params_decoder() {
  use requests <- decode.field(
    "requests",
    decode.list(beta_message_batch_individual_request_params_decoder()),
  )
  decode.success(BetaCreateMessageBatchParams(requests: requests))
}

pub fn beta_create_message_batch_params_encode(
  data: BetaCreateMessageBatchParams,
) {
  json.object([
    #(
      "requests",
      json.array(_, beta_message_batch_individual_request_params_encode)(
        data.requests,
      ),
    ),
  ])
}

pub fn errored_result_decoder() {
  use error <- decode.field("error", error_response_decoder())
  use type_ <- decode.field("type", decode.string)
  decode.success(ErroredResult(error: error, type_: type_))
}

pub fn errored_result_encode(data: ErroredResult) {
  json.object([
    #("error", error_response_encode(data.error)),
    #("type", json.string(data.type_)),
  ])
}

pub fn content_block_stop_event_decoder() {
  use index <- decode.field("index", decode.int)
  use type_ <- decode.field("type", decode.string)
  decode.success(ContentBlockStopEvent(index: index, type_: type_))
}

pub fn content_block_stop_event_encode(data: ContentBlockStopEvent) {
  json.object([
    #("index", json.int(data.index)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_content_block_decoder() {
  panic as "OneOf"
}

pub fn beta_content_block_encode(_data: BetaContentBlock) {
  panic as "OneOf"
}

pub fn beta_message_stream_event_decoder() {
  panic as "OneOf"
}

pub fn beta_message_stream_event_encode(_data: BetaMessageStreamEvent) {
  panic as "OneOf"
}

pub fn request_document_block_decoder() {
  use cache_control <- decode.optional_field(
    "cache_control",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use citations <- decode.optional_field(
    "citations",
    None,
    decode.optional(request_citations_config_decoder()),
  )
  use context <- decode.optional_field(
    "context",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use type_ <- decode.field("type", decode.string)
  use source <- decode.field(
    "source",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  decode.success(RequestDocumentBlock(
    cache_control: cache_control,
    citations: citations,
    context: context,
    title: title,
    type_: type_,
    source: source,
  ))
}

pub fn request_document_block_encode(data: RequestDocumentBlock) {
  json.object([
    #(
      "cache_control",
      json.nullable(data.cache_control, fn(_) { panic as "AnyOf inside field" }),
    ),
    #(
      "citations",
      json.nullable(data.citations, request_citations_config_encode),
    ),
    #(
      "context",
      json.nullable(data.context, fn(_) { panic as "AnyOf inside field" }),
    ),
    #(
      "title",
      json.nullable(data.title, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("type", json.string(data.type_)),
    #("source", fn(_) { panic as "OneOf inside field" }(data.source)),
  ])
}

pub fn beta_tool_choice_any_decoder() {
  use disable_parallel_tool_use <- decode.optional_field(
    "disable_parallel_tool_use",
    None,
    decode.optional(decode.bool),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaToolChoiceAny(
    disable_parallel_tool_use: disable_parallel_tool_use,
    type_: type_,
  ))
}

pub fn beta_tool_choice_any_encode(data: BetaToolChoiceAny) {
  json.object([
    #(
      "disable_parallel_tool_use",
      json.nullable(data.disable_parallel_tool_use, json.bool),
    ),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_message_batch_decoder() {
  use results_url <- decode.field(
    "results_url",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use created_at <- decode.field("created_at", decode.string)
  use cancel_initiated_at <- decode.field(
    "cancel_initiated_at",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use archived_at <- decode.field(
    "archived_at",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use request_counts <- decode.field(
    "request_counts",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use ended_at <- decode.field(
    "ended_at",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  use id <- decode.field("id", decode.string)
  use expires_at <- decode.field("expires_at", decode.string)
  use processing_status <- decode.field("processing_status", decode.string)
  decode.success(BetaMessageBatch(
    results_url: results_url,
    created_at: created_at,
    cancel_initiated_at: cancel_initiated_at,
    archived_at: archived_at,
    request_counts: request_counts,
    ended_at: ended_at,
    type_: type_,
    id: id,
    expires_at: expires_at,
    processing_status: processing_status,
  ))
}

pub fn beta_message_batch_encode(data: BetaMessageBatch) {
  json.object([
    #("results_url", fn(_) { panic as "AnyOf inside field" }(data.results_url)),
    #("created_at", json.string(data.created_at)),
    #(
      "cancel_initiated_at",
      fn(_) { panic as "AnyOf inside field" }(data.cancel_initiated_at),
    ),
    #("archived_at", fn(_) { panic as "AnyOf inside field" }(data.archived_at)),
    #(
      "request_counts",
      fn(_) { panic as "AllOf inside field" }(data.request_counts),
    ),
    #("ended_at", fn(_) { panic as "AnyOf inside field" }(data.ended_at)),
    #("type", json.string(data.type_)),
    #("id", json.string(data.id)),
    #("expires_at", json.string(data.expires_at)),
    #("processing_status", json.string(data.processing_status)),
  ])
}

pub fn beta_response_char_location_citation_decoder() {
  use start_char_index <- decode.field("start_char_index", decode.int)
  use end_char_index <- decode.field("end_char_index", decode.int)
  use document_index <- decode.field("document_index", decode.int)
  use document_title <- decode.field(
    "document_title",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  use cited_text <- decode.field("cited_text", decode.string)
  decode.success(BetaResponseCharLocationCitation(
    start_char_index: start_char_index,
    end_char_index: end_char_index,
    document_index: document_index,
    document_title: document_title,
    type_: type_,
    cited_text: cited_text,
  ))
}

pub fn beta_response_char_location_citation_encode(
  data: BetaResponseCharLocationCitation,
) {
  json.object([
    #("start_char_index", json.int(data.start_char_index)),
    #("end_char_index", json.int(data.end_char_index)),
    #("document_index", json.int(data.document_index)),
    #(
      "document_title",
      fn(_) { panic as "AnyOf inside field" }(data.document_title),
    ),
    #("type", json.string(data.type_)),
    #("cited_text", json.string(data.cited_text)),
  ])
}

pub fn beta_request_counts_decoder() {
  use succeeded <- decode.field("succeeded", decode.int)
  use expired <- decode.field("expired", decode.int)
  use errored <- decode.field("errored", decode.int)
  use processing <- decode.field("processing", decode.int)
  use canceled <- decode.field("canceled", decode.int)
  decode.success(BetaRequestCounts(
    succeeded: succeeded,
    expired: expired,
    errored: errored,
    processing: processing,
    canceled: canceled,
  ))
}

pub fn beta_request_counts_encode(data: BetaRequestCounts) {
  json.object([
    #("succeeded", json.int(data.succeeded)),
    #("expired", json.int(data.expired)),
    #("errored", json.int(data.errored)),
    #("processing", json.int(data.processing)),
    #("canceled", json.int(data.canceled)),
  ])
}

pub fn beta_count_message_tokens_response_decoder() {
  use input_tokens <- decode.field("input_tokens", decode.int)
  decode.success(BetaCountMessageTokensResponse(input_tokens: input_tokens))
}

pub fn beta_count_message_tokens_response_encode(
  data: BetaCountMessageTokensResponse,
) {
  json.object([#("input_tokens", json.int(data.input_tokens))])
}

pub fn expired_result_decoder() {
  use type_ <- decode.field("type", decode.string)
  decode.success(ExpiredResult(type_: type_))
}

pub fn expired_result_encode(data: ExpiredResult) {
  json.object([#("type", json.string(data.type_))])
}

pub fn beta_bash_tool_2024one022_decoder() {
  use cache_control <- decode.optional_field(
    "cache_control",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use name <- decode.field("name", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaBashTool20241022(
    cache_control: cache_control,
    name: name,
    type_: type_,
  ))
}

pub fn beta_bash_tool_2024one022_encode(data: BetaBashTool20241022) {
  json.object([
    #(
      "cache_control",
      json.nullable(data.cache_control, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("name", json.string(data.name)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_input_json_content_block_delta_decoder() {
  use partial_json <- decode.field("partial_json", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaInputJsonContentBlockDelta(
    partial_json: partial_json,
    type_: type_,
  ))
}

pub fn beta_input_json_content_block_delta_encode(
  data: BetaInputJsonContentBlockDelta,
) {
  json.object([
    #("partial_json", json.string(data.partial_json)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_plain_text_source_decoder() {
  use data <- decode.field("data", decode.string)
  use media_type <- decode.field("media_type", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaPlainTextSource(
    data: data,
    media_type: media_type,
    type_: type_,
  ))
}

pub fn beta_plain_text_source_encode(data: BetaPlainTextSource) {
  json.object([
    #("data", json.string(data.data)),
    #("media_type", json.string(data.media_type)),
    #("type", json.string(data.type_)),
  ])
}

pub fn cache_control_ephemeral_decoder() {
  use type_ <- decode.field("type", decode.string)
  decode.success(CacheControlEphemeral(type_: type_))
}

pub fn cache_control_ephemeral_encode(data: CacheControlEphemeral) {
  json.object([#("type", json.string(data.type_))])
}

pub fn request_image_block_decoder() {
  use cache_control <- decode.optional_field(
    "cache_control",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use type_ <- decode.field("type", decode.string)
  use source <- decode.field(
    "source",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  decode.success(RequestImageBlock(
    cache_control: cache_control,
    type_: type_,
    source: source,
  ))
}

pub fn request_image_block_encode(data: RequestImageBlock) {
  json.object([
    #(
      "cache_control",
      json.nullable(data.cache_control, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("type", json.string(data.type_)),
    #("source", fn(_) { panic as "AllOf inside field" }(data.source)),
  ])
}

pub fn beta_request_text_block_decoder() {
  use cache_control <- decode.optional_field(
    "cache_control",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use citations <- decode.optional_field(
    "citations",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use text <- decode.field("text", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaRequestTextBlock(
    cache_control: cache_control,
    citations: citations,
    text: text,
    type_: type_,
  ))
}

pub fn beta_request_text_block_encode(data: BetaRequestTextBlock) {
  json.object([
    #(
      "cache_control",
      json.nullable(data.cache_control, fn(_) { panic as "AnyOf inside field" }),
    ),
    #(
      "citations",
      json.nullable(data.citations, fn(_) { panic as "AnyOf inside field" }),
    ),
    #("text", json.string(data.text)),
    #("type", json.string(data.type_)),
  ])
}

pub fn request_char_location_citation_decoder() {
  use start_char_index <- decode.field("start_char_index", decode.int)
  use end_char_index <- decode.field("end_char_index", decode.int)
  use document_index <- decode.field("document_index", decode.int)
  use document_title <- decode.field(
    "document_title",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  use cited_text <- decode.field("cited_text", decode.string)
  decode.success(RequestCharLocationCitation(
    start_char_index: start_char_index,
    end_char_index: end_char_index,
    document_index: document_index,
    document_title: document_title,
    type_: type_,
    cited_text: cited_text,
  ))
}

pub fn request_char_location_citation_encode(data: RequestCharLocationCitation) {
  json.object([
    #("start_char_index", json.int(data.start_char_index)),
    #("end_char_index", json.int(data.end_char_index)),
    #("document_index", json.int(data.document_index)),
    #(
      "document_title",
      fn(_) { panic as "AnyOf inside field" }(data.document_title),
    ),
    #("type", json.string(data.type_)),
    #("cited_text", json.string(data.cited_text)),
  ])
}

pub fn beta_message_delta_decoder() {
  use stop_reason <- decode.field(
    "stop_reason",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use stop_sequence <- decode.field(
    "stop_sequence",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  decode.success(BetaMessageDelta(
    stop_reason: stop_reason,
    stop_sequence: stop_sequence,
  ))
}

pub fn beta_message_delta_encode(data: BetaMessageDelta) {
  json.object([
    #("stop_reason", fn(_) { panic as "AnyOf inside field" }(data.stop_reason)),
    #(
      "stop_sequence",
      fn(_) { panic as "AnyOf inside field" }(data.stop_sequence),
    ),
  ])
}

pub fn beta_message_stop_event_decoder() {
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaMessageStopEvent(type_: type_))
}

pub fn beta_message_stop_event_encode(data: BetaMessageStopEvent) {
  json.object([#("type", json.string(data.type_))])
}

pub fn usage_decoder() {
  use input_tokens <- decode.field("input_tokens", decode.int)
  use cache_creation_input_tokens <- decode.field(
    "cache_creation_input_tokens",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use output_tokens <- decode.field("output_tokens", decode.int)
  use cache_read_input_tokens <- decode.field(
    "cache_read_input_tokens",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  decode.success(Usage(
    input_tokens: input_tokens,
    cache_creation_input_tokens: cache_creation_input_tokens,
    output_tokens: output_tokens,
    cache_read_input_tokens: cache_read_input_tokens,
  ))
}

pub fn usage_encode(data: Usage) {
  json.object([
    #("input_tokens", json.int(data.input_tokens)),
    #(
      "cache_creation_input_tokens",
      fn(_) { panic as "AnyOf inside field" }(data.cache_creation_input_tokens),
    ),
    #("output_tokens", json.int(data.output_tokens)),
    #(
      "cache_read_input_tokens",
      fn(_) { panic as "AnyOf inside field" }(data.cache_read_input_tokens),
    ),
  ])
}

pub fn beta_tool_choice_tool_decoder() {
  use disable_parallel_tool_use <- decode.optional_field(
    "disable_parallel_tool_use",
    None,
    decode.optional(decode.bool),
  )
  use name <- decode.field("name", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaToolChoiceTool(
    disable_parallel_tool_use: disable_parallel_tool_use,
    name: name,
    type_: type_,
  ))
}

pub fn beta_tool_choice_tool_encode(data: BetaToolChoiceTool) {
  json.object([
    #(
      "disable_parallel_tool_use",
      json.nullable(data.disable_parallel_tool_use, json.bool),
    ),
    #("name", json.string(data.name)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_create_message_params_decoder() {
  use stream <- decode.optional_field(
    "stream",
    None,
    decode.optional(decode.bool),
  )
  use top_k <- decode.optional_field("top_k", None, decode.optional(decode.int))
  use top_p <- decode.optional_field(
    "top_p",
    None,
    decode.optional(decode.float),
  )
  use tool_choice <- decode.optional_field(
    "tool_choice",
    None,
    decode.optional(beta_tool_choice_decoder()),
  )
  use model <- decode.field("model", model_decoder())
  use messages <- decode.field(
    "messages",
    decode.list(beta_input_message_decoder()),
  )
  use system <- decode.optional_field(
    "system",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use metadata <- decode.optional_field(
    "metadata",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use temperature <- decode.optional_field(
    "temperature",
    None,
    decode.optional(decode.float),
  )
  use max_tokens <- decode.field("max_tokens", decode.int)
  use stop_sequences <- decode.optional_field(
    "stop_sequences",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use tools <- decode.optional_field(
    "tools",
    None,
    decode.optional(
      decode.list(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
    ),
  )
  decode.success(BetaCreateMessageParams(
    stream: stream,
    top_k: top_k,
    top_p: top_p,
    tool_choice: tool_choice,
    model: model,
    messages: messages,
    system: system,
    metadata: metadata,
    temperature: temperature,
    max_tokens: max_tokens,
    stop_sequences: stop_sequences,
    tools: tools,
  ))
}

pub fn beta_create_message_params_encode(data: BetaCreateMessageParams) {
  json.object([
    #("stream", json.nullable(data.stream, json.bool)),
    #("top_k", json.nullable(data.top_k, json.int)),
    #("top_p", json.nullable(data.top_p, json.float)),
    #("tool_choice", json.nullable(data.tool_choice, beta_tool_choice_encode)),
    #("model", model_encode(data.model)),
    #("messages", json.array(_, beta_input_message_encode)(data.messages)),
    #(
      "system",
      json.nullable(data.system, fn(_) { panic as "AnyOf inside field" }),
    ),
    #(
      "metadata",
      json.nullable(data.metadata, fn(_) { panic as "AllOf inside field" }),
    ),
    #("temperature", json.nullable(data.temperature, json.float)),
    #("max_tokens", json.int(data.max_tokens)),
    #(
      "stop_sequences",
      json.nullable(data.stop_sequences, json.array(_, json.string)),
    ),
    #(
      "tools",
      json.nullable(
        data.tools,
        json.array(_, fn(_) { panic as "Oneoas.OneOf in array" }),
      ),
    ),
  ])
}

pub fn beta_response_content_block_location_citation_decoder() {
  use start_block_index <- decode.field("start_block_index", decode.int)
  use document_index <- decode.field("document_index", decode.int)
  use document_title <- decode.field(
    "document_title",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  use end_block_index <- decode.field("end_block_index", decode.int)
  use cited_text <- decode.field("cited_text", decode.string)
  decode.success(BetaResponseContentBlockLocationCitation(
    start_block_index: start_block_index,
    document_index: document_index,
    document_title: document_title,
    type_: type_,
    end_block_index: end_block_index,
    cited_text: cited_text,
  ))
}

pub fn beta_response_content_block_location_citation_encode(
  data: BetaResponseContentBlockLocationCitation,
) {
  json.object([
    #("start_block_index", json.int(data.start_block_index)),
    #("document_index", json.int(data.document_index)),
    #(
      "document_title",
      fn(_) { panic as "AnyOf inside field" }(data.document_title),
    ),
    #("type", json.string(data.type_)),
    #("end_block_index", json.int(data.end_block_index)),
    #("cited_text", json.string(data.cited_text)),
  ])
}

pub fn beta_authentication_error_decoder() {
  use message <- decode.field("message", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaAuthenticationError(message: message, type_: type_))
}

pub fn beta_authentication_error_encode(data: BetaAuthenticationError) {
  json.object([
    #("message", json.string(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_invalid_request_error_decoder() {
  use message <- decode.field("message", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(BetaInvalidRequestError(message: message, type_: type_))
}

pub fn beta_invalid_request_error_encode(data: BetaInvalidRequestError) {
  json.object([
    #("message", json.string(data.message)),
    #("type", json.string(data.type_)),
  ])
}

pub fn beta_message_delta_usage_decoder() {
  use output_tokens <- decode.field("output_tokens", decode.int)
  decode.success(BetaMessageDeltaUsage(output_tokens: output_tokens))
}

pub fn beta_message_delta_usage_encode(data: BetaMessageDeltaUsage) {
  json.object([#("output_tokens", json.int(data.output_tokens))])
}
