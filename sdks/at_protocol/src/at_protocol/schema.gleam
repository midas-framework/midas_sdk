import gleam/option.{type Option, None}
import at_protocol/utils
import gleam/json
import gleam/dynamic
import gleam/dynamic/decode
import gleam/dict

pub type AppBskyFeedDefsInteraction {
  AppBskyFeedDefsInteraction(
    feed_context: Option(String),
    item: Option(String),
    event: Option(String),
  )
}

pub type ToolsOzoneModerationDefsReporterStats {
  ToolsOzoneModerationDefsReporterStats(
    record_report_count: Int,
    reported_record_count: Int,
    labeled_record_count: Int,
    takendown_account_count: Int,
    account_report_count: Int,
    labeled_account_count: Int,
    takendown_record_count: Int,
    reported_account_count: Int,
    did: String,
  )
}

pub type AppBskyActorDefsSavedFeed {
  AppBskyActorDefsSavedFeed(
    value: String,
    pinned: Bool,
    type_: String,
    id: String,
  )
}

pub type AppBskyLabelerDefsLabelerPolicies {
  AppBskyLabelerDefsLabelerPolicies(
    label_value_definitions: Option(
      List(ComAtprotoLabelDefsLabelValueDefinition),
    ),
    label_values: List(ComAtprotoLabelDefsLabelValue),
  )
}

pub type ChatBskyConvoDefsMessageRef {
  ChatBskyConvoDefsMessageRef(message_id: String, convo_id: String, did: String)
}

pub type ChatBskyModerationGetActorMetadataMetadata {
  ChatBskyModerationGetActorMetadataMetadata(
    messages_sent: Int,
    convos_started: Int,
    messages_received: Int,
    convos: Int,
  )
}

pub type ToolsOzoneModerationDefsBlobView {
  ToolsOzoneModerationDefsBlobView(
    size: Int,
    details: Option(json.Json),
    moderation: Option(ToolsOzoneModerationDefsModeration),
    mime_type: String,
    created_at: String,
    cid: String,
  )
}

pub type AppBskyActorDefsPersonalDetailsPref {
  AppBskyActorDefsPersonalDetailsPref(birth_date: Option(String))
}

pub type AppBskyRichtextFacetTag {
  AppBskyRichtextFacetTag(tag: String)
}

pub type AppBskyGraphList {
  AppBskyGraphList(
    name: String,
    description_facets: Option(List(AppBskyRichtextFacet)),
    avatar: Option(String),
    created_at: String,
    description: Option(String),
    purpose: AppBskyGraphDefsListPurpose,
    labels: Option(ComAtprotoLabelDefsSelfLabels),
  )
}

pub type AppBskyFeedDefsThreadViewPost {
  AppBskyFeedDefsThreadViewPost(
    post: AppBskyFeedDefsPostView,
    thread_context: Option(AppBskyFeedDefsThreadContext),
    replies: Option(List(json.Json)),
    parent: Option(json.Json),
  )
}

pub type AppBskyGraphDefsListView {
  AppBskyGraphDefsListView(
    indexed_at: String,
    name: String,
    creator: AppBskyActorDefsProfileView,
    uri: String,
    viewer: Option(AppBskyGraphDefsListViewerState),
    description_facets: Option(List(AppBskyRichtextFacet)),
    avatar: Option(String),
    description: Option(String),
    cid: String,
    purpose: AppBskyGraphDefsListPurpose,
    list_item_count: Option(Int),
    labels: Option(List(ComAtprotoLabelDefsLabel)),
  )
}

pub type AppBskyEmbedRecordViewBlocked {
  AppBskyEmbedRecordViewBlocked(
    author: AppBskyFeedDefsBlockedAuthor,
    uri: String,
    blocked: Bool,
  )
}

pub type AppBskyFeedDefsNotFoundPost {
  AppBskyFeedDefsNotFoundPost(uri: String, not_found: Bool)
}

pub type AppBskyFeedRepost {
  AppBskyFeedRepost(subject: ComAtprotoRepoStrongRef, created_at: String)
}

pub type ComAtprotoSyncSubscribeReposCommit {
  ComAtprotoSyncSubscribeReposCommit(
    rev: String,
    blocks: String,
    time: String,
    ops: List(ComAtprotoSyncSubscribeReposRepoOp),
    repo: String,
    blobs: List(String),
    commit: String,
    since: String,
    prev_data: Option(String),
    seq: Int,
  )
}

pub type ChatBskyConvoDefsLogReadMessage {
  ChatBskyConvoDefsLogReadMessage(
    rev: String,
    message: json.Json,
    convo_id: String,
  )
}

pub type ToolsOzoneCommunicationDefsTemplateView {
  ToolsOzoneCommunicationDefsTemplateView(
    content_markdown: String,
    name: String,
    subject: Option(String),
    lang: Option(String),
    updated_at: String,
    id: String,
    created_at: String,
    last_updated_by: String,
    disabled: Bool,
  )
}

pub type AppBskyEmbedExternal {
  AppBskyEmbedExternal(external: AppBskyEmbedExternalExternal)
}

pub type ChatBskyConvoDefsLogBeginConvo {
  ChatBskyConvoDefsLogBeginConvo(rev: String, convo_id: String)
}

pub type ChatBskyConvoDefsReactionView {
  ChatBskyConvoDefsReactionView(
    value: String,
    sender: ChatBskyConvoDefsReactionViewSender,
    created_at: String,
  )
}

pub type ComAtprotoIdentityDefsIdentityInfo {
  ComAtprotoIdentityDefsIdentityInfo(
    handle: String,
    did_doc: json.Json,
    did: String,
  )
}

pub type AppBskyActorDefsProfileAssociatedChat {
  AppBskyActorDefsProfileAssociatedChat(allow_incoming: String)
}

pub type ComAtprotoSyncSubscribeReposAccount {
  ComAtprotoSyncSubscribeReposAccount(
    active: Bool,
    time: String,
    status: Option(String),
    seq: Int,
    did: String,
  )
}

pub type ChatBskyConvoDefsLogAcceptConvo {
  ChatBskyConvoDefsLogAcceptConvo(rev: String, convo_id: String)
}

pub type ToolsOzoneModerationDefsRecordViewNotFound {
  ToolsOzoneModerationDefsRecordViewNotFound(uri: String)
}

pub type AppBskyActorDefsContentLabelPref {
  AppBskyActorDefsContentLabelPref(
    visibility: String,
    label: String,
    labeler_did: Option(String),
  )
}

pub type AppBskyFeedThreadgate {
  AppBskyFeedThreadgate(
    post: String,
    allow: Option(List(json.Json)),
    created_at: String,
    hidden_replies: Option(List(String)),
  )
}

pub type ComAtprotoAdminDefsThreatSignature {
  ComAtprotoAdminDefsThreatSignature(value: String, property: String)
}

pub type AppBskyGraphDefsListViewerState {
  AppBskyGraphDefsListViewerState(muted: Option(Bool), blocked: Option(String))
}

pub type ToolsOzoneModerationDefsModeration {
  ToolsOzoneModerationDefsModeration(
    subject_status: Option(ToolsOzoneModerationDefsSubjectStatusView),
  )
}

pub type ToolsOzoneModerationDefsModEventTag {
  ToolsOzoneModerationDefsModEventTag(
    add: List(String),
    remove: List(String),
    comment: Option(String),
  )
}

pub type AppBskyEmbedImagesView {
  AppBskyEmbedImagesView(images: List(AppBskyEmbedImagesViewImage))
}

pub type ComAtprotoLabelSubscribeLabelsLabels {
  ComAtprotoLabelSubscribeLabelsLabels(
    seq: Int,
    labels: List(ComAtprotoLabelDefsLabel),
  )
}

pub type AppBskyVideoDefsJobStatus {
  AppBskyVideoDefsJobStatus(
    message: Option(String),
    error: Option(String),
    progress: Option(Int),
    state: String,
    job_id: String,
    blob: Option(String),
    did: String,
  )
}

pub type ToolsOzoneModerationDefsRepoViewNotFound {
  ToolsOzoneModerationDefsRepoViewNotFound(did: String)
}

pub type AppBskyEmbedVideo {
  AppBskyEmbedVideo(
    alt: Option(String),
    captions: Option(List(AppBskyEmbedVideoCaption)),
    aspect_ratio: Option(AppBskyEmbedDefsAspectRatio),
    video: String,
  )
}

pub type ToolsOzoneModerationDefsVideoDetails {
  ToolsOzoneModerationDefsVideoDetails(width: Int, length: Int, height: Int)
}

pub type AppBskyActorDefsProfileViewBasic {
  AppBskyActorDefsProfileViewBasic(
    associated: Option(AppBskyActorDefsProfileAssociated),
    handle: String,
    display_name: Option(String),
    viewer: Option(AppBskyActorDefsViewerState),
    status: Option(AppBskyActorDefsStatusView),
    avatar: Option(String),
    created_at: Option(String),
    verification: Option(AppBskyActorDefsVerificationState),
    did: String,
    labels: Option(List(ComAtprotoLabelDefsLabel)),
  )
}

pub type AppBskyFeedDefsBlockedAuthor {
  AppBskyFeedDefsBlockedAuthor(
    viewer: Option(AppBskyActorDefsViewerState),
    did: String,
  )
}

pub type ComAtprotoServerDescribeServerContact {
  ComAtprotoServerDescribeServerContact(email: Option(String))
}

pub type AppBskyLabelerDefsLabelerViewDetailed {
  AppBskyLabelerDefsLabelerViewDetailed(
    indexed_at: String,
    subject_collections: Option(List(String)),
    creator: AppBskyActorDefsProfileView,
    uri: String,
    subject_types: Option(List(ComAtprotoModerationDefsSubjectType)),
    policies: AppBskyLabelerDefsLabelerPolicies,
    viewer: Option(AppBskyLabelerDefsLabelerViewerState),
    reason_types: Option(List(ComAtprotoModerationDefsReasonType)),
    like_count: Option(Int),
    cid: String,
    labels: Option(List(ComAtprotoLabelDefsLabel)),
  )
}

pub type AppBskyFeedThreadgateListRule {
  AppBskyFeedThreadgateListRule(list: String)
}

pub type ToolsOzoneModerationDefsModEventResolveAppeal {
  ToolsOzoneModerationDefsModEventResolveAppeal(comment: Option(String))
}

pub type ToolsOzoneModerationDefsRecordViewDetail {
  ToolsOzoneModerationDefsRecordViewDetail(
    indexed_at: String,
    moderation: ToolsOzoneModerationDefsModerationDetail,
    uri: String,
    value: json.Json,
    repo: ToolsOzoneModerationDefsRepoView,
    blobs: List(ToolsOzoneModerationDefsBlobView),
    cid: String,
    labels: Option(List(ComAtprotoLabelDefsLabel)),
  )
}

pub type ComAtprotoSyncSubscribeReposSync {
  ComAtprotoSyncSubscribeReposSync(
    rev: String,
    blocks: String,
    time: String,
    seq: Int,
    did: String,
  )
}

pub type AppBskyActorDefsVerificationView {
  AppBskyActorDefsVerificationView(
    uri: String,
    is_valid: Bool,
    issuer: String,
    created_at: String,
  )
}

pub type ToolsOzoneModerationDefsSubjectStatusView {
  ToolsOzoneModerationDefsSubjectStatusView(
    last_reviewed_at: Option(String),
    suspend_until: Option(String),
    last_reviewed_by: Option(String),
    mute_until: Option(String),
    subject_repo_handle: Option(String),
    mute_reporting_until: Option(String),
    takendown: Option(Bool),
    subject: json.Json,
    updated_at: String,
    appealed: Option(Bool),
    priority_score: Option(Int),
    account_stats: Option(ToolsOzoneModerationDefsAccountStats),
    last_appealed_at: Option(String),
    review_state: ToolsOzoneModerationDefsSubjectReviewState,
    tags: Option(List(String)),
    hosting: Option(json.Json),
    id: Int,
    created_at: String,
    last_reported_at: Option(String),
    records_stats: Option(ToolsOzoneModerationDefsRecordsStats),
    subject_blob_cids: Option(List(String)),
    comment: Option(String),
  )
}

pub type AppBskyFeedGenerator {
  AppBskyFeedGenerator(
    accepts_interactions: Option(Bool),
    display_name: String,
    description_facets: Option(List(AppBskyRichtextFacet)),
    avatar: Option(String),
    created_at: String,
    content_mode: Option(String),
    description: Option(String),
    did: String,
    labels: Option(ComAtprotoLabelDefsSelfLabels),
  )
}

pub type AppBskyFeedLike {
  AppBskyFeedLike(subject: ComAtprotoRepoStrongRef, created_at: String)
}

pub type ToolsOzoneModerationDefsImageDetails {
  ToolsOzoneModerationDefsImageDetails(width: Int, height: Int)
}

pub type ToolsOzoneModerationDefsRepoViewDetail {
  ToolsOzoneModerationDefsRepoViewDetail(
    deactivated_at: Option(String),
    indexed_at: String,
    moderation: ToolsOzoneModerationDefsModerationDetail,
    invites_disabled: Option(Bool),
    handle: String,
    invites: Option(List(ComAtprotoServerDefsInviteCode)),
    invited_by: Option(ComAtprotoServerDefsInviteCode),
    threat_signatures: Option(List(ComAtprotoAdminDefsThreatSignature)),
    email_confirmed_at: Option(String),
    related_records: List(json.Json),
    invite_note: Option(String),
    email: Option(String),
    did: String,
    labels: Option(List(ComAtprotoLabelDefsLabel)),
  )
}

pub type AppBskyActorDefsMutedWordsPref {
  AppBskyActorDefsMutedWordsPref(items: List(AppBskyActorDefsMutedWord))
}

pub type ComAtprotoAdminDefsRepoRef {
  ComAtprotoAdminDefsRepoRef(did: String)
}

pub type ChatBskyConvoSendMessageBatchBatchItem {
  ChatBskyConvoSendMessageBatchBatchItem(
    message: ChatBskyConvoDefsMessageInput,
    convo_id: String,
  )
}

pub type ToolsOzoneModerationDefsModEventAcknowledge {
  ToolsOzoneModerationDefsModEventAcknowledge(
    acknowledge_account_subjects: Option(Bool),
    comment: Option(String),
  )
}

pub type ToolsOzoneModerationDefsModEventEmail {
  ToolsOzoneModerationDefsModEventEmail(
    subject_line: String,
    content: Option(String),
    comment: Option(String),
  )
}

pub type ToolsOzoneHostingGetAccountHistoryAccountCreated {
  ToolsOzoneHostingGetAccountHistoryAccountCreated(
    handle: Option(String),
    email: Option(String),
  )
}

pub type ComAtprotoRepoDefsCommitMeta {
  ComAtprotoRepoDefsCommitMeta(rev: String, cid: String)
}

pub type AppBskyGraphStarterpack {
  AppBskyGraphStarterpack(
    name: String,
    feeds: Option(List(AppBskyGraphStarterpackFeedItem)),
    description_facets: Option(List(AppBskyRichtextFacet)),
    created_at: String,
    description: Option(String),
    list: String,
  )
}

pub type AppBskyFeedDefsGeneratorView {
  AppBskyFeedDefsGeneratorView(
    indexed_at: String,
    creator: AppBskyActorDefsProfileView,
    accepts_interactions: Option(Bool),
    uri: String,
    display_name: String,
    viewer: Option(AppBskyFeedDefsGeneratorViewerState),
    description_facets: Option(List(AppBskyRichtextFacet)),
    like_count: Option(Int),
    avatar: Option(String),
    content_mode: Option(String),
    description: Option(String),
    cid: String,
    did: String,
    labels: Option(List(ComAtprotoLabelDefsLabel)),
  )
}

pub type ComAtprotoRepoStrongRef {
  ComAtprotoRepoStrongRef(uri: String, cid: String)
}

pub type AppBskyLabelerService {
  AppBskyLabelerService(
    subject_collections: Option(List(String)),
    subject_types: Option(List(ComAtprotoModerationDefsSubjectType)),
    policies: AppBskyLabelerDefsLabelerPolicies,
    reason_types: Option(List(ComAtprotoModerationDefsReasonType)),
    created_at: String,
    labels: Option(ComAtprotoLabelDefsSelfLabels),
  )
}

pub type AppBskyActorDefsAdultContentPref {
  AppBskyActorDefsAdultContentPref(enabled: Bool)
}

pub type AppBskyActorDefsHiddenPostsPref {
  AppBskyActorDefsHiddenPostsPref(items: List(String))
}

pub type AppBskyActorDefsInterestsPref {
  AppBskyActorDefsInterestsPref(tags: List(String))
}

pub type AppBskyFeedDescribeFeedGeneratorLinks {
  AppBskyFeedDescribeFeedGeneratorLinks(
    terms_of_service: Option(String),
    privacy_policy: Option(String),
  )
}

pub type ChatBskyConvoDefsDeletedMessageView {
  ChatBskyConvoDefsDeletedMessageView(
    rev: String,
    sent_at: String,
    sender: ChatBskyConvoDefsMessageViewSender,
    id: String,
  )
}

pub type ComAtprotoSyncSubscribeReposIdentity {
  ComAtprotoSyncSubscribeReposIdentity(
    handle: Option(String),
    time: String,
    seq: Int,
    did: String,
  )
}

pub type ComAtprotoLabelDefsSelfLabel {
  ComAtprotoLabelDefsSelfLabel(val: String)
}

pub type ComAtprotoRepoApplyWritesUpdateResult {
  ComAtprotoRepoApplyWritesUpdateResult(
    validation_status: Option(String),
    uri: String,
    cid: String,
  )
}

pub type AppBskyGraphDefsNotFoundActor {
  AppBskyGraphDefsNotFoundActor(not_found: Bool, actor: String)
}

pub type ComAtprotoServerListAppPasswordsAppPassword {
  ComAtprotoServerListAppPasswordsAppPassword(
    name: String,
    privileged: Option(Bool),
    created_at: String,
  )
}

pub type ToolsOzoneHostingGetAccountHistoryHandleUpdated {
  ToolsOzoneHostingGetAccountHistoryHandleUpdated(handle: String)
}

pub type AppBskyEmbedRecord {
  AppBskyEmbedRecord(record: ComAtprotoRepoStrongRef)
}

pub type ToolsOzoneModerationDefsModEventUnmute {
  ToolsOzoneModerationDefsModEventUnmute(comment: Option(String))
}

pub type ToolsOzoneModerationDefsModEventEscalate {
  ToolsOzoneModerationDefsModEventEscalate(comment: Option(String))
}

pub type ChatBskyActorDeclaration {
  ChatBskyActorDeclaration(allow_incoming: String)
}

pub type ToolsOzoneModerationDefsModEventUnmuteReporter {
  ToolsOzoneModerationDefsModEventUnmuteReporter(comment: Option(String))
}

pub type AppBskyFeedDefsReasonRepost {
  AppBskyFeedDefsReasonRepost(
    indexed_at: String,
    by: AppBskyActorDefsProfileViewBasic,
  )
}

pub type AppBskyActorDefsProfileView {
  AppBskyActorDefsProfileView(
    indexed_at: Option(String),
    associated: Option(AppBskyActorDefsProfileAssociated),
    handle: String,
    display_name: Option(String),
    viewer: Option(AppBskyActorDefsViewerState),
    status: Option(AppBskyActorDefsStatusView),
    avatar: Option(String),
    created_at: Option(String),
    verification: Option(AppBskyActorDefsVerificationState),
    description: Option(String),
    did: String,
    labels: Option(List(ComAtprotoLabelDefsLabel)),
  )
}

pub type ComAtprotoAdminDefsRepoBlobRef {
  ComAtprotoAdminDefsRepoBlobRef(
    record_uri: Option(String),
    cid: String,
    did: String,
  )
}

pub type ToolsOzoneModerationDefsModEventComment {
  ToolsOzoneModerationDefsModEventComment(
    sticky: Option(Bool),
    comment: Option(String),
  )
}

pub type AppBskyFeedPostReplyRef {
  AppBskyFeedPostReplyRef(
    root: ComAtprotoRepoStrongRef,
    parent: ComAtprotoRepoStrongRef,
  )
}

pub type ComAtprotoServerCreateAppPasswordAppPassword {
  ComAtprotoServerCreateAppPasswordAppPassword(
    name: String,
    privileged: Option(Bool),
    created_at: String,
    password: String,
  )
}

pub type ToolsOzoneModerationDefsModEventReport {
  ToolsOzoneModerationDefsModEventReport(
    is_reporter_muted: Option(Bool),
    report_type: ComAtprotoModerationDefsReasonType,
    comment: Option(String),
  )
}

pub type ComAtprotoSyncListReposRepo {
  ComAtprotoSyncListReposRepo(
    head: String,
    rev: String,
    active: Option(Bool),
    status: Option(String),
    did: String,
  )
}

pub type AppBskyActorDefsProfileAssociated {
  AppBskyActorDefsProfileAssociated(
    feedgens: Option(Int),
    labeler: Option(Bool),
    starter_packs: Option(Int),
    lists: Option(Int),
    chat: Option(AppBskyActorDefsProfileAssociatedChat),
  )
}

pub type ToolsOzoneVerificationGrantVerificationsVerificationInput {
  ToolsOzoneVerificationGrantVerificationsVerificationInput(
    handle: String,
    subject: String,
    display_name: String,
    created_at: Option(String),
  )
}

pub type ToolsOzoneHostingGetAccountHistoryEmailUpdated {
  ToolsOzoneHostingGetAccountHistoryEmailUpdated(email: String)
}

pub type AppBskyEmbedDefsAspectRatio {
  AppBskyEmbedDefsAspectRatio(width: Int, height: Int)
}

pub type AppBskyActorDefsFeedViewPref {
  AppBskyActorDefsFeedViewPref(
    hide_replies: Option(Bool),
    hide_replies_by_unfollowed: Option(Bool),
    hide_quote_posts: Option(Bool),
    hide_replies_by_like_count: Option(Int),
    feed: String,
    hide_reposts: Option(Bool),
  )
}

pub type ComAtprotoRepoApplyWritesUpdate {
  ComAtprotoRepoApplyWritesUpdate(
    rkey: String,
    value: json.Json,
    collection: String,
  )
}

pub type ComAtprotoLabelDefsSelfLabels {
  ComAtprotoLabelDefsSelfLabels(values: List(ComAtprotoLabelDefsSelfLabel))
}

pub type ToolsOzoneModerationDefsRecordEvent {
  ToolsOzoneModerationDefsRecordEvent(
    op: String,
    timestamp: String,
    cid: Option(String),
    comment: Option(String),
  )
}

pub type AppBskyGraphBlock {
  AppBskyGraphBlock(subject: String, created_at: String)
}

pub type ToolsOzoneModerationDefsAccountHosting {
  ToolsOzoneModerationDefsAccountHosting(
    deactivated_at: Option(String),
    deleted_at: Option(String),
    updated_at: Option(String),
    reactivated_at: Option(String),
    status: String,
    created_at: Option(String),
  )
}

pub type AppBskyEmbedRecordView {
  AppBskyEmbedRecordView(record: json.Json)
}

pub type ComAtprotoServerCreateInviteCodesAccountCodes {
  ComAtprotoServerCreateInviteCodesAccountCodes(
    codes: List(String),
    account: String,
  )
}

pub type ToolsOzoneModerationDefsRecordHosting {
  ToolsOzoneModerationDefsRecordHosting(
    deleted_at: Option(String),
    updated_at: Option(String),
    status: String,
    created_at: Option(String),
  )
}

pub type ToolsOzoneModerationDefsAccountEvent {
  ToolsOzoneModerationDefsAccountEvent(
    active: Bool,
    status: Option(String),
    timestamp: String,
    comment: Option(String),
  )
}

pub type ChatBskyConvoDefsConvoView {
  ChatBskyConvoDefsConvoView(
    unread_count: Int,
    rev: String,
    muted: Bool,
    last_message: Option(json.Json),
    status: Option(String),
    members: List(ChatBskyActorDefsProfileViewBasic),
    id: String,
    last_reaction: Option(ChatBskyConvoDefsMessageAndReactionView),
  )
}

pub type AppBskyFeedDefsThreadgateView {
  AppBskyFeedDefsThreadgateView(
    uri: Option(String),
    record: Option(json.Json),
    lists: Option(List(AppBskyGraphDefsListViewBasic)),
    cid: Option(String),
  )
}

pub type ChatBskyConvoDefsLogDeleteMessage {
  ChatBskyConvoDefsLogDeleteMessage(
    rev: String,
    message: json.Json,
    convo_id: String,
  )
}

pub type ToolsOzoneModerationDefsModEventDivert {
  ToolsOzoneModerationDefsModEventDivert(comment: Option(String))
}

pub type ToolsOzoneModerationDefsModEventViewDetail {
  ToolsOzoneModerationDefsModEventViewDetail(
    subject_blobs: List(ToolsOzoneModerationDefsBlobView),
    subject: json.Json,
    event: json.Json,
    id: Int,
    created_at: String,
    created_by: String,
  )
}

pub type AppBskyActorDefsNux {
  AppBskyActorDefsNux(
    expires_at: Option(String),
    data: Option(String),
    completed: Bool,
    id: String,
  )
}

pub type ChatBskyConvoDefsMessageViewSender {
  ChatBskyConvoDefsMessageViewSender(did: String)
}

pub type AppBskyGraphListblock {
  AppBskyGraphListblock(subject: String, created_at: String)
}

pub type ComAtprotoRepoApplyWritesDelete {
  ComAtprotoRepoApplyWritesDelete(rkey: String, collection: String)
}

pub type AppBskyActorStatus {
  AppBskyActorStatus(
    duration_minutes: Option(Int),
    status: String,
    embed: Option(AppBskyEmbedExternal),
    created_at: String,
  )
}

pub type AppBskyGraphDefsListViewBasic {
  AppBskyGraphDefsListViewBasic(
    indexed_at: Option(String),
    name: String,
    uri: String,
    viewer: Option(AppBskyGraphDefsListViewerState),
    avatar: Option(String),
    cid: String,
    purpose: AppBskyGraphDefsListPurpose,
    list_item_count: Option(Int),
    labels: Option(List(ComAtprotoLabelDefsLabel)),
  )
}

pub type AppBskyFeedDefsViewerState {
  AppBskyFeedDefsViewerState(
    thread_muted: Option(Bool),
    reply_disabled: Option(Bool),
    repost: Option(String),
    embedding_disabled: Option(Bool),
    like: Option(String),
    pinned: Option(Bool),
  )
}

pub type AppBskyFeedPost {
  AppBskyFeedPost(
    langs: Option(List(String)),
    reply: Option(AppBskyFeedPostReplyRef),
    text: String,
    tags: Option(List(String)),
    embed: Option(json.Json),
    created_at: String,
    facets: Option(List(AppBskyRichtextFacet)),
    labels: Option(ComAtprotoLabelDefsSelfLabels),
  )
}

pub type ToolsOzoneHostingGetAccountHistoryEmailConfirmed {
  ToolsOzoneHostingGetAccountHistoryEmailConfirmed(email: String)
}

pub type AppBskyActorProfile {
  AppBskyActorProfile(
    joined_via_starter_pack: Option(ComAtprotoRepoStrongRef),
    banner: Option(String),
    display_name: Option(String),
    pinned_post: Option(ComAtprotoRepoStrongRef),
    avatar: Option(String),
    created_at: Option(String),
    description: Option(String),
    labels: Option(ComAtprotoLabelDefsSelfLabels),
  )
}

pub type ChatBskyActorDefsProfileViewBasic {
  ChatBskyActorDefsProfileViewBasic(
    associated: Option(AppBskyActorDefsProfileAssociated),
    handle: String,
    display_name: Option(String),
    viewer: Option(AppBskyActorDefsViewerState),
    chat_disabled: Option(Bool),
    avatar: Option(String),
    verification: Option(AppBskyActorDefsVerificationState),
    did: String,
    labels: Option(List(ComAtprotoLabelDefsLabel)),
  )
}

pub type AppBskyLabelerDefsLabelerViewerState {
  AppBskyLabelerDefsLabelerViewerState(like: Option(String))
}

pub type ToolsOzoneHostingGetAccountHistoryEvent {
  ToolsOzoneHostingGetAccountHistoryEvent(
    details: json.Json,
    created_at: String,
    created_by: String,
  )
}

pub type AppBskyEmbedImages {
  AppBskyEmbedImages(images: List(AppBskyEmbedImagesImage))
}

pub type ToolsOzoneServerGetConfigViewerConfig {
  ToolsOzoneServerGetConfigViewerConfig(role: Option(String))
}

pub type ToolsOzoneModerationDefsModEventMute {
  ToolsOzoneModerationDefsModEventMute(
    duration_in_hours: Int,
    comment: Option(String),
  )
}

pub type AppBskyEmbedVideoView {
  AppBskyEmbedVideoView(
    alt: Option(String),
    thumbnail: Option(String),
    playlist: String,
    aspect_ratio: Option(AppBskyEmbedDefsAspectRatio),
    cid: String,
  )
}

pub type ToolsOzoneTeamDefsMember {
  ToolsOzoneTeamDefsMember(
    profile: Option(AppBskyActorDefsProfileViewDetailed),
    updated_at: Option(String),
    role: String,
    created_at: Option(String),
    last_updated_by: Option(String),
    disabled: Option(Bool),
    did: String,
  )
}

pub type AppBskyGraphDefsStarterPackView {
  AppBskyGraphDefsStarterPackView(
    indexed_at: String,
    joined_all_time_count: Option(Int),
    creator: AppBskyActorDefsProfileViewBasic,
    uri: String,
    list_items_sample: Option(List(AppBskyGraphDefsListItemView)),
    record: json.Json,
    joined_week_count: Option(Int),
    feeds: Option(List(AppBskyFeedDefsGeneratorView)),
    list: Option(AppBskyGraphDefsListViewBasic),
    cid: String,
    labels: Option(List(ComAtprotoLabelDefsLabel)),
  )
}

pub type ToolsOzoneModerationDefsModEventMuteReporter {
  ToolsOzoneModerationDefsModEventMuteReporter(
    duration_in_hours: Option(Int),
    comment: Option(String),
  )
}

pub type AppBskyRichtextFacetByteSlice {
  AppBskyRichtextFacetByteSlice(byte_end: Int, byte_start: Int)
}

pub type AppBskyFeedDescribeFeedGeneratorFeed {
  AppBskyFeedDescribeFeedGeneratorFeed(uri: String)
}

pub type ToolsOzoneModerationDefsAccountStats {
  ToolsOzoneModerationDefsAccountStats(
    appeal_count: Option(Int),
    takedown_count: Option(Int),
    suspend_count: Option(Int),
    report_count: Option(Int),
    escalate_count: Option(Int),
  )
}

pub type AppBskyActorDefsVerificationPrefs {
  AppBskyActorDefsVerificationPrefs(hide_badges: Option(Bool))
}

pub type AppBskyRichtextFacetMention {
  AppBskyRichtextFacetMention(did: String)
}

pub type ComAtprotoLabelDefsLabelValueDefinition {
  ComAtprotoLabelDefsLabelValueDefinition(
    adult_only: Option(Bool),
    identifier: String,
    blurs: String,
    default_setting: Option(String),
    locales: List(ComAtprotoLabelDefsLabelValueDefinitionStrings),
    severity: String,
  )
}

pub type AppBskyActorDefsMutedWord {
  AppBskyActorDefsMutedWord(
    targets: List(AppBskyActorDefsMutedWordTarget),
    actor_target: Option(String),
    expires_at: Option(String),
    value: String,
    id: Option(String),
  )
}

pub type AppBskyNotificationListNotificationsNotification {
  AppBskyNotificationListNotificationsNotification(
    is_read: Bool,
    indexed_at: String,
    reason: String,
    reason_subject: Option(String),
    author: AppBskyActorDefsProfileView,
    uri: String,
    record: json.Json,
    cid: String,
    labels: Option(List(ComAtprotoLabelDefsLabel)),
  )
}

pub type AppBskyEmbedExternalView {
  AppBskyEmbedExternalView(external: AppBskyEmbedExternalViewExternal)
}

pub type AppBskyFeedGetLikesLike {
  AppBskyFeedGetLikesLike(
    indexed_at: String,
    actor: AppBskyActorDefsProfileView,
    created_at: String,
  )
}

pub type ToolsOzoneSettingDefsOption {
  ToolsOzoneSettingDefsOption(
    manager_role: Option(String),
    updated_at: Option(String),
    value: json.Json,
    scope: String,
    created_at: Option(String),
    last_updated_by: String,
    description: Option(String),
    did: String,
    created_by: String,
    key: String,
  )
}

pub type ComAtprotoServerDefsInviteCode {
  ComAtprotoServerDefsInviteCode(
    for_account: String,
    available: Int,
    uses: List(ComAtprotoServerDefsInviteCodeUse),
    code: String,
    created_at: String,
    disabled: Bool,
    created_by: String,
  )
}

pub type ToolsOzoneVerificationGrantVerificationsGrantError {
  ToolsOzoneVerificationGrantVerificationsGrantError(
    error: String,
    subject: String,
  )
}

pub type ComAtprotoRepoListRecordsRecord {
  ComAtprotoRepoListRecordsRecord(uri: String, value: json.Json, cid: String)
}

pub type AppBskyActorDefsVerificationState {
  AppBskyActorDefsVerificationState(
    verifications: List(AppBskyActorDefsVerificationView),
    verified_status: String,
    trusted_verifier_status: String,
  )
}

pub type ChatBskyConvoDefsMessageAndReactionView {
  ChatBskyConvoDefsMessageAndReactionView(
    message: ChatBskyConvoDefsMessageView,
    reaction: ChatBskyConvoDefsReactionView,
  )
}

pub type AppBskyActorDefsLabelerPrefItem {
  AppBskyActorDefsLabelerPrefItem(did: String)
}

pub type AppBskyActorDefsBskyAppProgressGuide {
  AppBskyActorDefsBskyAppProgressGuide(guide: String)
}

pub type ComAtprotoLabelDefsLabelValueDefinitionStrings {
  ComAtprotoLabelDefsLabelValueDefinitionStrings(
    name: String,
    lang: String,
    description: String,
  )
}

pub type AppBskyActorDefsSavedFeedsPrefV2 {
  AppBskyActorDefsSavedFeedsPrefV2(items: List(AppBskyActorDefsSavedFeed))
}

pub type ChatBskyConvoDefsLogMuteConvo {
  ChatBskyConvoDefsLogMuteConvo(rev: String, convo_id: String)
}

pub type ToolsOzoneVerificationDefsVerificationView {
  ToolsOzoneVerificationDefsVerificationView(
    handle: String,
    revoke_reason: Option(String),
    issuer_repo: Option(json.Json),
    subject: String,
    uri: String,
    display_name: String,
    issuer_profile: Option(json.Json),
    revoked_at: Option(String),
    revoked_by: Option(String),
    issuer: String,
    created_at: String,
    subject_profile: Option(json.Json),
    subject_repo: Option(json.Json),
  )
}

pub type AppBskyGraphFollow {
  AppBskyGraphFollow(subject: String, created_at: String)
}

pub type AppBskyGraphListitem {
  AppBskyGraphListitem(subject: String, created_at: String, list: String)
}

pub type AppBskyActorDefsPostInteractionSettingsPref {
  AppBskyActorDefsPostInteractionSettingsPref(
    threadgate_allow_rules: Option(List(json.Json)),
    postgate_embedding_rules: Option(List(AppBskyFeedPostgateDisableRule)),
  )
}

pub type ToolsOzoneModerationDefsSubjectView {
  ToolsOzoneModerationDefsSubjectView(
    profile: Option(json.Json),
    subject: String,
    record: Option(ToolsOzoneModerationDefsRecordViewDetail),
    repo: Option(ToolsOzoneModerationDefsRepoViewDetail),
    status: Option(ToolsOzoneModerationDefsSubjectStatusView),
    type_: ComAtprotoModerationDefsSubjectType,
  )
}

pub type AppBskyFeedDefsThreadContext {
  AppBskyFeedDefsThreadContext(root_author_like: Option(String))
}

pub type ComAtprotoLabelSubscribeLabelsInfo {
  ComAtprotoLabelSubscribeLabelsInfo(message: Option(String), name: String)
}

pub type ToolsOzoneSignatureFindRelatedAccountsRelatedAccount {
  ToolsOzoneSignatureFindRelatedAccountsRelatedAccount(
    similarities: Option(List(ToolsOzoneSignatureDefsSigDetail)),
    account: ComAtprotoAdminDefsAccountView,
  )
}

pub type ComAtprotoLabelDefsLabel {
  ComAtprotoLabelDefsLabel(
    val: String,
    cts: String,
    ver: Option(Int),
    src: String,
    uri: String,
    neg: Option(Bool),
    sig: Option(String),
    exp: Option(String),
    cid: Option(String),
  )
}

pub type AppBskyRichtextFacet {
  AppBskyRichtextFacet(
    index: AppBskyRichtextFacetByteSlice,
    features: List(json.Json),
  )
}

pub type AppBskyGraphDefsListItemView {
  AppBskyGraphDefsListItemView(subject: AppBskyActorDefsProfileView, uri: String)
}

pub type ToolsOzoneSetDefsSet {
  ToolsOzoneSetDefsSet(name: String, description: Option(String))
}

pub type AppBskyRichtextFacetLink {
  AppBskyRichtextFacetLink(uri: String)
}

pub type ToolsOzoneModerationDefsRecordView {
  ToolsOzoneModerationDefsRecordView(
    indexed_at: String,
    moderation: ToolsOzoneModerationDefsModeration,
    uri: String,
    value: json.Json,
    blob_cids: List(String),
    repo: ToolsOzoneModerationDefsRepoView,
    cid: String,
  )
}

pub type ChatBskyConvoDefsLogLeaveConvo {
  ChatBskyConvoDefsLogLeaveConvo(rev: String, convo_id: String)
}

pub type AppBskyFeedDefsFeedViewPost {
  AppBskyFeedDefsFeedViewPost(
    post: AppBskyFeedDefsPostView,
    reason: Option(json.Json),
    reply: Option(AppBskyFeedDefsReplyRef),
    feed_context: Option(String),
  )
}

pub type ToolsOzoneModerationDefsModEventReverseTakedown {
  ToolsOzoneModerationDefsModEventReverseTakedown(comment: Option(String))
}

pub type ToolsOzoneModerationDefsModerationDetail {
  ToolsOzoneModerationDefsModerationDetail(
    subject_status: Option(ToolsOzoneModerationDefsSubjectStatusView),
  )
}

pub type AppBskyLabelerDefsLabelerView {
  AppBskyLabelerDefsLabelerView(
    indexed_at: String,
    creator: AppBskyActorDefsProfileView,
    uri: String,
    viewer: Option(AppBskyLabelerDefsLabelerViewerState),
    like_count: Option(Int),
    cid: String,
    labels: Option(List(ComAtprotoLabelDefsLabel)),
  )
}

pub type ToolsOzoneModerationDefsRepoView {
  ToolsOzoneModerationDefsRepoView(
    deactivated_at: Option(String),
    indexed_at: String,
    moderation: ToolsOzoneModerationDefsModeration,
    invites_disabled: Option(Bool),
    handle: String,
    invited_by: Option(ComAtprotoServerDefsInviteCode),
    threat_signatures: Option(List(ComAtprotoAdminDefsThreatSignature)),
    related_records: List(json.Json),
    invite_note: Option(String),
    email: Option(String),
    did: String,
  )
}

pub type ComAtprotoSyncListReposByCollectionRepo {
  ComAtprotoSyncListReposByCollectionRepo(did: String)
}

pub type ComAtprotoSyncListHostsHost {
  ComAtprotoSyncListHostsHost(
    account_count: Option(Int),
    status: Option(ComAtprotoSyncDefsHostStatus),
    hostname: String,
    seq: Option(Int),
  )
}

pub type ComAtprotoServerDefsInviteCodeUse {
  ComAtprotoServerDefsInviteCodeUse(used_at: String, used_by: String)
}

pub type AppBskyActorDefsSavedFeedsPref {
  AppBskyActorDefsSavedFeedsPref(
    saved: List(String),
    timeline_index: Option(Int),
    pinned: List(String),
  )
}

pub type AppBskyEmbedRecordWithMedia {
  AppBskyEmbedRecordWithMedia(media: json.Json, record: AppBskyEmbedRecord)
}

pub type AppBskyFeedDefsSkeletonReasonRepost {
  AppBskyFeedDefsSkeletonReasonRepost(repost: String)
}

pub type AppBskyGraphDefsRelationship {
  AppBskyGraphDefsRelationship(
    followed_by: Option(String),
    following: Option(String),
    did: String,
  )
}

pub type AppBskyActorDefsBskyAppStatePref {
  AppBskyActorDefsBskyAppStatePref(
    nuxs: Option(List(AppBskyActorDefsNux)),
    active_progress_guide: Option(AppBskyActorDefsBskyAppProgressGuide),
    queued_nudges: Option(List(String)),
  )
}

pub type ComAtprotoAdminDefsAccountView {
  ComAtprotoAdminDefsAccountView(
    deactivated_at: Option(String),
    indexed_at: String,
    invites_disabled: Option(Bool),
    handle: String,
    invites: Option(List(ComAtprotoServerDefsInviteCode)),
    invited_by: Option(ComAtprotoServerDefsInviteCode),
    threat_signatures: Option(List(ComAtprotoAdminDefsThreatSignature)),
    email_confirmed_at: Option(String),
    related_records: Option(List(json.Json)),
    invite_note: Option(String),
    email: Option(String),
    did: String,
  )
}

pub type ChatBskyConvoDefsMessageInput {
  ChatBskyConvoDefsMessageInput(
    text: String,
    embed: Option(AppBskyEmbedRecord),
    facets: Option(List(AppBskyRichtextFacet)),
  )
}

pub type AppBskyActorDefsKnownFollowers {
  AppBskyActorDefsKnownFollowers(
    count: Int,
    followers: List(AppBskyActorDefsProfileViewBasic),
  )
}

pub type ChatBskyConvoDefsReactionViewSender {
  ChatBskyConvoDefsReactionViewSender(did: String)
}

pub type AppBskyEmbedImagesViewImage {
  AppBskyEmbedImagesViewImage(
    alt: String,
    fullsize: String,
    aspect_ratio: Option(AppBskyEmbedDefsAspectRatio),
    thumb: String,
  )
}

pub type AppBskyActorDefsThreadViewPref {
  AppBskyActorDefsThreadViewPref(
    prioritize_followed_users: Option(Bool),
    sort: Option(String),
  )
}

pub type AppBskyEmbedExternalExternal {
  AppBskyEmbedExternalExternal(
    uri: String,
    thumb: Option(String),
    title: String,
    description: String,
  )
}

pub type ComAtprotoSyncSubscribeReposInfo {
  ComAtprotoSyncSubscribeReposInfo(message: Option(String), name: String)
}

pub type ComAtprotoRepoListMissingBlobsRecordBlob {
  ComAtprotoRepoListMissingBlobsRecordBlob(record_uri: String, cid: String)
}

pub type ToolsOzoneModerationDefsModEventPriorityScore {
  ToolsOzoneModerationDefsModEventPriorityScore(
    score: Int,
    comment: Option(String),
  )
}

pub type ChatBskyConvoDefsMessageView {
  ChatBskyConvoDefsMessageView(
    rev: String,
    reactions: Option(List(ChatBskyConvoDefsReactionView)),
    sent_at: String,
    text: String,
    sender: ChatBskyConvoDefsMessageViewSender,
    embed: Option(AppBskyEmbedRecordView),
    id: String,
    facets: Option(List(AppBskyRichtextFacet)),
  )
}

pub type AppBskyGraphStarterpackFeedItem {
  AppBskyGraphStarterpackFeedItem(uri: String)
}

pub type ChatBskyConvoDefsLogUnmuteConvo {
  ChatBskyConvoDefsLogUnmuteConvo(rev: String, convo_id: String)
}

pub type AppBskyActorDefsProfileViewDetailed {
  AppBskyActorDefsProfileViewDetailed(
    joined_via_starter_pack: Option(AppBskyGraphDefsStarterPackViewBasic),
    indexed_at: Option(String),
    associated: Option(AppBskyActorDefsProfileAssociated),
    handle: String,
    banner: Option(String),
    display_name: Option(String),
    follows_count: Option(Int),
    viewer: Option(AppBskyActorDefsViewerState),
    status: Option(AppBskyActorDefsStatusView),
    pinned_post: Option(ComAtprotoRepoStrongRef),
    avatar: Option(String),
    followers_count: Option(Int),
    created_at: Option(String),
    verification: Option(AppBskyActorDefsVerificationState),
    posts_count: Option(Int),
    description: Option(String),
    did: String,
    labels: Option(List(ComAtprotoLabelDefsLabel)),
  )
}

pub type ToolsOzoneVerificationRevokeVerificationsRevokeError {
  ToolsOzoneVerificationRevokeVerificationsRevokeError(
    error: String,
    uri: String,
  )
}

pub type ToolsOzoneSetDefsSetView {
  ToolsOzoneSetDefsSetView(
    set_size: Int,
    name: String,
    updated_at: String,
    created_at: String,
    description: Option(String),
  )
}

pub type AppBskyFeedPostgate {
  AppBskyFeedPostgate(
    post: String,
    embedding_rules: Option(List(AppBskyFeedPostgateDisableRule)),
    detached_embedding_uris: Option(List(String)),
    created_at: String,
  )
}

pub type AppBskyActorDefsLabelersPref {
  AppBskyActorDefsLabelersPref(labelers: List(AppBskyActorDefsLabelerPrefItem))
}

pub type AppBskyActorDefsViewerState {
  AppBskyActorDefsViewerState(
    muted_by_list: Option(AppBskyGraphDefsListViewBasic),
    blocked_by: Option(Bool),
    followed_by: Option(String),
    blocking_by_list: Option(AppBskyGraphDefsListViewBasic),
    muted: Option(Bool),
    following: Option(String),
    known_followers: Option(AppBskyActorDefsKnownFollowers),
    blocking: Option(String),
  )
}

pub type AppBskyFeedDefsBlockedPost {
  AppBskyFeedDefsBlockedPost(
    author: AppBskyFeedDefsBlockedAuthor,
    uri: String,
    blocked: Bool,
  )
}

pub type ChatBskyConvoDefsLogAddReaction {
  ChatBskyConvoDefsLogAddReaction(
    rev: String,
    message: json.Json,
    reaction: ChatBskyConvoDefsReactionView,
    convo_id: String,
  )
}

pub type AppBskyEmbedRecordViewNotFound {
  AppBskyEmbedRecordViewNotFound(uri: String, not_found: Bool)
}

pub type ChatBskyConvoDefsLogCreateMessage {
  ChatBskyConvoDefsLogCreateMessage(
    rev: String,
    message: json.Json,
    convo_id: String,
  )
}

pub type AppBskyFeedDefsReplyRef {
  AppBskyFeedDefsReplyRef(
    grandparent_author: Option(AppBskyActorDefsProfileViewBasic),
    root: json.Json,
    parent: json.Json,
  )
}

pub type ComAtprotoRepoApplyWritesCreateResult {
  ComAtprotoRepoApplyWritesCreateResult(
    validation_status: Option(String),
    uri: String,
    cid: String,
  )
}

pub type ToolsOzoneModerationDefsModEventView {
  ToolsOzoneModerationDefsModEventView(
    subject: json.Json,
    creator_handle: Option(String),
    subject_handle: Option(String),
    event: json.Json,
    id: Int,
    created_at: String,
    subject_blob_cids: List(String),
    created_by: String,
  )
}

pub type ToolsOzoneModerationDefsRecordsStats {
  ToolsOzoneModerationDefsRecordsStats(
    processed_count: Option(Int),
    appealed_count: Option(Int),
    subject_count: Option(Int),
    takendown_count: Option(Int),
    pending_count: Option(Int),
    total_reports: Option(Int),
    reported_count: Option(Int),
    escalated_count: Option(Int),
  )
}

pub type AppBskyActorDefsStatusView {
  AppBskyActorDefsStatusView(
    expires_at: Option(String),
    is_active: Option(Bool),
    record: json.Json,
    status: String,
    embed: Option(AppBskyEmbedExternalView),
  )
}

pub type AppBskyEmbedVideoCaption {
  AppBskyEmbedVideoCaption(lang: String, file: String)
}

pub type AppBskyEmbedRecordViewRecord {
  AppBskyEmbedRecordViewRecord(
    indexed_at: String,
    reply_count: Option(Int),
    author: AppBskyActorDefsProfileViewBasic,
    uri: String,
    value: json.Json,
    quote_count: Option(Int),
    like_count: Option(Int),
    embeds: Option(List(json.Json)),
    repost_count: Option(Int),
    cid: String,
    labels: Option(List(ComAtprotoLabelDefsLabel)),
  )
}

pub type ToolsOzoneServerGetConfigServiceConfig {
  ToolsOzoneServerGetConfigServiceConfig(url: Option(String))
}

pub type AppBskyEmbedImagesImage {
  AppBskyEmbedImagesImage(
    alt: String,
    aspect_ratio: Option(AppBskyEmbedDefsAspectRatio),
    image: String,
  )
}

pub type AppBskyEmbedExternalViewExternal {
  AppBskyEmbedExternalViewExternal(
    uri: String,
    thumb: Option(String),
    title: String,
    description: String,
  )
}

pub type AppBskyEmbedRecordWithMediaView {
  AppBskyEmbedRecordWithMediaView(
    media: json.Json,
    record: AppBskyEmbedRecordView,
  )
}

pub type AppBskyFeedDefsSkeletonFeedPost {
  AppBskyFeedDefsSkeletonFeedPost(
    post: String,
    reason: Option(json.Json),
    feed_context: Option(String),
  )
}

pub type ComAtprotoLexiconSchema {
  ComAtprotoLexiconSchema(lexicon: Int)
}

pub type AppBskyGraphVerification {
  AppBskyGraphVerification(
    handle: String,
    subject: String,
    display_name: String,
    created_at: String,
  )
}

pub type ChatBskyConvoDefsLogRemoveReaction {
  ChatBskyConvoDefsLogRemoveReaction(
    rev: String,
    message: json.Json,
    reaction: ChatBskyConvoDefsReactionView,
    convo_id: String,
  )
}

pub type AppBskyEmbedRecordViewDetached {
  AppBskyEmbedRecordViewDetached(uri: String, detached: Bool)
}

pub type ComAtprotoSyncSubscribeReposRepoOp {
  ComAtprotoSyncSubscribeReposRepoOp(
    path_: String,
    prev: Option(String),
    action: String,
    cid: String,
  )
}

pub type ToolsOzoneModerationDefsIdentityEvent {
  ToolsOzoneModerationDefsIdentityEvent(
    pds_host: Option(String),
    handle: Option(String),
    tombstone: Option(Bool),
    timestamp: String,
    comment: Option(String),
  )
}

pub type ComAtprotoRepoApplyWritesCreate {
  ComAtprotoRepoApplyWritesCreate(
    rkey: Option(String),
    value: json.Json,
    collection: String,
  )
}

pub type ToolsOzoneModerationDefsModEventLabel {
  ToolsOzoneModerationDefsModEventLabel(
    negate_label_vals: List(String),
    create_label_vals: List(String),
    duration_in_hours: Option(Int),
    comment: Option(String),
  )
}

pub type ComAtprotoAdminDefsStatusAttr {
  ComAtprotoAdminDefsStatusAttr(ref: Option(String), applied: Bool)
}

pub type AppBskyFeedDefsGeneratorViewerState {
  AppBskyFeedDefsGeneratorViewerState(like: Option(String))
}

pub type ComAtprotoServerDescribeServerLinks {
  ComAtprotoServerDescribeServerLinks(
    terms_of_service: Option(String),
    privacy_policy: Option(String),
  )
}

pub type ToolsOzoneSignatureDefsSigDetail {
  ToolsOzoneSignatureDefsSigDetail(value: String, property: String)
}

pub type AppBskyGraphDefsStarterPackViewBasic {
  AppBskyGraphDefsStarterPackViewBasic(
    indexed_at: String,
    joined_all_time_count: Option(Int),
    creator: AppBskyActorDefsProfileViewBasic,
    uri: String,
    record: json.Json,
    joined_week_count: Option(Int),
    cid: String,
    list_item_count: Option(Int),
    labels: Option(List(ComAtprotoLabelDefsLabel)),
  )
}

pub type ToolsOzoneModerationDefsModEventTakedown {
  ToolsOzoneModerationDefsModEventTakedown(
    policies: Option(List(String)),
    duration_in_hours: Option(Int),
    acknowledge_account_subjects: Option(Bool),
    comment: Option(String),
  )
}

pub type ToolsOzoneModerationDefsReviewOpen =
  String

pub type AppBskyActorDefsMutedWordTarget =
  String

pub type ToolsOzoneTeamDefsRoleVerifier =
  String

pub type AppBskyGraphDefsListPurpose =
  json.Json

pub type AppBskyFeedThreadgateFollowingRule =
  dict.Dict(String, json.Json)

pub type AppBskyGraphDefsModlist =
  String

pub type ToolsOzoneModerationDefsReviewClosed =
  String

pub type AppBskyFeedDefsClickthroughItem =
  String

pub type ComAtprotoModerationDefsReasonViolation =
  String

pub type ToolsOzoneTeamDefsRoleAdmin =
  String

pub type AppBskyFeedThreadgateFollowerRule =
  dict.Dict(String, json.Json)

pub type ComAtprotoModerationDefsReasonRude =
  String

pub type ComAtprotoModerationDefsSubjectType =
  String

pub type AppBskyNotificationDefsRecordDeleted =
  dict.Dict(String, json.Json)

pub type AppBskyFeedDefsClickthroughEmbed =
  String

pub type ComAtprotoRepoApplyWritesDeleteResult =
  dict.Dict(String, json.Json)

pub type AppBskyFeedDefsInteractionReply =
  String

pub type ToolsOzoneModerationDefsSubjectReviewState =
  String

pub type AppBskyGraphDefsReferencelist =
  String

pub type ComAtprotoModerationDefsReasonSpam =
  String

pub type AppBskyFeedDefsContentModeUnspecified =
  String

pub type AppBskyActorStatusLive =
  String

pub type ComAtprotoSyncDefsHostStatus =
  String

pub type AppBskyGraphDefsCuratelist =
  String

pub type ToolsOzoneModerationDefsReviewNone =
  String

pub type ComAtprotoModerationDefsReasonOther =
  String

pub type AppBskyFeedPostgateDisableRule =
  dict.Dict(String, json.Json)

pub type AppBskyFeedDefsClickthroughReposter =
  String

pub type ComAtprotoModerationDefsReasonAppeal =
  String

pub type AppBskyFeedDefsContentModeVideo =
  String

pub type ComAtprotoModerationDefsReasonMisleading =
  String

pub type AppBskyFeedDefsRequestMore =
  String

pub type AppBskyFeedDefsSkeletonReasonPin =
  dict.Dict(String, json.Json)

pub type AppBskyFeedDefsInteractionRepost =
  String

pub type AppBskyActorDefsPreferences =
  List(json.Json)

pub type ToolsOzoneHostingGetAccountHistoryPasswordUpdated =
  dict.Dict(String, json.Json)

pub type AppBskyFeedDefsRequestLess =
  String

pub type AppBskyFeedDefsPostView =
  utils.Never

pub type AppBskyFeedDefsInteractionLike =
  String

pub type AppBskyFeedDefsClickthroughAuthor =
  String

pub type ToolsOzoneTeamDefsRoleModerator =
  String

pub type AppBskyFeedThreadgateMentionRule =
  dict.Dict(String, json.Json)

pub type AppBskyFeedDefsInteractionSeen =
  String

pub type ComAtprotoModerationDefsReasonSexual =
  String

pub type AppBskyFeedDefsInteractionQuote =
  String

pub type ComAtprotoModerationDefsReasonType =
  json.Json

pub type ToolsOzoneModerationDefsReviewEscalated =
  String

pub type ComAtprotoLabelDefsLabelValue =
  String

pub type ToolsOzoneTeamDefsRoleTriage =
  String

pub type AppBskyFeedDefsReasonPin =
  dict.Dict(String, json.Json)

pub type AppBskyFeedDefsInteractionShare =
  String

pub fn app_bsky_feed_defs_interaction_share_decoder() {
  decode.string
}

pub fn app_bsky_feed_defs_interaction_share_encode(
  data: AppBskyFeedDefsInteractionShare,
) {
  json.string(data)
}

pub fn tools_ozone_moderation_defs_mod_event_takedown_decoder() {
  use policies <- decode.optional_field(
    "policies",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use duration_in_hours <- decode.optional_field(
    "durationInHours",
    None,
    decode.optional(decode.int),
  )
  use acknowledge_account_subjects <- decode.optional_field(
    "acknowledgeAccountSubjects",
    None,
    decode.optional(decode.bool),
  )
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneModerationDefsModEventTakedown(
      policies: policies,
      duration_in_hours: duration_in_hours,
      acknowledge_account_subjects: acknowledge_account_subjects,
      comment: comment,
    ),
  )
}

pub fn tools_ozone_moderation_defs_mod_event_takedown_encode(
  data: ToolsOzoneModerationDefsModEventTakedown,
) {
  utils.object(
    [
      #("policies", json.nullable(data.policies, json.array(_, json.string))),
      #("durationInHours", json.nullable(data.duration_in_hours, json.int)),
      #(
        "acknowledgeAccountSubjects",
        json.nullable(data.acknowledge_account_subjects, json.bool),
      ),
      #("comment", json.nullable(data.comment, json.string))
    ],
  )
}

pub fn app_bsky_feed_defs_reason_pin_decoder() {
  decode.dict(decode.string, utils.dynamic_to_json())
}

pub fn app_bsky_feed_defs_reason_pin_encode(data: AppBskyFeedDefsReasonPin) {
  utils.dict(data, fn(data) { data })
}

pub fn tools_ozone_team_defs_role_triage_decoder() {
  decode.string
}

pub fn tools_ozone_team_defs_role_triage_encode(
  data: ToolsOzoneTeamDefsRoleTriage,
) {
  json.string(data)
}

pub fn app_bsky_graph_defs_starter_pack_view_basic_decoder() {
  use indexed_at <- decode.field("indexedAt", decode.string)
  use joined_all_time_count <- decode.optional_field(
    "joinedAllTimeCount",
    None,
    decode.optional(decode.int),
  )
  use creator <- decode.field(
    "creator",
    app_bsky_actor_defs_profile_view_basic_decoder(),
  )
  use uri <- decode.field("uri", decode.string)
  use record <- decode.field("record", utils.dynamic_to_json())
  use joined_week_count <- decode.optional_field(
    "joinedWeekCount",
    None,
    decode.optional(decode.int),
  )
  use cid <- decode.field("cid", decode.string)
  use list_item_count <- decode.optional_field(
    "listItemCount",
    None,
    decode.optional(decode.int),
  )
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(decode.list(com_atproto_label_defs_label_decoder())),
  )
  decode.success(
    AppBskyGraphDefsStarterPackViewBasic(
      indexed_at: indexed_at,
      joined_all_time_count: joined_all_time_count,
      creator: creator,
      uri: uri,
      record: record,
      joined_week_count: joined_week_count,
      cid: cid,
      list_item_count: list_item_count,
      labels: labels,
    ),
  )
}

pub fn app_bsky_graph_defs_starter_pack_view_basic_encode(
  data: AppBskyGraphDefsStarterPackViewBasic,
) {
  utils.object(
    [
      #("indexedAt", json.string(data.indexed_at)),
      #(
        "joinedAllTimeCount",
        json.nullable(data.joined_all_time_count, json.int),
      ),
      #("creator", app_bsky_actor_defs_profile_view_basic_encode(data.creator)),
      #("uri", json.string(data.uri)),
      #("record", fn(data) { data }(data.record)),
      #("joinedWeekCount", json.nullable(data.joined_week_count, json.int)),
      #("cid", json.string(data.cid)),
      #("listItemCount", json.nullable(data.list_item_count, json.int)),
      #(
        "labels",
        json.nullable(
          data.labels,
          json.array(_, com_atproto_label_defs_label_encode),
        ),
      )
    ],
  )
}

pub fn tools_ozone_signature_defs_sig_detail_decoder() {
  use value <- decode.field("value", decode.string)
  use property <- decode.field("property", decode.string)
  decode.success(
    ToolsOzoneSignatureDefsSigDetail(value: value, property: property),
  )
}

pub fn tools_ozone_signature_defs_sig_detail_encode(
  data: ToolsOzoneSignatureDefsSigDetail,
) {
  utils.object(
    [
      #("value", json.string(data.value)),
      #("property", json.string(data.property))
    ],
  )
}

pub fn com_atproto_server_describe_server_links_decoder() {
  use terms_of_service <- decode.optional_field(
    "termsOfService",
    None,
    decode.optional(decode.string),
  )
  use privacy_policy <- decode.optional_field(
    "privacyPolicy",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ComAtprotoServerDescribeServerLinks(
      terms_of_service: terms_of_service,
      privacy_policy: privacy_policy,
    ),
  )
}

pub fn com_atproto_server_describe_server_links_encode(
  data: ComAtprotoServerDescribeServerLinks,
) {
  utils.object(
    [
      #("termsOfService", json.nullable(data.terms_of_service, json.string)),
      #("privacyPolicy", json.nullable(data.privacy_policy, json.string))
    ],
  )
}

pub fn app_bsky_feed_defs_generator_viewer_state_decoder() {
  use like <- decode.optional_field("like", None, decode.optional(decode.string))
  decode.success(AppBskyFeedDefsGeneratorViewerState(like: like))
}

pub fn app_bsky_feed_defs_generator_viewer_state_encode(
  data: AppBskyFeedDefsGeneratorViewerState,
) {
  utils.object([#("like", json.nullable(data.like, json.string))])
}

pub fn com_atproto_admin_defs_status_attr_decoder() {
  use ref <- decode.optional_field("ref", None, decode.optional(decode.string))
  use applied <- decode.field("applied", decode.bool)
  decode.success(ComAtprotoAdminDefsStatusAttr(ref: ref, applied: applied))
}

pub fn com_atproto_admin_defs_status_attr_encode(
  data: ComAtprotoAdminDefsStatusAttr,
) {
  utils.object(
    [
      #("ref", json.nullable(data.ref, json.string)),
      #("applied", json.bool(data.applied))
    ],
  )
}

pub fn tools_ozone_moderation_defs_mod_event_label_decoder() {
  use negate_label_vals <- decode.field(
    "negateLabelVals",
    decode.list(decode.string),
  )
  use create_label_vals <- decode.field(
    "createLabelVals",
    decode.list(decode.string),
  )
  use duration_in_hours <- decode.optional_field(
    "durationInHours",
    None,
    decode.optional(decode.int),
  )
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneModerationDefsModEventLabel(
      negate_label_vals: negate_label_vals,
      create_label_vals: create_label_vals,
      duration_in_hours: duration_in_hours,
      comment: comment,
    ),
  )
}

pub fn tools_ozone_moderation_defs_mod_event_label_encode(
  data: ToolsOzoneModerationDefsModEventLabel,
) {
  utils.object(
    [
      #("negateLabelVals", json.array(_, json.string)(data.negate_label_vals)),
      #("createLabelVals", json.array(_, json.string)(data.create_label_vals)),
      #("durationInHours", json.nullable(data.duration_in_hours, json.int)),
      #("comment", json.nullable(data.comment, json.string))
    ],
  )
}

pub fn com_atproto_repo_apply_writes_create_decoder() {
  use rkey <- decode.optional_field("rkey", None, decode.optional(decode.string))
  use value <- decode.field("value", utils.dynamic_to_json())
  use collection <- decode.field("collection", decode.string)
  decode.success(
    ComAtprotoRepoApplyWritesCreate(
      rkey: rkey,
      value: value,
      collection: collection,
    ),
  )
}

pub fn com_atproto_repo_apply_writes_create_encode(
  data: ComAtprotoRepoApplyWritesCreate,
) {
  utils.object(
    [
      #("rkey", json.nullable(data.rkey, json.string)),
      #("value", fn(data) { data }(data.value)),
      #("collection", json.string(data.collection))
    ],
  )
}

pub fn tools_ozone_moderation_defs_identity_event_decoder() {
  use pds_host <- decode.optional_field(
    "pdsHost",
    None,
    decode.optional(decode.string),
  )
  use handle <- decode.optional_field(
    "handle",
    None,
    decode.optional(decode.string),
  )
  use tombstone <- decode.optional_field(
    "tombstone",
    None,
    decode.optional(decode.bool),
  )
  use timestamp <- decode.field("timestamp", decode.string)
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneModerationDefsIdentityEvent(
      pds_host: pds_host,
      handle: handle,
      tombstone: tombstone,
      timestamp: timestamp,
      comment: comment,
    ),
  )
}

pub fn tools_ozone_moderation_defs_identity_event_encode(
  data: ToolsOzoneModerationDefsIdentityEvent,
) {
  utils.object(
    [
      #("pdsHost", json.nullable(data.pds_host, json.string)),
      #("handle", json.nullable(data.handle, json.string)),
      #("tombstone", json.nullable(data.tombstone, json.bool)),
      #("timestamp", json.string(data.timestamp)),
      #("comment", json.nullable(data.comment, json.string))
    ],
  )
}

pub fn com_atproto_sync_subscribe_repos_repo_op_decoder() {
  use path_ <- decode.field("path", decode.string)
  use prev <- decode.optional_field("prev", None, decode.optional(decode.string))
  use action <- decode.field("action", decode.string)
  use cid <- decode.field("cid", decode.string)
  decode.success(
    ComAtprotoSyncSubscribeReposRepoOp(
      path_: path_,
      prev: prev,
      action: action,
      cid: cid,
    ),
  )
}

pub fn com_atproto_sync_subscribe_repos_repo_op_encode(
  data: ComAtprotoSyncSubscribeReposRepoOp,
) {
  utils.object(
    [
      #("path", json.string(data.path_)),
      #("prev", json.nullable(data.prev, json.string)),
      #("action", json.string(data.action)),
      #("cid", json.string(data.cid))
    ],
  )
}

pub fn app_bsky_embed_record_view_detached_decoder() {
  use uri <- decode.field("uri", decode.string)
  use detached <- decode.field("detached", decode.bool)
  decode.success(AppBskyEmbedRecordViewDetached(uri: uri, detached: detached))
}

pub fn app_bsky_embed_record_view_detached_encode(
  data: AppBskyEmbedRecordViewDetached,
) {
  utils.object(
    [#("uri", json.string(data.uri)), #("detached", json.bool(data.detached))],
  )
}

pub fn chat_bsky_convo_defs_log_remove_reaction_decoder() {
  use rev <- decode.field("rev", decode.string)
  use message <- decode.field("message", utils.dynamic_to_json())
  use reaction <- decode.field(
    "reaction",
    chat_bsky_convo_defs_reaction_view_decoder(),
  )
  use convo_id <- decode.field("convoId", decode.string)
  decode.success(
    ChatBskyConvoDefsLogRemoveReaction(
      rev: rev,
      message: message,
      reaction: reaction,
      convo_id: convo_id,
    ),
  )
}

pub fn chat_bsky_convo_defs_log_remove_reaction_encode(
  data: ChatBskyConvoDefsLogRemoveReaction,
) {
  utils.object(
    [
      #("rev", json.string(data.rev)),
      #("message", fn(data) { data }(data.message)),
      #("reaction", chat_bsky_convo_defs_reaction_view_encode(data.reaction)),
      #("convoId", json.string(data.convo_id))
    ],
  )
}

pub fn app_bsky_graph_verification_decoder() {
  use handle <- decode.field("handle", decode.string)
  use subject <- decode.field("subject", decode.string)
  use display_name <- decode.field("displayName", decode.string)
  use created_at <- decode.field("createdAt", decode.string)
  decode.success(
    AppBskyGraphVerification(
      handle: handle,
      subject: subject,
      display_name: display_name,
      created_at: created_at,
    ),
  )
}

pub fn app_bsky_graph_verification_encode(data: AppBskyGraphVerification) {
  utils.object(
    [
      #("handle", json.string(data.handle)),
      #("subject", json.string(data.subject)),
      #("displayName", json.string(data.display_name)),
      #("createdAt", json.string(data.created_at))
    ],
  )
}

pub fn com_atproto_lexicon_schema_decoder() {
  use lexicon <- decode.field("lexicon", decode.int)
  decode.success(ComAtprotoLexiconSchema(lexicon: lexicon))
}

pub fn com_atproto_lexicon_schema_encode(data: ComAtprotoLexiconSchema) {
  utils.object([#("lexicon", json.int(data.lexicon))])
}

pub fn com_atproto_label_defs_label_value_decoder() {
  decode.string
}

pub fn com_atproto_label_defs_label_value_encode(
  data: ComAtprotoLabelDefsLabelValue,
) {
  json.string(data)
}

pub fn app_bsky_feed_defs_skeleton_feed_post_decoder() {
  use post <- decode.field("post", decode.string)
  use reason <- decode.optional_field(
    "reason",
    None,
    decode.optional(utils.dynamic_to_json()),
  )
  use feed_context <- decode.optional_field(
    "feedContext",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    AppBskyFeedDefsSkeletonFeedPost(
      post: post,
      reason: reason,
      feed_context: feed_context,
    ),
  )
}

pub fn app_bsky_feed_defs_skeleton_feed_post_encode(
  data: AppBskyFeedDefsSkeletonFeedPost,
) {
  utils.object(
    [
      #("post", json.string(data.post)),
      #("reason", json.nullable(data.reason, fn(data) { data })),
      #("feedContext", json.nullable(data.feed_context, json.string))
    ],
  )
}

pub fn app_bsky_embed_record_with_media_view_decoder() {
  use media <- decode.field("media", utils.dynamic_to_json())
  use record <- decode.field("record", app_bsky_embed_record_view_decoder())
  decode.success(AppBskyEmbedRecordWithMediaView(media: media, record: record))
}

pub fn app_bsky_embed_record_with_media_view_encode(
  data: AppBskyEmbedRecordWithMediaView,
) {
  utils.object(
    [
      #("media", fn(data) { data }(data.media)),
      #("record", app_bsky_embed_record_view_encode(data.record))
    ],
  )
}

pub fn tools_ozone_moderation_defs_review_escalated_decoder() {
  decode.string
}

pub fn tools_ozone_moderation_defs_review_escalated_encode(
  data: ToolsOzoneModerationDefsReviewEscalated,
) {
  json.string(data)
}

pub fn app_bsky_embed_external_view_external_decoder() {
  use uri <- decode.field("uri", decode.string)
  use thumb <- decode.optional_field(
    "thumb",
    None,
    decode.optional(decode.string),
  )
  use title <- decode.field("title", decode.string)
  use description <- decode.field("description", decode.string)
  decode.success(
    AppBskyEmbedExternalViewExternal(
      uri: uri,
      thumb: thumb,
      title: title,
      description: description,
    ),
  )
}

pub fn app_bsky_embed_external_view_external_encode(
  data: AppBskyEmbedExternalViewExternal,
) {
  utils.object(
    [
      #("uri", json.string(data.uri)),
      #("thumb", json.nullable(data.thumb, json.string)),
      #("title", json.string(data.title)),
      #("description", json.string(data.description))
    ],
  )
}

pub fn app_bsky_embed_images_image_decoder() {
  use alt <- decode.field("alt", decode.string)
  use aspect_ratio <- decode.optional_field(
    "aspectRatio",
    None,
    decode.optional(app_bsky_embed_defs_aspect_ratio_decoder()),
  )
  use image <- decode.field("image", decode.string)
  decode.success(
    AppBskyEmbedImagesImage(alt: alt, aspect_ratio: aspect_ratio, image: image),
  )
}

pub fn app_bsky_embed_images_image_encode(data: AppBskyEmbedImagesImage) {
  utils.object(
    [
      #("alt", json.string(data.alt)),
      #(
        "aspectRatio",
        json.nullable(data.aspect_ratio, app_bsky_embed_defs_aspect_ratio_encode),
      ),
      #("image", json.string(data.image))
    ],
  )
}

pub fn tools_ozone_server_get_config_service_config_decoder() {
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  decode.success(ToolsOzoneServerGetConfigServiceConfig(url: url))
}

pub fn tools_ozone_server_get_config_service_config_encode(
  data: ToolsOzoneServerGetConfigServiceConfig,
) {
  utils.object([#("url", json.nullable(data.url, json.string))])
}

pub fn com_atproto_moderation_defs_reason_type_decoder() {
  utils.dynamic_to_json()
}

pub fn com_atproto_moderation_defs_reason_type_encode(
  data: ComAtprotoModerationDefsReasonType,
) {
  data
}

pub fn app_bsky_embed_record_view_record_decoder() {
  use indexed_at <- decode.field("indexedAt", decode.string)
  use reply_count <- decode.optional_field(
    "replyCount",
    None,
    decode.optional(decode.int),
  )
  use author <- decode.field(
    "author",
    app_bsky_actor_defs_profile_view_basic_decoder(),
  )
  use uri <- decode.field("uri", decode.string)
  use value <- decode.field("value", utils.dynamic_to_json())
  use quote_count <- decode.optional_field(
    "quoteCount",
    None,
    decode.optional(decode.int),
  )
  use like_count <- decode.optional_field(
    "likeCount",
    None,
    decode.optional(decode.int),
  )
  use embeds <- decode.optional_field(
    "embeds",
    None,
    decode.optional(decode.list(utils.dynamic_to_json())),
  )
  use repost_count <- decode.optional_field(
    "repostCount",
    None,
    decode.optional(decode.int),
  )
  use cid <- decode.field("cid", decode.string)
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(decode.list(com_atproto_label_defs_label_decoder())),
  )
  decode.success(
    AppBskyEmbedRecordViewRecord(
      indexed_at: indexed_at,
      reply_count: reply_count,
      author: author,
      uri: uri,
      value: value,
      quote_count: quote_count,
      like_count: like_count,
      embeds: embeds,
      repost_count: repost_count,
      cid: cid,
      labels: labels,
    ),
  )
}

pub fn app_bsky_embed_record_view_record_encode(
  data: AppBskyEmbedRecordViewRecord,
) {
  utils.object(
    [
      #("indexedAt", json.string(data.indexed_at)),
      #("replyCount", json.nullable(data.reply_count, json.int)),
      #("author", app_bsky_actor_defs_profile_view_basic_encode(data.author)),
      #("uri", json.string(data.uri)),
      #("value", fn(data) { data }(data.value)),
      #("quoteCount", json.nullable(data.quote_count, json.int)),
      #("likeCount", json.nullable(data.like_count, json.int)),
      #("embeds", json.nullable(data.embeds, json.array(_, fn(data) { data }))),
      #("repostCount", json.nullable(data.repost_count, json.int)),
      #("cid", json.string(data.cid)),
      #(
        "labels",
        json.nullable(
          data.labels,
          json.array(_, com_atproto_label_defs_label_encode),
        ),
      )
    ],
  )
}

pub fn app_bsky_feed_defs_interaction_quote_decoder() {
  decode.string
}

pub fn app_bsky_feed_defs_interaction_quote_encode(
  data: AppBskyFeedDefsInteractionQuote,
) {
  json.string(data)
}

pub fn app_bsky_embed_video_caption_decoder() {
  use lang <- decode.field("lang", decode.string)
  use file <- decode.field("file", decode.string)
  decode.success(AppBskyEmbedVideoCaption(lang: lang, file: file))
}

pub fn app_bsky_embed_video_caption_encode(data: AppBskyEmbedVideoCaption) {
  utils.object(
    [#("lang", json.string(data.lang)), #("file", json.string(data.file))],
  )
}

pub fn app_bsky_actor_defs_status_view_decoder() {
  use expires_at <- decode.optional_field(
    "expiresAt",
    None,
    decode.optional(decode.string),
  )
  use is_active <- decode.optional_field(
    "isActive",
    None,
    decode.optional(decode.bool),
  )
  use record <- decode.field("record", utils.dynamic_to_json())
  use status <- decode.field("status", decode.string)
  use embed <- decode.optional_field(
    "embed",
    None,
    decode.optional(app_bsky_embed_external_view_decoder()),
  )
  decode.success(
    AppBskyActorDefsStatusView(
      expires_at: expires_at,
      is_active: is_active,
      record: record,
      status: status,
      embed: embed,
    ),
  )
}

pub fn app_bsky_actor_defs_status_view_encode(data: AppBskyActorDefsStatusView) {
  utils.object(
    [
      #("expiresAt", json.nullable(data.expires_at, json.string)),
      #("isActive", json.nullable(data.is_active, json.bool)),
      #("record", fn(data) { data }(data.record)),
      #("status", json.string(data.status)),
      #("embed", json.nullable(data.embed, app_bsky_embed_external_view_encode))
    ],
  )
}

pub fn com_atproto_moderation_defs_reason_sexual_decoder() {
  decode.string
}

pub fn com_atproto_moderation_defs_reason_sexual_encode(
  data: ComAtprotoModerationDefsReasonSexual,
) {
  json.string(data)
}

pub fn tools_ozone_moderation_defs_records_stats_decoder() {
  use processed_count <- decode.optional_field(
    "processedCount",
    None,
    decode.optional(decode.int),
  )
  use appealed_count <- decode.optional_field(
    "appealedCount",
    None,
    decode.optional(decode.int),
  )
  use subject_count <- decode.optional_field(
    "subjectCount",
    None,
    decode.optional(decode.int),
  )
  use takendown_count <- decode.optional_field(
    "takendownCount",
    None,
    decode.optional(decode.int),
  )
  use pending_count <- decode.optional_field(
    "pendingCount",
    None,
    decode.optional(decode.int),
  )
  use total_reports <- decode.optional_field(
    "totalReports",
    None,
    decode.optional(decode.int),
  )
  use reported_count <- decode.optional_field(
    "reportedCount",
    None,
    decode.optional(decode.int),
  )
  use escalated_count <- decode.optional_field(
    "escalatedCount",
    None,
    decode.optional(decode.int),
  )
  decode.success(
    ToolsOzoneModerationDefsRecordsStats(
      processed_count: processed_count,
      appealed_count: appealed_count,
      subject_count: subject_count,
      takendown_count: takendown_count,
      pending_count: pending_count,
      total_reports: total_reports,
      reported_count: reported_count,
      escalated_count: escalated_count,
    ),
  )
}

pub fn tools_ozone_moderation_defs_records_stats_encode(
  data: ToolsOzoneModerationDefsRecordsStats,
) {
  utils.object(
    [
      #("processedCount", json.nullable(data.processed_count, json.int)),
      #("appealedCount", json.nullable(data.appealed_count, json.int)),
      #("subjectCount", json.nullable(data.subject_count, json.int)),
      #("takendownCount", json.nullable(data.takendown_count, json.int)),
      #("pendingCount", json.nullable(data.pending_count, json.int)),
      #("totalReports", json.nullable(data.total_reports, json.int)),
      #("reportedCount", json.nullable(data.reported_count, json.int)),
      #("escalatedCount", json.nullable(data.escalated_count, json.int))
    ],
  )
}

pub fn tools_ozone_moderation_defs_mod_event_view_decoder() {
  use subject <- decode.field("subject", utils.dynamic_to_json())
  use creator_handle <- decode.optional_field(
    "creatorHandle",
    None,
    decode.optional(decode.string),
  )
  use subject_handle <- decode.optional_field(
    "subjectHandle",
    None,
    decode.optional(decode.string),
  )
  use event <- decode.field("event", utils.dynamic_to_json())
  use id <- decode.field("id", decode.int)
  use created_at <- decode.field("createdAt", decode.string)
  use subject_blob_cids <- decode.field(
    "subjectBlobCids",
    decode.list(decode.string),
  )
  use created_by <- decode.field("createdBy", decode.string)
  decode.success(
    ToolsOzoneModerationDefsModEventView(
      subject: subject,
      creator_handle: creator_handle,
      subject_handle: subject_handle,
      event: event,
      id: id,
      created_at: created_at,
      subject_blob_cids: subject_blob_cids,
      created_by: created_by,
    ),
  )
}

pub fn tools_ozone_moderation_defs_mod_event_view_encode(
  data: ToolsOzoneModerationDefsModEventView,
) {
  utils.object(
    [
      #("subject", fn(data) { data }(data.subject)),
      #("creatorHandle", json.nullable(data.creator_handle, json.string)),
      #("subjectHandle", json.nullable(data.subject_handle, json.string)),
      #("event", fn(data) { data }(data.event)),
      #("id", json.int(data.id)),
      #("createdAt", json.string(data.created_at)),
      #("subjectBlobCids", json.array(_, json.string)(data.subject_blob_cids)),
      #("createdBy", json.string(data.created_by))
    ],
  )
}

pub fn com_atproto_repo_apply_writes_create_result_decoder() {
  use validation_status <- decode.optional_field(
    "validationStatus",
    None,
    decode.optional(decode.string),
  )
  use uri <- decode.field("uri", decode.string)
  use cid <- decode.field("cid", decode.string)
  decode.success(
    ComAtprotoRepoApplyWritesCreateResult(
      validation_status: validation_status,
      uri: uri,
      cid: cid,
    ),
  )
}

pub fn com_atproto_repo_apply_writes_create_result_encode(
  data: ComAtprotoRepoApplyWritesCreateResult,
) {
  utils.object(
    [
      #("validationStatus", json.nullable(data.validation_status, json.string)),
      #("uri", json.string(data.uri)),
      #("cid", json.string(data.cid))
    ],
  )
}

pub fn app_bsky_feed_defs_interaction_seen_decoder() {
  decode.string
}

pub fn app_bsky_feed_defs_interaction_seen_encode(
  data: AppBskyFeedDefsInteractionSeen,
) {
  json.string(data)
}

pub fn app_bsky_feed_threadgate_mention_rule_decoder() {
  decode.dict(decode.string, utils.dynamic_to_json())
}

pub fn app_bsky_feed_threadgate_mention_rule_encode(
  data: AppBskyFeedThreadgateMentionRule,
) {
  utils.dict(data, fn(data) { data })
}

pub fn app_bsky_feed_defs_reply_ref_decoder() {
  use grandparent_author <- decode.optional_field(
    "grandparentAuthor",
    None,
    decode.optional(app_bsky_actor_defs_profile_view_basic_decoder()),
  )
  use root <- decode.field("root", utils.dynamic_to_json())
  use parent <- decode.field("parent", utils.dynamic_to_json())
  decode.success(
    AppBskyFeedDefsReplyRef(
      grandparent_author: grandparent_author,
      root: root,
      parent: parent,
    ),
  )
}

pub fn app_bsky_feed_defs_reply_ref_encode(data: AppBskyFeedDefsReplyRef) {
  utils.object(
    [
      #(
        "grandparentAuthor",
        json.nullable(
          data.grandparent_author,
          app_bsky_actor_defs_profile_view_basic_encode,
        ),
      ),
      #("root", fn(data) { data }(data.root)),
      #("parent", fn(data) { data }(data.parent))
    ],
  )
}

pub fn chat_bsky_convo_defs_log_create_message_decoder() {
  use rev <- decode.field("rev", decode.string)
  use message <- decode.field("message", utils.dynamic_to_json())
  use convo_id <- decode.field("convoId", decode.string)
  decode.success(
    ChatBskyConvoDefsLogCreateMessage(
      rev: rev,
      message: message,
      convo_id: convo_id,
    ),
  )
}

pub fn chat_bsky_convo_defs_log_create_message_encode(
  data: ChatBskyConvoDefsLogCreateMessage,
) {
  utils.object(
    [
      #("rev", json.string(data.rev)),
      #("message", fn(data) { data }(data.message)),
      #("convoId", json.string(data.convo_id))
    ],
  )
}

pub fn app_bsky_embed_record_view_not_found_decoder() {
  use uri <- decode.field("uri", decode.string)
  use not_found <- decode.field("notFound", decode.bool)
  decode.success(AppBskyEmbedRecordViewNotFound(uri: uri, not_found: not_found))
}

pub fn app_bsky_embed_record_view_not_found_encode(
  data: AppBskyEmbedRecordViewNotFound,
) {
  utils.object(
    [#("uri", json.string(data.uri)), #("notFound", json.bool(data.not_found))],
  )
}

pub fn chat_bsky_convo_defs_log_add_reaction_decoder() {
  use rev <- decode.field("rev", decode.string)
  use message <- decode.field("message", utils.dynamic_to_json())
  use reaction <- decode.field(
    "reaction",
    chat_bsky_convo_defs_reaction_view_decoder(),
  )
  use convo_id <- decode.field("convoId", decode.string)
  decode.success(
    ChatBskyConvoDefsLogAddReaction(
      rev: rev,
      message: message,
      reaction: reaction,
      convo_id: convo_id,
    ),
  )
}

pub fn chat_bsky_convo_defs_log_add_reaction_encode(
  data: ChatBskyConvoDefsLogAddReaction,
) {
  utils.object(
    [
      #("rev", json.string(data.rev)),
      #("message", fn(data) { data }(data.message)),
      #("reaction", chat_bsky_convo_defs_reaction_view_encode(data.reaction)),
      #("convoId", json.string(data.convo_id))
    ],
  )
}

pub fn app_bsky_feed_defs_blocked_post_decoder() {
  use author <- decode.field(
    "author",
    app_bsky_feed_defs_blocked_author_decoder(),
  )
  use uri <- decode.field("uri", decode.string)
  use blocked <- decode.field("blocked", decode.bool)
  decode.success(
    AppBskyFeedDefsBlockedPost(author: author, uri: uri, blocked: blocked),
  )
}

pub fn app_bsky_feed_defs_blocked_post_encode(data: AppBskyFeedDefsBlockedPost) {
  utils.object(
    [
      #("author", app_bsky_feed_defs_blocked_author_encode(data.author)),
      #("uri", json.string(data.uri)),
      #("blocked", json.bool(data.blocked))
    ],
  )
}

pub fn app_bsky_actor_defs_viewer_state_decoder() {
  use muted_by_list <- decode.optional_field(
    "mutedByList",
    None,
    decode.optional(app_bsky_graph_defs_list_view_basic_decoder()),
  )
  use blocked_by <- decode.optional_field(
    "blockedBy",
    None,
    decode.optional(decode.bool),
  )
  use followed_by <- decode.optional_field(
    "followedBy",
    None,
    decode.optional(decode.string),
  )
  use blocking_by_list <- decode.optional_field(
    "blockingByList",
    None,
    decode.optional(app_bsky_graph_defs_list_view_basic_decoder()),
  )
  use muted <- decode.optional_field("muted", None, decode.optional(decode.bool))
  use following <- decode.optional_field(
    "following",
    None,
    decode.optional(decode.string),
  )
  use known_followers <- decode.optional_field(
    "knownFollowers",
    None,
    decode.optional(app_bsky_actor_defs_known_followers_decoder()),
  )
  use blocking <- decode.optional_field(
    "blocking",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    AppBskyActorDefsViewerState(
      muted_by_list: muted_by_list,
      blocked_by: blocked_by,
      followed_by: followed_by,
      blocking_by_list: blocking_by_list,
      muted: muted,
      following: following,
      known_followers: known_followers,
      blocking: blocking,
    ),
  )
}

pub fn app_bsky_actor_defs_viewer_state_encode(data: AppBskyActorDefsViewerState) {
  utils.object(
    [
      #(
        "mutedByList",
        json.nullable(
          data.muted_by_list,
          app_bsky_graph_defs_list_view_basic_encode,
        ),
      ),
      #("blockedBy", json.nullable(data.blocked_by, json.bool)),
      #("followedBy", json.nullable(data.followed_by, json.string)),
      #(
        "blockingByList",
        json.nullable(
          data.blocking_by_list,
          app_bsky_graph_defs_list_view_basic_encode,
        ),
      ),
      #("muted", json.nullable(data.muted, json.bool)),
      #("following", json.nullable(data.following, json.string)),
      #(
        "knownFollowers",
        json.nullable(
          data.known_followers,
          app_bsky_actor_defs_known_followers_encode,
        ),
      ),
      #("blocking", json.nullable(data.blocking, json.string))
    ],
  )
}

pub fn tools_ozone_team_defs_role_moderator_decoder() {
  decode.string
}

pub fn tools_ozone_team_defs_role_moderator_encode(
  data: ToolsOzoneTeamDefsRoleModerator,
) {
  json.string(data)
}

pub fn app_bsky_feed_defs_clickthrough_author_decoder() {
  decode.string
}

pub fn app_bsky_feed_defs_clickthrough_author_encode(
  data: AppBskyFeedDefsClickthroughAuthor,
) {
  json.string(data)
}

pub fn app_bsky_actor_defs_labelers_pref_decoder() {
  use labelers <- decode.field(
    "labelers",
    decode.list(app_bsky_actor_defs_labeler_pref_item_decoder()),
  )
  decode.success(AppBskyActorDefsLabelersPref(labelers: labelers))
}

pub fn app_bsky_actor_defs_labelers_pref_encode(
  data: AppBskyActorDefsLabelersPref,
) {
  utils.object(
    [
      #(
        "labelers",
        json.array(_, app_bsky_actor_defs_labeler_pref_item_encode)(
          data.labelers,
        ),
      )
    ],
  )
}

pub fn app_bsky_feed_postgate_decoder() {
  use post <- decode.field("post", decode.string)
  use embedding_rules <- decode.optional_field(
    "embeddingRules",
    None,
    decode.optional(decode.list(app_bsky_feed_postgate_disable_rule_decoder())),
  )
  use detached_embedding_uris <- decode.optional_field(
    "detachedEmbeddingUris",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use created_at <- decode.field("createdAt", decode.string)
  decode.success(
    AppBskyFeedPostgate(
      post: post,
      embedding_rules: embedding_rules,
      detached_embedding_uris: detached_embedding_uris,
      created_at: created_at,
    ),
  )
}

pub fn app_bsky_feed_postgate_encode(data: AppBskyFeedPostgate) {
  utils.object(
    [
      #("post", json.string(data.post)),
      #(
        "embeddingRules",
        json.nullable(
          data.embedding_rules,
          json.array(_, app_bsky_feed_postgate_disable_rule_encode),
        ),
      ),
      #(
        "detachedEmbeddingUris",
        json.nullable(data.detached_embedding_uris, json.array(_, json.string)),
      ),
      #("createdAt", json.string(data.created_at))
    ],
  )
}

pub fn tools_ozone_set_defs_set_view_decoder() {
  use set_size <- decode.field("setSize", decode.int)
  use name <- decode.field("name", decode.string)
  use updated_at <- decode.field("updatedAt", decode.string)
  use created_at <- decode.field("createdAt", decode.string)
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneSetDefsSetView(
      set_size: set_size,
      name: name,
      updated_at: updated_at,
      created_at: created_at,
      description: description,
    ),
  )
}

pub fn tools_ozone_set_defs_set_view_encode(data: ToolsOzoneSetDefsSetView) {
  utils.object(
    [
      #("setSize", json.int(data.set_size)),
      #("name", json.string(data.name)),
      #("updatedAt", json.string(data.updated_at)),
      #("createdAt", json.string(data.created_at)),
      #("description", json.nullable(data.description, json.string))
    ],
  )
}

pub fn tools_ozone_verification_revoke_verifications_revoke_error_decoder() {
  use error <- decode.field("error", decode.string)
  use uri <- decode.field("uri", decode.string)
  decode.success(
    ToolsOzoneVerificationRevokeVerificationsRevokeError(error: error, uri: uri),
  )
}

pub fn tools_ozone_verification_revoke_verifications_revoke_error_encode(
  data: ToolsOzoneVerificationRevokeVerificationsRevokeError,
) {
  utils.object(
    [#("error", json.string(data.error)), #("uri", json.string(data.uri))],
  )
}

pub fn app_bsky_actor_defs_profile_view_detailed_decoder() {
  use joined_via_starter_pack <- decode.optional_field(
    "joinedViaStarterPack",
    None,
    decode.optional(app_bsky_graph_defs_starter_pack_view_basic_decoder()),
  )
  use indexed_at <- decode.optional_field(
    "indexedAt",
    None,
    decode.optional(decode.string),
  )
  use associated <- decode.optional_field(
    "associated",
    None,
    decode.optional(app_bsky_actor_defs_profile_associated_decoder()),
  )
  use handle <- decode.field("handle", decode.string)
  use banner <- decode.optional_field(
    "banner",
    None,
    decode.optional(decode.string),
  )
  use display_name <- decode.optional_field(
    "displayName",
    None,
    decode.optional(decode.string),
  )
  use follows_count <- decode.optional_field(
    "followsCount",
    None,
    decode.optional(decode.int),
  )
  use viewer <- decode.optional_field(
    "viewer",
    None,
    decode.optional(app_bsky_actor_defs_viewer_state_decoder()),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(app_bsky_actor_defs_status_view_decoder()),
  )
  use pinned_post <- decode.optional_field(
    "pinnedPost",
    None,
    decode.optional(com_atproto_repo_strong_ref_decoder()),
  )
  use avatar <- decode.optional_field(
    "avatar",
    None,
    decode.optional(decode.string),
  )
  use followers_count <- decode.optional_field(
    "followersCount",
    None,
    decode.optional(decode.int),
  )
  use created_at <- decode.optional_field(
    "createdAt",
    None,
    decode.optional(decode.string),
  )
  use verification <- decode.optional_field(
    "verification",
    None,
    decode.optional(app_bsky_actor_defs_verification_state_decoder()),
  )
  use posts_count <- decode.optional_field(
    "postsCount",
    None,
    decode.optional(decode.int),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use did <- decode.field("did", decode.string)
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(decode.list(com_atproto_label_defs_label_decoder())),
  )
  decode.success(
    AppBskyActorDefsProfileViewDetailed(
      joined_via_starter_pack: joined_via_starter_pack,
      indexed_at: indexed_at,
      associated: associated,
      handle: handle,
      banner: banner,
      display_name: display_name,
      follows_count: follows_count,
      viewer: viewer,
      status: status,
      pinned_post: pinned_post,
      avatar: avatar,
      followers_count: followers_count,
      created_at: created_at,
      verification: verification,
      posts_count: posts_count,
      description: description,
      did: did,
      labels: labels,
    ),
  )
}

pub fn app_bsky_actor_defs_profile_view_detailed_encode(
  data: AppBskyActorDefsProfileViewDetailed,
) {
  utils.object(
    [
      #(
        "joinedViaStarterPack",
        json.nullable(
          data.joined_via_starter_pack,
          app_bsky_graph_defs_starter_pack_view_basic_encode,
        ),
      ),
      #("indexedAt", json.nullable(data.indexed_at, json.string)),
      #(
        "associated",
        json.nullable(
          data.associated,
          app_bsky_actor_defs_profile_associated_encode,
        ),
      ),
      #("handle", json.string(data.handle)),
      #("banner", json.nullable(data.banner, json.string)),
      #("displayName", json.nullable(data.display_name, json.string)),
      #("followsCount", json.nullable(data.follows_count, json.int)),
      #(
        "viewer",
        json.nullable(data.viewer, app_bsky_actor_defs_viewer_state_encode),
      ),
      #(
        "status",
        json.nullable(data.status, app_bsky_actor_defs_status_view_encode),
      ),
      #(
        "pinnedPost",
        json.nullable(data.pinned_post, com_atproto_repo_strong_ref_encode),
      ),
      #("avatar", json.nullable(data.avatar, json.string)),
      #("followersCount", json.nullable(data.followers_count, json.int)),
      #("createdAt", json.nullable(data.created_at, json.string)),
      #(
        "verification",
        json.nullable(
          data.verification,
          app_bsky_actor_defs_verification_state_encode,
        ),
      ),
      #("postsCount", json.nullable(data.posts_count, json.int)),
      #("description", json.nullable(data.description, json.string)),
      #("did", json.string(data.did)),
      #(
        "labels",
        json.nullable(
          data.labels,
          json.array(_, com_atproto_label_defs_label_encode),
        ),
      )
    ],
  )
}

pub fn chat_bsky_convo_defs_log_unmute_convo_decoder() {
  use rev <- decode.field("rev", decode.string)
  use convo_id <- decode.field("convoId", decode.string)
  decode.success(ChatBskyConvoDefsLogUnmuteConvo(rev: rev, convo_id: convo_id))
}

pub fn chat_bsky_convo_defs_log_unmute_convo_encode(
  data: ChatBskyConvoDefsLogUnmuteConvo,
) {
  utils.object(
    [#("rev", json.string(data.rev)), #("convoId", json.string(data.convo_id))],
  )
}

pub fn app_bsky_graph_starterpack_feed_item_decoder() {
  use uri <- decode.field("uri", decode.string)
  decode.success(AppBskyGraphStarterpackFeedItem(uri: uri))
}

pub fn app_bsky_graph_starterpack_feed_item_encode(
  data: AppBskyGraphStarterpackFeedItem,
) {
  utils.object([#("uri", json.string(data.uri))])
}

pub fn chat_bsky_convo_defs_message_view_decoder() {
  use rev <- decode.field("rev", decode.string)
  use reactions <- decode.optional_field(
    "reactions",
    None,
    decode.optional(decode.list(chat_bsky_convo_defs_reaction_view_decoder())),
  )
  use sent_at <- decode.field("sentAt", decode.string)
  use text <- decode.field("text", decode.string)
  use sender <- decode.field(
    "sender",
    chat_bsky_convo_defs_message_view_sender_decoder(),
  )
  use embed <- decode.optional_field(
    "embed",
    None,
    decode.optional(app_bsky_embed_record_view_decoder()),
  )
  use id <- decode.field("id", decode.string)
  use facets <- decode.optional_field(
    "facets",
    None,
    decode.optional(decode.list(app_bsky_richtext_facet_decoder())),
  )
  decode.success(
    ChatBskyConvoDefsMessageView(
      rev: rev,
      reactions: reactions,
      sent_at: sent_at,
      text: text,
      sender: sender,
      embed: embed,
      id: id,
      facets: facets,
    ),
  )
}

pub fn chat_bsky_convo_defs_message_view_encode(
  data: ChatBskyConvoDefsMessageView,
) {
  utils.object(
    [
      #("rev", json.string(data.rev)),
      #(
        "reactions",
        json.nullable(
          data.reactions,
          json.array(_, chat_bsky_convo_defs_reaction_view_encode),
        ),
      ),
      #("sentAt", json.string(data.sent_at)),
      #("text", json.string(data.text)),
      #("sender", chat_bsky_convo_defs_message_view_sender_encode(data.sender)),
      #("embed", json.nullable(data.embed, app_bsky_embed_record_view_encode)),
      #("id", json.string(data.id)),
      #(
        "facets",
        json.nullable(data.facets, json.array(_, app_bsky_richtext_facet_encode)),
      )
    ],
  )
}

pub fn tools_ozone_moderation_defs_mod_event_priority_score_decoder() {
  use score <- decode.field("score", decode.int)
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneModerationDefsModEventPriorityScore(score: score, comment: comment),
  )
}

pub fn tools_ozone_moderation_defs_mod_event_priority_score_encode(
  data: ToolsOzoneModerationDefsModEventPriorityScore,
) {
  utils.object(
    [
      #("score", json.int(data.score)),
      #("comment", json.nullable(data.comment, json.string))
    ],
  )
}

pub fn com_atproto_repo_list_missing_blobs_record_blob_decoder() {
  use record_uri <- decode.field("recordUri", decode.string)
  use cid <- decode.field("cid", decode.string)
  decode.success(
    ComAtprotoRepoListMissingBlobsRecordBlob(record_uri: record_uri, cid: cid),
  )
}

pub fn com_atproto_repo_list_missing_blobs_record_blob_encode(
  data: ComAtprotoRepoListMissingBlobsRecordBlob,
) {
  utils.object(
    [
      #("recordUri", json.string(data.record_uri)),
      #("cid", json.string(data.cid))
    ],
  )
}

pub fn com_atproto_sync_subscribe_repos_info_decoder() {
  use message <- decode.optional_field(
    "message",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.field("name", decode.string)
  decode.success(ComAtprotoSyncSubscribeReposInfo(message: message, name: name))
}

pub fn com_atproto_sync_subscribe_repos_info_encode(
  data: ComAtprotoSyncSubscribeReposInfo,
) {
  utils.object(
    [
      #("message", json.nullable(data.message, json.string)),
      #("name", json.string(data.name))
    ],
  )
}

pub fn app_bsky_embed_external_external_decoder() {
  use uri <- decode.field("uri", decode.string)
  use thumb <- decode.optional_field(
    "thumb",
    None,
    decode.optional(decode.string),
  )
  use title <- decode.field("title", decode.string)
  use description <- decode.field("description", decode.string)
  decode.success(
    AppBskyEmbedExternalExternal(
      uri: uri,
      thumb: thumb,
      title: title,
      description: description,
    ),
  )
}

pub fn app_bsky_embed_external_external_encode(
  data: AppBskyEmbedExternalExternal,
) {
  utils.object(
    [
      #("uri", json.string(data.uri)),
      #("thumb", json.nullable(data.thumb, json.string)),
      #("title", json.string(data.title)),
      #("description", json.string(data.description))
    ],
  )
}

pub fn app_bsky_feed_defs_interaction_like_decoder() {
  decode.string
}

pub fn app_bsky_feed_defs_interaction_like_encode(
  data: AppBskyFeedDefsInteractionLike,
) {
  json.string(data)
}

pub fn app_bsky_feed_defs_post_view_decoder() {
  decode.new_primitive_decoder(
    "Never",
    fn(_) { panic as "tried to decode a never decode value" },
  )
}

pub fn app_bsky_feed_defs_post_view_encode(_data: AppBskyFeedDefsPostView) {
  panic as "never value cannot be encoded"
}

pub fn app_bsky_actor_defs_thread_view_pref_decoder() {
  use prioritize_followed_users <- decode.optional_field(
    "prioritizeFollowedUsers",
    None,
    decode.optional(decode.bool),
  )
  use sort <- decode.optional_field("sort", None, decode.optional(decode.string))
  decode.success(
    AppBskyActorDefsThreadViewPref(
      prioritize_followed_users: prioritize_followed_users,
      sort: sort,
    ),
  )
}

pub fn app_bsky_actor_defs_thread_view_pref_encode(
  data: AppBskyActorDefsThreadViewPref,
) {
  utils.object(
    [
      #(
        "prioritizeFollowedUsers",
        json.nullable(data.prioritize_followed_users, json.bool),
      ),
      #("sort", json.nullable(data.sort, json.string))
    ],
  )
}

pub fn app_bsky_embed_images_view_image_decoder() {
  use alt <- decode.field("alt", decode.string)
  use fullsize <- decode.field("fullsize", decode.string)
  use aspect_ratio <- decode.optional_field(
    "aspectRatio",
    None,
    decode.optional(app_bsky_embed_defs_aspect_ratio_decoder()),
  )
  use thumb <- decode.field("thumb", decode.string)
  decode.success(
    AppBskyEmbedImagesViewImage(
      alt: alt,
      fullsize: fullsize,
      aspect_ratio: aspect_ratio,
      thumb: thumb,
    ),
  )
}

pub fn app_bsky_embed_images_view_image_encode(data: AppBskyEmbedImagesViewImage) {
  utils.object(
    [
      #("alt", json.string(data.alt)),
      #("fullsize", json.string(data.fullsize)),
      #(
        "aspectRatio",
        json.nullable(data.aspect_ratio, app_bsky_embed_defs_aspect_ratio_encode),
      ),
      #("thumb", json.string(data.thumb))
    ],
  )
}

pub fn chat_bsky_convo_defs_reaction_view_sender_decoder() {
  use did <- decode.field("did", decode.string)
  decode.success(ChatBskyConvoDefsReactionViewSender(did: did))
}

pub fn chat_bsky_convo_defs_reaction_view_sender_encode(
  data: ChatBskyConvoDefsReactionViewSender,
) {
  utils.object([#("did", json.string(data.did))])
}

pub fn app_bsky_actor_defs_known_followers_decoder() {
  use count <- decode.field("count", decode.int)
  use followers <- decode.field(
    "followers",
    decode.list(app_bsky_actor_defs_profile_view_basic_decoder()),
  )
  decode.success(
    AppBskyActorDefsKnownFollowers(count: count, followers: followers),
  )
}

pub fn app_bsky_actor_defs_known_followers_encode(
  data: AppBskyActorDefsKnownFollowers,
) {
  utils.object(
    [
      #("count", json.int(data.count)),
      #(
        "followers",
        json.array(_, app_bsky_actor_defs_profile_view_basic_encode)(
          data.followers,
        ),
      )
    ],
  )
}

pub fn chat_bsky_convo_defs_message_input_decoder() {
  use text <- decode.field("text", decode.string)
  use embed <- decode.optional_field(
    "embed",
    None,
    decode.optional(app_bsky_embed_record_decoder()),
  )
  use facets <- decode.optional_field(
    "facets",
    None,
    decode.optional(decode.list(app_bsky_richtext_facet_decoder())),
  )
  decode.success(
    ChatBskyConvoDefsMessageInput(text: text, embed: embed, facets: facets),
  )
}

pub fn chat_bsky_convo_defs_message_input_encode(
  data: ChatBskyConvoDefsMessageInput,
) {
  utils.object(
    [
      #("text", json.string(data.text)),
      #("embed", json.nullable(data.embed, app_bsky_embed_record_encode)),
      #(
        "facets",
        json.nullable(data.facets, json.array(_, app_bsky_richtext_facet_encode)),
      )
    ],
  )
}

pub fn com_atproto_admin_defs_account_view_decoder() {
  use deactivated_at <- decode.optional_field(
    "deactivatedAt",
    None,
    decode.optional(decode.string),
  )
  use indexed_at <- decode.field("indexedAt", decode.string)
  use invites_disabled <- decode.optional_field(
    "invitesDisabled",
    None,
    decode.optional(decode.bool),
  )
  use handle <- decode.field("handle", decode.string)
  use invites <- decode.optional_field(
    "invites",
    None,
    decode.optional(decode.list(com_atproto_server_defs_invite_code_decoder())),
  )
  use invited_by <- decode.optional_field(
    "invitedBy",
    None,
    decode.optional(com_atproto_server_defs_invite_code_decoder()),
  )
  use threat_signatures <- decode.optional_field(
    "threatSignatures",
    None,
    decode.optional(
      decode.list(com_atproto_admin_defs_threat_signature_decoder()),
    ),
  )
  use email_confirmed_at <- decode.optional_field(
    "emailConfirmedAt",
    None,
    decode.optional(decode.string),
  )
  use related_records <- decode.optional_field(
    "relatedRecords",
    None,
    decode.optional(decode.list(utils.dynamic_to_json())),
  )
  use invite_note <- decode.optional_field(
    "inviteNote",
    None,
    decode.optional(decode.string),
  )
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.string),
  )
  use did <- decode.field("did", decode.string)
  decode.success(
    ComAtprotoAdminDefsAccountView(
      deactivated_at: deactivated_at,
      indexed_at: indexed_at,
      invites_disabled: invites_disabled,
      handle: handle,
      invites: invites,
      invited_by: invited_by,
      threat_signatures: threat_signatures,
      email_confirmed_at: email_confirmed_at,
      related_records: related_records,
      invite_note: invite_note,
      email: email,
      did: did,
    ),
  )
}

pub fn com_atproto_admin_defs_account_view_encode(
  data: ComAtprotoAdminDefsAccountView,
) {
  utils.object(
    [
      #("deactivatedAt", json.nullable(data.deactivated_at, json.string)),
      #("indexedAt", json.string(data.indexed_at)),
      #("invitesDisabled", json.nullable(data.invites_disabled, json.bool)),
      #("handle", json.string(data.handle)),
      #(
        "invites",
        json.nullable(
          data.invites,
          json.array(_, com_atproto_server_defs_invite_code_encode),
        ),
      ),
      #(
        "invitedBy",
        json.nullable(
          data.invited_by,
          com_atproto_server_defs_invite_code_encode,
        ),
      ),
      #(
        "threatSignatures",
        json.nullable(
          data.threat_signatures,
          json.array(_, com_atproto_admin_defs_threat_signature_encode),
        ),
      ),
      #("emailConfirmedAt", json.nullable(data.email_confirmed_at, json.string)),
      #(
        "relatedRecords",
        json.nullable(data.related_records, json.array(_, fn(data) { data })),
      ),
      #("inviteNote", json.nullable(data.invite_note, json.string)),
      #("email", json.nullable(data.email, json.string)),
      #("did", json.string(data.did))
    ],
  )
}

pub fn app_bsky_actor_defs_bsky_app_state_pref_decoder() {
  use nuxs <- decode.optional_field(
    "nuxs",
    None,
    decode.optional(decode.list(app_bsky_actor_defs_nux_decoder())),
  )
  use active_progress_guide <- decode.optional_field(
    "activeProgressGuide",
    None,
    decode.optional(app_bsky_actor_defs_bsky_app_progress_guide_decoder()),
  )
  use queued_nudges <- decode.optional_field(
    "queuedNudges",
    None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(
    AppBskyActorDefsBskyAppStatePref(
      nuxs: nuxs,
      active_progress_guide: active_progress_guide,
      queued_nudges: queued_nudges,
    ),
  )
}

pub fn app_bsky_actor_defs_bsky_app_state_pref_encode(
  data: AppBskyActorDefsBskyAppStatePref,
) {
  utils.object(
    [
      #(
        "nuxs",
        json.nullable(data.nuxs, json.array(_, app_bsky_actor_defs_nux_encode)),
      ),
      #(
        "activeProgressGuide",
        json.nullable(
          data.active_progress_guide,
          app_bsky_actor_defs_bsky_app_progress_guide_encode,
        ),
      ),
      #(
        "queuedNudges",
        json.nullable(data.queued_nudges, json.array(_, json.string)),
      )
    ],
  )
}

pub fn app_bsky_graph_defs_relationship_decoder() {
  use followed_by <- decode.optional_field(
    "followedBy",
    None,
    decode.optional(decode.string),
  )
  use following <- decode.optional_field(
    "following",
    None,
    decode.optional(decode.string),
  )
  use did <- decode.field("did", decode.string)
  decode.success(
    AppBskyGraphDefsRelationship(
      followed_by: followed_by,
      following: following,
      did: did,
    ),
  )
}

pub fn app_bsky_graph_defs_relationship_encode(
  data: AppBskyGraphDefsRelationship,
) {
  utils.object(
    [
      #("followedBy", json.nullable(data.followed_by, json.string)),
      #("following", json.nullable(data.following, json.string)),
      #("did", json.string(data.did))
    ],
  )
}

pub fn app_bsky_feed_defs_skeleton_reason_repost_decoder() {
  use repost <- decode.field("repost", decode.string)
  decode.success(AppBskyFeedDefsSkeletonReasonRepost(repost: repost))
}

pub fn app_bsky_feed_defs_skeleton_reason_repost_encode(
  data: AppBskyFeedDefsSkeletonReasonRepost,
) {
  utils.object([#("repost", json.string(data.repost))])
}

pub fn app_bsky_feed_defs_request_less_decoder() {
  decode.string
}

pub fn app_bsky_feed_defs_request_less_encode(data: AppBskyFeedDefsRequestLess) {
  json.string(data)
}

pub fn app_bsky_embed_record_with_media_decoder() {
  use media <- decode.field("media", utils.dynamic_to_json())
  use record <- decode.field("record", app_bsky_embed_record_decoder())
  decode.success(AppBskyEmbedRecordWithMedia(media: media, record: record))
}

pub fn app_bsky_embed_record_with_media_encode(data: AppBskyEmbedRecordWithMedia) {
  utils.object(
    [
      #("media", fn(data) { data }(data.media)),
      #("record", app_bsky_embed_record_encode(data.record))
    ],
  )
}

pub fn app_bsky_actor_defs_saved_feeds_pref_decoder() {
  use saved <- decode.field("saved", decode.list(decode.string))
  use timeline_index <- decode.optional_field(
    "timelineIndex",
    None,
    decode.optional(decode.int),
  )
  use pinned <- decode.field("pinned", decode.list(decode.string))
  decode.success(
    AppBskyActorDefsSavedFeedsPref(
      saved: saved,
      timeline_index: timeline_index,
      pinned: pinned,
    ),
  )
}

pub fn app_bsky_actor_defs_saved_feeds_pref_encode(
  data: AppBskyActorDefsSavedFeedsPref,
) {
  utils.object(
    [
      #("saved", json.array(_, json.string)(data.saved)),
      #("timelineIndex", json.nullable(data.timeline_index, json.int)),
      #("pinned", json.array(_, json.string)(data.pinned))
    ],
  )
}

pub fn com_atproto_server_defs_invite_code_use_decoder() {
  use used_at <- decode.field("usedAt", decode.string)
  use used_by <- decode.field("usedBy", decode.string)
  decode.success(
    ComAtprotoServerDefsInviteCodeUse(used_at: used_at, used_by: used_by),
  )
}

pub fn com_atproto_server_defs_invite_code_use_encode(
  data: ComAtprotoServerDefsInviteCodeUse,
) {
  utils.object(
    [
      #("usedAt", json.string(data.used_at)),
      #("usedBy", json.string(data.used_by))
    ],
  )
}

pub fn com_atproto_sync_list_hosts_host_decoder() {
  use account_count <- decode.optional_field(
    "accountCount",
    None,
    decode.optional(decode.int),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(com_atproto_sync_defs_host_status_decoder()),
  )
  use hostname <- decode.field("hostname", decode.string)
  use seq <- decode.optional_field("seq", None, decode.optional(decode.int))
  decode.success(
    ComAtprotoSyncListHostsHost(
      account_count: account_count,
      status: status,
      hostname: hostname,
      seq: seq,
    ),
  )
}

pub fn com_atproto_sync_list_hosts_host_encode(data: ComAtprotoSyncListHostsHost) {
  utils.object(
    [
      #("accountCount", json.nullable(data.account_count, json.int)),
      #(
        "status",
        json.nullable(data.status, com_atproto_sync_defs_host_status_encode),
      ),
      #("hostname", json.string(data.hostname)),
      #("seq", json.nullable(data.seq, json.int))
    ],
  )
}

pub fn com_atproto_sync_list_repos_by_collection_repo_decoder() {
  use did <- decode.field("did", decode.string)
  decode.success(ComAtprotoSyncListReposByCollectionRepo(did: did))
}

pub fn com_atproto_sync_list_repos_by_collection_repo_encode(
  data: ComAtprotoSyncListReposByCollectionRepo,
) {
  utils.object([#("did", json.string(data.did))])
}

pub fn tools_ozone_moderation_defs_repo_view_decoder() {
  use deactivated_at <- decode.optional_field(
    "deactivatedAt",
    None,
    decode.optional(decode.string),
  )
  use indexed_at <- decode.field("indexedAt", decode.string)
  use moderation <- decode.field(
    "moderation",
    tools_ozone_moderation_defs_moderation_decoder(),
  )
  use invites_disabled <- decode.optional_field(
    "invitesDisabled",
    None,
    decode.optional(decode.bool),
  )
  use handle <- decode.field("handle", decode.string)
  use invited_by <- decode.optional_field(
    "invitedBy",
    None,
    decode.optional(com_atproto_server_defs_invite_code_decoder()),
  )
  use threat_signatures <- decode.optional_field(
    "threatSignatures",
    None,
    decode.optional(
      decode.list(com_atproto_admin_defs_threat_signature_decoder()),
    ),
  )
  use related_records <- decode.field(
    "relatedRecords",
    decode.list(utils.dynamic_to_json()),
  )
  use invite_note <- decode.optional_field(
    "inviteNote",
    None,
    decode.optional(decode.string),
  )
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.string),
  )
  use did <- decode.field("did", decode.string)
  decode.success(
    ToolsOzoneModerationDefsRepoView(
      deactivated_at: deactivated_at,
      indexed_at: indexed_at,
      moderation: moderation,
      invites_disabled: invites_disabled,
      handle: handle,
      invited_by: invited_by,
      threat_signatures: threat_signatures,
      related_records: related_records,
      invite_note: invite_note,
      email: email,
      did: did,
    ),
  )
}

pub fn tools_ozone_moderation_defs_repo_view_encode(
  data: ToolsOzoneModerationDefsRepoView,
) {
  utils.object(
    [
      #("deactivatedAt", json.nullable(data.deactivated_at, json.string)),
      #("indexedAt", json.string(data.indexed_at)),
      #(
        "moderation",
        tools_ozone_moderation_defs_moderation_encode(data.moderation),
      ),
      #("invitesDisabled", json.nullable(data.invites_disabled, json.bool)),
      #("handle", json.string(data.handle)),
      #(
        "invitedBy",
        json.nullable(
          data.invited_by,
          com_atproto_server_defs_invite_code_encode,
        ),
      ),
      #(
        "threatSignatures",
        json.nullable(
          data.threat_signatures,
          json.array(_, com_atproto_admin_defs_threat_signature_encode),
        ),
      ),
      #("relatedRecords", json.array(_, fn(data) { data })(data.related_records)),
      #("inviteNote", json.nullable(data.invite_note, json.string)),
      #("email", json.nullable(data.email, json.string)),
      #("did", json.string(data.did))
    ],
  )
}

pub fn app_bsky_labeler_defs_labeler_view_decoder() {
  use indexed_at <- decode.field("indexedAt", decode.string)
  use creator <- decode.field(
    "creator",
    app_bsky_actor_defs_profile_view_decoder(),
  )
  use uri <- decode.field("uri", decode.string)
  use viewer <- decode.optional_field(
    "viewer",
    None,
    decode.optional(app_bsky_labeler_defs_labeler_viewer_state_decoder()),
  )
  use like_count <- decode.optional_field(
    "likeCount",
    None,
    decode.optional(decode.int),
  )
  use cid <- decode.field("cid", decode.string)
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(decode.list(com_atproto_label_defs_label_decoder())),
  )
  decode.success(
    AppBskyLabelerDefsLabelerView(
      indexed_at: indexed_at,
      creator: creator,
      uri: uri,
      viewer: viewer,
      like_count: like_count,
      cid: cid,
      labels: labels,
    ),
  )
}

pub fn app_bsky_labeler_defs_labeler_view_encode(
  data: AppBskyLabelerDefsLabelerView,
) {
  utils.object(
    [
      #("indexedAt", json.string(data.indexed_at)),
      #("creator", app_bsky_actor_defs_profile_view_encode(data.creator)),
      #("uri", json.string(data.uri)),
      #(
        "viewer",
        json.nullable(
          data.viewer,
          app_bsky_labeler_defs_labeler_viewer_state_encode,
        ),
      ),
      #("likeCount", json.nullable(data.like_count, json.int)),
      #("cid", json.string(data.cid)),
      #(
        "labels",
        json.nullable(
          data.labels,
          json.array(_, com_atproto_label_defs_label_encode),
        ),
      )
    ],
  )
}

pub fn tools_ozone_moderation_defs_moderation_detail_decoder() {
  use subject_status <- decode.optional_field(
    "subjectStatus",
    None,
    decode.optional(tools_ozone_moderation_defs_subject_status_view_decoder()),
  )
  decode.success(
    ToolsOzoneModerationDefsModerationDetail(subject_status: subject_status),
  )
}

pub fn tools_ozone_moderation_defs_moderation_detail_encode(
  data: ToolsOzoneModerationDefsModerationDetail,
) {
  utils.object(
    [
      #(
        "subjectStatus",
        json.nullable(
          data.subject_status,
          tools_ozone_moderation_defs_subject_status_view_encode,
        ),
      )
    ],
  )
}

pub fn tools_ozone_hosting_get_account_history_password_updated_decoder() {
  decode.dict(decode.string, utils.dynamic_to_json())
}

pub fn tools_ozone_hosting_get_account_history_password_updated_encode(
  data: ToolsOzoneHostingGetAccountHistoryPasswordUpdated,
) {
  utils.dict(data, fn(data) { data })
}

pub fn tools_ozone_moderation_defs_mod_event_reverse_takedown_decoder() {
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneModerationDefsModEventReverseTakedown(comment: comment),
  )
}

pub fn tools_ozone_moderation_defs_mod_event_reverse_takedown_encode(
  data: ToolsOzoneModerationDefsModEventReverseTakedown,
) {
  utils.object([#("comment", json.nullable(data.comment, json.string))])
}

pub fn app_bsky_feed_defs_feed_view_post_decoder() {
  use post <- decode.field("post", app_bsky_feed_defs_post_view_decoder())
  use reason <- decode.optional_field(
    "reason",
    None,
    decode.optional(utils.dynamic_to_json()),
  )
  use reply <- decode.optional_field(
    "reply",
    None,
    decode.optional(app_bsky_feed_defs_reply_ref_decoder()),
  )
  use feed_context <- decode.optional_field(
    "feedContext",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    AppBskyFeedDefsFeedViewPost(
      post: post,
      reason: reason,
      reply: reply,
      feed_context: feed_context,
    ),
  )
}

pub fn app_bsky_feed_defs_feed_view_post_encode(
  data: AppBskyFeedDefsFeedViewPost,
) {
  utils.object(
    [
      #("post", app_bsky_feed_defs_post_view_encode(data.post)),
      #("reason", json.nullable(data.reason, fn(data) { data })),
      #("reply", json.nullable(data.reply, app_bsky_feed_defs_reply_ref_encode)),
      #("feedContext", json.nullable(data.feed_context, json.string))
    ],
  )
}

pub fn chat_bsky_convo_defs_log_leave_convo_decoder() {
  use rev <- decode.field("rev", decode.string)
  use convo_id <- decode.field("convoId", decode.string)
  decode.success(ChatBskyConvoDefsLogLeaveConvo(rev: rev, convo_id: convo_id))
}

pub fn chat_bsky_convo_defs_log_leave_convo_encode(
  data: ChatBskyConvoDefsLogLeaveConvo,
) {
  utils.object(
    [#("rev", json.string(data.rev)), #("convoId", json.string(data.convo_id))],
  )
}

pub fn tools_ozone_moderation_defs_record_view_decoder() {
  use indexed_at <- decode.field("indexedAt", decode.string)
  use moderation <- decode.field(
    "moderation",
    tools_ozone_moderation_defs_moderation_decoder(),
  )
  use uri <- decode.field("uri", decode.string)
  use value <- decode.field("value", utils.dynamic_to_json())
  use blob_cids <- decode.field("blobCids", decode.list(decode.string))
  use repo <- decode.field(
    "repo",
    tools_ozone_moderation_defs_repo_view_decoder(),
  )
  use cid <- decode.field("cid", decode.string)
  decode.success(
    ToolsOzoneModerationDefsRecordView(
      indexed_at: indexed_at,
      moderation: moderation,
      uri: uri,
      value: value,
      blob_cids: blob_cids,
      repo: repo,
      cid: cid,
    ),
  )
}

pub fn tools_ozone_moderation_defs_record_view_encode(
  data: ToolsOzoneModerationDefsRecordView,
) {
  utils.object(
    [
      #("indexedAt", json.string(data.indexed_at)),
      #(
        "moderation",
        tools_ozone_moderation_defs_moderation_encode(data.moderation),
      ),
      #("uri", json.string(data.uri)),
      #("value", fn(data) { data }(data.value)),
      #("blobCids", json.array(_, json.string)(data.blob_cids)),
      #("repo", tools_ozone_moderation_defs_repo_view_encode(data.repo)),
      #("cid", json.string(data.cid))
    ],
  )
}

pub fn app_bsky_richtext_facet_link_decoder() {
  use uri <- decode.field("uri", decode.string)
  decode.success(AppBskyRichtextFacetLink(uri: uri))
}

pub fn app_bsky_richtext_facet_link_encode(data: AppBskyRichtextFacetLink) {
  utils.object([#("uri", json.string(data.uri))])
}

pub fn tools_ozone_set_defs_set_decoder() {
  use name <- decode.field("name", decode.string)
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  decode.success(ToolsOzoneSetDefsSet(name: name, description: description))
}

pub fn tools_ozone_set_defs_set_encode(data: ToolsOzoneSetDefsSet) {
  utils.object(
    [
      #("name", json.string(data.name)),
      #("description", json.nullable(data.description, json.string))
    ],
  )
}

pub fn app_bsky_graph_defs_list_item_view_decoder() {
  use subject <- decode.field(
    "subject",
    app_bsky_actor_defs_profile_view_decoder(),
  )
  use uri <- decode.field("uri", decode.string)
  decode.success(AppBskyGraphDefsListItemView(subject: subject, uri: uri))
}

pub fn app_bsky_graph_defs_list_item_view_encode(
  data: AppBskyGraphDefsListItemView,
) {
  utils.object(
    [
      #("subject", app_bsky_actor_defs_profile_view_encode(data.subject)),
      #("uri", json.string(data.uri))
    ],
  )
}

pub fn app_bsky_richtext_facet_decoder() {
  use index <- decode.field(
    "index",
    app_bsky_richtext_facet_byte_slice_decoder(),
  )
  use features <- decode.field("features", decode.list(utils.dynamic_to_json()))
  decode.success(AppBskyRichtextFacet(index: index, features: features))
}

pub fn app_bsky_richtext_facet_encode(data: AppBskyRichtextFacet) {
  utils.object(
    [
      #("index", app_bsky_richtext_facet_byte_slice_encode(data.index)),
      #("features", json.array(_, fn(data) { data })(data.features))
    ],
  )
}

pub fn com_atproto_label_defs_label_decoder() {
  use val <- decode.field("val", decode.string)
  use cts <- decode.field("cts", decode.string)
  use ver <- decode.optional_field("ver", None, decode.optional(decode.int))
  use src <- decode.field("src", decode.string)
  use uri <- decode.field("uri", decode.string)
  use neg <- decode.optional_field("neg", None, decode.optional(decode.bool))
  use sig <- decode.optional_field("sig", None, decode.optional(decode.string))
  use exp <- decode.optional_field("exp", None, decode.optional(decode.string))
  use cid <- decode.optional_field("cid", None, decode.optional(decode.string))
  decode.success(
    ComAtprotoLabelDefsLabel(
      val: val,
      cts: cts,
      ver: ver,
      src: src,
      uri: uri,
      neg: neg,
      sig: sig,
      exp: exp,
      cid: cid,
    ),
  )
}

pub fn com_atproto_label_defs_label_encode(data: ComAtprotoLabelDefsLabel) {
  utils.object(
    [
      #("val", json.string(data.val)),
      #("cts", json.string(data.cts)),
      #("ver", json.nullable(data.ver, json.int)),
      #("src", json.string(data.src)),
      #("uri", json.string(data.uri)),
      #("neg", json.nullable(data.neg, json.bool)),
      #("sig", json.nullable(data.sig, json.string)),
      #("exp", json.nullable(data.exp, json.string)),
      #("cid", json.nullable(data.cid, json.string))
    ],
  )
}

pub fn tools_ozone_signature_find_related_accounts_related_account_decoder() {
  use similarities <- decode.optional_field(
    "similarities",
    None,
    decode.optional(decode.list(tools_ozone_signature_defs_sig_detail_decoder())),
  )
  use account <- decode.field(
    "account",
    com_atproto_admin_defs_account_view_decoder(),
  )
  decode.success(
    ToolsOzoneSignatureFindRelatedAccountsRelatedAccount(
      similarities: similarities,
      account: account,
    ),
  )
}

pub fn tools_ozone_signature_find_related_accounts_related_account_encode(
  data: ToolsOzoneSignatureFindRelatedAccountsRelatedAccount,
) {
  utils.object(
    [
      #(
        "similarities",
        json.nullable(
          data.similarities,
          json.array(_, tools_ozone_signature_defs_sig_detail_encode),
        ),
      ),
      #("account", com_atproto_admin_defs_account_view_encode(data.account))
    ],
  )
}

pub fn app_bsky_actor_defs_preferences_decoder() {
  decode.list(utils.dynamic_to_json())
}

pub fn app_bsky_actor_defs_preferences_encode(data: AppBskyActorDefsPreferences) {
  json.array(data, fn(data) { data })
}

pub fn com_atproto_label_subscribe_labels_info_decoder() {
  use message <- decode.optional_field(
    "message",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.field("name", decode.string)
  decode.success(
    ComAtprotoLabelSubscribeLabelsInfo(message: message, name: name),
  )
}

pub fn com_atproto_label_subscribe_labels_info_encode(
  data: ComAtprotoLabelSubscribeLabelsInfo,
) {
  utils.object(
    [
      #("message", json.nullable(data.message, json.string)),
      #("name", json.string(data.name))
    ],
  )
}

pub fn app_bsky_feed_defs_thread_context_decoder() {
  use root_author_like <- decode.optional_field(
    "rootAuthorLike",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    AppBskyFeedDefsThreadContext(root_author_like: root_author_like),
  )
}

pub fn app_bsky_feed_defs_thread_context_encode(
  data: AppBskyFeedDefsThreadContext,
) {
  utils.object(
    [#("rootAuthorLike", json.nullable(data.root_author_like, json.string))],
  )
}

pub fn tools_ozone_moderation_defs_subject_view_decoder() {
  use profile <- decode.optional_field(
    "profile",
    None,
    decode.optional(utils.dynamic_to_json()),
  )
  use subject <- decode.field("subject", decode.string)
  use record <- decode.optional_field(
    "record",
    None,
    decode.optional(tools_ozone_moderation_defs_record_view_detail_decoder()),
  )
  use repo <- decode.optional_field(
    "repo",
    None,
    decode.optional(tools_ozone_moderation_defs_repo_view_detail_decoder()),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(tools_ozone_moderation_defs_subject_status_view_decoder()),
  )
  use type_ <- decode.field(
    "type",
    com_atproto_moderation_defs_subject_type_decoder(),
  )
  decode.success(
    ToolsOzoneModerationDefsSubjectView(
      profile: profile,
      subject: subject,
      record: record,
      repo: repo,
      status: status,
      type_: type_,
    ),
  )
}

pub fn tools_ozone_moderation_defs_subject_view_encode(
  data: ToolsOzoneModerationDefsSubjectView,
) {
  utils.object(
    [
      #("profile", json.nullable(data.profile, fn(data) { data })),
      #("subject", json.string(data.subject)),
      #(
        "record",
        json.nullable(
          data.record,
          tools_ozone_moderation_defs_record_view_detail_encode,
        ),
      ),
      #(
        "repo",
        json.nullable(
          data.repo,
          tools_ozone_moderation_defs_repo_view_detail_encode,
        ),
      ),
      #(
        "status",
        json.nullable(
          data.status,
          tools_ozone_moderation_defs_subject_status_view_encode,
        ),
      ),
      #("type", com_atproto_moderation_defs_subject_type_encode(data.type_))
    ],
  )
}

pub fn app_bsky_actor_defs_post_interaction_settings_pref_decoder() {
  use threadgate_allow_rules <- decode.optional_field(
    "threadgateAllowRules",
    None,
    decode.optional(decode.list(utils.dynamic_to_json())),
  )
  use postgate_embedding_rules <- decode.optional_field(
    "postgateEmbeddingRules",
    None,
    decode.optional(decode.list(app_bsky_feed_postgate_disable_rule_decoder())),
  )
  decode.success(
    AppBskyActorDefsPostInteractionSettingsPref(
      threadgate_allow_rules: threadgate_allow_rules,
      postgate_embedding_rules: postgate_embedding_rules,
    ),
  )
}

pub fn app_bsky_actor_defs_post_interaction_settings_pref_encode(
  data: AppBskyActorDefsPostInteractionSettingsPref,
) {
  utils.object(
    [
      #(
        "threadgateAllowRules",
        json.nullable(
          data.threadgate_allow_rules,
          json.array(_, fn(data) { data }),
        ),
      ),
      #(
        "postgateEmbeddingRules",
        json.nullable(
          data.postgate_embedding_rules,
          json.array(_, app_bsky_feed_postgate_disable_rule_encode),
        ),
      )
    ],
  )
}

pub fn app_bsky_graph_listitem_decoder() {
  use subject <- decode.field("subject", decode.string)
  use created_at <- decode.field("createdAt", decode.string)
  use list <- decode.field("list", decode.string)
  decode.success(
    AppBskyGraphListitem(subject: subject, created_at: created_at, list: list),
  )
}

pub fn app_bsky_graph_listitem_encode(data: AppBskyGraphListitem) {
  utils.object(
    [
      #("subject", json.string(data.subject)),
      #("createdAt", json.string(data.created_at)),
      #("list", json.string(data.list))
    ],
  )
}

pub fn app_bsky_graph_follow_decoder() {
  use subject <- decode.field("subject", decode.string)
  use created_at <- decode.field("createdAt", decode.string)
  decode.success(AppBskyGraphFollow(subject: subject, created_at: created_at))
}

pub fn app_bsky_graph_follow_encode(data: AppBskyGraphFollow) {
  utils.object(
    [
      #("subject", json.string(data.subject)),
      #("createdAt", json.string(data.created_at))
    ],
  )
}

pub fn app_bsky_feed_defs_interaction_repost_decoder() {
  decode.string
}

pub fn app_bsky_feed_defs_interaction_repost_encode(
  data: AppBskyFeedDefsInteractionRepost,
) {
  json.string(data)
}

pub fn tools_ozone_verification_defs_verification_view_decoder() {
  use handle <- decode.field("handle", decode.string)
  use revoke_reason <- decode.optional_field(
    "revokeReason",
    None,
    decode.optional(decode.string),
  )
  use issuer_repo <- decode.optional_field(
    "issuerRepo",
    None,
    decode.optional(utils.dynamic_to_json()),
  )
  use subject <- decode.field("subject", decode.string)
  use uri <- decode.field("uri", decode.string)
  use display_name <- decode.field("displayName", decode.string)
  use issuer_profile <- decode.optional_field(
    "issuerProfile",
    None,
    decode.optional(utils.dynamic_to_json()),
  )
  use revoked_at <- decode.optional_field(
    "revokedAt",
    None,
    decode.optional(decode.string),
  )
  use revoked_by <- decode.optional_field(
    "revokedBy",
    None,
    decode.optional(decode.string),
  )
  use issuer <- decode.field("issuer", decode.string)
  use created_at <- decode.field("createdAt", decode.string)
  use subject_profile <- decode.optional_field(
    "subjectProfile",
    None,
    decode.optional(utils.dynamic_to_json()),
  )
  use subject_repo <- decode.optional_field(
    "subjectRepo",
    None,
    decode.optional(utils.dynamic_to_json()),
  )
  decode.success(
    ToolsOzoneVerificationDefsVerificationView(
      handle: handle,
      revoke_reason: revoke_reason,
      issuer_repo: issuer_repo,
      subject: subject,
      uri: uri,
      display_name: display_name,
      issuer_profile: issuer_profile,
      revoked_at: revoked_at,
      revoked_by: revoked_by,
      issuer: issuer,
      created_at: created_at,
      subject_profile: subject_profile,
      subject_repo: subject_repo,
    ),
  )
}

pub fn tools_ozone_verification_defs_verification_view_encode(
  data: ToolsOzoneVerificationDefsVerificationView,
) {
  utils.object(
    [
      #("handle", json.string(data.handle)),
      #("revokeReason", json.nullable(data.revoke_reason, json.string)),
      #("issuerRepo", json.nullable(data.issuer_repo, fn(data) { data })),
      #("subject", json.string(data.subject)),
      #("uri", json.string(data.uri)),
      #("displayName", json.string(data.display_name)),
      #("issuerProfile", json.nullable(data.issuer_profile, fn(data) { data })),
      #("revokedAt", json.nullable(data.revoked_at, json.string)),
      #("revokedBy", json.nullable(data.revoked_by, json.string)),
      #("issuer", json.string(data.issuer)),
      #("createdAt", json.string(data.created_at)),
      #("subjectProfile", json.nullable(data.subject_profile, fn(data) { data })),
      #("subjectRepo", json.nullable(data.subject_repo, fn(data) { data }))
    ],
  )
}

pub fn chat_bsky_convo_defs_log_mute_convo_decoder() {
  use rev <- decode.field("rev", decode.string)
  use convo_id <- decode.field("convoId", decode.string)
  decode.success(ChatBskyConvoDefsLogMuteConvo(rev: rev, convo_id: convo_id))
}

pub fn chat_bsky_convo_defs_log_mute_convo_encode(
  data: ChatBskyConvoDefsLogMuteConvo,
) {
  utils.object(
    [#("rev", json.string(data.rev)), #("convoId", json.string(data.convo_id))],
  )
}

pub fn app_bsky_feed_defs_skeleton_reason_pin_decoder() {
  decode.dict(decode.string, utils.dynamic_to_json())
}

pub fn app_bsky_feed_defs_skeleton_reason_pin_encode(
  data: AppBskyFeedDefsSkeletonReasonPin,
) {
  utils.dict(data, fn(data) { data })
}

pub fn app_bsky_actor_defs_saved_feeds_pref_v2_decoder() {
  use items <- decode.field(
    "items",
    decode.list(app_bsky_actor_defs_saved_feed_decoder()),
  )
  decode.success(AppBskyActorDefsSavedFeedsPrefV2(items: items))
}

pub fn app_bsky_actor_defs_saved_feeds_pref_v2_encode(
  data: AppBskyActorDefsSavedFeedsPrefV2,
) {
  utils.object(
    [
      #(
        "items",
        json.array(_, app_bsky_actor_defs_saved_feed_encode)(data.items),
      )
    ],
  )
}

pub fn com_atproto_label_defs_label_value_definition_strings_decoder() {
  use name <- decode.field("name", decode.string)
  use lang <- decode.field("lang", decode.string)
  use description <- decode.field("description", decode.string)
  decode.success(
    ComAtprotoLabelDefsLabelValueDefinitionStrings(
      name: name,
      lang: lang,
      description: description,
    ),
  )
}

pub fn com_atproto_label_defs_label_value_definition_strings_encode(
  data: ComAtprotoLabelDefsLabelValueDefinitionStrings,
) {
  utils.object(
    [
      #("name", json.string(data.name)),
      #("lang", json.string(data.lang)),
      #("description", json.string(data.description))
    ],
  )
}

pub fn app_bsky_actor_defs_bsky_app_progress_guide_decoder() {
  use guide <- decode.field("guide", decode.string)
  decode.success(AppBskyActorDefsBskyAppProgressGuide(guide: guide))
}

pub fn app_bsky_actor_defs_bsky_app_progress_guide_encode(
  data: AppBskyActorDefsBskyAppProgressGuide,
) {
  utils.object([#("guide", json.string(data.guide))])
}

pub fn app_bsky_actor_defs_labeler_pref_item_decoder() {
  use did <- decode.field("did", decode.string)
  decode.success(AppBskyActorDefsLabelerPrefItem(did: did))
}

pub fn app_bsky_actor_defs_labeler_pref_item_encode(
  data: AppBskyActorDefsLabelerPrefItem,
) {
  utils.object([#("did", json.string(data.did))])
}

pub fn app_bsky_feed_defs_request_more_decoder() {
  decode.string
}

pub fn app_bsky_feed_defs_request_more_encode(data: AppBskyFeedDefsRequestMore) {
  json.string(data)
}

pub fn chat_bsky_convo_defs_message_and_reaction_view_decoder() {
  use message <- decode.field(
    "message",
    chat_bsky_convo_defs_message_view_decoder(),
  )
  use reaction <- decode.field(
    "reaction",
    chat_bsky_convo_defs_reaction_view_decoder(),
  )
  decode.success(
    ChatBskyConvoDefsMessageAndReactionView(message: message, reaction: reaction),
  )
}

pub fn chat_bsky_convo_defs_message_and_reaction_view_encode(
  data: ChatBskyConvoDefsMessageAndReactionView,
) {
  utils.object(
    [
      #("message", chat_bsky_convo_defs_message_view_encode(data.message)),
      #("reaction", chat_bsky_convo_defs_reaction_view_encode(data.reaction))
    ],
  )
}

pub fn app_bsky_actor_defs_verification_state_decoder() {
  use verifications <- decode.field(
    "verifications",
    decode.list(app_bsky_actor_defs_verification_view_decoder()),
  )
  use verified_status <- decode.field("verifiedStatus", decode.string)
  use trusted_verifier_status <- decode.field(
    "trustedVerifierStatus",
    decode.string,
  )
  decode.success(
    AppBskyActorDefsVerificationState(
      verifications: verifications,
      verified_status: verified_status,
      trusted_verifier_status: trusted_verifier_status,
    ),
  )
}

pub fn app_bsky_actor_defs_verification_state_encode(
  data: AppBskyActorDefsVerificationState,
) {
  utils.object(
    [
      #(
        "verifications",
        json.array(_, app_bsky_actor_defs_verification_view_encode)(
          data.verifications,
        ),
      ),
      #("verifiedStatus", json.string(data.verified_status)),
      #("trustedVerifierStatus", json.string(data.trusted_verifier_status))
    ],
  )
}

pub fn com_atproto_repo_list_records_record_decoder() {
  use uri <- decode.field("uri", decode.string)
  use value <- decode.field("value", utils.dynamic_to_json())
  use cid <- decode.field("cid", decode.string)
  decode.success(
    ComAtprotoRepoListRecordsRecord(uri: uri, value: value, cid: cid),
  )
}

pub fn com_atproto_repo_list_records_record_encode(
  data: ComAtprotoRepoListRecordsRecord,
) {
  utils.object(
    [
      #("uri", json.string(data.uri)),
      #("value", fn(data) { data }(data.value)),
      #("cid", json.string(data.cid))
    ],
  )
}

pub fn tools_ozone_verification_grant_verifications_grant_error_decoder() {
  use error <- decode.field("error", decode.string)
  use subject <- decode.field("subject", decode.string)
  decode.success(
    ToolsOzoneVerificationGrantVerificationsGrantError(
      error: error,
      subject: subject,
    ),
  )
}

pub fn tools_ozone_verification_grant_verifications_grant_error_encode(
  data: ToolsOzoneVerificationGrantVerificationsGrantError,
) {
  utils.object(
    [
      #("error", json.string(data.error)),
      #("subject", json.string(data.subject))
    ],
  )
}

pub fn com_atproto_moderation_defs_reason_misleading_decoder() {
  decode.string
}

pub fn com_atproto_moderation_defs_reason_misleading_encode(
  data: ComAtprotoModerationDefsReasonMisleading,
) {
  json.string(data)
}

pub fn com_atproto_server_defs_invite_code_decoder() {
  use for_account <- decode.field("forAccount", decode.string)
  use available <- decode.field("available", decode.int)
  use uses <- decode.field(
    "uses",
    decode.list(com_atproto_server_defs_invite_code_use_decoder()),
  )
  use code <- decode.field("code", decode.string)
  use created_at <- decode.field("createdAt", decode.string)
  use disabled <- decode.field("disabled", decode.bool)
  use created_by <- decode.field("createdBy", decode.string)
  decode.success(
    ComAtprotoServerDefsInviteCode(
      for_account: for_account,
      available: available,
      uses: uses,
      code: code,
      created_at: created_at,
      disabled: disabled,
      created_by: created_by,
    ),
  )
}

pub fn com_atproto_server_defs_invite_code_encode(
  data: ComAtprotoServerDefsInviteCode,
) {
  utils.object(
    [
      #("forAccount", json.string(data.for_account)),
      #("available", json.int(data.available)),
      #(
        "uses",
        json.array(_, com_atproto_server_defs_invite_code_use_encode)(data.uses),
      ),
      #("code", json.string(data.code)),
      #("createdAt", json.string(data.created_at)),
      #("disabled", json.bool(data.disabled)),
      #("createdBy", json.string(data.created_by))
    ],
  )
}

pub fn app_bsky_feed_defs_content_mode_video_decoder() {
  decode.string
}

pub fn app_bsky_feed_defs_content_mode_video_encode(
  data: AppBskyFeedDefsContentModeVideo,
) {
  json.string(data)
}

pub fn tools_ozone_setting_defs_option_decoder() {
  use manager_role <- decode.optional_field(
    "managerRole",
    None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updatedAt",
    None,
    decode.optional(decode.string),
  )
  use value <- decode.field("value", utils.dynamic_to_json())
  use scope <- decode.field("scope", decode.string)
  use created_at <- decode.optional_field(
    "createdAt",
    None,
    decode.optional(decode.string),
  )
  use last_updated_by <- decode.field("lastUpdatedBy", decode.string)
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use did <- decode.field("did", decode.string)
  use created_by <- decode.field("createdBy", decode.string)
  use key <- decode.field("key", decode.string)
  decode.success(
    ToolsOzoneSettingDefsOption(
      manager_role: manager_role,
      updated_at: updated_at,
      value: value,
      scope: scope,
      created_at: created_at,
      last_updated_by: last_updated_by,
      description: description,
      did: did,
      created_by: created_by,
      key: key,
    ),
  )
}

pub fn tools_ozone_setting_defs_option_encode(data: ToolsOzoneSettingDefsOption) {
  utils.object(
    [
      #("managerRole", json.nullable(data.manager_role, json.string)),
      #("updatedAt", json.nullable(data.updated_at, json.string)),
      #("value", fn(data) { data }(data.value)),
      #("scope", json.string(data.scope)),
      #("createdAt", json.nullable(data.created_at, json.string)),
      #("lastUpdatedBy", json.string(data.last_updated_by)),
      #("description", json.nullable(data.description, json.string)),
      #("did", json.string(data.did)),
      #("createdBy", json.string(data.created_by)),
      #("key", json.string(data.key))
    ],
  )
}

pub fn app_bsky_feed_get_likes_like_decoder() {
  use indexed_at <- decode.field("indexedAt", decode.string)
  use actor <- decode.field("actor", app_bsky_actor_defs_profile_view_decoder())
  use created_at <- decode.field("createdAt", decode.string)
  decode.success(
    AppBskyFeedGetLikesLike(
      indexed_at: indexed_at,
      actor: actor,
      created_at: created_at,
    ),
  )
}

pub fn app_bsky_feed_get_likes_like_encode(data: AppBskyFeedGetLikesLike) {
  utils.object(
    [
      #("indexedAt", json.string(data.indexed_at)),
      #("actor", app_bsky_actor_defs_profile_view_encode(data.actor)),
      #("createdAt", json.string(data.created_at))
    ],
  )
}

pub fn com_atproto_moderation_defs_reason_appeal_decoder() {
  decode.string
}

pub fn com_atproto_moderation_defs_reason_appeal_encode(
  data: ComAtprotoModerationDefsReasonAppeal,
) {
  json.string(data)
}

pub fn app_bsky_embed_external_view_decoder() {
  use external <- decode.field(
    "external",
    app_bsky_embed_external_view_external_decoder(),
  )
  decode.success(AppBskyEmbedExternalView(external: external))
}

pub fn app_bsky_embed_external_view_encode(data: AppBskyEmbedExternalView) {
  utils.object(
    [#("external", app_bsky_embed_external_view_external_encode(data.external))],
  )
}

pub fn app_bsky_notification_list_notifications_notification_decoder() {
  use is_read <- decode.field("isRead", decode.bool)
  use indexed_at <- decode.field("indexedAt", decode.string)
  use reason <- decode.field("reason", decode.string)
  use reason_subject <- decode.optional_field(
    "reasonSubject",
    None,
    decode.optional(decode.string),
  )
  use author <- decode.field(
    "author",
    app_bsky_actor_defs_profile_view_decoder(),
  )
  use uri <- decode.field("uri", decode.string)
  use record <- decode.field("record", utils.dynamic_to_json())
  use cid <- decode.field("cid", decode.string)
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(decode.list(com_atproto_label_defs_label_decoder())),
  )
  decode.success(
    AppBskyNotificationListNotificationsNotification(
      is_read: is_read,
      indexed_at: indexed_at,
      reason: reason,
      reason_subject: reason_subject,
      author: author,
      uri: uri,
      record: record,
      cid: cid,
      labels: labels,
    ),
  )
}

pub fn app_bsky_notification_list_notifications_notification_encode(
  data: AppBskyNotificationListNotificationsNotification,
) {
  utils.object(
    [
      #("isRead", json.bool(data.is_read)),
      #("indexedAt", json.string(data.indexed_at)),
      #("reason", json.string(data.reason)),
      #("reasonSubject", json.nullable(data.reason_subject, json.string)),
      #("author", app_bsky_actor_defs_profile_view_encode(data.author)),
      #("uri", json.string(data.uri)),
      #("record", fn(data) { data }(data.record)),
      #("cid", json.string(data.cid)),
      #(
        "labels",
        json.nullable(
          data.labels,
          json.array(_, com_atproto_label_defs_label_encode),
        ),
      )
    ],
  )
}

pub fn app_bsky_actor_defs_muted_word_decoder() {
  use targets <- decode.field(
    "targets",
    decode.list(app_bsky_actor_defs_muted_word_target_decoder()),
  )
  use actor_target <- decode.optional_field(
    "actorTarget",
    None,
    decode.optional(decode.string),
  )
  use expires_at <- decode.optional_field(
    "expiresAt",
    None,
    decode.optional(decode.string),
  )
  use value <- decode.field("value", decode.string)
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  decode.success(
    AppBskyActorDefsMutedWord(
      targets: targets,
      actor_target: actor_target,
      expires_at: expires_at,
      value: value,
      id: id,
    ),
  )
}

pub fn app_bsky_actor_defs_muted_word_encode(data: AppBskyActorDefsMutedWord) {
  utils.object(
    [
      #(
        "targets",
        json.array(_, app_bsky_actor_defs_muted_word_target_encode)(data.targets),
      ),
      #("actorTarget", json.nullable(data.actor_target, json.string)),
      #("expiresAt", json.nullable(data.expires_at, json.string)),
      #("value", json.string(data.value)),
      #("id", json.nullable(data.id, json.string))
    ],
  )
}

pub fn com_atproto_label_defs_label_value_definition_decoder() {
  use adult_only <- decode.optional_field(
    "adultOnly",
    None,
    decode.optional(decode.bool),
  )
  use identifier <- decode.field("identifier", decode.string)
  use blurs <- decode.field("blurs", decode.string)
  use default_setting <- decode.optional_field(
    "defaultSetting",
    None,
    decode.optional(decode.string),
  )
  use locales <- decode.field(
    "locales",
    decode.list(com_atproto_label_defs_label_value_definition_strings_decoder()),
  )
  use severity <- decode.field("severity", decode.string)
  decode.success(
    ComAtprotoLabelDefsLabelValueDefinition(
      adult_only: adult_only,
      identifier: identifier,
      blurs: blurs,
      default_setting: default_setting,
      locales: locales,
      severity: severity,
    ),
  )
}

pub fn com_atproto_label_defs_label_value_definition_encode(
  data: ComAtprotoLabelDefsLabelValueDefinition,
) {
  utils.object(
    [
      #("adultOnly", json.nullable(data.adult_only, json.bool)),
      #("identifier", json.string(data.identifier)),
      #("blurs", json.string(data.blurs)),
      #("defaultSetting", json.nullable(data.default_setting, json.string)),
      #(
        "locales",
        json.array(
          _,
          com_atproto_label_defs_label_value_definition_strings_encode,
        )(data.locales),
      ),
      #("severity", json.string(data.severity))
    ],
  )
}

pub fn app_bsky_richtext_facet_mention_decoder() {
  use did <- decode.field("did", decode.string)
  decode.success(AppBskyRichtextFacetMention(did: did))
}

pub fn app_bsky_richtext_facet_mention_encode(data: AppBskyRichtextFacetMention) {
  utils.object([#("did", json.string(data.did))])
}

pub fn app_bsky_actor_defs_verification_prefs_decoder() {
  use hide_badges <- decode.optional_field(
    "hideBadges",
    None,
    decode.optional(decode.bool),
  )
  decode.success(AppBskyActorDefsVerificationPrefs(hide_badges: hide_badges))
}

pub fn app_bsky_actor_defs_verification_prefs_encode(
  data: AppBskyActorDefsVerificationPrefs,
) {
  utils.object([#("hideBadges", json.nullable(data.hide_badges, json.bool))])
}

pub fn tools_ozone_moderation_defs_account_stats_decoder() {
  use appeal_count <- decode.optional_field(
    "appealCount",
    None,
    decode.optional(decode.int),
  )
  use takedown_count <- decode.optional_field(
    "takedownCount",
    None,
    decode.optional(decode.int),
  )
  use suspend_count <- decode.optional_field(
    "suspendCount",
    None,
    decode.optional(decode.int),
  )
  use report_count <- decode.optional_field(
    "reportCount",
    None,
    decode.optional(decode.int),
  )
  use escalate_count <- decode.optional_field(
    "escalateCount",
    None,
    decode.optional(decode.int),
  )
  decode.success(
    ToolsOzoneModerationDefsAccountStats(
      appeal_count: appeal_count,
      takedown_count: takedown_count,
      suspend_count: suspend_count,
      report_count: report_count,
      escalate_count: escalate_count,
    ),
  )
}

pub fn tools_ozone_moderation_defs_account_stats_encode(
  data: ToolsOzoneModerationDefsAccountStats,
) {
  utils.object(
    [
      #("appealCount", json.nullable(data.appeal_count, json.int)),
      #("takedownCount", json.nullable(data.takedown_count, json.int)),
      #("suspendCount", json.nullable(data.suspend_count, json.int)),
      #("reportCount", json.nullable(data.report_count, json.int)),
      #("escalateCount", json.nullable(data.escalate_count, json.int))
    ],
  )
}

pub fn app_bsky_feed_describe_feed_generator_feed_decoder() {
  use uri <- decode.field("uri", decode.string)
  decode.success(AppBskyFeedDescribeFeedGeneratorFeed(uri: uri))
}

pub fn app_bsky_feed_describe_feed_generator_feed_encode(
  data: AppBskyFeedDescribeFeedGeneratorFeed,
) {
  utils.object([#("uri", json.string(data.uri))])
}

pub fn app_bsky_richtext_facet_byte_slice_decoder() {
  use byte_end <- decode.field("byteEnd", decode.int)
  use byte_start <- decode.field("byteStart", decode.int)
  decode.success(
    AppBskyRichtextFacetByteSlice(byte_end: byte_end, byte_start: byte_start),
  )
}

pub fn app_bsky_richtext_facet_byte_slice_encode(
  data: AppBskyRichtextFacetByteSlice,
) {
  utils.object(
    [
      #("byteEnd", json.int(data.byte_end)),
      #("byteStart", json.int(data.byte_start))
    ],
  )
}

pub fn tools_ozone_moderation_defs_mod_event_mute_reporter_decoder() {
  use duration_in_hours <- decode.optional_field(
    "durationInHours",
    None,
    decode.optional(decode.int),
  )
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneModerationDefsModEventMuteReporter(
      duration_in_hours: duration_in_hours,
      comment: comment,
    ),
  )
}

pub fn tools_ozone_moderation_defs_mod_event_mute_reporter_encode(
  data: ToolsOzoneModerationDefsModEventMuteReporter,
) {
  utils.object(
    [
      #("durationInHours", json.nullable(data.duration_in_hours, json.int)),
      #("comment", json.nullable(data.comment, json.string))
    ],
  )
}

pub fn app_bsky_graph_defs_starter_pack_view_decoder() {
  use indexed_at <- decode.field("indexedAt", decode.string)
  use joined_all_time_count <- decode.optional_field(
    "joinedAllTimeCount",
    None,
    decode.optional(decode.int),
  )
  use creator <- decode.field(
    "creator",
    app_bsky_actor_defs_profile_view_basic_decoder(),
  )
  use uri <- decode.field("uri", decode.string)
  use list_items_sample <- decode.optional_field(
    "listItemsSample",
    None,
    decode.optional(decode.list(app_bsky_graph_defs_list_item_view_decoder())),
  )
  use record <- decode.field("record", utils.dynamic_to_json())
  use joined_week_count <- decode.optional_field(
    "joinedWeekCount",
    None,
    decode.optional(decode.int),
  )
  use feeds <- decode.optional_field(
    "feeds",
    None,
    decode.optional(decode.list(app_bsky_feed_defs_generator_view_decoder())),
  )
  use list <- decode.optional_field(
    "list",
    None,
    decode.optional(app_bsky_graph_defs_list_view_basic_decoder()),
  )
  use cid <- decode.field("cid", decode.string)
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(decode.list(com_atproto_label_defs_label_decoder())),
  )
  decode.success(
    AppBskyGraphDefsStarterPackView(
      indexed_at: indexed_at,
      joined_all_time_count: joined_all_time_count,
      creator: creator,
      uri: uri,
      list_items_sample: list_items_sample,
      record: record,
      joined_week_count: joined_week_count,
      feeds: feeds,
      list: list,
      cid: cid,
      labels: labels,
    ),
  )
}

pub fn app_bsky_graph_defs_starter_pack_view_encode(
  data: AppBskyGraphDefsStarterPackView,
) {
  utils.object(
    [
      #("indexedAt", json.string(data.indexed_at)),
      #(
        "joinedAllTimeCount",
        json.nullable(data.joined_all_time_count, json.int),
      ),
      #("creator", app_bsky_actor_defs_profile_view_basic_encode(data.creator)),
      #("uri", json.string(data.uri)),
      #(
        "listItemsSample",
        json.nullable(
          data.list_items_sample,
          json.array(_, app_bsky_graph_defs_list_item_view_encode),
        ),
      ),
      #("record", fn(data) { data }(data.record)),
      #("joinedWeekCount", json.nullable(data.joined_week_count, json.int)),
      #(
        "feeds",
        json.nullable(
          data.feeds,
          json.array(_, app_bsky_feed_defs_generator_view_encode),
        ),
      ),
      #(
        "list",
        json.nullable(data.list, app_bsky_graph_defs_list_view_basic_encode),
      ),
      #("cid", json.string(data.cid)),
      #(
        "labels",
        json.nullable(
          data.labels,
          json.array(_, com_atproto_label_defs_label_encode),
        ),
      )
    ],
  )
}

pub fn tools_ozone_team_defs_member_decoder() {
  use profile <- decode.optional_field(
    "profile",
    None,
    decode.optional(app_bsky_actor_defs_profile_view_detailed_decoder()),
  )
  use updated_at <- decode.optional_field(
    "updatedAt",
    None,
    decode.optional(decode.string),
  )
  use role <- decode.field("role", decode.string)
  use created_at <- decode.optional_field(
    "createdAt",
    None,
    decode.optional(decode.string),
  )
  use last_updated_by <- decode.optional_field(
    "lastUpdatedBy",
    None,
    decode.optional(decode.string),
  )
  use disabled <- decode.optional_field(
    "disabled",
    None,
    decode.optional(decode.bool),
  )
  use did <- decode.field("did", decode.string)
  decode.success(
    ToolsOzoneTeamDefsMember(
      profile: profile,
      updated_at: updated_at,
      role: role,
      created_at: created_at,
      last_updated_by: last_updated_by,
      disabled: disabled,
      did: did,
    ),
  )
}

pub fn tools_ozone_team_defs_member_encode(data: ToolsOzoneTeamDefsMember) {
  utils.object(
    [
      #(
        "profile",
        json.nullable(
          data.profile,
          app_bsky_actor_defs_profile_view_detailed_encode,
        ),
      ),
      #("updatedAt", json.nullable(data.updated_at, json.string)),
      #("role", json.string(data.role)),
      #("createdAt", json.nullable(data.created_at, json.string)),
      #("lastUpdatedBy", json.nullable(data.last_updated_by, json.string)),
      #("disabled", json.nullable(data.disabled, json.bool)),
      #("did", json.string(data.did))
    ],
  )
}

pub fn app_bsky_embed_video_view_decoder() {
  use alt <- decode.optional_field("alt", None, decode.optional(decode.string))
  use thumbnail <- decode.optional_field(
    "thumbnail",
    None,
    decode.optional(decode.string),
  )
  use playlist <- decode.field("playlist", decode.string)
  use aspect_ratio <- decode.optional_field(
    "aspectRatio",
    None,
    decode.optional(app_bsky_embed_defs_aspect_ratio_decoder()),
  )
  use cid <- decode.field("cid", decode.string)
  decode.success(
    AppBskyEmbedVideoView(
      alt: alt,
      thumbnail: thumbnail,
      playlist: playlist,
      aspect_ratio: aspect_ratio,
      cid: cid,
    ),
  )
}

pub fn app_bsky_embed_video_view_encode(data: AppBskyEmbedVideoView) {
  utils.object(
    [
      #("alt", json.nullable(data.alt, json.string)),
      #("thumbnail", json.nullable(data.thumbnail, json.string)),
      #("playlist", json.string(data.playlist)),
      #(
        "aspectRatio",
        json.nullable(data.aspect_ratio, app_bsky_embed_defs_aspect_ratio_encode),
      ),
      #("cid", json.string(data.cid))
    ],
  )
}

pub fn tools_ozone_moderation_defs_mod_event_mute_decoder() {
  use duration_in_hours <- decode.field("durationInHours", decode.int)
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneModerationDefsModEventMute(
      duration_in_hours: duration_in_hours,
      comment: comment,
    ),
  )
}

pub fn tools_ozone_moderation_defs_mod_event_mute_encode(
  data: ToolsOzoneModerationDefsModEventMute,
) {
  utils.object(
    [
      #("durationInHours", json.int(data.duration_in_hours)),
      #("comment", json.nullable(data.comment, json.string))
    ],
  )
}

pub fn tools_ozone_server_get_config_viewer_config_decoder() {
  use role <- decode.optional_field("role", None, decode.optional(decode.string))
  decode.success(ToolsOzoneServerGetConfigViewerConfig(role: role))
}

pub fn tools_ozone_server_get_config_viewer_config_encode(
  data: ToolsOzoneServerGetConfigViewerConfig,
) {
  utils.object([#("role", json.nullable(data.role, json.string))])
}

pub fn app_bsky_feed_defs_clickthrough_reposter_decoder() {
  decode.string
}

pub fn app_bsky_feed_defs_clickthrough_reposter_encode(
  data: AppBskyFeedDefsClickthroughReposter,
) {
  json.string(data)
}

pub fn app_bsky_feed_postgate_disable_rule_decoder() {
  decode.dict(decode.string, utils.dynamic_to_json())
}

pub fn app_bsky_feed_postgate_disable_rule_encode(
  data: AppBskyFeedPostgateDisableRule,
) {
  utils.dict(data, fn(data) { data })
}

pub fn app_bsky_embed_images_decoder() {
  use images <- decode.field(
    "images",
    decode.list(app_bsky_embed_images_image_decoder()),
  )
  decode.success(AppBskyEmbedImages(images: images))
}

pub fn app_bsky_embed_images_encode(data: AppBskyEmbedImages) {
  utils.object(
    [#("images", json.array(_, app_bsky_embed_images_image_encode)(data.images))],
  )
}

pub fn tools_ozone_hosting_get_account_history_event_decoder() {
  use details <- decode.field("details", utils.dynamic_to_json())
  use created_at <- decode.field("createdAt", decode.string)
  use created_by <- decode.field("createdBy", decode.string)
  decode.success(
    ToolsOzoneHostingGetAccountHistoryEvent(
      details: details,
      created_at: created_at,
      created_by: created_by,
    ),
  )
}

pub fn tools_ozone_hosting_get_account_history_event_encode(
  data: ToolsOzoneHostingGetAccountHistoryEvent,
) {
  utils.object(
    [
      #("details", fn(data) { data }(data.details)),
      #("createdAt", json.string(data.created_at)),
      #("createdBy", json.string(data.created_by))
    ],
  )
}

pub fn app_bsky_labeler_defs_labeler_viewer_state_decoder() {
  use like <- decode.optional_field("like", None, decode.optional(decode.string))
  decode.success(AppBskyLabelerDefsLabelerViewerState(like: like))
}

pub fn app_bsky_labeler_defs_labeler_viewer_state_encode(
  data: AppBskyLabelerDefsLabelerViewerState,
) {
  utils.object([#("like", json.nullable(data.like, json.string))])
}

pub fn com_atproto_moderation_defs_reason_other_decoder() {
  decode.string
}

pub fn com_atproto_moderation_defs_reason_other_encode(
  data: ComAtprotoModerationDefsReasonOther,
) {
  json.string(data)
}

pub fn chat_bsky_actor_defs_profile_view_basic_decoder() {
  use associated <- decode.optional_field(
    "associated",
    None,
    decode.optional(app_bsky_actor_defs_profile_associated_decoder()),
  )
  use handle <- decode.field("handle", decode.string)
  use display_name <- decode.optional_field(
    "displayName",
    None,
    decode.optional(decode.string),
  )
  use viewer <- decode.optional_field(
    "viewer",
    None,
    decode.optional(app_bsky_actor_defs_viewer_state_decoder()),
  )
  use chat_disabled <- decode.optional_field(
    "chatDisabled",
    None,
    decode.optional(decode.bool),
  )
  use avatar <- decode.optional_field(
    "avatar",
    None,
    decode.optional(decode.string),
  )
  use verification <- decode.optional_field(
    "verification",
    None,
    decode.optional(app_bsky_actor_defs_verification_state_decoder()),
  )
  use did <- decode.field("did", decode.string)
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(decode.list(com_atproto_label_defs_label_decoder())),
  )
  decode.success(
    ChatBskyActorDefsProfileViewBasic(
      associated: associated,
      handle: handle,
      display_name: display_name,
      viewer: viewer,
      chat_disabled: chat_disabled,
      avatar: avatar,
      verification: verification,
      did: did,
      labels: labels,
    ),
  )
}

pub fn chat_bsky_actor_defs_profile_view_basic_encode(
  data: ChatBskyActorDefsProfileViewBasic,
) {
  utils.object(
    [
      #(
        "associated",
        json.nullable(
          data.associated,
          app_bsky_actor_defs_profile_associated_encode,
        ),
      ),
      #("handle", json.string(data.handle)),
      #("displayName", json.nullable(data.display_name, json.string)),
      #(
        "viewer",
        json.nullable(data.viewer, app_bsky_actor_defs_viewer_state_encode),
      ),
      #("chatDisabled", json.nullable(data.chat_disabled, json.bool)),
      #("avatar", json.nullable(data.avatar, json.string)),
      #(
        "verification",
        json.nullable(
          data.verification,
          app_bsky_actor_defs_verification_state_encode,
        ),
      ),
      #("did", json.string(data.did)),
      #(
        "labels",
        json.nullable(
          data.labels,
          json.array(_, com_atproto_label_defs_label_encode),
        ),
      )
    ],
  )
}

pub fn tools_ozone_moderation_defs_review_none_decoder() {
  decode.string
}

pub fn tools_ozone_moderation_defs_review_none_encode(
  data: ToolsOzoneModerationDefsReviewNone,
) {
  json.string(data)
}

pub fn app_bsky_actor_profile_decoder() {
  use joined_via_starter_pack <- decode.optional_field(
    "joinedViaStarterPack",
    None,
    decode.optional(com_atproto_repo_strong_ref_decoder()),
  )
  use banner <- decode.optional_field(
    "banner",
    None,
    decode.optional(decode.string),
  )
  use display_name <- decode.optional_field(
    "displayName",
    None,
    decode.optional(decode.string),
  )
  use pinned_post <- decode.optional_field(
    "pinnedPost",
    None,
    decode.optional(com_atproto_repo_strong_ref_decoder()),
  )
  use avatar <- decode.optional_field(
    "avatar",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "createdAt",
    None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(com_atproto_label_defs_self_labels_decoder()),
  )
  decode.success(
    AppBskyActorProfile(
      joined_via_starter_pack: joined_via_starter_pack,
      banner: banner,
      display_name: display_name,
      pinned_post: pinned_post,
      avatar: avatar,
      created_at: created_at,
      description: description,
      labels: labels,
    ),
  )
}

pub fn app_bsky_actor_profile_encode(data: AppBskyActorProfile) {
  utils.object(
    [
      #(
        "joinedViaStarterPack",
        json.nullable(
          data.joined_via_starter_pack,
          com_atproto_repo_strong_ref_encode,
        ),
      ),
      #("banner", json.nullable(data.banner, json.string)),
      #("displayName", json.nullable(data.display_name, json.string)),
      #(
        "pinnedPost",
        json.nullable(data.pinned_post, com_atproto_repo_strong_ref_encode),
      ),
      #("avatar", json.nullable(data.avatar, json.string)),
      #("createdAt", json.nullable(data.created_at, json.string)),
      #("description", json.nullable(data.description, json.string)),
      #(
        "labels",
        json.nullable(data.labels, com_atproto_label_defs_self_labels_encode),
      )
    ],
  )
}

pub fn tools_ozone_hosting_get_account_history_email_confirmed_decoder() {
  use email <- decode.field("email", decode.string)
  decode.success(ToolsOzoneHostingGetAccountHistoryEmailConfirmed(email: email))
}

pub fn tools_ozone_hosting_get_account_history_email_confirmed_encode(
  data: ToolsOzoneHostingGetAccountHistoryEmailConfirmed,
) {
  utils.object([#("email", json.string(data.email))])
}

pub fn app_bsky_graph_defs_curatelist_decoder() {
  decode.string
}

pub fn app_bsky_graph_defs_curatelist_encode(data: AppBskyGraphDefsCuratelist) {
  json.string(data)
}

pub fn app_bsky_feed_post_decoder() {
  use langs <- decode.optional_field(
    "langs",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use reply <- decode.optional_field(
    "reply",
    None,
    decode.optional(app_bsky_feed_post_reply_ref_decoder()),
  )
  use text <- decode.field("text", decode.string)
  use tags <- decode.optional_field(
    "tags",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use embed <- decode.optional_field(
    "embed",
    None,
    decode.optional(utils.dynamic_to_json()),
  )
  use created_at <- decode.field("createdAt", decode.string)
  use facets <- decode.optional_field(
    "facets",
    None,
    decode.optional(decode.list(app_bsky_richtext_facet_decoder())),
  )
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(com_atproto_label_defs_self_labels_decoder()),
  )
  decode.success(
    AppBskyFeedPost(
      langs: langs,
      reply: reply,
      text: text,
      tags: tags,
      embed: embed,
      created_at: created_at,
      facets: facets,
      labels: labels,
    ),
  )
}

pub fn app_bsky_feed_post_encode(data: AppBskyFeedPost) {
  utils.object(
    [
      #("langs", json.nullable(data.langs, json.array(_, json.string))),
      #("reply", json.nullable(data.reply, app_bsky_feed_post_reply_ref_encode)),
      #("text", json.string(data.text)),
      #("tags", json.nullable(data.tags, json.array(_, json.string))),
      #("embed", json.nullable(data.embed, fn(data) { data })),
      #("createdAt", json.string(data.created_at)),
      #(
        "facets",
        json.nullable(data.facets, json.array(_, app_bsky_richtext_facet_encode)),
      ),
      #(
        "labels",
        json.nullable(data.labels, com_atproto_label_defs_self_labels_encode),
      )
    ],
  )
}

pub fn app_bsky_feed_defs_viewer_state_decoder() {
  use thread_muted <- decode.optional_field(
    "threadMuted",
    None,
    decode.optional(decode.bool),
  )
  use reply_disabled <- decode.optional_field(
    "replyDisabled",
    None,
    decode.optional(decode.bool),
  )
  use repost <- decode.optional_field(
    "repost",
    None,
    decode.optional(decode.string),
  )
  use embedding_disabled <- decode.optional_field(
    "embeddingDisabled",
    None,
    decode.optional(decode.bool),
  )
  use like <- decode.optional_field("like", None, decode.optional(decode.string))
  use pinned <- decode.optional_field(
    "pinned",
    None,
    decode.optional(decode.bool),
  )
  decode.success(
    AppBskyFeedDefsViewerState(
      thread_muted: thread_muted,
      reply_disabled: reply_disabled,
      repost: repost,
      embedding_disabled: embedding_disabled,
      like: like,
      pinned: pinned,
    ),
  )
}

pub fn app_bsky_feed_defs_viewer_state_encode(data: AppBskyFeedDefsViewerState) {
  utils.object(
    [
      #("threadMuted", json.nullable(data.thread_muted, json.bool)),
      #("replyDisabled", json.nullable(data.reply_disabled, json.bool)),
      #("repost", json.nullable(data.repost, json.string)),
      #("embeddingDisabled", json.nullable(data.embedding_disabled, json.bool)),
      #("like", json.nullable(data.like, json.string)),
      #("pinned", json.nullable(data.pinned, json.bool))
    ],
  )
}

pub fn app_bsky_graph_defs_list_view_basic_decoder() {
  use indexed_at <- decode.optional_field(
    "indexedAt",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.field("name", decode.string)
  use uri <- decode.field("uri", decode.string)
  use viewer <- decode.optional_field(
    "viewer",
    None,
    decode.optional(app_bsky_graph_defs_list_viewer_state_decoder()),
  )
  use avatar <- decode.optional_field(
    "avatar",
    None,
    decode.optional(decode.string),
  )
  use cid <- decode.field("cid", decode.string)
  use purpose <- decode.field(
    "purpose",
    app_bsky_graph_defs_list_purpose_decoder(),
  )
  use list_item_count <- decode.optional_field(
    "listItemCount",
    None,
    decode.optional(decode.int),
  )
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(decode.list(com_atproto_label_defs_label_decoder())),
  )
  decode.success(
    AppBskyGraphDefsListViewBasic(
      indexed_at: indexed_at,
      name: name,
      uri: uri,
      viewer: viewer,
      avatar: avatar,
      cid: cid,
      purpose: purpose,
      list_item_count: list_item_count,
      labels: labels,
    ),
  )
}

pub fn app_bsky_graph_defs_list_view_basic_encode(
  data: AppBskyGraphDefsListViewBasic,
) {
  utils.object(
    [
      #("indexedAt", json.nullable(data.indexed_at, json.string)),
      #("name", json.string(data.name)),
      #("uri", json.string(data.uri)),
      #(
        "viewer",
        json.nullable(data.viewer, app_bsky_graph_defs_list_viewer_state_encode),
      ),
      #("avatar", json.nullable(data.avatar, json.string)),
      #("cid", json.string(data.cid)),
      #("purpose", app_bsky_graph_defs_list_purpose_encode(data.purpose)),
      #("listItemCount", json.nullable(data.list_item_count, json.int)),
      #(
        "labels",
        json.nullable(
          data.labels,
          json.array(_, com_atproto_label_defs_label_encode),
        ),
      )
    ],
  )
}

pub fn app_bsky_actor_status_decoder() {
  use duration_minutes <- decode.optional_field(
    "durationMinutes",
    None,
    decode.optional(decode.int),
  )
  use status <- decode.field("status", decode.string)
  use embed <- decode.optional_field(
    "embed",
    None,
    decode.optional(app_bsky_embed_external_decoder()),
  )
  use created_at <- decode.field("createdAt", decode.string)
  decode.success(
    AppBskyActorStatus(
      duration_minutes: duration_minutes,
      status: status,
      embed: embed,
      created_at: created_at,
    ),
  )
}

pub fn app_bsky_actor_status_encode(data: AppBskyActorStatus) {
  utils.object(
    [
      #("durationMinutes", json.nullable(data.duration_minutes, json.int)),
      #("status", json.string(data.status)),
      #("embed", json.nullable(data.embed, app_bsky_embed_external_encode)),
      #("createdAt", json.string(data.created_at))
    ],
  )
}

pub fn com_atproto_sync_defs_host_status_decoder() {
  decode.string
}

pub fn com_atproto_sync_defs_host_status_encode(
  data: ComAtprotoSyncDefsHostStatus,
) {
  json.string(data)
}

pub fn app_bsky_actor_status_live_decoder() {
  decode.string
}

pub fn app_bsky_actor_status_live_encode(data: AppBskyActorStatusLive) {
  json.string(data)
}

pub fn com_atproto_repo_apply_writes_delete_decoder() {
  use rkey <- decode.field("rkey", decode.string)
  use collection <- decode.field("collection", decode.string)
  decode.success(
    ComAtprotoRepoApplyWritesDelete(rkey: rkey, collection: collection),
  )
}

pub fn com_atproto_repo_apply_writes_delete_encode(
  data: ComAtprotoRepoApplyWritesDelete,
) {
  utils.object(
    [
      #("rkey", json.string(data.rkey)),
      #("collection", json.string(data.collection))
    ],
  )
}

pub fn app_bsky_graph_listblock_decoder() {
  use subject <- decode.field("subject", decode.string)
  use created_at <- decode.field("createdAt", decode.string)
  decode.success(AppBskyGraphListblock(subject: subject, created_at: created_at))
}

pub fn app_bsky_graph_listblock_encode(data: AppBskyGraphListblock) {
  utils.object(
    [
      #("subject", json.string(data.subject)),
      #("createdAt", json.string(data.created_at))
    ],
  )
}

pub fn app_bsky_feed_defs_content_mode_unspecified_decoder() {
  decode.string
}

pub fn app_bsky_feed_defs_content_mode_unspecified_encode(
  data: AppBskyFeedDefsContentModeUnspecified,
) {
  json.string(data)
}

pub fn chat_bsky_convo_defs_message_view_sender_decoder() {
  use did <- decode.field("did", decode.string)
  decode.success(ChatBskyConvoDefsMessageViewSender(did: did))
}

pub fn chat_bsky_convo_defs_message_view_sender_encode(
  data: ChatBskyConvoDefsMessageViewSender,
) {
  utils.object([#("did", json.string(data.did))])
}

pub fn app_bsky_actor_defs_nux_decoder() {
  use expires_at <- decode.optional_field(
    "expiresAt",
    None,
    decode.optional(decode.string),
  )
  use data <- decode.optional_field("data", None, decode.optional(decode.string))
  use completed <- decode.field("completed", decode.bool)
  use id <- decode.field("id", decode.string)
  decode.success(
    AppBskyActorDefsNux(
      expires_at: expires_at,
      data: data,
      completed: completed,
      id: id,
    ),
  )
}

pub fn app_bsky_actor_defs_nux_encode(data: AppBskyActorDefsNux) {
  utils.object(
    [
      #("expiresAt", json.nullable(data.expires_at, json.string)),
      #("data", json.nullable(data.data, json.string)),
      #("completed", json.bool(data.completed)),
      #("id", json.string(data.id))
    ],
  )
}

pub fn tools_ozone_moderation_defs_mod_event_view_detail_decoder() {
  use subject_blobs <- decode.field(
    "subjectBlobs",
    decode.list(tools_ozone_moderation_defs_blob_view_decoder()),
  )
  use subject <- decode.field("subject", utils.dynamic_to_json())
  use event <- decode.field("event", utils.dynamic_to_json())
  use id <- decode.field("id", decode.int)
  use created_at <- decode.field("createdAt", decode.string)
  use created_by <- decode.field("createdBy", decode.string)
  decode.success(
    ToolsOzoneModerationDefsModEventViewDetail(
      subject_blobs: subject_blobs,
      subject: subject,
      event: event,
      id: id,
      created_at: created_at,
      created_by: created_by,
    ),
  )
}

pub fn tools_ozone_moderation_defs_mod_event_view_detail_encode(
  data: ToolsOzoneModerationDefsModEventViewDetail,
) {
  utils.object(
    [
      #(
        "subjectBlobs",
        json.array(_, tools_ozone_moderation_defs_blob_view_encode)(
          data.subject_blobs,
        ),
      ),
      #("subject", fn(data) { data }(data.subject)),
      #("event", fn(data) { data }(data.event)),
      #("id", json.int(data.id)),
      #("createdAt", json.string(data.created_at)),
      #("createdBy", json.string(data.created_by))
    ],
  )
}

pub fn tools_ozone_moderation_defs_mod_event_divert_decoder() {
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(ToolsOzoneModerationDefsModEventDivert(comment: comment))
}

pub fn tools_ozone_moderation_defs_mod_event_divert_encode(
  data: ToolsOzoneModerationDefsModEventDivert,
) {
  utils.object([#("comment", json.nullable(data.comment, json.string))])
}

pub fn chat_bsky_convo_defs_log_delete_message_decoder() {
  use rev <- decode.field("rev", decode.string)
  use message <- decode.field("message", utils.dynamic_to_json())
  use convo_id <- decode.field("convoId", decode.string)
  decode.success(
    ChatBskyConvoDefsLogDeleteMessage(
      rev: rev,
      message: message,
      convo_id: convo_id,
    ),
  )
}

pub fn chat_bsky_convo_defs_log_delete_message_encode(
  data: ChatBskyConvoDefsLogDeleteMessage,
) {
  utils.object(
    [
      #("rev", json.string(data.rev)),
      #("message", fn(data) { data }(data.message)),
      #("convoId", json.string(data.convo_id))
    ],
  )
}

pub fn app_bsky_feed_defs_threadgate_view_decoder() {
  use uri <- decode.optional_field("uri", None, decode.optional(decode.string))
  use record <- decode.optional_field(
    "record",
    None,
    decode.optional(utils.dynamic_to_json()),
  )
  use lists <- decode.optional_field(
    "lists",
    None,
    decode.optional(decode.list(app_bsky_graph_defs_list_view_basic_decoder())),
  )
  use cid <- decode.optional_field("cid", None, decode.optional(decode.string))
  decode.success(
    AppBskyFeedDefsThreadgateView(
      uri: uri,
      record: record,
      lists: lists,
      cid: cid,
    ),
  )
}

pub fn app_bsky_feed_defs_threadgate_view_encode(
  data: AppBskyFeedDefsThreadgateView,
) {
  utils.object(
    [
      #("uri", json.nullable(data.uri, json.string)),
      #("record", json.nullable(data.record, fn(data) { data })),
      #(
        "lists",
        json.nullable(
          data.lists,
          json.array(_, app_bsky_graph_defs_list_view_basic_encode),
        ),
      ),
      #("cid", json.nullable(data.cid, json.string))
    ],
  )
}

pub fn chat_bsky_convo_defs_convo_view_decoder() {
  use unread_count <- decode.field("unreadCount", decode.int)
  use rev <- decode.field("rev", decode.string)
  use muted <- decode.field("muted", decode.bool)
  use last_message <- decode.optional_field(
    "lastMessage",
    None,
    decode.optional(utils.dynamic_to_json()),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.string),
  )
  use members <- decode.field(
    "members",
    decode.list(chat_bsky_actor_defs_profile_view_basic_decoder()),
  )
  use id <- decode.field("id", decode.string)
  use last_reaction <- decode.optional_field(
    "lastReaction",
    None,
    decode.optional(chat_bsky_convo_defs_message_and_reaction_view_decoder()),
  )
  decode.success(
    ChatBskyConvoDefsConvoView(
      unread_count: unread_count,
      rev: rev,
      muted: muted,
      last_message: last_message,
      status: status,
      members: members,
      id: id,
      last_reaction: last_reaction,
    ),
  )
}

pub fn chat_bsky_convo_defs_convo_view_encode(data: ChatBskyConvoDefsConvoView) {
  utils.object(
    [
      #("unreadCount", json.int(data.unread_count)),
      #("rev", json.string(data.rev)),
      #("muted", json.bool(data.muted)),
      #("lastMessage", json.nullable(data.last_message, fn(data) { data })),
      #("status", json.nullable(data.status, json.string)),
      #(
        "members",
        json.array(_, chat_bsky_actor_defs_profile_view_basic_encode)(
          data.members,
        ),
      ),
      #("id", json.string(data.id)),
      #(
        "lastReaction",
        json.nullable(
          data.last_reaction,
          chat_bsky_convo_defs_message_and_reaction_view_encode,
        ),
      )
    ],
  )
}

pub fn tools_ozone_moderation_defs_account_event_decoder() {
  use active <- decode.field("active", decode.bool)
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.string),
  )
  use timestamp <- decode.field("timestamp", decode.string)
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneModerationDefsAccountEvent(
      active: active,
      status: status,
      timestamp: timestamp,
      comment: comment,
    ),
  )
}

pub fn tools_ozone_moderation_defs_account_event_encode(
  data: ToolsOzoneModerationDefsAccountEvent,
) {
  utils.object(
    [
      #("active", json.bool(data.active)),
      #("status", json.nullable(data.status, json.string)),
      #("timestamp", json.string(data.timestamp)),
      #("comment", json.nullable(data.comment, json.string))
    ],
  )
}

pub fn tools_ozone_moderation_defs_record_hosting_decoder() {
  use deleted_at <- decode.optional_field(
    "deletedAt",
    None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updatedAt",
    None,
    decode.optional(decode.string),
  )
  use status <- decode.field("status", decode.string)
  use created_at <- decode.optional_field(
    "createdAt",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneModerationDefsRecordHosting(
      deleted_at: deleted_at,
      updated_at: updated_at,
      status: status,
      created_at: created_at,
    ),
  )
}

pub fn tools_ozone_moderation_defs_record_hosting_encode(
  data: ToolsOzoneModerationDefsRecordHosting,
) {
  utils.object(
    [
      #("deletedAt", json.nullable(data.deleted_at, json.string)),
      #("updatedAt", json.nullable(data.updated_at, json.string)),
      #("status", json.string(data.status)),
      #("createdAt", json.nullable(data.created_at, json.string))
    ],
  )
}

pub fn com_atproto_server_create_invite_codes_account_codes_decoder() {
  use codes <- decode.field("codes", decode.list(decode.string))
  use account <- decode.field("account", decode.string)
  decode.success(
    ComAtprotoServerCreateInviteCodesAccountCodes(codes: codes, account: account),
  )
}

pub fn com_atproto_server_create_invite_codes_account_codes_encode(
  data: ComAtprotoServerCreateInviteCodesAccountCodes,
) {
  utils.object(
    [
      #("codes", json.array(_, json.string)(data.codes)),
      #("account", json.string(data.account))
    ],
  )
}

pub fn com_atproto_moderation_defs_reason_spam_decoder() {
  decode.string
}

pub fn com_atproto_moderation_defs_reason_spam_encode(
  data: ComAtprotoModerationDefsReasonSpam,
) {
  json.string(data)
}

pub fn app_bsky_embed_record_view_decoder() {
  use record <- decode.field("record", utils.dynamic_to_json())
  decode.success(AppBskyEmbedRecordView(record: record))
}

pub fn app_bsky_embed_record_view_encode(data: AppBskyEmbedRecordView) {
  utils.object([#("record", fn(data) { data }(data.record))])
}

pub fn tools_ozone_moderation_defs_account_hosting_decoder() {
  use deactivated_at <- decode.optional_field(
    "deactivatedAt",
    None,
    decode.optional(decode.string),
  )
  use deleted_at <- decode.optional_field(
    "deletedAt",
    None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updatedAt",
    None,
    decode.optional(decode.string),
  )
  use reactivated_at <- decode.optional_field(
    "reactivatedAt",
    None,
    decode.optional(decode.string),
  )
  use status <- decode.field("status", decode.string)
  use created_at <- decode.optional_field(
    "createdAt",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneModerationDefsAccountHosting(
      deactivated_at: deactivated_at,
      deleted_at: deleted_at,
      updated_at: updated_at,
      reactivated_at: reactivated_at,
      status: status,
      created_at: created_at,
    ),
  )
}

pub fn tools_ozone_moderation_defs_account_hosting_encode(
  data: ToolsOzoneModerationDefsAccountHosting,
) {
  utils.object(
    [
      #("deactivatedAt", json.nullable(data.deactivated_at, json.string)),
      #("deletedAt", json.nullable(data.deleted_at, json.string)),
      #("updatedAt", json.nullable(data.updated_at, json.string)),
      #("reactivatedAt", json.nullable(data.reactivated_at, json.string)),
      #("status", json.string(data.status)),
      #("createdAt", json.nullable(data.created_at, json.string))
    ],
  )
}

pub fn app_bsky_graph_block_decoder() {
  use subject <- decode.field("subject", decode.string)
  use created_at <- decode.field("createdAt", decode.string)
  decode.success(AppBskyGraphBlock(subject: subject, created_at: created_at))
}

pub fn app_bsky_graph_block_encode(data: AppBskyGraphBlock) {
  utils.object(
    [
      #("subject", json.string(data.subject)),
      #("createdAt", json.string(data.created_at))
    ],
  )
}

pub fn tools_ozone_moderation_defs_record_event_decoder() {
  use op <- decode.field("op", decode.string)
  use timestamp <- decode.field("timestamp", decode.string)
  use cid <- decode.optional_field("cid", None, decode.optional(decode.string))
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneModerationDefsRecordEvent(
      op: op,
      timestamp: timestamp,
      cid: cid,
      comment: comment,
    ),
  )
}

pub fn tools_ozone_moderation_defs_record_event_encode(
  data: ToolsOzoneModerationDefsRecordEvent,
) {
  utils.object(
    [
      #("op", json.string(data.op)),
      #("timestamp", json.string(data.timestamp)),
      #("cid", json.nullable(data.cid, json.string)),
      #("comment", json.nullable(data.comment, json.string))
    ],
  )
}

pub fn com_atproto_label_defs_self_labels_decoder() {
  use values <- decode.field(
    "values",
    decode.list(com_atproto_label_defs_self_label_decoder()),
  )
  decode.success(ComAtprotoLabelDefsSelfLabels(values: values))
}

pub fn com_atproto_label_defs_self_labels_encode(
  data: ComAtprotoLabelDefsSelfLabels,
) {
  utils.object(
    [
      #(
        "values",
        json.array(_, com_atproto_label_defs_self_label_encode)(data.values),
      )
    ],
  )
}

pub fn com_atproto_repo_apply_writes_update_decoder() {
  use rkey <- decode.field("rkey", decode.string)
  use value <- decode.field("value", utils.dynamic_to_json())
  use collection <- decode.field("collection", decode.string)
  decode.success(
    ComAtprotoRepoApplyWritesUpdate(
      rkey: rkey,
      value: value,
      collection: collection,
    ),
  )
}

pub fn com_atproto_repo_apply_writes_update_encode(
  data: ComAtprotoRepoApplyWritesUpdate,
) {
  utils.object(
    [
      #("rkey", json.string(data.rkey)),
      #("value", fn(data) { data }(data.value)),
      #("collection", json.string(data.collection))
    ],
  )
}

pub fn app_bsky_graph_defs_referencelist_decoder() {
  decode.string
}

pub fn app_bsky_graph_defs_referencelist_encode(
  data: AppBskyGraphDefsReferencelist,
) {
  json.string(data)
}

pub fn app_bsky_actor_defs_feed_view_pref_decoder() {
  use hide_replies <- decode.optional_field(
    "hideReplies",
    None,
    decode.optional(decode.bool),
  )
  use hide_replies_by_unfollowed <- decode.optional_field(
    "hideRepliesByUnfollowed",
    None,
    decode.optional(decode.bool),
  )
  use hide_quote_posts <- decode.optional_field(
    "hideQuotePosts",
    None,
    decode.optional(decode.bool),
  )
  use hide_replies_by_like_count <- decode.optional_field(
    "hideRepliesByLikeCount",
    None,
    decode.optional(decode.int),
  )
  use feed <- decode.field("feed", decode.string)
  use hide_reposts <- decode.optional_field(
    "hideReposts",
    None,
    decode.optional(decode.bool),
  )
  decode.success(
    AppBskyActorDefsFeedViewPref(
      hide_replies: hide_replies,
      hide_replies_by_unfollowed: hide_replies_by_unfollowed,
      hide_quote_posts: hide_quote_posts,
      hide_replies_by_like_count: hide_replies_by_like_count,
      feed: feed,
      hide_reposts: hide_reposts,
    ),
  )
}

pub fn app_bsky_actor_defs_feed_view_pref_encode(
  data: AppBskyActorDefsFeedViewPref,
) {
  utils.object(
    [
      #("hideReplies", json.nullable(data.hide_replies, json.bool)),
      #(
        "hideRepliesByUnfollowed",
        json.nullable(data.hide_replies_by_unfollowed, json.bool),
      ),
      #("hideQuotePosts", json.nullable(data.hide_quote_posts, json.bool)),
      #(
        "hideRepliesByLikeCount",
        json.nullable(data.hide_replies_by_like_count, json.int),
      ),
      #("feed", json.string(data.feed)),
      #("hideReposts", json.nullable(data.hide_reposts, json.bool))
    ],
  )
}

pub fn tools_ozone_moderation_defs_subject_review_state_decoder() {
  decode.string
}

pub fn tools_ozone_moderation_defs_subject_review_state_encode(
  data: ToolsOzoneModerationDefsSubjectReviewState,
) {
  json.string(data)
}

pub fn app_bsky_embed_defs_aspect_ratio_decoder() {
  use width <- decode.field("width", decode.int)
  use height <- decode.field("height", decode.int)
  decode.success(AppBskyEmbedDefsAspectRatio(width: width, height: height))
}

pub fn app_bsky_embed_defs_aspect_ratio_encode(data: AppBskyEmbedDefsAspectRatio) {
  utils.object(
    [#("width", json.int(data.width)), #("height", json.int(data.height))],
  )
}

pub fn app_bsky_feed_defs_interaction_reply_decoder() {
  decode.string
}

pub fn app_bsky_feed_defs_interaction_reply_encode(
  data: AppBskyFeedDefsInteractionReply,
) {
  json.string(data)
}

pub fn tools_ozone_hosting_get_account_history_email_updated_decoder() {
  use email <- decode.field("email", decode.string)
  decode.success(ToolsOzoneHostingGetAccountHistoryEmailUpdated(email: email))
}

pub fn tools_ozone_hosting_get_account_history_email_updated_encode(
  data: ToolsOzoneHostingGetAccountHistoryEmailUpdated,
) {
  utils.object([#("email", json.string(data.email))])
}

pub fn tools_ozone_verification_grant_verifications_verification_input_decoder() {
  use handle <- decode.field("handle", decode.string)
  use subject <- decode.field("subject", decode.string)
  use display_name <- decode.field("displayName", decode.string)
  use created_at <- decode.optional_field(
    "createdAt",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneVerificationGrantVerificationsVerificationInput(
      handle: handle,
      subject: subject,
      display_name: display_name,
      created_at: created_at,
    ),
  )
}

pub fn tools_ozone_verification_grant_verifications_verification_input_encode(
  data: ToolsOzoneVerificationGrantVerificationsVerificationInput,
) {
  utils.object(
    [
      #("handle", json.string(data.handle)),
      #("subject", json.string(data.subject)),
      #("displayName", json.string(data.display_name)),
      #("createdAt", json.nullable(data.created_at, json.string))
    ],
  )
}

pub fn com_atproto_repo_apply_writes_delete_result_decoder() {
  decode.dict(decode.string, utils.dynamic_to_json())
}

pub fn com_atproto_repo_apply_writes_delete_result_encode(
  data: ComAtprotoRepoApplyWritesDeleteResult,
) {
  utils.dict(data, fn(data) { data })
}

pub fn app_bsky_feed_defs_clickthrough_embed_decoder() {
  decode.string
}

pub fn app_bsky_feed_defs_clickthrough_embed_encode(
  data: AppBskyFeedDefsClickthroughEmbed,
) {
  json.string(data)
}

pub fn app_bsky_actor_defs_profile_associated_decoder() {
  use feedgens <- decode.optional_field(
    "feedgens",
    None,
    decode.optional(decode.int),
  )
  use labeler <- decode.optional_field(
    "labeler",
    None,
    decode.optional(decode.bool),
  )
  use starter_packs <- decode.optional_field(
    "starterPacks",
    None,
    decode.optional(decode.int),
  )
  use lists <- decode.optional_field("lists", None, decode.optional(decode.int))
  use chat <- decode.optional_field(
    "chat",
    None,
    decode.optional(app_bsky_actor_defs_profile_associated_chat_decoder()),
  )
  decode.success(
    AppBskyActorDefsProfileAssociated(
      feedgens: feedgens,
      labeler: labeler,
      starter_packs: starter_packs,
      lists: lists,
      chat: chat,
    ),
  )
}

pub fn app_bsky_actor_defs_profile_associated_encode(
  data: AppBskyActorDefsProfileAssociated,
) {
  utils.object(
    [
      #("feedgens", json.nullable(data.feedgens, json.int)),
      #("labeler", json.nullable(data.labeler, json.bool)),
      #("starterPacks", json.nullable(data.starter_packs, json.int)),
      #("lists", json.nullable(data.lists, json.int)),
      #(
        "chat",
        json.nullable(
          data.chat,
          app_bsky_actor_defs_profile_associated_chat_encode,
        ),
      )
    ],
  )
}

pub fn com_atproto_sync_list_repos_repo_decoder() {
  use head <- decode.field("head", decode.string)
  use rev <- decode.field("rev", decode.string)
  use active <- decode.optional_field(
    "active",
    None,
    decode.optional(decode.bool),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.string),
  )
  use did <- decode.field("did", decode.string)
  decode.success(
    ComAtprotoSyncListReposRepo(
      head: head,
      rev: rev,
      active: active,
      status: status,
      did: did,
    ),
  )
}

pub fn com_atproto_sync_list_repos_repo_encode(data: ComAtprotoSyncListReposRepo) {
  utils.object(
    [
      #("head", json.string(data.head)),
      #("rev", json.string(data.rev)),
      #("active", json.nullable(data.active, json.bool)),
      #("status", json.nullable(data.status, json.string)),
      #("did", json.string(data.did))
    ],
  )
}

pub fn tools_ozone_moderation_defs_mod_event_report_decoder() {
  use is_reporter_muted <- decode.optional_field(
    "isReporterMuted",
    None,
    decode.optional(decode.bool),
  )
  use report_type <- decode.field(
    "reportType",
    com_atproto_moderation_defs_reason_type_decoder(),
  )
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneModerationDefsModEventReport(
      is_reporter_muted: is_reporter_muted,
      report_type: report_type,
      comment: comment,
    ),
  )
}

pub fn tools_ozone_moderation_defs_mod_event_report_encode(
  data: ToolsOzoneModerationDefsModEventReport,
) {
  utils.object(
    [
      #("isReporterMuted", json.nullable(data.is_reporter_muted, json.bool)),
      #(
        "reportType",
        com_atproto_moderation_defs_reason_type_encode(data.report_type),
      ),
      #("comment", json.nullable(data.comment, json.string))
    ],
  )
}

pub fn com_atproto_server_create_app_password_app_password_decoder() {
  use name <- decode.field("name", decode.string)
  use privileged <- decode.optional_field(
    "privileged",
    None,
    decode.optional(decode.bool),
  )
  use created_at <- decode.field("createdAt", decode.string)
  use password <- decode.field("password", decode.string)
  decode.success(
    ComAtprotoServerCreateAppPasswordAppPassword(
      name: name,
      privileged: privileged,
      created_at: created_at,
      password: password,
    ),
  )
}

pub fn com_atproto_server_create_app_password_app_password_encode(
  data: ComAtprotoServerCreateAppPasswordAppPassword,
) {
  utils.object(
    [
      #("name", json.string(data.name)),
      #("privileged", json.nullable(data.privileged, json.bool)),
      #("createdAt", json.string(data.created_at)),
      #("password", json.string(data.password))
    ],
  )
}

pub fn app_bsky_notification_defs_record_deleted_decoder() {
  decode.dict(decode.string, utils.dynamic_to_json())
}

pub fn app_bsky_notification_defs_record_deleted_encode(
  data: AppBskyNotificationDefsRecordDeleted,
) {
  utils.dict(data, fn(data) { data })
}

pub fn app_bsky_feed_post_reply_ref_decoder() {
  use root <- decode.field("root", com_atproto_repo_strong_ref_decoder())
  use parent <- decode.field("parent", com_atproto_repo_strong_ref_decoder())
  decode.success(AppBskyFeedPostReplyRef(root: root, parent: parent))
}

pub fn app_bsky_feed_post_reply_ref_encode(data: AppBskyFeedPostReplyRef) {
  utils.object(
    [
      #("root", com_atproto_repo_strong_ref_encode(data.root)),
      #("parent", com_atproto_repo_strong_ref_encode(data.parent))
    ],
  )
}

pub fn tools_ozone_moderation_defs_mod_event_comment_decoder() {
  use sticky <- decode.optional_field(
    "sticky",
    None,
    decode.optional(decode.bool),
  )
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneModerationDefsModEventComment(sticky: sticky, comment: comment),
  )
}

pub fn tools_ozone_moderation_defs_mod_event_comment_encode(
  data: ToolsOzoneModerationDefsModEventComment,
) {
  utils.object(
    [
      #("sticky", json.nullable(data.sticky, json.bool)),
      #("comment", json.nullable(data.comment, json.string))
    ],
  )
}

pub fn com_atproto_admin_defs_repo_blob_ref_decoder() {
  use record_uri <- decode.optional_field(
    "recordUri",
    None,
    decode.optional(decode.string),
  )
  use cid <- decode.field("cid", decode.string)
  use did <- decode.field("did", decode.string)
  decode.success(
    ComAtprotoAdminDefsRepoBlobRef(record_uri: record_uri, cid: cid, did: did),
  )
}

pub fn com_atproto_admin_defs_repo_blob_ref_encode(
  data: ComAtprotoAdminDefsRepoBlobRef,
) {
  utils.object(
    [
      #("recordUri", json.nullable(data.record_uri, json.string)),
      #("cid", json.string(data.cid)),
      #("did", json.string(data.did))
    ],
  )
}

pub fn app_bsky_actor_defs_profile_view_decoder() {
  use indexed_at <- decode.optional_field(
    "indexedAt",
    None,
    decode.optional(decode.string),
  )
  use associated <- decode.optional_field(
    "associated",
    None,
    decode.optional(app_bsky_actor_defs_profile_associated_decoder()),
  )
  use handle <- decode.field("handle", decode.string)
  use display_name <- decode.optional_field(
    "displayName",
    None,
    decode.optional(decode.string),
  )
  use viewer <- decode.optional_field(
    "viewer",
    None,
    decode.optional(app_bsky_actor_defs_viewer_state_decoder()),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(app_bsky_actor_defs_status_view_decoder()),
  )
  use avatar <- decode.optional_field(
    "avatar",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "createdAt",
    None,
    decode.optional(decode.string),
  )
  use verification <- decode.optional_field(
    "verification",
    None,
    decode.optional(app_bsky_actor_defs_verification_state_decoder()),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use did <- decode.field("did", decode.string)
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(decode.list(com_atproto_label_defs_label_decoder())),
  )
  decode.success(
    AppBskyActorDefsProfileView(
      indexed_at: indexed_at,
      associated: associated,
      handle: handle,
      display_name: display_name,
      viewer: viewer,
      status: status,
      avatar: avatar,
      created_at: created_at,
      verification: verification,
      description: description,
      did: did,
      labels: labels,
    ),
  )
}

pub fn app_bsky_actor_defs_profile_view_encode(data: AppBskyActorDefsProfileView) {
  utils.object(
    [
      #("indexedAt", json.nullable(data.indexed_at, json.string)),
      #(
        "associated",
        json.nullable(
          data.associated,
          app_bsky_actor_defs_profile_associated_encode,
        ),
      ),
      #("handle", json.string(data.handle)),
      #("displayName", json.nullable(data.display_name, json.string)),
      #(
        "viewer",
        json.nullable(data.viewer, app_bsky_actor_defs_viewer_state_encode),
      ),
      #(
        "status",
        json.nullable(data.status, app_bsky_actor_defs_status_view_encode),
      ),
      #("avatar", json.nullable(data.avatar, json.string)),
      #("createdAt", json.nullable(data.created_at, json.string)),
      #(
        "verification",
        json.nullable(
          data.verification,
          app_bsky_actor_defs_verification_state_encode,
        ),
      ),
      #("description", json.nullable(data.description, json.string)),
      #("did", json.string(data.did)),
      #(
        "labels",
        json.nullable(
          data.labels,
          json.array(_, com_atproto_label_defs_label_encode),
        ),
      )
    ],
  )
}

pub fn app_bsky_feed_defs_reason_repost_decoder() {
  use indexed_at <- decode.field("indexedAt", decode.string)
  use by <- decode.field("by", app_bsky_actor_defs_profile_view_basic_decoder())
  decode.success(AppBskyFeedDefsReasonRepost(indexed_at: indexed_at, by: by))
}

pub fn app_bsky_feed_defs_reason_repost_encode(data: AppBskyFeedDefsReasonRepost) {
  utils.object(
    [
      #("indexedAt", json.string(data.indexed_at)),
      #("by", app_bsky_actor_defs_profile_view_basic_encode(data.by))
    ],
  )
}

pub fn tools_ozone_moderation_defs_mod_event_unmute_reporter_decoder() {
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneModerationDefsModEventUnmuteReporter(comment: comment),
  )
}

pub fn tools_ozone_moderation_defs_mod_event_unmute_reporter_encode(
  data: ToolsOzoneModerationDefsModEventUnmuteReporter,
) {
  utils.object([#("comment", json.nullable(data.comment, json.string))])
}

pub fn chat_bsky_actor_declaration_decoder() {
  use allow_incoming <- decode.field("allowIncoming", decode.string)
  decode.success(ChatBskyActorDeclaration(allow_incoming: allow_incoming))
}

pub fn chat_bsky_actor_declaration_encode(data: ChatBskyActorDeclaration) {
  utils.object([#("allowIncoming", json.string(data.allow_incoming))])
}

pub fn tools_ozone_moderation_defs_mod_event_escalate_decoder() {
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(ToolsOzoneModerationDefsModEventEscalate(comment: comment))
}

pub fn tools_ozone_moderation_defs_mod_event_escalate_encode(
  data: ToolsOzoneModerationDefsModEventEscalate,
) {
  utils.object([#("comment", json.nullable(data.comment, json.string))])
}

pub fn tools_ozone_moderation_defs_mod_event_unmute_decoder() {
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(ToolsOzoneModerationDefsModEventUnmute(comment: comment))
}

pub fn tools_ozone_moderation_defs_mod_event_unmute_encode(
  data: ToolsOzoneModerationDefsModEventUnmute,
) {
  utils.object([#("comment", json.nullable(data.comment, json.string))])
}

pub fn com_atproto_moderation_defs_subject_type_decoder() {
  decode.string
}

pub fn com_atproto_moderation_defs_subject_type_encode(
  data: ComAtprotoModerationDefsSubjectType,
) {
  json.string(data)
}

pub fn app_bsky_embed_record_decoder() {
  use record <- decode.field("record", com_atproto_repo_strong_ref_decoder())
  decode.success(AppBskyEmbedRecord(record: record))
}

pub fn app_bsky_embed_record_encode(data: AppBskyEmbedRecord) {
  utils.object([#("record", com_atproto_repo_strong_ref_encode(data.record))])
}

pub fn tools_ozone_hosting_get_account_history_handle_updated_decoder() {
  use handle <- decode.field("handle", decode.string)
  decode.success(ToolsOzoneHostingGetAccountHistoryHandleUpdated(handle: handle))
}

pub fn tools_ozone_hosting_get_account_history_handle_updated_encode(
  data: ToolsOzoneHostingGetAccountHistoryHandleUpdated,
) {
  utils.object([#("handle", json.string(data.handle))])
}

pub fn com_atproto_server_list_app_passwords_app_password_decoder() {
  use name <- decode.field("name", decode.string)
  use privileged <- decode.optional_field(
    "privileged",
    None,
    decode.optional(decode.bool),
  )
  use created_at <- decode.field("createdAt", decode.string)
  decode.success(
    ComAtprotoServerListAppPasswordsAppPassword(
      name: name,
      privileged: privileged,
      created_at: created_at,
    ),
  )
}

pub fn com_atproto_server_list_app_passwords_app_password_encode(
  data: ComAtprotoServerListAppPasswordsAppPassword,
) {
  utils.object(
    [
      #("name", json.string(data.name)),
      #("privileged", json.nullable(data.privileged, json.bool)),
      #("createdAt", json.string(data.created_at))
    ],
  )
}

pub fn app_bsky_graph_defs_not_found_actor_decoder() {
  use not_found <- decode.field("notFound", decode.bool)
  use actor <- decode.field("actor", decode.string)
  decode.success(
    AppBskyGraphDefsNotFoundActor(not_found: not_found, actor: actor),
  )
}

pub fn app_bsky_graph_defs_not_found_actor_encode(
  data: AppBskyGraphDefsNotFoundActor,
) {
  utils.object(
    [
      #("notFound", json.bool(data.not_found)),
      #("actor", json.string(data.actor))
    ],
  )
}

pub fn com_atproto_repo_apply_writes_update_result_decoder() {
  use validation_status <- decode.optional_field(
    "validationStatus",
    None,
    decode.optional(decode.string),
  )
  use uri <- decode.field("uri", decode.string)
  use cid <- decode.field("cid", decode.string)
  decode.success(
    ComAtprotoRepoApplyWritesUpdateResult(
      validation_status: validation_status,
      uri: uri,
      cid: cid,
    ),
  )
}

pub fn com_atproto_repo_apply_writes_update_result_encode(
  data: ComAtprotoRepoApplyWritesUpdateResult,
) {
  utils.object(
    [
      #("validationStatus", json.nullable(data.validation_status, json.string)),
      #("uri", json.string(data.uri)),
      #("cid", json.string(data.cid))
    ],
  )
}

pub fn com_atproto_label_defs_self_label_decoder() {
  use val <- decode.field("val", decode.string)
  decode.success(ComAtprotoLabelDefsSelfLabel(val: val))
}

pub fn com_atproto_label_defs_self_label_encode(
  data: ComAtprotoLabelDefsSelfLabel,
) {
  utils.object([#("val", json.string(data.val))])
}

pub fn com_atproto_sync_subscribe_repos_identity_decoder() {
  use handle <- decode.optional_field(
    "handle",
    None,
    decode.optional(decode.string),
  )
  use time <- decode.field("time", decode.string)
  use seq <- decode.field("seq", decode.int)
  use did <- decode.field("did", decode.string)
  decode.success(
    ComAtprotoSyncSubscribeReposIdentity(
      handle: handle,
      time: time,
      seq: seq,
      did: did,
    ),
  )
}

pub fn com_atproto_sync_subscribe_repos_identity_encode(
  data: ComAtprotoSyncSubscribeReposIdentity,
) {
  utils.object(
    [
      #("handle", json.nullable(data.handle, json.string)),
      #("time", json.string(data.time)),
      #("seq", json.int(data.seq)),
      #("did", json.string(data.did))
    ],
  )
}

pub fn chat_bsky_convo_defs_deleted_message_view_decoder() {
  use rev <- decode.field("rev", decode.string)
  use sent_at <- decode.field("sentAt", decode.string)
  use sender <- decode.field(
    "sender",
    chat_bsky_convo_defs_message_view_sender_decoder(),
  )
  use id <- decode.field("id", decode.string)
  decode.success(
    ChatBskyConvoDefsDeletedMessageView(
      rev: rev,
      sent_at: sent_at,
      sender: sender,
      id: id,
    ),
  )
}

pub fn chat_bsky_convo_defs_deleted_message_view_encode(
  data: ChatBskyConvoDefsDeletedMessageView,
) {
  utils.object(
    [
      #("rev", json.string(data.rev)),
      #("sentAt", json.string(data.sent_at)),
      #("sender", chat_bsky_convo_defs_message_view_sender_encode(data.sender)),
      #("id", json.string(data.id))
    ],
  )
}

pub fn app_bsky_feed_describe_feed_generator_links_decoder() {
  use terms_of_service <- decode.optional_field(
    "termsOfService",
    None,
    decode.optional(decode.string),
  )
  use privacy_policy <- decode.optional_field(
    "privacyPolicy",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    AppBskyFeedDescribeFeedGeneratorLinks(
      terms_of_service: terms_of_service,
      privacy_policy: privacy_policy,
    ),
  )
}

pub fn app_bsky_feed_describe_feed_generator_links_encode(
  data: AppBskyFeedDescribeFeedGeneratorLinks,
) {
  utils.object(
    [
      #("termsOfService", json.nullable(data.terms_of_service, json.string)),
      #("privacyPolicy", json.nullable(data.privacy_policy, json.string))
    ],
  )
}

pub fn app_bsky_actor_defs_interests_pref_decoder() {
  use tags <- decode.field("tags", decode.list(decode.string))
  decode.success(AppBskyActorDefsInterestsPref(tags: tags))
}

pub fn app_bsky_actor_defs_interests_pref_encode(
  data: AppBskyActorDefsInterestsPref,
) {
  utils.object([#("tags", json.array(_, json.string)(data.tags))])
}

pub fn app_bsky_actor_defs_hidden_posts_pref_decoder() {
  use items <- decode.field("items", decode.list(decode.string))
  decode.success(AppBskyActorDefsHiddenPostsPref(items: items))
}

pub fn app_bsky_actor_defs_hidden_posts_pref_encode(
  data: AppBskyActorDefsHiddenPostsPref,
) {
  utils.object([#("items", json.array(_, json.string)(data.items))])
}

pub fn app_bsky_actor_defs_adult_content_pref_decoder() {
  use enabled <- decode.field("enabled", decode.bool)
  decode.success(AppBskyActorDefsAdultContentPref(enabled: enabled))
}

pub fn app_bsky_actor_defs_adult_content_pref_encode(
  data: AppBskyActorDefsAdultContentPref,
) {
  utils.object([#("enabled", json.bool(data.enabled))])
}

pub fn app_bsky_labeler_service_decoder() {
  use subject_collections <- decode.optional_field(
    "subjectCollections",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use subject_types <- decode.optional_field(
    "subjectTypes",
    None,
    decode.optional(
      decode.list(com_atproto_moderation_defs_subject_type_decoder()),
    ),
  )
  use policies <- decode.field(
    "policies",
    app_bsky_labeler_defs_labeler_policies_decoder(),
  )
  use reason_types <- decode.optional_field(
    "reasonTypes",
    None,
    decode.optional(
      decode.list(com_atproto_moderation_defs_reason_type_decoder()),
    ),
  )
  use created_at <- decode.field("createdAt", decode.string)
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(com_atproto_label_defs_self_labels_decoder()),
  )
  decode.success(
    AppBskyLabelerService(
      subject_collections: subject_collections,
      subject_types: subject_types,
      policies: policies,
      reason_types: reason_types,
      created_at: created_at,
      labels: labels,
    ),
  )
}

pub fn app_bsky_labeler_service_encode(data: AppBskyLabelerService) {
  utils.object(
    [
      #(
        "subjectCollections",
        json.nullable(data.subject_collections, json.array(_, json.string)),
      ),
      #(
        "subjectTypes",
        json.nullable(
          data.subject_types,
          json.array(_, com_atproto_moderation_defs_subject_type_encode),
        ),
      ),
      #("policies", app_bsky_labeler_defs_labeler_policies_encode(data.policies)),
      #(
        "reasonTypes",
        json.nullable(
          data.reason_types,
          json.array(_, com_atproto_moderation_defs_reason_type_encode),
        ),
      ),
      #("createdAt", json.string(data.created_at)),
      #(
        "labels",
        json.nullable(data.labels, com_atproto_label_defs_self_labels_encode),
      )
    ],
  )
}

pub fn com_atproto_repo_strong_ref_decoder() {
  use uri <- decode.field("uri", decode.string)
  use cid <- decode.field("cid", decode.string)
  decode.success(ComAtprotoRepoStrongRef(uri: uri, cid: cid))
}

pub fn com_atproto_repo_strong_ref_encode(data: ComAtprotoRepoStrongRef) {
  utils.object(
    [#("uri", json.string(data.uri)), #("cid", json.string(data.cid))],
  )
}

pub fn app_bsky_feed_defs_generator_view_decoder() {
  use indexed_at <- decode.field("indexedAt", decode.string)
  use creator <- decode.field(
    "creator",
    app_bsky_actor_defs_profile_view_decoder(),
  )
  use accepts_interactions <- decode.optional_field(
    "acceptsInteractions",
    None,
    decode.optional(decode.bool),
  )
  use uri <- decode.field("uri", decode.string)
  use display_name <- decode.field("displayName", decode.string)
  use viewer <- decode.optional_field(
    "viewer",
    None,
    decode.optional(app_bsky_feed_defs_generator_viewer_state_decoder()),
  )
  use description_facets <- decode.optional_field(
    "descriptionFacets",
    None,
    decode.optional(decode.list(app_bsky_richtext_facet_decoder())),
  )
  use like_count <- decode.optional_field(
    "likeCount",
    None,
    decode.optional(decode.int),
  )
  use avatar <- decode.optional_field(
    "avatar",
    None,
    decode.optional(decode.string),
  )
  use content_mode <- decode.optional_field(
    "contentMode",
    None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use cid <- decode.field("cid", decode.string)
  use did <- decode.field("did", decode.string)
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(decode.list(com_atproto_label_defs_label_decoder())),
  )
  decode.success(
    AppBskyFeedDefsGeneratorView(
      indexed_at: indexed_at,
      creator: creator,
      accepts_interactions: accepts_interactions,
      uri: uri,
      display_name: display_name,
      viewer: viewer,
      description_facets: description_facets,
      like_count: like_count,
      avatar: avatar,
      content_mode: content_mode,
      description: description,
      cid: cid,
      did: did,
      labels: labels,
    ),
  )
}

pub fn app_bsky_feed_defs_generator_view_encode(
  data: AppBskyFeedDefsGeneratorView,
) {
  utils.object(
    [
      #("indexedAt", json.string(data.indexed_at)),
      #("creator", app_bsky_actor_defs_profile_view_encode(data.creator)),
      #(
        "acceptsInteractions",
        json.nullable(data.accepts_interactions, json.bool),
      ),
      #("uri", json.string(data.uri)),
      #("displayName", json.string(data.display_name)),
      #(
        "viewer",
        json.nullable(
          data.viewer,
          app_bsky_feed_defs_generator_viewer_state_encode,
        ),
      ),
      #(
        "descriptionFacets",
        json.nullable(
          data.description_facets,
          json.array(_, app_bsky_richtext_facet_encode),
        ),
      ),
      #("likeCount", json.nullable(data.like_count, json.int)),
      #("avatar", json.nullable(data.avatar, json.string)),
      #("contentMode", json.nullable(data.content_mode, json.string)),
      #("description", json.nullable(data.description, json.string)),
      #("cid", json.string(data.cid)),
      #("did", json.string(data.did)),
      #(
        "labels",
        json.nullable(
          data.labels,
          json.array(_, com_atproto_label_defs_label_encode),
        ),
      )
    ],
  )
}

pub fn app_bsky_graph_starterpack_decoder() {
  use name <- decode.field("name", decode.string)
  use feeds <- decode.optional_field(
    "feeds",
    None,
    decode.optional(decode.list(app_bsky_graph_starterpack_feed_item_decoder())),
  )
  use description_facets <- decode.optional_field(
    "descriptionFacets",
    None,
    decode.optional(decode.list(app_bsky_richtext_facet_decoder())),
  )
  use created_at <- decode.field("createdAt", decode.string)
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use list <- decode.field("list", decode.string)
  decode.success(
    AppBskyGraphStarterpack(
      name: name,
      feeds: feeds,
      description_facets: description_facets,
      created_at: created_at,
      description: description,
      list: list,
    ),
  )
}

pub fn app_bsky_graph_starterpack_encode(data: AppBskyGraphStarterpack) {
  utils.object(
    [
      #("name", json.string(data.name)),
      #(
        "feeds",
        json.nullable(
          data.feeds,
          json.array(_, app_bsky_graph_starterpack_feed_item_encode),
        ),
      ),
      #(
        "descriptionFacets",
        json.nullable(
          data.description_facets,
          json.array(_, app_bsky_richtext_facet_encode),
        ),
      ),
      #("createdAt", json.string(data.created_at)),
      #("description", json.nullable(data.description, json.string)),
      #("list", json.string(data.list))
    ],
  )
}

pub fn com_atproto_repo_defs_commit_meta_decoder() {
  use rev <- decode.field("rev", decode.string)
  use cid <- decode.field("cid", decode.string)
  decode.success(ComAtprotoRepoDefsCommitMeta(rev: rev, cid: cid))
}

pub fn com_atproto_repo_defs_commit_meta_encode(
  data: ComAtprotoRepoDefsCommitMeta,
) {
  utils.object(
    [#("rev", json.string(data.rev)), #("cid", json.string(data.cid))],
  )
}

pub fn tools_ozone_hosting_get_account_history_account_created_decoder() {
  use handle <- decode.optional_field(
    "handle",
    None,
    decode.optional(decode.string),
  )
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneHostingGetAccountHistoryAccountCreated(
      handle: handle,
      email: email,
    ),
  )
}

pub fn tools_ozone_hosting_get_account_history_account_created_encode(
  data: ToolsOzoneHostingGetAccountHistoryAccountCreated,
) {
  utils.object(
    [
      #("handle", json.nullable(data.handle, json.string)),
      #("email", json.nullable(data.email, json.string))
    ],
  )
}

pub fn com_atproto_moderation_defs_reason_rude_decoder() {
  decode.string
}

pub fn com_atproto_moderation_defs_reason_rude_encode(
  data: ComAtprotoModerationDefsReasonRude,
) {
  json.string(data)
}

pub fn tools_ozone_moderation_defs_mod_event_email_decoder() {
  use subject_line <- decode.field("subjectLine", decode.string)
  use content <- decode.optional_field(
    "content",
    None,
    decode.optional(decode.string),
  )
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneModerationDefsModEventEmail(
      subject_line: subject_line,
      content: content,
      comment: comment,
    ),
  )
}

pub fn tools_ozone_moderation_defs_mod_event_email_encode(
  data: ToolsOzoneModerationDefsModEventEmail,
) {
  utils.object(
    [
      #("subjectLine", json.string(data.subject_line)),
      #("content", json.nullable(data.content, json.string)),
      #("comment", json.nullable(data.comment, json.string))
    ],
  )
}

pub fn tools_ozone_moderation_defs_mod_event_acknowledge_decoder() {
  use acknowledge_account_subjects <- decode.optional_field(
    "acknowledgeAccountSubjects",
    None,
    decode.optional(decode.bool),
  )
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneModerationDefsModEventAcknowledge(
      acknowledge_account_subjects: acknowledge_account_subjects,
      comment: comment,
    ),
  )
}

pub fn tools_ozone_moderation_defs_mod_event_acknowledge_encode(
  data: ToolsOzoneModerationDefsModEventAcknowledge,
) {
  utils.object(
    [
      #(
        "acknowledgeAccountSubjects",
        json.nullable(data.acknowledge_account_subjects, json.bool),
      ),
      #("comment", json.nullable(data.comment, json.string))
    ],
  )
}

pub fn chat_bsky_convo_send_message_batch_batch_item_decoder() {
  use message <- decode.field(
    "message",
    chat_bsky_convo_defs_message_input_decoder(),
  )
  use convo_id <- decode.field("convoId", decode.string)
  decode.success(
    ChatBskyConvoSendMessageBatchBatchItem(message: message, convo_id: convo_id),
  )
}

pub fn chat_bsky_convo_send_message_batch_batch_item_encode(
  data: ChatBskyConvoSendMessageBatchBatchItem,
) {
  utils.object(
    [
      #("message", chat_bsky_convo_defs_message_input_encode(data.message)),
      #("convoId", json.string(data.convo_id))
    ],
  )
}

pub fn com_atproto_admin_defs_repo_ref_decoder() {
  use did <- decode.field("did", decode.string)
  decode.success(ComAtprotoAdminDefsRepoRef(did: did))
}

pub fn com_atproto_admin_defs_repo_ref_encode(data: ComAtprotoAdminDefsRepoRef) {
  utils.object([#("did", json.string(data.did))])
}

pub fn app_bsky_actor_defs_muted_words_pref_decoder() {
  use items <- decode.field(
    "items",
    decode.list(app_bsky_actor_defs_muted_word_decoder()),
  )
  decode.success(AppBskyActorDefsMutedWordsPref(items: items))
}

pub fn app_bsky_actor_defs_muted_words_pref_encode(
  data: AppBskyActorDefsMutedWordsPref,
) {
  utils.object(
    [
      #(
        "items",
        json.array(_, app_bsky_actor_defs_muted_word_encode)(data.items),
      )
    ],
  )
}

pub fn tools_ozone_moderation_defs_repo_view_detail_decoder() {
  use deactivated_at <- decode.optional_field(
    "deactivatedAt",
    None,
    decode.optional(decode.string),
  )
  use indexed_at <- decode.field("indexedAt", decode.string)
  use moderation <- decode.field(
    "moderation",
    tools_ozone_moderation_defs_moderation_detail_decoder(),
  )
  use invites_disabled <- decode.optional_field(
    "invitesDisabled",
    None,
    decode.optional(decode.bool),
  )
  use handle <- decode.field("handle", decode.string)
  use invites <- decode.optional_field(
    "invites",
    None,
    decode.optional(decode.list(com_atproto_server_defs_invite_code_decoder())),
  )
  use invited_by <- decode.optional_field(
    "invitedBy",
    None,
    decode.optional(com_atproto_server_defs_invite_code_decoder()),
  )
  use threat_signatures <- decode.optional_field(
    "threatSignatures",
    None,
    decode.optional(
      decode.list(com_atproto_admin_defs_threat_signature_decoder()),
    ),
  )
  use email_confirmed_at <- decode.optional_field(
    "emailConfirmedAt",
    None,
    decode.optional(decode.string),
  )
  use related_records <- decode.field(
    "relatedRecords",
    decode.list(utils.dynamic_to_json()),
  )
  use invite_note <- decode.optional_field(
    "inviteNote",
    None,
    decode.optional(decode.string),
  )
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.string),
  )
  use did <- decode.field("did", decode.string)
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(decode.list(com_atproto_label_defs_label_decoder())),
  )
  decode.success(
    ToolsOzoneModerationDefsRepoViewDetail(
      deactivated_at: deactivated_at,
      indexed_at: indexed_at,
      moderation: moderation,
      invites_disabled: invites_disabled,
      handle: handle,
      invites: invites,
      invited_by: invited_by,
      threat_signatures: threat_signatures,
      email_confirmed_at: email_confirmed_at,
      related_records: related_records,
      invite_note: invite_note,
      email: email,
      did: did,
      labels: labels,
    ),
  )
}

pub fn tools_ozone_moderation_defs_repo_view_detail_encode(
  data: ToolsOzoneModerationDefsRepoViewDetail,
) {
  utils.object(
    [
      #("deactivatedAt", json.nullable(data.deactivated_at, json.string)),
      #("indexedAt", json.string(data.indexed_at)),
      #(
        "moderation",
        tools_ozone_moderation_defs_moderation_detail_encode(data.moderation),
      ),
      #("invitesDisabled", json.nullable(data.invites_disabled, json.bool)),
      #("handle", json.string(data.handle)),
      #(
        "invites",
        json.nullable(
          data.invites,
          json.array(_, com_atproto_server_defs_invite_code_encode),
        ),
      ),
      #(
        "invitedBy",
        json.nullable(
          data.invited_by,
          com_atproto_server_defs_invite_code_encode,
        ),
      ),
      #(
        "threatSignatures",
        json.nullable(
          data.threat_signatures,
          json.array(_, com_atproto_admin_defs_threat_signature_encode),
        ),
      ),
      #("emailConfirmedAt", json.nullable(data.email_confirmed_at, json.string)),
      #("relatedRecords", json.array(_, fn(data) { data })(data.related_records)),
      #("inviteNote", json.nullable(data.invite_note, json.string)),
      #("email", json.nullable(data.email, json.string)),
      #("did", json.string(data.did)),
      #(
        "labels",
        json.nullable(
          data.labels,
          json.array(_, com_atproto_label_defs_label_encode),
        ),
      )
    ],
  )
}

pub fn tools_ozone_moderation_defs_image_details_decoder() {
  use width <- decode.field("width", decode.int)
  use height <- decode.field("height", decode.int)
  decode.success(
    ToolsOzoneModerationDefsImageDetails(width: width, height: height),
  )
}

pub fn tools_ozone_moderation_defs_image_details_encode(
  data: ToolsOzoneModerationDefsImageDetails,
) {
  utils.object(
    [#("width", json.int(data.width)), #("height", json.int(data.height))],
  )
}

pub fn app_bsky_feed_like_decoder() {
  use subject <- decode.field("subject", com_atproto_repo_strong_ref_decoder())
  use created_at <- decode.field("createdAt", decode.string)
  decode.success(AppBskyFeedLike(subject: subject, created_at: created_at))
}

pub fn app_bsky_feed_like_encode(data: AppBskyFeedLike) {
  utils.object(
    [
      #("subject", com_atproto_repo_strong_ref_encode(data.subject)),
      #("createdAt", json.string(data.created_at))
    ],
  )
}

pub fn app_bsky_feed_generator_decoder() {
  use accepts_interactions <- decode.optional_field(
    "acceptsInteractions",
    None,
    decode.optional(decode.bool),
  )
  use display_name <- decode.field("displayName", decode.string)
  use description_facets <- decode.optional_field(
    "descriptionFacets",
    None,
    decode.optional(decode.list(app_bsky_richtext_facet_decoder())),
  )
  use avatar <- decode.optional_field(
    "avatar",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.field("createdAt", decode.string)
  use content_mode <- decode.optional_field(
    "contentMode",
    None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use did <- decode.field("did", decode.string)
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(com_atproto_label_defs_self_labels_decoder()),
  )
  decode.success(
    AppBskyFeedGenerator(
      accepts_interactions: accepts_interactions,
      display_name: display_name,
      description_facets: description_facets,
      avatar: avatar,
      created_at: created_at,
      content_mode: content_mode,
      description: description,
      did: did,
      labels: labels,
    ),
  )
}

pub fn app_bsky_feed_generator_encode(data: AppBskyFeedGenerator) {
  utils.object(
    [
      #(
        "acceptsInteractions",
        json.nullable(data.accepts_interactions, json.bool),
      ),
      #("displayName", json.string(data.display_name)),
      #(
        "descriptionFacets",
        json.nullable(
          data.description_facets,
          json.array(_, app_bsky_richtext_facet_encode),
        ),
      ),
      #("avatar", json.nullable(data.avatar, json.string)),
      #("createdAt", json.string(data.created_at)),
      #("contentMode", json.nullable(data.content_mode, json.string)),
      #("description", json.nullable(data.description, json.string)),
      #("did", json.string(data.did)),
      #(
        "labels",
        json.nullable(data.labels, com_atproto_label_defs_self_labels_encode),
      )
    ],
  )
}

pub fn tools_ozone_moderation_defs_subject_status_view_decoder() {
  use last_reviewed_at <- decode.optional_field(
    "lastReviewedAt",
    None,
    decode.optional(decode.string),
  )
  use suspend_until <- decode.optional_field(
    "suspendUntil",
    None,
    decode.optional(decode.string),
  )
  use last_reviewed_by <- decode.optional_field(
    "lastReviewedBy",
    None,
    decode.optional(decode.string),
  )
  use mute_until <- decode.optional_field(
    "muteUntil",
    None,
    decode.optional(decode.string),
  )
  use subject_repo_handle <- decode.optional_field(
    "subjectRepoHandle",
    None,
    decode.optional(decode.string),
  )
  use mute_reporting_until <- decode.optional_field(
    "muteReportingUntil",
    None,
    decode.optional(decode.string),
  )
  use takendown <- decode.optional_field(
    "takendown",
    None,
    decode.optional(decode.bool),
  )
  use subject <- decode.field("subject", utils.dynamic_to_json())
  use updated_at <- decode.field("updatedAt", decode.string)
  use appealed <- decode.optional_field(
    "appealed",
    None,
    decode.optional(decode.bool),
  )
  use priority_score <- decode.optional_field(
    "priorityScore",
    None,
    decode.optional(decode.int),
  )
  use account_stats <- decode.optional_field(
    "accountStats",
    None,
    decode.optional(tools_ozone_moderation_defs_account_stats_decoder()),
  )
  use last_appealed_at <- decode.optional_field(
    "lastAppealedAt",
    None,
    decode.optional(decode.string),
  )
  use review_state <- decode.field(
    "reviewState",
    tools_ozone_moderation_defs_subject_review_state_decoder(),
  )
  use tags <- decode.optional_field(
    "tags",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use hosting <- decode.optional_field(
    "hosting",
    None,
    decode.optional(utils.dynamic_to_json()),
  )
  use id <- decode.field("id", decode.int)
  use created_at <- decode.field("createdAt", decode.string)
  use last_reported_at <- decode.optional_field(
    "lastReportedAt",
    None,
    decode.optional(decode.string),
  )
  use records_stats <- decode.optional_field(
    "recordsStats",
    None,
    decode.optional(tools_ozone_moderation_defs_records_stats_decoder()),
  )
  use subject_blob_cids <- decode.optional_field(
    "subjectBlobCids",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneModerationDefsSubjectStatusView(
      last_reviewed_at: last_reviewed_at,
      suspend_until: suspend_until,
      last_reviewed_by: last_reviewed_by,
      mute_until: mute_until,
      subject_repo_handle: subject_repo_handle,
      mute_reporting_until: mute_reporting_until,
      takendown: takendown,
      subject: subject,
      updated_at: updated_at,
      appealed: appealed,
      priority_score: priority_score,
      account_stats: account_stats,
      last_appealed_at: last_appealed_at,
      review_state: review_state,
      tags: tags,
      hosting: hosting,
      id: id,
      created_at: created_at,
      last_reported_at: last_reported_at,
      records_stats: records_stats,
      subject_blob_cids: subject_blob_cids,
      comment: comment,
    ),
  )
}

pub fn tools_ozone_moderation_defs_subject_status_view_encode(
  data: ToolsOzoneModerationDefsSubjectStatusView,
) {
  utils.object(
    [
      #("lastReviewedAt", json.nullable(data.last_reviewed_at, json.string)),
      #("suspendUntil", json.nullable(data.suspend_until, json.string)),
      #("lastReviewedBy", json.nullable(data.last_reviewed_by, json.string)),
      #("muteUntil", json.nullable(data.mute_until, json.string)),
      #(
        "subjectRepoHandle",
        json.nullable(data.subject_repo_handle, json.string),
      ),
      #(
        "muteReportingUntil",
        json.nullable(data.mute_reporting_until, json.string),
      ),
      #("takendown", json.nullable(data.takendown, json.bool)),
      #("subject", fn(data) { data }(data.subject)),
      #("updatedAt", json.string(data.updated_at)),
      #("appealed", json.nullable(data.appealed, json.bool)),
      #("priorityScore", json.nullable(data.priority_score, json.int)),
      #(
        "accountStats",
        json.nullable(
          data.account_stats,
          tools_ozone_moderation_defs_account_stats_encode,
        ),
      ),
      #("lastAppealedAt", json.nullable(data.last_appealed_at, json.string)),
      #(
        "reviewState",
        tools_ozone_moderation_defs_subject_review_state_encode(
          data.review_state,
        ),
      ),
      #("tags", json.nullable(data.tags, json.array(_, json.string))),
      #("hosting", json.nullable(data.hosting, fn(data) { data })),
      #("id", json.int(data.id)),
      #("createdAt", json.string(data.created_at)),
      #("lastReportedAt", json.nullable(data.last_reported_at, json.string)),
      #(
        "recordsStats",
        json.nullable(
          data.records_stats,
          tools_ozone_moderation_defs_records_stats_encode,
        ),
      ),
      #(
        "subjectBlobCids",
        json.nullable(data.subject_blob_cids, json.array(_, json.string)),
      ),
      #("comment", json.nullable(data.comment, json.string))
    ],
  )
}

pub fn app_bsky_actor_defs_verification_view_decoder() {
  use uri <- decode.field("uri", decode.string)
  use is_valid <- decode.field("isValid", decode.bool)
  use issuer <- decode.field("issuer", decode.string)
  use created_at <- decode.field("createdAt", decode.string)
  decode.success(
    AppBskyActorDefsVerificationView(
      uri: uri,
      is_valid: is_valid,
      issuer: issuer,
      created_at: created_at,
    ),
  )
}

pub fn app_bsky_actor_defs_verification_view_encode(
  data: AppBskyActorDefsVerificationView,
) {
  utils.object(
    [
      #("uri", json.string(data.uri)),
      #("isValid", json.bool(data.is_valid)),
      #("issuer", json.string(data.issuer)),
      #("createdAt", json.string(data.created_at))
    ],
  )
}

pub fn com_atproto_sync_subscribe_repos_sync_decoder() {
  use rev <- decode.field("rev", decode.string)
  use blocks <- decode.field("blocks", decode.string)
  use time <- decode.field("time", decode.string)
  use seq <- decode.field("seq", decode.int)
  use did <- decode.field("did", decode.string)
  decode.success(
    ComAtprotoSyncSubscribeReposSync(
      rev: rev,
      blocks: blocks,
      time: time,
      seq: seq,
      did: did,
    ),
  )
}

pub fn com_atproto_sync_subscribe_repos_sync_encode(
  data: ComAtprotoSyncSubscribeReposSync,
) {
  utils.object(
    [
      #("rev", json.string(data.rev)),
      #("blocks", json.string(data.blocks)),
      #("time", json.string(data.time)),
      #("seq", json.int(data.seq)),
      #("did", json.string(data.did))
    ],
  )
}

pub fn tools_ozone_moderation_defs_record_view_detail_decoder() {
  use indexed_at <- decode.field("indexedAt", decode.string)
  use moderation <- decode.field(
    "moderation",
    tools_ozone_moderation_defs_moderation_detail_decoder(),
  )
  use uri <- decode.field("uri", decode.string)
  use value <- decode.field("value", utils.dynamic_to_json())
  use repo <- decode.field(
    "repo",
    tools_ozone_moderation_defs_repo_view_decoder(),
  )
  use blobs <- decode.field(
    "blobs",
    decode.list(tools_ozone_moderation_defs_blob_view_decoder()),
  )
  use cid <- decode.field("cid", decode.string)
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(decode.list(com_atproto_label_defs_label_decoder())),
  )
  decode.success(
    ToolsOzoneModerationDefsRecordViewDetail(
      indexed_at: indexed_at,
      moderation: moderation,
      uri: uri,
      value: value,
      repo: repo,
      blobs: blobs,
      cid: cid,
      labels: labels,
    ),
  )
}

pub fn tools_ozone_moderation_defs_record_view_detail_encode(
  data: ToolsOzoneModerationDefsRecordViewDetail,
) {
  utils.object(
    [
      #("indexedAt", json.string(data.indexed_at)),
      #(
        "moderation",
        tools_ozone_moderation_defs_moderation_detail_encode(data.moderation),
      ),
      #("uri", json.string(data.uri)),
      #("value", fn(data) { data }(data.value)),
      #("repo", tools_ozone_moderation_defs_repo_view_encode(data.repo)),
      #(
        "blobs",
        json.array(_, tools_ozone_moderation_defs_blob_view_encode)(data.blobs),
      ),
      #("cid", json.string(data.cid)),
      #(
        "labels",
        json.nullable(
          data.labels,
          json.array(_, com_atproto_label_defs_label_encode),
        ),
      )
    ],
  )
}

pub fn tools_ozone_moderation_defs_mod_event_resolve_appeal_decoder() {
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(ToolsOzoneModerationDefsModEventResolveAppeal(comment: comment))
}

pub fn tools_ozone_moderation_defs_mod_event_resolve_appeal_encode(
  data: ToolsOzoneModerationDefsModEventResolveAppeal,
) {
  utils.object([#("comment", json.nullable(data.comment, json.string))])
}

pub fn app_bsky_feed_threadgate_list_rule_decoder() {
  use list <- decode.field("list", decode.string)
  decode.success(AppBskyFeedThreadgateListRule(list: list))
}

pub fn app_bsky_feed_threadgate_list_rule_encode(
  data: AppBskyFeedThreadgateListRule,
) {
  utils.object([#("list", json.string(data.list))])
}

pub fn app_bsky_labeler_defs_labeler_view_detailed_decoder() {
  use indexed_at <- decode.field("indexedAt", decode.string)
  use subject_collections <- decode.optional_field(
    "subjectCollections",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use creator <- decode.field(
    "creator",
    app_bsky_actor_defs_profile_view_decoder(),
  )
  use uri <- decode.field("uri", decode.string)
  use subject_types <- decode.optional_field(
    "subjectTypes",
    None,
    decode.optional(
      decode.list(com_atproto_moderation_defs_subject_type_decoder()),
    ),
  )
  use policies <- decode.field(
    "policies",
    app_bsky_labeler_defs_labeler_policies_decoder(),
  )
  use viewer <- decode.optional_field(
    "viewer",
    None,
    decode.optional(app_bsky_labeler_defs_labeler_viewer_state_decoder()),
  )
  use reason_types <- decode.optional_field(
    "reasonTypes",
    None,
    decode.optional(
      decode.list(com_atproto_moderation_defs_reason_type_decoder()),
    ),
  )
  use like_count <- decode.optional_field(
    "likeCount",
    None,
    decode.optional(decode.int),
  )
  use cid <- decode.field("cid", decode.string)
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(decode.list(com_atproto_label_defs_label_decoder())),
  )
  decode.success(
    AppBskyLabelerDefsLabelerViewDetailed(
      indexed_at: indexed_at,
      subject_collections: subject_collections,
      creator: creator,
      uri: uri,
      subject_types: subject_types,
      policies: policies,
      viewer: viewer,
      reason_types: reason_types,
      like_count: like_count,
      cid: cid,
      labels: labels,
    ),
  )
}

pub fn app_bsky_labeler_defs_labeler_view_detailed_encode(
  data: AppBskyLabelerDefsLabelerViewDetailed,
) {
  utils.object(
    [
      #("indexedAt", json.string(data.indexed_at)),
      #(
        "subjectCollections",
        json.nullable(data.subject_collections, json.array(_, json.string)),
      ),
      #("creator", app_bsky_actor_defs_profile_view_encode(data.creator)),
      #("uri", json.string(data.uri)),
      #(
        "subjectTypes",
        json.nullable(
          data.subject_types,
          json.array(_, com_atproto_moderation_defs_subject_type_encode),
        ),
      ),
      #("policies", app_bsky_labeler_defs_labeler_policies_encode(data.policies)),
      #(
        "viewer",
        json.nullable(
          data.viewer,
          app_bsky_labeler_defs_labeler_viewer_state_encode,
        ),
      ),
      #(
        "reasonTypes",
        json.nullable(
          data.reason_types,
          json.array(_, com_atproto_moderation_defs_reason_type_encode),
        ),
      ),
      #("likeCount", json.nullable(data.like_count, json.int)),
      #("cid", json.string(data.cid)),
      #(
        "labels",
        json.nullable(
          data.labels,
          json.array(_, com_atproto_label_defs_label_encode),
        ),
      )
    ],
  )
}

pub fn com_atproto_server_describe_server_contact_decoder() {
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.string),
  )
  decode.success(ComAtprotoServerDescribeServerContact(email: email))
}

pub fn com_atproto_server_describe_server_contact_encode(
  data: ComAtprotoServerDescribeServerContact,
) {
  utils.object([#("email", json.nullable(data.email, json.string))])
}

pub fn app_bsky_feed_defs_blocked_author_decoder() {
  use viewer <- decode.optional_field(
    "viewer",
    None,
    decode.optional(app_bsky_actor_defs_viewer_state_decoder()),
  )
  use did <- decode.field("did", decode.string)
  decode.success(AppBskyFeedDefsBlockedAuthor(viewer: viewer, did: did))
}

pub fn app_bsky_feed_defs_blocked_author_encode(
  data: AppBskyFeedDefsBlockedAuthor,
) {
  utils.object(
    [
      #(
        "viewer",
        json.nullable(data.viewer, app_bsky_actor_defs_viewer_state_encode),
      ),
      #("did", json.string(data.did))
    ],
  )
}

pub fn app_bsky_feed_threadgate_follower_rule_decoder() {
  decode.dict(decode.string, utils.dynamic_to_json())
}

pub fn app_bsky_feed_threadgate_follower_rule_encode(
  data: AppBskyFeedThreadgateFollowerRule,
) {
  utils.dict(data, fn(data) { data })
}

pub fn app_bsky_actor_defs_profile_view_basic_decoder() {
  use associated <- decode.optional_field(
    "associated",
    None,
    decode.optional(app_bsky_actor_defs_profile_associated_decoder()),
  )
  use handle <- decode.field("handle", decode.string)
  use display_name <- decode.optional_field(
    "displayName",
    None,
    decode.optional(decode.string),
  )
  use viewer <- decode.optional_field(
    "viewer",
    None,
    decode.optional(app_bsky_actor_defs_viewer_state_decoder()),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(app_bsky_actor_defs_status_view_decoder()),
  )
  use avatar <- decode.optional_field(
    "avatar",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "createdAt",
    None,
    decode.optional(decode.string),
  )
  use verification <- decode.optional_field(
    "verification",
    None,
    decode.optional(app_bsky_actor_defs_verification_state_decoder()),
  )
  use did <- decode.field("did", decode.string)
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(decode.list(com_atproto_label_defs_label_decoder())),
  )
  decode.success(
    AppBskyActorDefsProfileViewBasic(
      associated: associated,
      handle: handle,
      display_name: display_name,
      viewer: viewer,
      status: status,
      avatar: avatar,
      created_at: created_at,
      verification: verification,
      did: did,
      labels: labels,
    ),
  )
}

pub fn app_bsky_actor_defs_profile_view_basic_encode(
  data: AppBskyActorDefsProfileViewBasic,
) {
  utils.object(
    [
      #(
        "associated",
        json.nullable(
          data.associated,
          app_bsky_actor_defs_profile_associated_encode,
        ),
      ),
      #("handle", json.string(data.handle)),
      #("displayName", json.nullable(data.display_name, json.string)),
      #(
        "viewer",
        json.nullable(data.viewer, app_bsky_actor_defs_viewer_state_encode),
      ),
      #(
        "status",
        json.nullable(data.status, app_bsky_actor_defs_status_view_encode),
      ),
      #("avatar", json.nullable(data.avatar, json.string)),
      #("createdAt", json.nullable(data.created_at, json.string)),
      #(
        "verification",
        json.nullable(
          data.verification,
          app_bsky_actor_defs_verification_state_encode,
        ),
      ),
      #("did", json.string(data.did)),
      #(
        "labels",
        json.nullable(
          data.labels,
          json.array(_, com_atproto_label_defs_label_encode),
        ),
      )
    ],
  )
}

pub fn tools_ozone_moderation_defs_video_details_decoder() {
  use width <- decode.field("width", decode.int)
  use length <- decode.field("length", decode.int)
  use height <- decode.field("height", decode.int)
  decode.success(
    ToolsOzoneModerationDefsVideoDetails(
      width: width,
      length: length,
      height: height,
    ),
  )
}

pub fn tools_ozone_moderation_defs_video_details_encode(
  data: ToolsOzoneModerationDefsVideoDetails,
) {
  utils.object(
    [
      #("width", json.int(data.width)),
      #("length", json.int(data.length)),
      #("height", json.int(data.height))
    ],
  )
}

pub fn app_bsky_embed_video_decoder() {
  use alt <- decode.optional_field("alt", None, decode.optional(decode.string))
  use captions <- decode.optional_field(
    "captions",
    None,
    decode.optional(decode.list(app_bsky_embed_video_caption_decoder())),
  )
  use aspect_ratio <- decode.optional_field(
    "aspectRatio",
    None,
    decode.optional(app_bsky_embed_defs_aspect_ratio_decoder()),
  )
  use video <- decode.field("video", decode.string)
  decode.success(
    AppBskyEmbedVideo(
      alt: alt,
      captions: captions,
      aspect_ratio: aspect_ratio,
      video: video,
    ),
  )
}

pub fn app_bsky_embed_video_encode(data: AppBskyEmbedVideo) {
  utils.object(
    [
      #("alt", json.nullable(data.alt, json.string)),
      #(
        "captions",
        json.nullable(
          data.captions,
          json.array(_, app_bsky_embed_video_caption_encode),
        ),
      ),
      #(
        "aspectRatio",
        json.nullable(data.aspect_ratio, app_bsky_embed_defs_aspect_ratio_encode),
      ),
      #("video", json.string(data.video))
    ],
  )
}

pub fn tools_ozone_moderation_defs_repo_view_not_found_decoder() {
  use did <- decode.field("did", decode.string)
  decode.success(ToolsOzoneModerationDefsRepoViewNotFound(did: did))
}

pub fn tools_ozone_moderation_defs_repo_view_not_found_encode(
  data: ToolsOzoneModerationDefsRepoViewNotFound,
) {
  utils.object([#("did", json.string(data.did))])
}

pub fn tools_ozone_team_defs_role_admin_decoder() {
  decode.string
}

pub fn tools_ozone_team_defs_role_admin_encode(data: ToolsOzoneTeamDefsRoleAdmin) {
  json.string(data)
}

pub fn app_bsky_video_defs_job_status_decoder() {
  use message <- decode.optional_field(
    "message",
    None,
    decode.optional(decode.string),
  )
  use error <- decode.optional_field(
    "error",
    None,
    decode.optional(decode.string),
  )
  use progress <- decode.optional_field(
    "progress",
    None,
    decode.optional(decode.int),
  )
  use state <- decode.field("state", decode.string)
  use job_id <- decode.field("jobId", decode.string)
  use blob <- decode.optional_field("blob", None, decode.optional(decode.string))
  use did <- decode.field("did", decode.string)
  decode.success(
    AppBskyVideoDefsJobStatus(
      message: message,
      error: error,
      progress: progress,
      state: state,
      job_id: job_id,
      blob: blob,
      did: did,
    ),
  )
}

pub fn app_bsky_video_defs_job_status_encode(data: AppBskyVideoDefsJobStatus) {
  utils.object(
    [
      #("message", json.nullable(data.message, json.string)),
      #("error", json.nullable(data.error, json.string)),
      #("progress", json.nullable(data.progress, json.int)),
      #("state", json.string(data.state)),
      #("jobId", json.string(data.job_id)),
      #("blob", json.nullable(data.blob, json.string)),
      #("did", json.string(data.did))
    ],
  )
}

pub fn com_atproto_label_subscribe_labels_labels_decoder() {
  use seq <- decode.field("seq", decode.int)
  use labels <- decode.field(
    "labels",
    decode.list(com_atproto_label_defs_label_decoder()),
  )
  decode.success(ComAtprotoLabelSubscribeLabelsLabels(seq: seq, labels: labels))
}

pub fn com_atproto_label_subscribe_labels_labels_encode(
  data: ComAtprotoLabelSubscribeLabelsLabels,
) {
  utils.object(
    [
      #("seq", json.int(data.seq)),
      #(
        "labels",
        json.array(_, com_atproto_label_defs_label_encode)(data.labels),
      )
    ],
  )
}

pub fn app_bsky_embed_images_view_decoder() {
  use images <- decode.field(
    "images",
    decode.list(app_bsky_embed_images_view_image_decoder()),
  )
  decode.success(AppBskyEmbedImagesView(images: images))
}

pub fn app_bsky_embed_images_view_encode(data: AppBskyEmbedImagesView) {
  utils.object(
    [
      #(
        "images",
        json.array(_, app_bsky_embed_images_view_image_encode)(data.images),
      )
    ],
  )
}

pub fn tools_ozone_moderation_defs_mod_event_tag_decoder() {
  use add <- decode.field("add", decode.list(decode.string))
  use remove <- decode.field("remove", decode.list(decode.string))
  use comment <- decode.optional_field(
    "comment",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ToolsOzoneModerationDefsModEventTag(
      add: add,
      remove: remove,
      comment: comment,
    ),
  )
}

pub fn tools_ozone_moderation_defs_mod_event_tag_encode(
  data: ToolsOzoneModerationDefsModEventTag,
) {
  utils.object(
    [
      #("add", json.array(_, json.string)(data.add)),
      #("remove", json.array(_, json.string)(data.remove)),
      #("comment", json.nullable(data.comment, json.string))
    ],
  )
}

pub fn tools_ozone_moderation_defs_moderation_decoder() {
  use subject_status <- decode.optional_field(
    "subjectStatus",
    None,
    decode.optional(tools_ozone_moderation_defs_subject_status_view_decoder()),
  )
  decode.success(
    ToolsOzoneModerationDefsModeration(subject_status: subject_status),
  )
}

pub fn tools_ozone_moderation_defs_moderation_encode(
  data: ToolsOzoneModerationDefsModeration,
) {
  utils.object(
    [
      #(
        "subjectStatus",
        json.nullable(
          data.subject_status,
          tools_ozone_moderation_defs_subject_status_view_encode,
        ),
      )
    ],
  )
}

pub fn app_bsky_graph_defs_list_viewer_state_decoder() {
  use muted <- decode.optional_field("muted", None, decode.optional(decode.bool))
  use blocked <- decode.optional_field(
    "blocked",
    None,
    decode.optional(decode.string),
  )
  decode.success(AppBskyGraphDefsListViewerState(muted: muted, blocked: blocked))
}

pub fn app_bsky_graph_defs_list_viewer_state_encode(
  data: AppBskyGraphDefsListViewerState,
) {
  utils.object(
    [
      #("muted", json.nullable(data.muted, json.bool)),
      #("blocked", json.nullable(data.blocked, json.string))
    ],
  )
}

pub fn com_atproto_admin_defs_threat_signature_decoder() {
  use value <- decode.field("value", decode.string)
  use property <- decode.field("property", decode.string)
  decode.success(
    ComAtprotoAdminDefsThreatSignature(value: value, property: property),
  )
}

pub fn com_atproto_admin_defs_threat_signature_encode(
  data: ComAtprotoAdminDefsThreatSignature,
) {
  utils.object(
    [
      #("value", json.string(data.value)),
      #("property", json.string(data.property))
    ],
  )
}

pub fn app_bsky_feed_threadgate_decoder() {
  use post <- decode.field("post", decode.string)
  use allow <- decode.optional_field(
    "allow",
    None,
    decode.optional(decode.list(utils.dynamic_to_json())),
  )
  use created_at <- decode.field("createdAt", decode.string)
  use hidden_replies <- decode.optional_field(
    "hiddenReplies",
    None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(
    AppBskyFeedThreadgate(
      post: post,
      allow: allow,
      created_at: created_at,
      hidden_replies: hidden_replies,
    ),
  )
}

pub fn app_bsky_feed_threadgate_encode(data: AppBskyFeedThreadgate) {
  utils.object(
    [
      #("post", json.string(data.post)),
      #("allow", json.nullable(data.allow, json.array(_, fn(data) { data }))),
      #("createdAt", json.string(data.created_at)),
      #(
        "hiddenReplies",
        json.nullable(data.hidden_replies, json.array(_, json.string)),
      )
    ],
  )
}

pub fn app_bsky_actor_defs_content_label_pref_decoder() {
  use visibility <- decode.field("visibility", decode.string)
  use label <- decode.field("label", decode.string)
  use labeler_did <- decode.optional_field(
    "labelerDid",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    AppBskyActorDefsContentLabelPref(
      visibility: visibility,
      label: label,
      labeler_did: labeler_did,
    ),
  )
}

pub fn app_bsky_actor_defs_content_label_pref_encode(
  data: AppBskyActorDefsContentLabelPref,
) {
  utils.object(
    [
      #("visibility", json.string(data.visibility)),
      #("label", json.string(data.label)),
      #("labelerDid", json.nullable(data.labeler_did, json.string))
    ],
  )
}

pub fn com_atproto_moderation_defs_reason_violation_decoder() {
  decode.string
}

pub fn com_atproto_moderation_defs_reason_violation_encode(
  data: ComAtprotoModerationDefsReasonViolation,
) {
  json.string(data)
}

pub fn tools_ozone_moderation_defs_record_view_not_found_decoder() {
  use uri <- decode.field("uri", decode.string)
  decode.success(ToolsOzoneModerationDefsRecordViewNotFound(uri: uri))
}

pub fn tools_ozone_moderation_defs_record_view_not_found_encode(
  data: ToolsOzoneModerationDefsRecordViewNotFound,
) {
  utils.object([#("uri", json.string(data.uri))])
}

pub fn chat_bsky_convo_defs_log_accept_convo_decoder() {
  use rev <- decode.field("rev", decode.string)
  use convo_id <- decode.field("convoId", decode.string)
  decode.success(ChatBskyConvoDefsLogAcceptConvo(rev: rev, convo_id: convo_id))
}

pub fn chat_bsky_convo_defs_log_accept_convo_encode(
  data: ChatBskyConvoDefsLogAcceptConvo,
) {
  utils.object(
    [#("rev", json.string(data.rev)), #("convoId", json.string(data.convo_id))],
  )
}

pub fn com_atproto_sync_subscribe_repos_account_decoder() {
  use active <- decode.field("active", decode.bool)
  use time <- decode.field("time", decode.string)
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.string),
  )
  use seq <- decode.field("seq", decode.int)
  use did <- decode.field("did", decode.string)
  decode.success(
    ComAtprotoSyncSubscribeReposAccount(
      active: active,
      time: time,
      status: status,
      seq: seq,
      did: did,
    ),
  )
}

pub fn com_atproto_sync_subscribe_repos_account_encode(
  data: ComAtprotoSyncSubscribeReposAccount,
) {
  utils.object(
    [
      #("active", json.bool(data.active)),
      #("time", json.string(data.time)),
      #("status", json.nullable(data.status, json.string)),
      #("seq", json.int(data.seq)),
      #("did", json.string(data.did))
    ],
  )
}

pub fn app_bsky_feed_defs_clickthrough_item_decoder() {
  decode.string
}

pub fn app_bsky_feed_defs_clickthrough_item_encode(
  data: AppBskyFeedDefsClickthroughItem,
) {
  json.string(data)
}

pub fn app_bsky_actor_defs_profile_associated_chat_decoder() {
  use allow_incoming <- decode.field("allowIncoming", decode.string)
  decode.success(
    AppBskyActorDefsProfileAssociatedChat(allow_incoming: allow_incoming),
  )
}

pub fn app_bsky_actor_defs_profile_associated_chat_encode(
  data: AppBskyActorDefsProfileAssociatedChat,
) {
  utils.object([#("allowIncoming", json.string(data.allow_incoming))])
}

pub fn tools_ozone_moderation_defs_review_closed_decoder() {
  decode.string
}

pub fn tools_ozone_moderation_defs_review_closed_encode(
  data: ToolsOzoneModerationDefsReviewClosed,
) {
  json.string(data)
}

pub fn app_bsky_graph_defs_modlist_decoder() {
  decode.string
}

pub fn app_bsky_graph_defs_modlist_encode(data: AppBskyGraphDefsModlist) {
  json.string(data)
}

pub fn app_bsky_feed_threadgate_following_rule_decoder() {
  decode.dict(decode.string, utils.dynamic_to_json())
}

pub fn app_bsky_feed_threadgate_following_rule_encode(
  data: AppBskyFeedThreadgateFollowingRule,
) {
  utils.dict(data, fn(data) { data })
}

pub fn com_atproto_identity_defs_identity_info_decoder() {
  use handle <- decode.field("handle", decode.string)
  use did_doc <- decode.field("didDoc", utils.dynamic_to_json())
  use did <- decode.field("did", decode.string)
  decode.success(
    ComAtprotoIdentityDefsIdentityInfo(
      handle: handle,
      did_doc: did_doc,
      did: did,
    ),
  )
}

pub fn com_atproto_identity_defs_identity_info_encode(
  data: ComAtprotoIdentityDefsIdentityInfo,
) {
  utils.object(
    [
      #("handle", json.string(data.handle)),
      #("didDoc", fn(data) { data }(data.did_doc)),
      #("did", json.string(data.did))
    ],
  )
}

pub fn app_bsky_graph_defs_list_purpose_decoder() {
  utils.dynamic_to_json()
}

pub fn app_bsky_graph_defs_list_purpose_encode(data: AppBskyGraphDefsListPurpose) {
  data
}

pub fn chat_bsky_convo_defs_reaction_view_decoder() {
  use value <- decode.field("value", decode.string)
  use sender <- decode.field(
    "sender",
    chat_bsky_convo_defs_reaction_view_sender_decoder(),
  )
  use created_at <- decode.field("createdAt", decode.string)
  decode.success(
    ChatBskyConvoDefsReactionView(
      value: value,
      sender: sender,
      created_at: created_at,
    ),
  )
}

pub fn chat_bsky_convo_defs_reaction_view_encode(
  data: ChatBskyConvoDefsReactionView,
) {
  utils.object(
    [
      #("value", json.string(data.value)),
      #("sender", chat_bsky_convo_defs_reaction_view_sender_encode(data.sender)),
      #("createdAt", json.string(data.created_at))
    ],
  )
}

pub fn chat_bsky_convo_defs_log_begin_convo_decoder() {
  use rev <- decode.field("rev", decode.string)
  use convo_id <- decode.field("convoId", decode.string)
  decode.success(ChatBskyConvoDefsLogBeginConvo(rev: rev, convo_id: convo_id))
}

pub fn chat_bsky_convo_defs_log_begin_convo_encode(
  data: ChatBskyConvoDefsLogBeginConvo,
) {
  utils.object(
    [#("rev", json.string(data.rev)), #("convoId", json.string(data.convo_id))],
  )
}

pub fn app_bsky_embed_external_decoder() {
  use external <- decode.field(
    "external",
    app_bsky_embed_external_external_decoder(),
  )
  decode.success(AppBskyEmbedExternal(external: external))
}

pub fn app_bsky_embed_external_encode(data: AppBskyEmbedExternal) {
  utils.object(
    [#("external", app_bsky_embed_external_external_encode(data.external))],
  )
}

pub fn tools_ozone_communication_defs_template_view_decoder() {
  use content_markdown <- decode.field("contentMarkdown", decode.string)
  use name <- decode.field("name", decode.string)
  use subject <- decode.optional_field(
    "subject",
    None,
    decode.optional(decode.string),
  )
  use lang <- decode.optional_field("lang", None, decode.optional(decode.string))
  use updated_at <- decode.field("updatedAt", decode.string)
  use id <- decode.field("id", decode.string)
  use created_at <- decode.field("createdAt", decode.string)
  use last_updated_by <- decode.field("lastUpdatedBy", decode.string)
  use disabled <- decode.field("disabled", decode.bool)
  decode.success(
    ToolsOzoneCommunicationDefsTemplateView(
      content_markdown: content_markdown,
      name: name,
      subject: subject,
      lang: lang,
      updated_at: updated_at,
      id: id,
      created_at: created_at,
      last_updated_by: last_updated_by,
      disabled: disabled,
    ),
  )
}

pub fn tools_ozone_communication_defs_template_view_encode(
  data: ToolsOzoneCommunicationDefsTemplateView,
) {
  utils.object(
    [
      #("contentMarkdown", json.string(data.content_markdown)),
      #("name", json.string(data.name)),
      #("subject", json.nullable(data.subject, json.string)),
      #("lang", json.nullable(data.lang, json.string)),
      #("updatedAt", json.string(data.updated_at)),
      #("id", json.string(data.id)),
      #("createdAt", json.string(data.created_at)),
      #("lastUpdatedBy", json.string(data.last_updated_by)),
      #("disabled", json.bool(data.disabled))
    ],
  )
}

pub fn chat_bsky_convo_defs_log_read_message_decoder() {
  use rev <- decode.field("rev", decode.string)
  use message <- decode.field("message", utils.dynamic_to_json())
  use convo_id <- decode.field("convoId", decode.string)
  decode.success(
    ChatBskyConvoDefsLogReadMessage(
      rev: rev,
      message: message,
      convo_id: convo_id,
    ),
  )
}

pub fn chat_bsky_convo_defs_log_read_message_encode(
  data: ChatBskyConvoDefsLogReadMessage,
) {
  utils.object(
    [
      #("rev", json.string(data.rev)),
      #("message", fn(data) { data }(data.message)),
      #("convoId", json.string(data.convo_id))
    ],
  )
}

pub fn com_atproto_sync_subscribe_repos_commit_decoder() {
  use rev <- decode.field("rev", decode.string)
  use blocks <- decode.field("blocks", decode.string)
  use time <- decode.field("time", decode.string)
  use ops <- decode.field(
    "ops",
    decode.list(com_atproto_sync_subscribe_repos_repo_op_decoder()),
  )
  use repo <- decode.field("repo", decode.string)
  use blobs <- decode.field("blobs", decode.list(decode.string))
  use commit <- decode.field("commit", decode.string)
  use since <- decode.field("since", decode.string)
  use prev_data <- decode.optional_field(
    "prevData",
    None,
    decode.optional(decode.string),
  )
  use seq <- decode.field("seq", decode.int)
  decode.success(
    ComAtprotoSyncSubscribeReposCommit(
      rev: rev,
      blocks: blocks,
      time: time,
      ops: ops,
      repo: repo,
      blobs: blobs,
      commit: commit,
      since: since,
      prev_data: prev_data,
      seq: seq,
    ),
  )
}

pub fn com_atproto_sync_subscribe_repos_commit_encode(
  data: ComAtprotoSyncSubscribeReposCommit,
) {
  utils.object(
    [
      #("rev", json.string(data.rev)),
      #("blocks", json.string(data.blocks)),
      #("time", json.string(data.time)),
      #(
        "ops",
        json.array(_, com_atproto_sync_subscribe_repos_repo_op_encode)(data.ops),
      ),
      #("repo", json.string(data.repo)),
      #("blobs", json.array(_, json.string)(data.blobs)),
      #("commit", json.string(data.commit)),
      #("since", json.string(data.since)),
      #("prevData", json.nullable(data.prev_data, json.string)),
      #("seq", json.int(data.seq))
    ],
  )
}

pub fn tools_ozone_team_defs_role_verifier_decoder() {
  decode.string
}

pub fn tools_ozone_team_defs_role_verifier_encode(
  data: ToolsOzoneTeamDefsRoleVerifier,
) {
  json.string(data)
}

pub fn app_bsky_feed_repost_decoder() {
  use subject <- decode.field("subject", com_atproto_repo_strong_ref_decoder())
  use created_at <- decode.field("createdAt", decode.string)
  decode.success(AppBskyFeedRepost(subject: subject, created_at: created_at))
}

pub fn app_bsky_feed_repost_encode(data: AppBskyFeedRepost) {
  utils.object(
    [
      #("subject", com_atproto_repo_strong_ref_encode(data.subject)),
      #("createdAt", json.string(data.created_at))
    ],
  )
}

pub fn app_bsky_feed_defs_not_found_post_decoder() {
  use uri <- decode.field("uri", decode.string)
  use not_found <- decode.field("notFound", decode.bool)
  decode.success(AppBskyFeedDefsNotFoundPost(uri: uri, not_found: not_found))
}

pub fn app_bsky_feed_defs_not_found_post_encode(
  data: AppBskyFeedDefsNotFoundPost,
) {
  utils.object(
    [#("uri", json.string(data.uri)), #("notFound", json.bool(data.not_found))],
  )
}

pub fn app_bsky_embed_record_view_blocked_decoder() {
  use author <- decode.field(
    "author",
    app_bsky_feed_defs_blocked_author_decoder(),
  )
  use uri <- decode.field("uri", decode.string)
  use blocked <- decode.field("blocked", decode.bool)
  decode.success(
    AppBskyEmbedRecordViewBlocked(author: author, uri: uri, blocked: blocked),
  )
}

pub fn app_bsky_embed_record_view_blocked_encode(
  data: AppBskyEmbedRecordViewBlocked,
) {
  utils.object(
    [
      #("author", app_bsky_feed_defs_blocked_author_encode(data.author)),
      #("uri", json.string(data.uri)),
      #("blocked", json.bool(data.blocked))
    ],
  )
}

pub fn app_bsky_graph_defs_list_view_decoder() {
  use indexed_at <- decode.field("indexedAt", decode.string)
  use name <- decode.field("name", decode.string)
  use creator <- decode.field(
    "creator",
    app_bsky_actor_defs_profile_view_decoder(),
  )
  use uri <- decode.field("uri", decode.string)
  use viewer <- decode.optional_field(
    "viewer",
    None,
    decode.optional(app_bsky_graph_defs_list_viewer_state_decoder()),
  )
  use description_facets <- decode.optional_field(
    "descriptionFacets",
    None,
    decode.optional(decode.list(app_bsky_richtext_facet_decoder())),
  )
  use avatar <- decode.optional_field(
    "avatar",
    None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use cid <- decode.field("cid", decode.string)
  use purpose <- decode.field(
    "purpose",
    app_bsky_graph_defs_list_purpose_decoder(),
  )
  use list_item_count <- decode.optional_field(
    "listItemCount",
    None,
    decode.optional(decode.int),
  )
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(decode.list(com_atproto_label_defs_label_decoder())),
  )
  decode.success(
    AppBskyGraphDefsListView(
      indexed_at: indexed_at,
      name: name,
      creator: creator,
      uri: uri,
      viewer: viewer,
      description_facets: description_facets,
      avatar: avatar,
      description: description,
      cid: cid,
      purpose: purpose,
      list_item_count: list_item_count,
      labels: labels,
    ),
  )
}

pub fn app_bsky_graph_defs_list_view_encode(data: AppBskyGraphDefsListView) {
  utils.object(
    [
      #("indexedAt", json.string(data.indexed_at)),
      #("name", json.string(data.name)),
      #("creator", app_bsky_actor_defs_profile_view_encode(data.creator)),
      #("uri", json.string(data.uri)),
      #(
        "viewer",
        json.nullable(data.viewer, app_bsky_graph_defs_list_viewer_state_encode),
      ),
      #(
        "descriptionFacets",
        json.nullable(
          data.description_facets,
          json.array(_, app_bsky_richtext_facet_encode),
        ),
      ),
      #("avatar", json.nullable(data.avatar, json.string)),
      #("description", json.nullable(data.description, json.string)),
      #("cid", json.string(data.cid)),
      #("purpose", app_bsky_graph_defs_list_purpose_encode(data.purpose)),
      #("listItemCount", json.nullable(data.list_item_count, json.int)),
      #(
        "labels",
        json.nullable(
          data.labels,
          json.array(_, com_atproto_label_defs_label_encode),
        ),
      )
    ],
  )
}

pub fn app_bsky_actor_defs_muted_word_target_decoder() {
  decode.string
}

pub fn app_bsky_actor_defs_muted_word_target_encode(
  data: AppBskyActorDefsMutedWordTarget,
) {
  json.string(data)
}

pub fn app_bsky_feed_defs_thread_view_post_decoder() {
  use post <- decode.field("post", app_bsky_feed_defs_post_view_decoder())
  use thread_context <- decode.optional_field(
    "threadContext",
    None,
    decode.optional(app_bsky_feed_defs_thread_context_decoder()),
  )
  use replies <- decode.optional_field(
    "replies",
    None,
    decode.optional(decode.list(utils.dynamic_to_json())),
  )
  use parent <- decode.optional_field(
    "parent",
    None,
    decode.optional(utils.dynamic_to_json()),
  )
  decode.success(
    AppBskyFeedDefsThreadViewPost(
      post: post,
      thread_context: thread_context,
      replies: replies,
      parent: parent,
    ),
  )
}

pub fn app_bsky_feed_defs_thread_view_post_encode(
  data: AppBskyFeedDefsThreadViewPost,
) {
  utils.object(
    [
      #("post", app_bsky_feed_defs_post_view_encode(data.post)),
      #(
        "threadContext",
        json.nullable(
          data.thread_context,
          app_bsky_feed_defs_thread_context_encode,
        ),
      ),
      #("replies", json.nullable(data.replies, json.array(_, fn(data) { data }))),
      #("parent", json.nullable(data.parent, fn(data) { data }))
    ],
  )
}

pub fn app_bsky_graph_list_decoder() {
  use name <- decode.field("name", decode.string)
  use description_facets <- decode.optional_field(
    "descriptionFacets",
    None,
    decode.optional(decode.list(app_bsky_richtext_facet_decoder())),
  )
  use avatar <- decode.optional_field(
    "avatar",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.field("createdAt", decode.string)
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use purpose <- decode.field(
    "purpose",
    app_bsky_graph_defs_list_purpose_decoder(),
  )
  use labels <- decode.optional_field(
    "labels",
    None,
    decode.optional(com_atproto_label_defs_self_labels_decoder()),
  )
  decode.success(
    AppBskyGraphList(
      name: name,
      description_facets: description_facets,
      avatar: avatar,
      created_at: created_at,
      description: description,
      purpose: purpose,
      labels: labels,
    ),
  )
}

pub fn app_bsky_graph_list_encode(data: AppBskyGraphList) {
  utils.object(
    [
      #("name", json.string(data.name)),
      #(
        "descriptionFacets",
        json.nullable(
          data.description_facets,
          json.array(_, app_bsky_richtext_facet_encode),
        ),
      ),
      #("avatar", json.nullable(data.avatar, json.string)),
      #("createdAt", json.string(data.created_at)),
      #("description", json.nullable(data.description, json.string)),
      #("purpose", app_bsky_graph_defs_list_purpose_encode(data.purpose)),
      #(
        "labels",
        json.nullable(data.labels, com_atproto_label_defs_self_labels_encode),
      )
    ],
  )
}

pub fn app_bsky_richtext_facet_tag_decoder() {
  use tag <- decode.field("tag", decode.string)
  decode.success(AppBskyRichtextFacetTag(tag: tag))
}

pub fn app_bsky_richtext_facet_tag_encode(data: AppBskyRichtextFacetTag) {
  utils.object([#("tag", json.string(data.tag))])
}

pub fn app_bsky_actor_defs_personal_details_pref_decoder() {
  use birth_date <- decode.optional_field(
    "birthDate",
    None,
    decode.optional(decode.string),
  )
  decode.success(AppBskyActorDefsPersonalDetailsPref(birth_date: birth_date))
}

pub fn app_bsky_actor_defs_personal_details_pref_encode(
  data: AppBskyActorDefsPersonalDetailsPref,
) {
  utils.object([#("birthDate", json.nullable(data.birth_date, json.string))])
}

pub fn tools_ozone_moderation_defs_blob_view_decoder() {
  use size <- decode.field("size", decode.int)
  use details <- decode.optional_field(
    "details",
    None,
    decode.optional(utils.dynamic_to_json()),
  )
  use moderation <- decode.optional_field(
    "moderation",
    None,
    decode.optional(tools_ozone_moderation_defs_moderation_decoder()),
  )
  use mime_type <- decode.field("mimeType", decode.string)
  use created_at <- decode.field("createdAt", decode.string)
  use cid <- decode.field("cid", decode.string)
  decode.success(
    ToolsOzoneModerationDefsBlobView(
      size: size,
      details: details,
      moderation: moderation,
      mime_type: mime_type,
      created_at: created_at,
      cid: cid,
    ),
  )
}

pub fn tools_ozone_moderation_defs_blob_view_encode(
  data: ToolsOzoneModerationDefsBlobView,
) {
  utils.object(
    [
      #("size", json.int(data.size)),
      #("details", json.nullable(data.details, fn(data) { data })),
      #(
        "moderation",
        json.nullable(
          data.moderation,
          tools_ozone_moderation_defs_moderation_encode,
        ),
      ),
      #("mimeType", json.string(data.mime_type)),
      #("createdAt", json.string(data.created_at)),
      #("cid", json.string(data.cid))
    ],
  )
}

pub fn chat_bsky_moderation_get_actor_metadata_metadata_decoder() {
  use messages_sent <- decode.field("messagesSent", decode.int)
  use convos_started <- decode.field("convosStarted", decode.int)
  use messages_received <- decode.field("messagesReceived", decode.int)
  use convos <- decode.field("convos", decode.int)
  decode.success(
    ChatBskyModerationGetActorMetadataMetadata(
      messages_sent: messages_sent,
      convos_started: convos_started,
      messages_received: messages_received,
      convos: convos,
    ),
  )
}

pub fn chat_bsky_moderation_get_actor_metadata_metadata_encode(
  data: ChatBskyModerationGetActorMetadataMetadata,
) {
  utils.object(
    [
      #("messagesSent", json.int(data.messages_sent)),
      #("convosStarted", json.int(data.convos_started)),
      #("messagesReceived", json.int(data.messages_received)),
      #("convos", json.int(data.convos))
    ],
  )
}

pub fn chat_bsky_convo_defs_message_ref_decoder() {
  use message_id <- decode.field("messageId", decode.string)
  use convo_id <- decode.field("convoId", decode.string)
  use did <- decode.field("did", decode.string)
  decode.success(
    ChatBskyConvoDefsMessageRef(
      message_id: message_id,
      convo_id: convo_id,
      did: did,
    ),
  )
}

pub fn chat_bsky_convo_defs_message_ref_encode(data: ChatBskyConvoDefsMessageRef) {
  utils.object(
    [
      #("messageId", json.string(data.message_id)),
      #("convoId", json.string(data.convo_id)),
      #("did", json.string(data.did))
    ],
  )
}

pub fn app_bsky_labeler_defs_labeler_policies_decoder() {
  use label_value_definitions <- decode.optional_field(
    "labelValueDefinitions",
    None,
    decode.optional(
      decode.list(com_atproto_label_defs_label_value_definition_decoder()),
    ),
  )
  use label_values <- decode.field(
    "labelValues",
    decode.list(com_atproto_label_defs_label_value_decoder()),
  )
  decode.success(
    AppBskyLabelerDefsLabelerPolicies(
      label_value_definitions: label_value_definitions,
      label_values: label_values,
    ),
  )
}

pub fn app_bsky_labeler_defs_labeler_policies_encode(
  data: AppBskyLabelerDefsLabelerPolicies,
) {
  utils.object(
    [
      #(
        "labelValueDefinitions",
        json.nullable(
          data.label_value_definitions,
          json.array(_, com_atproto_label_defs_label_value_definition_encode),
        ),
      ),
      #(
        "labelValues",
        json.array(_, com_atproto_label_defs_label_value_encode)(
          data.label_values,
        ),
      )
    ],
  )
}

pub fn tools_ozone_moderation_defs_review_open_decoder() {
  decode.string
}

pub fn tools_ozone_moderation_defs_review_open_encode(
  data: ToolsOzoneModerationDefsReviewOpen,
) {
  json.string(data)
}

pub fn app_bsky_actor_defs_saved_feed_decoder() {
  use value <- decode.field("value", decode.string)
  use pinned <- decode.field("pinned", decode.bool)
  use type_ <- decode.field("type", decode.string)
  use id <- decode.field("id", decode.string)
  decode.success(
    AppBskyActorDefsSavedFeed(value: value, pinned: pinned, type_: type_, id: id),
  )
}

pub fn app_bsky_actor_defs_saved_feed_encode(data: AppBskyActorDefsSavedFeed) {
  utils.object(
    [
      #("value", json.string(data.value)),
      #("pinned", json.bool(data.pinned)),
      #("type", json.string(data.type_)),
      #("id", json.string(data.id))
    ],
  )
}

pub fn tools_ozone_moderation_defs_reporter_stats_decoder() {
  use record_report_count <- decode.field("recordReportCount", decode.int)
  use reported_record_count <- decode.field("reportedRecordCount", decode.int)
  use labeled_record_count <- decode.field("labeledRecordCount", decode.int)
  use takendown_account_count <- decode.field(
    "takendownAccountCount",
    decode.int,
  )
  use account_report_count <- decode.field("accountReportCount", decode.int)
  use labeled_account_count <- decode.field("labeledAccountCount", decode.int)
  use takendown_record_count <- decode.field("takendownRecordCount", decode.int)
  use reported_account_count <- decode.field("reportedAccountCount", decode.int)
  use did <- decode.field("did", decode.string)
  decode.success(
    ToolsOzoneModerationDefsReporterStats(
      record_report_count: record_report_count,
      reported_record_count: reported_record_count,
      labeled_record_count: labeled_record_count,
      takendown_account_count: takendown_account_count,
      account_report_count: account_report_count,
      labeled_account_count: labeled_account_count,
      takendown_record_count: takendown_record_count,
      reported_account_count: reported_account_count,
      did: did,
    ),
  )
}

pub fn tools_ozone_moderation_defs_reporter_stats_encode(
  data: ToolsOzoneModerationDefsReporterStats,
) {
  utils.object(
    [
      #("recordReportCount", json.int(data.record_report_count)),
      #("reportedRecordCount", json.int(data.reported_record_count)),
      #("labeledRecordCount", json.int(data.labeled_record_count)),
      #("takendownAccountCount", json.int(data.takendown_account_count)),
      #("accountReportCount", json.int(data.account_report_count)),
      #("labeledAccountCount", json.int(data.labeled_account_count)),
      #("takendownRecordCount", json.int(data.takendown_record_count)),
      #("reportedAccountCount", json.int(data.reported_account_count)),
      #("did", json.string(data.did))
    ],
  )
}

pub fn app_bsky_feed_defs_interaction_decoder() {
  use feed_context <- decode.optional_field(
    "feedContext",
    None,
    decode.optional(decode.string),
  )
  use item <- decode.optional_field("item", None, decode.optional(decode.string))
  use event <- decode.optional_field(
    "event",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    AppBskyFeedDefsInteraction(
      feed_context: feed_context,
      item: item,
      event: event,
    ),
  )
}

pub fn app_bsky_feed_defs_interaction_encode(data: AppBskyFeedDefsInteraction) {
  utils.object(
    [
      #("feedContext", json.nullable(data.feed_context, json.string)),
      #("item", json.nullable(data.item, json.string)),
      #("event", json.nullable(data.event, json.string))
    ],
  )
}
