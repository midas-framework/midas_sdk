import at_protocol/schema
import at_protocol/utils
import gleam/bool
import gleam/dict
import gleam/dynamic/decode
import gleam/float
import gleam/http
import gleam/http/response
import gleam/int
import gleam/json
import gleam/option.{type Option, None}
import gleam/result

pub type ChatBskyConvoSendMessageRequest {
  ChatBskyConvoSendMessageRequest(
    message: schema.ChatBskyConvoDefsMessageInput,
    convo_id: String,
  )
}

pub type ComAtprotoServerUpdateEmailRequest {
  ComAtprotoServerUpdateEmailRequest(
    email_auth_factor: Option(Bool),
    token_: Option(String),
    email: String,
  )
}

pub type ComAtprotoIdentityRefreshIdentityRequest {
  ComAtprotoIdentityRefreshIdentityRequest(identifier: String)
}

pub type ChatBskyConvoLeaveConvoRequest {
  ChatBskyConvoLeaveConvoRequest(convo_id: String)
}

pub type ToolsOzoneSettingRemoveOptionsRequest {
  ToolsOzoneSettingRemoveOptionsRequest(keys: List(String), scope: String)
}

pub type ToolsOzoneTeamAddMemberRequest {
  ToolsOzoneTeamAddMemberRequest(role: String, did: String)
}

pub type ChatBskyConvoMuteConvoRequest {
  ChatBskyConvoMuteConvoRequest(convo_id: String)
}

pub type ComAtprotoSyncNotifyOfUpdateRequest {
  ComAtprotoSyncNotifyOfUpdateRequest(hostname: String)
}

pub type ComAtprotoServerCreateInviteCodeRequest {
  ComAtprotoServerCreateInviteCodeRequest(
    for_account: Option(String),
    use_count: Int,
  )
}

pub type ComAtprotoServerReserveSigningKeyRequest {
  ComAtprotoServerReserveSigningKeyRequest(did: Option(String))
}

pub type ComAtprotoServerRevokeAppPasswordRequest {
  ComAtprotoServerRevokeAppPasswordRequest(name: String)
}

pub type ComAtprotoAdminUpdateAccountSigningKeyRequest {
  ComAtprotoAdminUpdateAccountSigningKeyRequest(
    signing_key: String,
    did: String,
  )
}

pub type ComAtprotoServerDeactivateAccountRequest {
  ComAtprotoServerDeactivateAccountRequest(delete_after: Option(String))
}

pub type ToolsOzoneCommunicationCreateTemplateRequest {
  ToolsOzoneCommunicationCreateTemplateRequest(
    content_markdown: String,
    name: String,
    subject: String,
    lang: Option(String),
    created_by: Option(String),
  )
}

pub type ComAtprotoAdminUpdateAccountPasswordRequest {
  ComAtprotoAdminUpdateAccountPasswordRequest(password: String, did: String)
}

pub type ComAtprotoIdentityUpdateHandleRequest {
  ComAtprotoIdentityUpdateHandleRequest(handle: String)
}

pub type ComAtprotoServerCreateSessionRequest {
  ComAtprotoServerCreateSessionRequest(
    allow_takendown: Option(Bool),
    auth_factor_token: Option(String),
    identifier: String,
    password: String,
  )
}

pub type AppBskyFeedSendInteractionsRequest {
  AppBskyFeedSendInteractionsRequest(
    interactions: List(schema.AppBskyFeedDefsInteraction),
  )
}

pub type ChatBskyConvoUnmuteConvoRequest {
  ChatBskyConvoUnmuteConvoRequest(convo_id: String)
}

pub type ComAtprotoAdminDeleteAccountRequest {
  ComAtprotoAdminDeleteAccountRequest(did: String)
}

pub type ChatBskyConvoAddReactionRequest {
  ChatBskyConvoAddReactionRequest(
    message_id: String,
    value: String,
    convo_id: String,
  )
}

pub type AppBskyGraphUnmuteThreadRequest {
  AppBskyGraphUnmuteThreadRequest(root: String)
}

pub type AppBskyGraphMuteActorListRequest {
  AppBskyGraphMuteActorListRequest(list: String)
}

pub type ChatBskyConvoRemoveReactionRequest {
  ChatBskyConvoRemoveReactionRequest(
    message_id: String,
    value: String,
    convo_id: String,
  )
}

pub type ComAtprotoAdminDisableAccountInvitesRequest {
  ComAtprotoAdminDisableAccountInvitesRequest(
    account: String,
    note: Option(String),
  )
}

pub type AppBskyGraphMuteActorRequest {
  AppBskyGraphMuteActorRequest(actor: String)
}

pub type ComAtprotoAdminDisableInviteCodesRequest {
  ComAtprotoAdminDisableInviteCodesRequest(
    codes: Option(List(String)),
    accounts: Option(List(String)),
  )
}

pub type ComAtprotoServerConfirmEmailRequest {
  ComAtprotoServerConfirmEmailRequest(token_: String, email: String)
}

pub type ComAtprotoServerCreateAppPasswordRequest {
  ComAtprotoServerCreateAppPasswordRequest(
    name: String,
    privileged: Option(Bool),
  )
}

pub type ChatBskyConvoUpdateAllReadRequest {
  ChatBskyConvoUpdateAllReadRequest(status: Option(String))
}

pub type ComAtprotoServerCreateInviteCodesRequest {
  ComAtprotoServerCreateInviteCodesRequest(
    code_count: Int,
    use_count: Int,
    for_accounts: Option(List(String)),
  )
}

pub type ComAtprotoIdentitySubmitPlcOperationRequest {
  ComAtprotoIdentitySubmitPlcOperationRequest(operation: json.Json)
}

pub type ComAtprotoAdminUpdateAccountEmailRequest {
  ComAtprotoAdminUpdateAccountEmailRequest(account: String, email: String)
}

pub type ComAtprotoServerDeleteAccountRequest {
  ComAtprotoServerDeleteAccountRequest(
    token_: String,
    password: String,
    did: String,
  )
}

pub type ComAtprotoRepoCreateRecordRequest {
  ComAtprotoRepoCreateRecordRequest(
    swap_commit: Option(String),
    rkey: Option(String),
    record: json.Json,
    repo: String,
    validate: Option(Bool),
    collection: String,
  )
}

pub type AppBskyActorPutPreferencesRequest {
  AppBskyActorPutPreferencesRequest(
    preferences: schema.AppBskyActorDefsPreferences,
  )
}

pub type AppBskyNotificationRegisterPushRequest {
  AppBskyNotificationRegisterPushRequest(
    service_did: String,
    platform: String,
    token_: String,
    app_id: String,
  )
}

pub type ToolsOzoneSetDeleteValuesRequest {
  ToolsOzoneSetDeleteValuesRequest(values: List(String), name: String)
}

pub type ComAtprotoSyncRequestCrawlRequest {
  ComAtprotoSyncRequestCrawlRequest(hostname: String)
}

pub type AppBskyGraphMuteThreadRequest {
  AppBskyGraphMuteThreadRequest(root: String)
}

pub type AppBskyGraphUnmuteActorListRequest {
  AppBskyGraphUnmuteActorListRequest(list: String)
}

pub type ToolsOzoneSetDeleteSetRequest {
  ToolsOzoneSetDeleteSetRequest(name: String)
}

pub type ToolsOzoneCommunicationUpdateTemplateRequest {
  ToolsOzoneCommunicationUpdateTemplateRequest(
    content_markdown: Option(String),
    name: Option(String),
    subject: Option(String),
    lang: Option(String),
    updated_by: Option(String),
    id: String,
    disabled: Option(Bool),
  )
}

pub type ChatBskyConvoAcceptConvoRequest {
  ChatBskyConvoAcceptConvoRequest(convo_id: String)
}

pub type ComAtprotoAdminUpdateAccountHandleRequest {
  ComAtprotoAdminUpdateAccountHandleRequest(handle: String, did: String)
}

pub type AppBskyGraphUnmuteActorRequest {
  AppBskyGraphUnmuteActorRequest(actor: String)
}

pub type ChatBskyModerationUpdateActorAccessRequest {
  ChatBskyModerationUpdateActorAccessRequest(
    allow_access: Bool,
    ref: Option(String),
    actor: String,
  )
}

pub type ComAtprotoIdentitySignPlcOperationRequest {
  ComAtprotoIdentitySignPlcOperationRequest(
    also_known_as: Option(List(String)),
    rotation_keys: Option(List(String)),
    verification_methods: Option(json.Json),
    token_: Option(String),
    services: Option(json.Json),
  )
}

pub type ToolsOzoneVerificationGrantVerificationsRequest {
  ToolsOzoneVerificationGrantVerificationsRequest(
    verifications: List(
      schema.ToolsOzoneVerificationGrantVerificationsVerificationInput,
    ),
  )
}

pub type ToolsOzoneCommunicationDeleteTemplateRequest {
  ToolsOzoneCommunicationDeleteTemplateRequest(id: String)
}

pub type ComAtprotoServerRequestPasswordResetRequest {
  ComAtprotoServerRequestPasswordResetRequest(email: String)
}

pub type AppBskyNotificationUpdateSeenRequest {
  AppBskyNotificationUpdateSeenRequest(seen_at: String)
}

pub type ComAtprotoServerResetPasswordRequest {
  ComAtprotoServerResetPasswordRequest(token_: String, password: String)
}

pub type ChatBskyConvoDeleteMessageForSelfRequest {
  ChatBskyConvoDeleteMessageForSelfRequest(message_id: String, convo_id: String)
}

pub type ToolsOzoneVerificationRevokeVerificationsRequest {
  ToolsOzoneVerificationRevokeVerificationsRequest(
    uris: List(String),
    revoke_reason: Option(String),
  )
}

pub type ComAtprotoAdminEnableAccountInvitesRequest {
  ComAtprotoAdminEnableAccountInvitesRequest(
    account: String,
    note: Option(String),
  )
}

pub type ToolsOzoneModerationEmitEventRequest {
  ToolsOzoneModerationEmitEventRequest(
    subject: json.Json,
    event: json.Json,
    subject_blob_cids: Option(List(String)),
    created_by: String,
  )
}

pub type ChatBskyConvoSendMessageBatchRequest {
  ChatBskyConvoSendMessageBatchRequest(
    items: List(schema.ChatBskyConvoSendMessageBatchBatchItem),
  )
}

pub type ToolsOzoneSettingUpsertOptionRequest {
  ToolsOzoneSettingUpsertOptionRequest(
    manager_role: Option(String),
    value: json.Json,
    scope: String,
    description: Option(String),
    key: String,
  )
}

pub type ToolsOzoneTeamUpdateMemberRequest {
  ToolsOzoneTeamUpdateMemberRequest(
    role: Option(String),
    disabled: Option(Bool),
    did: String,
  )
}

pub type ComAtprotoAdminSendEmailRequest {
  ComAtprotoAdminSendEmailRequest(
    recipient_did: String,
    sender_did: String,
    subject: Option(String),
    content: String,
    comment: Option(String),
  )
}

pub type ComAtprotoRepoPutRecordRequest {
  ComAtprotoRepoPutRecordRequest(
    swap_record: Option(String),
    swap_commit: Option(String),
    rkey: String,
    record: json.Json,
    repo: String,
    validate: Option(Bool),
    collection: String,
  )
}

pub type AppBskyNotificationPutPreferencesRequest {
  AppBskyNotificationPutPreferencesRequest(priority: Bool)
}

pub type ToolsOzoneTeamDeleteMemberRequest {
  ToolsOzoneTeamDeleteMemberRequest(did: String)
}

pub type ComAtprotoAdminUpdateSubjectStatusRequest {
  ComAtprotoAdminUpdateSubjectStatusRequest(
    takedown: Option(schema.ComAtprotoAdminDefsStatusAttr),
    subject: json.Json,
    deactivated: Option(schema.ComAtprotoAdminDefsStatusAttr),
  )
}

pub type ToolsOzoneSetAddValuesRequest {
  ToolsOzoneSetAddValuesRequest(values: List(String), name: String)
}

pub type ChatBskyConvoUpdateReadRequest {
  ChatBskyConvoUpdateReadRequest(message_id: Option(String), convo_id: String)
}

pub type ComAtprotoRepoDeleteRecordRequest {
  ComAtprotoRepoDeleteRecordRequest(
    swap_record: Option(String),
    swap_commit: Option(String),
    rkey: String,
    repo: String,
    collection: String,
  )
}

pub type ComAtprotoModerationCreateReportRequest {
  ComAtprotoModerationCreateReportRequest(
    reason: Option(String),
    subject: json.Json,
    reason_type: schema.ComAtprotoModerationDefsReasonType,
  )
}

pub type ComAtprotoRepoApplyWritesRequest {
  ComAtprotoRepoApplyWritesRequest(
    swap_commit: Option(String),
    repo: String,
    writes: List(json.Json),
    validate: Option(Bool),
  )
}

pub type ComAtprotoServerCreateAccountRequest {
  ComAtprotoServerCreateAccountRequest(
    plc_op: Option(json.Json),
    handle: String,
    verification_code: Option(String),
    recovery_key: Option(String),
    verification_phone: Option(String),
    invite_code: Option(String),
    password: Option(String),
    email: Option(String),
    did: Option(String),
  )
}

pub type ComAtprotoServerCreateAccountResponse {
  ComAtprotoServerCreateAccountResponse(
    access_jwt: String,
    handle: String,
    refresh_jwt: String,
    did_doc: Option(json.Json),
    did: String,
  )
}

pub type ChatBskyConvoGetConvoAvailabilityResponse {
  ChatBskyConvoGetConvoAvailabilityResponse(
    can_chat: Bool,
    convo: Option(schema.ChatBskyConvoDefsConvoView),
  )
}

pub type ComAtprotoAdminGetInviteCodesResponse {
  ComAtprotoAdminGetInviteCodesResponse(
    codes: List(schema.ComAtprotoServerDefsInviteCode),
    cursor: Option(String),
  )
}

pub type ComAtprotoRepoApplyWritesResponse {
  ComAtprotoRepoApplyWritesResponse(
    results: Option(List(json.Json)),
    commit: Option(schema.ComAtprotoRepoDefsCommitMeta),
  )
}

pub type AppBskyFeedGetPostThreadResponse {
  AppBskyFeedGetPostThreadResponse(
    thread: json.Json,
    threadgate: Option(schema.AppBskyFeedDefsThreadgateView),
  )
}

pub type ComAtprotoModerationCreateReportResponse {
  ComAtprotoModerationCreateReportResponse(
    reason: Option(String),
    reported_by: String,
    subject: json.Json,
    id: Int,
    created_at: String,
    reason_type: schema.ComAtprotoModerationDefsReasonType,
  )
}

pub type ComAtprotoRepoDeleteRecordResponse {
  ComAtprotoRepoDeleteRecordResponse(
    commit: Option(schema.ComAtprotoRepoDefsCommitMeta),
  )
}

pub type AppBskyFeedGetPostsResponse {
  AppBskyFeedGetPostsResponse(posts: List(schema.AppBskyFeedDefsPostView))
}

pub type ChatBskyConvoUpdateReadResponse {
  ChatBskyConvoUpdateReadResponse(convo: schema.ChatBskyConvoDefsConvoView)
}

pub type ComAtprotoSyncListBlobsResponse {
  ComAtprotoSyncListBlobsResponse(cids: List(String), cursor: Option(String))
}

pub type AppBskyNotificationGetUnreadCountResponse {
  AppBskyNotificationGetUnreadCountResponse(count: Int)
}

pub type ComAtprotoSyncListReposByCollectionResponse {
  ComAtprotoSyncListReposByCollectionResponse(
    repos: List(schema.ComAtprotoSyncListReposByCollectionRepo),
    cursor: Option(String),
  )
}

pub type AppBskyFeedGetAuthorFeedResponse {
  AppBskyFeedGetAuthorFeedResponse(
    cursor: Option(String),
    feed: List(schema.AppBskyFeedDefsFeedViewPost),
  )
}

pub type AppBskyFeedGetRepostedByResponse {
  AppBskyFeedGetRepostedByResponse(
    reposted_by: List(schema.AppBskyActorDefsProfileView),
    uri: String,
    cursor: Option(String),
    cid: Option(String),
  )
}

pub type ComAtprotoAdminUpdateSubjectStatusResponse {
  ComAtprotoAdminUpdateSubjectStatusResponse(
    takedown: Option(schema.ComAtprotoAdminDefsStatusAttr),
    subject: json.Json,
  )
}

pub type ToolsOzoneSignatureSearchAccountsResponse {
  ToolsOzoneSignatureSearchAccountsResponse(
    accounts: List(schema.ComAtprotoAdminDefsAccountView),
    cursor: Option(String),
  )
}

pub type ChatBskyActorDeleteAccountResponse {
  ChatBskyActorDeleteAccountResponse(
    unknown: Option(dict.Dict(String, json.Json)),
  )
}

pub type ComAtprotoIdentityResolveHandleResponse {
  ComAtprotoIdentityResolveHandleResponse(did: String)
}

pub type ComAtprotoRepoPutRecordResponse {
  ComAtprotoRepoPutRecordResponse(
    validation_status: Option(String),
    uri: String,
    commit: Option(schema.ComAtprotoRepoDefsCommitMeta),
    cid: String,
  )
}

pub type AppBskyFeedGetActorLikesResponse {
  AppBskyFeedGetActorLikesResponse(
    cursor: Option(String),
    feed: List(schema.AppBskyFeedDefsFeedViewPost),
  )
}

pub type ComAtprotoAdminSendEmailResponse {
  ComAtprotoAdminSendEmailResponse(sent: Bool)
}

pub type ToolsOzoneModerationGetRecordsResponse {
  ToolsOzoneModerationGetRecordsResponse(records: List(json.Json))
}

pub type AppBskyGraphGetFollowsResponse {
  AppBskyGraphGetFollowsResponse(
    follows: List(schema.AppBskyActorDefsProfileView),
    subject: schema.AppBskyActorDefsProfileView,
    cursor: Option(String),
  )
}

pub type AppBskyVideoGetJobStatusResponse {
  AppBskyVideoGetJobStatusResponse(job_status: schema.AppBskyVideoDefsJobStatus)
}

pub type ToolsOzoneSettingUpsertOptionResponse {
  ToolsOzoneSettingUpsertOptionResponse(
    option: schema.ToolsOzoneSettingDefsOption,
  )
}

pub type ToolsOzoneModerationGetReposResponse {
  ToolsOzoneModerationGetReposResponse(repos: List(json.Json))
}

pub type ComAtprotoSyncGetLatestCommitResponse {
  ComAtprotoSyncGetLatestCommitResponse(rev: String, cid: String)
}

pub type ChatBskyConvoSendMessageBatchResponse {
  ChatBskyConvoSendMessageBatchResponse(
    items: List(schema.ChatBskyConvoDefsMessageView),
  )
}

pub type ToolsOzoneSignatureFindCorrelationResponse {
  ToolsOzoneSignatureFindCorrelationResponse(
    details: List(schema.ToolsOzoneSignatureDefsSigDetail),
  )
}

pub type AppBskyActorSearchActorsTypeaheadResponse {
  AppBskyActorSearchActorsTypeaheadResponse(
    actors: List(schema.AppBskyActorDefsProfileViewBasic),
  )
}

pub type AppBskyGraphGetKnownFollowersResponse {
  AppBskyGraphGetKnownFollowersResponse(
    subject: schema.AppBskyActorDefsProfileView,
    followers: List(schema.AppBskyActorDefsProfileView),
    cursor: Option(String),
  )
}

pub type ToolsOzoneModerationQueryStatusesResponse {
  ToolsOzoneModerationQueryStatusesResponse(
    subject_statuses: List(schema.ToolsOzoneModerationDefsSubjectStatusView),
    cursor: Option(String),
  )
}

pub type ComAtprotoServerGetServiceAuthResponse {
  ComAtprotoServerGetServiceAuthResponse(token_: String)
}

pub type AppBskyGraphGetActorStarterPacksResponse {
  AppBskyGraphGetActorStarterPacksResponse(
    starter_packs: List(schema.AppBskyGraphDefsStarterPackViewBasic),
    cursor: Option(String),
  )
}

pub type ComAtprotoIdentityGetRecommendedDidCredentialsResponse {
  ComAtprotoIdentityGetRecommendedDidCredentialsResponse(
    also_known_as: Option(List(String)),
    rotation_keys: Option(List(String)),
    verification_methods: Option(json.Json),
    services: Option(json.Json),
  )
}

pub type ToolsOzoneVerificationRevokeVerificationsResponse {
  ToolsOzoneVerificationRevokeVerificationsResponse(
    failed_revocations: List(
      schema.ToolsOzoneVerificationRevokeVerificationsRevokeError,
    ),
    revoked_verifications: List(String),
  )
}

pub type AppBskyGraphGetSuggestedFollowsByActorResponse {
  AppBskyGraphGetSuggestedFollowsByActorResponse(
    rec_id: Option(Int),
    is_fallback: Option(Bool),
    suggestions: List(schema.AppBskyActorDefsProfileView),
  )
}

pub type AppBskyActorGetProfilesResponse {
  AppBskyActorGetProfilesResponse(
    profiles: List(schema.AppBskyActorDefsProfileViewDetailed),
  )
}

pub type AppBskyVideoUploadVideoResponse {
  AppBskyVideoUploadVideoResponse(job_status: schema.AppBskyVideoDefsJobStatus)
}

pub type AppBskyLabelerGetServicesResponse {
  AppBskyLabelerGetServicesResponse(views: List(json.Json))
}

pub type ToolsOzoneModerationGetReporterStatsResponse {
  ToolsOzoneModerationGetReporterStatsResponse(
    stats: List(schema.ToolsOzoneModerationDefsReporterStats),
  )
}

pub type ComAtprotoAdminGetAccountInfosResponse {
  ComAtprotoAdminGetAccountInfosResponse(
    infos: List(schema.ComAtprotoAdminDefsAccountView),
  )
}

pub type AppBskyNotificationListNotificationsResponse {
  AppBskyNotificationListNotificationsResponse(
    priority: Option(Bool),
    notifications: List(schema.AppBskyNotificationListNotificationsNotification),
    seen_at: Option(String),
    cursor: Option(String),
  )
}

pub type ToolsOzoneVerificationGrantVerificationsResponse {
  ToolsOzoneVerificationGrantVerificationsResponse(
    verifications: List(schema.ToolsOzoneVerificationDefsVerificationView),
    failed_verifications: List(
      schema.ToolsOzoneVerificationGrantVerificationsGrantError,
    ),
  )
}

pub type AppBskyFeedGetTimelineResponse {
  AppBskyFeedGetTimelineResponse(
    cursor: Option(String),
    feed: List(schema.AppBskyFeedDefsFeedViewPost),
  )
}

pub type ComAtprotoSyncGetHostStatusResponse {
  ComAtprotoSyncGetHostStatusResponse(
    account_count: Option(Int),
    status: Option(schema.ComAtprotoSyncDefsHostStatus),
    hostname: String,
    seq: Option(Int),
  )
}

pub type ChatBskyConvoListConvosResponse {
  ChatBskyConvoListConvosResponse(
    cursor: Option(String),
    convos: List(schema.ChatBskyConvoDefsConvoView),
  )
}

pub type AppBskyGraphGetListMutesResponse {
  AppBskyGraphGetListMutesResponse(
    lists: List(schema.AppBskyGraphDefsListView),
    cursor: Option(String),
  )
}

pub type AppBskyFeedGetActorFeedsResponse {
  AppBskyFeedGetActorFeedsResponse(
    feeds: List(schema.AppBskyFeedDefsGeneratorView),
    cursor: Option(String),
  )
}

pub type ComAtprotoIdentitySignPlcOperationResponse {
  ComAtprotoIdentitySignPlcOperationResponse(operation: json.Json)
}

pub type ComAtprotoServerGetAccountInviteCodesResponse {
  ComAtprotoServerGetAccountInviteCodesResponse(
    codes: List(schema.ComAtprotoServerDefsInviteCode),
  )
}

pub type ChatBskyConvoGetConvoForMembersResponse {
  ChatBskyConvoGetConvoForMembersResponse(
    convo: schema.ChatBskyConvoDefsConvoView,
  )
}

pub type AppBskyGraphGetRelationshipsResponse {
  AppBskyGraphGetRelationshipsResponse(
    actor: Option(String),
    relationships: List(json.Json),
  )
}

pub type ChatBskyConvoAcceptConvoResponse {
  ChatBskyConvoAcceptConvoResponse(rev: Option(String))
}

pub type ComAtprotoLabelQueryLabelsResponse {
  ComAtprotoLabelQueryLabelsResponse(
    cursor: Option(String),
    labels: List(schema.ComAtprotoLabelDefsLabel),
  )
}

pub type ToolsOzoneSetQuerySetsResponse {
  ToolsOzoneSetQuerySetsResponse(
    sets: List(schema.ToolsOzoneSetDefsSetView),
    cursor: Option(String),
  )
}

pub type ToolsOzoneSetGetValuesResponse {
  ToolsOzoneSetGetValuesResponse(
    set: schema.ToolsOzoneSetDefsSetView,
    values: List(String),
    cursor: Option(String),
  )
}

pub type AppBskyGraphGetMutesResponse {
  AppBskyGraphGetMutesResponse(
    cursor: Option(String),
    mutes: List(schema.AppBskyActorDefsProfileView),
  )
}

pub type ComAtprotoSyncListHostsResponse {
  ComAtprotoSyncListHostsResponse(
    hosts: List(schema.ComAtprotoSyncListHostsHost),
    cursor: Option(String),
  )
}

pub type AppBskyFeedGetFeedGeneratorsResponse {
  AppBskyFeedGetFeedGeneratorsResponse(
    feeds: List(schema.AppBskyFeedDefsGeneratorView),
  )
}

pub type AppBskyFeedGetFeedResponse {
  AppBskyFeedGetFeedResponse(
    cursor: Option(String),
    feed: List(schema.AppBskyFeedDefsFeedViewPost),
  )
}

pub type ComAtprotoServerGetSessionResponse {
  ComAtprotoServerGetSessionResponse(
    email_confirmed: Option(Bool),
    active: Option(Bool),
    handle: String,
    status: Option(String),
    email_auth_factor: Option(Bool),
    did_doc: Option(json.Json),
    email: Option(String),
    did: String,
  )
}

pub type ToolsOzoneSetDeleteSetResponse {
  ToolsOzoneSetDeleteSetResponse(unknown: Option(dict.Dict(String, json.Json)))
}

pub type AppBskyGraphGetStarterPacksResponse {
  AppBskyGraphGetStarterPacksResponse(
    starter_packs: List(schema.AppBskyGraphDefsStarterPackViewBasic),
  )
}

pub type ToolsOzoneModerationQueryEventsResponse {
  ToolsOzoneModerationQueryEventsResponse(
    cursor: Option(String),
    events: List(schema.ToolsOzoneModerationDefsModEventView),
  )
}

pub type ComAtprotoRepoListMissingBlobsResponse {
  ComAtprotoRepoListMissingBlobsResponse(
    blobs: List(schema.ComAtprotoRepoListMissingBlobsRecordBlob),
    cursor: Option(String),
  )
}

pub type AppBskyFeedGetListFeedResponse {
  AppBskyFeedGetListFeedResponse(
    cursor: Option(String),
    feed: List(schema.AppBskyFeedDefsFeedViewPost),
  )
}

pub type ComAtprotoRepoCreateRecordResponse {
  ComAtprotoRepoCreateRecordResponse(
    validation_status: Option(String),
    uri: String,
    commit: Option(schema.ComAtprotoRepoDefsCommitMeta),
    cid: String,
  )
}

pub type ToolsOzoneHostingGetAccountHistoryResponse {
  ToolsOzoneHostingGetAccountHistoryResponse(
    cursor: Option(String),
    events: List(schema.ToolsOzoneHostingGetAccountHistoryEvent),
  )
}

pub type ComAtprotoServerCreateInviteCodesResponse {
  ComAtprotoServerCreateInviteCodesResponse(
    codes: List(schema.ComAtprotoServerCreateInviteCodesAccountCodes),
  )
}

pub type ChatBskyConvoUpdateAllReadResponse {
  ChatBskyConvoUpdateAllReadResponse(updated_count: Int)
}

pub type AppBskyActorSearchActorsResponse {
  AppBskyActorSearchActorsResponse(
    cursor: Option(String),
    actors: List(schema.AppBskyActorDefsProfileView),
  )
}

pub type ToolsOzoneModerationGetSubjectsResponse {
  ToolsOzoneModerationGetSubjectsResponse(
    subjects: List(schema.ToolsOzoneModerationDefsSubjectView),
  )
}

pub type AppBskyGraphGetListsResponse {
  AppBskyGraphGetListsResponse(
    lists: List(schema.AppBskyGraphDefsListView),
    cursor: Option(String),
  )
}

pub type AppBskyGraphGetFollowersResponse {
  AppBskyGraphGetFollowersResponse(
    subject: schema.AppBskyActorDefsProfileView,
    followers: List(schema.AppBskyActorDefsProfileView),
    cursor: Option(String),
  )
}

pub type ComAtprotoServerRefreshSessionResponse {
  ComAtprotoServerRefreshSessionResponse(
    access_jwt: String,
    active: Option(Bool),
    handle: String,
    refresh_jwt: String,
    status: Option(String),
    did_doc: Option(json.Json),
    did: String,
  )
}

pub type AppBskyGraphGetBlocksResponse {
  AppBskyGraphGetBlocksResponse(
    blocks: List(schema.AppBskyActorDefsProfileView),
    cursor: Option(String),
  )
}

pub type AppBskyVideoGetUploadLimitsResponse {
  AppBskyVideoGetUploadLimitsResponse(
    message: Option(String),
    remaining_daily_bytes: Option(Int),
    error: Option(String),
    can_upload: Bool,
    remaining_daily_videos: Option(Int),
  )
}

pub type ChatBskyConvoGetLogResponse {
  ChatBskyConvoGetLogResponse(logs: List(json.Json), cursor: Option(String))
}

pub type AppBskyFeedGetQuotesResponse {
  AppBskyFeedGetQuotesResponse(
    uri: String,
    posts: List(schema.AppBskyFeedDefsPostView),
    cursor: Option(String),
    cid: Option(String),
  )
}

pub type ChatBskyConvoRemoveReactionResponse {
  ChatBskyConvoRemoveReactionResponse(
    message: schema.ChatBskyConvoDefsMessageView,
  )
}

pub type AppBskyGraphGetListBlocksResponse {
  AppBskyGraphGetListBlocksResponse(
    lists: List(schema.AppBskyGraphDefsListView),
    cursor: Option(String),
  )
}

pub type ChatBskyConvoAddReactionResponse {
  ChatBskyConvoAddReactionResponse(message: schema.ChatBskyConvoDefsMessageView)
}

pub type ChatBskyModerationGetActorMetadataResponse {
  ChatBskyModerationGetActorMetadataResponse(
    month: schema.ChatBskyModerationGetActorMetadataMetadata,
    all: schema.ChatBskyModerationGetActorMetadataMetadata,
    day: schema.ChatBskyModerationGetActorMetadataMetadata,
  )
}

pub type ToolsOzoneModerationSearchReposResponse {
  ToolsOzoneModerationSearchReposResponse(
    repos: List(schema.ToolsOzoneModerationDefsRepoView),
    cursor: Option(String),
  )
}

pub type AppBskyActorGetPreferencesResponse {
  AppBskyActorGetPreferencesResponse(
    preferences: schema.AppBskyActorDefsPreferences,
  )
}

pub type ComAtprotoIdentityResolveDidResponse {
  ComAtprotoIdentityResolveDidResponse(did_doc: json.Json)
}

pub type ToolsOzoneCommunicationListTemplatesResponse {
  ToolsOzoneCommunicationListTemplatesResponse(
    communication_templates: List(
      schema.ToolsOzoneCommunicationDefsTemplateView,
    ),
  )
}

pub type AppBskyFeedSearchPostsResponse {
  AppBskyFeedSearchPostsResponse(
    hits_total: Option(Int),
    posts: List(schema.AppBskyFeedDefsPostView),
    cursor: Option(String),
  )
}

pub type ChatBskyConvoUnmuteConvoResponse {
  ChatBskyConvoUnmuteConvoResponse(convo: schema.ChatBskyConvoDefsConvoView)
}

pub type AppBskyFeedSendInteractionsResponse {
  AppBskyFeedSendInteractionsResponse(
    unknown: Option(dict.Dict(String, json.Json)),
  )
}

pub type ComAtprotoServerCheckAccountStatusResponse {
  ComAtprotoServerCheckAccountStatusResponse(
    valid_did: Bool,
    repo_commit: String,
    private_state_values: Int,
    indexed_records: Int,
    activated: Bool,
    repo_rev: String,
    imported_blobs: Int,
    repo_blocks: Int,
    expected_blobs: Int,
  )
}

pub type ToolsOzoneSettingListOptionsResponse {
  ToolsOzoneSettingListOptionsResponse(
    cursor: Option(String),
    options: List(schema.ToolsOzoneSettingDefsOption),
  )
}

pub type AppBskyFeedDescribeFeedGeneratorResponse {
  AppBskyFeedDescribeFeedGeneratorResponse(
    feeds: List(schema.AppBskyFeedDescribeFeedGeneratorFeed),
    links: Option(schema.AppBskyFeedDescribeFeedGeneratorLinks),
    did: String,
  )
}

pub type ComAtprotoSyncListReposResponse {
  ComAtprotoSyncListReposResponse(
    repos: List(schema.ComAtprotoSyncListReposRepo),
    cursor: Option(String),
  )
}

pub type ToolsOzoneSignatureFindRelatedAccountsResponse {
  ToolsOzoneSignatureFindRelatedAccountsResponse(
    accounts: List(schema.ToolsOzoneSignatureFindRelatedAccountsRelatedAccount),
    cursor: Option(String),
  )
}

pub type ComAtprotoServerCreateSessionResponse {
  ComAtprotoServerCreateSessionResponse(
    access_jwt: String,
    email_confirmed: Option(Bool),
    active: Option(Bool),
    handle: String,
    refresh_jwt: String,
    status: Option(String),
    email_auth_factor: Option(Bool),
    did_doc: Option(json.Json),
    email: Option(String),
    did: String,
  )
}

pub type ComAtprotoServerRequestEmailUpdateResponse {
  ComAtprotoServerRequestEmailUpdateResponse(token_required: Bool)
}

pub type ComAtprotoServerListAppPasswordsResponse {
  ComAtprotoServerListAppPasswordsResponse(
    passwords: List(schema.ComAtprotoServerListAppPasswordsAppPassword),
  )
}

pub type AppBskyFeedGetLikesResponse {
  AppBskyFeedGetLikesResponse(
    uri: String,
    cursor: Option(String),
    likes: List(schema.AppBskyFeedGetLikesLike),
    cid: Option(String),
  )
}

pub type AppBskyFeedGetSuggestedFeedsResponse {
  AppBskyFeedGetSuggestedFeedsResponse(
    feeds: List(schema.AppBskyFeedDefsGeneratorView),
    cursor: Option(String),
  )
}

pub type ComAtprotoAdminSearchAccountsResponse {
  ComAtprotoAdminSearchAccountsResponse(
    accounts: List(schema.ComAtprotoAdminDefsAccountView),
    cursor: Option(String),
  )
}

pub type ToolsOzoneServerGetConfigResponse {
  ToolsOzoneServerGetConfigResponse(
    appview: Option(schema.ToolsOzoneServerGetConfigServiceConfig),
    verifier_did: Option(String),
    viewer: Option(schema.ToolsOzoneServerGetConfigViewerConfig),
    blob_divert: Option(schema.ToolsOzoneServerGetConfigServiceConfig),
    chat: Option(schema.ToolsOzoneServerGetConfigServiceConfig),
    pds: Option(schema.ToolsOzoneServerGetConfigServiceConfig),
  )
}

pub type AppBskyGraphGetListResponse {
  AppBskyGraphGetListResponse(
    items: List(schema.AppBskyGraphDefsListItemView),
    cursor: Option(String),
    list: schema.AppBskyGraphDefsListView,
  )
}

pub type ChatBskyConvoGetConvoResponse {
  ChatBskyConvoGetConvoResponse(convo: schema.ChatBskyConvoDefsConvoView)
}

pub type ComAtprotoRepoGetRecordResponse {
  ComAtprotoRepoGetRecordResponse(
    uri: String,
    value: json.Json,
    cid: Option(String),
  )
}

pub type ComAtprotoServerReserveSigningKeyResponse {
  ComAtprotoServerReserveSigningKeyResponse(signing_key: String)
}

pub type ComAtprotoServerCreateInviteCodeResponse {
  ComAtprotoServerCreateInviteCodeResponse(code: String)
}

pub type ChatBskyConvoMuteConvoResponse {
  ChatBskyConvoMuteConvoResponse(convo: schema.ChatBskyConvoDefsConvoView)
}

pub type ToolsOzoneSettingRemoveOptionsResponse {
  ToolsOzoneSettingRemoveOptionsResponse(
    unknown: Option(dict.Dict(String, json.Json)),
  )
}

pub type ChatBskyConvoGetMessagesResponse {
  ChatBskyConvoGetMessagesResponse(
    messages: List(json.Json),
    cursor: Option(String),
  )
}

pub type ToolsOzoneTeamListMembersResponse {
  ToolsOzoneTeamListMembersResponse(
    cursor: Option(String),
    members: List(schema.ToolsOzoneTeamDefsMember),
  )
}

pub type ChatBskyConvoLeaveConvoResponse {
  ChatBskyConvoLeaveConvoResponse(rev: String, convo_id: String)
}

pub type ChatBskyModerationGetMessageContextResponse {
  ChatBskyModerationGetMessageContextResponse(messages: List(json.Json))
}

pub type AppBskyGraphSearchStarterPacksResponse {
  AppBskyGraphSearchStarterPacksResponse(
    starter_packs: List(schema.AppBskyGraphDefsStarterPackViewBasic),
    cursor: Option(String),
  )
}

pub type AppBskyActorGetSuggestionsResponse {
  AppBskyActorGetSuggestionsResponse(
    rec_id: Option(Int),
    cursor: Option(String),
    actors: List(schema.AppBskyActorDefsProfileView),
  )
}

pub type AppBskyGraphGetStarterPackResponse {
  AppBskyGraphGetStarterPackResponse(
    starter_pack: schema.AppBskyGraphDefsStarterPackView,
  )
}

pub type ComAtprotoRepoUploadBlobResponse {
  ComAtprotoRepoUploadBlobResponse(blob: String)
}

pub type ComAtprotoRepoListRecordsResponse {
  ComAtprotoRepoListRecordsResponse(
    records: List(schema.ComAtprotoRepoListRecordsRecord),
    cursor: Option(String),
  )
}

pub type ComAtprotoRepoDescribeRepoResponse {
  ComAtprotoRepoDescribeRepoResponse(
    handle: String,
    collections: List(String),
    handle_is_correct: Bool,
    did_doc: json.Json,
    did: String,
  )
}

pub type ComAtprotoAdminGetSubjectStatusResponse {
  ComAtprotoAdminGetSubjectStatusResponse(
    takedown: Option(schema.ComAtprotoAdminDefsStatusAttr),
    subject: json.Json,
    deactivated: Option(schema.ComAtprotoAdminDefsStatusAttr),
  )
}

pub type AppBskyFeedGetFeedGeneratorResponse {
  AppBskyFeedGetFeedGeneratorResponse(
    view: schema.AppBskyFeedDefsGeneratorView,
    is_valid: Bool,
    is_online: Bool,
  )
}

pub type ComAtprotoSyncGetRepoStatusResponse {
  ComAtprotoSyncGetRepoStatusResponse(
    rev: Option(String),
    active: Bool,
    status: Option(String),
    did: String,
  )
}

pub type ComAtprotoServerDescribeServerResponse {
  ComAtprotoServerDescribeServerResponse(
    contact: Option(schema.ComAtprotoServerDescribeServerContact),
    phone_verification_required: Option(Bool),
    invite_code_required: Option(Bool),
    links: Option(schema.ComAtprotoServerDescribeServerLinks),
    available_user_domains: List(String),
    did: String,
  )
}

pub type AppBskyFeedGetFeedSkeletonResponse {
  AppBskyFeedGetFeedSkeletonResponse(
    cursor: Option(String),
    feed: List(schema.AppBskyFeedDefsSkeletonFeedPost),
  )
}

pub type ToolsOzoneVerificationListVerificationsResponse {
  ToolsOzoneVerificationListVerificationsResponse(
    cursor: Option(String),
    verifications: List(schema.ToolsOzoneVerificationDefsVerificationView),
  )
}

pub fn com_atproto_server_create_account_request(
  base,
  data: ComAtprotoServerCreateAccountRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.createAccount"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("plcOp", json.nullable(data.plc_op, fn(data) { data })),
        #("handle", json.string(data.handle)),
        #(
          "verificationCode",
          json.nullable(data.verification_code, json.string),
        ),
        #("recoveryKey", json.nullable(data.recovery_key, json.string)),
        #(
          "verificationPhone",
          json.nullable(data.verification_phone, json.string),
        ),
        #("inviteCode", json.nullable(data.invite_code, json.string)),
        #("password", json.nullable(data.password, json.string)),
        #("email", json.nullable(data.email, json.string)),
        #("did", json.nullable(data.did, json.string)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_server_create_account_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use access_jwt <- decode.field("accessJwt", decode.string)
        use handle <- decode.field("handle", decode.string)
        use refresh_jwt <- decode.field("refreshJwt", decode.string)
        use did_doc <- decode.optional_field(
          "didDoc",
          None,
          decode.optional(utils.dynamic_to_json()),
        )
        use did <- decode.field("did", decode.string)
        decode.success(ComAtprotoServerCreateAccountResponse(
          access_jwt: access_jwt,
          handle: handle,
          refresh_jwt: refresh_jwt,
          did_doc: did_doc,
          did: did,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_convo_get_convo_availability_request(base, members members) {
  let method = http.Get
  let path = "/xrpc/chat.bsky.convo.getConvoAvailability"
  let query = [
    #(
      "members",
      option.Some(fn(_) { panic as "query parameter is not supported" }(members)),
    ),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn chat_bsky_convo_get_convo_availability_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use can_chat <- decode.field("canChat", decode.bool)
        use convo <- decode.optional_field(
          "convo",
          None,
          decode.optional(schema.chat_bsky_convo_defs_convo_view_decoder()),
        )
        decode.success(ChatBskyConvoGetConvoAvailabilityResponse(
          can_chat: can_chat,
          convo: convo,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_admin_get_invite_codes_request(
  base,
  sort sort,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/com.atproto.admin.getInviteCodes"
  let query = [
    #("sort", sort),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_admin_get_invite_codes_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use codes <- decode.field(
          "codes",
          decode.list(schema.com_atproto_server_defs_invite_code_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(ComAtprotoAdminGetInviteCodesResponse(
          codes: codes,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_repo_apply_writes_request(
  base,
  data: ComAtprotoRepoApplyWritesRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.repo.applyWrites"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("swapCommit", json.nullable(data.swap_commit, json.string)),
        #("repo", json.string(data.repo)),
        #("writes", json.array(_, fn(data) { data })(data.writes)),
        #("validate", json.nullable(data.validate, json.bool)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_repo_apply_writes_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use results <- decode.optional_field(
          "results",
          None,
          decode.optional(decode.list(utils.dynamic_to_json())),
        )
        use commit <- decode.optional_field(
          "commit",
          None,
          decode.optional(schema.com_atproto_repo_defs_commit_meta_decoder()),
        )
        decode.success(ComAtprotoRepoApplyWritesResponse(
          results: results,
          commit: commit,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_feed_get_post_thread_request(
  base,
  uri uri,
  depth depth,
  parent_height parent_height,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.feed.getPostThread"
  let query = [
    #("uri", option.Some(uri)),
    #("depth", option.map(depth, int.to_string)),
    #("parent_height", option.map(parent_height, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_feed_get_post_thread_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use thread <- decode.field("thread", utils.dynamic_to_json())
        use threadgate <- decode.optional_field(
          "threadgate",
          None,
          decode.optional(schema.app_bsky_feed_defs_threadgate_view_decoder()),
        )
        decode.success(AppBskyFeedGetPostThreadResponse(
          thread: thread,
          threadgate: threadgate,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_moderation_create_report_request(
  base,
  data: ComAtprotoModerationCreateReportRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.moderation.createReport"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("reason", json.nullable(data.reason, json.string)),
        #("subject", fn(data) { data }(data.subject)),
        #(
          "reasonType",
          schema.com_atproto_moderation_defs_reason_type_encode(
            data.reason_type,
          ),
        ),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_moderation_create_report_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use reason <- decode.optional_field(
          "reason",
          None,
          decode.optional(decode.string),
        )
        use reported_by <- decode.field("reportedBy", decode.string)
        use subject <- decode.field("subject", utils.dynamic_to_json())
        use id <- decode.field("id", decode.int)
        use created_at <- decode.field("createdAt", decode.string)
        use reason_type <- decode.field(
          "reasonType",
          schema.com_atproto_moderation_defs_reason_type_decoder(),
        )
        decode.success(ComAtprotoModerationCreateReportResponse(
          reason: reason,
          reported_by: reported_by,
          subject: subject,
          id: id,
          created_at: created_at,
          reason_type: reason_type,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_repo_delete_record_request(
  base,
  data: ComAtprotoRepoDeleteRecordRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.repo.deleteRecord"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("swapRecord", json.nullable(data.swap_record, json.string)),
        #("swapCommit", json.nullable(data.swap_commit, json.string)),
        #("rkey", json.string(data.rkey)),
        #("repo", json.string(data.repo)),
        #("collection", json.string(data.collection)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_repo_delete_record_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use commit <- decode.optional_field(
          "commit",
          None,
          decode.optional(schema.com_atproto_repo_defs_commit_meta_decoder()),
        )
        decode.success(ComAtprotoRepoDeleteRecordResponse(commit: commit))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_feed_get_posts_request(base, uris uris) {
  let method = http.Get
  let path = "/xrpc/app.bsky.feed.getPosts"
  let query = [
    #(
      "uris",
      option.Some(fn(_) { panic as "query parameter is not supported" }(uris)),
    ),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_feed_get_posts_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use posts <- decode.field(
          "posts",
          decode.list(schema.app_bsky_feed_defs_post_view_decoder()),
        )
        decode.success(AppBskyFeedGetPostsResponse(posts: posts))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_convo_update_read_request(
  base,
  data: ChatBskyConvoUpdateReadRequest,
) {
  let method = http.Post
  let path = "/xrpc/chat.bsky.convo.updateRead"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("messageId", json.nullable(data.message_id, json.string)),
        #("convoId", json.string(data.convo_id)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn chat_bsky_convo_update_read_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use convo <- decode.field(
          "convo",
          schema.chat_bsky_convo_defs_convo_view_decoder(),
        )
        decode.success(ChatBskyConvoUpdateReadResponse(convo: convo))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_sync_list_blobs_request(
  base,
  did did,
  since since,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/com.atproto.sync.listBlobs"
  let query = [
    #("did", option.Some(did)),
    #("since", since),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_sync_list_blobs_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use cids <- decode.field("cids", decode.list(decode.string))
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(ComAtprotoSyncListBlobsResponse(
          cids: cids,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_notification_get_unread_count_request(
  base,
  priority priority,
  seen_at seen_at,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.notification.getUnreadCount"
  let query = [
    #("priority", option.map(priority, bool.to_string)),
    #("seen_at", seen_at),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_notification_get_unread_count_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use count <- decode.field("count", decode.int)
        decode.success(AppBskyNotificationGetUnreadCountResponse(count: count))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_sync_list_repos_by_collection_request(
  base,
  collection collection,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/com.atproto.sync.listReposByCollection"
  let query = [
    #("collection", option.Some(collection)),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_sync_list_repos_by_collection_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use repos <- decode.field(
          "repos",
          decode.list(
            schema.com_atproto_sync_list_repos_by_collection_repo_decoder(),
          ),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(ComAtprotoSyncListReposByCollectionResponse(
          repos: repos,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_feed_get_author_feed_request(
  base,
  actor actor,
  limit limit,
  cursor cursor,
  filter filter,
  include_pins include_pins,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.feed.getAuthorFeed"
  let query = [
    #("actor", option.Some(actor)),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
    #("filter", filter),
    #("include_pins", option.map(include_pins, bool.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_feed_get_author_feed_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use feed <- decode.field(
          "feed",
          decode.list(schema.app_bsky_feed_defs_feed_view_post_decoder()),
        )
        decode.success(AppBskyFeedGetAuthorFeedResponse(
          cursor: cursor,
          feed: feed,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_set_add_values_request(
  base,
  data: ToolsOzoneSetAddValuesRequest,
) {
  let method = http.Post
  let path = "/xrpc/tools.ozone.set.addValues"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("values", json.array(_, json.string)(data.values)),
        #("name", json.string(data.name)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn tools_ozone_set_add_values_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_actor_export_account_data_request(base) {
  let method = http.Get
  let path = "/xrpc/chat.bsky.actor.exportAccountData"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn chat_bsky_actor_export_account_data_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_feed_get_reposted_by_request(
  base,
  uri uri,
  cid cid,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.feed.getRepostedBy"
  let query = [
    #("uri", option.Some(uri)),
    #("cid", cid),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_feed_get_reposted_by_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use reposted_by <- decode.field(
          "repostedBy",
          decode.list(schema.app_bsky_actor_defs_profile_view_decoder()),
        )
        use uri <- decode.field("uri", decode.string)
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use cid <- decode.optional_field(
          "cid",
          None,
          decode.optional(decode.string),
        )
        decode.success(AppBskyFeedGetRepostedByResponse(
          reposted_by: reposted_by,
          uri: uri,
          cursor: cursor,
          cid: cid,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_admin_update_subject_status_request(
  base,
  data: ComAtprotoAdminUpdateSubjectStatusRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.admin.updateSubjectStatus"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #(
          "takedown",
          json.nullable(
            data.takedown,
            schema.com_atproto_admin_defs_status_attr_encode,
          ),
        ),
        #("subject", fn(data) { data }(data.subject)),
        #(
          "deactivated",
          json.nullable(
            data.deactivated,
            schema.com_atproto_admin_defs_status_attr_encode,
          ),
        ),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_admin_update_subject_status_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use takedown <- decode.optional_field(
          "takedown",
          None,
          decode.optional(schema.com_atproto_admin_defs_status_attr_decoder()),
        )
        use subject <- decode.field("subject", utils.dynamic_to_json())
        decode.success(ComAtprotoAdminUpdateSubjectStatusResponse(
          takedown: takedown,
          subject: subject,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_team_delete_member_request(
  base,
  data: ToolsOzoneTeamDeleteMemberRequest,
) {
  let method = http.Post
  let path = "/xrpc/tools.ozone.team.deleteMember"
  let query = []
  let body = utils.json_to_bits(utils.object([#("did", json.string(data.did))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn tools_ozone_team_delete_member_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_notification_put_preferences_request(
  base,
  data: AppBskyNotificationPutPreferencesRequest,
) {
  let method = http.Post
  let path = "/xrpc/app.bsky.notification.putPreferences"
  let query = []
  let body =
    utils.json_to_bits(utils.object([#("priority", json.bool(data.priority))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn app_bsky_notification_put_preferences_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_signature_search_accounts_request(
  base,
  values values,
  cursor cursor,
  limit limit,
) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.signature.searchAccounts"
  let query = [
    #(
      "values",
      option.Some(fn(_) { panic as "query parameter is not supported" }(values)),
    ),
    #("cursor", cursor),
    #("limit", option.map(limit, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_signature_search_accounts_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use accounts <- decode.field(
          "accounts",
          decode.list(schema.com_atproto_admin_defs_account_view_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(ToolsOzoneSignatureSearchAccountsResponse(
          accounts: accounts,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_actor_delete_account_request(base) {
  let method = http.Post
  let path = "/xrpc/chat.bsky.actor.deleteAccount"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn chat_bsky_actor_delete_account_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use unknown <- decode.optional_field(
          "_unknown_",
          None,
          decode.optional(decode.dict(decode.string, utils.dynamic_to_json())),
        )
        decode.success(ChatBskyActorDeleteAccountResponse(unknown: unknown))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_identity_resolve_handle_request(base, handle handle) {
  let method = http.Get
  let path = "/xrpc/com.atproto.identity.resolveHandle"
  let query = [#("handle", option.Some(handle))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_identity_resolve_handle_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use did <- decode.field("did", decode.string)
        decode.success(ComAtprotoIdentityResolveHandleResponse(did: did))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_admin_get_account_info_request(base, did did) {
  let method = http.Get
  let path = "/xrpc/com.atproto.admin.getAccountInfo"
  let query = [#("did", option.Some(did))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_admin_get_account_info_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(
        body,
        schema.com_atproto_admin_defs_account_view_decoder(),
      )
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_repo_put_record_request(
  base,
  data: ComAtprotoRepoPutRecordRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.repo.putRecord"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("swapRecord", json.nullable(data.swap_record, json.string)),
        #("swapCommit", json.nullable(data.swap_commit, json.string)),
        #("rkey", json.string(data.rkey)),
        #("record", fn(data) { data }(data.record)),
        #("repo", json.string(data.repo)),
        #("validate", json.nullable(data.validate, json.bool)),
        #("collection", json.string(data.collection)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_repo_put_record_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use validation_status <- decode.optional_field(
          "validationStatus",
          None,
          decode.optional(decode.string),
        )
        use uri <- decode.field("uri", decode.string)
        use commit <- decode.optional_field(
          "commit",
          None,
          decode.optional(schema.com_atproto_repo_defs_commit_meta_decoder()),
        )
        use cid <- decode.field("cid", decode.string)
        decode.success(ComAtprotoRepoPutRecordResponse(
          validation_status: validation_status,
          uri: uri,
          commit: commit,
          cid: cid,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_feed_get_actor_likes_request(
  base,
  actor actor,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.feed.getActorLikes"
  let query = [
    #("actor", option.Some(actor)),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_feed_get_actor_likes_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use feed <- decode.field(
          "feed",
          decode.list(schema.app_bsky_feed_defs_feed_view_post_decoder()),
        )
        decode.success(AppBskyFeedGetActorLikesResponse(
          cursor: cursor,
          feed: feed,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_admin_send_email_request(
  base,
  data: ComAtprotoAdminSendEmailRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.admin.sendEmail"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("recipientDid", json.string(data.recipient_did)),
        #("senderDid", json.string(data.sender_did)),
        #("subject", json.nullable(data.subject, json.string)),
        #("content", json.string(data.content)),
        #("comment", json.nullable(data.comment, json.string)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_admin_send_email_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use sent <- decode.field("sent", decode.bool)
        decode.success(ComAtprotoAdminSendEmailResponse(sent: sent))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_team_update_member_request(
  base,
  data: ToolsOzoneTeamUpdateMemberRequest,
) {
  let method = http.Post
  let path = "/xrpc/tools.ozone.team.updateMember"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("role", json.nullable(data.role, json.string)),
        #("disabled", json.nullable(data.disabled, json.bool)),
        #("did", json.string(data.did)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn tools_ozone_team_update_member_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.tools_ozone_team_defs_member_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_request_account_delete_request(base) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.requestAccountDelete"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_server_request_account_delete_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_moderation_get_records_request(base, uris uris) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.moderation.getRecords"
  let query = [
    #(
      "uris",
      option.Some(fn(_) { panic as "query parameter is not supported" }(uris)),
    ),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_moderation_get_records_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use records <- decode.field(
          "records",
          decode.list(utils.dynamic_to_json()),
        )
        decode.success(ToolsOzoneModerationGetRecordsResponse(records: records))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_get_follows_request(
  base,
  actor actor,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.graph.getFollows"
  let query = [
    #("actor", option.Some(actor)),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_graph_get_follows_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use follows <- decode.field(
          "follows",
          decode.list(schema.app_bsky_actor_defs_profile_view_decoder()),
        )
        use subject <- decode.field(
          "subject",
          schema.app_bsky_actor_defs_profile_view_decoder(),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(AppBskyGraphGetFollowsResponse(
          follows: follows,
          subject: subject,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_actor_get_profile_request(base, actor actor) {
  let method = http.Get
  let path = "/xrpc/app.bsky.actor.getProfile"
  let query = [#("actor", option.Some(actor))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_actor_get_profile_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(
        body,
        schema.app_bsky_actor_defs_profile_view_detailed_decoder(),
      )
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_video_get_job_status_request(base, job_id job_id) {
  let method = http.Get
  let path = "/xrpc/app.bsky.video.getJobStatus"
  let query = [#("job_id", option.Some(job_id))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_video_get_job_status_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use job_status <- decode.field(
          "jobStatus",
          schema.app_bsky_video_defs_job_status_decoder(),
        )
        decode.success(AppBskyVideoGetJobStatusResponse(job_status: job_status))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_setting_upsert_option_request(
  base,
  data: ToolsOzoneSettingUpsertOptionRequest,
) {
  let method = http.Post
  let path = "/xrpc/tools.ozone.setting.upsertOption"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("managerRole", json.nullable(data.manager_role, json.string)),
        #("value", fn(data) { data }(data.value)),
        #("scope", json.string(data.scope)),
        #("description", json.nullable(data.description, json.string)),
        #("key", json.string(data.key)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn tools_ozone_setting_upsert_option_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use option <- decode.field(
          "option",
          schema.tools_ozone_setting_defs_option_decoder(),
        )
        decode.success(ToolsOzoneSettingUpsertOptionResponse(option: option))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_moderation_get_repos_request(base, dids dids) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.moderation.getRepos"
  let query = [
    #(
      "dids",
      option.Some(fn(_) { panic as "query parameter is not supported" }(dids)),
    ),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_moderation_get_repos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use repos <- decode.field("repos", decode.list(utils.dynamic_to_json()))
        decode.success(ToolsOzoneModerationGetReposResponse(repos: repos))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_sync_get_latest_commit_request(base, did did) {
  let method = http.Get
  let path = "/xrpc/com.atproto.sync.getLatestCommit"
  let query = [#("did", option.Some(did))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_sync_get_latest_commit_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use rev <- decode.field("rev", decode.string)
        use cid <- decode.field("cid", decode.string)
        decode.success(ComAtprotoSyncGetLatestCommitResponse(rev: rev, cid: cid))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_convo_send_message_batch_request(
  base,
  data: ChatBskyConvoSendMessageBatchRequest,
) {
  let method = http.Post
  let path = "/xrpc/chat.bsky.convo.sendMessageBatch"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #(
          "items",
          json.array(
            _,
            schema.chat_bsky_convo_send_message_batch_batch_item_encode,
          )(data.items),
        ),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn chat_bsky_convo_send_message_batch_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use items <- decode.field(
          "items",
          decode.list(schema.chat_bsky_convo_defs_message_view_decoder()),
        )
        decode.success(ChatBskyConvoSendMessageBatchResponse(items: items))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_signature_find_correlation_request(base, dids dids) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.signature.findCorrelation"
  let query = [
    #(
      "dids",
      option.Some(fn(_) { panic as "query parameter is not supported" }(dids)),
    ),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_signature_find_correlation_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use details <- decode.field(
          "details",
          decode.list(schema.tools_ozone_signature_defs_sig_detail_decoder()),
        )
        decode.success(ToolsOzoneSignatureFindCorrelationResponse(
          details: details,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_repo_import_repo_request(base) {
  let method = http.Post
  let path = "/xrpc/com.atproto.repo.importRepo"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_repo_import_repo_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_delete_session_request(base) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.deleteSession"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_server_delete_session_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_actor_search_actors_typeahead_request(base, q q, limit limit) {
  let method = http.Get
  let path = "/xrpc/app.bsky.actor.searchActorsTypeahead"
  let query = [#("q", q), #("limit", option.map(limit, int.to_string))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_actor_search_actors_typeahead_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use actors <- decode.field(
          "actors",
          decode.list(schema.app_bsky_actor_defs_profile_view_basic_decoder()),
        )
        decode.success(AppBskyActorSearchActorsTypeaheadResponse(actors: actors))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_get_known_followers_request(
  base,
  actor actor,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.graph.getKnownFollowers"
  let query = [
    #("actor", option.Some(actor)),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_graph_get_known_followers_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use subject <- decode.field(
          "subject",
          schema.app_bsky_actor_defs_profile_view_decoder(),
        )
        use followers <- decode.field(
          "followers",
          decode.list(schema.app_bsky_actor_defs_profile_view_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(AppBskyGraphGetKnownFollowersResponse(
          subject: subject,
          followers: followers,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_moderation_query_statuses_request(
  base,
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
  let method = http.Get
  let path = "/xrpc/tools.ozone.moderation.queryStatuses"
  let query = [
    #("queue_count", option.map(queue_count, int.to_string)),
    #("queue_index", option.map(queue_index, int.to_string)),
    #("queue_seed", queue_seed),
    #(
      "include_all_user_records",
      option.map(include_all_user_records, bool.to_string),
    ),
    #("subject", subject),
    #("comment", comment),
    #("reported_after", reported_after),
    #("reported_before", reported_before),
    #("reviewed_after", reviewed_after),
    #("hosting_deleted_after", hosting_deleted_after),
    #("hosting_deleted_before", hosting_deleted_before),
    #("hosting_updated_after", hosting_updated_after),
    #("hosting_updated_before", hosting_updated_before),
    #(
      "hosting_statuses",
      option.map(hosting_statuses, fn(_) {
        panic as "query parameter is not supported"
      }),
    ),
    #("reviewed_before", reviewed_before),
    #("include_muted", option.map(include_muted, bool.to_string)),
    #("only_muted", option.map(only_muted, bool.to_string)),
    #("review_state", review_state),
    #(
      "ignore_subjects",
      option.map(ignore_subjects, fn(_) {
        panic as "query parameter is not supported"
      }),
    ),
    #("last_reviewed_by", last_reviewed_by),
    #("sort_field", sort_field),
    #("sort_direction", sort_direction),
    #("takendown", option.map(takendown, bool.to_string)),
    #("appealed", option.map(appealed, bool.to_string)),
    #("limit", option.map(limit, int.to_string)),
    #(
      "tags",
      option.map(tags, fn(_) { panic as "query parameter is not supported" }),
    ),
    #(
      "exclude_tags",
      option.map(exclude_tags, fn(_) {
        panic as "query parameter is not supported"
      }),
    ),
    #("cursor", cursor),
    #(
      "collections",
      option.map(collections, fn(_) {
        panic as "query parameter is not supported"
      }),
    ),
    #("subject_type", subject_type),
    #(
      "min_account_suspend_count",
      option.map(min_account_suspend_count, int.to_string),
    ),
    #(
      "min_reported_records_count",
      option.map(min_reported_records_count, int.to_string),
    ),
    #(
      "min_takendown_records_count",
      option.map(min_takendown_records_count, int.to_string),
    ),
    #("min_priority_score", option.map(min_priority_score, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_moderation_query_statuses_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use subject_statuses <- decode.field(
          "subjectStatuses",
          decode.list(
            schema.tools_ozone_moderation_defs_subject_status_view_decoder(),
          ),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(ToolsOzoneModerationQueryStatusesResponse(
          subject_statuses: subject_statuses,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_moderation_get_repo_request(base, did did) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.moderation.getRepo"
  let query = [#("did", option.Some(did))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_moderation_get_repo_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(
        body,
        schema.tools_ozone_moderation_defs_repo_view_detail_decoder(),
      )
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_get_service_auth_request(
  base,
  aud aud,
  exp exp,
  lxm lxm,
) {
  let method = http.Get
  let path = "/xrpc/com.atproto.server.getServiceAuth"
  let query = [
    #("aud", option.Some(aud)),
    #("exp", option.map(exp, int.to_string)),
    #("lxm", lxm),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_server_get_service_auth_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use token_ <- decode.field("token", decode.string)
        decode.success(ComAtprotoServerGetServiceAuthResponse(token_: token_))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_sync_get_blob_request(base, did did, cid cid) {
  let method = http.Get
  let path = "/xrpc/com.atproto.sync.getBlob"
  let query = [#("did", option.Some(did)), #("cid", option.Some(cid))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_sync_get_blob_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_get_actor_starter_packs_request(
  base,
  actor actor,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.graph.getActorStarterPacks"
  let query = [
    #("actor", option.Some(actor)),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_graph_get_actor_starter_packs_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use starter_packs <- decode.field(
          "starterPacks",
          decode.list(
            schema.app_bsky_graph_defs_starter_pack_view_basic_decoder(),
          ),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(AppBskyGraphGetActorStarterPacksResponse(
          starter_packs: starter_packs,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_identity_get_recommended_did_credentials_request(base) {
  let method = http.Get
  let path = "/xrpc/com.atproto.identity.getRecommendedDidCredentials"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_identity_get_recommended_did_credentials_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use also_known_as <- decode.optional_field(
          "alsoKnownAs",
          None,
          decode.optional(decode.list(decode.string)),
        )
        use rotation_keys <- decode.optional_field(
          "rotationKeys",
          None,
          decode.optional(decode.list(decode.string)),
        )
        use verification_methods <- decode.optional_field(
          "verificationMethods",
          None,
          decode.optional(utils.dynamic_to_json()),
        )
        use services <- decode.optional_field(
          "services",
          None,
          decode.optional(utils.dynamic_to_json()),
        )
        decode.success(ComAtprotoIdentityGetRecommendedDidCredentialsResponse(
          also_known_as: also_known_as,
          rotation_keys: rotation_keys,
          verification_methods: verification_methods,
          services: services,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_moderation_emit_event_request(
  base,
  data: ToolsOzoneModerationEmitEventRequest,
) {
  let method = http.Post
  let path = "/xrpc/tools.ozone.moderation.emitEvent"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("subject", fn(data) { data }(data.subject)),
        #("event", fn(data) { data }(data.event)),
        #(
          "subjectBlobCids",
          json.nullable(data.subject_blob_cids, json.array(_, json.string)),
        ),
        #("createdBy", json.string(data.created_by)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn tools_ozone_moderation_emit_event_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(
        body,
        schema.tools_ozone_moderation_defs_mod_event_view_decoder(),
      )
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_admin_enable_account_invites_request(
  base,
  data: ComAtprotoAdminEnableAccountInvitesRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.admin.enableAccountInvites"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("account", json.string(data.account)),
        #("note", json.nullable(data.note, json.string)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_admin_enable_account_invites_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_verification_revoke_verifications_request(
  base,
  data: ToolsOzoneVerificationRevokeVerificationsRequest,
) {
  let method = http.Post
  let path = "/xrpc/tools.ozone.verification.revokeVerifications"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("uris", json.array(_, json.string)(data.uris)),
        #("revokeReason", json.nullable(data.revoke_reason, json.string)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn tools_ozone_verification_revoke_verifications_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use failed_revocations <- decode.field(
          "failedRevocations",
          decode.list(
            schema.tools_ozone_verification_revoke_verifications_revoke_error_decoder(),
          ),
        )
        use revoked_verifications <- decode.field(
          "revokedVerifications",
          decode.list(decode.string),
        )
        decode.success(ToolsOzoneVerificationRevokeVerificationsResponse(
          failed_revocations: failed_revocations,
          revoked_verifications: revoked_verifications,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_convo_delete_message_for_self_request(
  base,
  data: ChatBskyConvoDeleteMessageForSelfRequest,
) {
  let method = http.Post
  let path = "/xrpc/chat.bsky.convo.deleteMessageForSelf"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("messageId", json.string(data.message_id)),
        #("convoId", json.string(data.convo_id)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn chat_bsky_convo_delete_message_for_self_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(
        body,
        schema.chat_bsky_convo_defs_deleted_message_view_decoder(),
      )
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_get_suggested_follows_by_actor_request(base, actor actor) {
  let method = http.Get
  let path = "/xrpc/app.bsky.graph.getSuggestedFollowsByActor"
  let query = [#("actor", option.Some(actor))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_graph_get_suggested_follows_by_actor_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use rec_id <- decode.optional_field(
          "recId",
          None,
          decode.optional(decode.int),
        )
        use is_fallback <- decode.optional_field(
          "isFallback",
          None,
          decode.optional(decode.bool),
        )
        use suggestions <- decode.field(
          "suggestions",
          decode.list(schema.app_bsky_actor_defs_profile_view_decoder()),
        )
        decode.success(AppBskyGraphGetSuggestedFollowsByActorResponse(
          rec_id: rec_id,
          is_fallback: is_fallback,
          suggestions: suggestions,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_reset_password_request(
  base,
  data: ComAtprotoServerResetPasswordRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.resetPassword"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("token", json.string(data.token_)),
        #("password", json.string(data.password)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_server_reset_password_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_notification_update_seen_request(
  base,
  data: AppBskyNotificationUpdateSeenRequest,
) {
  let method = http.Post
  let path = "/xrpc/app.bsky.notification.updateSeen"
  let query = []
  let body =
    utils.json_to_bits(utils.object([#("seenAt", json.string(data.seen_at))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn app_bsky_notification_update_seen_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_actor_get_profiles_request(base, actors actors) {
  let method = http.Get
  let path = "/xrpc/app.bsky.actor.getProfiles"
  let query = [
    #(
      "actors",
      option.Some(fn(_) { panic as "query parameter is not supported" }(actors)),
    ),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_actor_get_profiles_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use profiles <- decode.field(
          "profiles",
          decode.list(
            schema.app_bsky_actor_defs_profile_view_detailed_decoder(),
          ),
        )
        decode.success(AppBskyActorGetProfilesResponse(profiles: profiles))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_video_upload_video_request(base) {
  let method = http.Post
  let path = "/xrpc/app.bsky.video.uploadVideo"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_video_upload_video_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use job_status <- decode.field(
          "jobStatus",
          schema.app_bsky_video_defs_job_status_decoder(),
        )
        decode.success(AppBskyVideoUploadVideoResponse(job_status: job_status))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_moderation_get_record_request(base, uri uri, cid cid) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.moderation.getRecord"
  let query = [#("uri", option.Some(uri)), #("cid", cid)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_moderation_get_record_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(
        body,
        schema.tools_ozone_moderation_defs_record_view_detail_decoder(),
      )
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_labeler_get_services_request(base, dids dids, detailed detailed) {
  let method = http.Get
  let path = "/xrpc/app.bsky.labeler.getServices"
  let query = [
    #(
      "dids",
      option.Some(fn(_) { panic as "query parameter is not supported" }(dids)),
    ),
    #("detailed", option.map(detailed, bool.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_labeler_get_services_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use views <- decode.field("views", decode.list(utils.dynamic_to_json()))
        decode.success(AppBskyLabelerGetServicesResponse(views: views))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_moderation_get_reporter_stats_request(base, dids dids) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.moderation.getReporterStats"
  let query = [
    #(
      "dids",
      option.Some(fn(_) { panic as "query parameter is not supported" }(dids)),
    ),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_moderation_get_reporter_stats_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use stats <- decode.field(
          "stats",
          decode.list(
            schema.tools_ozone_moderation_defs_reporter_stats_decoder(),
          ),
        )
        decode.success(ToolsOzoneModerationGetReporterStatsResponse(
          stats: stats,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_request_password_reset_request(
  base,
  data: ComAtprotoServerRequestPasswordResetRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.requestPasswordReset"
  let query = []
  let body =
    utils.json_to_bits(utils.object([#("email", json.string(data.email))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_server_request_password_reset_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_admin_get_account_infos_request(base, dids dids) {
  let method = http.Get
  let path = "/xrpc/com.atproto.admin.getAccountInfos"
  let query = [
    #(
      "dids",
      option.Some(fn(_) { panic as "query parameter is not supported" }(dids)),
    ),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_admin_get_account_infos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use infos <- decode.field(
          "infos",
          decode.list(schema.com_atproto_admin_defs_account_view_decoder()),
        )
        decode.success(ComAtprotoAdminGetAccountInfosResponse(infos: infos))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_notification_list_notifications_request(
  base,
  reasons reasons,
  limit limit,
  priority priority,
  cursor cursor,
  seen_at seen_at,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.notification.listNotifications"
  let query = [
    #(
      "reasons",
      option.map(reasons, fn(_) { panic as "query parameter is not supported" }),
    ),
    #("limit", option.map(limit, int.to_string)),
    #("priority", option.map(priority, bool.to_string)),
    #("cursor", cursor),
    #("seen_at", seen_at),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_notification_list_notifications_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use priority <- decode.optional_field(
          "priority",
          None,
          decode.optional(decode.bool),
        )
        use notifications <- decode.field(
          "notifications",
          decode.list(
            schema.app_bsky_notification_list_notifications_notification_decoder(),
          ),
        )
        use seen_at <- decode.optional_field(
          "seenAt",
          None,
          decode.optional(decode.string),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(AppBskyNotificationListNotificationsResponse(
          priority: priority,
          notifications: notifications,
          seen_at: seen_at,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_communication_delete_template_request(
  base,
  data: ToolsOzoneCommunicationDeleteTemplateRequest,
) {
  let method = http.Post
  let path = "/xrpc/tools.ozone.communication.deleteTemplate"
  let query = []
  let body = utils.json_to_bits(utils.object([#("id", json.string(data.id))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn tools_ozone_communication_delete_template_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_verification_grant_verifications_request(
  base,
  data: ToolsOzoneVerificationGrantVerificationsRequest,
) {
  let method = http.Post
  let path = "/xrpc/tools.ozone.verification.grantVerifications"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #(
          "verifications",
          json.array(
            _,
            schema.tools_ozone_verification_grant_verifications_verification_input_encode,
          )(data.verifications),
        ),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn tools_ozone_verification_grant_verifications_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use verifications <- decode.field(
          "verifications",
          decode.list(
            schema.tools_ozone_verification_defs_verification_view_decoder(),
          ),
        )
        use failed_verifications <- decode.field(
          "failedVerifications",
          decode.list(
            schema.tools_ozone_verification_grant_verifications_grant_error_decoder(),
          ),
        )
        decode.success(ToolsOzoneVerificationGrantVerificationsResponse(
          verifications: verifications,
          failed_verifications: failed_verifications,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_feed_get_timeline_request(
  base,
  algorithm algorithm,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.feed.getTimeline"
  let query = [
    #("algorithm", algorithm),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_feed_get_timeline_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use feed <- decode.field(
          "feed",
          decode.list(schema.app_bsky_feed_defs_feed_view_post_decoder()),
        )
        decode.success(AppBskyFeedGetTimelineResponse(
          cursor: cursor,
          feed: feed,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_sync_get_host_status_request(base, hostname hostname) {
  let method = http.Get
  let path = "/xrpc/com.atproto.sync.getHostStatus"
  let query = [#("hostname", option.Some(hostname))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_sync_get_host_status_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use account_count <- decode.optional_field(
          "accountCount",
          None,
          decode.optional(decode.int),
        )
        use status <- decode.optional_field(
          "status",
          None,
          decode.optional(schema.com_atproto_sync_defs_host_status_decoder()),
        )
        use hostname <- decode.field("hostname", decode.string)
        use seq <- decode.optional_field(
          "seq",
          None,
          decode.optional(decode.int),
        )
        decode.success(ComAtprotoSyncGetHostStatusResponse(
          account_count: account_count,
          status: status,
          hostname: hostname,
          seq: seq,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_convo_list_convos_request(
  base,
  limit limit,
  cursor cursor,
  read_state read_state,
  status status,
) {
  let method = http.Get
  let path = "/xrpc/chat.bsky.convo.listConvos"
  let query = [
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
    #("read_state", read_state),
    #("status", status),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn chat_bsky_convo_list_convos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use convos <- decode.field(
          "convos",
          decode.list(schema.chat_bsky_convo_defs_convo_view_decoder()),
        )
        decode.success(ChatBskyConvoListConvosResponse(
          cursor: cursor,
          convos: convos,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_get_list_mutes_request(base, limit limit, cursor cursor) {
  let method = http.Get
  let path = "/xrpc/app.bsky.graph.getListMutes"
  let query = [
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_graph_get_list_mutes_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use lists <- decode.field(
          "lists",
          decode.list(schema.app_bsky_graph_defs_list_view_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(AppBskyGraphGetListMutesResponse(
          lists: lists,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_feed_get_actor_feeds_request(
  base,
  actor actor,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.feed.getActorFeeds"
  let query = [
    #("actor", option.Some(actor)),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_feed_get_actor_feeds_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use feeds <- decode.field(
          "feeds",
          decode.list(schema.app_bsky_feed_defs_generator_view_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(AppBskyFeedGetActorFeedsResponse(
          feeds: feeds,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_identity_sign_plc_operation_request(
  base,
  data: ComAtprotoIdentitySignPlcOperationRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.identity.signPlcOperation"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #(
          "alsoKnownAs",
          json.nullable(data.also_known_as, json.array(_, json.string)),
        ),
        #(
          "rotationKeys",
          json.nullable(data.rotation_keys, json.array(_, json.string)),
        ),
        #(
          "verificationMethods",
          json.nullable(data.verification_methods, fn(data) { data }),
        ),
        #("token", json.nullable(data.token_, json.string)),
        #("services", json.nullable(data.services, fn(data) { data })),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_identity_sign_plc_operation_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use operation <- decode.field("operation", utils.dynamic_to_json())
        decode.success(ComAtprotoIdentitySignPlcOperationResponse(
          operation: operation,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_moderation_update_actor_access_request(
  base,
  data: ChatBskyModerationUpdateActorAccessRequest,
) {
  let method = http.Post
  let path = "/xrpc/chat.bsky.moderation.updateActorAccess"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("allowAccess", json.bool(data.allow_access)),
        #("ref", json.nullable(data.ref, json.string)),
        #("actor", json.string(data.actor)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn chat_bsky_moderation_update_actor_access_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_get_account_invite_codes_request(
  base,
  include_used include_used,
  create_available create_available,
) {
  let method = http.Get
  let path = "/xrpc/com.atproto.server.getAccountInviteCodes"
  let query = [
    #("include_used", option.map(include_used, bool.to_string)),
    #("create_available", option.map(create_available, bool.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_server_get_account_invite_codes_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use codes <- decode.field(
          "codes",
          decode.list(schema.com_atproto_server_defs_invite_code_decoder()),
        )
        decode.success(ComAtprotoServerGetAccountInviteCodesResponse(
          codes: codes,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_unmute_actor_request(
  base,
  data: AppBskyGraphUnmuteActorRequest,
) {
  let method = http.Post
  let path = "/xrpc/app.bsky.graph.unmuteActor"
  let query = []
  let body =
    utils.json_to_bits(utils.object([#("actor", json.string(data.actor))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn app_bsky_graph_unmute_actor_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_admin_update_account_handle_request(
  base,
  data: ComAtprotoAdminUpdateAccountHandleRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.admin.updateAccountHandle"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("handle", json.string(data.handle)),
        #("did", json.string(data.did)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_admin_update_account_handle_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_convo_get_convo_for_members_request(base, members members) {
  let method = http.Get
  let path = "/xrpc/chat.bsky.convo.getConvoForMembers"
  let query = [
    #(
      "members",
      option.Some(fn(_) { panic as "query parameter is not supported" }(members)),
    ),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn chat_bsky_convo_get_convo_for_members_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use convo <- decode.field(
          "convo",
          schema.chat_bsky_convo_defs_convo_view_decoder(),
        )
        decode.success(ChatBskyConvoGetConvoForMembersResponse(convo: convo))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_get_relationships_request(
  base,
  actor actor,
  others others,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.graph.getRelationships"
  let query = [
    #("actor", option.Some(actor)),
    #(
      "others",
      option.map(others, fn(_) { panic as "query parameter is not supported" }),
    ),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_graph_get_relationships_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use actor <- decode.optional_field(
          "actor",
          None,
          decode.optional(decode.string),
        )
        use relationships <- decode.field(
          "relationships",
          decode.list(utils.dynamic_to_json()),
        )
        decode.success(AppBskyGraphGetRelationshipsResponse(
          actor: actor,
          relationships: relationships,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_convo_accept_convo_request(
  base,
  data: ChatBskyConvoAcceptConvoRequest,
) {
  let method = http.Post
  let path = "/xrpc/chat.bsky.convo.acceptConvo"
  let query = []
  let body =
    utils.json_to_bits(utils.object([#("convoId", json.string(data.convo_id))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn chat_bsky_convo_accept_convo_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use rev <- decode.optional_field(
          "rev",
          None,
          decode.optional(decode.string),
        )
        decode.success(ChatBskyConvoAcceptConvoResponse(rev: rev))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_request_email_confirmation_request(base) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.requestEmailConfirmation"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_server_request_email_confirmation_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_label_query_labels_request(
  base,
  uri_patterns uri_patterns,
  sources sources,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/com.atproto.label.queryLabels"
  let query = [
    #(
      "uri_patterns",
      option.Some(fn(_) { panic as "query parameter is not supported" }(
        uri_patterns,
      )),
    ),
    #(
      "sources",
      option.map(sources, fn(_) { panic as "query parameter is not supported" }),
    ),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_label_query_labels_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use labels <- decode.field(
          "labels",
          decode.list(schema.com_atproto_label_defs_label_decoder()),
        )
        decode.success(ComAtprotoLabelQueryLabelsResponse(
          cursor: cursor,
          labels: labels,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_set_query_sets_request(
  base,
  limit limit,
  cursor cursor,
  name_prefix name_prefix,
  sort_by sort_by,
  sort_direction sort_direction,
) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.set.querySets"
  let query = [
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
    #("name_prefix", name_prefix),
    #("sort_by", sort_by),
    #("sort_direction", sort_direction),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_set_query_sets_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use sets <- decode.field(
          "sets",
          decode.list(schema.tools_ozone_set_defs_set_view_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(ToolsOzoneSetQuerySetsResponse(
          sets: sets,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_communication_update_template_request(
  base,
  data: ToolsOzoneCommunicationUpdateTemplateRequest,
) {
  let method = http.Post
  let path = "/xrpc/tools.ozone.communication.updateTemplate"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("contentMarkdown", json.nullable(data.content_markdown, json.string)),
        #("name", json.nullable(data.name, json.string)),
        #("subject", json.nullable(data.subject, json.string)),
        #("lang", json.nullable(data.lang, json.string)),
        #("updatedBy", json.nullable(data.updated_by, json.string)),
        #("id", json.string(data.id)),
        #("disabled", json.nullable(data.disabled, json.bool)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn tools_ozone_communication_update_template_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(
        body,
        schema.tools_ozone_communication_defs_template_view_decoder(),
      )
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_set_get_values_request(
  base,
  name name,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.set.getValues"
  let query = [
    #("name", option.Some(name)),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_set_get_values_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use set <- decode.field(
          "set",
          schema.tools_ozone_set_defs_set_view_decoder(),
        )
        use values <- decode.field("values", decode.list(decode.string))
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(ToolsOzoneSetGetValuesResponse(
          set: set,
          values: values,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_get_mutes_request(base, limit limit, cursor cursor) {
  let method = http.Get
  let path = "/xrpc/app.bsky.graph.getMutes"
  let query = [
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_graph_get_mutes_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use mutes <- decode.field(
          "mutes",
          decode.list(schema.app_bsky_actor_defs_profile_view_decoder()),
        )
        decode.success(AppBskyGraphGetMutesResponse(
          cursor: cursor,
          mutes: mutes,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_identity_resolve_identity_request(
  base,
  identifier identifier,
) {
  let method = http.Get
  let path = "/xrpc/com.atproto.identity.resolveIdentity"
  let query = [#("identifier", option.Some(identifier))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_identity_resolve_identity_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(
        body,
        schema.com_atproto_identity_defs_identity_info_decoder(),
      )
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_moderation_get_event_request(base, id id) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.moderation.getEvent"
  let query = [#("id", option.Some(int.to_string(id)))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_moderation_get_event_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(
        body,
        schema.tools_ozone_moderation_defs_mod_event_view_detail_decoder(),
      )
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_sync_list_hosts_request(base, limit limit, cursor cursor) {
  let method = http.Get
  let path = "/xrpc/com.atproto.sync.listHosts"
  let query = [
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_sync_list_hosts_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use hosts <- decode.field(
          "hosts",
          decode.list(schema.com_atproto_sync_list_hosts_host_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(ComAtprotoSyncListHostsResponse(
          hosts: hosts,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_feed_get_feed_generators_request(base, feeds feeds) {
  let method = http.Get
  let path = "/xrpc/app.bsky.feed.getFeedGenerators"
  let query = [
    #(
      "feeds",
      option.Some(fn(_) { panic as "query parameter is not supported" }(feeds)),
    ),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_feed_get_feed_generators_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use feeds <- decode.field(
          "feeds",
          decode.list(schema.app_bsky_feed_defs_generator_view_decoder()),
        )
        decode.success(AppBskyFeedGetFeedGeneratorsResponse(feeds: feeds))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_feed_get_feed_request(
  base,
  feed feed,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.feed.getFeed"
  let query = [
    #("feed", option.Some(feed)),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_feed_get_feed_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use feed <- decode.field(
          "feed",
          decode.list(schema.app_bsky_feed_defs_feed_view_post_decoder()),
        )
        decode.success(AppBskyFeedGetFeedResponse(cursor: cursor, feed: feed))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_get_session_request(base) {
  let method = http.Get
  let path = "/xrpc/com.atproto.server.getSession"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_server_get_session_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use email_confirmed <- decode.optional_field(
          "emailConfirmed",
          None,
          decode.optional(decode.bool),
        )
        use active <- decode.optional_field(
          "active",
          None,
          decode.optional(decode.bool),
        )
        use handle <- decode.field("handle", decode.string)
        use status <- decode.optional_field(
          "status",
          None,
          decode.optional(decode.string),
        )
        use email_auth_factor <- decode.optional_field(
          "emailAuthFactor",
          None,
          decode.optional(decode.bool),
        )
        use did_doc <- decode.optional_field(
          "didDoc",
          None,
          decode.optional(utils.dynamic_to_json()),
        )
        use email <- decode.optional_field(
          "email",
          None,
          decode.optional(decode.string),
        )
        use did <- decode.field("did", decode.string)
        decode.success(ComAtprotoServerGetSessionResponse(
          email_confirmed: email_confirmed,
          active: active,
          handle: handle,
          status: status,
          email_auth_factor: email_auth_factor,
          did_doc: did_doc,
          email: email,
          did: did,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_set_delete_set_request(
  base,
  data: ToolsOzoneSetDeleteSetRequest,
) {
  let method = http.Post
  let path = "/xrpc/tools.ozone.set.deleteSet"
  let query = []
  let body =
    utils.json_to_bits(utils.object([#("name", json.string(data.name))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn tools_ozone_set_delete_set_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use unknown <- decode.optional_field(
          "_unknown_",
          None,
          decode.optional(decode.dict(decode.string, utils.dynamic_to_json())),
        )
        decode.success(ToolsOzoneSetDeleteSetResponse(unknown: unknown))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_get_starter_packs_request(base, uris uris) {
  let method = http.Get
  let path = "/xrpc/app.bsky.graph.getStarterPacks"
  let query = [
    #(
      "uris",
      option.Some(fn(_) { panic as "query parameter is not supported" }(uris)),
    ),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_graph_get_starter_packs_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use starter_packs <- decode.field(
          "starterPacks",
          decode.list(
            schema.app_bsky_graph_defs_starter_pack_view_basic_decoder(),
          ),
        )
        decode.success(AppBskyGraphGetStarterPacksResponse(
          starter_packs: starter_packs,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_unmute_actor_list_request(
  base,
  data: AppBskyGraphUnmuteActorListRequest,
) {
  let method = http.Post
  let path = "/xrpc/app.bsky.graph.unmuteActorList"
  let query = []
  let body =
    utils.json_to_bits(utils.object([#("list", json.string(data.list))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn app_bsky_graph_unmute_actor_list_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_mute_thread_request(
  base,
  data: AppBskyGraphMuteThreadRequest,
) {
  let method = http.Post
  let path = "/xrpc/app.bsky.graph.muteThread"
  let query = []
  let body =
    utils.json_to_bits(utils.object([#("root", json.string(data.root))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn app_bsky_graph_mute_thread_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_sync_request_crawl_request(
  base,
  data: ComAtprotoSyncRequestCrawlRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.sync.requestCrawl"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([#("hostname", json.string(data.hostname))]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_sync_request_crawl_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_set_delete_values_request(
  base,
  data: ToolsOzoneSetDeleteValuesRequest,
) {
  let method = http.Post
  let path = "/xrpc/tools.ozone.set.deleteValues"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("values", json.array(_, json.string)(data.values)),
        #("name", json.string(data.name)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn tools_ozone_set_delete_values_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_moderation_query_events_request(
  base,
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
  let method = http.Get
  let path = "/xrpc/tools.ozone.moderation.queryEvents"
  let query = [
    #(
      "types",
      option.map(types, fn(_) { panic as "query parameter is not supported" }),
    ),
    #("created_by", created_by),
    #("sort_direction", sort_direction),
    #("created_after", created_after),
    #("created_before", created_before),
    #("subject", subject),
    #(
      "collections",
      option.map(collections, fn(_) {
        panic as "query parameter is not supported"
      }),
    ),
    #("subject_type", subject_type),
    #(
      "include_all_user_records",
      option.map(include_all_user_records, bool.to_string),
    ),
    #("limit", option.map(limit, int.to_string)),
    #("has_comment", option.map(has_comment, bool.to_string)),
    #("comment", comment),
    #(
      "added_labels",
      option.map(added_labels, fn(_) {
        panic as "query parameter is not supported"
      }),
    ),
    #(
      "removed_labels",
      option.map(removed_labels, fn(_) {
        panic as "query parameter is not supported"
      }),
    ),
    #(
      "added_tags",
      option.map(added_tags, fn(_) {
        panic as "query parameter is not supported"
      }),
    ),
    #(
      "removed_tags",
      option.map(removed_tags, fn(_) {
        panic as "query parameter is not supported"
      }),
    ),
    #(
      "report_types",
      option.map(report_types, fn(_) {
        panic as "query parameter is not supported"
      }),
    ),
    #(
      "policies",
      option.map(policies, fn(_) { panic as "query parameter is not supported" }),
    ),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_moderation_query_events_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use events <- decode.field(
          "events",
          decode.list(
            schema.tools_ozone_moderation_defs_mod_event_view_decoder(),
          ),
        )
        decode.success(ToolsOzoneModerationQueryEventsResponse(
          cursor: cursor,
          events: events,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_repo_list_missing_blobs_request(
  base,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/com.atproto.repo.listMissingBlobs"
  let query = [
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_repo_list_missing_blobs_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use blobs <- decode.field(
          "blobs",
          decode.list(
            schema.com_atproto_repo_list_missing_blobs_record_blob_decoder(),
          ),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(ComAtprotoRepoListMissingBlobsResponse(
          blobs: blobs,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_feed_get_list_feed_request(
  base,
  list list,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.feed.getListFeed"
  let query = [
    #("list", option.Some(list)),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_feed_get_list_feed_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use feed <- decode.field(
          "feed",
          decode.list(schema.app_bsky_feed_defs_feed_view_post_decoder()),
        )
        decode.success(AppBskyFeedGetListFeedResponse(
          cursor: cursor,
          feed: feed,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_notification_register_push_request(
  base,
  data: AppBskyNotificationRegisterPushRequest,
) {
  let method = http.Post
  let path = "/xrpc/app.bsky.notification.registerPush"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("serviceDid", json.string(data.service_did)),
        #("platform", json.string(data.platform)),
        #("token", json.string(data.token_)),
        #("appId", json.string(data.app_id)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn app_bsky_notification_register_push_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_actor_put_preferences_request(
  base,
  data: AppBskyActorPutPreferencesRequest,
) {
  let method = http.Post
  let path = "/xrpc/app.bsky.actor.putPreferences"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #(
          "preferences",
          schema.app_bsky_actor_defs_preferences_encode(data.preferences),
        ),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn app_bsky_actor_put_preferences_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_repo_create_record_request(
  base,
  data: ComAtprotoRepoCreateRecordRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.repo.createRecord"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("swapCommit", json.nullable(data.swap_commit, json.string)),
        #("rkey", json.nullable(data.rkey, json.string)),
        #("record", fn(data) { data }(data.record)),
        #("repo", json.string(data.repo)),
        #("validate", json.nullable(data.validate, json.bool)),
        #("collection", json.string(data.collection)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_repo_create_record_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use validation_status <- decode.optional_field(
          "validationStatus",
          None,
          decode.optional(decode.string),
        )
        use uri <- decode.field("uri", decode.string)
        use commit <- decode.optional_field(
          "commit",
          None,
          decode.optional(schema.com_atproto_repo_defs_commit_meta_decoder()),
        )
        use cid <- decode.field("cid", decode.string)
        decode.success(ComAtprotoRepoCreateRecordResponse(
          validation_status: validation_status,
          uri: uri,
          commit: commit,
          cid: cid,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_delete_account_request(
  base,
  data: ComAtprotoServerDeleteAccountRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.deleteAccount"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("token", json.string(data.token_)),
        #("password", json.string(data.password)),
        #("did", json.string(data.did)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_server_delete_account_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_hosting_get_account_history_request(
  base,
  did did,
  events events,
  cursor cursor,
  limit limit,
) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.hosting.getAccountHistory"
  let query = [
    #("did", option.Some(did)),
    #(
      "events",
      option.map(events, fn(_) { panic as "query parameter is not supported" }),
    ),
    #("cursor", cursor),
    #("limit", option.map(limit, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_hosting_get_account_history_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use events <- decode.field(
          "events",
          decode.list(
            schema.tools_ozone_hosting_get_account_history_event_decoder(),
          ),
        )
        decode.success(ToolsOzoneHostingGetAccountHistoryResponse(
          cursor: cursor,
          events: events,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_admin_update_account_email_request(
  base,
  data: ComAtprotoAdminUpdateAccountEmailRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.admin.updateAccountEmail"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("account", json.string(data.account)),
        #("email", json.string(data.email)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_admin_update_account_email_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_identity_submit_plc_operation_request(
  base,
  data: ComAtprotoIdentitySubmitPlcOperationRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.identity.submitPlcOperation"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([#("operation", fn(data) { data }(data.operation))]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_identity_submit_plc_operation_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_create_invite_codes_request(
  base,
  data: ComAtprotoServerCreateInviteCodesRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.createInviteCodes"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("codeCount", json.int(data.code_count)),
        #("useCount", json.int(data.use_count)),
        #(
          "forAccounts",
          json.nullable(data.for_accounts, json.array(_, json.string)),
        ),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_server_create_invite_codes_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use codes <- decode.field(
          "codes",
          decode.list(
            schema.com_atproto_server_create_invite_codes_account_codes_decoder(),
          ),
        )
        decode.success(ComAtprotoServerCreateInviteCodesResponse(codes: codes))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_convo_update_all_read_request(
  base,
  data: ChatBskyConvoUpdateAllReadRequest,
) {
  let method = http.Post
  let path = "/xrpc/chat.bsky.convo.updateAllRead"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([#("status", json.nullable(data.status, json.string))]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn chat_bsky_convo_update_all_read_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use updated_count <- decode.field("updatedCount", decode.int)
        decode.success(ChatBskyConvoUpdateAllReadResponse(
          updated_count: updated_count,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_actor_search_actors_request(
  base,
  q q,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.actor.searchActors"
  let query = [
    #("q", q),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_actor_search_actors_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use actors <- decode.field(
          "actors",
          decode.list(schema.app_bsky_actor_defs_profile_view_decoder()),
        )
        decode.success(AppBskyActorSearchActorsResponse(
          cursor: cursor,
          actors: actors,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_create_app_password_request(
  base,
  data: ComAtprotoServerCreateAppPasswordRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.createAppPassword"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("name", json.string(data.name)),
        #("privileged", json.nullable(data.privileged, json.bool)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_server_create_app_password_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(
        body,
        schema.com_atproto_server_create_app_password_app_password_decoder(),
      )
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_moderation_get_subjects_request(base, subjects subjects) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.moderation.getSubjects"
  let query = [
    #(
      "subjects",
      option.Some(fn(_) { panic as "query parameter is not supported" }(
        subjects,
      )),
    ),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_moderation_get_subjects_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use subjects <- decode.field(
          "subjects",
          decode.list(schema.tools_ozone_moderation_defs_subject_view_decoder()),
        )
        decode.success(ToolsOzoneModerationGetSubjectsResponse(
          subjects: subjects,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_confirm_email_request(
  base,
  data: ComAtprotoServerConfirmEmailRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.confirmEmail"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("token", json.string(data.token_)),
        #("email", json.string(data.email)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_server_confirm_email_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_get_lists_request(
  base,
  actor actor,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.graph.getLists"
  let query = [
    #("actor", option.Some(actor)),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_graph_get_lists_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use lists <- decode.field(
          "lists",
          decode.list(schema.app_bsky_graph_defs_list_view_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(AppBskyGraphGetListsResponse(
          lists: lists,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_get_followers_request(
  base,
  actor actor,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.graph.getFollowers"
  let query = [
    #("actor", option.Some(actor)),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_graph_get_followers_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use subject <- decode.field(
          "subject",
          schema.app_bsky_actor_defs_profile_view_decoder(),
        )
        use followers <- decode.field(
          "followers",
          decode.list(schema.app_bsky_actor_defs_profile_view_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(AppBskyGraphGetFollowersResponse(
          subject: subject,
          followers: followers,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_sync_get_repo_request(base, did did, since since) {
  let method = http.Get
  let path = "/xrpc/com.atproto.sync.getRepo"
  let query = [#("did", option.Some(did)), #("since", since)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_sync_get_repo_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_set_upsert_set_request(base, data) {
  let method = http.Post
  let path = "/xrpc/tools.ozone.set.upsertSet"
  let query = []
  let body = utils.json_to_bits(schema.tools_ozone_set_defs_set_encode(data))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn tools_ozone_set_upsert_set_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.tools_ozone_set_defs_set_view_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_refresh_session_request(base) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.refreshSession"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_server_refresh_session_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use access_jwt <- decode.field("accessJwt", decode.string)
        use active <- decode.optional_field(
          "active",
          None,
          decode.optional(decode.bool),
        )
        use handle <- decode.field("handle", decode.string)
        use refresh_jwt <- decode.field("refreshJwt", decode.string)
        use status <- decode.optional_field(
          "status",
          None,
          decode.optional(decode.string),
        )
        use did_doc <- decode.optional_field(
          "didDoc",
          None,
          decode.optional(utils.dynamic_to_json()),
        )
        use did <- decode.field("did", decode.string)
        decode.success(ComAtprotoServerRefreshSessionResponse(
          access_jwt: access_jwt,
          active: active,
          handle: handle,
          refresh_jwt: refresh_jwt,
          status: status,
          did_doc: did_doc,
          did: did,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_admin_disable_invite_codes_request(
  base,
  data: ComAtprotoAdminDisableInviteCodesRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.admin.disableInviteCodes"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("codes", json.nullable(data.codes, json.array(_, json.string))),
        #("accounts", json.nullable(data.accounts, json.array(_, json.string))),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_admin_disable_invite_codes_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_sync_get_record_request(
  base,
  did did,
  collection collection,
  rkey rkey,
) {
  let method = http.Get
  let path = "/xrpc/com.atproto.sync.getRecord"
  let query = [
    #("did", option.Some(did)),
    #("collection", option.Some(collection)),
    #("rkey", option.Some(rkey)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_sync_get_record_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_get_blocks_request(base, limit limit, cursor cursor) {
  let method = http.Get
  let path = "/xrpc/app.bsky.graph.getBlocks"
  let query = [
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_graph_get_blocks_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use blocks <- decode.field(
          "blocks",
          decode.list(schema.app_bsky_actor_defs_profile_view_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(AppBskyGraphGetBlocksResponse(
          blocks: blocks,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_video_get_upload_limits_request(base) {
  let method = http.Get
  let path = "/xrpc/app.bsky.video.getUploadLimits"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_video_get_upload_limits_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        use remaining_daily_bytes <- decode.optional_field(
          "remainingDailyBytes",
          None,
          decode.optional(decode.int),
        )
        use error <- decode.optional_field(
          "error",
          None,
          decode.optional(decode.string),
        )
        use can_upload <- decode.field("canUpload", decode.bool)
        use remaining_daily_videos <- decode.optional_field(
          "remainingDailyVideos",
          None,
          decode.optional(decode.int),
        )
        decode.success(AppBskyVideoGetUploadLimitsResponse(
          message: message,
          remaining_daily_bytes: remaining_daily_bytes,
          error: error,
          can_upload: can_upload,
          remaining_daily_videos: remaining_daily_videos,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_mute_actor_request(
  base,
  data: AppBskyGraphMuteActorRequest,
) {
  let method = http.Post
  let path = "/xrpc/app.bsky.graph.muteActor"
  let query = []
  let body =
    utils.json_to_bits(utils.object([#("actor", json.string(data.actor))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn app_bsky_graph_mute_actor_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_convo_get_log_request(base, cursor cursor) {
  let method = http.Get
  let path = "/xrpc/chat.bsky.convo.getLog"
  let query = [#("cursor", cursor)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn chat_bsky_convo_get_log_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use logs <- decode.field("logs", decode.list(utils.dynamic_to_json()))
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(ChatBskyConvoGetLogResponse(logs: logs, cursor: cursor))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_admin_disable_account_invites_request(
  base,
  data: ComAtprotoAdminDisableAccountInvitesRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.admin.disableAccountInvites"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("account", json.string(data.account)),
        #("note", json.nullable(data.note, json.string)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_admin_disable_account_invites_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_feed_get_quotes_request(
  base,
  uri uri,
  cid cid,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.feed.getQuotes"
  let query = [
    #("uri", option.Some(uri)),
    #("cid", cid),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_feed_get_quotes_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use uri <- decode.field("uri", decode.string)
        use posts <- decode.field(
          "posts",
          decode.list(schema.app_bsky_feed_defs_post_view_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use cid <- decode.optional_field(
          "cid",
          None,
          decode.optional(decode.string),
        )
        decode.success(AppBskyFeedGetQuotesResponse(
          uri: uri,
          posts: posts,
          cursor: cursor,
          cid: cid,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_convo_remove_reaction_request(
  base,
  data: ChatBskyConvoRemoveReactionRequest,
) {
  let method = http.Post
  let path = "/xrpc/chat.bsky.convo.removeReaction"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("messageId", json.string(data.message_id)),
        #("value", json.string(data.value)),
        #("convoId", json.string(data.convo_id)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn chat_bsky_convo_remove_reaction_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use message <- decode.field(
          "message",
          schema.chat_bsky_convo_defs_message_view_decoder(),
        )
        decode.success(ChatBskyConvoRemoveReactionResponse(message: message))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_mute_actor_list_request(
  base,
  data: AppBskyGraphMuteActorListRequest,
) {
  let method = http.Post
  let path = "/xrpc/app.bsky.graph.muteActorList"
  let query = []
  let body =
    utils.json_to_bits(utils.object([#("list", json.string(data.list))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn app_bsky_graph_mute_actor_list_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_get_list_blocks_request(base, limit limit, cursor cursor) {
  let method = http.Get
  let path = "/xrpc/app.bsky.graph.getListBlocks"
  let query = [
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_graph_get_list_blocks_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use lists <- decode.field(
          "lists",
          decode.list(schema.app_bsky_graph_defs_list_view_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(AppBskyGraphGetListBlocksResponse(
          lists: lists,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_unmute_thread_request(
  base,
  data: AppBskyGraphUnmuteThreadRequest,
) {
  let method = http.Post
  let path = "/xrpc/app.bsky.graph.unmuteThread"
  let query = []
  let body =
    utils.json_to_bits(utils.object([#("root", json.string(data.root))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn app_bsky_graph_unmute_thread_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_convo_add_reaction_request(
  base,
  data: ChatBskyConvoAddReactionRequest,
) {
  let method = http.Post
  let path = "/xrpc/chat.bsky.convo.addReaction"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("messageId", json.string(data.message_id)),
        #("value", json.string(data.value)),
        #("convoId", json.string(data.convo_id)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn chat_bsky_convo_add_reaction_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use message <- decode.field(
          "message",
          schema.chat_bsky_convo_defs_message_view_decoder(),
        )
        decode.success(ChatBskyConvoAddReactionResponse(message: message))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_moderation_get_actor_metadata_request(base, actor actor) {
  let method = http.Get
  let path = "/xrpc/chat.bsky.moderation.getActorMetadata"
  let query = [#("actor", option.Some(actor))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn chat_bsky_moderation_get_actor_metadata_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use month <- decode.field(
          "month",
          schema.chat_bsky_moderation_get_actor_metadata_metadata_decoder(),
        )
        use all <- decode.field(
          "all",
          schema.chat_bsky_moderation_get_actor_metadata_metadata_decoder(),
        )
        use day <- decode.field(
          "day",
          schema.chat_bsky_moderation_get_actor_metadata_metadata_decoder(),
        )
        decode.success(ChatBskyModerationGetActorMetadataResponse(
          month: month,
          all: all,
          day: day,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_moderation_search_repos_request(
  base,
  q q,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.moderation.searchRepos"
  let query = [
    #("q", q),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_moderation_search_repos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use repos <- decode.field(
          "repos",
          decode.list(schema.tools_ozone_moderation_defs_repo_view_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(ToolsOzoneModerationSearchReposResponse(
          repos: repos,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_actor_get_preferences_request(base) {
  let method = http.Get
  let path = "/xrpc/app.bsky.actor.getPreferences"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_actor_get_preferences_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use preferences <- decode.field(
          "preferences",
          schema.app_bsky_actor_defs_preferences_decoder(),
        )
        decode.success(AppBskyActorGetPreferencesResponse(
          preferences: preferences,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_identity_resolve_did_request(base, did did) {
  let method = http.Get
  let path = "/xrpc/com.atproto.identity.resolveDid"
  let query = [#("did", option.Some(did))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_identity_resolve_did_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use did_doc <- decode.field("didDoc", utils.dynamic_to_json())
        decode.success(ComAtprotoIdentityResolveDidResponse(did_doc: did_doc))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_communication_list_templates_request(base) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.communication.listTemplates"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_communication_list_templates_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use communication_templates <- decode.field(
          "communicationTemplates",
          decode.list(
            schema.tools_ozone_communication_defs_template_view_decoder(),
          ),
        )
        decode.success(ToolsOzoneCommunicationListTemplatesResponse(
          communication_templates: communication_templates,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_feed_search_posts_request(
  base,
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
  let method = http.Get
  let path = "/xrpc/app.bsky.feed.searchPosts"
  let query = [
    #("q", option.Some(q)),
    #("sort", sort),
    #("since", since),
    #("until", until),
    #("mentions", mentions),
    #("author", author),
    #("lang", lang),
    #("domain", domain),
    #("url", url),
    #(
      "tag",
      option.map(tag, fn(_) { panic as "query parameter is not supported" }),
    ),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_feed_search_posts_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use hits_total <- decode.optional_field(
          "hitsTotal",
          None,
          decode.optional(decode.int),
        )
        use posts <- decode.field(
          "posts",
          decode.list(schema.app_bsky_feed_defs_post_view_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(AppBskyFeedSearchPostsResponse(
          hits_total: hits_total,
          posts: posts,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_admin_delete_account_request(
  base,
  data: ComAtprotoAdminDeleteAccountRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.admin.deleteAccount"
  let query = []
  let body = utils.json_to_bits(utils.object([#("did", json.string(data.did))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_admin_delete_account_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_convo_unmute_convo_request(
  base,
  data: ChatBskyConvoUnmuteConvoRequest,
) {
  let method = http.Post
  let path = "/xrpc/chat.bsky.convo.unmuteConvo"
  let query = []
  let body =
    utils.json_to_bits(utils.object([#("convoId", json.string(data.convo_id))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn chat_bsky_convo_unmute_convo_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use convo <- decode.field(
          "convo",
          schema.chat_bsky_convo_defs_convo_view_decoder(),
        )
        decode.success(ChatBskyConvoUnmuteConvoResponse(convo: convo))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_feed_send_interactions_request(
  base,
  data: AppBskyFeedSendInteractionsRequest,
) {
  let method = http.Post
  let path = "/xrpc/app.bsky.feed.sendInteractions"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #(
          "interactions",
          json.array(_, schema.app_bsky_feed_defs_interaction_encode)(
            data.interactions,
          ),
        ),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn app_bsky_feed_send_interactions_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use unknown <- decode.optional_field(
          "_unknown_",
          None,
          decode.optional(decode.dict(decode.string, utils.dynamic_to_json())),
        )
        decode.success(AppBskyFeedSendInteractionsResponse(unknown: unknown))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_check_account_status_request(base) {
  let method = http.Get
  let path = "/xrpc/com.atproto.server.checkAccountStatus"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_server_check_account_status_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use valid_did <- decode.field("validDid", decode.bool)
        use repo_commit <- decode.field("repoCommit", decode.string)
        use private_state_values <- decode.field(
          "privateStateValues",
          decode.int,
        )
        use indexed_records <- decode.field("indexedRecords", decode.int)
        use activated <- decode.field("activated", decode.bool)
        use repo_rev <- decode.field("repoRev", decode.string)
        use imported_blobs <- decode.field("importedBlobs", decode.int)
        use repo_blocks <- decode.field("repoBlocks", decode.int)
        use expected_blobs <- decode.field("expectedBlobs", decode.int)
        decode.success(ComAtprotoServerCheckAccountStatusResponse(
          valid_did: valid_did,
          repo_commit: repo_commit,
          private_state_values: private_state_values,
          indexed_records: indexed_records,
          activated: activated,
          repo_rev: repo_rev,
          imported_blobs: imported_blobs,
          repo_blocks: repo_blocks,
          expected_blobs: expected_blobs,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_setting_list_options_request(
  base,
  limit limit,
  cursor cursor,
  scope scope,
  prefix prefix,
  keys keys,
) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.setting.listOptions"
  let query = [
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
    #("scope", scope),
    #("prefix", prefix),
    #(
      "keys",
      option.map(keys, fn(_) { panic as "query parameter is not supported" }),
    ),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_setting_list_options_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use options <- decode.field(
          "options",
          decode.list(schema.tools_ozone_setting_defs_option_decoder()),
        )
        decode.success(ToolsOzoneSettingListOptionsResponse(
          cursor: cursor,
          options: options,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_feed_describe_feed_generator_request(base) {
  let method = http.Get
  let path = "/xrpc/app.bsky.feed.describeFeedGenerator"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_feed_describe_feed_generator_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use feeds <- decode.field(
          "feeds",
          decode.list(
            schema.app_bsky_feed_describe_feed_generator_feed_decoder(),
          ),
        )
        use links <- decode.optional_field(
          "links",
          None,
          decode.optional(
            schema.app_bsky_feed_describe_feed_generator_links_decoder(),
          ),
        )
        use did <- decode.field("did", decode.string)
        decode.success(AppBskyFeedDescribeFeedGeneratorResponse(
          feeds: feeds,
          links: links,
          did: did,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_sync_list_repos_request(base, limit limit, cursor cursor) {
  let method = http.Get
  let path = "/xrpc/com.atproto.sync.listRepos"
  let query = [
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_sync_list_repos_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use repos <- decode.field(
          "repos",
          decode.list(schema.com_atproto_sync_list_repos_repo_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(ComAtprotoSyncListReposResponse(
          repos: repos,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_signature_find_related_accounts_request(
  base,
  did did,
  cursor cursor,
  limit limit,
) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.signature.findRelatedAccounts"
  let query = [
    #("did", option.Some(did)),
    #("cursor", cursor),
    #("limit", option.map(limit, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_signature_find_related_accounts_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use accounts <- decode.field(
          "accounts",
          decode.list(
            schema.tools_ozone_signature_find_related_accounts_related_account_decoder(),
          ),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(ToolsOzoneSignatureFindRelatedAccountsResponse(
          accounts: accounts,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_activate_account_request(base) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.activateAccount"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_server_activate_account_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_create_session_request(
  base,
  data: ComAtprotoServerCreateSessionRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.createSession"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("allowTakendown", json.nullable(data.allow_takendown, json.bool)),
        #("authFactorToken", json.nullable(data.auth_factor_token, json.string)),
        #("identifier", json.string(data.identifier)),
        #("password", json.string(data.password)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_server_create_session_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use access_jwt <- decode.field("accessJwt", decode.string)
        use email_confirmed <- decode.optional_field(
          "emailConfirmed",
          None,
          decode.optional(decode.bool),
        )
        use active <- decode.optional_field(
          "active",
          None,
          decode.optional(decode.bool),
        )
        use handle <- decode.field("handle", decode.string)
        use refresh_jwt <- decode.field("refreshJwt", decode.string)
        use status <- decode.optional_field(
          "status",
          None,
          decode.optional(decode.string),
        )
        use email_auth_factor <- decode.optional_field(
          "emailAuthFactor",
          None,
          decode.optional(decode.bool),
        )
        use did_doc <- decode.optional_field(
          "didDoc",
          None,
          decode.optional(utils.dynamic_to_json()),
        )
        use email <- decode.optional_field(
          "email",
          None,
          decode.optional(decode.string),
        )
        use did <- decode.field("did", decode.string)
        decode.success(ComAtprotoServerCreateSessionResponse(
          access_jwt: access_jwt,
          email_confirmed: email_confirmed,
          active: active,
          handle: handle,
          refresh_jwt: refresh_jwt,
          status: status,
          email_auth_factor: email_auth_factor,
          did_doc: did_doc,
          email: email,
          did: did,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_identity_update_handle_request(
  base,
  data: ComAtprotoIdentityUpdateHandleRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.identity.updateHandle"
  let query = []
  let body =
    utils.json_to_bits(utils.object([#("handle", json.string(data.handle))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_identity_update_handle_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_request_email_update_request(base) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.requestEmailUpdate"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_server_request_email_update_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use token_required <- decode.field("tokenRequired", decode.bool)
        decode.success(ComAtprotoServerRequestEmailUpdateResponse(
          token_required: token_required,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_list_app_passwords_request(base) {
  let method = http.Get
  let path = "/xrpc/com.atproto.server.listAppPasswords"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_server_list_app_passwords_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use passwords <- decode.field(
          "passwords",
          decode.list(
            schema.com_atproto_server_list_app_passwords_app_password_decoder(),
          ),
        )
        decode.success(ComAtprotoServerListAppPasswordsResponse(
          passwords: passwords,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_admin_update_account_password_request(
  base,
  data: ComAtprotoAdminUpdateAccountPasswordRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.admin.updateAccountPassword"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("password", json.string(data.password)),
        #("did", json.string(data.did)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_admin_update_account_password_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_feed_get_likes_request(
  base,
  uri uri,
  cid cid,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.feed.getLikes"
  let query = [
    #("uri", option.Some(uri)),
    #("cid", cid),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_feed_get_likes_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use uri <- decode.field("uri", decode.string)
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use likes <- decode.field(
          "likes",
          decode.list(schema.app_bsky_feed_get_likes_like_decoder()),
        )
        use cid <- decode.optional_field(
          "cid",
          None,
          decode.optional(decode.string),
        )
        decode.success(AppBskyFeedGetLikesResponse(
          uri: uri,
          cursor: cursor,
          likes: likes,
          cid: cid,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_feed_get_suggested_feeds_request(
  base,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.feed.getSuggestedFeeds"
  let query = [
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_feed_get_suggested_feeds_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use feeds <- decode.field(
          "feeds",
          decode.list(schema.app_bsky_feed_defs_generator_view_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(AppBskyFeedGetSuggestedFeedsResponse(
          feeds: feeds,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_communication_create_template_request(
  base,
  data: ToolsOzoneCommunicationCreateTemplateRequest,
) {
  let method = http.Post
  let path = "/xrpc/tools.ozone.communication.createTemplate"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("contentMarkdown", json.string(data.content_markdown)),
        #("name", json.string(data.name)),
        #("subject", json.string(data.subject)),
        #("lang", json.nullable(data.lang, json.string)),
        #("createdBy", json.nullable(data.created_by, json.string)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn tools_ozone_communication_create_template_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(
        body,
        schema.tools_ozone_communication_defs_template_view_decoder(),
      )
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_deactivate_account_request(
  base,
  data: ComAtprotoServerDeactivateAccountRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.deactivateAccount"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("deleteAfter", json.nullable(data.delete_after, json.string)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_server_deactivate_account_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_admin_search_accounts_request(
  base,
  email email,
  cursor cursor,
  limit limit,
) {
  let method = http.Get
  let path = "/xrpc/com.atproto.admin.searchAccounts"
  let query = [
    #("email", email),
    #("cursor", cursor),
    #("limit", option.map(limit, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_admin_search_accounts_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use accounts <- decode.field(
          "accounts",
          decode.list(schema.com_atproto_admin_defs_account_view_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(ComAtprotoAdminSearchAccountsResponse(
          accounts: accounts,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_server_get_config_request(base) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.server.getConfig"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_server_get_config_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use appview <- decode.optional_field(
          "appview",
          None,
          decode.optional(
            schema.tools_ozone_server_get_config_service_config_decoder(),
          ),
        )
        use verifier_did <- decode.optional_field(
          "verifierDid",
          None,
          decode.optional(decode.string),
        )
        use viewer <- decode.optional_field(
          "viewer",
          None,
          decode.optional(
            schema.tools_ozone_server_get_config_viewer_config_decoder(),
          ),
        )
        use blob_divert <- decode.optional_field(
          "blobDivert",
          None,
          decode.optional(
            schema.tools_ozone_server_get_config_service_config_decoder(),
          ),
        )
        use chat <- decode.optional_field(
          "chat",
          None,
          decode.optional(
            schema.tools_ozone_server_get_config_service_config_decoder(),
          ),
        )
        use pds <- decode.optional_field(
          "pds",
          None,
          decode.optional(
            schema.tools_ozone_server_get_config_service_config_decoder(),
          ),
        )
        decode.success(ToolsOzoneServerGetConfigResponse(
          appview: appview,
          verifier_did: verifier_did,
          viewer: viewer,
          blob_divert: blob_divert,
          chat: chat,
          pds: pds,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_admin_update_account_signing_key_request(
  base,
  data: ComAtprotoAdminUpdateAccountSigningKeyRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.admin.updateAccountSigningKey"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("signingKey", json.string(data.signing_key)),
        #("did", json.string(data.did)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_admin_update_account_signing_key_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_get_list_request(
  base,
  list list,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.graph.getList"
  let query = [
    #("list", option.Some(list)),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_graph_get_list_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use items <- decode.field(
          "items",
          decode.list(schema.app_bsky_graph_defs_list_item_view_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use list <- decode.field(
          "list",
          schema.app_bsky_graph_defs_list_view_decoder(),
        )
        decode.success(AppBskyGraphGetListResponse(
          items: items,
          cursor: cursor,
          list: list,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_revoke_app_password_request(
  base,
  data: ComAtprotoServerRevokeAppPasswordRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.revokeAppPassword"
  let query = []
  let body =
    utils.json_to_bits(utils.object([#("name", json.string(data.name))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_server_revoke_app_password_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_convo_get_convo_request(base, convo_id convo_id) {
  let method = http.Get
  let path = "/xrpc/chat.bsky.convo.getConvo"
  let query = [#("convo_id", option.Some(convo_id))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn chat_bsky_convo_get_convo_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use convo <- decode.field(
          "convo",
          schema.chat_bsky_convo_defs_convo_view_decoder(),
        )
        decode.success(ChatBskyConvoGetConvoResponse(convo: convo))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_repo_get_record_request(
  base,
  repo repo,
  collection collection,
  rkey rkey,
  cid cid,
) {
  let method = http.Get
  let path = "/xrpc/com.atproto.repo.getRecord"
  let query = [
    #("repo", option.Some(repo)),
    #("collection", option.Some(collection)),
    #("rkey", option.Some(rkey)),
    #("cid", cid),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_repo_get_record_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use uri <- decode.field("uri", decode.string)
        use value <- decode.field("value", utils.dynamic_to_json())
        use cid <- decode.optional_field(
          "cid",
          None,
          decode.optional(decode.string),
        )
        decode.success(ComAtprotoRepoGetRecordResponse(
          uri: uri,
          value: value,
          cid: cid,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_reserve_signing_key_request(
  base,
  data: ComAtprotoServerReserveSigningKeyRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.reserveSigningKey"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([#("did", json.nullable(data.did, json.string))]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_server_reserve_signing_key_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use signing_key <- decode.field("signingKey", decode.string)
        decode.success(ComAtprotoServerReserveSigningKeyResponse(
          signing_key: signing_key,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_create_invite_code_request(
  base,
  data: ComAtprotoServerCreateInviteCodeRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.createInviteCode"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("forAccount", json.nullable(data.for_account, json.string)),
        #("useCount", json.int(data.use_count)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_server_create_invite_code_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use code <- decode.field("code", decode.string)
        decode.success(ComAtprotoServerCreateInviteCodeResponse(code: code))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_sync_notify_of_update_request(
  base,
  data: ComAtprotoSyncNotifyOfUpdateRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.sync.notifyOfUpdate"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([#("hostname", json.string(data.hostname))]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_sync_notify_of_update_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_convo_mute_convo_request(
  base,
  data: ChatBskyConvoMuteConvoRequest,
) {
  let method = http.Post
  let path = "/xrpc/chat.bsky.convo.muteConvo"
  let query = []
  let body =
    utils.json_to_bits(utils.object([#("convoId", json.string(data.convo_id))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn chat_bsky_convo_mute_convo_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use convo <- decode.field(
          "convo",
          schema.chat_bsky_convo_defs_convo_view_decoder(),
        )
        decode.success(ChatBskyConvoMuteConvoResponse(convo: convo))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_team_add_member_request(
  base,
  data: ToolsOzoneTeamAddMemberRequest,
) {
  let method = http.Post
  let path = "/xrpc/tools.ozone.team.addMember"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("role", json.string(data.role)),
        #("did", json.string(data.did)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn tools_ozone_team_add_member_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.tools_ozone_team_defs_member_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_setting_remove_options_request(
  base,
  data: ToolsOzoneSettingRemoveOptionsRequest,
) {
  let method = http.Post
  let path = "/xrpc/tools.ozone.setting.removeOptions"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("keys", json.array(_, json.string)(data.keys)),
        #("scope", json.string(data.scope)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn tools_ozone_setting_remove_options_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use unknown <- decode.optional_field(
          "_unknown_",
          None,
          decode.optional(decode.dict(decode.string, utils.dynamic_to_json())),
        )
        decode.success(ToolsOzoneSettingRemoveOptionsResponse(unknown: unknown))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_convo_get_messages_request(
  base,
  convo_id convo_id,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/chat.bsky.convo.getMessages"
  let query = [
    #("convo_id", option.Some(convo_id)),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn chat_bsky_convo_get_messages_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use messages <- decode.field(
          "messages",
          decode.list(utils.dynamic_to_json()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(ChatBskyConvoGetMessagesResponse(
          messages: messages,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_team_list_members_request(
  base,
  q q,
  disabled disabled,
  roles roles,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.team.listMembers"
  let query = [
    #("q", q),
    #("disabled", option.map(disabled, bool.to_string)),
    #(
      "roles",
      option.map(roles, fn(_) { panic as "query parameter is not supported" }),
    ),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_team_list_members_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use members <- decode.field(
          "members",
          decode.list(schema.tools_ozone_team_defs_member_decoder()),
        )
        decode.success(ToolsOzoneTeamListMembersResponse(
          cursor: cursor,
          members: members,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_convo_leave_convo_request(
  base,
  data: ChatBskyConvoLeaveConvoRequest,
) {
  let method = http.Post
  let path = "/xrpc/chat.bsky.convo.leaveConvo"
  let query = []
  let body =
    utils.json_to_bits(utils.object([#("convoId", json.string(data.convo_id))]))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn chat_bsky_convo_leave_convo_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use rev <- decode.field("rev", decode.string)
        use convo_id <- decode.field("convoId", decode.string)
        decode.success(ChatBskyConvoLeaveConvoResponse(
          rev: rev,
          convo_id: convo_id,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_identity_refresh_identity_request(
  base,
  data: ComAtprotoIdentityRefreshIdentityRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.identity.refreshIdentity"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([#("identifier", json.string(data.identifier))]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_identity_refresh_identity_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(
        body,
        schema.com_atproto_identity_defs_identity_info_decoder(),
      )
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_moderation_get_message_context_request(
  base,
  convo_id convo_id,
  message_id message_id,
  before before,
  after after,
) {
  let method = http.Get
  let path = "/xrpc/chat.bsky.moderation.getMessageContext"
  let query = [
    #("convo_id", convo_id),
    #("message_id", option.Some(message_id)),
    #("before", option.map(before, int.to_string)),
    #("after", option.map(after, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn chat_bsky_moderation_get_message_context_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use messages <- decode.field(
          "messages",
          decode.list(utils.dynamic_to_json()),
        )
        decode.success(ChatBskyModerationGetMessageContextResponse(
          messages: messages,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_search_starter_packs_request(
  base,
  q q,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.graph.searchStarterPacks"
  let query = [
    #("q", option.Some(q)),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_graph_search_starter_packs_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use starter_packs <- decode.field(
          "starterPacks",
          decode.list(
            schema.app_bsky_graph_defs_starter_pack_view_basic_decoder(),
          ),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(AppBskyGraphSearchStarterPacksResponse(
          starter_packs: starter_packs,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_sync_get_blocks_request(base, did did, cids cids) {
  let method = http.Get
  let path = "/xrpc/com.atproto.sync.getBlocks"
  let query = [
    #("did", option.Some(did)),
    #(
      "cids",
      option.Some(fn(_) { panic as "query parameter is not supported" }(cids)),
    ),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_sync_get_blocks_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_actor_get_suggestions_request(base, limit limit, cursor cursor) {
  let method = http.Get
  let path = "/xrpc/app.bsky.actor.getSuggestions"
  let query = [
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_actor_get_suggestions_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use rec_id <- decode.optional_field(
          "recId",
          None,
          decode.optional(decode.int),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use actors <- decode.field(
          "actors",
          decode.list(schema.app_bsky_actor_defs_profile_view_decoder()),
        )
        decode.success(AppBskyActorGetSuggestionsResponse(
          rec_id: rec_id,
          cursor: cursor,
          actors: actors,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_graph_get_starter_pack_request(base, starter_pack starter_pack) {
  let method = http.Get
  let path = "/xrpc/app.bsky.graph.getStarterPack"
  let query = [#("starter_pack", option.Some(starter_pack))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_graph_get_starter_pack_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use starter_pack <- decode.field(
          "starterPack",
          schema.app_bsky_graph_defs_starter_pack_view_decoder(),
        )
        decode.success(AppBskyGraphGetStarterPackResponse(
          starter_pack: starter_pack,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_repo_upload_blob_request(base) {
  let method = http.Post
  let path = "/xrpc/com.atproto.repo.uploadBlob"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_repo_upload_blob_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use blob <- decode.field("blob", decode.string)
        decode.success(ComAtprotoRepoUploadBlobResponse(blob: blob))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_update_email_request(
  base,
  data: ComAtprotoServerUpdateEmailRequest,
) {
  let method = http.Post
  let path = "/xrpc/com.atproto.server.updateEmail"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #("emailAuthFactor", json.nullable(data.email_auth_factor, json.bool)),
        #("token", json.nullable(data.token_, json.string)),
        #("email", json.string(data.email)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn com_atproto_server_update_email_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_repo_list_records_request(
  base,
  repo repo,
  collection collection,
  limit limit,
  cursor cursor,
  reverse reverse,
) {
  let method = http.Get
  let path = "/xrpc/com.atproto.repo.listRecords"
  let query = [
    #("repo", option.Some(repo)),
    #("collection", option.Some(collection)),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
    #("reverse", option.map(reverse, bool.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_repo_list_records_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use records <- decode.field(
          "records",
          decode.list(schema.com_atproto_repo_list_records_record_decoder()),
        )
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        decode.success(ComAtprotoRepoListRecordsResponse(
          records: records,
          cursor: cursor,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_repo_describe_repo_request(base, repo repo) {
  let method = http.Get
  let path = "/xrpc/com.atproto.repo.describeRepo"
  let query = [#("repo", option.Some(repo))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_repo_describe_repo_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use handle <- decode.field("handle", decode.string)
        use collections <- decode.field(
          "collections",
          decode.list(decode.string),
        )
        use handle_is_correct <- decode.field("handleIsCorrect", decode.bool)
        use did_doc <- decode.field("didDoc", utils.dynamic_to_json())
        use did <- decode.field("did", decode.string)
        decode.success(ComAtprotoRepoDescribeRepoResponse(
          handle: handle,
          collections: collections,
          handle_is_correct: handle_is_correct,
          did_doc: did_doc,
          did: did,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_admin_get_subject_status_request(
  base,
  did did,
  uri uri,
  blob blob,
) {
  let method = http.Get
  let path = "/xrpc/com.atproto.admin.getSubjectStatus"
  let query = [#("did", did), #("uri", uri), #("blob", blob)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_admin_get_subject_status_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use takedown <- decode.optional_field(
          "takedown",
          None,
          decode.optional(schema.com_atproto_admin_defs_status_attr_decoder()),
        )
        use subject <- decode.field("subject", utils.dynamic_to_json())
        use deactivated <- decode.optional_field(
          "deactivated",
          None,
          decode.optional(schema.com_atproto_admin_defs_status_attr_decoder()),
        )
        decode.success(ComAtprotoAdminGetSubjectStatusResponse(
          takedown: takedown,
          subject: subject,
          deactivated: deactivated,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_feed_get_feed_generator_request(base, feed feed) {
  let method = http.Get
  let path = "/xrpc/app.bsky.feed.getFeedGenerator"
  let query = [#("feed", option.Some(feed))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_feed_get_feed_generator_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use view <- decode.field(
          "view",
          schema.app_bsky_feed_defs_generator_view_decoder(),
        )
        use is_valid <- decode.field("isValid", decode.bool)
        use is_online <- decode.field("isOnline", decode.bool)
        decode.success(AppBskyFeedGetFeedGeneratorResponse(
          view: view,
          is_valid: is_valid,
          is_online: is_online,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_sync_get_repo_status_request(base, did did) {
  let method = http.Get
  let path = "/xrpc/com.atproto.sync.getRepoStatus"
  let query = [#("did", option.Some(did))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_sync_get_repo_status_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use rev <- decode.optional_field(
          "rev",
          None,
          decode.optional(decode.string),
        )
        use active <- decode.field("active", decode.bool)
        use status <- decode.optional_field(
          "status",
          None,
          decode.optional(decode.string),
        )
        use did <- decode.field("did", decode.string)
        decode.success(ComAtprotoSyncGetRepoStatusResponse(
          rev: rev,
          active: active,
          status: status,
          did: did,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_server_describe_server_request(base) {
  let method = http.Get
  let path = "/xrpc/com.atproto.server.describeServer"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_server_describe_server_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use contact <- decode.optional_field(
          "contact",
          None,
          decode.optional(
            schema.com_atproto_server_describe_server_contact_decoder(),
          ),
        )
        use phone_verification_required <- decode.optional_field(
          "phoneVerificationRequired",
          None,
          decode.optional(decode.bool),
        )
        use invite_code_required <- decode.optional_field(
          "inviteCodeRequired",
          None,
          decode.optional(decode.bool),
        )
        use links <- decode.optional_field(
          "links",
          None,
          decode.optional(
            schema.com_atproto_server_describe_server_links_decoder(),
          ),
        )
        use available_user_domains <- decode.field(
          "availableUserDomains",
          decode.list(decode.string),
        )
        use did <- decode.field("did", decode.string)
        decode.success(ComAtprotoServerDescribeServerResponse(
          contact: contact,
          phone_verification_required: phone_verification_required,
          invite_code_required: invite_code_required,
          links: links,
          available_user_domains: available_user_domains,
          did: did,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn app_bsky_feed_get_feed_skeleton_request(
  base,
  feed feed,
  limit limit,
  cursor cursor,
) {
  let method = http.Get
  let path = "/xrpc/app.bsky.feed.getFeedSkeleton"
  let query = [
    #("feed", option.Some(feed)),
    #("limit", option.map(limit, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn app_bsky_feed_get_feed_skeleton_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use feed <- decode.field(
          "feed",
          decode.list(schema.app_bsky_feed_defs_skeleton_feed_post_decoder()),
        )
        decode.success(AppBskyFeedGetFeedSkeletonResponse(
          cursor: cursor,
          feed: feed,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn chat_bsky_convo_send_message_request(
  base,
  data: ChatBskyConvoSendMessageRequest,
) {
  let method = http.Post
  let path = "/xrpc/chat.bsky.convo.sendMessage"
  let query = []
  let body =
    utils.json_to_bits(
      utils.object([
        #(
          "message",
          schema.chat_bsky_convo_defs_message_input_encode(data.message),
        ),
        #("convoId", json.string(data.convo_id)),
      ]),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn chat_bsky_convo_send_message_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.chat_bsky_convo_defs_message_view_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn com_atproto_identity_request_plc_operation_signature_request(base) {
  let method = http.Post
  let path = "/xrpc/com.atproto.identity.requestPlcOperationSignature"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn com_atproto_identity_request_plc_operation_signature_response(response) {
  let response.Response(status:, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn tools_ozone_verification_list_verifications_request(
  base,
  cursor cursor,
  limit limit,
  created_after created_after,
  created_before created_before,
  issuers issuers,
  subjects subjects,
  sort_direction sort_direction,
  is_revoked is_revoked,
) {
  let method = http.Get
  let path = "/xrpc/tools.ozone.verification.listVerifications"
  let query = [
    #("cursor", cursor),
    #("limit", option.map(limit, int.to_string)),
    #("created_after", created_after),
    #("created_before", created_before),
    #(
      "issuers",
      option.map(issuers, fn(_) { panic as "query parameter is not supported" }),
    ),
    #(
      "subjects",
      option.map(subjects, fn(_) { panic as "query parameter is not supported" }),
    ),
    #("sort_direction", sort_direction),
    #("is_revoked", option.map(is_revoked, bool.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn tools_ozone_verification_list_verifications_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use cursor <- decode.optional_field(
          "cursor",
          None,
          decode.optional(decode.string),
        )
        use verifications <- decode.field(
          "verifications",
          decode.list(
            schema.tools_ozone_verification_defs_verification_view_decoder(),
          ),
        )
        decode.success(ToolsOzoneVerificationListVerificationsResponse(
          cursor: cursor,
          verifications: verifications,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}
