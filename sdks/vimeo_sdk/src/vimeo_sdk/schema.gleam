import gleam/option.{type Option, None}
import gleam/json
import gleam/dynamic/decode

pub type AncestorPath {
  AncestorPath(name: String, link: String)
}

pub type Preset {
  Preset(settings: Nil, name: String, user: Nil, uri: String, metadata: Nil)
}

pub type Group {
  Group(
    modified_time: String,
    created_time: String,
    privacy: Nil,
    name: String,
    user: Option(Nil),
    uri: String,
    resource_key: String,
    metadata: Nil,
    pictures: Nil,
    link: String,
    description: Option(String),
  )
}

pub type Comment {
  Comment(
    deleted_on: Option(String),
    replies: List(Reply),
    richtext: Option(String),
    user: Nil,
    uri: String,
    last_edited_on: Option(String),
    text: String,
    resource_key: String,
    metadata: Nil,
    text_decorations: List(Nil),
    created_on: String,
    type_: String,
    link: String,
  )
}

pub type VersionTranscodeStatus {
  VersionTranscodeStatus(
    is_playable: Bool,
    is_complete: Bool,
    is_fully_playable: Bool,
  )
}

pub type Tutorial {
  Tutorial(
    token_is_authenticated: Bool,
    message: String,
    next_steps_link: String,
  )
}

pub type EventAutomatedClosedCaptions {
  EventAutomatedClosedCaptions(
    event_id: Float,
    auto_cc_can_be_enabled: Bool,
    auto_cc_remaining: Float,
    auto_cc_language: Option(String),
    auto_cc_enabled: Bool,
    auto_cc_keywords: String,
    auto_cc_is_unlimited: Bool,
  )
}

pub type Picture {
  Picture(
    default_picture: Bool,
    active: Bool,
    base_link: String,
    uri: String,
    resource_key: String,
    sizes: List(Nil),
    type_: String,
    link: Option(String),
  )
}

pub type Category {
  Category(
    is_deprecated: Bool,
    parent: Option(Nil),
    name: String,
    uri: String,
    resource_key: String,
    metadata: Nil,
    last_video_featured_time: String,
    pictures: Nil,
    icon: Option(Nil),
    top_level: Bool,
    link: String,
    subcategories: Option(List(Nil)),
  )
}

pub type Subscription {
  Subscription(
    payment_method_id: String,
    vendor: String,
    created_at: String,
    plans: List(Nil),
    subscription_number: String,
    start_date: String,
    account_id: String,
    grace_period_id: Option(String),
    end_date: String,
    status: String,
    can_renew_now: Bool,
    disabled_at: Option(String),
    subscription_version: Float,
    updated_at: String,
    id: String,
    is_latest: Bool,
    auto_renew: Bool,
  )
}

pub type EventSessionStatus {
  EventSessionStatus(
    archive: Nil,
    stream_mode: String,
    ingest: Nil,
    status: Option(String),
    can_manage: Bool,
    metering: Nil,
    id: Float,
  )
}

pub type EventDestination {
  EventDestination(
    stream_key: Option(String),
    provider_user_id: Option(String),
    scheduled_at: Option(Float),
    provider_broadcast_id: Option(String),
    privacy: Option(String),
    display_name: String,
    is_enabled: Bool,
    provider_video_id: Option(String),
    user_id: Float,
    metadata: Nil,
    stream_url: Option(String),
    state: String,
    service_name: String,
    live_clip_id: Float,
    state_message: Option(String),
    provider_destination_id: Option(String),
    type_: String,
    id: Float,
  )
}

pub type Video {
  Video(
    license: String,
    is_free: Option(Bool),
    edit_session: Option(Nil),
    upload: Option(Nil),
    app: Nil,
    custom_url: Option(String),
    show_svv_footer_banner: Bool,
    content_rating: List(String),
    parent_folder: Option(Nil),
    is_playable: Bool,
    modified_time: String,
    version_transcode_status: Nil,
    spatial: Option(Nil),
    created_time: String,
    release_time: String,
    width: Float,
    height: Float,
    download: Option(List(VideoFile)),
    origin_variable_frame_resolution: Option(Bool),
    privacy: Nil,
    is_copyright_restricted: Bool,
    files_size: Nil,
    rating_mod_locked: Bool,
    vod: Option(Nil),
    has_chapters: Bool,
    name: String,
    player_embed_url: String,
    user: Nil,
    uri: String,
    uses_drm: Bool,
    description_html: String,
    uploader: Nil,
    resource_key: String,
    allowed_privacies: Option(List(String)),
    context: Nil,
    page: Option(Nil),
    metadata: Nil,
    last_user_action_event_date: Option(String),
    has_audio: Bool,
    status: String,
    can_move_to_project: Bool,
    show_review_page: Bool,
    duration: Float,
    manage_link: Option(String),
    play: Option(Nil),
    transcode: Option(Nil),
    has_text_tracks: Bool,
    pictures: Nil,
    has_audio_tracks: Bool,
    transcript: Nil,
    show_svv_timecoded_comments: Bool,
    files: Option(List(VideoFile)),
    language: Option(String),
    tags: List(Tag),
    review_status: Option(String),
    embed: Nil,
    type_: String,
    link: String,
    password: Option(String),
    categories: List(Category),
    content_rating_class: String,
    description: Option(String),
    has_interactive: Option(Bool),
    stats: Nil,
    description_rich: Option(String),
  )
}

pub type Tag {
  Tag(
    name: String,
    uri: String,
    resource_key: String,
    metadata: Nil,
    canonical: String,
  )
}

pub type Event {
  Event(
    stream_key: Option(String),
    dvr: Bool,
    from_showcase: Bool,
    stream_mode: String,
    preferred_stream_method: String,
    content_rating: List(String),
    parent_folder: Nil,
    automatically_title_stream: Bool,
    srt_link: Option(String),
    created_time: String,
    disable_auto_archiving: Bool,
    auto_cc_remaining: Option(Float),
    auto_cc_language: Option(String),
    stream_privacy: Nil,
    webinar: Option(List(String)),
    venue_uuid: Option(String),
    user: Nil,
    rtmps_link: Option(String),
    playlist_sort: String,
    uri: String,
    scheduled_playback: Bool,
    rtmp_preview: Bool,
    allowed_privacies: List(String),
    head_clip: Option(Nil),
    album: Option(Nil),
    next_occurrence_time: Option(String),
    metadata: Nil,
    live_clips: List(String),
    allow_share_link: Bool,
    auto_cc_enabled: Option(Bool),
    unlimited_duration: Bool,
    unlimited_auto_cc: Option(Bool),
    status: Option(String),
    completed_on: String,
    low_latency: Bool,
    rtmp_link: Option(String),
    view_link: String,
    interaction_tools_settings: Option(List(Nil)),
    email_quota: Nil,
    streaming_auto_stop: Bool,
    from_webinar: Option(Bool),
    pictures: Nil,
    streamable_clip: Option(Nil),
    whitelisted_domains: Option(List(Nil)),
    settings_link: String,
    schedule: Nil,
    title: String,
    live_destinations: Option(List(String)),
    stream_title: String,
    auto_cc_keywords: Option(String),
    embed: Nil,
    stream_password: Option(String),
    chat_enabled: Bool,
    link: String,
    stream_description: Option(String),
    latency: String,
    time_zone: String,
    lead_uuid: String,
    event_type: String,
  )
}

pub type SubscriptionPlans {
  SubscriptionPlans(
    discount: Nil,
    tier: String,
    promotion: Nil,
    price: Nil,
    name: String,
    uri: String,
    metadata: Nil,
    currency: Nil,
    id: Nil,
  )
}

pub type Project {
  Project(
    access_grant: Nil,
    settings: Nil,
    modified_time: String,
    created_time: String,
    pinned_on: Option(String),
    privacy: Nil,
    has_subfolder: Bool,
    name: String,
    user: Nil,
    uri: String,
    is_pinned: Bool,
    resource_key: String,
    metadata: Nil,
    last_user_action_event_date: Option(String),
    manage_link: String,
    creator_uri: String,
    link: String,
    should_show_team_library_notification: Bool,
    is_private_to_user: Bool,
  )
}

pub type Credit {
  Credit(
    name: String,
    user: Option(Nil),
    uri: String,
    role: String,
    video: Option(Nil),
  )
}

pub type Activity31 {
  Activity31(
    channel: Option(Nil),
    user: Option(Nil),
    time: String,
    metadata: Nil,
    clip: Nil,
    type_: String,
    tag: Option(Nil),
    category: Option(Nil),
    group: Option(Nil),
  )
}

pub type TrimmedVideo {
  TrimmedVideo(
    start: String,
    clip_id: Float,
    uri: String,
    metadata: Nil,
    modified_on: Option(String),
    created_on: String,
    version_quality: String,
    created_version_id: String,
    end: String,
    root_version_id: String,
    is_clip_finished_transcoding: Bool,
  )
}

pub type Language {
  Language(name: String, code: String)
}

pub type OnDemandSeason {
  OnDemandSeason(
    position: Float,
    name: String,
    user: Nil,
    uri: String,
    resource_key: String,
    metadata: Nil,
    type_: String,
    description: String,
  )
}

pub type EmbedSettings {
  EmbedSettings(
    closed_captions: Bool,
    email_capture_form: Nil,
    buttons: Nil,
    interactive: Bool,
    color: String,
    cards: List(Nil),
    chapters: Bool,
    speed: Bool,
    logos: Nil,
    autopip: Bool,
    html: Option(String),
    uri: Option(String),
    outro_type: String,
    ask_ai: Bool,
    end_screen: Nil,
    badges: Nil,
    colors: Nil,
    audio_tracks: Bool,
    transcript: Bool,
    pip: Bool,
    skipping_forward: Bool,
    title: Nil,
    chromecast: Bool,
    volume: Bool,
    show_timezone: Bool,
    event_schedule: Bool,
    play_button: Nil,
    has_cards: Bool,
    airplay: Bool,
    playbar: Bool,
    quality_selector: Bool,
  )
}

pub type AnimatedThumbset {
  AnimatedThumbset(
    uri: String,
    sizes: List(AnimatedThumbnail),
    status: String,
    created_on: String,
    clip_uri: String,
  )
}

pub type Location {
  Location(
    sub_locality: Option(String),
    city: Option(String),
    latitude: Float,
    neighborhood: Option(String),
    longitude: Float,
    country_iso_code: String,
    state: Option(String),
    formatted_address: String,
    state_iso_code: Option(String),
    country: Option(String),
  )
}

pub type Endpoint {
  Endpoint(path_: String, methods: List(String))
}

pub type Play {
  Play(
    progressive: Option(List(Nil)),
    hls: Option(Nil),
    dash: Option(Nil),
    status: String,
    player_license_url: String,
    player_fairplay_certificate_url: String,
  )
}

pub type Segment {
  Segment(
    autogenerated: Bool,
    enabled: Bool,
    text_track_uri: String,
    video_uri: Option(String),
    words: List(SegmentWords),
    cue_end: Float,
    kind: String,
    cue_start: Float,
    language: String,
    id: String,
    lines: List(SegmentLine),
    speaker: Option(String),
  )
}

pub type Skill {
  Skill(name: String, uri: String)
}

pub type ContentRating {
  ContentRating(name: String, uri: Option(String), code: String)
}

pub type PermissionPolicy {
  PermissionPolicy(
    display_name: String,
    name: String,
    uri: String,
    permission_actions: Nil,
    modified_on: Option(String),
    created_on: String,
    display_description: String,
  )
}

pub type OttDestination {
  OttDestination(
    ott_channel_id: Float,
    ott_event_id: Float,
    recurring_live_event_id: Float,
    ott_channel_name: String,
    ott_channel_subdomain: String,
    id: String,
  )
}

pub type VideoPageSettings {
  VideoPageSettings(
    player: Option(Nil),
    chapters: Option(Bool),
    download: Bool,
    uri: Option(String),
    views: Bool,
    uploader: Bool,
    ask_ai: Bool,
    date_added: Bool,
    owner: Bool,
    comments: Bool,
    collections: Bool,
    transcript: Option(Bool),
    like: Bool,
    title: Option(Bool),
    creative_commons: Bool,
    tags: Bool,
    credits: Bool,
    portrait: Bool,
    categories: Bool,
    watch_later: Bool,
    description: Bool,
    share: Bool,
  )
}

pub type SegmentWords {
  SegmentWords(start_time: Option(Float), word: String, end_time: Option(Float))
}

pub type Album {
  Album(
    web_brand_color: Bool,
    autoplay: Bool,
    hide_vimeo_logo: Option(Bool),
    modified_time: String,
    domain: Option(String),
    created_time: String,
    loop: Bool,
    has_chosen_thumbnail: Bool,
    embed_brand_color: Option(Bool),
    hide_nav: Bool,
    privacy: Nil,
    theme: String,
    allow_share: Bool,
    review_mode: Bool,
    layout: String,
    brand_color: Option(String),
    name: String,
    user: Nil,
    hide_from_vimeo: Bool,
    seo_keywords: List(String),
    uri: String,
    has_featured_content: Bool,
    domain_certificate_state: String,
    web_custom_logo: Bool,
    allow_continuous_play: Bool,
    resource_key: String,
    allowed_privacies: List(String),
    url: Option(String),
    metadata: Nil,
    embed_custom_logo: Option(Bool),
    duration: Float,
    pictures: Nil,
    allow_downloads: Bool,
    seo_title: Option(String),
    unlisted_hash: Option(String),
    seo_allow_indexed: Bool,
    custom_logo: Nil,
    embed: Nil,
    hide_upcoming: Bool,
    share_link: String,
    use_custom_domain: Bool,
    seo_description: Option(String),
    link: String,
    description: Option(String),
    sort: String,
  )
}

pub type OnDemandPromotion {
  OnDemandPromotion(
    stream_period: Option(String),
    total: Float,
    download: Bool,
    product_type: String,
    uri: String,
    metadata: Nil,
    label: Option(String),
    access_type: String,
    percent_off: Float,
    discount_type: String,
    type_: String,
  )
}

pub type OnDemandGenre {
  OnDemandGenre(
    interactions: Nil,
    name: String,
    uri: String,
    metadata: Nil,
    canonical: String,
    link: String,
  )
}

pub type ApiApp {
  ApiApp(name: String, uri: String, capabilities: Nil)
}

pub type VideoFile {
  VideoFile(
    size: Float,
    public_name: String,
    created_time: String,
    log: Option(Nil),
    width: Float,
    height: Float,
    fps: Float,
    rendition: String,
    expires: Option(String),
    codec: Option(String),
    video_file_id: Option(String),
    type_: Option(String),
    link: String,
    md5: String,
    source_link: Option(String),
    size_short: String,
    quality: String,
  )
}

pub type SegmentLine {
  SegmentLine(text: String, voice: Option(String))
}

pub type Chapter {
  Chapter(
    active_thumbnail_uri: Option(String),
    thumbnails: List(Picture),
    uri: String,
    title: String,
    timecode: Float,
  )
}

pub type User {
  User(
    available_for_hire: Bool,
    gender: Option(String),
    skills: Option(List(Skill)),
    created_time: String,
    short_bio: Option(String),
    bio: Option(String),
    clients: String,
    name: String,
    lms_learner_seats_quota: Option(Nil),
    uri: String,
    account: String,
    transcript_phrases_limit: Option(Float),
    resource_key: String,
    has_invalid_email: Option(Bool),
    metadata: Nil,
    bandwidth: Option(Nil),
    can_work_remotely: Bool,
    is_staff_picked: Bool,
    pictures: Nil,
    location: Option(String),
    capabilities: Nil,
    preferences: Nil,
    websites: List(Nil),
    location_details: Option(Nil),
    profile_discovery: Bool,
    upload_quota: Nil,
    link: String,
    ai_credits_quota: Option(Nil),
    content_filter: Option(List(String)),
    is_expert: Bool,
  )
}

pub type OnDemandPromotionCode {
  OnDemandPromotionCode(max_uses: Float, uses: Float, code: String, link: String)
}

pub type HlsDashVideoFile {
  HlsDashVideoFile(
    log: Option(String),
    link_expiration_time: String,
    link: Option(String),
  )
}

pub type TextTrack {
  TextTrack(
    provenance: String,
    active: Bool,
    hls_link: String,
    name: Option(String),
    uri: String,
    hls_link_expires_time: String,
    metadata: Option(Nil),
    display_language: String,
    version: Option(Float),
    language: Option(String),
    source_link_expires_time: String,
    type_: Option(String),
    link: String,
    id: Float,
    link_expires_time: String,
    source_link: String,
  )
}

pub type CreativeCommons {
  CreativeCommons(name: String, uri: Option(String), code: String)
}

pub type RecurringEvent {
  RecurringEvent(
    stream_key: Option(String),
    dvr: Bool,
    from_showcase: Bool,
    stream_mode: String,
    preferred_stream_method: String,
    content_rating: List(String),
    parent_folder: Nil,
    automatically_title_stream: Bool,
    srt_link: Option(String),
    created_time: String,
    disable_auto_archiving: Bool,
    auto_cc_remaining: Option(Float),
    auto_cc_language: Option(String),
    stream_privacy: Nil,
    webinar: Option(List(String)),
    venue_uuid: Option(String),
    user: Nil,
    rtmps_link: Option(String),
    playlist_sort: String,
    uri: String,
    scheduled_playback: Bool,
    rtmp_preview: Bool,
    allowed_privacies: List(String),
    head_clip: Option(Nil),
    album: Option(Nil),
    next_occurrence_time: Option(String),
    metadata: Nil,
    live_clips: List(String),
    allow_share_link: Bool,
    auto_cc_enabled: Option(Bool),
    unlimited_duration: Bool,
    unlimited_auto_cc: Option(Bool),
    status: Option(String),
    completed_on: String,
    low_latency: Bool,
    rtmp_link: Option(String),
    view_link: String,
    interaction_tools_settings: Option(List(Nil)),
    email_quota: Nil,
    streaming_auto_stop: Bool,
    from_webinar: Option(Bool),
    pictures: Nil,
    streamable_clip: Option(Nil),
    whitelisted_domains: Option(List(Nil)),
    settings_link: String,
    schedule: Nil,
    title: String,
    live_destinations: Option(List(String)),
    stream_title: String,
    auto_cc_keywords: Option(String),
    embed: Nil,
    stream_password: Option(String),
    chat_enabled: Bool,
    link: String,
    stream_description: Option(String),
    latency: String,
    time_zone: String,
    lead_uuid: String,
    event_type: String,
  )
}

pub type Reply {
  Reply(
    deleted_on: Option(String),
    richtext: Option(String),
    uri: String,
    last_edited_on: Option(String),
    text: String,
    resource_key: String,
    metadata: Nil,
    text_decorations: List(Nil),
    created_on: String,
    type_: String,
    link: String,
  )
}

pub type EventSchedule {
  EventSchedule(
    start_time: Option(String),
    weekdays: Option(List(String)),
    rrule: Option(String),
    end_time: Option(String),
    daily_time: Option(String),
    type_: String,
    time_zone: Option(String),
    scheduled_time: Option(String),
  )
}

pub type PaymentMethod {
  PaymentMethod(
    created_at: String,
    is_default: Bool,
    account_id: String,
    card: Option(Nil),
    disabled_at: String,
    updated_at: String,
    type_: String,
    id: String,
  )
}

pub type Error {
  Error(
    error_code: Float,
    error: String,
    developer_message: String,
    link: String,
  )
}

pub type Auth {
  Auth(
    token_type: String,
    app: Nil,
    expires_on: Option(String),
    user: Option(Nil),
    scope: String,
    refresh_token: Option(String),
    access_token: String,
  )
}

pub type OnDemandRegion {
  OnDemandRegion(uri: String, country_name: String, country_code: String)
}

pub type Portfolio {
  Portfolio(
    modified_time: String,
    created_time: String,
    name: String,
    uri: String,
    metadata: Nil,
    link: String,
    description: Option(String),
    sort: String,
  )
}

pub type OnDemandVideo {
  OnDemandVideo(
    interactions: Nil,
    release_date: Option(String),
    buy: Option(Nil),
    position: Option(Float),
    name: Option(String),
    user: Option(Nil),
    uri: String,
    metadata: Nil,
    duration: Option(String),
    release_year: Option(Float),
    pictures: Option(Nil),
    play_progress: Float,
    rent: Option(Nil),
    type_: String,
    link: String,
    episode: Option(Float),
    description: Option(String),
    options: Option(List(String)),
  )
}

pub type ProjectItem {
  ProjectItem(
    live_event: Option(Nil),
    shared_date: Option(String),
    showcase: Option(Nil),
    folder: Option(Nil),
    metadata: Nil,
    type_: String,
    video: Option(Nil),
  )
}

pub type Analytics {
  Analytics(
    finishes: Float,
    browser_name: String,
    device_type: String,
    os_name: String,
    drm_licenses_used: Float,
    embed_domain: String,
    impressions: Float,
    downloads: Float,
    start_date: String,
    views: Float,
    metadata: Nil,
    end_date: String,
    average_percent_watched: Float,
    total_seconds_watched: Float,
    unique_viewers: Float,
    country_name: String,
    mean_seconds_watched: Float,
    region_name: String,
    country_code: String,
    country: Nil,
    streaming_type: String,
    total_time_watched: Float,
    region_code: String,
    third_party_impressions: Float,
    embed_domain_path: String,
    mean_percent_watched: Float,
    unique_impressions: Float,
    average_time_watched: Float,
    city_name: String,
  )
}

pub type TranscriptMetadata {
  TranscriptMetadata(
    autogenerated: Bool,
    enabled: Bool,
    clip_id: Float,
    speaker_count: Float,
    kind: String,
    language: String,
    deleted: Bool,
    container_id: String,
    word_count: Float,
    id: String,
    texttrack_id: Float,
    transcript_status_uuid: String,
  )
}

pub type PurchaseInteraction {
  PurchaseInteraction(
    buy: Option(Nil),
    subscribe: Option(Nil),
    rent: Option(Nil),
  )
}

pub type TeamRole {
  TeamRole(
    applicable_permission_policies: Option(Nil),
    display_name: Option(String),
    uri: String,
    count: Option(Float),
    is_disabled: Option(Bool),
    permission_level: Option(String),
    role: Option(String),
    display_description: Option(String),
  )
}

pub type VideoVersion {
  VideoVersion(
    edit_session: Nil,
    upload: Option(Nil),
    app: Nil,
    modified_time: String,
    created_time: String,
    create_storyboard_id: Option(String),
    active: Bool,
    filename: String,
    origin_variable_frame_resolution: Option(Bool),
    user: Nil,
    uri: String,
    upload_date: Option(String),
    metadata: Nil,
    duration: Option(Float),
    play: Option(Nil),
    transcode: Option(Nil),
    download_config: Nil,
    audio_track_quota: Nil,
    can_restore_create: Bool,
    description: Option(String),
    has_interactive: Bool,
    filesize: Option(Float),
  )
}

pub type TeamMembership {
  TeamMembership(
    applicable_permission_policies: Nil,
    access_grant: Option(Nil),
    joined_time: String,
    modified_time: String,
    created_time: String,
    active: Bool,
    exclude_sso: Option(Bool),
    user: Nil,
    uri: String,
    permission_actions: List(String),
    resource_key: String,
    metadata: Nil,
    has_folder_access: Option(Bool),
    status: String,
    permission_level: String,
    role: String,
    invite_url: Option(String),
    recently_reminded: Option(Bool),
    email: String,
    applicable_roles: List(TeamRole),
  )
}

pub type LegacyError {
  LegacyError(error: String)
}

pub type Domain {
  Domain(domain: String, uri: String, allow_hd: Bool)
}

pub type FederatedSearchItems {
  FederatedSearchItems(
    live_event: Option(Nil),
    showcase: Option(Nil),
    folder: Option(Nil),
    type_: String,
    video: Option(Nil),
  )
}

pub type OnDemandPage {
  OnDemandPage(
    content_rating: List(String),
    modified_time: Option(String),
    film: Option(Nil),
    created_time: Option(String),
    theme: String,
    preorder: Nil,
    name: String,
    user: Nil,
    thumbnail: Nil,
    uri: String,
    background: Nil,
    published: Nil,
    resource_key: String,
    metadata: Nil,
    colors: Nil,
    genres: List(OnDemandGenre),
    trailer: Nil,
    domain_link: Option(String),
    pictures: Nil,
    episodes: Nil,
    type_: String,
    link: String,
    description: Option(String),
    sku: Option(String),
    subscription: Option(Nil),
    rating: Option(Float),
  )
}

pub type AuthError {
  AuthError(error_description: String, error: String)
}

pub type Channel {
  Channel(
    modified_time: String,
    created_time: String,
    privacy: Nil,
    name: String,
    user: Nil,
    uri: String,
    header: Nil,
    resource_key: String,
    metadata: Nil,
    pictures: Nil,
    tags: List(Tag),
    link: String,
    categories: List(Category),
    description: Option(String),
  )
}

pub type Fragments {
  Fragments(
    uri: String,
    metadata: Nil,
    modified_on: String,
    created_on: String,
    timecode: Float,
  )
}

pub type RecurringEventLowLatency {
  RecurringEventLowLatency(low_latency: Bool)
}

pub type AnimatedThumbnail {
  AnimatedThumbnail(
    file_size: Float,
    width: Float,
    height: Float,
    link_with_play_button: String,
    start_time: Float,
    profile_id: String,
    duration: Float,
    is_downloadable: Bool,
    file_format: String,
    link: String,
    uuid: String,
  )
}

pub type AlternateAudioTrack {
  AlternateAudioTrack(
    upload: Nil,
    provenance: String,
    active: Bool,
    download: List(Nil),
    uri: String,
    transcode: Nil,
    quota: Nil,
    language: Nil,
    type_: String,
  )
}

pub type EditingSession {
  EditingSession(
    version_uri: Option(String),
    min_tier_for_movie: String,
    is_rated: Bool,
    upload_attempt_id_version_uri: Option(String),
    is_music_licensed: Bool,
    status: String,
    result_video_hash: String,
    vsid: Float,
    is_edited_by_tve: Bool,
    is_max_resolution: Bool,
    has_watermark: Bool,
  )
}

pub type UploadAttempt {
  UploadAttempt(
    form: Option(String),
    user: Nil,
    uri: String,
    ticket_id: String,
    clip: Option(Nil),
    upload_link: String,
  )
}

pub type VideoVersionsSize {
  VideoVersionsSize(
    num_versions: Float,
    file_size_type: String,
    total_size: Float,
  )
}

pub type Money {
  Money(unit: Float, currency: String, amount: Float, formatted: String)
}

pub fn ancestor_path_decoder() {
  use name <- decode.field("name", decode.string)
  use link <- decode.field("link", decode.string)
  decode.success(AncestorPath(name: name, link: link))
}

pub fn ancestor_path_encode(data: AncestorPath) {
  json.object(
    [#("name", json.string(data.name)), #("link", json.string(data.link))],
  )
}

pub fn preset_decoder() {
  use settings <- decode.field(
    "settings",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use name <- decode.field("name", decode.string)
  use user <- decode.field(
    "user",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use uri <- decode.field("uri", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  decode.success(
    Preset(
      settings: settings,
      name: name,
      user: user,
      uri: uri,
      metadata: metadata,
    ),
  )
}

pub fn preset_encode(data: Preset) {
  json.object(
    [
      #(
        "settings",
        fn(_) { panic as "Literal object inside field" }(data.settings),
      ),
      #("name", json.string(data.name)),
      #("user", fn(_) { panic as "AllOf inside field" }(data.user)),
      #("uri", json.string(data.uri)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      )
    ],
  )
}

pub fn group_decoder() {
  use modified_time <- decode.field("modified_time", decode.string)
  use created_time <- decode.field("created_time", decode.string)
  use privacy <- decode.field(
    "privacy",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use name <- decode.field("name", decode.string)
  use user <- decode.optional_field(
    "user",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use uri <- decode.field("uri", decode.string)
  use resource_key <- decode.field("resource_key", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use pictures <- decode.field(
    "pictures",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use link <- decode.field("link", decode.string)
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    Group(
      modified_time: modified_time,
      created_time: created_time,
      privacy: privacy,
      name: name,
      user: user,
      uri: uri,
      resource_key: resource_key,
      metadata: metadata,
      pictures: pictures,
      link: link,
      description: description,
    ),
  )
}

pub fn group_encode(data: Group) {
  json.object(
    [
      #("modified_time", json.string(data.modified_time)),
      #("created_time", json.string(data.created_time)),
      #(
        "privacy",
        fn(_) { panic as "Literal object inside field" }(data.privacy),
      ),
      #("name", json.string(data.name)),
      #(
        "user",
        json.nullable(data.user, fn(_) { panic as "AllOf inside field" }),
      ),
      #("uri", json.string(data.uri)),
      #("resource_key", json.string(data.resource_key)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("pictures", fn(_) { panic as "AllOf inside field" }(data.pictures)),
      #("link", json.string(data.link)),
      #("description", json.nullable(data.description, json.string))
    ],
  )
}

pub fn comment_decoder() {
  use deleted_on <- decode.optional_field(
    "deleted_on",
    None,
    decode.optional(decode.string),
  )
  use replies <- decode.field("replies", decode.list(reply_decoder()))
  use richtext <- decode.optional_field(
    "richtext",
    None,
    decode.optional(decode.string),
  )
  use user <- decode.field(
    "user",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use uri <- decode.field("uri", decode.string)
  use last_edited_on <- decode.optional_field(
    "last_edited_on",
    None,
    decode.optional(decode.string),
  )
  use text <- decode.field("text", decode.string)
  use resource_key <- decode.field("resource_key", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use text_decorations <- decode.field(
    "text_decorations",
    decode.list(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use created_on <- decode.field("created_on", decode.string)
  use type_ <- decode.field("type", decode.string)
  use link <- decode.field("link", decode.string)
  decode.success(
    Comment(
      deleted_on: deleted_on,
      replies: replies,
      richtext: richtext,
      user: user,
      uri: uri,
      last_edited_on: last_edited_on,
      text: text,
      resource_key: resource_key,
      metadata: metadata,
      text_decorations: text_decorations,
      created_on: created_on,
      type_: type_,
      link: link,
    ),
  )
}

pub fn comment_encode(data: Comment) {
  json.object(
    [
      #("deleted_on", json.nullable(data.deleted_on, json.string)),
      #("replies", json.array(_, reply_encode)(data.replies)),
      #("richtext", json.nullable(data.richtext, json.string)),
      #("user", fn(_) { panic as "AllOf inside field" }(data.user)),
      #("uri", json.string(data.uri)),
      #("last_edited_on", json.nullable(data.last_edited_on, json.string)),
      #("text", json.string(data.text)),
      #("resource_key", json.string(data.resource_key)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #(
        "text_decorations",
        json.array(_, fn(_) { panic as "object in array" })(
          data.text_decorations,
        ),
      ),
      #("created_on", json.string(data.created_on)),
      #("type", json.string(data.type_)),
      #("link", json.string(data.link))
    ],
  )
}

pub fn version_transcode_status_decoder() {
  use is_playable <- decode.field("is_playable", decode.bool)
  use is_complete <- decode.field("is_complete", decode.bool)
  use is_fully_playable <- decode.field("is_fully_playable", decode.bool)
  decode.success(
    VersionTranscodeStatus(
      is_playable: is_playable,
      is_complete: is_complete,
      is_fully_playable: is_fully_playable,
    ),
  )
}

pub fn version_transcode_status_encode(data: VersionTranscodeStatus) {
  json.object(
    [
      #("is_playable", json.bool(data.is_playable)),
      #("is_complete", json.bool(data.is_complete)),
      #("is_fully_playable", json.bool(data.is_fully_playable))
    ],
  )
}

pub fn tutorial_decoder() {
  use token_is_authenticated <- decode.field(
    "token_is_authenticated",
    decode.bool,
  )
  use message <- decode.field("message", decode.string)
  use next_steps_link <- decode.field("next_steps_link", decode.string)
  decode.success(
    Tutorial(
      token_is_authenticated: token_is_authenticated,
      message: message,
      next_steps_link: next_steps_link,
    ),
  )
}

pub fn tutorial_encode(data: Tutorial) {
  json.object(
    [
      #("token_is_authenticated", json.bool(data.token_is_authenticated)),
      #("message", json.string(data.message)),
      #("next_steps_link", json.string(data.next_steps_link))
    ],
  )
}

pub fn event_automated_closed_captions_decoder() {
  use event_id <- decode.field("event_id", decode.float)
  use auto_cc_can_be_enabled <- decode.field(
    "auto_cc_can_be_enabled",
    decode.bool,
  )
  use auto_cc_remaining <- decode.field("auto_cc_remaining", decode.float)
  use auto_cc_language <- decode.optional_field(
    "auto_cc_language",
    None,
    decode.optional(decode.string),
  )
  use auto_cc_enabled <- decode.field("auto_cc_enabled", decode.bool)
  use auto_cc_keywords <- decode.field("auto_cc_keywords", decode.string)
  use auto_cc_is_unlimited <- decode.field("auto_cc_is_unlimited", decode.bool)
  decode.success(
    EventAutomatedClosedCaptions(
      event_id: event_id,
      auto_cc_can_be_enabled: auto_cc_can_be_enabled,
      auto_cc_remaining: auto_cc_remaining,
      auto_cc_language: auto_cc_language,
      auto_cc_enabled: auto_cc_enabled,
      auto_cc_keywords: auto_cc_keywords,
      auto_cc_is_unlimited: auto_cc_is_unlimited,
    ),
  )
}

pub fn event_automated_closed_captions_encode(data: EventAutomatedClosedCaptions) {
  json.object(
    [
      #("event_id", json.float(data.event_id)),
      #("auto_cc_can_be_enabled", json.bool(data.auto_cc_can_be_enabled)),
      #("auto_cc_remaining", json.float(data.auto_cc_remaining)),
      #("auto_cc_language", json.nullable(data.auto_cc_language, json.string)),
      #("auto_cc_enabled", json.bool(data.auto_cc_enabled)),
      #("auto_cc_keywords", json.string(data.auto_cc_keywords)),
      #("auto_cc_is_unlimited", json.bool(data.auto_cc_is_unlimited))
    ],
  )
}

pub fn picture_decoder() {
  use default_picture <- decode.field("default_picture", decode.bool)
  use active <- decode.field("active", decode.bool)
  use base_link <- decode.field("base_link", decode.string)
  use uri <- decode.field("uri", decode.string)
  use resource_key <- decode.field("resource_key", decode.string)
  use sizes <- decode.field(
    "sizes",
    decode.list(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use type_ <- decode.field("type", decode.string)
  use link <- decode.optional_field("link", None, decode.optional(decode.string))
  decode.success(
    Picture(
      default_picture: default_picture,
      active: active,
      base_link: base_link,
      uri: uri,
      resource_key: resource_key,
      sizes: sizes,
      type_: type_,
      link: link,
    ),
  )
}

pub fn picture_encode(data: Picture) {
  json.object(
    [
      #("default_picture", json.bool(data.default_picture)),
      #("active", json.bool(data.active)),
      #("base_link", json.string(data.base_link)),
      #("uri", json.string(data.uri)),
      #("resource_key", json.string(data.resource_key)),
      #("sizes", json.array(_, fn(_) { panic as "object in array" })(data.sizes)),
      #("type", json.string(data.type_)),
      #("link", json.nullable(data.link, json.string))
    ],
  )
}

pub fn category_decoder() {
  use is_deprecated <- decode.field("is_deprecated", decode.bool)
  use parent <- decode.optional_field(
    "parent",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use name <- decode.field("name", decode.string)
  use uri <- decode.field("uri", decode.string)
  use resource_key <- decode.field("resource_key", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use last_video_featured_time <- decode.field(
    "last_video_featured_time",
    decode.string,
  )
  use pictures <- decode.field(
    "pictures",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use icon <- decode.optional_field(
    "icon",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use top_level <- decode.field("top_level", decode.bool)
  use link <- decode.field("link", decode.string)
  use subcategories <- decode.optional_field(
    "subcategories",
    None,
    decode.optional(
      decode.list(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
    ),
  )
  decode.success(
    Category(
      is_deprecated: is_deprecated,
      parent: parent,
      name: name,
      uri: uri,
      resource_key: resource_key,
      metadata: metadata,
      last_video_featured_time: last_video_featured_time,
      pictures: pictures,
      icon: icon,
      top_level: top_level,
      link: link,
      subcategories: subcategories,
    ),
  )
}

pub fn category_encode(data: Category) {
  json.object(
    [
      #("is_deprecated", json.bool(data.is_deprecated)),
      #(
        "parent",
        json.nullable(
          data.parent,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #("name", json.string(data.name)),
      #("uri", json.string(data.uri)),
      #("resource_key", json.string(data.resource_key)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("last_video_featured_time", json.string(data.last_video_featured_time)),
      #("pictures", fn(_) { panic as "AllOf inside field" }(data.pictures)),
      #(
        "icon",
        json.nullable(data.icon, fn(_) { panic as "AllOf inside field" }),
      ),
      #("top_level", json.bool(data.top_level)),
      #("link", json.string(data.link)),
      #(
        "subcategories",
        json.nullable(
          data.subcategories,
          json.array(_, fn(_) { panic as "object in array" }),
        ),
      )
    ],
  )
}

pub fn subscription_decoder() {
  use payment_method_id <- decode.field("payment_method_id", decode.string)
  use vendor <- decode.field("vendor", decode.string)
  use created_at <- decode.field("created_at", decode.string)
  use plans <- decode.field(
    "plans",
    decode.list(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use subscription_number <- decode.field("subscription_number", decode.string)
  use start_date <- decode.field("start_date", decode.string)
  use account_id <- decode.field("account_id", decode.string)
  use grace_period_id <- decode.optional_field(
    "grace_period_id",
    None,
    decode.optional(decode.string),
  )
  use end_date <- decode.field("end_date", decode.string)
  use status <- decode.field("status", decode.string)
  use can_renew_now <- decode.field("can_renew_now", decode.bool)
  use disabled_at <- decode.optional_field(
    "disabled_at",
    None,
    decode.optional(decode.string),
  )
  use subscription_version <- decode.field("subscription_version", decode.float)
  use updated_at <- decode.field("updated_at", decode.string)
  use id <- decode.field("id", decode.string)
  use is_latest <- decode.field("is_latest", decode.bool)
  use auto_renew <- decode.field("auto_renew", decode.bool)
  decode.success(
    Subscription(
      payment_method_id: payment_method_id,
      vendor: vendor,
      created_at: created_at,
      plans: plans,
      subscription_number: subscription_number,
      start_date: start_date,
      account_id: account_id,
      grace_period_id: grace_period_id,
      end_date: end_date,
      status: status,
      can_renew_now: can_renew_now,
      disabled_at: disabled_at,
      subscription_version: subscription_version,
      updated_at: updated_at,
      id: id,
      is_latest: is_latest,
      auto_renew: auto_renew,
    ),
  )
}

pub fn subscription_encode(data: Subscription) {
  json.object(
    [
      #("payment_method_id", json.string(data.payment_method_id)),
      #("vendor", json.string(data.vendor)),
      #("created_at", json.string(data.created_at)),
      #("plans", json.array(_, fn(_) { panic as "object in array" })(data.plans)),
      #("subscription_number", json.string(data.subscription_number)),
      #("start_date", json.string(data.start_date)),
      #("account_id", json.string(data.account_id)),
      #("grace_period_id", json.nullable(data.grace_period_id, json.string)),
      #("end_date", json.string(data.end_date)),
      #("status", json.string(data.status)),
      #("can_renew_now", json.bool(data.can_renew_now)),
      #("disabled_at", json.nullable(data.disabled_at, json.string)),
      #("subscription_version", json.float(data.subscription_version)),
      #("updated_at", json.string(data.updated_at)),
      #("id", json.string(data.id)),
      #("is_latest", json.bool(data.is_latest)),
      #("auto_renew", json.bool(data.auto_renew))
    ],
  )
}

pub fn event_session_status_decoder() {
  use archive <- decode.field(
    "archive",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use stream_mode <- decode.field("stream_mode", decode.string)
  use ingest <- decode.field(
    "ingest",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.string),
  )
  use can_manage <- decode.field("can_manage", decode.bool)
  use metering <- decode.field(
    "metering",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use id <- decode.field("id", decode.float)
  decode.success(
    EventSessionStatus(
      archive: archive,
      stream_mode: stream_mode,
      ingest: ingest,
      status: status,
      can_manage: can_manage,
      metering: metering,
      id: id,
    ),
  )
}

pub fn event_session_status_encode(data: EventSessionStatus) {
  json.object(
    [
      #(
        "archive",
        fn(_) { panic as "Literal object inside field" }(data.archive),
      ),
      #("stream_mode", json.string(data.stream_mode)),
      #("ingest", fn(_) { panic as "Literal object inside field" }(data.ingest)),
      #("status", json.nullable(data.status, json.string)),
      #("can_manage", json.bool(data.can_manage)),
      #(
        "metering",
        fn(_) { panic as "Literal object inside field" }(data.metering),
      ),
      #("id", json.float(data.id))
    ],
  )
}

pub fn event_destination_decoder() {
  use stream_key <- decode.optional_field(
    "stream_key",
    None,
    decode.optional(decode.string),
  )
  use provider_user_id <- decode.optional_field(
    "provider_user_id",
    None,
    decode.optional(decode.string),
  )
  use scheduled_at <- decode.optional_field(
    "scheduled_at",
    None,
    decode.optional(decode.float),
  )
  use provider_broadcast_id <- decode.optional_field(
    "provider_broadcast_id",
    None,
    decode.optional(decode.string),
  )
  use privacy <- decode.optional_field(
    "privacy",
    None,
    decode.optional(decode.string),
  )
  use display_name <- decode.field("display_name", decode.string)
  use is_enabled <- decode.field("is_enabled", decode.bool)
  use provider_video_id <- decode.optional_field(
    "provider_video_id",
    None,
    decode.optional(decode.string),
  )
  use user_id <- decode.field("user_id", decode.float)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use stream_url <- decode.optional_field(
    "stream_url",
    None,
    decode.optional(decode.string),
  )
  use state <- decode.field("state", decode.string)
  use service_name <- decode.field("service_name", decode.string)
  use live_clip_id <- decode.field("live_clip_id", decode.float)
  use state_message <- decode.optional_field(
    "state_message",
    None,
    decode.optional(decode.string),
  )
  use provider_destination_id <- decode.optional_field(
    "provider_destination_id",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.field("type", decode.string)
  use id <- decode.field("id", decode.float)
  decode.success(
    EventDestination(
      stream_key: stream_key,
      provider_user_id: provider_user_id,
      scheduled_at: scheduled_at,
      provider_broadcast_id: provider_broadcast_id,
      privacy: privacy,
      display_name: display_name,
      is_enabled: is_enabled,
      provider_video_id: provider_video_id,
      user_id: user_id,
      metadata: metadata,
      stream_url: stream_url,
      state: state,
      service_name: service_name,
      live_clip_id: live_clip_id,
      state_message: state_message,
      provider_destination_id: provider_destination_id,
      type_: type_,
      id: id,
    ),
  )
}

pub fn event_destination_encode(data: EventDestination) {
  json.object(
    [
      #("stream_key", json.nullable(data.stream_key, json.string)),
      #("provider_user_id", json.nullable(data.provider_user_id, json.string)),
      #("scheduled_at", json.nullable(data.scheduled_at, json.float)),
      #(
        "provider_broadcast_id",
        json.nullable(data.provider_broadcast_id, json.string),
      ),
      #("privacy", json.nullable(data.privacy, json.string)),
      #("display_name", json.string(data.display_name)),
      #("is_enabled", json.bool(data.is_enabled)),
      #("provider_video_id", json.nullable(data.provider_video_id, json.string)),
      #("user_id", json.float(data.user_id)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("stream_url", json.nullable(data.stream_url, json.string)),
      #("state", json.string(data.state)),
      #("service_name", json.string(data.service_name)),
      #("live_clip_id", json.float(data.live_clip_id)),
      #("state_message", json.nullable(data.state_message, json.string)),
      #(
        "provider_destination_id",
        json.nullable(data.provider_destination_id, json.string),
      ),
      #("type", json.string(data.type_)),
      #("id", json.float(data.id))
    ],
  )
}

pub fn video_decoder() {
  use license <- decode.field("license", decode.string)
  use is_free <- decode.optional_field(
    "is_free",
    None,
    decode.optional(decode.bool),
  )
  use edit_session <- decode.optional_field(
    "edit_session",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use upload <- decode.optional_field(
    "upload",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use app <- decode.field(
    "app",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use custom_url <- decode.optional_field(
    "custom_url",
    None,
    decode.optional(decode.string),
  )
  use show_svv_footer_banner <- decode.field(
    "show_svv_footer_banner",
    decode.bool,
  )
  use content_rating <- decode.field(
    "content_rating",
    decode.list(decode.string),
  )
  use parent_folder <- decode.optional_field(
    "parent_folder",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use is_playable <- decode.field("is_playable", decode.bool)
  use modified_time <- decode.field("modified_time", decode.string)
  use version_transcode_status <- decode.field(
    "version_transcode_status",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use spatial <- decode.optional_field(
    "spatial",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use created_time <- decode.field("created_time", decode.string)
  use release_time <- decode.field("release_time", decode.string)
  use width <- decode.field("width", decode.float)
  use height <- decode.field("height", decode.float)
  use download <- decode.optional_field(
    "download",
    None,
    decode.optional(decode.list(video_file_decoder())),
  )
  use origin_variable_frame_resolution <- decode.optional_field(
    "origin_variable_frame_resolution",
    None,
    decode.optional(decode.bool),
  )
  use privacy <- decode.field(
    "privacy",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use is_copyright_restricted <- decode.field(
    "is_copyright_restricted",
    decode.bool,
  )
  use files_size <- decode.field(
    "files_size",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use rating_mod_locked <- decode.field("rating_mod_locked", decode.bool)
  use vod <- decode.optional_field(
    "vod",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use has_chapters <- decode.field("has_chapters", decode.bool)
  use name <- decode.field("name", decode.string)
  use player_embed_url <- decode.field("player_embed_url", decode.string)
  use user <- decode.field(
    "user",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use uri <- decode.field("uri", decode.string)
  use uses_drm <- decode.field("uses_drm", decode.bool)
  use description_html <- decode.field("description_html", decode.string)
  use uploader <- decode.field(
    "uploader",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use resource_key <- decode.field("resource_key", decode.string)
  use allowed_privacies <- decode.optional_field(
    "allowed_privacies",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use context <- decode.field(
    "context",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use page <- decode.optional_field(
    "page",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use last_user_action_event_date <- decode.optional_field(
    "last_user_action_event_date",
    None,
    decode.optional(decode.string),
  )
  use has_audio <- decode.field("has_audio", decode.bool)
  use status <- decode.field("status", decode.string)
  use can_move_to_project <- decode.field("can_move_to_project", decode.bool)
  use show_review_page <- decode.field("show_review_page", decode.bool)
  use duration <- decode.field("duration", decode.float)
  use manage_link <- decode.optional_field(
    "manage_link",
    None,
    decode.optional(decode.string),
  )
  use play <- decode.optional_field(
    "play",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use transcode <- decode.optional_field(
    "transcode",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use has_text_tracks <- decode.field("has_text_tracks", decode.bool)
  use pictures <- decode.field(
    "pictures",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use has_audio_tracks <- decode.field("has_audio_tracks", decode.bool)
  use transcript <- decode.field(
    "transcript",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use show_svv_timecoded_comments <- decode.field(
    "show_svv_timecoded_comments",
    decode.bool,
  )
  use files <- decode.optional_field(
    "files",
    None,
    decode.optional(decode.list(video_file_decoder())),
  )
  use language <- decode.optional_field(
    "language",
    None,
    decode.optional(decode.string),
  )
  use tags <- decode.field("tags", decode.list(tag_decoder()))
  use review_status <- decode.optional_field(
    "review_status",
    None,
    decode.optional(decode.string),
  )
  use embed <- decode.field(
    "embed",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  use link <- decode.field("link", decode.string)
  use password <- decode.optional_field(
    "password",
    None,
    decode.optional(decode.string),
  )
  use categories <- decode.field("categories", decode.list(category_decoder()))
  use content_rating_class <- decode.field("content_rating_class", decode.string)
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use has_interactive <- decode.optional_field(
    "has_interactive",
    None,
    decode.optional(decode.bool),
  )
  use stats <- decode.field(
    "stats",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use description_rich <- decode.optional_field(
    "description_rich",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    Video(
      license: license,
      is_free: is_free,
      edit_session: edit_session,
      upload: upload,
      app: app,
      custom_url: custom_url,
      show_svv_footer_banner: show_svv_footer_banner,
      content_rating: content_rating,
      parent_folder: parent_folder,
      is_playable: is_playable,
      modified_time: modified_time,
      version_transcode_status: version_transcode_status,
      spatial: spatial,
      created_time: created_time,
      release_time: release_time,
      width: width,
      height: height,
      download: download,
      origin_variable_frame_resolution: origin_variable_frame_resolution,
      privacy: privacy,
      is_copyright_restricted: is_copyright_restricted,
      files_size: files_size,
      rating_mod_locked: rating_mod_locked,
      vod: vod,
      has_chapters: has_chapters,
      name: name,
      player_embed_url: player_embed_url,
      user: user,
      uri: uri,
      uses_drm: uses_drm,
      description_html: description_html,
      uploader: uploader,
      resource_key: resource_key,
      allowed_privacies: allowed_privacies,
      context: context,
      page: page,
      metadata: metadata,
      last_user_action_event_date: last_user_action_event_date,
      has_audio: has_audio,
      status: status,
      can_move_to_project: can_move_to_project,
      show_review_page: show_review_page,
      duration: duration,
      manage_link: manage_link,
      play: play,
      transcode: transcode,
      has_text_tracks: has_text_tracks,
      pictures: pictures,
      has_audio_tracks: has_audio_tracks,
      transcript: transcript,
      show_svv_timecoded_comments: show_svv_timecoded_comments,
      files: files,
      language: language,
      tags: tags,
      review_status: review_status,
      embed: embed,
      type_: type_,
      link: link,
      password: password,
      categories: categories,
      content_rating_class: content_rating_class,
      description: description,
      has_interactive: has_interactive,
      stats: stats,
      description_rich: description_rich,
    ),
  )
}

pub fn video_encode(data: Video) {
  json.object(
    [
      #("license", json.string(data.license)),
      #("is_free", json.nullable(data.is_free, json.bool)),
      #(
        "edit_session",
        json.nullable(data.edit_session, fn(_) { panic as "AllOf inside field" }),
      ),
      #(
        "upload",
        json.nullable(
          data.upload,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #("app", fn(_) { panic as "AllOf inside field" }(data.app)),
      #("custom_url", json.nullable(data.custom_url, json.string)),
      #("show_svv_footer_banner", json.bool(data.show_svv_footer_banner)),
      #("content_rating", json.array(_, json.string)(data.content_rating)),
      #(
        "parent_folder",
        json.nullable(
          data.parent_folder,
          fn(_) { panic as "AllOf inside field" },
        ),
      ),
      #("is_playable", json.bool(data.is_playable)),
      #("modified_time", json.string(data.modified_time)),
      #(
        "version_transcode_status",
        fn(_) { panic as "AllOf inside field" }(data.version_transcode_status),
      ),
      #(
        "spatial",
        json.nullable(
          data.spatial,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #("created_time", json.string(data.created_time)),
      #("release_time", json.string(data.release_time)),
      #("width", json.float(data.width)),
      #("height", json.float(data.height)),
      #(
        "download",
        json.nullable(data.download, json.array(_, video_file_encode)),
      ),
      #(
        "origin_variable_frame_resolution",
        json.nullable(data.origin_variable_frame_resolution, json.bool),
      ),
      #(
        "privacy",
        fn(_) { panic as "Literal object inside field" }(data.privacy),
      ),
      #("is_copyright_restricted", json.bool(data.is_copyright_restricted)),
      #("files_size", fn(_) { panic as "AllOf inside field" }(data.files_size)),
      #("rating_mod_locked", json.bool(data.rating_mod_locked)),
      #(
        "vod",
        json.nullable(data.vod, fn(_) { panic as "Literal object inside field" }),
      ),
      #("has_chapters", json.bool(data.has_chapters)),
      #("name", json.string(data.name)),
      #("player_embed_url", json.string(data.player_embed_url)),
      #("user", fn(_) { panic as "AllOf inside field" }(data.user)),
      #("uri", json.string(data.uri)),
      #("uses_drm", json.bool(data.uses_drm)),
      #("description_html", json.string(data.description_html)),
      #(
        "uploader",
        fn(_) { panic as "Literal object inside field" }(data.uploader),
      ),
      #("resource_key", json.string(data.resource_key)),
      #(
        "allowed_privacies",
        json.nullable(data.allowed_privacies, json.array(_, json.string)),
      ),
      #(
        "context",
        fn(_) { panic as "Literal object inside field" }(data.context),
      ),
      #(
        "page",
        json.nullable(data.page, fn(_) { panic as "AllOf inside field" }),
      ),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #(
        "last_user_action_event_date",
        json.nullable(data.last_user_action_event_date, json.string),
      ),
      #("has_audio", json.bool(data.has_audio)),
      #("status", json.string(data.status)),
      #("can_move_to_project", json.bool(data.can_move_to_project)),
      #("show_review_page", json.bool(data.show_review_page)),
      #("duration", json.float(data.duration)),
      #("manage_link", json.nullable(data.manage_link, json.string)),
      #(
        "play",
        json.nullable(data.play, fn(_) { panic as "AllOf inside field" }),
      ),
      #(
        "transcode",
        json.nullable(
          data.transcode,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #("has_text_tracks", json.bool(data.has_text_tracks)),
      #("pictures", fn(_) { panic as "AllOf inside field" }(data.pictures)),
      #("has_audio_tracks", json.bool(data.has_audio_tracks)),
      #(
        "transcript",
        fn(_) { panic as "Literal object inside field" }(data.transcript),
      ),
      #(
        "show_svv_timecoded_comments",
        json.bool(data.show_svv_timecoded_comments),
      ),
      #("files", json.nullable(data.files, json.array(_, video_file_encode))),
      #("language", json.nullable(data.language, json.string)),
      #("tags", json.array(_, tag_encode)(data.tags)),
      #("review_status", json.nullable(data.review_status, json.string)),
      #("embed", fn(_) { panic as "AllOf inside field" }(data.embed)),
      #("type", json.string(data.type_)),
      #("link", json.string(data.link)),
      #("password", json.nullable(data.password, json.string)),
      #("categories", json.array(_, category_encode)(data.categories)),
      #("content_rating_class", json.string(data.content_rating_class)),
      #("description", json.nullable(data.description, json.string)),
      #("has_interactive", json.nullable(data.has_interactive, json.bool)),
      #("stats", fn(_) { panic as "Literal object inside field" }(data.stats)),
      #("description_rich", json.nullable(data.description_rich, json.string))
    ],
  )
}

pub fn tag_decoder() {
  use name <- decode.field("name", decode.string)
  use uri <- decode.field("uri", decode.string)
  use resource_key <- decode.field("resource_key", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use canonical <- decode.field("canonical", decode.string)
  decode.success(
    Tag(
      name: name,
      uri: uri,
      resource_key: resource_key,
      metadata: metadata,
      canonical: canonical,
    ),
  )
}

pub fn tag_encode(data: Tag) {
  json.object(
    [
      #("name", json.string(data.name)),
      #("uri", json.string(data.uri)),
      #("resource_key", json.string(data.resource_key)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("canonical", json.string(data.canonical))
    ],
  )
}

pub fn event_decoder() {
  use stream_key <- decode.optional_field(
    "stream_key",
    None,
    decode.optional(decode.string),
  )
  use dvr <- decode.field("dvr", decode.bool)
  use from_showcase <- decode.field("from_showcase", decode.bool)
  use stream_mode <- decode.field("stream_mode", decode.string)
  use preferred_stream_method <- decode.field(
    "preferred_stream_method",
    decode.string,
  )
  use content_rating <- decode.field(
    "content_rating",
    decode.list(decode.string),
  )
  use parent_folder <- decode.field(
    "parent_folder",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use automatically_title_stream <- decode.field(
    "automatically_title_stream",
    decode.bool,
  )
  use srt_link <- decode.optional_field(
    "srt_link",
    None,
    decode.optional(decode.string),
  )
  use created_time <- decode.field("created_time", decode.string)
  use disable_auto_archiving <- decode.field(
    "disable_auto_archiving",
    decode.bool,
  )
  use auto_cc_remaining <- decode.optional_field(
    "auto_cc_remaining",
    None,
    decode.optional(decode.float),
  )
  use auto_cc_language <- decode.optional_field(
    "auto_cc_language",
    None,
    decode.optional(decode.string),
  )
  use stream_privacy <- decode.field(
    "stream_privacy",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use webinar <- decode.optional_field(
    "webinar",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use venue_uuid <- decode.optional_field(
    "venue_uuid",
    None,
    decode.optional(decode.string),
  )
  use user <- decode.field(
    "user",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use rtmps_link <- decode.optional_field(
    "rtmps_link",
    None,
    decode.optional(decode.string),
  )
  use playlist_sort <- decode.field("playlist_sort", decode.string)
  use uri <- decode.field("uri", decode.string)
  use scheduled_playback <- decode.field("scheduled_playback", decode.bool)
  use rtmp_preview <- decode.field("rtmp_preview", decode.bool)
  use allowed_privacies <- decode.field(
    "allowed_privacies",
    decode.list(decode.string),
  )
  use head_clip <- decode.optional_field(
    "head_clip",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use album <- decode.optional_field(
    "album",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use next_occurrence_time <- decode.optional_field(
    "next_occurrence_time",
    None,
    decode.optional(decode.string),
  )
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use live_clips <- decode.field("live_clips", decode.list(decode.string))
  use allow_share_link <- decode.field("allow_share_link", decode.bool)
  use auto_cc_enabled <- decode.optional_field(
    "auto_cc_enabled",
    None,
    decode.optional(decode.bool),
  )
  use unlimited_duration <- decode.field("unlimited_duration", decode.bool)
  use unlimited_auto_cc <- decode.optional_field(
    "unlimited_auto_cc",
    None,
    decode.optional(decode.bool),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.string),
  )
  use completed_on <- decode.field("completed_on", decode.string)
  use low_latency <- decode.field("low_latency", decode.bool)
  use rtmp_link <- decode.optional_field(
    "rtmp_link",
    None,
    decode.optional(decode.string),
  )
  use view_link <- decode.field("view_link", decode.string)
  use interaction_tools_settings <- decode.optional_field(
    "interaction_tools_settings",
    None,
    decode.optional(
      decode.list(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
    ),
  )
  use email_quota <- decode.field(
    "email_quota",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use streaming_auto_stop <- decode.field("streaming_auto_stop", decode.bool)
  use from_webinar <- decode.optional_field(
    "from_webinar",
    None,
    decode.optional(decode.bool),
  )
  use pictures <- decode.field(
    "pictures",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use streamable_clip <- decode.optional_field(
    "streamable_clip",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use whitelisted_domains <- decode.optional_field(
    "whitelisted_domains",
    None,
    decode.optional(
      decode.list(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
    ),
  )
  use settings_link <- decode.field("settings_link", decode.string)
  use schedule <- decode.field(
    "schedule",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use title <- decode.field("title", decode.string)
  use live_destinations <- decode.optional_field(
    "live_destinations",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use stream_title <- decode.field("stream_title", decode.string)
  use auto_cc_keywords <- decode.optional_field(
    "auto_cc_keywords",
    None,
    decode.optional(decode.string),
  )
  use embed <- decode.field(
    "embed",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use stream_password <- decode.optional_field(
    "stream_password",
    None,
    decode.optional(decode.string),
  )
  use chat_enabled <- decode.field("chat_enabled", decode.bool)
  use link <- decode.field("link", decode.string)
  use stream_description <- decode.optional_field(
    "stream_description",
    None,
    decode.optional(decode.string),
  )
  use latency <- decode.field("latency", decode.string)
  use time_zone <- decode.field("time_zone", decode.string)
  use lead_uuid <- decode.field("lead_uuid", decode.string)
  use event_type <- decode.field("event_type", decode.string)
  decode.success(
    Event(
      stream_key: stream_key,
      dvr: dvr,
      from_showcase: from_showcase,
      stream_mode: stream_mode,
      preferred_stream_method: preferred_stream_method,
      content_rating: content_rating,
      parent_folder: parent_folder,
      automatically_title_stream: automatically_title_stream,
      srt_link: srt_link,
      created_time: created_time,
      disable_auto_archiving: disable_auto_archiving,
      auto_cc_remaining: auto_cc_remaining,
      auto_cc_language: auto_cc_language,
      stream_privacy: stream_privacy,
      webinar: webinar,
      venue_uuid: venue_uuid,
      user: user,
      rtmps_link: rtmps_link,
      playlist_sort: playlist_sort,
      uri: uri,
      scheduled_playback: scheduled_playback,
      rtmp_preview: rtmp_preview,
      allowed_privacies: allowed_privacies,
      head_clip: head_clip,
      album: album,
      next_occurrence_time: next_occurrence_time,
      metadata: metadata,
      live_clips: live_clips,
      allow_share_link: allow_share_link,
      auto_cc_enabled: auto_cc_enabled,
      unlimited_duration: unlimited_duration,
      unlimited_auto_cc: unlimited_auto_cc,
      status: status,
      completed_on: completed_on,
      low_latency: low_latency,
      rtmp_link: rtmp_link,
      view_link: view_link,
      interaction_tools_settings: interaction_tools_settings,
      email_quota: email_quota,
      streaming_auto_stop: streaming_auto_stop,
      from_webinar: from_webinar,
      pictures: pictures,
      streamable_clip: streamable_clip,
      whitelisted_domains: whitelisted_domains,
      settings_link: settings_link,
      schedule: schedule,
      title: title,
      live_destinations: live_destinations,
      stream_title: stream_title,
      auto_cc_keywords: auto_cc_keywords,
      embed: embed,
      stream_password: stream_password,
      chat_enabled: chat_enabled,
      link: link,
      stream_description: stream_description,
      latency: latency,
      time_zone: time_zone,
      lead_uuid: lead_uuid,
      event_type: event_type,
    ),
  )
}

pub fn event_encode(data: Event) {
  json.object(
    [
      #("stream_key", json.nullable(data.stream_key, json.string)),
      #("dvr", json.bool(data.dvr)),
      #("from_showcase", json.bool(data.from_showcase)),
      #("stream_mode", json.string(data.stream_mode)),
      #("preferred_stream_method", json.string(data.preferred_stream_method)),
      #("content_rating", json.array(_, json.string)(data.content_rating)),
      #(
        "parent_folder",
        fn(_) { panic as "AllOf inside field" }(data.parent_folder),
      ),
      #("automatically_title_stream", json.bool(data.automatically_title_stream)),
      #("srt_link", json.nullable(data.srt_link, json.string)),
      #("created_time", json.string(data.created_time)),
      #("disable_auto_archiving", json.bool(data.disable_auto_archiving)),
      #("auto_cc_remaining", json.nullable(data.auto_cc_remaining, json.float)),
      #("auto_cc_language", json.nullable(data.auto_cc_language, json.string)),
      #(
        "stream_privacy",
        fn(_) { panic as "Literal object inside field" }(data.stream_privacy),
      ),
      #("webinar", json.nullable(data.webinar, json.array(_, json.string))),
      #("venue_uuid", json.nullable(data.venue_uuid, json.string)),
      #("user", fn(_) { panic as "AllOf inside field" }(data.user)),
      #("rtmps_link", json.nullable(data.rtmps_link, json.string)),
      #("playlist_sort", json.string(data.playlist_sort)),
      #("uri", json.string(data.uri)),
      #("scheduled_playback", json.bool(data.scheduled_playback)),
      #("rtmp_preview", json.bool(data.rtmp_preview)),
      #("allowed_privacies", json.array(_, json.string)(data.allowed_privacies)),
      #(
        "head_clip",
        json.nullable(
          data.head_clip,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #(
        "album",
        json.nullable(
          data.album,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #(
        "next_occurrence_time",
        json.nullable(data.next_occurrence_time, json.string),
      ),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("live_clips", json.array(_, json.string)(data.live_clips)),
      #("allow_share_link", json.bool(data.allow_share_link)),
      #("auto_cc_enabled", json.nullable(data.auto_cc_enabled, json.bool)),
      #("unlimited_duration", json.bool(data.unlimited_duration)),
      #("unlimited_auto_cc", json.nullable(data.unlimited_auto_cc, json.bool)),
      #("status", json.nullable(data.status, json.string)),
      #("completed_on", json.string(data.completed_on)),
      #("low_latency", json.bool(data.low_latency)),
      #("rtmp_link", json.nullable(data.rtmp_link, json.string)),
      #("view_link", json.string(data.view_link)),
      #(
        "interaction_tools_settings",
        json.nullable(
          data.interaction_tools_settings,
          json.array(_, fn(_) { panic as "object in array" }),
        ),
      ),
      #(
        "email_quota",
        fn(_) { panic as "Literal object inside field" }(data.email_quota),
      ),
      #("streaming_auto_stop", json.bool(data.streaming_auto_stop)),
      #("from_webinar", json.nullable(data.from_webinar, json.bool)),
      #("pictures", fn(_) { panic as "AllOf inside field" }(data.pictures)),
      #(
        "streamable_clip",
        json.nullable(
          data.streamable_clip,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #(
        "whitelisted_domains",
        json.nullable(
          data.whitelisted_domains,
          json.array(_, fn(_) { panic as "object in array" }),
        ),
      ),
      #("settings_link", json.string(data.settings_link)),
      #("schedule", fn(_) { panic as "AllOf inside field" }(data.schedule)),
      #("title", json.string(data.title)),
      #(
        "live_destinations",
        json.nullable(data.live_destinations, json.array(_, json.string)),
      ),
      #("stream_title", json.string(data.stream_title)),
      #("auto_cc_keywords", json.nullable(data.auto_cc_keywords, json.string)),
      #("embed", fn(_) { panic as "Literal object inside field" }(data.embed)),
      #("stream_password", json.nullable(data.stream_password, json.string)),
      #("chat_enabled", json.bool(data.chat_enabled)),
      #("link", json.string(data.link)),
      #(
        "stream_description",
        json.nullable(data.stream_description, json.string),
      ),
      #("latency", json.string(data.latency)),
      #("time_zone", json.string(data.time_zone)),
      #("lead_uuid", json.string(data.lead_uuid)),
      #("event_type", json.string(data.event_type))
    ],
  )
}

pub fn subscription_plans_decoder() {
  use discount <- decode.field(
    "discount",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use tier <- decode.field("tier", decode.string)
  use promotion <- decode.field(
    "promotion",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use price <- decode.field(
    "price",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use name <- decode.field("name", decode.string)
  use uri <- decode.field("uri", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use currency <- decode.field(
    "currency",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use id <- decode.field(
    "id",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  decode.success(
    SubscriptionPlans(
      discount: discount,
      tier: tier,
      promotion: promotion,
      price: price,
      name: name,
      uri: uri,
      metadata: metadata,
      currency: currency,
      id: id,
    ),
  )
}

pub fn subscription_plans_encode(data: SubscriptionPlans) {
  json.object(
    [
      #(
        "discount",
        fn(_) { panic as "Literal object inside field" }(data.discount),
      ),
      #("tier", json.string(data.tier)),
      #(
        "promotion",
        fn(_) { panic as "Literal object inside field" }(data.promotion),
      ),
      #("price", fn(_) { panic as "Literal object inside field" }(data.price)),
      #("name", json.string(data.name)),
      #("uri", json.string(data.uri)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #(
        "currency",
        fn(_) { panic as "Literal object inside field" }(data.currency),
      ),
      #("id", fn(_) { panic as "Literal object inside field" }(data.id))
    ],
  )
}

pub fn project_decoder() {
  use access_grant <- decode.field(
    "access_grant",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use settings <- decode.field(
    "settings",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use modified_time <- decode.field("modified_time", decode.string)
  use created_time <- decode.field("created_time", decode.string)
  use pinned_on <- decode.optional_field(
    "pinned_on",
    None,
    decode.optional(decode.string),
  )
  use privacy <- decode.field(
    "privacy",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use has_subfolder <- decode.field("has_subfolder", decode.bool)
  use name <- decode.field("name", decode.string)
  use user <- decode.field(
    "user",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use uri <- decode.field("uri", decode.string)
  use is_pinned <- decode.field("is_pinned", decode.bool)
  use resource_key <- decode.field("resource_key", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use last_user_action_event_date <- decode.optional_field(
    "last_user_action_event_date",
    None,
    decode.optional(decode.string),
  )
  use manage_link <- decode.field("manage_link", decode.string)
  use creator_uri <- decode.field("creator_uri", decode.string)
  use link <- decode.field("link", decode.string)
  use should_show_team_library_notification <- decode.field(
    "should_show_team_library_notification",
    decode.bool,
  )
  use is_private_to_user <- decode.field("is_private_to_user", decode.bool)
  decode.success(
    Project(
      access_grant: access_grant,
      settings: settings,
      modified_time: modified_time,
      created_time: created_time,
      pinned_on: pinned_on,
      privacy: privacy,
      has_subfolder: has_subfolder,
      name: name,
      user: user,
      uri: uri,
      is_pinned: is_pinned,
      resource_key: resource_key,
      metadata: metadata,
      last_user_action_event_date: last_user_action_event_date,
      manage_link: manage_link,
      creator_uri: creator_uri,
      link: link,
      should_show_team_library_notification: should_show_team_library_notification,
      is_private_to_user: is_private_to_user,
    ),
  )
}

pub fn project_encode(data: Project) {
  json.object(
    [
      #(
        "access_grant",
        fn(_) { panic as "Literal object inside field" }(data.access_grant),
      ),
      #(
        "settings",
        fn(_) { panic as "Literal object inside field" }(data.settings),
      ),
      #("modified_time", json.string(data.modified_time)),
      #("created_time", json.string(data.created_time)),
      #("pinned_on", json.nullable(data.pinned_on, json.string)),
      #(
        "privacy",
        fn(_) { panic as "Literal object inside field" }(data.privacy),
      ),
      #("has_subfolder", json.bool(data.has_subfolder)),
      #("name", json.string(data.name)),
      #("user", fn(_) { panic as "AllOf inside field" }(data.user)),
      #("uri", json.string(data.uri)),
      #("is_pinned", json.bool(data.is_pinned)),
      #("resource_key", json.string(data.resource_key)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #(
        "last_user_action_event_date",
        json.nullable(data.last_user_action_event_date, json.string),
      ),
      #("manage_link", json.string(data.manage_link)),
      #("creator_uri", json.string(data.creator_uri)),
      #("link", json.string(data.link)),
      #(
        "should_show_team_library_notification",
        json.bool(data.should_show_team_library_notification),
      ),
      #("is_private_to_user", json.bool(data.is_private_to_user))
    ],
  )
}

pub fn credit_decoder() {
  use name <- decode.field("name", decode.string)
  use user <- decode.optional_field(
    "user",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use uri <- decode.field("uri", decode.string)
  use role <- decode.field("role", decode.string)
  use video <- decode.optional_field(
    "video",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  decode.success(
    Credit(name: name, user: user, uri: uri, role: role, video: video),
  )
}

pub fn credit_encode(data: Credit) {
  json.object(
    [
      #("name", json.string(data.name)),
      #(
        "user",
        json.nullable(data.user, fn(_) { panic as "AllOf inside field" }),
      ),
      #("uri", json.string(data.uri)),
      #("role", json.string(data.role)),
      #(
        "video",
        json.nullable(data.video, fn(_) { panic as "AllOf inside field" }),
      )
    ],
  )
}

pub fn activity_3_one_decoder() {
  use channel <- decode.optional_field(
    "channel",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use user <- decode.optional_field(
    "user",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use time <- decode.field("time", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use clip <- decode.field(
    "clip",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  use tag <- decode.optional_field(
    "tag",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use category <- decode.optional_field(
    "category",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use group <- decode.optional_field(
    "group",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  decode.success(
    Activity31(
      channel: channel,
      user: user,
      time: time,
      metadata: metadata,
      clip: clip,
      type_: type_,
      tag: tag,
      category: category,
      group: group,
    ),
  )
}

pub fn activity_3_one_encode(data: Activity31) {
  json.object(
    [
      #(
        "channel",
        json.nullable(data.channel, fn(_) { panic as "AllOf inside field" }),
      ),
      #(
        "user",
        json.nullable(data.user, fn(_) { panic as "AllOf inside field" }),
      ),
      #("time", json.string(data.time)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("clip", fn(_) { panic as "AllOf inside field" }(data.clip)),
      #("type", json.string(data.type_)),
      #("tag", json.nullable(data.tag, fn(_) { panic as "AllOf inside field" })),
      #(
        "category",
        json.nullable(data.category, fn(_) { panic as "AllOf inside field" }),
      ),
      #(
        "group",
        json.nullable(data.group, fn(_) { panic as "AllOf inside field" }),
      )
    ],
  )
}

pub fn trimmed_video_decoder() {
  use start <- decode.field("start", decode.string)
  use clip_id <- decode.field("clip_id", decode.float)
  use uri <- decode.field("uri", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use modified_on <- decode.optional_field(
    "modified_on",
    None,
    decode.optional(decode.string),
  )
  use created_on <- decode.field("created_on", decode.string)
  use version_quality <- decode.field("version_quality", decode.string)
  use created_version_id <- decode.field("created_version_id", decode.string)
  use end <- decode.field("end", decode.string)
  use root_version_id <- decode.field("root_version_id", decode.string)
  use is_clip_finished_transcoding <- decode.field(
    "is_clip_finished_transcoding",
    decode.bool,
  )
  decode.success(
    TrimmedVideo(
      start: start,
      clip_id: clip_id,
      uri: uri,
      metadata: metadata,
      modified_on: modified_on,
      created_on: created_on,
      version_quality: version_quality,
      created_version_id: created_version_id,
      end: end,
      root_version_id: root_version_id,
      is_clip_finished_transcoding: is_clip_finished_transcoding,
    ),
  )
}

pub fn trimmed_video_encode(data: TrimmedVideo) {
  json.object(
    [
      #("start", json.string(data.start)),
      #("clip_id", json.float(data.clip_id)),
      #("uri", json.string(data.uri)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("modified_on", json.nullable(data.modified_on, json.string)),
      #("created_on", json.string(data.created_on)),
      #("version_quality", json.string(data.version_quality)),
      #("created_version_id", json.string(data.created_version_id)),
      #("end", json.string(data.end)),
      #("root_version_id", json.string(data.root_version_id)),
      #(
        "is_clip_finished_transcoding",
        json.bool(data.is_clip_finished_transcoding),
      )
    ],
  )
}

pub fn language_decoder() {
  use name <- decode.field("name", decode.string)
  use code <- decode.field("code", decode.string)
  decode.success(Language(name: name, code: code))
}

pub fn language_encode(data: Language) {
  json.object(
    [#("name", json.string(data.name)), #("code", json.string(data.code))],
  )
}

pub fn on_demand_season_decoder() {
  use position <- decode.field("position", decode.float)
  use name <- decode.field("name", decode.string)
  use user <- decode.field(
    "user",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use uri <- decode.field("uri", decode.string)
  use resource_key <- decode.field("resource_key", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  use description <- decode.field("description", decode.string)
  decode.success(
    OnDemandSeason(
      position: position,
      name: name,
      user: user,
      uri: uri,
      resource_key: resource_key,
      metadata: metadata,
      type_: type_,
      description: description,
    ),
  )
}

pub fn on_demand_season_encode(data: OnDemandSeason) {
  json.object(
    [
      #("position", json.float(data.position)),
      #("name", json.string(data.name)),
      #("user", fn(_) { panic as "AllOf inside field" }(data.user)),
      #("uri", json.string(data.uri)),
      #("resource_key", json.string(data.resource_key)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("type", json.string(data.type_)),
      #("description", json.string(data.description))
    ],
  )
}

pub fn embed_settings_decoder() {
  use closed_captions <- decode.field("closed_captions", decode.bool)
  use email_capture_form <- decode.field(
    "email_capture_form",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use buttons <- decode.field(
    "buttons",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use interactive <- decode.field("interactive", decode.bool)
  use color <- decode.field("color", decode.string)
  use cards <- decode.field(
    "cards",
    decode.list(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use chapters <- decode.field("chapters", decode.bool)
  use speed <- decode.field("speed", decode.bool)
  use logos <- decode.field(
    "logos",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use autopip <- decode.field("autopip", decode.bool)
  use html <- decode.optional_field("html", None, decode.optional(decode.string))
  use uri <- decode.optional_field("uri", None, decode.optional(decode.string))
  use outro_type <- decode.field("outro_type", decode.string)
  use ask_ai <- decode.field("ask_ai", decode.bool)
  use end_screen <- decode.field(
    "end_screen",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use badges <- decode.field(
    "badges",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use colors <- decode.field(
    "colors",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use audio_tracks <- decode.field("audio_tracks", decode.bool)
  use transcript <- decode.field("transcript", decode.bool)
  use pip <- decode.field("pip", decode.bool)
  use skipping_forward <- decode.field("skipping_forward", decode.bool)
  use title <- decode.field(
    "title",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use chromecast <- decode.field("chromecast", decode.bool)
  use volume <- decode.field("volume", decode.bool)
  use show_timezone <- decode.field("show_timezone", decode.bool)
  use event_schedule <- decode.field("event_schedule", decode.bool)
  use play_button <- decode.field(
    "play_button",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use has_cards <- decode.field("has_cards", decode.bool)
  use airplay <- decode.field("airplay", decode.bool)
  use playbar <- decode.field("playbar", decode.bool)
  use quality_selector <- decode.field("quality_selector", decode.bool)
  decode.success(
    EmbedSettings(
      closed_captions: closed_captions,
      email_capture_form: email_capture_form,
      buttons: buttons,
      interactive: interactive,
      color: color,
      cards: cards,
      chapters: chapters,
      speed: speed,
      logos: logos,
      autopip: autopip,
      html: html,
      uri: uri,
      outro_type: outro_type,
      ask_ai: ask_ai,
      end_screen: end_screen,
      badges: badges,
      colors: colors,
      audio_tracks: audio_tracks,
      transcript: transcript,
      pip: pip,
      skipping_forward: skipping_forward,
      title: title,
      chromecast: chromecast,
      volume: volume,
      show_timezone: show_timezone,
      event_schedule: event_schedule,
      play_button: play_button,
      has_cards: has_cards,
      airplay: airplay,
      playbar: playbar,
      quality_selector: quality_selector,
    ),
  )
}

pub fn embed_settings_encode(data: EmbedSettings) {
  json.object(
    [
      #("closed_captions", json.bool(data.closed_captions)),
      #(
        "email_capture_form",
        fn(_) { panic as "Literal object inside field" }(data.email_capture_form),
      ),
      #(
        "buttons",
        fn(_) { panic as "Literal object inside field" }(data.buttons),
      ),
      #("interactive", json.bool(data.interactive)),
      #("color", json.string(data.color)),
      #("cards", json.array(_, fn(_) { panic as "object in array" })(data.cards)),
      #("chapters", json.bool(data.chapters)),
      #("speed", json.bool(data.speed)),
      #("logos", fn(_) { panic as "Literal object inside field" }(data.logos)),
      #("autopip", json.bool(data.autopip)),
      #("html", json.nullable(data.html, json.string)),
      #("uri", json.nullable(data.uri, json.string)),
      #("outro_type", json.string(data.outro_type)),
      #("ask_ai", json.bool(data.ask_ai)),
      #(
        "end_screen",
        fn(_) { panic as "Literal object inside field" }(data.end_screen),
      ),
      #("badges", fn(_) { panic as "Literal object inside field" }(data.badges)),
      #("colors", fn(_) { panic as "Literal object inside field" }(data.colors)),
      #("audio_tracks", json.bool(data.audio_tracks)),
      #("transcript", json.bool(data.transcript)),
      #("pip", json.bool(data.pip)),
      #("skipping_forward", json.bool(data.skipping_forward)),
      #("title", fn(_) { panic as "Literal object inside field" }(data.title)),
      #("chromecast", json.bool(data.chromecast)),
      #("volume", json.bool(data.volume)),
      #("show_timezone", json.bool(data.show_timezone)),
      #("event_schedule", json.bool(data.event_schedule)),
      #(
        "play_button",
        fn(_) { panic as "Literal object inside field" }(data.play_button),
      ),
      #("has_cards", json.bool(data.has_cards)),
      #("airplay", json.bool(data.airplay)),
      #("playbar", json.bool(data.playbar)),
      #("quality_selector", json.bool(data.quality_selector))
    ],
  )
}

pub fn animated_thumbset_decoder() {
  use uri <- decode.field("uri", decode.string)
  use sizes <- decode.field("sizes", decode.list(animated_thumbnail_decoder()))
  use status <- decode.field("status", decode.string)
  use created_on <- decode.field("created_on", decode.string)
  use clip_uri <- decode.field("clip_uri", decode.string)
  decode.success(
    AnimatedThumbset(
      uri: uri,
      sizes: sizes,
      status: status,
      created_on: created_on,
      clip_uri: clip_uri,
    ),
  )
}

pub fn animated_thumbset_encode(data: AnimatedThumbset) {
  json.object(
    [
      #("uri", json.string(data.uri)),
      #("sizes", json.array(_, animated_thumbnail_encode)(data.sizes)),
      #("status", json.string(data.status)),
      #("created_on", json.string(data.created_on)),
      #("clip_uri", json.string(data.clip_uri))
    ],
  )
}

pub fn location_decoder() {
  use sub_locality <- decode.optional_field(
    "sub_locality",
    None,
    decode.optional(decode.string),
  )
  use city <- decode.optional_field("city", None, decode.optional(decode.string))
  use latitude <- decode.field("latitude", decode.float)
  use neighborhood <- decode.optional_field(
    "neighborhood",
    None,
    decode.optional(decode.string),
  )
  use longitude <- decode.field("longitude", decode.float)
  use country_iso_code <- decode.field("country_iso_code", decode.string)
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use formatted_address <- decode.field("formatted_address", decode.string)
  use state_iso_code <- decode.optional_field(
    "state_iso_code",
    None,
    decode.optional(decode.string),
  )
  use country <- decode.optional_field(
    "country",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    Location(
      sub_locality: sub_locality,
      city: city,
      latitude: latitude,
      neighborhood: neighborhood,
      longitude: longitude,
      country_iso_code: country_iso_code,
      state: state,
      formatted_address: formatted_address,
      state_iso_code: state_iso_code,
      country: country,
    ),
  )
}

pub fn location_encode(data: Location) {
  json.object(
    [
      #("sub_locality", json.nullable(data.sub_locality, json.string)),
      #("city", json.nullable(data.city, json.string)),
      #("latitude", json.float(data.latitude)),
      #("neighborhood", json.nullable(data.neighborhood, json.string)),
      #("longitude", json.float(data.longitude)),
      #("country_iso_code", json.string(data.country_iso_code)),
      #("state", json.nullable(data.state, json.string)),
      #("formatted_address", json.string(data.formatted_address)),
      #("state_iso_code", json.nullable(data.state_iso_code, json.string)),
      #("country", json.nullable(data.country, json.string))
    ],
  )
}

pub fn endpoint_decoder() {
  use path_ <- decode.field("path", decode.string)
  use methods <- decode.field("methods", decode.list(decode.string))
  decode.success(Endpoint(path_: path_, methods: methods))
}

pub fn endpoint_encode(data: Endpoint) {
  json.object(
    [
      #("path", json.string(data.path_)),
      #("methods", json.array(_, json.string)(data.methods))
    ],
  )
}

pub fn play_decoder() {
  use progressive <- decode.optional_field(
    "progressive",
    None,
    decode.optional(
      decode.list(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
    ),
  )
  use hls <- decode.optional_field(
    "hls",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use dash <- decode.optional_field(
    "dash",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use status <- decode.field("status", decode.string)
  use player_license_url <- decode.field("player_license_url", decode.string)
  use player_fairplay_certificate_url <- decode.field(
    "player_fairplay_certificate_url",
    decode.string,
  )
  decode.success(
    Play(
      progressive: progressive,
      hls: hls,
      dash: dash,
      status: status,
      player_license_url: player_license_url,
      player_fairplay_certificate_url: player_fairplay_certificate_url,
    ),
  )
}

pub fn play_encode(data: Play) {
  json.object(
    [
      #(
        "progressive",
        json.nullable(
          data.progressive,
          json.array(_, fn(_) { panic as "object in array" }),
        ),
      ),
      #("hls", json.nullable(data.hls, fn(_) { panic as "AllOf inside field" })),
      #(
        "dash",
        json.nullable(data.dash, fn(_) { panic as "AllOf inside field" }),
      ),
      #("status", json.string(data.status)),
      #("player_license_url", json.string(data.player_license_url)),
      #(
        "player_fairplay_certificate_url",
        json.string(data.player_fairplay_certificate_url),
      )
    ],
  )
}

pub fn segment_decoder() {
  use autogenerated <- decode.field("autogenerated", decode.bool)
  use enabled <- decode.field("enabled", decode.bool)
  use text_track_uri <- decode.field("text_track_uri", decode.string)
  use video_uri <- decode.optional_field(
    "video_uri",
    None,
    decode.optional(decode.string),
  )
  use words <- decode.field("words", decode.list(segment_words_decoder()))
  use cue_end <- decode.field("cue_end", decode.float)
  use kind <- decode.field("kind", decode.string)
  use cue_start <- decode.field("cue_start", decode.float)
  use language <- decode.field("language", decode.string)
  use id <- decode.field("id", decode.string)
  use lines <- decode.field("lines", decode.list(segment_line_decoder()))
  use speaker <- decode.optional_field(
    "speaker",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    Segment(
      autogenerated: autogenerated,
      enabled: enabled,
      text_track_uri: text_track_uri,
      video_uri: video_uri,
      words: words,
      cue_end: cue_end,
      kind: kind,
      cue_start: cue_start,
      language: language,
      id: id,
      lines: lines,
      speaker: speaker,
    ),
  )
}

pub fn segment_encode(data: Segment) {
  json.object(
    [
      #("autogenerated", json.bool(data.autogenerated)),
      #("enabled", json.bool(data.enabled)),
      #("text_track_uri", json.string(data.text_track_uri)),
      #("video_uri", json.nullable(data.video_uri, json.string)),
      #("words", json.array(_, segment_words_encode)(data.words)),
      #("cue_end", json.float(data.cue_end)),
      #("kind", json.string(data.kind)),
      #("cue_start", json.float(data.cue_start)),
      #("language", json.string(data.language)),
      #("id", json.string(data.id)),
      #("lines", json.array(_, segment_line_encode)(data.lines)),
      #("speaker", json.nullable(data.speaker, json.string))
    ],
  )
}

pub fn skill_decoder() {
  use name <- decode.field("name", decode.string)
  use uri <- decode.field("uri", decode.string)
  decode.success(Skill(name: name, uri: uri))
}

pub fn skill_encode(data: Skill) {
  json.object(
    [#("name", json.string(data.name)), #("uri", json.string(data.uri))],
  )
}

pub fn content_rating_decoder() {
  use name <- decode.field("name", decode.string)
  use uri <- decode.optional_field("uri", None, decode.optional(decode.string))
  use code <- decode.field("code", decode.string)
  decode.success(ContentRating(name: name, uri: uri, code: code))
}

pub fn content_rating_encode(data: ContentRating) {
  json.object(
    [
      #("name", json.string(data.name)),
      #("uri", json.nullable(data.uri, json.string)),
      #("code", json.string(data.code))
    ],
  )
}

pub fn permission_policy_decoder() {
  use display_name <- decode.field("display_name", decode.string)
  use name <- decode.field("name", decode.string)
  use uri <- decode.field("uri", decode.string)
  use permission_actions <- decode.field(
    "permission_actions",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use modified_on <- decode.optional_field(
    "modified_on",
    None,
    decode.optional(decode.string),
  )
  use created_on <- decode.field("created_on", decode.string)
  use display_description <- decode.field("display_description", decode.string)
  decode.success(
    PermissionPolicy(
      display_name: display_name,
      name: name,
      uri: uri,
      permission_actions: permission_actions,
      modified_on: modified_on,
      created_on: created_on,
      display_description: display_description,
    ),
  )
}

pub fn permission_policy_encode(data: PermissionPolicy) {
  json.object(
    [
      #("display_name", json.string(data.display_name)),
      #("name", json.string(data.name)),
      #("uri", json.string(data.uri)),
      #(
        "permission_actions",
        fn(_) { panic as "Literal object inside field" }(data.permission_actions),
      ),
      #("modified_on", json.nullable(data.modified_on, json.string)),
      #("created_on", json.string(data.created_on)),
      #("display_description", json.string(data.display_description))
    ],
  )
}

pub fn ott_destination_decoder() {
  use ott_channel_id <- decode.field("ott_channel_id", decode.float)
  use ott_event_id <- decode.field("ott_event_id", decode.float)
  use recurring_live_event_id <- decode.field(
    "recurring_live_event_id",
    decode.float,
  )
  use ott_channel_name <- decode.field("ott_channel_name", decode.string)
  use ott_channel_subdomain <- decode.field(
    "ott_channel_subdomain",
    decode.string,
  )
  use id <- decode.field("id", decode.string)
  decode.success(
    OttDestination(
      ott_channel_id: ott_channel_id,
      ott_event_id: ott_event_id,
      recurring_live_event_id: recurring_live_event_id,
      ott_channel_name: ott_channel_name,
      ott_channel_subdomain: ott_channel_subdomain,
      id: id,
    ),
  )
}

pub fn ott_destination_encode(data: OttDestination) {
  json.object(
    [
      #("ott_channel_id", json.float(data.ott_channel_id)),
      #("ott_event_id", json.float(data.ott_event_id)),
      #("recurring_live_event_id", json.float(data.recurring_live_event_id)),
      #("ott_channel_name", json.string(data.ott_channel_name)),
      #("ott_channel_subdomain", json.string(data.ott_channel_subdomain)),
      #("id", json.string(data.id))
    ],
  )
}

pub fn video_page_settings_decoder() {
  use player <- decode.optional_field(
    "player",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use chapters <- decode.optional_field(
    "chapters",
    None,
    decode.optional(decode.bool),
  )
  use download <- decode.field("download", decode.bool)
  use uri <- decode.optional_field("uri", None, decode.optional(decode.string))
  use views <- decode.field("views", decode.bool)
  use uploader <- decode.field("uploader", decode.bool)
  use ask_ai <- decode.field("ask_ai", decode.bool)
  use date_added <- decode.field("date_added", decode.bool)
  use owner <- decode.field("owner", decode.bool)
  use comments <- decode.field("comments", decode.bool)
  use collections <- decode.field("collections", decode.bool)
  use transcript <- decode.optional_field(
    "transcript",
    None,
    decode.optional(decode.bool),
  )
  use like <- decode.field("like", decode.bool)
  use title <- decode.optional_field("title", None, decode.optional(decode.bool))
  use creative_commons <- decode.field("creative_commons", decode.bool)
  use tags <- decode.field("tags", decode.bool)
  use credits <- decode.field("credits", decode.bool)
  use portrait <- decode.field("portrait", decode.bool)
  use categories <- decode.field("categories", decode.bool)
  use watch_later <- decode.field("watch_later", decode.bool)
  use description <- decode.field("description", decode.bool)
  use share <- decode.field("share", decode.bool)
  decode.success(
    VideoPageSettings(
      player: player,
      chapters: chapters,
      download: download,
      uri: uri,
      views: views,
      uploader: uploader,
      ask_ai: ask_ai,
      date_added: date_added,
      owner: owner,
      comments: comments,
      collections: collections,
      transcript: transcript,
      like: like,
      title: title,
      creative_commons: creative_commons,
      tags: tags,
      credits: credits,
      portrait: portrait,
      categories: categories,
      watch_later: watch_later,
      description: description,
      share: share,
    ),
  )
}

pub fn video_page_settings_encode(data: VideoPageSettings) {
  json.object(
    [
      #(
        "player",
        json.nullable(
          data.player,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #("chapters", json.nullable(data.chapters, json.bool)),
      #("download", json.bool(data.download)),
      #("uri", json.nullable(data.uri, json.string)),
      #("views", json.bool(data.views)),
      #("uploader", json.bool(data.uploader)),
      #("ask_ai", json.bool(data.ask_ai)),
      #("date_added", json.bool(data.date_added)),
      #("owner", json.bool(data.owner)),
      #("comments", json.bool(data.comments)),
      #("collections", json.bool(data.collections)),
      #("transcript", json.nullable(data.transcript, json.bool)),
      #("like", json.bool(data.like)),
      #("title", json.nullable(data.title, json.bool)),
      #("creative_commons", json.bool(data.creative_commons)),
      #("tags", json.bool(data.tags)),
      #("credits", json.bool(data.credits)),
      #("portrait", json.bool(data.portrait)),
      #("categories", json.bool(data.categories)),
      #("watch_later", json.bool(data.watch_later)),
      #("description", json.bool(data.description)),
      #("share", json.bool(data.share))
    ],
  )
}

pub fn segment_words_decoder() {
  use start_time <- decode.optional_field(
    "start_time",
    None,
    decode.optional(decode.float),
  )
  use word <- decode.field("word", decode.string)
  use end_time <- decode.optional_field(
    "end_time",
    None,
    decode.optional(decode.float),
  )
  decode.success(
    SegmentWords(start_time: start_time, word: word, end_time: end_time),
  )
}

pub fn segment_words_encode(data: SegmentWords) {
  json.object(
    [
      #("start_time", json.nullable(data.start_time, json.float)),
      #("word", json.string(data.word)),
      #("end_time", json.nullable(data.end_time, json.float))
    ],
  )
}

pub fn album_decoder() {
  use web_brand_color <- decode.field("web_brand_color", decode.bool)
  use autoplay <- decode.field("autoplay", decode.bool)
  use hide_vimeo_logo <- decode.optional_field(
    "hide_vimeo_logo",
    None,
    decode.optional(decode.bool),
  )
  use modified_time <- decode.field("modified_time", decode.string)
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(decode.string),
  )
  use created_time <- decode.field("created_time", decode.string)
  use loop <- decode.field("loop", decode.bool)
  use has_chosen_thumbnail <- decode.field("has_chosen_thumbnail", decode.bool)
  use embed_brand_color <- decode.optional_field(
    "embed_brand_color",
    None,
    decode.optional(decode.bool),
  )
  use hide_nav <- decode.field("hide_nav", decode.bool)
  use privacy <- decode.field(
    "privacy",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use theme <- decode.field("theme", decode.string)
  use allow_share <- decode.field("allow_share", decode.bool)
  use review_mode <- decode.field("review_mode", decode.bool)
  use layout <- decode.field("layout", decode.string)
  use brand_color <- decode.optional_field(
    "brand_color",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.field("name", decode.string)
  use user <- decode.field(
    "user",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use hide_from_vimeo <- decode.field("hide_from_vimeo", decode.bool)
  use seo_keywords <- decode.field("seo_keywords", decode.list(decode.string))
  use uri <- decode.field("uri", decode.string)
  use has_featured_content <- decode.field("has_featured_content", decode.bool)
  use domain_certificate_state <- decode.field(
    "domain_certificate_state",
    decode.string,
  )
  use web_custom_logo <- decode.field("web_custom_logo", decode.bool)
  use allow_continuous_play <- decode.field("allow_continuous_play", decode.bool)
  use resource_key <- decode.field("resource_key", decode.string)
  use allowed_privacies <- decode.field(
    "allowed_privacies",
    decode.list(decode.string),
  )
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use embed_custom_logo <- decode.optional_field(
    "embed_custom_logo",
    None,
    decode.optional(decode.bool),
  )
  use duration <- decode.field("duration", decode.float)
  use pictures <- decode.field(
    "pictures",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use allow_downloads <- decode.field("allow_downloads", decode.bool)
  use seo_title <- decode.optional_field(
    "seo_title",
    None,
    decode.optional(decode.string),
  )
  use unlisted_hash <- decode.optional_field(
    "unlisted_hash",
    None,
    decode.optional(decode.string),
  )
  use seo_allow_indexed <- decode.field("seo_allow_indexed", decode.bool)
  use custom_logo <- decode.field(
    "custom_logo",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use embed <- decode.field(
    "embed",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use hide_upcoming <- decode.field("hide_upcoming", decode.bool)
  use share_link <- decode.field("share_link", decode.string)
  use use_custom_domain <- decode.field("use_custom_domain", decode.bool)
  use seo_description <- decode.optional_field(
    "seo_description",
    None,
    decode.optional(decode.string),
  )
  use link <- decode.field("link", decode.string)
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use sort <- decode.field("sort", decode.string)
  decode.success(
    Album(
      web_brand_color: web_brand_color,
      autoplay: autoplay,
      hide_vimeo_logo: hide_vimeo_logo,
      modified_time: modified_time,
      domain: domain,
      created_time: created_time,
      loop: loop,
      has_chosen_thumbnail: has_chosen_thumbnail,
      embed_brand_color: embed_brand_color,
      hide_nav: hide_nav,
      privacy: privacy,
      theme: theme,
      allow_share: allow_share,
      review_mode: review_mode,
      layout: layout,
      brand_color: brand_color,
      name: name,
      user: user,
      hide_from_vimeo: hide_from_vimeo,
      seo_keywords: seo_keywords,
      uri: uri,
      has_featured_content: has_featured_content,
      domain_certificate_state: domain_certificate_state,
      web_custom_logo: web_custom_logo,
      allow_continuous_play: allow_continuous_play,
      resource_key: resource_key,
      allowed_privacies: allowed_privacies,
      url: url,
      metadata: metadata,
      embed_custom_logo: embed_custom_logo,
      duration: duration,
      pictures: pictures,
      allow_downloads: allow_downloads,
      seo_title: seo_title,
      unlisted_hash: unlisted_hash,
      seo_allow_indexed: seo_allow_indexed,
      custom_logo: custom_logo,
      embed: embed,
      hide_upcoming: hide_upcoming,
      share_link: share_link,
      use_custom_domain: use_custom_domain,
      seo_description: seo_description,
      link: link,
      description: description,
      sort: sort,
    ),
  )
}

pub fn album_encode(data: Album) {
  json.object(
    [
      #("web_brand_color", json.bool(data.web_brand_color)),
      #("autoplay", json.bool(data.autoplay)),
      #("hide_vimeo_logo", json.nullable(data.hide_vimeo_logo, json.bool)),
      #("modified_time", json.string(data.modified_time)),
      #("domain", json.nullable(data.domain, json.string)),
      #("created_time", json.string(data.created_time)),
      #("loop", json.bool(data.loop)),
      #("has_chosen_thumbnail", json.bool(data.has_chosen_thumbnail)),
      #("embed_brand_color", json.nullable(data.embed_brand_color, json.bool)),
      #("hide_nav", json.bool(data.hide_nav)),
      #(
        "privacy",
        fn(_) { panic as "Literal object inside field" }(data.privacy),
      ),
      #("theme", json.string(data.theme)),
      #("allow_share", json.bool(data.allow_share)),
      #("review_mode", json.bool(data.review_mode)),
      #("layout", json.string(data.layout)),
      #("brand_color", json.nullable(data.brand_color, json.string)),
      #("name", json.string(data.name)),
      #("user", fn(_) { panic as "AllOf inside field" }(data.user)),
      #("hide_from_vimeo", json.bool(data.hide_from_vimeo)),
      #("seo_keywords", json.array(_, json.string)(data.seo_keywords)),
      #("uri", json.string(data.uri)),
      #("has_featured_content", json.bool(data.has_featured_content)),
      #("domain_certificate_state", json.string(data.domain_certificate_state)),
      #("web_custom_logo", json.bool(data.web_custom_logo)),
      #("allow_continuous_play", json.bool(data.allow_continuous_play)),
      #("resource_key", json.string(data.resource_key)),
      #("allowed_privacies", json.array(_, json.string)(data.allowed_privacies)),
      #("url", json.nullable(data.url, json.string)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("embed_custom_logo", json.nullable(data.embed_custom_logo, json.bool)),
      #("duration", json.float(data.duration)),
      #("pictures", fn(_) { panic as "AllOf inside field" }(data.pictures)),
      #("allow_downloads", json.bool(data.allow_downloads)),
      #("seo_title", json.nullable(data.seo_title, json.string)),
      #("unlisted_hash", json.nullable(data.unlisted_hash, json.string)),
      #("seo_allow_indexed", json.bool(data.seo_allow_indexed)),
      #("custom_logo", fn(_) { panic as "AllOf inside field" }(data.custom_logo)),
      #("embed", fn(_) { panic as "Literal object inside field" }(data.embed)),
      #("hide_upcoming", json.bool(data.hide_upcoming)),
      #("share_link", json.string(data.share_link)),
      #("use_custom_domain", json.bool(data.use_custom_domain)),
      #("seo_description", json.nullable(data.seo_description, json.string)),
      #("link", json.string(data.link)),
      #("description", json.nullable(data.description, json.string)),
      #("sort", json.string(data.sort))
    ],
  )
}

pub fn on_demand_promotion_decoder() {
  use stream_period <- decode.optional_field(
    "stream_period",
    None,
    decode.optional(decode.string),
  )
  use total <- decode.field("total", decode.float)
  use download <- decode.field("download", decode.bool)
  use product_type <- decode.field("product_type", decode.string)
  use uri <- decode.field("uri", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use label <- decode.optional_field(
    "label",
    None,
    decode.optional(decode.string),
  )
  use access_type <- decode.field("access_type", decode.string)
  use percent_off <- decode.field("percent_off", decode.float)
  use discount_type <- decode.field("discount_type", decode.string)
  use type_ <- decode.field("type", decode.string)
  decode.success(
    OnDemandPromotion(
      stream_period: stream_period,
      total: total,
      download: download,
      product_type: product_type,
      uri: uri,
      metadata: metadata,
      label: label,
      access_type: access_type,
      percent_off: percent_off,
      discount_type: discount_type,
      type_: type_,
    ),
  )
}

pub fn on_demand_promotion_encode(data: OnDemandPromotion) {
  json.object(
    [
      #("stream_period", json.nullable(data.stream_period, json.string)),
      #("total", json.float(data.total)),
      #("download", json.bool(data.download)),
      #("product_type", json.string(data.product_type)),
      #("uri", json.string(data.uri)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("label", json.nullable(data.label, json.string)),
      #("access_type", json.string(data.access_type)),
      #("percent_off", json.float(data.percent_off)),
      #("discount_type", json.string(data.discount_type)),
      #("type", json.string(data.type_))
    ],
  )
}

pub fn on_demand_genre_decoder() {
  use interactions <- decode.field(
    "interactions",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use name <- decode.field("name", decode.string)
  use uri <- decode.field("uri", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use canonical <- decode.field("canonical", decode.string)
  use link <- decode.field("link", decode.string)
  decode.success(
    OnDemandGenre(
      interactions: interactions,
      name: name,
      uri: uri,
      metadata: metadata,
      canonical: canonical,
      link: link,
    ),
  )
}

pub fn on_demand_genre_encode(data: OnDemandGenre) {
  json.object(
    [
      #(
        "interactions",
        fn(_) { panic as "Literal object inside field" }(data.interactions),
      ),
      #("name", json.string(data.name)),
      #("uri", json.string(data.uri)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("canonical", json.string(data.canonical)),
      #("link", json.string(data.link))
    ],
  )
}

pub fn api_app_decoder() {
  use name <- decode.field("name", decode.string)
  use uri <- decode.field("uri", decode.string)
  use capabilities <- decode.field(
    "capabilities",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  decode.success(ApiApp(name: name, uri: uri, capabilities: capabilities))
}

pub fn api_app_encode(data: ApiApp) {
  json.object(
    [
      #("name", json.string(data.name)),
      #("uri", json.string(data.uri)),
      #(
        "capabilities",
        fn(_) { panic as "Literal object inside field" }(data.capabilities),
      )
    ],
  )
}

pub fn video_file_decoder() {
  use size <- decode.field("size", decode.float)
  use public_name <- decode.field("public_name", decode.string)
  use created_time <- decode.field("created_time", decode.string)
  use log <- decode.optional_field(
    "log",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use width <- decode.field("width", decode.float)
  use height <- decode.field("height", decode.float)
  use fps <- decode.field("fps", decode.float)
  use rendition <- decode.field("rendition", decode.string)
  use expires <- decode.optional_field(
    "expires",
    None,
    decode.optional(decode.string),
  )
  use codec <- decode.optional_field(
    "codec",
    None,
    decode.optional(decode.string),
  )
  use video_file_id <- decode.optional_field(
    "video_file_id",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  use link <- decode.field("link", decode.string)
  use md5 <- decode.field("md5", decode.string)
  use source_link <- decode.optional_field(
    "source_link",
    None,
    decode.optional(decode.string),
  )
  use size_short <- decode.field("size_short", decode.string)
  use quality <- decode.field("quality", decode.string)
  decode.success(
    VideoFile(
      size: size,
      public_name: public_name,
      created_time: created_time,
      log: log,
      width: width,
      height: height,
      fps: fps,
      rendition: rendition,
      expires: expires,
      codec: codec,
      video_file_id: video_file_id,
      type_: type_,
      link: link,
      md5: md5,
      source_link: source_link,
      size_short: size_short,
      quality: quality,
    ),
  )
}

pub fn video_file_encode(data: VideoFile) {
  json.object(
    [
      #("size", json.float(data.size)),
      #("public_name", json.string(data.public_name)),
      #("created_time", json.string(data.created_time)),
      #(
        "log",
        json.nullable(data.log, fn(_) { panic as "Literal object inside field" }),
      ),
      #("width", json.float(data.width)),
      #("height", json.float(data.height)),
      #("fps", json.float(data.fps)),
      #("rendition", json.string(data.rendition)),
      #("expires", json.nullable(data.expires, json.string)),
      #("codec", json.nullable(data.codec, json.string)),
      #("video_file_id", json.nullable(data.video_file_id, json.string)),
      #("type", json.nullable(data.type_, json.string)),
      #("link", json.string(data.link)),
      #("md5", json.string(data.md5)),
      #("source_link", json.nullable(data.source_link, json.string)),
      #("size_short", json.string(data.size_short)),
      #("quality", json.string(data.quality))
    ],
  )
}

pub fn segment_line_decoder() {
  use text <- decode.field("text", decode.string)
  use voice <- decode.optional_field(
    "voice",
    None,
    decode.optional(decode.string),
  )
  decode.success(SegmentLine(text: text, voice: voice))
}

pub fn segment_line_encode(data: SegmentLine) {
  json.object(
    [
      #("text", json.string(data.text)),
      #("voice", json.nullable(data.voice, json.string))
    ],
  )
}

pub fn chapter_decoder() {
  use active_thumbnail_uri <- decode.optional_field(
    "active_thumbnail_uri",
    None,
    decode.optional(decode.string),
  )
  use thumbnails <- decode.field("thumbnails", decode.list(picture_decoder()))
  use uri <- decode.field("uri", decode.string)
  use title <- decode.field("title", decode.string)
  use timecode <- decode.field("timecode", decode.float)
  decode.success(
    Chapter(
      active_thumbnail_uri: active_thumbnail_uri,
      thumbnails: thumbnails,
      uri: uri,
      title: title,
      timecode: timecode,
    ),
  )
}

pub fn chapter_encode(data: Chapter) {
  json.object(
    [
      #(
        "active_thumbnail_uri",
        json.nullable(data.active_thumbnail_uri, json.string),
      ),
      #("thumbnails", json.array(_, picture_encode)(data.thumbnails)),
      #("uri", json.string(data.uri)),
      #("title", json.string(data.title)),
      #("timecode", json.float(data.timecode))
    ],
  )
}

pub fn user_decoder() {
  use available_for_hire <- decode.field("available_for_hire", decode.bool)
  use gender <- decode.optional_field(
    "gender",
    None,
    decode.optional(decode.string),
  )
  use skills <- decode.optional_field(
    "skills",
    None,
    decode.optional(decode.list(skill_decoder())),
  )
  use created_time <- decode.field("created_time", decode.string)
  use short_bio <- decode.optional_field(
    "short_bio",
    None,
    decode.optional(decode.string),
  )
  use bio <- decode.optional_field("bio", None, decode.optional(decode.string))
  use clients <- decode.field("clients", decode.string)
  use name <- decode.field("name", decode.string)
  use lms_learner_seats_quota <- decode.optional_field(
    "lms_learner_seats_quota",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use uri <- decode.field("uri", decode.string)
  use account <- decode.field("account", decode.string)
  use transcript_phrases_limit <- decode.optional_field(
    "transcript_phrases_limit",
    None,
    decode.optional(decode.float),
  )
  use resource_key <- decode.field("resource_key", decode.string)
  use has_invalid_email <- decode.optional_field(
    "has_invalid_email",
    None,
    decode.optional(decode.bool),
  )
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use bandwidth <- decode.optional_field(
    "bandwidth",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use can_work_remotely <- decode.field("can_work_remotely", decode.bool)
  use is_staff_picked <- decode.field("is_staff_picked", decode.bool)
  use pictures <- decode.field(
    "pictures",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use location <- decode.optional_field(
    "location",
    None,
    decode.optional(decode.string),
  )
  use capabilities <- decode.field(
    "capabilities",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use preferences <- decode.field(
    "preferences",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use websites <- decode.field(
    "websites",
    decode.list(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use location_details <- decode.optional_field(
    "location_details",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use profile_discovery <- decode.field("profile_discovery", decode.bool)
  use upload_quota <- decode.field(
    "upload_quota",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use link <- decode.field("link", decode.string)
  use ai_credits_quota <- decode.optional_field(
    "ai_credits_quota",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use content_filter <- decode.optional_field(
    "content_filter",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use is_expert <- decode.field("is_expert", decode.bool)
  decode.success(
    User(
      available_for_hire: available_for_hire,
      gender: gender,
      skills: skills,
      created_time: created_time,
      short_bio: short_bio,
      bio: bio,
      clients: clients,
      name: name,
      lms_learner_seats_quota: lms_learner_seats_quota,
      uri: uri,
      account: account,
      transcript_phrases_limit: transcript_phrases_limit,
      resource_key: resource_key,
      has_invalid_email: has_invalid_email,
      metadata: metadata,
      bandwidth: bandwidth,
      can_work_remotely: can_work_remotely,
      is_staff_picked: is_staff_picked,
      pictures: pictures,
      location: location,
      capabilities: capabilities,
      preferences: preferences,
      websites: websites,
      location_details: location_details,
      profile_discovery: profile_discovery,
      upload_quota: upload_quota,
      link: link,
      ai_credits_quota: ai_credits_quota,
      content_filter: content_filter,
      is_expert: is_expert,
    ),
  )
}

pub fn user_encode(data: User) {
  json.object(
    [
      #("available_for_hire", json.bool(data.available_for_hire)),
      #("gender", json.nullable(data.gender, json.string)),
      #("skills", json.nullable(data.skills, json.array(_, skill_encode))),
      #("created_time", json.string(data.created_time)),
      #("short_bio", json.nullable(data.short_bio, json.string)),
      #("bio", json.nullable(data.bio, json.string)),
      #("clients", json.string(data.clients)),
      #("name", json.string(data.name)),
      #(
        "lms_learner_seats_quota",
        json.nullable(
          data.lms_learner_seats_quota,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #("uri", json.string(data.uri)),
      #("account", json.string(data.account)),
      #(
        "transcript_phrases_limit",
        json.nullable(data.transcript_phrases_limit, json.float),
      ),
      #("resource_key", json.string(data.resource_key)),
      #("has_invalid_email", json.nullable(data.has_invalid_email, json.bool)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #(
        "bandwidth",
        json.nullable(
          data.bandwidth,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #("can_work_remotely", json.bool(data.can_work_remotely)),
      #("is_staff_picked", json.bool(data.is_staff_picked)),
      #("pictures", fn(_) { panic as "AllOf inside field" }(data.pictures)),
      #("location", json.nullable(data.location, json.string)),
      #(
        "capabilities",
        fn(_) { panic as "Literal object inside field" }(data.capabilities),
      ),
      #(
        "preferences",
        fn(_) { panic as "Literal object inside field" }(data.preferences),
      ),
      #(
        "websites",
        json.array(_, fn(_) { panic as "object in array" })(data.websites),
      ),
      #(
        "location_details",
        json.nullable(
          data.location_details,
          fn(_) { panic as "AllOf inside field" },
        ),
      ),
      #("profile_discovery", json.bool(data.profile_discovery)),
      #(
        "upload_quota",
        fn(_) { panic as "Literal object inside field" }(data.upload_quota),
      ),
      #("link", json.string(data.link)),
      #(
        "ai_credits_quota",
        json.nullable(
          data.ai_credits_quota,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #(
        "content_filter",
        json.nullable(data.content_filter, json.array(_, json.string)),
      ),
      #("is_expert", json.bool(data.is_expert))
    ],
  )
}

pub fn on_demand_promotion_code_decoder() {
  use max_uses <- decode.field("max_uses", decode.float)
  use uses <- decode.field("uses", decode.float)
  use code <- decode.field("code", decode.string)
  use link <- decode.field("link", decode.string)
  decode.success(
    OnDemandPromotionCode(max_uses: max_uses, uses: uses, code: code, link: link),
  )
}

pub fn on_demand_promotion_code_encode(data: OnDemandPromotionCode) {
  json.object(
    [
      #("max_uses", json.float(data.max_uses)),
      #("uses", json.float(data.uses)),
      #("code", json.string(data.code)),
      #("link", json.string(data.link))
    ],
  )
}

pub fn hls_dash_video_file_decoder() {
  use log <- decode.optional_field("log", None, decode.optional(decode.string))
  use link_expiration_time <- decode.field("link_expiration_time", decode.string)
  use link <- decode.optional_field("link", None, decode.optional(decode.string))
  decode.success(
    HlsDashVideoFile(
      log: log,
      link_expiration_time: link_expiration_time,
      link: link,
    ),
  )
}

pub fn hls_dash_video_file_encode(data: HlsDashVideoFile) {
  json.object(
    [
      #("log", json.nullable(data.log, json.string)),
      #("link_expiration_time", json.string(data.link_expiration_time)),
      #("link", json.nullable(data.link, json.string))
    ],
  )
}

pub fn text_track_decoder() {
  use provenance <- decode.field("provenance", decode.string)
  use active <- decode.field("active", decode.bool)
  use hls_link <- decode.field("hls_link", decode.string)
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use uri <- decode.field("uri", decode.string)
  use hls_link_expires_time <- decode.field(
    "hls_link_expires_time",
    decode.string,
  )
  use metadata <- decode.optional_field(
    "metadata",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use display_language <- decode.field("display_language", decode.string)
  use version <- decode.optional_field(
    "version",
    None,
    decode.optional(decode.float),
  )
  use language <- decode.optional_field(
    "language",
    None,
    decode.optional(decode.string),
  )
  use source_link_expires_time <- decode.field(
    "source_link_expires_time",
    decode.string,
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  use link <- decode.field("link", decode.string)
  use id <- decode.field("id", decode.float)
  use link_expires_time <- decode.field("link_expires_time", decode.string)
  use source_link <- decode.field("source_link", decode.string)
  decode.success(
    TextTrack(
      provenance: provenance,
      active: active,
      hls_link: hls_link,
      name: name,
      uri: uri,
      hls_link_expires_time: hls_link_expires_time,
      metadata: metadata,
      display_language: display_language,
      version: version,
      language: language,
      source_link_expires_time: source_link_expires_time,
      type_: type_,
      link: link,
      id: id,
      link_expires_time: link_expires_time,
      source_link: source_link,
    ),
  )
}

pub fn text_track_encode(data: TextTrack) {
  json.object(
    [
      #("provenance", json.string(data.provenance)),
      #("active", json.bool(data.active)),
      #("hls_link", json.string(data.hls_link)),
      #("name", json.nullable(data.name, json.string)),
      #("uri", json.string(data.uri)),
      #("hls_link_expires_time", json.string(data.hls_link_expires_time)),
      #(
        "metadata",
        json.nullable(
          data.metadata,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #("display_language", json.string(data.display_language)),
      #("version", json.nullable(data.version, json.float)),
      #("language", json.nullable(data.language, json.string)),
      #("source_link_expires_time", json.string(data.source_link_expires_time)),
      #("type", json.nullable(data.type_, json.string)),
      #("link", json.string(data.link)),
      #("id", json.float(data.id)),
      #("link_expires_time", json.string(data.link_expires_time)),
      #("source_link", json.string(data.source_link))
    ],
  )
}

pub fn creative_commons_decoder() {
  use name <- decode.field("name", decode.string)
  use uri <- decode.optional_field("uri", None, decode.optional(decode.string))
  use code <- decode.field("code", decode.string)
  decode.success(CreativeCommons(name: name, uri: uri, code: code))
}

pub fn creative_commons_encode(data: CreativeCommons) {
  json.object(
    [
      #("name", json.string(data.name)),
      #("uri", json.nullable(data.uri, json.string)),
      #("code", json.string(data.code))
    ],
  )
}

pub fn recurring_event_decoder() {
  use stream_key <- decode.optional_field(
    "stream_key",
    None,
    decode.optional(decode.string),
  )
  use dvr <- decode.field("dvr", decode.bool)
  use from_showcase <- decode.field("from_showcase", decode.bool)
  use stream_mode <- decode.field("stream_mode", decode.string)
  use preferred_stream_method <- decode.field(
    "preferred_stream_method",
    decode.string,
  )
  use content_rating <- decode.field(
    "content_rating",
    decode.list(decode.string),
  )
  use parent_folder <- decode.field(
    "parent_folder",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use automatically_title_stream <- decode.field(
    "automatically_title_stream",
    decode.bool,
  )
  use srt_link <- decode.optional_field(
    "srt_link",
    None,
    decode.optional(decode.string),
  )
  use created_time <- decode.field("created_time", decode.string)
  use disable_auto_archiving <- decode.field(
    "disable_auto_archiving",
    decode.bool,
  )
  use auto_cc_remaining <- decode.optional_field(
    "auto_cc_remaining",
    None,
    decode.optional(decode.float),
  )
  use auto_cc_language <- decode.optional_field(
    "auto_cc_language",
    None,
    decode.optional(decode.string),
  )
  use stream_privacy <- decode.field(
    "stream_privacy",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use webinar <- decode.optional_field(
    "webinar",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use venue_uuid <- decode.optional_field(
    "venue_uuid",
    None,
    decode.optional(decode.string),
  )
  use user <- decode.field(
    "user",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use rtmps_link <- decode.optional_field(
    "rtmps_link",
    None,
    decode.optional(decode.string),
  )
  use playlist_sort <- decode.field("playlist_sort", decode.string)
  use uri <- decode.field("uri", decode.string)
  use scheduled_playback <- decode.field("scheduled_playback", decode.bool)
  use rtmp_preview <- decode.field("rtmp_preview", decode.bool)
  use allowed_privacies <- decode.field(
    "allowed_privacies",
    decode.list(decode.string),
  )
  use head_clip <- decode.optional_field(
    "head_clip",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use album <- decode.optional_field(
    "album",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use next_occurrence_time <- decode.optional_field(
    "next_occurrence_time",
    None,
    decode.optional(decode.string),
  )
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use live_clips <- decode.field("live_clips", decode.list(decode.string))
  use allow_share_link <- decode.field("allow_share_link", decode.bool)
  use auto_cc_enabled <- decode.optional_field(
    "auto_cc_enabled",
    None,
    decode.optional(decode.bool),
  )
  use unlimited_duration <- decode.field("unlimited_duration", decode.bool)
  use unlimited_auto_cc <- decode.optional_field(
    "unlimited_auto_cc",
    None,
    decode.optional(decode.bool),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.string),
  )
  use completed_on <- decode.field("completed_on", decode.string)
  use low_latency <- decode.field("low_latency", decode.bool)
  use rtmp_link <- decode.optional_field(
    "rtmp_link",
    None,
    decode.optional(decode.string),
  )
  use view_link <- decode.field("view_link", decode.string)
  use interaction_tools_settings <- decode.optional_field(
    "interaction_tools_settings",
    None,
    decode.optional(
      decode.list(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
    ),
  )
  use email_quota <- decode.field(
    "email_quota",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use streaming_auto_stop <- decode.field("streaming_auto_stop", decode.bool)
  use from_webinar <- decode.optional_field(
    "from_webinar",
    None,
    decode.optional(decode.bool),
  )
  use pictures <- decode.field(
    "pictures",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use streamable_clip <- decode.optional_field(
    "streamable_clip",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use whitelisted_domains <- decode.optional_field(
    "whitelisted_domains",
    None,
    decode.optional(
      decode.list(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
    ),
  )
  use settings_link <- decode.field("settings_link", decode.string)
  use schedule <- decode.field(
    "schedule",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use title <- decode.field("title", decode.string)
  use live_destinations <- decode.optional_field(
    "live_destinations",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use stream_title <- decode.field("stream_title", decode.string)
  use auto_cc_keywords <- decode.optional_field(
    "auto_cc_keywords",
    None,
    decode.optional(decode.string),
  )
  use embed <- decode.field(
    "embed",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use stream_password <- decode.optional_field(
    "stream_password",
    None,
    decode.optional(decode.string),
  )
  use chat_enabled <- decode.field("chat_enabled", decode.bool)
  use link <- decode.field("link", decode.string)
  use stream_description <- decode.optional_field(
    "stream_description",
    None,
    decode.optional(decode.string),
  )
  use latency <- decode.field("latency", decode.string)
  use time_zone <- decode.field("time_zone", decode.string)
  use lead_uuid <- decode.field("lead_uuid", decode.string)
  use event_type <- decode.field("event_type", decode.string)
  decode.success(
    RecurringEvent(
      stream_key: stream_key,
      dvr: dvr,
      from_showcase: from_showcase,
      stream_mode: stream_mode,
      preferred_stream_method: preferred_stream_method,
      content_rating: content_rating,
      parent_folder: parent_folder,
      automatically_title_stream: automatically_title_stream,
      srt_link: srt_link,
      created_time: created_time,
      disable_auto_archiving: disable_auto_archiving,
      auto_cc_remaining: auto_cc_remaining,
      auto_cc_language: auto_cc_language,
      stream_privacy: stream_privacy,
      webinar: webinar,
      venue_uuid: venue_uuid,
      user: user,
      rtmps_link: rtmps_link,
      playlist_sort: playlist_sort,
      uri: uri,
      scheduled_playback: scheduled_playback,
      rtmp_preview: rtmp_preview,
      allowed_privacies: allowed_privacies,
      head_clip: head_clip,
      album: album,
      next_occurrence_time: next_occurrence_time,
      metadata: metadata,
      live_clips: live_clips,
      allow_share_link: allow_share_link,
      auto_cc_enabled: auto_cc_enabled,
      unlimited_duration: unlimited_duration,
      unlimited_auto_cc: unlimited_auto_cc,
      status: status,
      completed_on: completed_on,
      low_latency: low_latency,
      rtmp_link: rtmp_link,
      view_link: view_link,
      interaction_tools_settings: interaction_tools_settings,
      email_quota: email_quota,
      streaming_auto_stop: streaming_auto_stop,
      from_webinar: from_webinar,
      pictures: pictures,
      streamable_clip: streamable_clip,
      whitelisted_domains: whitelisted_domains,
      settings_link: settings_link,
      schedule: schedule,
      title: title,
      live_destinations: live_destinations,
      stream_title: stream_title,
      auto_cc_keywords: auto_cc_keywords,
      embed: embed,
      stream_password: stream_password,
      chat_enabled: chat_enabled,
      link: link,
      stream_description: stream_description,
      latency: latency,
      time_zone: time_zone,
      lead_uuid: lead_uuid,
      event_type: event_type,
    ),
  )
}

pub fn recurring_event_encode(data: RecurringEvent) {
  json.object(
    [
      #("stream_key", json.nullable(data.stream_key, json.string)),
      #("dvr", json.bool(data.dvr)),
      #("from_showcase", json.bool(data.from_showcase)),
      #("stream_mode", json.string(data.stream_mode)),
      #("preferred_stream_method", json.string(data.preferred_stream_method)),
      #("content_rating", json.array(_, json.string)(data.content_rating)),
      #(
        "parent_folder",
        fn(_) { panic as "AllOf inside field" }(data.parent_folder),
      ),
      #("automatically_title_stream", json.bool(data.automatically_title_stream)),
      #("srt_link", json.nullable(data.srt_link, json.string)),
      #("created_time", json.string(data.created_time)),
      #("disable_auto_archiving", json.bool(data.disable_auto_archiving)),
      #("auto_cc_remaining", json.nullable(data.auto_cc_remaining, json.float)),
      #("auto_cc_language", json.nullable(data.auto_cc_language, json.string)),
      #(
        "stream_privacy",
        fn(_) { panic as "Literal object inside field" }(data.stream_privacy),
      ),
      #("webinar", json.nullable(data.webinar, json.array(_, json.string))),
      #("venue_uuid", json.nullable(data.venue_uuid, json.string)),
      #("user", fn(_) { panic as "AllOf inside field" }(data.user)),
      #("rtmps_link", json.nullable(data.rtmps_link, json.string)),
      #("playlist_sort", json.string(data.playlist_sort)),
      #("uri", json.string(data.uri)),
      #("scheduled_playback", json.bool(data.scheduled_playback)),
      #("rtmp_preview", json.bool(data.rtmp_preview)),
      #("allowed_privacies", json.array(_, json.string)(data.allowed_privacies)),
      #(
        "head_clip",
        json.nullable(
          data.head_clip,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #(
        "album",
        json.nullable(
          data.album,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #(
        "next_occurrence_time",
        json.nullable(data.next_occurrence_time, json.string),
      ),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("live_clips", json.array(_, json.string)(data.live_clips)),
      #("allow_share_link", json.bool(data.allow_share_link)),
      #("auto_cc_enabled", json.nullable(data.auto_cc_enabled, json.bool)),
      #("unlimited_duration", json.bool(data.unlimited_duration)),
      #("unlimited_auto_cc", json.nullable(data.unlimited_auto_cc, json.bool)),
      #("status", json.nullable(data.status, json.string)),
      #("completed_on", json.string(data.completed_on)),
      #("low_latency", json.bool(data.low_latency)),
      #("rtmp_link", json.nullable(data.rtmp_link, json.string)),
      #("view_link", json.string(data.view_link)),
      #(
        "interaction_tools_settings",
        json.nullable(
          data.interaction_tools_settings,
          json.array(_, fn(_) { panic as "object in array" }),
        ),
      ),
      #(
        "email_quota",
        fn(_) { panic as "Literal object inside field" }(data.email_quota),
      ),
      #("streaming_auto_stop", json.bool(data.streaming_auto_stop)),
      #("from_webinar", json.nullable(data.from_webinar, json.bool)),
      #("pictures", fn(_) { panic as "AllOf inside field" }(data.pictures)),
      #(
        "streamable_clip",
        json.nullable(
          data.streamable_clip,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #(
        "whitelisted_domains",
        json.nullable(
          data.whitelisted_domains,
          json.array(_, fn(_) { panic as "object in array" }),
        ),
      ),
      #("settings_link", json.string(data.settings_link)),
      #("schedule", fn(_) { panic as "AllOf inside field" }(data.schedule)),
      #("title", json.string(data.title)),
      #(
        "live_destinations",
        json.nullable(data.live_destinations, json.array(_, json.string)),
      ),
      #("stream_title", json.string(data.stream_title)),
      #("auto_cc_keywords", json.nullable(data.auto_cc_keywords, json.string)),
      #("embed", fn(_) { panic as "Literal object inside field" }(data.embed)),
      #("stream_password", json.nullable(data.stream_password, json.string)),
      #("chat_enabled", json.bool(data.chat_enabled)),
      #("link", json.string(data.link)),
      #(
        "stream_description",
        json.nullable(data.stream_description, json.string),
      ),
      #("latency", json.string(data.latency)),
      #("time_zone", json.string(data.time_zone)),
      #("lead_uuid", json.string(data.lead_uuid)),
      #("event_type", json.string(data.event_type))
    ],
  )
}

pub fn reply_decoder() {
  use deleted_on <- decode.optional_field(
    "deleted_on",
    None,
    decode.optional(decode.string),
  )
  use richtext <- decode.optional_field(
    "richtext",
    None,
    decode.optional(decode.string),
  )
  use uri <- decode.field("uri", decode.string)
  use last_edited_on <- decode.optional_field(
    "last_edited_on",
    None,
    decode.optional(decode.string),
  )
  use text <- decode.field("text", decode.string)
  use resource_key <- decode.field("resource_key", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use text_decorations <- decode.field(
    "text_decorations",
    decode.list(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use created_on <- decode.field("created_on", decode.string)
  use type_ <- decode.field("type", decode.string)
  use link <- decode.field("link", decode.string)
  decode.success(
    Reply(
      deleted_on: deleted_on,
      richtext: richtext,
      uri: uri,
      last_edited_on: last_edited_on,
      text: text,
      resource_key: resource_key,
      metadata: metadata,
      text_decorations: text_decorations,
      created_on: created_on,
      type_: type_,
      link: link,
    ),
  )
}

pub fn reply_encode(data: Reply) {
  json.object(
    [
      #("deleted_on", json.nullable(data.deleted_on, json.string)),
      #("richtext", json.nullable(data.richtext, json.string)),
      #("uri", json.string(data.uri)),
      #("last_edited_on", json.nullable(data.last_edited_on, json.string)),
      #("text", json.string(data.text)),
      #("resource_key", json.string(data.resource_key)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #(
        "text_decorations",
        json.array(_, fn(_) { panic as "object in array" })(
          data.text_decorations,
        ),
      ),
      #("created_on", json.string(data.created_on)),
      #("type", json.string(data.type_)),
      #("link", json.string(data.link))
    ],
  )
}

pub fn event_schedule_decoder() {
  use start_time <- decode.optional_field(
    "start_time",
    None,
    decode.optional(decode.string),
  )
  use weekdays <- decode.optional_field(
    "weekdays",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use rrule <- decode.optional_field(
    "rrule",
    None,
    decode.optional(decode.string),
  )
  use end_time <- decode.optional_field(
    "end_time",
    None,
    decode.optional(decode.string),
  )
  use daily_time <- decode.optional_field(
    "daily_time",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.field("type", decode.string)
  use time_zone <- decode.optional_field(
    "time_zone",
    None,
    decode.optional(decode.string),
  )
  use scheduled_time <- decode.optional_field(
    "scheduled_time",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    EventSchedule(
      start_time: start_time,
      weekdays: weekdays,
      rrule: rrule,
      end_time: end_time,
      daily_time: daily_time,
      type_: type_,
      time_zone: time_zone,
      scheduled_time: scheduled_time,
    ),
  )
}

pub fn event_schedule_encode(data: EventSchedule) {
  json.object(
    [
      #("start_time", json.nullable(data.start_time, json.string)),
      #("weekdays", json.nullable(data.weekdays, json.array(_, json.string))),
      #("rrule", json.nullable(data.rrule, json.string)),
      #("end_time", json.nullable(data.end_time, json.string)),
      #("daily_time", json.nullable(data.daily_time, json.string)),
      #("type", json.string(data.type_)),
      #("time_zone", json.nullable(data.time_zone, json.string)),
      #("scheduled_time", json.nullable(data.scheduled_time, json.string))
    ],
  )
}

pub fn payment_method_decoder() {
  use created_at <- decode.field("created_at", decode.string)
  use is_default <- decode.field("is_default", decode.bool)
  use account_id <- decode.field("account_id", decode.string)
  use card <- decode.optional_field(
    "card",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use disabled_at <- decode.field("disabled_at", decode.string)
  use updated_at <- decode.field("updated_at", decode.string)
  use type_ <- decode.field("type", decode.string)
  use id <- decode.field("id", decode.string)
  decode.success(
    PaymentMethod(
      created_at: created_at,
      is_default: is_default,
      account_id: account_id,
      card: card,
      disabled_at: disabled_at,
      updated_at: updated_at,
      type_: type_,
      id: id,
    ),
  )
}

pub fn payment_method_encode(data: PaymentMethod) {
  json.object(
    [
      #("created_at", json.string(data.created_at)),
      #("is_default", json.bool(data.is_default)),
      #("account_id", json.string(data.account_id)),
      #(
        "card",
        json.nullable(
          data.card,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #("disabled_at", json.string(data.disabled_at)),
      #("updated_at", json.string(data.updated_at)),
      #("type", json.string(data.type_)),
      #("id", json.string(data.id))
    ],
  )
}

pub fn error_decoder() {
  use error_code <- decode.field("error_code", decode.float)
  use error <- decode.field("error", decode.string)
  use developer_message <- decode.field("developer_message", decode.string)
  use link <- decode.field("link", decode.string)
  decode.success(
    Error(
      error_code: error_code,
      error: error,
      developer_message: developer_message,
      link: link,
    ),
  )
}

pub fn error_encode(data: Error) {
  json.object(
    [
      #("error_code", json.float(data.error_code)),
      #("error", json.string(data.error)),
      #("developer_message", json.string(data.developer_message)),
      #("link", json.string(data.link))
    ],
  )
}

pub fn auth_decoder() {
  use token_type <- decode.field("token_type", decode.string)
  use app <- decode.field(
    "app",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use expires_on <- decode.optional_field(
    "expires_on",
    None,
    decode.optional(decode.string),
  )
  use user <- decode.optional_field(
    "user",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use scope <- decode.field("scope", decode.string)
  use refresh_token <- decode.optional_field(
    "refresh_token",
    None,
    decode.optional(decode.string),
  )
  use access_token <- decode.field("access_token", decode.string)
  decode.success(
    Auth(
      token_type: token_type,
      app: app,
      expires_on: expires_on,
      user: user,
      scope: scope,
      refresh_token: refresh_token,
      access_token: access_token,
    ),
  )
}

pub fn auth_encode(data: Auth) {
  json.object(
    [
      #("token_type", json.string(data.token_type)),
      #("app", fn(_) { panic as "AllOf inside field" }(data.app)),
      #("expires_on", json.nullable(data.expires_on, json.string)),
      #(
        "user",
        json.nullable(data.user, fn(_) { panic as "AllOf inside field" }),
      ),
      #("scope", json.string(data.scope)),
      #("refresh_token", json.nullable(data.refresh_token, json.string)),
      #("access_token", json.string(data.access_token))
    ],
  )
}

pub fn on_demand_region_decoder() {
  use uri <- decode.field("uri", decode.string)
  use country_name <- decode.field("country_name", decode.string)
  use country_code <- decode.field("country_code", decode.string)
  decode.success(
    OnDemandRegion(
      uri: uri,
      country_name: country_name,
      country_code: country_code,
    ),
  )
}

pub fn on_demand_region_encode(data: OnDemandRegion) {
  json.object(
    [
      #("uri", json.string(data.uri)),
      #("country_name", json.string(data.country_name)),
      #("country_code", json.string(data.country_code))
    ],
  )
}

pub fn portfolio_decoder() {
  use modified_time <- decode.field("modified_time", decode.string)
  use created_time <- decode.field("created_time", decode.string)
  use name <- decode.field("name", decode.string)
  use uri <- decode.field("uri", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use link <- decode.field("link", decode.string)
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use sort <- decode.field("sort", decode.string)
  decode.success(
    Portfolio(
      modified_time: modified_time,
      created_time: created_time,
      name: name,
      uri: uri,
      metadata: metadata,
      link: link,
      description: description,
      sort: sort,
    ),
  )
}

pub fn portfolio_encode(data: Portfolio) {
  json.object(
    [
      #("modified_time", json.string(data.modified_time)),
      #("created_time", json.string(data.created_time)),
      #("name", json.string(data.name)),
      #("uri", json.string(data.uri)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("link", json.string(data.link)),
      #("description", json.nullable(data.description, json.string)),
      #("sort", json.string(data.sort))
    ],
  )
}

pub fn on_demand_video_decoder() {
  use interactions <- decode.field(
    "interactions",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use release_date <- decode.optional_field(
    "release_date",
    None,
    decode.optional(decode.string),
  )
  use buy <- decode.optional_field(
    "buy",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use position <- decode.optional_field(
    "position",
    None,
    decode.optional(decode.float),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use user <- decode.optional_field(
    "user",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use uri <- decode.field("uri", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use duration <- decode.optional_field(
    "duration",
    None,
    decode.optional(decode.string),
  )
  use release_year <- decode.optional_field(
    "release_year",
    None,
    decode.optional(decode.float),
  )
  use pictures <- decode.optional_field(
    "pictures",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use play_progress <- decode.field("play_progress", decode.float)
  use rent <- decode.optional_field(
    "rent",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use type_ <- decode.field("type", decode.string)
  use link <- decode.field("link", decode.string)
  use episode <- decode.optional_field(
    "episode",
    None,
    decode.optional(decode.float),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use options <- decode.optional_field(
    "options",
    None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(
    OnDemandVideo(
      interactions: interactions,
      release_date: release_date,
      buy: buy,
      position: position,
      name: name,
      user: user,
      uri: uri,
      metadata: metadata,
      duration: duration,
      release_year: release_year,
      pictures: pictures,
      play_progress: play_progress,
      rent: rent,
      type_: type_,
      link: link,
      episode: episode,
      description: description,
      options: options,
    ),
  )
}

pub fn on_demand_video_encode(data: OnDemandVideo) {
  json.object(
    [
      #(
        "interactions",
        fn(_) { panic as "Literal object inside field" }(data.interactions),
      ),
      #("release_date", json.nullable(data.release_date, json.string)),
      #(
        "buy",
        json.nullable(data.buy, fn(_) { panic as "Literal object inside field" }),
      ),
      #("position", json.nullable(data.position, json.float)),
      #("name", json.nullable(data.name, json.string)),
      #(
        "user",
        json.nullable(data.user, fn(_) { panic as "AllOf inside field" }),
      ),
      #("uri", json.string(data.uri)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("duration", json.nullable(data.duration, json.string)),
      #("release_year", json.nullable(data.release_year, json.float)),
      #(
        "pictures",
        json.nullable(data.pictures, fn(_) { panic as "AllOf inside field" }),
      ),
      #("play_progress", json.float(data.play_progress)),
      #(
        "rent",
        json.nullable(
          data.rent,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #("type", json.string(data.type_)),
      #("link", json.string(data.link)),
      #("episode", json.nullable(data.episode, json.float)),
      #("description", json.nullable(data.description, json.string)),
      #("options", json.nullable(data.options, json.array(_, json.string)))
    ],
  )
}

pub fn project_item_decoder() {
  use live_event <- decode.optional_field(
    "live_event",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use shared_date <- decode.optional_field(
    "shared_date",
    None,
    decode.optional(decode.string),
  )
  use showcase <- decode.optional_field(
    "showcase",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use folder <- decode.optional_field(
    "folder",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  use video <- decode.optional_field(
    "video",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  decode.success(
    ProjectItem(
      live_event: live_event,
      shared_date: shared_date,
      showcase: showcase,
      folder: folder,
      metadata: metadata,
      type_: type_,
      video: video,
    ),
  )
}

pub fn project_item_encode(data: ProjectItem) {
  json.object(
    [
      #(
        "live_event",
        json.nullable(data.live_event, fn(_) { panic as "AllOf inside field" }),
      ),
      #("shared_date", json.nullable(data.shared_date, json.string)),
      #(
        "showcase",
        json.nullable(data.showcase, fn(_) { panic as "AllOf inside field" }),
      ),
      #(
        "folder",
        json.nullable(data.folder, fn(_) { panic as "AllOf inside field" }),
      ),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("type", json.string(data.type_)),
      #(
        "video",
        json.nullable(data.video, fn(_) { panic as "AllOf inside field" }),
      )
    ],
  )
}

pub fn analytics_decoder() {
  use finishes <- decode.field("finishes", decode.float)
  use browser_name <- decode.field("browser_name", decode.string)
  use device_type <- decode.field("device_type", decode.string)
  use os_name <- decode.field("os_name", decode.string)
  use drm_licenses_used <- decode.field("drm_licenses_used", decode.float)
  use embed_domain <- decode.field("embed_domain", decode.string)
  use impressions <- decode.field("impressions", decode.float)
  use downloads <- decode.field("downloads", decode.float)
  use start_date <- decode.field("start_date", decode.string)
  use views <- decode.field("views", decode.float)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use end_date <- decode.field("end_date", decode.string)
  use average_percent_watched <- decode.field(
    "average_percent_watched",
    decode.float,
  )
  use total_seconds_watched <- decode.field(
    "total_seconds_watched",
    decode.float,
  )
  use unique_viewers <- decode.field("unique_viewers", decode.float)
  use country_name <- decode.field("country_name", decode.string)
  use mean_seconds_watched <- decode.field("mean_seconds_watched", decode.float)
  use region_name <- decode.field("region_name", decode.string)
  use country_code <- decode.field("country_code", decode.string)
  use country <- decode.field(
    "country",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use streaming_type <- decode.field("streaming_type", decode.string)
  use total_time_watched <- decode.field("total_time_watched", decode.float)
  use region_code <- decode.field("region_code", decode.string)
  use third_party_impressions <- decode.field(
    "third_party_impressions",
    decode.float,
  )
  use embed_domain_path <- decode.field("embed_domain_path", decode.string)
  use mean_percent_watched <- decode.field("mean_percent_watched", decode.float)
  use unique_impressions <- decode.field("unique_impressions", decode.float)
  use average_time_watched <- decode.field("average_time_watched", decode.float)
  use city_name <- decode.field("city_name", decode.string)
  decode.success(
    Analytics(
      finishes: finishes,
      browser_name: browser_name,
      device_type: device_type,
      os_name: os_name,
      drm_licenses_used: drm_licenses_used,
      embed_domain: embed_domain,
      impressions: impressions,
      downloads: downloads,
      start_date: start_date,
      views: views,
      metadata: metadata,
      end_date: end_date,
      average_percent_watched: average_percent_watched,
      total_seconds_watched: total_seconds_watched,
      unique_viewers: unique_viewers,
      country_name: country_name,
      mean_seconds_watched: mean_seconds_watched,
      region_name: region_name,
      country_code: country_code,
      country: country,
      streaming_type: streaming_type,
      total_time_watched: total_time_watched,
      region_code: region_code,
      third_party_impressions: third_party_impressions,
      embed_domain_path: embed_domain_path,
      mean_percent_watched: mean_percent_watched,
      unique_impressions: unique_impressions,
      average_time_watched: average_time_watched,
      city_name: city_name,
    ),
  )
}

pub fn analytics_encode(data: Analytics) {
  json.object(
    [
      #("finishes", json.float(data.finishes)),
      #("browser_name", json.string(data.browser_name)),
      #("device_type", json.string(data.device_type)),
      #("os_name", json.string(data.os_name)),
      #("drm_licenses_used", json.float(data.drm_licenses_used)),
      #("embed_domain", json.string(data.embed_domain)),
      #("impressions", json.float(data.impressions)),
      #("downloads", json.float(data.downloads)),
      #("start_date", json.string(data.start_date)),
      #("views", json.float(data.views)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("end_date", json.string(data.end_date)),
      #("average_percent_watched", json.float(data.average_percent_watched)),
      #("total_seconds_watched", json.float(data.total_seconds_watched)),
      #("unique_viewers", json.float(data.unique_viewers)),
      #("country_name", json.string(data.country_name)),
      #("mean_seconds_watched", json.float(data.mean_seconds_watched)),
      #("region_name", json.string(data.region_name)),
      #("country_code", json.string(data.country_code)),
      #(
        "country",
        fn(_) { panic as "Literal object inside field" }(data.country),
      ),
      #("streaming_type", json.string(data.streaming_type)),
      #("total_time_watched", json.float(data.total_time_watched)),
      #("region_code", json.string(data.region_code)),
      #("third_party_impressions", json.float(data.third_party_impressions)),
      #("embed_domain_path", json.string(data.embed_domain_path)),
      #("mean_percent_watched", json.float(data.mean_percent_watched)),
      #("unique_impressions", json.float(data.unique_impressions)),
      #("average_time_watched", json.float(data.average_time_watched)),
      #("city_name", json.string(data.city_name))
    ],
  )
}

pub fn transcript_metadata_decoder() {
  use autogenerated <- decode.field("autogenerated", decode.bool)
  use enabled <- decode.field("enabled", decode.bool)
  use clip_id <- decode.field("clip_id", decode.float)
  use speaker_count <- decode.field("speaker_count", decode.float)
  use kind <- decode.field("kind", decode.string)
  use language <- decode.field("language", decode.string)
  use deleted <- decode.field("deleted", decode.bool)
  use container_id <- decode.field("container_id", decode.string)
  use word_count <- decode.field("word_count", decode.float)
  use id <- decode.field("id", decode.string)
  use texttrack_id <- decode.field("texttrack_id", decode.float)
  use transcript_status_uuid <- decode.field(
    "transcript_status_uuid",
    decode.string,
  )
  decode.success(
    TranscriptMetadata(
      autogenerated: autogenerated,
      enabled: enabled,
      clip_id: clip_id,
      speaker_count: speaker_count,
      kind: kind,
      language: language,
      deleted: deleted,
      container_id: container_id,
      word_count: word_count,
      id: id,
      texttrack_id: texttrack_id,
      transcript_status_uuid: transcript_status_uuid,
    ),
  )
}

pub fn transcript_metadata_encode(data: TranscriptMetadata) {
  json.object(
    [
      #("autogenerated", json.bool(data.autogenerated)),
      #("enabled", json.bool(data.enabled)),
      #("clip_id", json.float(data.clip_id)),
      #("speaker_count", json.float(data.speaker_count)),
      #("kind", json.string(data.kind)),
      #("language", json.string(data.language)),
      #("deleted", json.bool(data.deleted)),
      #("container_id", json.string(data.container_id)),
      #("word_count", json.float(data.word_count)),
      #("id", json.string(data.id)),
      #("texttrack_id", json.float(data.texttrack_id)),
      #("transcript_status_uuid", json.string(data.transcript_status_uuid))
    ],
  )
}

pub fn purchase_interaction_decoder() {
  use buy <- decode.optional_field(
    "buy",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use subscribe <- decode.optional_field(
    "subscribe",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use rent <- decode.optional_field(
    "rent",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  decode.success(PurchaseInteraction(buy: buy, subscribe: subscribe, rent: rent))
}

pub fn purchase_interaction_encode(data: PurchaseInteraction) {
  json.object(
    [
      #(
        "buy",
        json.nullable(data.buy, fn(_) { panic as "Literal object inside field" }),
      ),
      #(
        "subscribe",
        json.nullable(
          data.subscribe,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #(
        "rent",
        json.nullable(
          data.rent,
          fn(_) { panic as "Literal object inside field" },
        ),
      )
    ],
  )
}

pub fn team_role_decoder() {
  use applicable_permission_policies <- decode.optional_field(
    "applicable_permission_policies",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use display_name <- decode.optional_field(
    "display_name",
    None,
    decode.optional(decode.string),
  )
  use uri <- decode.field("uri", decode.string)
  use count <- decode.optional_field(
    "count",
    None,
    decode.optional(decode.float),
  )
  use is_disabled <- decode.optional_field(
    "is_disabled",
    None,
    decode.optional(decode.bool),
  )
  use permission_level <- decode.optional_field(
    "permission_level",
    None,
    decode.optional(decode.string),
  )
  use role <- decode.optional_field("role", None, decode.optional(decode.string))
  use display_description <- decode.optional_field(
    "display_description",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    TeamRole(
      applicable_permission_policies: applicable_permission_policies,
      display_name: display_name,
      uri: uri,
      count: count,
      is_disabled: is_disabled,
      permission_level: permission_level,
      role: role,
      display_description: display_description,
    ),
  )
}

pub fn team_role_encode(data: TeamRole) {
  json.object(
    [
      #(
        "applicable_permission_policies",
        json.nullable(
          data.applicable_permission_policies,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #("display_name", json.nullable(data.display_name, json.string)),
      #("uri", json.string(data.uri)),
      #("count", json.nullable(data.count, json.float)),
      #("is_disabled", json.nullable(data.is_disabled, json.bool)),
      #("permission_level", json.nullable(data.permission_level, json.string)),
      #("role", json.nullable(data.role, json.string)),
      #(
        "display_description",
        json.nullable(data.display_description, json.string),
      )
    ],
  )
}

pub fn video_version_decoder() {
  use edit_session <- decode.field(
    "edit_session",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use upload <- decode.optional_field(
    "upload",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use app <- decode.field(
    "app",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use modified_time <- decode.field("modified_time", decode.string)
  use created_time <- decode.field("created_time", decode.string)
  use create_storyboard_id <- decode.optional_field(
    "create_storyboard_id",
    None,
    decode.optional(decode.string),
  )
  use active <- decode.field("active", decode.bool)
  use filename <- decode.field("filename", decode.string)
  use origin_variable_frame_resolution <- decode.optional_field(
    "origin_variable_frame_resolution",
    None,
    decode.optional(decode.bool),
  )
  use user <- decode.field(
    "user",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use uri <- decode.field("uri", decode.string)
  use upload_date <- decode.optional_field(
    "upload_date",
    None,
    decode.optional(decode.string),
  )
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use duration <- decode.optional_field(
    "duration",
    None,
    decode.optional(decode.float),
  )
  use play <- decode.optional_field(
    "play",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use transcode <- decode.optional_field(
    "transcode",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use download_config <- decode.field(
    "download_config",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use audio_track_quota <- decode.field(
    "audio_track_quota",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use can_restore_create <- decode.field("can_restore_create", decode.bool)
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use has_interactive <- decode.field("has_interactive", decode.bool)
  use filesize <- decode.optional_field(
    "filesize",
    None,
    decode.optional(decode.float),
  )
  decode.success(
    VideoVersion(
      edit_session: edit_session,
      upload: upload,
      app: app,
      modified_time: modified_time,
      created_time: created_time,
      create_storyboard_id: create_storyboard_id,
      active: active,
      filename: filename,
      origin_variable_frame_resolution: origin_variable_frame_resolution,
      user: user,
      uri: uri,
      upload_date: upload_date,
      metadata: metadata,
      duration: duration,
      play: play,
      transcode: transcode,
      download_config: download_config,
      audio_track_quota: audio_track_quota,
      can_restore_create: can_restore_create,
      description: description,
      has_interactive: has_interactive,
      filesize: filesize,
    ),
  )
}

pub fn video_version_encode(data: VideoVersion) {
  json.object(
    [
      #(
        "edit_session",
        fn(_) { panic as "Literal object inside field" }(data.edit_session),
      ),
      #(
        "upload",
        json.nullable(
          data.upload,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #("app", fn(_) { panic as "AllOf inside field" }(data.app)),
      #("modified_time", json.string(data.modified_time)),
      #("created_time", json.string(data.created_time)),
      #(
        "create_storyboard_id",
        json.nullable(data.create_storyboard_id, json.string),
      ),
      #("active", json.bool(data.active)),
      #("filename", json.string(data.filename)),
      #(
        "origin_variable_frame_resolution",
        json.nullable(data.origin_variable_frame_resolution, json.bool),
      ),
      #("user", fn(_) { panic as "AllOf inside field" }(data.user)),
      #("uri", json.string(data.uri)),
      #("upload_date", json.nullable(data.upload_date, json.string)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("duration", json.nullable(data.duration, json.float)),
      #(
        "play",
        json.nullable(data.play, fn(_) { panic as "AllOf inside field" }),
      ),
      #(
        "transcode",
        json.nullable(
          data.transcode,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #(
        "download_config",
        fn(_) { panic as "Literal object inside field" }(data.download_config),
      ),
      #(
        "audio_track_quota",
        fn(_) { panic as "Literal object inside field" }(data.audio_track_quota),
      ),
      #("can_restore_create", json.bool(data.can_restore_create)),
      #("description", json.nullable(data.description, json.string)),
      #("has_interactive", json.bool(data.has_interactive)),
      #("filesize", json.nullable(data.filesize, json.float))
    ],
  )
}

pub fn team_membership_decoder() {
  use applicable_permission_policies <- decode.field(
    "applicable_permission_policies",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use access_grant <- decode.optional_field(
    "access_grant",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use joined_time <- decode.field("joined_time", decode.string)
  use modified_time <- decode.field("modified_time", decode.string)
  use created_time <- decode.field("created_time", decode.string)
  use active <- decode.field("active", decode.bool)
  use exclude_sso <- decode.optional_field(
    "exclude_sso",
    None,
    decode.optional(decode.bool),
  )
  use user <- decode.field(
    "user",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use uri <- decode.field("uri", decode.string)
  use permission_actions <- decode.field(
    "permission_actions",
    decode.list(decode.string),
  )
  use resource_key <- decode.field("resource_key", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use has_folder_access <- decode.optional_field(
    "has_folder_access",
    None,
    decode.optional(decode.bool),
  )
  use status <- decode.field("status", decode.string)
  use permission_level <- decode.field("permission_level", decode.string)
  use role <- decode.field("role", decode.string)
  use invite_url <- decode.optional_field(
    "invite_url",
    None,
    decode.optional(decode.string),
  )
  use recently_reminded <- decode.optional_field(
    "recently_reminded",
    None,
    decode.optional(decode.bool),
  )
  use email <- decode.field("email", decode.string)
  use applicable_roles <- decode.field(
    "applicable_roles",
    decode.list(team_role_decoder()),
  )
  decode.success(
    TeamMembership(
      applicable_permission_policies: applicable_permission_policies,
      access_grant: access_grant,
      joined_time: joined_time,
      modified_time: modified_time,
      created_time: created_time,
      active: active,
      exclude_sso: exclude_sso,
      user: user,
      uri: uri,
      permission_actions: permission_actions,
      resource_key: resource_key,
      metadata: metadata,
      has_folder_access: has_folder_access,
      status: status,
      permission_level: permission_level,
      role: role,
      invite_url: invite_url,
      recently_reminded: recently_reminded,
      email: email,
      applicable_roles: applicable_roles,
    ),
  )
}

pub fn team_membership_encode(data: TeamMembership) {
  json.object(
    [
      #(
        "applicable_permission_policies",
        fn(_) { panic as "Literal object inside field" }(
          data.applicable_permission_policies,
        ),
      ),
      #(
        "access_grant",
        json.nullable(
          data.access_grant,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #("joined_time", json.string(data.joined_time)),
      #("modified_time", json.string(data.modified_time)),
      #("created_time", json.string(data.created_time)),
      #("active", json.bool(data.active)),
      #("exclude_sso", json.nullable(data.exclude_sso, json.bool)),
      #("user", fn(_) { panic as "AllOf inside field" }(data.user)),
      #("uri", json.string(data.uri)),
      #(
        "permission_actions",
        json.array(_, json.string)(data.permission_actions),
      ),
      #("resource_key", json.string(data.resource_key)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("has_folder_access", json.nullable(data.has_folder_access, json.bool)),
      #("status", json.string(data.status)),
      #("permission_level", json.string(data.permission_level)),
      #("role", json.string(data.role)),
      #("invite_url", json.nullable(data.invite_url, json.string)),
      #("recently_reminded", json.nullable(data.recently_reminded, json.bool)),
      #("email", json.string(data.email)),
      #(
        "applicable_roles",
        json.array(_, team_role_encode)(data.applicable_roles),
      )
    ],
  )
}

pub fn legacy_error_decoder() {
  use error <- decode.field("error", decode.string)
  decode.success(LegacyError(error: error))
}

pub fn legacy_error_encode(data: LegacyError) {
  json.object([#("error", json.string(data.error))])
}

pub fn domain_decoder() {
  use domain <- decode.field("domain", decode.string)
  use uri <- decode.field("uri", decode.string)
  use allow_hd <- decode.field("allow_hd", decode.bool)
  decode.success(Domain(domain: domain, uri: uri, allow_hd: allow_hd))
}

pub fn domain_encode(data: Domain) {
  json.object(
    [
      #("domain", json.string(data.domain)),
      #("uri", json.string(data.uri)),
      #("allow_hd", json.bool(data.allow_hd))
    ],
  )
}

pub fn federated_search_items_decoder() {
  use live_event <- decode.optional_field(
    "live_event",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use showcase <- decode.optional_field(
    "showcase",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use folder <- decode.optional_field(
    "folder",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use type_ <- decode.field("type", decode.string)
  use video <- decode.optional_field(
    "video",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  decode.success(
    FederatedSearchItems(
      live_event: live_event,
      showcase: showcase,
      folder: folder,
      type_: type_,
      video: video,
    ),
  )
}

pub fn federated_search_items_encode(data: FederatedSearchItems) {
  json.object(
    [
      #(
        "live_event",
        json.nullable(data.live_event, fn(_) { panic as "AllOf inside field" }),
      ),
      #(
        "showcase",
        json.nullable(data.showcase, fn(_) { panic as "AllOf inside field" }),
      ),
      #(
        "folder",
        json.nullable(data.folder, fn(_) { panic as "AllOf inside field" }),
      ),
      #("type", json.string(data.type_)),
      #(
        "video",
        json.nullable(data.video, fn(_) { panic as "AllOf inside field" }),
      )
    ],
  )
}

pub fn on_demand_page_decoder() {
  use content_rating <- decode.field(
    "content_rating",
    decode.list(decode.string),
  )
  use modified_time <- decode.optional_field(
    "modified_time",
    None,
    decode.optional(decode.string),
  )
  use film <- decode.optional_field(
    "film",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use created_time <- decode.optional_field(
    "created_time",
    None,
    decode.optional(decode.string),
  )
  use theme <- decode.field("theme", decode.string)
  use preorder <- decode.field(
    "preorder",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use name <- decode.field("name", decode.string)
  use user <- decode.field(
    "user",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use thumbnail <- decode.field(
    "thumbnail",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use uri <- decode.field("uri", decode.string)
  use background <- decode.field(
    "background",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use published <- decode.field(
    "published",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use resource_key <- decode.field("resource_key", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use colors <- decode.field(
    "colors",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use genres <- decode.field("genres", decode.list(on_demand_genre_decoder()))
  use trailer <- decode.field(
    "trailer",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use domain_link <- decode.optional_field(
    "domain_link",
    None,
    decode.optional(decode.string),
  )
  use pictures <- decode.field(
    "pictures",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use episodes <- decode.field(
    "episodes",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  use link <- decode.field("link", decode.string)
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use sku <- decode.optional_field("sku", None, decode.optional(decode.string))
  use subscription <- decode.optional_field(
    "subscription",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use rating <- decode.optional_field(
    "rating",
    None,
    decode.optional(decode.float),
  )
  decode.success(
    OnDemandPage(
      content_rating: content_rating,
      modified_time: modified_time,
      film: film,
      created_time: created_time,
      theme: theme,
      preorder: preorder,
      name: name,
      user: user,
      thumbnail: thumbnail,
      uri: uri,
      background: background,
      published: published,
      resource_key: resource_key,
      metadata: metadata,
      colors: colors,
      genres: genres,
      trailer: trailer,
      domain_link: domain_link,
      pictures: pictures,
      episodes: episodes,
      type_: type_,
      link: link,
      description: description,
      sku: sku,
      subscription: subscription,
      rating: rating,
    ),
  )
}

pub fn on_demand_page_encode(data: OnDemandPage) {
  json.object(
    [
      #("content_rating", json.array(_, json.string)(data.content_rating)),
      #("modified_time", json.nullable(data.modified_time, json.string)),
      #(
        "film",
        json.nullable(data.film, fn(_) { panic as "AllOf inside field" }),
      ),
      #("created_time", json.nullable(data.created_time, json.string)),
      #("theme", json.string(data.theme)),
      #(
        "preorder",
        fn(_) { panic as "Literal object inside field" }(data.preorder),
      ),
      #("name", json.string(data.name)),
      #("user", fn(_) { panic as "AllOf inside field" }(data.user)),
      #("thumbnail", fn(_) { panic as "AllOf inside field" }(data.thumbnail)),
      #("uri", json.string(data.uri)),
      #("background", fn(_) { panic as "AllOf inside field" }(data.background)),
      #(
        "published",
        fn(_) { panic as "Literal object inside field" }(data.published),
      ),
      #("resource_key", json.string(data.resource_key)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("colors", fn(_) { panic as "Literal object inside field" }(data.colors)),
      #("genres", json.array(_, on_demand_genre_encode)(data.genres)),
      #("trailer", fn(_) { panic as "AllOf inside field" }(data.trailer)),
      #("domain_link", json.nullable(data.domain_link, json.string)),
      #("pictures", fn(_) { panic as "AllOf inside field" }(data.pictures)),
      #(
        "episodes",
        fn(_) { panic as "Literal object inside field" }(data.episodes),
      ),
      #("type", json.string(data.type_)),
      #("link", json.string(data.link)),
      #("description", json.nullable(data.description, json.string)),
      #("sku", json.nullable(data.sku, json.string)),
      #(
        "subscription",
        json.nullable(
          data.subscription,
          fn(_) { panic as "Literal object inside field" },
        ),
      ),
      #("rating", json.nullable(data.rating, json.float))
    ],
  )
}

pub fn auth_error_decoder() {
  use error_description <- decode.field("error_description", decode.string)
  use error <- decode.field("error", decode.string)
  decode.success(AuthError(error_description: error_description, error: error))
}

pub fn auth_error_encode(data: AuthError) {
  json.object(
    [
      #("error_description", json.string(data.error_description)),
      #("error", json.string(data.error))
    ],
  )
}

pub fn channel_decoder() {
  use modified_time <- decode.field("modified_time", decode.string)
  use created_time <- decode.field("created_time", decode.string)
  use privacy <- decode.field(
    "privacy",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use name <- decode.field("name", decode.string)
  use user <- decode.field(
    "user",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use uri <- decode.field("uri", decode.string)
  use header <- decode.field(
    "header",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use resource_key <- decode.field("resource_key", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use pictures <- decode.field(
    "pictures",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use tags <- decode.field("tags", decode.list(tag_decoder()))
  use link <- decode.field("link", decode.string)
  use categories <- decode.field("categories", decode.list(category_decoder()))
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    Channel(
      modified_time: modified_time,
      created_time: created_time,
      privacy: privacy,
      name: name,
      user: user,
      uri: uri,
      header: header,
      resource_key: resource_key,
      metadata: metadata,
      pictures: pictures,
      tags: tags,
      link: link,
      categories: categories,
      description: description,
    ),
  )
}

pub fn channel_encode(data: Channel) {
  json.object(
    [
      #("modified_time", json.string(data.modified_time)),
      #("created_time", json.string(data.created_time)),
      #(
        "privacy",
        fn(_) { panic as "Literal object inside field" }(data.privacy),
      ),
      #("name", json.string(data.name)),
      #("user", fn(_) { panic as "AllOf inside field" }(data.user)),
      #("uri", json.string(data.uri)),
      #("header", fn(_) { panic as "AllOf inside field" }(data.header)),
      #("resource_key", json.string(data.resource_key)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("pictures", fn(_) { panic as "AllOf inside field" }(data.pictures)),
      #("tags", json.array(_, tag_encode)(data.tags)),
      #("link", json.string(data.link)),
      #("categories", json.array(_, category_encode)(data.categories)),
      #("description", json.nullable(data.description, json.string))
    ],
  )
}

pub fn fragments_decoder() {
  use uri <- decode.field("uri", decode.string)
  use metadata <- decode.field(
    "metadata",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use modified_on <- decode.field("modified_on", decode.string)
  use created_on <- decode.field("created_on", decode.string)
  use timecode <- decode.field("timecode", decode.float)
  decode.success(
    Fragments(
      uri: uri,
      metadata: metadata,
      modified_on: modified_on,
      created_on: created_on,
      timecode: timecode,
    ),
  )
}

pub fn fragments_encode(data: Fragments) {
  json.object(
    [
      #("uri", json.string(data.uri)),
      #(
        "metadata",
        fn(_) { panic as "Literal object inside field" }(data.metadata),
      ),
      #("modified_on", json.string(data.modified_on)),
      #("created_on", json.string(data.created_on)),
      #("timecode", json.float(data.timecode))
    ],
  )
}

pub fn recurring_event_low_latency_decoder() {
  use low_latency <- decode.field("lowLatency", decode.bool)
  decode.success(RecurringEventLowLatency(low_latency: low_latency))
}

pub fn recurring_event_low_latency_encode(data: RecurringEventLowLatency) {
  json.object([#("lowLatency", json.bool(data.low_latency))])
}

pub fn animated_thumbnail_decoder() {
  use file_size <- decode.field("file_size", decode.float)
  use width <- decode.field("width", decode.float)
  use height <- decode.field("height", decode.float)
  use link_with_play_button <- decode.field(
    "link_with_play_button",
    decode.string,
  )
  use start_time <- decode.field("start_time", decode.float)
  use profile_id <- decode.field("profile_id", decode.string)
  use duration <- decode.field("duration", decode.float)
  use is_downloadable <- decode.field("is_downloadable", decode.bool)
  use file_format <- decode.field("file_format", decode.string)
  use link <- decode.field("link", decode.string)
  use uuid <- decode.field("uuid", decode.string)
  decode.success(
    AnimatedThumbnail(
      file_size: file_size,
      width: width,
      height: height,
      link_with_play_button: link_with_play_button,
      start_time: start_time,
      profile_id: profile_id,
      duration: duration,
      is_downloadable: is_downloadable,
      file_format: file_format,
      link: link,
      uuid: uuid,
    ),
  )
}

pub fn animated_thumbnail_encode(data: AnimatedThumbnail) {
  json.object(
    [
      #("file_size", json.float(data.file_size)),
      #("width", json.float(data.width)),
      #("height", json.float(data.height)),
      #("link_with_play_button", json.string(data.link_with_play_button)),
      #("start_time", json.float(data.start_time)),
      #("profile_id", json.string(data.profile_id)),
      #("duration", json.float(data.duration)),
      #("is_downloadable", json.bool(data.is_downloadable)),
      #("file_format", json.string(data.file_format)),
      #("link", json.string(data.link)),
      #("uuid", json.string(data.uuid))
    ],
  )
}

pub fn alternate_audio_track_decoder() {
  use upload <- decode.field(
    "upload",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use provenance <- decode.field("provenance", decode.string)
  use active <- decode.field("active", decode.bool)
  use download <- decode.field(
    "download",
    decode.list(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use uri <- decode.field("uri", decode.string)
  use transcode <- decode.field(
    "transcode",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use quota <- decode.field(
    "quota",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use language <- decode.field(
    "language",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use type_ <- decode.field("type", decode.string)
  decode.success(
    AlternateAudioTrack(
      upload: upload,
      provenance: provenance,
      active: active,
      download: download,
      uri: uri,
      transcode: transcode,
      quota: quota,
      language: language,
      type_: type_,
    ),
  )
}

pub fn alternate_audio_track_encode(data: AlternateAudioTrack) {
  json.object(
    [
      #("upload", fn(_) { panic as "Literal object inside field" }(data.upload)),
      #("provenance", json.string(data.provenance)),
      #("active", json.bool(data.active)),
      #(
        "download",
        json.array(_, fn(_) { panic as "object in array" })(data.download),
      ),
      #("uri", json.string(data.uri)),
      #(
        "transcode",
        fn(_) { panic as "Literal object inside field" }(data.transcode),
      ),
      #("quota", fn(_) { panic as "Literal object inside field" }(data.quota)),
      #(
        "language",
        fn(_) { panic as "Literal object inside field" }(data.language),
      ),
      #("type", json.string(data.type_))
    ],
  )
}

pub fn editing_session_decoder() {
  use version_uri <- decode.optional_field(
    "version_uri",
    None,
    decode.optional(decode.string),
  )
  use min_tier_for_movie <- decode.field("min_tier_for_movie", decode.string)
  use is_rated <- decode.field("is_rated", decode.bool)
  use upload_attempt_id_version_uri <- decode.optional_field(
    "upload_attempt_id_version_uri",
    None,
    decode.optional(decode.string),
  )
  use is_music_licensed <- decode.field("is_music_licensed", decode.bool)
  use status <- decode.field("status", decode.string)
  use result_video_hash <- decode.field("result_video_hash", decode.string)
  use vsid <- decode.field("vsid", decode.float)
  use is_edited_by_tve <- decode.field("is_edited_by_tve", decode.bool)
  use is_max_resolution <- decode.field("is_max_resolution", decode.bool)
  use has_watermark <- decode.field("has_watermark", decode.bool)
  decode.success(
    EditingSession(
      version_uri: version_uri,
      min_tier_for_movie: min_tier_for_movie,
      is_rated: is_rated,
      upload_attempt_id_version_uri: upload_attempt_id_version_uri,
      is_music_licensed: is_music_licensed,
      status: status,
      result_video_hash: result_video_hash,
      vsid: vsid,
      is_edited_by_tve: is_edited_by_tve,
      is_max_resolution: is_max_resolution,
      has_watermark: has_watermark,
    ),
  )
}

pub fn editing_session_encode(data: EditingSession) {
  json.object(
    [
      #("version_uri", json.nullable(data.version_uri, json.string)),
      #("min_tier_for_movie", json.string(data.min_tier_for_movie)),
      #("is_rated", json.bool(data.is_rated)),
      #(
        "upload_attempt_id_version_uri",
        json.nullable(data.upload_attempt_id_version_uri, json.string),
      ),
      #("is_music_licensed", json.bool(data.is_music_licensed)),
      #("status", json.string(data.status)),
      #("result_video_hash", json.string(data.result_video_hash)),
      #("vsid", json.float(data.vsid)),
      #("is_edited_by_tve", json.bool(data.is_edited_by_tve)),
      #("is_max_resolution", json.bool(data.is_max_resolution)),
      #("has_watermark", json.bool(data.has_watermark))
    ],
  )
}

pub fn upload_attempt_decoder() {
  use form <- decode.optional_field("form", None, decode.optional(decode.string))
  use user <- decode.field(
    "user",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use uri <- decode.field("uri", decode.string)
  use ticket_id <- decode.field("ticket_id", decode.string)
  use clip <- decode.optional_field(
    "clip",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use upload_link <- decode.field("upload_link", decode.string)
  decode.success(
    UploadAttempt(
      form: form,
      user: user,
      uri: uri,
      ticket_id: ticket_id,
      clip: clip,
      upload_link: upload_link,
    ),
  )
}

pub fn upload_attempt_encode(data: UploadAttempt) {
  json.object(
    [
      #("form", json.nullable(data.form, json.string)),
      #("user", fn(_) { panic as "AllOf inside field" }(data.user)),
      #("uri", json.string(data.uri)),
      #("ticket_id", json.string(data.ticket_id)),
      #(
        "clip",
        json.nullable(data.clip, fn(_) { panic as "AllOf inside field" }),
      ),
      #("upload_link", json.string(data.upload_link))
    ],
  )
}

pub fn video_versions_size_decoder() {
  use num_versions <- decode.field("num_versions", decode.float)
  use file_size_type <- decode.field("file_size_type", decode.string)
  use total_size <- decode.field("total_size", decode.float)
  decode.success(
    VideoVersionsSize(
      num_versions: num_versions,
      file_size_type: file_size_type,
      total_size: total_size,
    ),
  )
}

pub fn video_versions_size_encode(data: VideoVersionsSize) {
  json.object(
    [
      #("num_versions", json.float(data.num_versions)),
      #("file_size_type", json.string(data.file_size_type)),
      #("total_size", json.float(data.total_size))
    ],
  )
}

pub fn money_decoder() {
  use unit <- decode.field("unit", decode.float)
  use currency <- decode.field("currency", decode.string)
  use amount <- decode.field("amount", decode.float)
  use formatted <- decode.field("formatted", decode.string)
  decode.success(
    Money(unit: unit, currency: currency, amount: amount, formatted: formatted),
  )
}

pub fn money_encode(data: Money) {
  json.object(
    [
      #("unit", json.float(data.unit)),
      #("currency", json.string(data.currency)),
      #("amount", json.float(data.amount)),
      #("formatted", json.string(data.formatted))
    ],
  )
}
