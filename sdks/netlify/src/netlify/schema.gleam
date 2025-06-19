import gleam/option.{type Option, None}
import netlify/utils
import gleam/json
import gleam/dynamic
import gleam/dynamic/decode
import gleam/dict

pub type BuildStatus {
  BuildStatus(
    active: Option(Int),
    pending_concurrency: Option(Int),
    enqueued: Option(Int),
    build_count: Option(Int),
    minutes: Option(Internal0),
  )
}

pub type RepoInfo {
  RepoInfo(
    installation_id: Option(Int),
    stop_builds: Option(Bool),
    repo_url: Option(String),
    allowed_branches: Option(List(String)),
    public_repo: Option(Bool),
    functions_dir: Option(String),
    private_logs: Option(Bool),
    dir: Option(String),
    env: Option(dict.Dict(String, String)),
    repo_branch: Option(String),
    provider: Option(String),
    repo_path: Option(String),
    deploy_key_id: Option(String),
    cmd: Option(String),
    id: Option(Int),
  )
}

pub type PluginRunData {
  PluginRunData(
    package: Option(String),
    summary: Option(String),
    reporting_event: Option(String),
    text: Option(String),
    state: Option(String),
    version: Option(String),
    title: Option(String),
  )
}

pub type DevServerHookSetup {
  DevServerHookSetup(
    branch: Option(String),
    title: Option(String),
    type_: Option(String),
  )
}

pub type Hook {
  Hook(
    created_at: Option(String),
    data: Option(Internal1),
    site_id: Option(String),
    updated_at: Option(String),
    event: Option(String),
    type_: Option(String),
    id: Option(String),
    disabled: Option(Bool),
  )
}

pub type TrafficRulesRateLimitConfig {
  TrafficRulesRateLimitConfig(
    window_limit: Option(Int),
    algorithm: Option(String),
    window_size: Option(Int),
  )
}

pub type AccountMembership {
  AccountMembership(
    type_id: Option(String),
    payment_method_id: Option(String),
    billing_period: Option(String),
    roles_allowed: Option(List(String)),
    created_at: Option(String),
    name: Option(String),
    slug: Option(String),
    owner_ids: Option(List(String)),
    billing_name: Option(String),
    type_name: Option(String),
    capabilities: Option(Internal2),
    updated_at: Option(String),
    billing_email: Option(String),
    type_: Option(String),
    id: Option(String),
    billing_details: Option(String),
  )
}

pub type Form {
  Form(
    created_at: Option(String),
    name: Option(String),
    paths: Option(List(String)),
    site_id: Option(String),
    fields: Option(List(Internal3)),
    id: Option(String),
    submission_count: Option(Int),
  )
}

pub type EnvVarUser {
  EnvVarUser(
    avatar_url: Option(String),
    id: Option(String),
    full_name: Option(String),
    email: Option(String),
  )
}

pub type Deploy {
  Deploy(
    draft: Option(Bool),
    branch: Option(String),
    review_id: Option(Float),
    published_at: Option(String),
    deploy_ssl_url: Option(String),
    commit_url: Option(String),
    review_url: Option(String),
    created_at: Option(String),
    locked: Option(Bool),
    commit_ref: Option(String),
    name: Option(String),
    build_id: Option(String),
    url: Option(String),
    context: Option(String),
    user_id: Option(String),
    error_message: Option(String),
    skipped: Option(Bool),
    state: Option(String),
    site_id: Option(String),
    function_schedules: Option(List(FunctionSchedule)),
    screenshot_url: Option(String),
    deploy_url: Option(String),
    updated_at: Option(String),
    title: Option(String),
    id: Option(String),
    required_functions: Option(List(String)),
    ssl_url: Option(String),
    framework: Option(String),
    admin_url: Option(String),
    required: Option(List(String)),
  )
}

pub type TrafficRulesAggregateConfig {
  TrafficRulesAggregateConfig(keys: Option(List(Internal4)))
}

pub type PaymentMethod {
  PaymentMethod(
    method_name: Option(String),
    created_at: Option(String),
    data: Option(Internal5),
    state: Option(String),
    updated_at: Option(String),
    type_: Option(String),
    id: Option(String),
  )
}

pub type AccountUpdateSetup {
  AccountUpdateSetup(
    type_id: Option(String),
    name: Option(String),
    slug: Option(String),
    extra_seats_block: Option(Int),
    billing_name: Option(String),
    billing_email: Option(String),
    billing_details: Option(String),
  )
}

pub type AccountType {
  AccountType(
    monthly_seats_addon_dollar_price: Option(Int),
    yearly_seats_addon_dollar_price: Option(Int),
    name: Option(String),
    capabilities: Option(Internal6),
    monthly_dollar_price: Option(Int),
    id: Option(String),
    yearly_dollar_price: Option(Int),
    description: Option(String),
  )
}

pub type Site {
  Site(
    domain_aliases: Option(List(String)),
    deploy_preview_custom_domain: Option(String),
    session_id: Option(String),
    id_domain: Option(String),
    notification_email: Option(String),
    managed_dns: Option(Bool),
    plan: Option(String),
    build_image: Option(String),
    created_at: Option(String),
    name: Option(String),
    ssl: Option(Bool),
    account_id: Option(String),
    url: Option(String),
    user_id: Option(String),
    processing_settings: Option(Internal8),
    state: Option(String),
    custom_domain: Option(String),
    build_settings: Option(RepoInfo),
    screenshot_url: Option(String),
    capabilities: Option(dict.Dict(String, Internal9)),
    deploy_url: Option(String),
    updated_at: Option(String),
    branch_deploy_custom_domain: Option(String),
    default_hooks_data: Option(Internal10),
    functions_region: Option(String),
    published_deploy: Option(Deploy),
    force_ssl: Option(Bool),
    prerender: Option(String),
    id: Option(String),
    deploy_hook: Option(String),
    password: Option(String),
    ssl_url: Option(String),
    account_name: Option(String),
    account_slug: Option(String),
    git_provider: Option(String),
    admin_url: Option(String),
  )
}

pub type ExcludedFunctionRoute {
  ExcludedFunctionRoute(
    literal: Option(String),
    pattern: Option(String),
    expression: Option(String),
  )
}

pub type DeployedBranch {
  DeployedBranch(
    name: Option(String),
    slug: Option(String),
    url: Option(String),
    deploy_id: Option(String),
    id: Option(String),
    ssl_url: Option(String),
  )
}

pub type Error {
  Error(message: String, code: Option(Int))
}

pub type DnsZoneSetup {
  DnsZoneSetup(
    name: Option(String),
    site_id: Option(String),
    account_slug: Option(String),
  )
}

pub type AssetSignature {
  AssetSignature(form: Option(AssetForm), asset: Option(Asset))
}

pub type AuditLog {
  AuditLog(
    account_id: Option(String),
    payload: Option(Internal12),
    id: Option(String),
  )
}

pub type SniCertificate {
  SniCertificate(
    created_at: Option(String),
    domains: Option(List(String)),
    state: Option(String),
    updated_at: Option(String),
    expires_at: Option(String),
  )
}

pub type ServiceInstance {
  ServiceInstance(
    config: Option(Internal13),
    created_at: Option(String),
    external_attributes: Option(Internal14),
    env: Option(Internal15),
    url: Option(String),
    service_path: Option(String),
    service_name: Option(String),
    service_slug: Option(String),
    snippets: Option(List(Internal16)),
    updated_at: Option(String),
    auth_url: Option(String),
    id: Option(String),
  )
}

pub type Purge {
  Purge(
    site_slug: Option(String),
    site_id: Option(String),
    cache_tags: Option(List(String)),
  )
}

pub type BuildLogMsg {
  BuildLogMsg(
    section: Option(String),
    message: Option(String),
    error: Option(Bool),
  )
}

pub type User {
  User(
    last_login: Option(String),
    avatar_url: Option(String),
    created_at: Option(String),
    login_providers: Option(List(String)),
    affiliate_id: Option(String),
    uid: Option(String),
    onboarding_progress: Option(Internal17),
    site_count: Option(Int),
    id: Option(String),
    full_name: Option(String),
    email: Option(String),
  )
}

pub type BuildHookSetup {
  BuildHookSetup(branch: Option(String), title: Option(String))
}

pub type SplitTest {
  SplitTest(
    path_: Option(String),
    active: Option(Bool),
    created_at: Option(String),
    name: Option(String),
    branches: Option(List(Internal18)),
    site_id: Option(String),
    updated_at: Option(String),
    id: Option(String),
    unpublished_at: Option(String),
  )
}

pub type Ticket {
  Ticket(
    created_at: Option(String),
    client_id: Option(String),
    id: Option(String),
    authorized: Option(Bool),
  )
}

pub type Submission {
  Submission(
    body: Option(String),
    summary: Option(String),
    number: Option(Int),
    created_at: Option(String),
    data: Option(Internal19),
    name: Option(String),
    last_name: Option(String),
    site_url: Option(String),
    first_name: Option(String),
    id: Option(String),
    email: Option(String),
    company: Option(String),
  )
}

pub type AccountUsageCapability {
  AccountUsageCapability(included: Option(Int), used: Option(Int))
}

pub type AccountUpdateMemberSetup {
  AccountUpdateMemberSetup(
    site_ids: Option(List(String)),
    role: Option(String),
    site_access: Option(String),
  )
}

pub type Build {
  Build(
    done: Option(Bool),
    error: Option(String),
    created_at: Option(String),
    sha: Option(String),
    deploy_id: Option(String),
    id: Option(String),
  )
}

pub type AccountAddMemberSetup {
  AccountAddMemberSetup(role: Option(String), email: Option(String))
}

pub type BuildSetup {
  BuildSetup(clear_cache: Option(Bool), image: Option(String))
}

pub type FunctionSchedule {
  FunctionSchedule(name: Option(String), cron: Option(String))
}

pub type Metadata {
  Metadata()
}

pub type AccountSetup {
  AccountSetup(
    type_id: String,
    payment_method_id: Option(String),
    period: Option(String),
    name: String,
    extra_seats_block: Option(Int),
  )
}

pub type DeployFiles {
  DeployFiles(
    draft: Option(Bool),
    branch: Option(String),
    functions_config: Option(dict.Dict(String, FunctionConfig)),
    function_schedules: Option(List(FunctionSchedule)),
    files: Option(Internal20),
    framework_version: Option(String),
    functions: Option(Internal21),
    async: Option(Bool),
    framework: Option(String),
  )
}

pub type Asset {
  Asset(
    content_type: Option(String),
    size: Option(Int),
    created_at: Option(String),
    name: Option(String),
    creator_id: Option(String),
    url: Option(String),
    state: Option(String),
    visibility: Option(String),
    site_id: Option(String),
    updated_at: Option(String),
    id: Option(String),
    key: Option(String),
  )
}

pub type BuildHook {
  BuildHook(
    branch: Option(String),
    created_at: Option(String),
    url: Option(String),
    site_id: Option(String),
    title: Option(String),
    id: Option(String),
  )
}

pub type FunctionRoute {
  FunctionRoute(
    literal: Option(String),
    pattern: Option(String),
    methods: Option(List(String)),
    expression: Option(String),
    prefer_static: Option(Bool),
  )
}

pub type SplitTestSetup {
  SplitTestSetup(branch_tests: Option(Internal22))
}

pub type Plugin {
  Plugin(package: Option(String), pinned_version: Option(String))
}

pub type AssetForm {
  AssetForm(url: Option(String), fields: Option(dict.Dict(String, String)))
}

pub type DnsZone {
  DnsZone(
    records: Option(List(DnsRecord)),
    domain: Option(String),
    ipv6_enabled: Option(Bool),
    created_at: Option(String),
    name: Option(String),
    errors: Option(List(String)),
    account_id: Option(String),
    dedicated: Option(Bool),
    user_id: Option(String),
    site_id: Option(String),
    updated_at: Option(String),
    dns_servers: Option(List(String)),
    id: Option(String),
    supported_record_types: Option(List(String)),
    account_name: Option(String),
    account_slug: Option(String),
  )
}

pub type Service {
  Service(
    environments: Option(List(String)),
    created_at: Option(String),
    name: Option(String),
    slug: Option(String),
    service_path: Option(String),
    updated_at: Option(String),
    tags: Option(List(String)),
    icon: Option(String),
    events: Option(List(Internal23)),
    long_description: Option(String),
    id: Option(String),
    description: Option(String),
    manifest_url: Option(String),
  )
}

pub type AccessToken {
  AccessToken(
    user_email: Option(String),
    created_at: Option(String),
    user_id: Option(String),
    id: Option(String),
    access_token: Option(String),
  )
}

pub type DnsRecordCreate {
  DnsRecordCreate(
    port: Option(Int),
    priority: Option(Int),
    ttl: Option(Int),
    flag: Option(Int),
    value: Option(String),
    hostname: Option(String),
    weight: Option(Int),
    type_: Option(String),
    tag: Option(String),
  )
}

pub type EnvVarValue {
  EnvVarValue(
    context: Option(String),
    value: Option(String),
    context_parameter: Option(String),
    id: Option(String),
  )
}

pub type DevServer {
  DevServer(
    branch: Option(String),
    live_at: Option(String),
    created_at: Option(String),
    error_at: Option(String),
    url: Option(String),
    done_at: Option(String),
    state: Option(String),
    starting_at: Option(String),
    site_id: Option(String),
    updated_at: Option(String),
    title: Option(String),
    id: Option(String),
  )
}

pub type Function {
  Function(name: Option(String), sha: Option(String), id: Option(String))
}

pub type DeployKey {
  DeployKey(
    public_key: Option(String),
    created_at: Option(String),
    id: Option(String),
  )
}

pub type PluginParams {
  PluginParams(pinned_version: Option(String))
}

pub type FunctionConfig {
  FunctionConfig(
    priority: Option(Int),
    display_name: Option(String),
    routes: Option(List(FunctionRoute)),
    generator: Option(String),
    traffic_rules: Option(TrafficRulesConfig),
    build_data: Option(Internal26),
    excluded_routes: Option(List(ExcludedFunctionRoute)),
  )
}

pub type Member {
  Member(
    role: Option(String),
    avatar: Option(String),
    id: Option(String),
    full_name: Option(String),
    email: Option(String),
  )
}

pub type DnsRecord {
  DnsRecord(
    priority: Option(Int),
    ttl: Option(Int),
    flag: Option(Int),
    value: Option(String),
    hostname: Option(String),
    site_id: Option(String),
    dns_zone_id: Option(String),
    type_: Option(String),
    tag: Option(String),
    id: Option(String),
    managed: Option(Bool),
  )
}

pub type EnvVar {
  EnvVar(
    values: Option(List(EnvVarValue)),
    is_secret: Option(Bool),
    updated_at: Option(String),
    updated_by: Option(EnvVarUser),
    scopes: Option(List(String)),
    key: Option(String),
  )
}

pub type DevServerHook {
  DevServerHook(
    branch: Option(String),
    created_at: Option(String),
    url: Option(String),
    site_id: Option(String),
    title: Option(String),
    type_: Option(String),
    id: Option(String),
  )
}

pub type TrafficRulesConfig {
  TrafficRulesConfig(action: Option(Internal28))
}

pub type File {
  File(
    size: Option(Int),
    path_: Option(String),
    mime_type: Option(String),
    sha: Option(String),
    id: Option(String),
  )
}

pub type Snippet {
  Snippet(
    general_position: Option(String),
    general: Option(String),
    site_id: Option(String),
    goal: Option(String),
    goal_position: Option(String),
    title: Option(String),
    id: Option(Int),
  )
}

pub type HookType {
  HookType(
    name: Option(String),
    events: Option(List(String)),
    fields: Option(List(Internal29)),
  )
}

pub type SiteFunction {
  SiteFunction(
    branch: Option(String),
    created_at: Option(String),
    provider: Option(String),
    log_type: Option(String),
    id: Option(String),
    functions: Option(List(Internal30)),
  )
}

pub type AssetPublicSignature {
  AssetPublicSignature(url: Option(String))
}

pub type Internal0 {
  Internal0(
    last_updated_at: Option(String),
    included_minutes_with_packs: Option(String),
    current_average_sec: Option(Int),
    period_start_date: Option(String),
    period_end_date: Option(String),
    previous: Option(Int),
    current: Option(Int),
    included_minutes: Option(String),
  )
}

pub type Internal1 {
  Internal1()
}

pub type Internal2 {
  Internal2(
    sites: Option(AccountUsageCapability),
    collaborators: Option(AccountUsageCapability),
  )
}

pub type Internal3 {
  Internal3()
}

pub type Internal4 {
  Internal4(type_: Option(String))
}

pub type Internal5 {
  Internal5(
    card_type: Option(String),
    email: Option(String),
    last4: Option(String),
  )
}

pub type Internal6 {
  Internal6()
}

pub type Internal7 {
  Internal7(pretty_urls: Option(Bool))
}

pub type Internal8 {
  Internal8(html: Option(Internal7))
}

pub type Internal9 {
  Internal9()
}

pub type Internal10 {
  Internal10(access_token: Option(String))
}

pub type Internal11 {
  Internal11()
}

pub type Internal12 {
  Internal12(
    actor_id: Option(String),
    actor_email: Option(String),
    actor_name: Option(String),
    log_type: Option(String),
    timestamp: Option(String),
    action: Option(String),
    additional_properties: dict.Dict(String, Internal11),
  )
}

pub type Internal13 {
  Internal13()
}

pub type Internal14 {
  Internal14()
}

pub type Internal15 {
  Internal15()
}

pub type Internal16 {
  Internal16()
}

pub type Internal17 {
  Internal17(slides: Option(String))
}

pub type Internal18 {
  Internal18()
}

pub type Internal19 {
  Internal19()
}

pub type Internal20 {
  Internal20()
}

pub type Internal21 {
  Internal21()
}

pub type Internal22 {
  Internal22()
}

pub type Internal23 {
  Internal23()
}

pub type Internal24 {
  Internal24(repo: Option(RepoInfo))
}

pub type Internal25 {
  Internal25(deploy_id: Option(String))
}

pub type Internal26 {
  Internal26()
}

pub type Internal27 {
  Internal27(
    rate_limit_config: Option(TrafficRulesRateLimitConfig),
    to: Option(String),
    aggregate: Option(TrafficRulesAggregateConfig),
  )
}

pub type Internal28 {
  Internal28(config: Option(Internal27), type_: Option(String))
}

pub type Internal29 {
  Internal29()
}

pub type Internal30 {
  Internal30()
}

pub type SplitTests =
  List(SplitTest)

pub type SiteSetup =
  #(Site, Internal24)

pub type PluginRun =
  #(PluginRunData, Internal25)

pub type DnsRecords =
  List(DnsRecord)

pub type DnsZones =
  List(DnsZone)

pub fn internal_30_decoder() {
  decode.success(Internal30)
}

pub fn internal_30_encode(_data: Internal30) {
  json.object([])
}

pub fn internal_29_decoder() {
  decode.success(Internal29)
}

pub fn internal_29_encode(_data: Internal29) {
  json.object([])
}

pub fn internal_28_decoder() {
  use config <- decode.optional_field(
    "config",
    None,
    decode.optional(internal_27_decoder()),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  decode.success(Internal28(config: config, type_: type_))
}

pub fn internal_28_encode(data: Internal28) {
  json.object(
    [
      #("config", json.nullable(data.config, internal_27_encode)),
      #("type", json.nullable(data.type_, json.string))
    ],
  )
}

pub fn internal_27_decoder() {
  use rate_limit_config <- decode.optional_field(
    "rate_limit_config",
    None,
    decode.optional(traffic_rules_rate_limit_config_decoder()),
  )
  use to <- decode.optional_field("to", None, decode.optional(decode.string))
  use aggregate <- decode.optional_field(
    "aggregate",
    None,
    decode.optional(traffic_rules_aggregate_config_decoder()),
  )
  decode.success(
    Internal27(
      rate_limit_config: rate_limit_config,
      to: to,
      aggregate: aggregate,
    ),
  )
}

pub fn internal_27_encode(data: Internal27) {
  json.object(
    [
      #(
        "rate_limit_config",
        json.nullable(
          data.rate_limit_config,
          traffic_rules_rate_limit_config_encode,
        ),
      ),
      #("to", json.nullable(data.to, json.string)),
      #(
        "aggregate",
        json.nullable(data.aggregate, traffic_rules_aggregate_config_encode),
      )
    ],
  )
}

pub fn internal_26_decoder() {
  decode.success(Internal26)
}

pub fn internal_26_encode(_data: Internal26) {
  json.object([])
}

pub fn internal_25_decoder() {
  use deploy_id <- decode.optional_field(
    "deploy_id",
    None,
    decode.optional(decode.string),
  )
  decode.success(Internal25(deploy_id: deploy_id))
}

pub fn internal_25_encode(data: Internal25) {
  json.object([#("deploy_id", json.nullable(data.deploy_id, json.string))])
}

pub fn internal_24_decoder() {
  use repo <- decode.optional_field(
    "repo",
    None,
    decode.optional(repo_info_decoder()),
  )
  decode.success(Internal24(repo: repo))
}

pub fn internal_24_encode(data: Internal24) {
  json.object([#("repo", json.nullable(data.repo, repo_info_encode))])
}

pub fn internal_23_decoder() {
  decode.success(Internal23)
}

pub fn internal_23_encode(_data: Internal23) {
  json.object([])
}

pub fn internal_22_decoder() {
  decode.success(Internal22)
}

pub fn internal_22_encode(_data: Internal22) {
  json.object([])
}

pub fn internal_21_decoder() {
  decode.success(Internal21)
}

pub fn internal_21_encode(_data: Internal21) {
  json.object([])
}

pub fn internal_20_decoder() {
  decode.success(Internal20)
}

pub fn internal_20_encode(_data: Internal20) {
  json.object([])
}

pub fn internal_19_decoder() {
  decode.success(Internal19)
}

pub fn internal_19_encode(_data: Internal19) {
  json.object([])
}

pub fn internal_18_decoder() {
  decode.success(Internal18)
}

pub fn internal_18_encode(_data: Internal18) {
  json.object([])
}

pub fn internal_17_decoder() {
  use slides <- decode.optional_field(
    "slides",
    None,
    decode.optional(decode.string),
  )
  decode.success(Internal17(slides: slides))
}

pub fn internal_17_encode(data: Internal17) {
  json.object([#("slides", json.nullable(data.slides, json.string))])
}

pub fn internal_16_decoder() {
  decode.success(Internal16)
}

pub fn internal_16_encode(_data: Internal16) {
  json.object([])
}

pub fn internal_15_decoder() {
  decode.success(Internal15)
}

pub fn internal_15_encode(_data: Internal15) {
  json.object([])
}

pub fn internal_14_decoder() {
  decode.success(Internal14)
}

pub fn internal_14_encode(_data: Internal14) {
  json.object([])
}

pub fn internal_13_decoder() {
  decode.success(Internal13)
}

pub fn internal_13_encode(_data: Internal13) {
  json.object([])
}

pub fn internal_12_decoder() {
  use actor_id <- decode.optional_field(
    "actor_id",
    None,
    decode.optional(decode.string),
  )
  use actor_email <- decode.optional_field(
    "actor_email",
    None,
    decode.optional(decode.string),
  )
  use actor_name <- decode.optional_field(
    "actor_name",
    None,
    decode.optional(decode.string),
  )
  use log_type <- decode.optional_field(
    "log_type",
    None,
    decode.optional(decode.string),
  )
  use timestamp <- decode.optional_field(
    "timestamp",
    None,
    decode.optional(decode.string),
  )
  use action <- decode.optional_field(
    "action",
    None,
    decode.optional(decode.string),
  )
  use additional_properties <- utils.decode_additional(
    ["actor_id", "actor_email", "actor_name", "log_type", "timestamp", "action"],
    internal_11_decoder(),
  )
  decode.success(
    Internal12(
      actor_id: actor_id,
      actor_email: actor_email,
      actor_name: actor_name,
      log_type: log_type,
      timestamp: timestamp,
      action: action,
      additional_properties: additional_properties,
    ),
  )
}

pub fn internal_12_encode(data: Internal12) {
  json.object(
    [
      #("actor_id", json.nullable(data.actor_id, json.string)),
      #("actor_email", json.nullable(data.actor_email, json.string)),
      #("actor_name", json.nullable(data.actor_name, json.string)),
      #("log_type", json.nullable(data.log_type, json.string)),
      #("timestamp", json.nullable(data.timestamp, json.string)),
      #("action", json.nullable(data.action, json.string)),
      ..dict.to_list(
        dict.map_values(
          data.additional_properties,
          fn(_key, value) { internal_11_encode(value) },
        ),
      )
    ],
  )
}

pub fn internal_11_decoder() {
  decode.success(Internal11)
}

pub fn internal_11_encode(_data: Internal11) {
  json.object([])
}

pub fn internal_10_decoder() {
  use access_token <- decode.optional_field(
    "access_token",
    None,
    decode.optional(decode.string),
  )
  decode.success(Internal10(access_token: access_token))
}

pub fn internal_10_encode(data: Internal10) {
  json.object([#("access_token", json.nullable(data.access_token, json.string))])
}

pub fn internal_9_decoder() {
  decode.success(Internal9)
}

pub fn internal_9_encode(_data: Internal9) {
  json.object([])
}

pub fn internal_8_decoder() {
  use html <- decode.optional_field(
    "html",
    None,
    decode.optional(internal_7_decoder()),
  )
  decode.success(Internal8(html: html))
}

pub fn internal_8_encode(data: Internal8) {
  json.object([#("html", json.nullable(data.html, internal_7_encode))])
}

pub fn internal_7_decoder() {
  use pretty_urls <- decode.optional_field(
    "pretty_urls",
    None,
    decode.optional(decode.bool),
  )
  decode.success(Internal7(pretty_urls: pretty_urls))
}

pub fn internal_7_encode(data: Internal7) {
  json.object([#("pretty_urls", json.nullable(data.pretty_urls, json.bool))])
}

pub fn internal_6_decoder() {
  decode.success(Internal6)
}

pub fn internal_6_encode(_data: Internal6) {
  json.object([])
}

pub fn internal_5_decoder() {
  use card_type <- decode.optional_field(
    "card_type",
    None,
    decode.optional(decode.string),
  )
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.string),
  )
  use last4 <- decode.optional_field(
    "last4",
    None,
    decode.optional(decode.string),
  )
  decode.success(Internal5(card_type: card_type, email: email, last4: last4))
}

pub fn internal_5_encode(data: Internal5) {
  json.object(
    [
      #("card_type", json.nullable(data.card_type, json.string)),
      #("email", json.nullable(data.email, json.string)),
      #("last4", json.nullable(data.last4, json.string))
    ],
  )
}

pub fn internal_4_decoder() {
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  decode.success(Internal4(type_: type_))
}

pub fn internal_4_encode(data: Internal4) {
  json.object([#("type", json.nullable(data.type_, json.string))])
}

pub fn internal_3_decoder() {
  decode.success(Internal3)
}

pub fn internal_3_encode(_data: Internal3) {
  json.object([])
}

pub fn internal_2_decoder() {
  use sites <- decode.optional_field(
    "sites",
    None,
    decode.optional(account_usage_capability_decoder()),
  )
  use collaborators <- decode.optional_field(
    "collaborators",
    None,
    decode.optional(account_usage_capability_decoder()),
  )
  decode.success(Internal2(sites: sites, collaborators: collaborators))
}

pub fn internal_2_encode(data: Internal2) {
  json.object(
    [
      #("sites", json.nullable(data.sites, account_usage_capability_encode)),
      #(
        "collaborators",
        json.nullable(data.collaborators, account_usage_capability_encode),
      )
    ],
  )
}

pub fn internal_1_decoder() {
  decode.success(Internal1)
}

pub fn internal_1_encode(_data: Internal1) {
  json.object([])
}

pub fn internal_0_decoder() {
  use last_updated_at <- decode.optional_field(
    "last_updated_at",
    None,
    decode.optional(decode.string),
  )
  use included_minutes_with_packs <- decode.optional_field(
    "included_minutes_with_packs",
    None,
    decode.optional(decode.string),
  )
  use current_average_sec <- decode.optional_field(
    "current_average_sec",
    None,
    decode.optional(decode.int),
  )
  use period_start_date <- decode.optional_field(
    "period_start_date",
    None,
    decode.optional(decode.string),
  )
  use period_end_date <- decode.optional_field(
    "period_end_date",
    None,
    decode.optional(decode.string),
  )
  use previous <- decode.optional_field(
    "previous",
    None,
    decode.optional(decode.int),
  )
  use current <- decode.optional_field(
    "current",
    None,
    decode.optional(decode.int),
  )
  use included_minutes <- decode.optional_field(
    "included_minutes",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    Internal0(
      last_updated_at: last_updated_at,
      included_minutes_with_packs: included_minutes_with_packs,
      current_average_sec: current_average_sec,
      period_start_date: period_start_date,
      period_end_date: period_end_date,
      previous: previous,
      current: current,
      included_minutes: included_minutes,
    ),
  )
}

pub fn internal_0_encode(data: Internal0) {
  json.object(
    [
      #("last_updated_at", json.nullable(data.last_updated_at, json.string)),
      #(
        "included_minutes_with_packs",
        json.nullable(data.included_minutes_with_packs, json.string),
      ),
      #("current_average_sec", json.nullable(data.current_average_sec, json.int)),
      #("period_start_date", json.nullable(data.period_start_date, json.string)),
      #("period_end_date", json.nullable(data.period_end_date, json.string)),
      #("previous", json.nullable(data.previous, json.int)),
      #("current", json.nullable(data.current, json.int)),
      #("included_minutes", json.nullable(data.included_minutes, json.string))
    ],
  )
}

pub fn asset_public_signature_decoder() {
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  decode.success(AssetPublicSignature(url: url))
}

pub fn asset_public_signature_encode(data: AssetPublicSignature) {
  json.object([#("url", json.nullable(data.url, json.string))])
}

pub fn site_function_decoder() {
  use branch <- decode.optional_field(
    "branch",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use provider <- decode.optional_field(
    "provider",
    None,
    decode.optional(decode.string),
  )
  use log_type <- decode.optional_field(
    "log_type",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use functions <- decode.optional_field(
    "functions",
    None,
    decode.optional(decode.list(internal_30_decoder())),
  )
  decode.success(
    SiteFunction(
      branch: branch,
      created_at: created_at,
      provider: provider,
      log_type: log_type,
      id: id,
      functions: functions,
    ),
  )
}

pub fn site_function_encode(data: SiteFunction) {
  json.object(
    [
      #("branch", json.nullable(data.branch, json.string)),
      #("created_at", json.nullable(data.created_at, json.string)),
      #("provider", json.nullable(data.provider, json.string)),
      #("log_type", json.nullable(data.log_type, json.string)),
      #("id", json.nullable(data.id, json.string)),
      #(
        "functions",
        json.nullable(data.functions, json.array(_, internal_30_encode)),
      )
    ],
  )
}

pub fn dns_zones_decoder() {
  decode.list(dns_zone_decoder())
}

pub fn dns_zones_encode(data: DnsZones) {
  json.array(data, dns_zone_encode)
}

pub fn hook_type_decoder() {
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use events <- decode.optional_field(
    "events",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use fields <- decode.optional_field(
    "fields",
    None,
    decode.optional(decode.list(internal_29_decoder())),
  )
  decode.success(HookType(name: name, events: events, fields: fields))
}

pub fn hook_type_encode(data: HookType) {
  json.object(
    [
      #("name", json.nullable(data.name, json.string)),
      #("events", json.nullable(data.events, json.array(_, json.string))),
      #("fields", json.nullable(data.fields, json.array(_, internal_29_encode)))
    ],
  )
}

pub fn snippet_decoder() {
  use general_position <- decode.optional_field(
    "general_position",
    None,
    decode.optional(decode.string),
  )
  use general <- decode.optional_field(
    "general",
    None,
    decode.optional(decode.string),
  )
  use site_id <- decode.optional_field(
    "site_id",
    None,
    decode.optional(decode.string),
  )
  use goal <- decode.optional_field("goal", None, decode.optional(decode.string))
  use goal_position <- decode.optional_field(
    "goal_position",
    None,
    decode.optional(decode.string),
  )
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  decode.success(
    Snippet(
      general_position: general_position,
      general: general,
      site_id: site_id,
      goal: goal,
      goal_position: goal_position,
      title: title,
      id: id,
    ),
  )
}

pub fn snippet_encode(data: Snippet) {
  json.object(
    [
      #("general_position", json.nullable(data.general_position, json.string)),
      #("general", json.nullable(data.general, json.string)),
      #("site_id", json.nullable(data.site_id, json.string)),
      #("goal", json.nullable(data.goal, json.string)),
      #("goal_position", json.nullable(data.goal_position, json.string)),
      #("title", json.nullable(data.title, json.string)),
      #("id", json.nullable(data.id, json.int))
    ],
  )
}

pub fn file_decoder() {
  use size <- decode.optional_field("size", None, decode.optional(decode.int))
  use path_ <- decode.optional_field(
    "path",
    None,
    decode.optional(decode.string),
  )
  use mime_type <- decode.optional_field(
    "mime_type",
    None,
    decode.optional(decode.string),
  )
  use sha <- decode.optional_field("sha", None, decode.optional(decode.string))
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  decode.success(
    File(size: size, path_: path_, mime_type: mime_type, sha: sha, id: id),
  )
}

pub fn file_encode(data: File) {
  json.object(
    [
      #("size", json.nullable(data.size, json.int)),
      #("path", json.nullable(data.path_, json.string)),
      #("mime_type", json.nullable(data.mime_type, json.string)),
      #("sha", json.nullable(data.sha, json.string)),
      #("id", json.nullable(data.id, json.string))
    ],
  )
}

pub fn traffic_rules_config_decoder() {
  use action <- decode.optional_field(
    "action",
    None,
    decode.optional(internal_28_decoder()),
  )
  decode.success(TrafficRulesConfig(action: action))
}

pub fn traffic_rules_config_encode(data: TrafficRulesConfig) {
  json.object([#("action", json.nullable(data.action, internal_28_encode))])
}

pub fn dev_server_hook_decoder() {
  use branch <- decode.optional_field(
    "branch",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  use site_id <- decode.optional_field(
    "site_id",
    None,
    decode.optional(decode.string),
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
    DevServerHook(
      branch: branch,
      created_at: created_at,
      url: url,
      site_id: site_id,
      title: title,
      type_: type_,
      id: id,
    ),
  )
}

pub fn dev_server_hook_encode(data: DevServerHook) {
  json.object(
    [
      #("branch", json.nullable(data.branch, json.string)),
      #("created_at", json.nullable(data.created_at, json.string)),
      #("url", json.nullable(data.url, json.string)),
      #("site_id", json.nullable(data.site_id, json.string)),
      #("title", json.nullable(data.title, json.string)),
      #("type", json.nullable(data.type_, json.string)),
      #("id", json.nullable(data.id, json.string))
    ],
  )
}

pub fn env_var_decoder() {
  use values <- decode.optional_field(
    "values",
    None,
    decode.optional(decode.list(env_var_value_decoder())),
  )
  use is_secret <- decode.optional_field(
    "is_secret",
    None,
    decode.optional(decode.bool),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(decode.string),
  )
  use updated_by <- decode.optional_field(
    "updated_by",
    None,
    decode.optional(env_var_user_decoder()),
  )
  use scopes <- decode.optional_field(
    "scopes",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use key <- decode.optional_field("key", None, decode.optional(decode.string))
  decode.success(
    EnvVar(
      values: values,
      is_secret: is_secret,
      updated_at: updated_at,
      updated_by: updated_by,
      scopes: scopes,
      key: key,
    ),
  )
}

pub fn env_var_encode(data: EnvVar) {
  json.object(
    [
      #(
        "values",
        json.nullable(data.values, json.array(_, env_var_value_encode)),
      ),
      #("is_secret", json.nullable(data.is_secret, json.bool)),
      #("updated_at", json.nullable(data.updated_at, json.string)),
      #("updated_by", json.nullable(data.updated_by, env_var_user_encode)),
      #("scopes", json.nullable(data.scopes, json.array(_, json.string))),
      #("key", json.nullable(data.key, json.string))
    ],
  )
}

pub fn dns_record_decoder() {
  use priority <- decode.optional_field(
    "priority",
    None,
    decode.optional(decode.int),
  )
  use ttl <- decode.optional_field("ttl", None, decode.optional(decode.int))
  use flag <- decode.optional_field("flag", None, decode.optional(decode.int))
  use value <- decode.optional_field(
    "value",
    None,
    decode.optional(decode.string),
  )
  use hostname <- decode.optional_field(
    "hostname",
    None,
    decode.optional(decode.string),
  )
  use site_id <- decode.optional_field(
    "site_id",
    None,
    decode.optional(decode.string),
  )
  use dns_zone_id <- decode.optional_field(
    "dns_zone_id",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  use tag <- decode.optional_field("tag", None, decode.optional(decode.string))
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use managed <- decode.optional_field(
    "managed",
    None,
    decode.optional(decode.bool),
  )
  decode.success(
    DnsRecord(
      priority: priority,
      ttl: ttl,
      flag: flag,
      value: value,
      hostname: hostname,
      site_id: site_id,
      dns_zone_id: dns_zone_id,
      type_: type_,
      tag: tag,
      id: id,
      managed: managed,
    ),
  )
}

pub fn dns_record_encode(data: DnsRecord) {
  json.object(
    [
      #("priority", json.nullable(data.priority, json.int)),
      #("ttl", json.nullable(data.ttl, json.int)),
      #("flag", json.nullable(data.flag, json.int)),
      #("value", json.nullable(data.value, json.string)),
      #("hostname", json.nullable(data.hostname, json.string)),
      #("site_id", json.nullable(data.site_id, json.string)),
      #("dns_zone_id", json.nullable(data.dns_zone_id, json.string)),
      #("type", json.nullable(data.type_, json.string)),
      #("tag", json.nullable(data.tag, json.string)),
      #("id", json.nullable(data.id, json.string)),
      #("managed", json.nullable(data.managed, json.bool))
    ],
  )
}

pub fn member_decoder() {
  use role <- decode.optional_field("role", None, decode.optional(decode.string))
  use avatar <- decode.optional_field(
    "avatar",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use full_name <- decode.optional_field(
    "full_name",
    None,
    decode.optional(decode.string),
  )
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    Member(
      role: role,
      avatar: avatar,
      id: id,
      full_name: full_name,
      email: email,
    ),
  )
}

pub fn member_encode(data: Member) {
  json.object(
    [
      #("role", json.nullable(data.role, json.string)),
      #("avatar", json.nullable(data.avatar, json.string)),
      #("id", json.nullable(data.id, json.string)),
      #("full_name", json.nullable(data.full_name, json.string)),
      #("email", json.nullable(data.email, json.string))
    ],
  )
}

pub fn function_config_decoder() {
  use priority <- decode.optional_field(
    "priority",
    None,
    decode.optional(decode.int),
  )
  use display_name <- decode.optional_field(
    "display_name",
    None,
    decode.optional(decode.string),
  )
  use routes <- decode.optional_field(
    "routes",
    None,
    decode.optional(decode.list(function_route_decoder())),
  )
  use generator <- decode.optional_field(
    "generator",
    None,
    decode.optional(decode.string),
  )
  use traffic_rules <- decode.optional_field(
    "traffic_rules",
    None,
    decode.optional(traffic_rules_config_decoder()),
  )
  use build_data <- decode.optional_field(
    "build_data",
    None,
    decode.optional(internal_26_decoder()),
  )
  use excluded_routes <- decode.optional_field(
    "excluded_routes",
    None,
    decode.optional(decode.list(excluded_function_route_decoder())),
  )
  decode.success(
    FunctionConfig(
      priority: priority,
      display_name: display_name,
      routes: routes,
      generator: generator,
      traffic_rules: traffic_rules,
      build_data: build_data,
      excluded_routes: excluded_routes,
    ),
  )
}

pub fn function_config_encode(data: FunctionConfig) {
  json.object(
    [
      #("priority", json.nullable(data.priority, json.int)),
      #("display_name", json.nullable(data.display_name, json.string)),
      #(
        "routes",
        json.nullable(data.routes, json.array(_, function_route_encode)),
      ),
      #("generator", json.nullable(data.generator, json.string)),
      #(
        "traffic_rules",
        json.nullable(data.traffic_rules, traffic_rules_config_encode),
      ),
      #("build_data", json.nullable(data.build_data, internal_26_encode)),
      #(
        "excluded_routes",
        json.nullable(
          data.excluded_routes,
          json.array(_, excluded_function_route_encode),
        ),
      )
    ],
  )
}

pub fn plugin_params_decoder() {
  use pinned_version <- decode.optional_field(
    "pinned_version",
    None,
    decode.optional(decode.string),
  )
  decode.success(PluginParams(pinned_version: pinned_version))
}

pub fn plugin_params_encode(data: PluginParams) {
  json.object(
    [#("pinned_version", json.nullable(data.pinned_version, json.string))],
  )
}

pub fn dns_records_decoder() {
  decode.list(dns_record_decoder())
}

pub fn dns_records_encode(data: DnsRecords) {
  json.array(data, dns_record_encode)
}

pub fn deploy_key_decoder() {
  use public_key <- decode.optional_field(
    "public_key",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  decode.success(
    DeployKey(public_key: public_key, created_at: created_at, id: id),
  )
}

pub fn deploy_key_encode(data: DeployKey) {
  json.object(
    [
      #("public_key", json.nullable(data.public_key, json.string)),
      #("created_at", json.nullable(data.created_at, json.string)),
      #("id", json.nullable(data.id, json.string))
    ],
  )
}

pub fn function_decoder() {
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use sha <- decode.optional_field("sha", None, decode.optional(decode.string))
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  decode.success(Function(name: name, sha: sha, id: id))
}

pub fn function_encode(data: Function) {
  json.object(
    [
      #("name", json.nullable(data.name, json.string)),
      #("sha", json.nullable(data.sha, json.string)),
      #("id", json.nullable(data.id, json.string))
    ],
  )
}

pub fn dev_server_decoder() {
  use branch <- decode.optional_field(
    "branch",
    None,
    decode.optional(decode.string),
  )
  use live_at <- decode.optional_field(
    "live_at",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use error_at <- decode.optional_field(
    "error_at",
    None,
    decode.optional(decode.string),
  )
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  use done_at <- decode.optional_field(
    "done_at",
    None,
    decode.optional(decode.string),
  )
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use starting_at <- decode.optional_field(
    "starting_at",
    None,
    decode.optional(decode.string),
  )
  use site_id <- decode.optional_field(
    "site_id",
    None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(decode.string),
  )
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  decode.success(
    DevServer(
      branch: branch,
      live_at: live_at,
      created_at: created_at,
      error_at: error_at,
      url: url,
      done_at: done_at,
      state: state,
      starting_at: starting_at,
      site_id: site_id,
      updated_at: updated_at,
      title: title,
      id: id,
    ),
  )
}

pub fn dev_server_encode(data: DevServer) {
  json.object(
    [
      #("branch", json.nullable(data.branch, json.string)),
      #("live_at", json.nullable(data.live_at, json.string)),
      #("created_at", json.nullable(data.created_at, json.string)),
      #("error_at", json.nullable(data.error_at, json.string)),
      #("url", json.nullable(data.url, json.string)),
      #("done_at", json.nullable(data.done_at, json.string)),
      #("state", json.nullable(data.state, json.string)),
      #("starting_at", json.nullable(data.starting_at, json.string)),
      #("site_id", json.nullable(data.site_id, json.string)),
      #("updated_at", json.nullable(data.updated_at, json.string)),
      #("title", json.nullable(data.title, json.string)),
      #("id", json.nullable(data.id, json.string))
    ],
  )
}

pub fn plugin_run_decoder() {
  use e0 <- decode.then(plugin_run_data_decoder())
  use e1 <- decode.then(internal_25_decoder())
  decode.success(#(e0, e1))
}

pub fn plugin_run_encode(data: PluginRun) {
  utils.merge([plugin_run_data_encode(data.0), internal_25_encode(data.1)])
}

pub fn env_var_value_decoder() {
  use context <- decode.optional_field(
    "context",
    None,
    decode.optional(decode.string),
  )
  use value <- decode.optional_field(
    "value",
    None,
    decode.optional(decode.string),
  )
  use context_parameter <- decode.optional_field(
    "context_parameter",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  decode.success(
    EnvVarValue(
      context: context,
      value: value,
      context_parameter: context_parameter,
      id: id,
    ),
  )
}

pub fn env_var_value_encode(data: EnvVarValue) {
  json.object(
    [
      #("context", json.nullable(data.context, json.string)),
      #("value", json.nullable(data.value, json.string)),
      #("context_parameter", json.nullable(data.context_parameter, json.string)),
      #("id", json.nullable(data.id, json.string))
    ],
  )
}

pub fn site_setup_decoder() {
  use e0 <- decode.then(site_decoder())
  use e1 <- decode.then(internal_24_decoder())
  decode.success(#(e0, e1))
}

pub fn site_setup_encode(data: SiteSetup) {
  utils.merge([site_encode(data.0), internal_24_encode(data.1)])
}

pub fn dns_record_create_decoder() {
  use port <- decode.optional_field("port", None, decode.optional(decode.int))
  use priority <- decode.optional_field(
    "priority",
    None,
    decode.optional(decode.int),
  )
  use ttl <- decode.optional_field("ttl", None, decode.optional(decode.int))
  use flag <- decode.optional_field("flag", None, decode.optional(decode.int))
  use value <- decode.optional_field(
    "value",
    None,
    decode.optional(decode.string),
  )
  use hostname <- decode.optional_field(
    "hostname",
    None,
    decode.optional(decode.string),
  )
  use weight <- decode.optional_field(
    "weight",
    None,
    decode.optional(decode.int),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  use tag <- decode.optional_field("tag", None, decode.optional(decode.string))
  decode.success(
    DnsRecordCreate(
      port: port,
      priority: priority,
      ttl: ttl,
      flag: flag,
      value: value,
      hostname: hostname,
      weight: weight,
      type_: type_,
      tag: tag,
    ),
  )
}

pub fn dns_record_create_encode(data: DnsRecordCreate) {
  json.object(
    [
      #("port", json.nullable(data.port, json.int)),
      #("priority", json.nullable(data.priority, json.int)),
      #("ttl", json.nullable(data.ttl, json.int)),
      #("flag", json.nullable(data.flag, json.int)),
      #("value", json.nullable(data.value, json.string)),
      #("hostname", json.nullable(data.hostname, json.string)),
      #("weight", json.nullable(data.weight, json.int)),
      #("type", json.nullable(data.type_, json.string)),
      #("tag", json.nullable(data.tag, json.string))
    ],
  )
}

pub fn access_token_decoder() {
  use user_email <- decode.optional_field(
    "user_email",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use user_id <- decode.optional_field(
    "user_id",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use access_token <- decode.optional_field(
    "access_token",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    AccessToken(
      user_email: user_email,
      created_at: created_at,
      user_id: user_id,
      id: id,
      access_token: access_token,
    ),
  )
}

pub fn access_token_encode(data: AccessToken) {
  json.object(
    [
      #("user_email", json.nullable(data.user_email, json.string)),
      #("created_at", json.nullable(data.created_at, json.string)),
      #("user_id", json.nullable(data.user_id, json.string)),
      #("id", json.nullable(data.id, json.string)),
      #("access_token", json.nullable(data.access_token, json.string))
    ],
  )
}

pub fn service_decoder() {
  use environments <- decode.optional_field(
    "environments",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use slug <- decode.optional_field("slug", None, decode.optional(decode.string))
  use service_path <- decode.optional_field(
    "service_path",
    None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(decode.string),
  )
  use tags <- decode.optional_field(
    "tags",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use icon <- decode.optional_field("icon", None, decode.optional(decode.string))
  use events <- decode.optional_field(
    "events",
    None,
    decode.optional(decode.list(internal_23_decoder())),
  )
  use long_description <- decode.optional_field(
    "long_description",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use manifest_url <- decode.optional_field(
    "manifest_url",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    Service(
      environments: environments,
      created_at: created_at,
      name: name,
      slug: slug,
      service_path: service_path,
      updated_at: updated_at,
      tags: tags,
      icon: icon,
      events: events,
      long_description: long_description,
      id: id,
      description: description,
      manifest_url: manifest_url,
    ),
  )
}

pub fn service_encode(data: Service) {
  json.object(
    [
      #(
        "environments",
        json.nullable(data.environments, json.array(_, json.string)),
      ),
      #("created_at", json.nullable(data.created_at, json.string)),
      #("name", json.nullable(data.name, json.string)),
      #("slug", json.nullable(data.slug, json.string)),
      #("service_path", json.nullable(data.service_path, json.string)),
      #("updated_at", json.nullable(data.updated_at, json.string)),
      #("tags", json.nullable(data.tags, json.array(_, json.string))),
      #("icon", json.nullable(data.icon, json.string)),
      #("events", json.nullable(data.events, json.array(_, internal_23_encode))),
      #("long_description", json.nullable(data.long_description, json.string)),
      #("id", json.nullable(data.id, json.string)),
      #("description", json.nullable(data.description, json.string)),
      #("manifest_url", json.nullable(data.manifest_url, json.string))
    ],
  )
}

pub fn dns_zone_decoder() {
  use records <- decode.optional_field(
    "records",
    None,
    decode.optional(decode.list(dns_record_decoder())),
  )
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(decode.string),
  )
  use ipv6_enabled <- decode.optional_field(
    "ipv6_enabled",
    None,
    decode.optional(decode.bool),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use errors <- decode.optional_field(
    "errors",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use account_id <- decode.optional_field(
    "account_id",
    None,
    decode.optional(decode.string),
  )
  use dedicated <- decode.optional_field(
    "dedicated",
    None,
    decode.optional(decode.bool),
  )
  use user_id <- decode.optional_field(
    "user_id",
    None,
    decode.optional(decode.string),
  )
  use site_id <- decode.optional_field(
    "site_id",
    None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(decode.string),
  )
  use dns_servers <- decode.optional_field(
    "dns_servers",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use supported_record_types <- decode.optional_field(
    "supported_record_types",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use account_name <- decode.optional_field(
    "account_name",
    None,
    decode.optional(decode.string),
  )
  use account_slug <- decode.optional_field(
    "account_slug",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    DnsZone(
      records: records,
      domain: domain,
      ipv6_enabled: ipv6_enabled,
      created_at: created_at,
      name: name,
      errors: errors,
      account_id: account_id,
      dedicated: dedicated,
      user_id: user_id,
      site_id: site_id,
      updated_at: updated_at,
      dns_servers: dns_servers,
      id: id,
      supported_record_types: supported_record_types,
      account_name: account_name,
      account_slug: account_slug,
    ),
  )
}

pub fn dns_zone_encode(data: DnsZone) {
  json.object(
    [
      #("records", json.nullable(data.records, json.array(_, dns_record_encode))),
      #("domain", json.nullable(data.domain, json.string)),
      #("ipv6_enabled", json.nullable(data.ipv6_enabled, json.bool)),
      #("created_at", json.nullable(data.created_at, json.string)),
      #("name", json.nullable(data.name, json.string)),
      #("errors", json.nullable(data.errors, json.array(_, json.string))),
      #("account_id", json.nullable(data.account_id, json.string)),
      #("dedicated", json.nullable(data.dedicated, json.bool)),
      #("user_id", json.nullable(data.user_id, json.string)),
      #("site_id", json.nullable(data.site_id, json.string)),
      #("updated_at", json.nullable(data.updated_at, json.string)),
      #(
        "dns_servers",
        json.nullable(data.dns_servers, json.array(_, json.string)),
      ),
      #("id", json.nullable(data.id, json.string)),
      #(
        "supported_record_types",
        json.nullable(data.supported_record_types, json.array(_, json.string)),
      ),
      #("account_name", json.nullable(data.account_name, json.string)),
      #("account_slug", json.nullable(data.account_slug, json.string))
    ],
  )
}

pub fn asset_form_decoder() {
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  use fields <- decode.optional_field(
    "fields",
    None,
    decode.optional(decode.dict(decode.string, decode.string)),
  )
  decode.success(AssetForm(url: url, fields: fields))
}

pub fn asset_form_encode(data: AssetForm) {
  json.object(
    [
      #("url", json.nullable(data.url, json.string)),
      #("fields", json.nullable(data.fields, utils.dict(_, json.string)))
    ],
  )
}

pub fn plugin_decoder() {
  use package <- decode.optional_field(
    "package",
    None,
    decode.optional(decode.string),
  )
  use pinned_version <- decode.optional_field(
    "pinned_version",
    None,
    decode.optional(decode.string),
  )
  decode.success(Plugin(package: package, pinned_version: pinned_version))
}

pub fn plugin_encode(data: Plugin) {
  json.object(
    [
      #("package", json.nullable(data.package, json.string)),
      #("pinned_version", json.nullable(data.pinned_version, json.string))
    ],
  )
}

pub fn split_test_setup_decoder() {
  use branch_tests <- decode.optional_field(
    "branch_tests",
    None,
    decode.optional(internal_22_decoder()),
  )
  decode.success(SplitTestSetup(branch_tests: branch_tests))
}

pub fn split_test_setup_encode(data: SplitTestSetup) {
  json.object(
    [#("branch_tests", json.nullable(data.branch_tests, internal_22_encode))],
  )
}

pub fn function_route_decoder() {
  use literal <- decode.optional_field(
    "literal",
    None,
    decode.optional(decode.string),
  )
  use pattern <- decode.optional_field(
    "pattern",
    None,
    decode.optional(decode.string),
  )
  use methods <- decode.optional_field(
    "methods",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use expression <- decode.optional_field(
    "expression",
    None,
    decode.optional(decode.string),
  )
  use prefer_static <- decode.optional_field(
    "prefer_static",
    None,
    decode.optional(decode.bool),
  )
  decode.success(
    FunctionRoute(
      literal: literal,
      pattern: pattern,
      methods: methods,
      expression: expression,
      prefer_static: prefer_static,
    ),
  )
}

pub fn function_route_encode(data: FunctionRoute) {
  json.object(
    [
      #("literal", json.nullable(data.literal, json.string)),
      #("pattern", json.nullable(data.pattern, json.string)),
      #("methods", json.nullable(data.methods, json.array(_, json.string))),
      #("expression", json.nullable(data.expression, json.string)),
      #("prefer_static", json.nullable(data.prefer_static, json.bool))
    ],
  )
}

pub fn build_hook_decoder() {
  use branch <- decode.optional_field(
    "branch",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  use site_id <- decode.optional_field(
    "site_id",
    None,
    decode.optional(decode.string),
  )
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  decode.success(
    BuildHook(
      branch: branch,
      created_at: created_at,
      url: url,
      site_id: site_id,
      title: title,
      id: id,
    ),
  )
}

pub fn build_hook_encode(data: BuildHook) {
  json.object(
    [
      #("branch", json.nullable(data.branch, json.string)),
      #("created_at", json.nullable(data.created_at, json.string)),
      #("url", json.nullable(data.url, json.string)),
      #("site_id", json.nullable(data.site_id, json.string)),
      #("title", json.nullable(data.title, json.string)),
      #("id", json.nullable(data.id, json.string))
    ],
  )
}

pub fn asset_decoder() {
  use content_type <- decode.optional_field(
    "content_type",
    None,
    decode.optional(decode.string),
  )
  use size <- decode.optional_field("size", None, decode.optional(decode.int))
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use creator_id <- decode.optional_field(
    "creator_id",
    None,
    decode.optional(decode.string),
  )
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use visibility <- decode.optional_field(
    "visibility",
    None,
    decode.optional(decode.string),
  )
  use site_id <- decode.optional_field(
    "site_id",
    None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use key <- decode.optional_field("key", None, decode.optional(decode.string))
  decode.success(
    Asset(
      content_type: content_type,
      size: size,
      created_at: created_at,
      name: name,
      creator_id: creator_id,
      url: url,
      state: state,
      visibility: visibility,
      site_id: site_id,
      updated_at: updated_at,
      id: id,
      key: key,
    ),
  )
}

pub fn asset_encode(data: Asset) {
  json.object(
    [
      #("content_type", json.nullable(data.content_type, json.string)),
      #("size", json.nullable(data.size, json.int)),
      #("created_at", json.nullable(data.created_at, json.string)),
      #("name", json.nullable(data.name, json.string)),
      #("creator_id", json.nullable(data.creator_id, json.string)),
      #("url", json.nullable(data.url, json.string)),
      #("state", json.nullable(data.state, json.string)),
      #("visibility", json.nullable(data.visibility, json.string)),
      #("site_id", json.nullable(data.site_id, json.string)),
      #("updated_at", json.nullable(data.updated_at, json.string)),
      #("id", json.nullable(data.id, json.string)),
      #("key", json.nullable(data.key, json.string))
    ],
  )
}

pub fn deploy_files_decoder() {
  use draft <- decode.optional_field("draft", None, decode.optional(decode.bool))
  use branch <- decode.optional_field(
    "branch",
    None,
    decode.optional(decode.string),
  )
  use functions_config <- decode.optional_field(
    "functions_config",
    None,
    decode.optional(decode.dict(decode.string, function_config_decoder())),
  )
  use function_schedules <- decode.optional_field(
    "function_schedules",
    None,
    decode.optional(decode.list(function_schedule_decoder())),
  )
  use files <- decode.optional_field(
    "files",
    None,
    decode.optional(internal_20_decoder()),
  )
  use framework_version <- decode.optional_field(
    "framework_version",
    None,
    decode.optional(decode.string),
  )
  use functions <- decode.optional_field(
    "functions",
    None,
    decode.optional(internal_21_decoder()),
  )
  use async <- decode.optional_field("async", None, decode.optional(decode.bool))
  use framework <- decode.optional_field(
    "framework",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    DeployFiles(
      draft: draft,
      branch: branch,
      functions_config: functions_config,
      function_schedules: function_schedules,
      files: files,
      framework_version: framework_version,
      functions: functions,
      async: async,
      framework: framework,
    ),
  )
}

pub fn deploy_files_encode(data: DeployFiles) {
  json.object(
    [
      #("draft", json.nullable(data.draft, json.bool)),
      #("branch", json.nullable(data.branch, json.string)),
      #(
        "functions_config",
        json.nullable(
          data.functions_config,
          utils.dict(_, function_config_encode),
        ),
      ),
      #(
        "function_schedules",
        json.nullable(
          data.function_schedules,
          json.array(_, function_schedule_encode),
        ),
      ),
      #("files", json.nullable(data.files, internal_20_encode)),
      #("framework_version", json.nullable(data.framework_version, json.string)),
      #("functions", json.nullable(data.functions, internal_21_encode)),
      #("async", json.nullable(data.async, json.bool)),
      #("framework", json.nullable(data.framework, json.string))
    ],
  )
}

pub fn account_setup_decoder() {
  use type_id <- decode.field("type_id", decode.string)
  use payment_method_id <- decode.optional_field(
    "payment_method_id",
    None,
    decode.optional(decode.string),
  )
  use period <- decode.optional_field(
    "period",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.field("name", decode.string)
  use extra_seats_block <- decode.optional_field(
    "extra_seats_block",
    None,
    decode.optional(decode.int),
  )
  decode.success(
    AccountSetup(
      type_id: type_id,
      payment_method_id: payment_method_id,
      period: period,
      name: name,
      extra_seats_block: extra_seats_block,
    ),
  )
}

pub fn account_setup_encode(data: AccountSetup) {
  json.object(
    [
      #("type_id", json.string(data.type_id)),
      #("payment_method_id", json.nullable(data.payment_method_id, json.string)),
      #("period", json.nullable(data.period, json.string)),
      #("name", json.string(data.name)),
      #("extra_seats_block", json.nullable(data.extra_seats_block, json.int))
    ],
  )
}

pub fn metadata_decoder() {
  decode.success(Metadata)
}

pub fn metadata_encode(_data: Metadata) {
  json.object([])
}

pub fn function_schedule_decoder() {
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use cron <- decode.optional_field("cron", None, decode.optional(decode.string))
  decode.success(FunctionSchedule(name: name, cron: cron))
}

pub fn function_schedule_encode(data: FunctionSchedule) {
  json.object(
    [
      #("name", json.nullable(data.name, json.string)),
      #("cron", json.nullable(data.cron, json.string))
    ],
  )
}

pub fn build_setup_decoder() {
  use clear_cache <- decode.optional_field(
    "clear_cache",
    None,
    decode.optional(decode.bool),
  )
  use image <- decode.optional_field(
    "image",
    None,
    decode.optional(decode.string),
  )
  decode.success(BuildSetup(clear_cache: clear_cache, image: image))
}

pub fn build_setup_encode(data: BuildSetup) {
  json.object(
    [
      #("clear_cache", json.nullable(data.clear_cache, json.bool)),
      #("image", json.nullable(data.image, json.string))
    ],
  )
}

pub fn account_add_member_setup_decoder() {
  use role <- decode.optional_field("role", None, decode.optional(decode.string))
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.string),
  )
  decode.success(AccountAddMemberSetup(role: role, email: email))
}

pub fn account_add_member_setup_encode(data: AccountAddMemberSetup) {
  json.object(
    [
      #("role", json.nullable(data.role, json.string)),
      #("email", json.nullable(data.email, json.string))
    ],
  )
}

pub fn build_decoder() {
  use done <- decode.optional_field("done", None, decode.optional(decode.bool))
  use error <- decode.optional_field(
    "error",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use sha <- decode.optional_field("sha", None, decode.optional(decode.string))
  use deploy_id <- decode.optional_field(
    "deploy_id",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  decode.success(
    Build(
      done: done,
      error: error,
      created_at: created_at,
      sha: sha,
      deploy_id: deploy_id,
      id: id,
    ),
  )
}

pub fn build_encode(data: Build) {
  json.object(
    [
      #("done", json.nullable(data.done, json.bool)),
      #("error", json.nullable(data.error, json.string)),
      #("created_at", json.nullable(data.created_at, json.string)),
      #("sha", json.nullable(data.sha, json.string)),
      #("deploy_id", json.nullable(data.deploy_id, json.string)),
      #("id", json.nullable(data.id, json.string))
    ],
  )
}

pub fn account_update_member_setup_decoder() {
  use site_ids <- decode.optional_field(
    "site_ids",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use role <- decode.optional_field("role", None, decode.optional(decode.string))
  use site_access <- decode.optional_field(
    "site_access",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    AccountUpdateMemberSetup(
      site_ids: site_ids,
      role: role,
      site_access: site_access,
    ),
  )
}

pub fn account_update_member_setup_encode(data: AccountUpdateMemberSetup) {
  json.object(
    [
      #("site_ids", json.nullable(data.site_ids, json.array(_, json.string))),
      #("role", json.nullable(data.role, json.string)),
      #("site_access", json.nullable(data.site_access, json.string))
    ],
  )
}

pub fn account_usage_capability_decoder() {
  use included <- decode.optional_field(
    "included",
    None,
    decode.optional(decode.int),
  )
  use used <- decode.optional_field("used", None, decode.optional(decode.int))
  decode.success(AccountUsageCapability(included: included, used: used))
}

pub fn account_usage_capability_encode(data: AccountUsageCapability) {
  json.object(
    [
      #("included", json.nullable(data.included, json.int)),
      #("used", json.nullable(data.used, json.int))
    ],
  )
}

pub fn submission_decoder() {
  use body <- decode.optional_field("body", None, decode.optional(decode.string))
  use summary <- decode.optional_field(
    "summary",
    None,
    decode.optional(decode.string),
  )
  use number <- decode.optional_field(
    "number",
    None,
    decode.optional(decode.int),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(internal_19_decoder()),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use last_name <- decode.optional_field(
    "last_name",
    None,
    decode.optional(decode.string),
  )
  use site_url <- decode.optional_field(
    "site_url",
    None,
    decode.optional(decode.string),
  )
  use first_name <- decode.optional_field(
    "first_name",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.string),
  )
  use company <- decode.optional_field(
    "company",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    Submission(
      body: body,
      summary: summary,
      number: number,
      created_at: created_at,
      data: data,
      name: name,
      last_name: last_name,
      site_url: site_url,
      first_name: first_name,
      id: id,
      email: email,
      company: company,
    ),
  )
}

pub fn submission_encode(data: Submission) {
  json.object(
    [
      #("body", json.nullable(data.body, json.string)),
      #("summary", json.nullable(data.summary, json.string)),
      #("number", json.nullable(data.number, json.int)),
      #("created_at", json.nullable(data.created_at, json.string)),
      #("data", json.nullable(data.data, internal_19_encode)),
      #("name", json.nullable(data.name, json.string)),
      #("last_name", json.nullable(data.last_name, json.string)),
      #("site_url", json.nullable(data.site_url, json.string)),
      #("first_name", json.nullable(data.first_name, json.string)),
      #("id", json.nullable(data.id, json.string)),
      #("email", json.nullable(data.email, json.string)),
      #("company", json.nullable(data.company, json.string))
    ],
  )
}

pub fn ticket_decoder() {
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use client_id <- decode.optional_field(
    "client_id",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use authorized <- decode.optional_field(
    "authorized",
    None,
    decode.optional(decode.bool),
  )
  decode.success(
    Ticket(
      created_at: created_at,
      client_id: client_id,
      id: id,
      authorized: authorized,
    ),
  )
}

pub fn ticket_encode(data: Ticket) {
  json.object(
    [
      #("created_at", json.nullable(data.created_at, json.string)),
      #("client_id", json.nullable(data.client_id, json.string)),
      #("id", json.nullable(data.id, json.string)),
      #("authorized", json.nullable(data.authorized, json.bool))
    ],
  )
}

pub fn split_test_decoder() {
  use path_ <- decode.optional_field(
    "path",
    None,
    decode.optional(decode.string),
  )
  use active <- decode.optional_field(
    "active",
    None,
    decode.optional(decode.bool),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use branches <- decode.optional_field(
    "branches",
    None,
    decode.optional(decode.list(internal_18_decoder())),
  )
  use site_id <- decode.optional_field(
    "site_id",
    None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use unpublished_at <- decode.optional_field(
    "unpublished_at",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    SplitTest(
      path_: path_,
      active: active,
      created_at: created_at,
      name: name,
      branches: branches,
      site_id: site_id,
      updated_at: updated_at,
      id: id,
      unpublished_at: unpublished_at,
    ),
  )
}

pub fn split_test_encode(data: SplitTest) {
  json.object(
    [
      #("path", json.nullable(data.path_, json.string)),
      #("active", json.nullable(data.active, json.bool)),
      #("created_at", json.nullable(data.created_at, json.string)),
      #("name", json.nullable(data.name, json.string)),
      #(
        "branches",
        json.nullable(data.branches, json.array(_, internal_18_encode)),
      ),
      #("site_id", json.nullable(data.site_id, json.string)),
      #("updated_at", json.nullable(data.updated_at, json.string)),
      #("id", json.nullable(data.id, json.string)),
      #("unpublished_at", json.nullable(data.unpublished_at, json.string))
    ],
  )
}

pub fn build_hook_setup_decoder() {
  use branch <- decode.optional_field(
    "branch",
    None,
    decode.optional(decode.string),
  )
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  decode.success(BuildHookSetup(branch: branch, title: title))
}

pub fn build_hook_setup_encode(data: BuildHookSetup) {
  json.object(
    [
      #("branch", json.nullable(data.branch, json.string)),
      #("title", json.nullable(data.title, json.string))
    ],
  )
}

pub fn user_decoder() {
  use last_login <- decode.optional_field(
    "last_login",
    None,
    decode.optional(decode.string),
  )
  use avatar_url <- decode.optional_field(
    "avatar_url",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use login_providers <- decode.optional_field(
    "login_providers",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use affiliate_id <- decode.optional_field(
    "affiliate_id",
    None,
    decode.optional(decode.string),
  )
  use uid <- decode.optional_field("uid", None, decode.optional(decode.string))
  use onboarding_progress <- decode.optional_field(
    "onboarding_progress",
    None,
    decode.optional(internal_17_decoder()),
  )
  use site_count <- decode.optional_field(
    "site_count",
    None,
    decode.optional(decode.int),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use full_name <- decode.optional_field(
    "full_name",
    None,
    decode.optional(decode.string),
  )
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    User(
      last_login: last_login,
      avatar_url: avatar_url,
      created_at: created_at,
      login_providers: login_providers,
      affiliate_id: affiliate_id,
      uid: uid,
      onboarding_progress: onboarding_progress,
      site_count: site_count,
      id: id,
      full_name: full_name,
      email: email,
    ),
  )
}

pub fn user_encode(data: User) {
  json.object(
    [
      #("last_login", json.nullable(data.last_login, json.string)),
      #("avatar_url", json.nullable(data.avatar_url, json.string)),
      #("created_at", json.nullable(data.created_at, json.string)),
      #(
        "login_providers",
        json.nullable(data.login_providers, json.array(_, json.string)),
      ),
      #("affiliate_id", json.nullable(data.affiliate_id, json.string)),
      #("uid", json.nullable(data.uid, json.string)),
      #(
        "onboarding_progress",
        json.nullable(data.onboarding_progress, internal_17_encode),
      ),
      #("site_count", json.nullable(data.site_count, json.int)),
      #("id", json.nullable(data.id, json.string)),
      #("full_name", json.nullable(data.full_name, json.string)),
      #("email", json.nullable(data.email, json.string))
    ],
  )
}

pub fn build_log_msg_decoder() {
  use section <- decode.optional_field(
    "section",
    None,
    decode.optional(decode.string),
  )
  use message <- decode.optional_field(
    "message",
    None,
    decode.optional(decode.string),
  )
  use error <- decode.optional_field("error", None, decode.optional(decode.bool))
  decode.success(BuildLogMsg(section: section, message: message, error: error))
}

pub fn build_log_msg_encode(data: BuildLogMsg) {
  json.object(
    [
      #("section", json.nullable(data.section, json.string)),
      #("message", json.nullable(data.message, json.string)),
      #("error", json.nullable(data.error, json.bool))
    ],
  )
}

pub fn purge_decoder() {
  use site_slug <- decode.optional_field(
    "site_slug",
    None,
    decode.optional(decode.string),
  )
  use site_id <- decode.optional_field(
    "site_id",
    None,
    decode.optional(decode.string),
  )
  use cache_tags <- decode.optional_field(
    "cache_tags",
    None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(
    Purge(site_slug: site_slug, site_id: site_id, cache_tags: cache_tags),
  )
}

pub fn purge_encode(data: Purge) {
  json.object(
    [
      #("site_slug", json.nullable(data.site_slug, json.string)),
      #("site_id", json.nullable(data.site_id, json.string)),
      #("cache_tags", json.nullable(data.cache_tags, json.array(_, json.string)))
    ],
  )
}

pub fn service_instance_decoder() {
  use config <- decode.optional_field(
    "config",
    None,
    decode.optional(internal_13_decoder()),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use external_attributes <- decode.optional_field(
    "external_attributes",
    None,
    decode.optional(internal_14_decoder()),
  )
  use env <- decode.optional_field(
    "env",
    None,
    decode.optional(internal_15_decoder()),
  )
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  use service_path <- decode.optional_field(
    "service_path",
    None,
    decode.optional(decode.string),
  )
  use service_name <- decode.optional_field(
    "service_name",
    None,
    decode.optional(decode.string),
  )
  use service_slug <- decode.optional_field(
    "service_slug",
    None,
    decode.optional(decode.string),
  )
  use snippets <- decode.optional_field(
    "snippets",
    None,
    decode.optional(decode.list(internal_16_decoder())),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(decode.string),
  )
  use auth_url <- decode.optional_field(
    "auth_url",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  decode.success(
    ServiceInstance(
      config: config,
      created_at: created_at,
      external_attributes: external_attributes,
      env: env,
      url: url,
      service_path: service_path,
      service_name: service_name,
      service_slug: service_slug,
      snippets: snippets,
      updated_at: updated_at,
      auth_url: auth_url,
      id: id,
    ),
  )
}

pub fn service_instance_encode(data: ServiceInstance) {
  json.object(
    [
      #("config", json.nullable(data.config, internal_13_encode)),
      #("created_at", json.nullable(data.created_at, json.string)),
      #(
        "external_attributes",
        json.nullable(data.external_attributes, internal_14_encode),
      ),
      #("env", json.nullable(data.env, internal_15_encode)),
      #("url", json.nullable(data.url, json.string)),
      #("service_path", json.nullable(data.service_path, json.string)),
      #("service_name", json.nullable(data.service_name, json.string)),
      #("service_slug", json.nullable(data.service_slug, json.string)),
      #(
        "snippets",
        json.nullable(data.snippets, json.array(_, internal_16_encode)),
      ),
      #("updated_at", json.nullable(data.updated_at, json.string)),
      #("auth_url", json.nullable(data.auth_url, json.string)),
      #("id", json.nullable(data.id, json.string))
    ],
  )
}

pub fn sni_certificate_decoder() {
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use domains <- decode.optional_field(
    "domains",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(decode.string),
  )
  use expires_at <- decode.optional_field(
    "expires_at",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    SniCertificate(
      created_at: created_at,
      domains: domains,
      state: state,
      updated_at: updated_at,
      expires_at: expires_at,
    ),
  )
}

pub fn sni_certificate_encode(data: SniCertificate) {
  json.object(
    [
      #("created_at", json.nullable(data.created_at, json.string)),
      #("domains", json.nullable(data.domains, json.array(_, json.string))),
      #("state", json.nullable(data.state, json.string)),
      #("updated_at", json.nullable(data.updated_at, json.string)),
      #("expires_at", json.nullable(data.expires_at, json.string))
    ],
  )
}

pub fn audit_log_decoder() {
  use account_id <- decode.optional_field(
    "account_id",
    None,
    decode.optional(decode.string),
  )
  use payload <- decode.optional_field(
    "payload",
    None,
    decode.optional(internal_12_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  decode.success(AuditLog(account_id: account_id, payload: payload, id: id))
}

pub fn audit_log_encode(data: AuditLog) {
  json.object(
    [
      #("account_id", json.nullable(data.account_id, json.string)),
      #("payload", json.nullable(data.payload, internal_12_encode)),
      #("id", json.nullable(data.id, json.string))
    ],
  )
}

pub fn asset_signature_decoder() {
  use form <- decode.optional_field(
    "form",
    None,
    decode.optional(asset_form_decoder()),
  )
  use asset <- decode.optional_field(
    "asset",
    None,
    decode.optional(asset_decoder()),
  )
  decode.success(AssetSignature(form: form, asset: asset))
}

pub fn asset_signature_encode(data: AssetSignature) {
  json.object(
    [
      #("form", json.nullable(data.form, asset_form_encode)),
      #("asset", json.nullable(data.asset, asset_encode))
    ],
  )
}

pub fn dns_zone_setup_decoder() {
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use site_id <- decode.optional_field(
    "site_id",
    None,
    decode.optional(decode.string),
  )
  use account_slug <- decode.optional_field(
    "account_slug",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    DnsZoneSetup(name: name, site_id: site_id, account_slug: account_slug),
  )
}

pub fn dns_zone_setup_encode(data: DnsZoneSetup) {
  json.object(
    [
      #("name", json.nullable(data.name, json.string)),
      #("site_id", json.nullable(data.site_id, json.string)),
      #("account_slug", json.nullable(data.account_slug, json.string))
    ],
  )
}

pub fn error_decoder() {
  use message <- decode.field("message", decode.string)
  use code <- decode.optional_field("code", None, decode.optional(decode.int))
  decode.success(Error(message: message, code: code))
}

pub fn error_encode(data: Error) {
  json.object(
    [
      #("message", json.string(data.message)),
      #("code", json.nullable(data.code, json.int))
    ],
  )
}

pub fn deployed_branch_decoder() {
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use slug <- decode.optional_field("slug", None, decode.optional(decode.string))
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  use deploy_id <- decode.optional_field(
    "deploy_id",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use ssl_url <- decode.optional_field(
    "ssl_url",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    DeployedBranch(
      name: name,
      slug: slug,
      url: url,
      deploy_id: deploy_id,
      id: id,
      ssl_url: ssl_url,
    ),
  )
}

pub fn deployed_branch_encode(data: DeployedBranch) {
  json.object(
    [
      #("name", json.nullable(data.name, json.string)),
      #("slug", json.nullable(data.slug, json.string)),
      #("url", json.nullable(data.url, json.string)),
      #("deploy_id", json.nullable(data.deploy_id, json.string)),
      #("id", json.nullable(data.id, json.string)),
      #("ssl_url", json.nullable(data.ssl_url, json.string))
    ],
  )
}

pub fn excluded_function_route_decoder() {
  use literal <- decode.optional_field(
    "literal",
    None,
    decode.optional(decode.string),
  )
  use pattern <- decode.optional_field(
    "pattern",
    None,
    decode.optional(decode.string),
  )
  use expression <- decode.optional_field(
    "expression",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ExcludedFunctionRoute(
      literal: literal,
      pattern: pattern,
      expression: expression,
    ),
  )
}

pub fn excluded_function_route_encode(data: ExcludedFunctionRoute) {
  json.object(
    [
      #("literal", json.nullable(data.literal, json.string)),
      #("pattern", json.nullable(data.pattern, json.string)),
      #("expression", json.nullable(data.expression, json.string))
    ],
  )
}

pub fn site_decoder() {
  use domain_aliases <- decode.optional_field(
    "domain_aliases",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use deploy_preview_custom_domain <- decode.optional_field(
    "deploy_preview_custom_domain",
    None,
    decode.optional(decode.string),
  )
  use session_id <- decode.optional_field(
    "session_id",
    None,
    decode.optional(decode.string),
  )
  use id_domain <- decode.optional_field(
    "id_domain",
    None,
    decode.optional(decode.string),
  )
  use notification_email <- decode.optional_field(
    "notification_email",
    None,
    decode.optional(decode.string),
  )
  use managed_dns <- decode.optional_field(
    "managed_dns",
    None,
    decode.optional(decode.bool),
  )
  use plan <- decode.optional_field("plan", None, decode.optional(decode.string))
  use build_image <- decode.optional_field(
    "build_image",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use ssl <- decode.optional_field("ssl", None, decode.optional(decode.bool))
  use account_id <- decode.optional_field(
    "account_id",
    None,
    decode.optional(decode.string),
  )
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  use user_id <- decode.optional_field(
    "user_id",
    None,
    decode.optional(decode.string),
  )
  use processing_settings <- decode.optional_field(
    "processing_settings",
    None,
    decode.optional(internal_8_decoder()),
  )
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use custom_domain <- decode.optional_field(
    "custom_domain",
    None,
    decode.optional(decode.string),
  )
  use build_settings <- decode.optional_field(
    "build_settings",
    None,
    decode.optional(repo_info_decoder()),
  )
  use screenshot_url <- decode.optional_field(
    "screenshot_url",
    None,
    decode.optional(decode.string),
  )
  use capabilities <- decode.optional_field(
    "capabilities",
    None,
    decode.optional(decode.dict(decode.string, internal_9_decoder())),
  )
  use deploy_url <- decode.optional_field(
    "deploy_url",
    None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(decode.string),
  )
  use branch_deploy_custom_domain <- decode.optional_field(
    "branch_deploy_custom_domain",
    None,
    decode.optional(decode.string),
  )
  use default_hooks_data <- decode.optional_field(
    "default_hooks_data",
    None,
    decode.optional(internal_10_decoder()),
  )
  use functions_region <- decode.optional_field(
    "functions_region",
    None,
    decode.optional(decode.string),
  )
  use published_deploy <- decode.optional_field(
    "published_deploy",
    None,
    decode.optional(deploy_decoder()),
  )
  use force_ssl <- decode.optional_field(
    "force_ssl",
    None,
    decode.optional(decode.bool),
  )
  use prerender <- decode.optional_field(
    "prerender",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use deploy_hook <- decode.optional_field(
    "deploy_hook",
    None,
    decode.optional(decode.string),
  )
  use password <- decode.optional_field(
    "password",
    None,
    decode.optional(decode.string),
  )
  use ssl_url <- decode.optional_field(
    "ssl_url",
    None,
    decode.optional(decode.string),
  )
  use account_name <- decode.optional_field(
    "account_name",
    None,
    decode.optional(decode.string),
  )
  use account_slug <- decode.optional_field(
    "account_slug",
    None,
    decode.optional(decode.string),
  )
  use git_provider <- decode.optional_field(
    "git_provider",
    None,
    decode.optional(decode.string),
  )
  use admin_url <- decode.optional_field(
    "admin_url",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    Site(
      domain_aliases: domain_aliases,
      deploy_preview_custom_domain: deploy_preview_custom_domain,
      session_id: session_id,
      id_domain: id_domain,
      notification_email: notification_email,
      managed_dns: managed_dns,
      plan: plan,
      build_image: build_image,
      created_at: created_at,
      name: name,
      ssl: ssl,
      account_id: account_id,
      url: url,
      user_id: user_id,
      processing_settings: processing_settings,
      state: state,
      custom_domain: custom_domain,
      build_settings: build_settings,
      screenshot_url: screenshot_url,
      capabilities: capabilities,
      deploy_url: deploy_url,
      updated_at: updated_at,
      branch_deploy_custom_domain: branch_deploy_custom_domain,
      default_hooks_data: default_hooks_data,
      functions_region: functions_region,
      published_deploy: published_deploy,
      force_ssl: force_ssl,
      prerender: prerender,
      id: id,
      deploy_hook: deploy_hook,
      password: password,
      ssl_url: ssl_url,
      account_name: account_name,
      account_slug: account_slug,
      git_provider: git_provider,
      admin_url: admin_url,
    ),
  )
}

pub fn site_encode(data: Site) {
  json.object(
    [
      #(
        "domain_aliases",
        json.nullable(data.domain_aliases, json.array(_, json.string)),
      ),
      #(
        "deploy_preview_custom_domain",
        json.nullable(data.deploy_preview_custom_domain, json.string),
      ),
      #("session_id", json.nullable(data.session_id, json.string)),
      #("id_domain", json.nullable(data.id_domain, json.string)),
      #(
        "notification_email",
        json.nullable(data.notification_email, json.string),
      ),
      #("managed_dns", json.nullable(data.managed_dns, json.bool)),
      #("plan", json.nullable(data.plan, json.string)),
      #("build_image", json.nullable(data.build_image, json.string)),
      #("created_at", json.nullable(data.created_at, json.string)),
      #("name", json.nullable(data.name, json.string)),
      #("ssl", json.nullable(data.ssl, json.bool)),
      #("account_id", json.nullable(data.account_id, json.string)),
      #("url", json.nullable(data.url, json.string)),
      #("user_id", json.nullable(data.user_id, json.string)),
      #(
        "processing_settings",
        json.nullable(data.processing_settings, internal_8_encode),
      ),
      #("state", json.nullable(data.state, json.string)),
      #("custom_domain", json.nullable(data.custom_domain, json.string)),
      #("build_settings", json.nullable(data.build_settings, repo_info_encode)),
      #("screenshot_url", json.nullable(data.screenshot_url, json.string)),
      #(
        "capabilities",
        json.nullable(data.capabilities, utils.dict(_, internal_9_encode)),
      ),
      #("deploy_url", json.nullable(data.deploy_url, json.string)),
      #("updated_at", json.nullable(data.updated_at, json.string)),
      #(
        "branch_deploy_custom_domain",
        json.nullable(data.branch_deploy_custom_domain, json.string),
      ),
      #(
        "default_hooks_data",
        json.nullable(data.default_hooks_data, internal_10_encode),
      ),
      #("functions_region", json.nullable(data.functions_region, json.string)),
      #("published_deploy", json.nullable(data.published_deploy, deploy_encode)),
      #("force_ssl", json.nullable(data.force_ssl, json.bool)),
      #("prerender", json.nullable(data.prerender, json.string)),
      #("id", json.nullable(data.id, json.string)),
      #("deploy_hook", json.nullable(data.deploy_hook, json.string)),
      #("password", json.nullable(data.password, json.string)),
      #("ssl_url", json.nullable(data.ssl_url, json.string)),
      #("account_name", json.nullable(data.account_name, json.string)),
      #("account_slug", json.nullable(data.account_slug, json.string)),
      #("git_provider", json.nullable(data.git_provider, json.string)),
      #("admin_url", json.nullable(data.admin_url, json.string))
    ],
  )
}

pub fn split_tests_decoder() {
  decode.list(split_test_decoder())
}

pub fn split_tests_encode(data: SplitTests) {
  json.array(data, split_test_encode)
}

pub fn account_type_decoder() {
  use monthly_seats_addon_dollar_price <- decode.optional_field(
    "monthly_seats_addon_dollar_price",
    None,
    decode.optional(decode.int),
  )
  use yearly_seats_addon_dollar_price <- decode.optional_field(
    "yearly_seats_addon_dollar_price",
    None,
    decode.optional(decode.int),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use capabilities <- decode.optional_field(
    "capabilities",
    None,
    decode.optional(internal_6_decoder()),
  )
  use monthly_dollar_price <- decode.optional_field(
    "monthly_dollar_price",
    None,
    decode.optional(decode.int),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use yearly_dollar_price <- decode.optional_field(
    "yearly_dollar_price",
    None,
    decode.optional(decode.int),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    AccountType(
      monthly_seats_addon_dollar_price: monthly_seats_addon_dollar_price,
      yearly_seats_addon_dollar_price: yearly_seats_addon_dollar_price,
      name: name,
      capabilities: capabilities,
      monthly_dollar_price: monthly_dollar_price,
      id: id,
      yearly_dollar_price: yearly_dollar_price,
      description: description,
    ),
  )
}

pub fn account_type_encode(data: AccountType) {
  json.object(
    [
      #(
        "monthly_seats_addon_dollar_price",
        json.nullable(data.monthly_seats_addon_dollar_price, json.int),
      ),
      #(
        "yearly_seats_addon_dollar_price",
        json.nullable(data.yearly_seats_addon_dollar_price, json.int),
      ),
      #("name", json.nullable(data.name, json.string)),
      #("capabilities", json.nullable(data.capabilities, internal_6_encode)),
      #(
        "monthly_dollar_price",
        json.nullable(data.monthly_dollar_price, json.int),
      ),
      #("id", json.nullable(data.id, json.string)),
      #("yearly_dollar_price", json.nullable(data.yearly_dollar_price, json.int)),
      #("description", json.nullable(data.description, json.string))
    ],
  )
}

pub fn account_update_setup_decoder() {
  use type_id <- decode.optional_field(
    "type_id",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use slug <- decode.optional_field("slug", None, decode.optional(decode.string))
  use extra_seats_block <- decode.optional_field(
    "extra_seats_block",
    None,
    decode.optional(decode.int),
  )
  use billing_name <- decode.optional_field(
    "billing_name",
    None,
    decode.optional(decode.string),
  )
  use billing_email <- decode.optional_field(
    "billing_email",
    None,
    decode.optional(decode.string),
  )
  use billing_details <- decode.optional_field(
    "billing_details",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    AccountUpdateSetup(
      type_id: type_id,
      name: name,
      slug: slug,
      extra_seats_block: extra_seats_block,
      billing_name: billing_name,
      billing_email: billing_email,
      billing_details: billing_details,
    ),
  )
}

pub fn account_update_setup_encode(data: AccountUpdateSetup) {
  json.object(
    [
      #("type_id", json.nullable(data.type_id, json.string)),
      #("name", json.nullable(data.name, json.string)),
      #("slug", json.nullable(data.slug, json.string)),
      #("extra_seats_block", json.nullable(data.extra_seats_block, json.int)),
      #("billing_name", json.nullable(data.billing_name, json.string)),
      #("billing_email", json.nullable(data.billing_email, json.string)),
      #("billing_details", json.nullable(data.billing_details, json.string))
    ],
  )
}

pub fn payment_method_decoder() {
  use method_name <- decode.optional_field(
    "method_name",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(internal_5_decoder()),
  )
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
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
    PaymentMethod(
      method_name: method_name,
      created_at: created_at,
      data: data,
      state: state,
      updated_at: updated_at,
      type_: type_,
      id: id,
    ),
  )
}

pub fn payment_method_encode(data: PaymentMethod) {
  json.object(
    [
      #("method_name", json.nullable(data.method_name, json.string)),
      #("created_at", json.nullable(data.created_at, json.string)),
      #("data", json.nullable(data.data, internal_5_encode)),
      #("state", json.nullable(data.state, json.string)),
      #("updated_at", json.nullable(data.updated_at, json.string)),
      #("type", json.nullable(data.type_, json.string)),
      #("id", json.nullable(data.id, json.string))
    ],
  )
}

pub fn traffic_rules_aggregate_config_decoder() {
  use keys <- decode.optional_field(
    "keys",
    None,
    decode.optional(decode.list(internal_4_decoder())),
  )
  decode.success(TrafficRulesAggregateConfig(keys: keys))
}

pub fn traffic_rules_aggregate_config_encode(data: TrafficRulesAggregateConfig) {
  json.object(
    [#("keys", json.nullable(data.keys, json.array(_, internal_4_encode)))],
  )
}

pub fn deploy_decoder() {
  use draft <- decode.optional_field("draft", None, decode.optional(decode.bool))
  use branch <- decode.optional_field(
    "branch",
    None,
    decode.optional(decode.string),
  )
  use review_id <- decode.optional_field(
    "review_id",
    None,
    decode.optional(decode.float),
  )
  use published_at <- decode.optional_field(
    "published_at",
    None,
    decode.optional(decode.string),
  )
  use deploy_ssl_url <- decode.optional_field(
    "deploy_ssl_url",
    None,
    decode.optional(decode.string),
  )
  use commit_url <- decode.optional_field(
    "commit_url",
    None,
    decode.optional(decode.string),
  )
  use review_url <- decode.optional_field(
    "review_url",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use locked <- decode.optional_field(
    "locked",
    None,
    decode.optional(decode.bool),
  )
  use commit_ref <- decode.optional_field(
    "commit_ref",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use build_id <- decode.optional_field(
    "build_id",
    None,
    decode.optional(decode.string),
  )
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  use context <- decode.optional_field(
    "context",
    None,
    decode.optional(decode.string),
  )
  use user_id <- decode.optional_field(
    "user_id",
    None,
    decode.optional(decode.string),
  )
  use error_message <- decode.optional_field(
    "error_message",
    None,
    decode.optional(decode.string),
  )
  use skipped <- decode.optional_field(
    "skipped",
    None,
    decode.optional(decode.bool),
  )
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use site_id <- decode.optional_field(
    "site_id",
    None,
    decode.optional(decode.string),
  )
  use function_schedules <- decode.optional_field(
    "function_schedules",
    None,
    decode.optional(decode.list(function_schedule_decoder())),
  )
  use screenshot_url <- decode.optional_field(
    "screenshot_url",
    None,
    decode.optional(decode.string),
  )
  use deploy_url <- decode.optional_field(
    "deploy_url",
    None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(decode.string),
  )
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use required_functions <- decode.optional_field(
    "required_functions",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use ssl_url <- decode.optional_field(
    "ssl_url",
    None,
    decode.optional(decode.string),
  )
  use framework <- decode.optional_field(
    "framework",
    None,
    decode.optional(decode.string),
  )
  use admin_url <- decode.optional_field(
    "admin_url",
    None,
    decode.optional(decode.string),
  )
  use required <- decode.optional_field(
    "required",
    None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(
    Deploy(
      draft: draft,
      branch: branch,
      review_id: review_id,
      published_at: published_at,
      deploy_ssl_url: deploy_ssl_url,
      commit_url: commit_url,
      review_url: review_url,
      created_at: created_at,
      locked: locked,
      commit_ref: commit_ref,
      name: name,
      build_id: build_id,
      url: url,
      context: context,
      user_id: user_id,
      error_message: error_message,
      skipped: skipped,
      state: state,
      site_id: site_id,
      function_schedules: function_schedules,
      screenshot_url: screenshot_url,
      deploy_url: deploy_url,
      updated_at: updated_at,
      title: title,
      id: id,
      required_functions: required_functions,
      ssl_url: ssl_url,
      framework: framework,
      admin_url: admin_url,
      required: required,
    ),
  )
}

pub fn deploy_encode(data: Deploy) {
  json.object(
    [
      #("draft", json.nullable(data.draft, json.bool)),
      #("branch", json.nullable(data.branch, json.string)),
      #("review_id", json.nullable(data.review_id, json.float)),
      #("published_at", json.nullable(data.published_at, json.string)),
      #("deploy_ssl_url", json.nullable(data.deploy_ssl_url, json.string)),
      #("commit_url", json.nullable(data.commit_url, json.string)),
      #("review_url", json.nullable(data.review_url, json.string)),
      #("created_at", json.nullable(data.created_at, json.string)),
      #("locked", json.nullable(data.locked, json.bool)),
      #("commit_ref", json.nullable(data.commit_ref, json.string)),
      #("name", json.nullable(data.name, json.string)),
      #("build_id", json.nullable(data.build_id, json.string)),
      #("url", json.nullable(data.url, json.string)),
      #("context", json.nullable(data.context, json.string)),
      #("user_id", json.nullable(data.user_id, json.string)),
      #("error_message", json.nullable(data.error_message, json.string)),
      #("skipped", json.nullable(data.skipped, json.bool)),
      #("state", json.nullable(data.state, json.string)),
      #("site_id", json.nullable(data.site_id, json.string)),
      #(
        "function_schedules",
        json.nullable(
          data.function_schedules,
          json.array(_, function_schedule_encode),
        ),
      ),
      #("screenshot_url", json.nullable(data.screenshot_url, json.string)),
      #("deploy_url", json.nullable(data.deploy_url, json.string)),
      #("updated_at", json.nullable(data.updated_at, json.string)),
      #("title", json.nullable(data.title, json.string)),
      #("id", json.nullable(data.id, json.string)),
      #(
        "required_functions",
        json.nullable(data.required_functions, json.array(_, json.string)),
      ),
      #("ssl_url", json.nullable(data.ssl_url, json.string)),
      #("framework", json.nullable(data.framework, json.string)),
      #("admin_url", json.nullable(data.admin_url, json.string)),
      #("required", json.nullable(data.required, json.array(_, json.string)))
    ],
  )
}

pub fn env_var_user_decoder() {
  use avatar_url <- decode.optional_field(
    "avatar_url",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use full_name <- decode.optional_field(
    "full_name",
    None,
    decode.optional(decode.string),
  )
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    EnvVarUser(
      avatar_url: avatar_url,
      id: id,
      full_name: full_name,
      email: email,
    ),
  )
}

pub fn env_var_user_encode(data: EnvVarUser) {
  json.object(
    [
      #("avatar_url", json.nullable(data.avatar_url, json.string)),
      #("id", json.nullable(data.id, json.string)),
      #("full_name", json.nullable(data.full_name, json.string)),
      #("email", json.nullable(data.email, json.string))
    ],
  )
}

pub fn form_decoder() {
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use paths <- decode.optional_field(
    "paths",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use site_id <- decode.optional_field(
    "site_id",
    None,
    decode.optional(decode.string),
  )
  use fields <- decode.optional_field(
    "fields",
    None,
    decode.optional(decode.list(internal_3_decoder())),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use submission_count <- decode.optional_field(
    "submission_count",
    None,
    decode.optional(decode.int),
  )
  decode.success(
    Form(
      created_at: created_at,
      name: name,
      paths: paths,
      site_id: site_id,
      fields: fields,
      id: id,
      submission_count: submission_count,
    ),
  )
}

pub fn form_encode(data: Form) {
  json.object(
    [
      #("created_at", json.nullable(data.created_at, json.string)),
      #("name", json.nullable(data.name, json.string)),
      #("paths", json.nullable(data.paths, json.array(_, json.string))),
      #("site_id", json.nullable(data.site_id, json.string)),
      #("fields", json.nullable(data.fields, json.array(_, internal_3_encode))),
      #("id", json.nullable(data.id, json.string)),
      #("submission_count", json.nullable(data.submission_count, json.int))
    ],
  )
}

pub fn account_membership_decoder() {
  use type_id <- decode.optional_field(
    "type_id",
    None,
    decode.optional(decode.string),
  )
  use payment_method_id <- decode.optional_field(
    "payment_method_id",
    None,
    decode.optional(decode.string),
  )
  use billing_period <- decode.optional_field(
    "billing_period",
    None,
    decode.optional(decode.string),
  )
  use roles_allowed <- decode.optional_field(
    "roles_allowed",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use slug <- decode.optional_field("slug", None, decode.optional(decode.string))
  use owner_ids <- decode.optional_field(
    "owner_ids",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use billing_name <- decode.optional_field(
    "billing_name",
    None,
    decode.optional(decode.string),
  )
  use type_name <- decode.optional_field(
    "type_name",
    None,
    decode.optional(decode.string),
  )
  use capabilities <- decode.optional_field(
    "capabilities",
    None,
    decode.optional(internal_2_decoder()),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(decode.string),
  )
  use billing_email <- decode.optional_field(
    "billing_email",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use billing_details <- decode.optional_field(
    "billing_details",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    AccountMembership(
      type_id: type_id,
      payment_method_id: payment_method_id,
      billing_period: billing_period,
      roles_allowed: roles_allowed,
      created_at: created_at,
      name: name,
      slug: slug,
      owner_ids: owner_ids,
      billing_name: billing_name,
      type_name: type_name,
      capabilities: capabilities,
      updated_at: updated_at,
      billing_email: billing_email,
      type_: type_,
      id: id,
      billing_details: billing_details,
    ),
  )
}

pub fn account_membership_encode(data: AccountMembership) {
  json.object(
    [
      #("type_id", json.nullable(data.type_id, json.string)),
      #("payment_method_id", json.nullable(data.payment_method_id, json.string)),
      #("billing_period", json.nullable(data.billing_period, json.string)),
      #(
        "roles_allowed",
        json.nullable(data.roles_allowed, json.array(_, json.string)),
      ),
      #("created_at", json.nullable(data.created_at, json.string)),
      #("name", json.nullable(data.name, json.string)),
      #("slug", json.nullable(data.slug, json.string)),
      #("owner_ids", json.nullable(data.owner_ids, json.array(_, json.string))),
      #("billing_name", json.nullable(data.billing_name, json.string)),
      #("type_name", json.nullable(data.type_name, json.string)),
      #("capabilities", json.nullable(data.capabilities, internal_2_encode)),
      #("updated_at", json.nullable(data.updated_at, json.string)),
      #("billing_email", json.nullable(data.billing_email, json.string)),
      #("type", json.nullable(data.type_, json.string)),
      #("id", json.nullable(data.id, json.string)),
      #("billing_details", json.nullable(data.billing_details, json.string))
    ],
  )
}

pub fn traffic_rules_rate_limit_config_decoder() {
  use window_limit <- decode.optional_field(
    "window_limit",
    None,
    decode.optional(decode.int),
  )
  use algorithm <- decode.optional_field(
    "algorithm",
    None,
    decode.optional(decode.string),
  )
  use window_size <- decode.optional_field(
    "window_size",
    None,
    decode.optional(decode.int),
  )
  decode.success(
    TrafficRulesRateLimitConfig(
      window_limit: window_limit,
      algorithm: algorithm,
      window_size: window_size,
    ),
  )
}

pub fn traffic_rules_rate_limit_config_encode(data: TrafficRulesRateLimitConfig) {
  json.object(
    [
      #("window_limit", json.nullable(data.window_limit, json.int)),
      #("algorithm", json.nullable(data.algorithm, json.string)),
      #("window_size", json.nullable(data.window_size, json.int))
    ],
  )
}

pub fn hook_decoder() {
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(decode.string),
  )
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(internal_1_decoder()),
  )
  use site_id <- decode.optional_field(
    "site_id",
    None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(decode.string),
  )
  use event <- decode.optional_field(
    "event",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.string))
  use disabled <- decode.optional_field(
    "disabled",
    None,
    decode.optional(decode.bool),
  )
  decode.success(
    Hook(
      created_at: created_at,
      data: data,
      site_id: site_id,
      updated_at: updated_at,
      event: event,
      type_: type_,
      id: id,
      disabled: disabled,
    ),
  )
}

pub fn hook_encode(data: Hook) {
  json.object(
    [
      #("created_at", json.nullable(data.created_at, json.string)),
      #("data", json.nullable(data.data, internal_1_encode)),
      #("site_id", json.nullable(data.site_id, json.string)),
      #("updated_at", json.nullable(data.updated_at, json.string)),
      #("event", json.nullable(data.event, json.string)),
      #("type", json.nullable(data.type_, json.string)),
      #("id", json.nullable(data.id, json.string)),
      #("disabled", json.nullable(data.disabled, json.bool))
    ],
  )
}

pub fn dev_server_hook_setup_decoder() {
  use branch <- decode.optional_field(
    "branch",
    None,
    decode.optional(decode.string),
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
  decode.success(DevServerHookSetup(branch: branch, title: title, type_: type_))
}

pub fn dev_server_hook_setup_encode(data: DevServerHookSetup) {
  json.object(
    [
      #("branch", json.nullable(data.branch, json.string)),
      #("title", json.nullable(data.title, json.string)),
      #("type", json.nullable(data.type_, json.string))
    ],
  )
}

pub fn plugin_run_data_decoder() {
  use package <- decode.optional_field(
    "package",
    None,
    decode.optional(decode.string),
  )
  use summary <- decode.optional_field(
    "summary",
    None,
    decode.optional(decode.string),
  )
  use reporting_event <- decode.optional_field(
    "reporting_event",
    None,
    decode.optional(decode.string),
  )
  use text <- decode.optional_field("text", None, decode.optional(decode.string))
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use version <- decode.optional_field(
    "version",
    None,
    decode.optional(decode.string),
  )
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    PluginRunData(
      package: package,
      summary: summary,
      reporting_event: reporting_event,
      text: text,
      state: state,
      version: version,
      title: title,
    ),
  )
}

pub fn plugin_run_data_encode(data: PluginRunData) {
  json.object(
    [
      #("package", json.nullable(data.package, json.string)),
      #("summary", json.nullable(data.summary, json.string)),
      #("reporting_event", json.nullable(data.reporting_event, json.string)),
      #("text", json.nullable(data.text, json.string)),
      #("state", json.nullable(data.state, json.string)),
      #("version", json.nullable(data.version, json.string)),
      #("title", json.nullable(data.title, json.string))
    ],
  )
}

pub fn repo_info_decoder() {
  use installation_id <- decode.optional_field(
    "installation_id",
    None,
    decode.optional(decode.int),
  )
  use stop_builds <- decode.optional_field(
    "stop_builds",
    None,
    decode.optional(decode.bool),
  )
  use repo_url <- decode.optional_field(
    "repo_url",
    None,
    decode.optional(decode.string),
  )
  use allowed_branches <- decode.optional_field(
    "allowed_branches",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use public_repo <- decode.optional_field(
    "public_repo",
    None,
    decode.optional(decode.bool),
  )
  use functions_dir <- decode.optional_field(
    "functions_dir",
    None,
    decode.optional(decode.string),
  )
  use private_logs <- decode.optional_field(
    "private_logs",
    None,
    decode.optional(decode.bool),
  )
  use dir <- decode.optional_field("dir", None, decode.optional(decode.string))
  use env <- decode.optional_field(
    "env",
    None,
    decode.optional(decode.dict(decode.string, decode.string)),
  )
  use repo_branch <- decode.optional_field(
    "repo_branch",
    None,
    decode.optional(decode.string),
  )
  use provider <- decode.optional_field(
    "provider",
    None,
    decode.optional(decode.string),
  )
  use repo_path <- decode.optional_field(
    "repo_path",
    None,
    decode.optional(decode.string),
  )
  use deploy_key_id <- decode.optional_field(
    "deploy_key_id",
    None,
    decode.optional(decode.string),
  )
  use cmd <- decode.optional_field("cmd", None, decode.optional(decode.string))
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  decode.success(
    RepoInfo(
      installation_id: installation_id,
      stop_builds: stop_builds,
      repo_url: repo_url,
      allowed_branches: allowed_branches,
      public_repo: public_repo,
      functions_dir: functions_dir,
      private_logs: private_logs,
      dir: dir,
      env: env,
      repo_branch: repo_branch,
      provider: provider,
      repo_path: repo_path,
      deploy_key_id: deploy_key_id,
      cmd: cmd,
      id: id,
    ),
  )
}

pub fn repo_info_encode(data: RepoInfo) {
  json.object(
    [
      #("installation_id", json.nullable(data.installation_id, json.int)),
      #("stop_builds", json.nullable(data.stop_builds, json.bool)),
      #("repo_url", json.nullable(data.repo_url, json.string)),
      #(
        "allowed_branches",
        json.nullable(data.allowed_branches, json.array(_, json.string)),
      ),
      #("public_repo", json.nullable(data.public_repo, json.bool)),
      #("functions_dir", json.nullable(data.functions_dir, json.string)),
      #("private_logs", json.nullable(data.private_logs, json.bool)),
      #("dir", json.nullable(data.dir, json.string)),
      #("env", json.nullable(data.env, utils.dict(_, json.string))),
      #("repo_branch", json.nullable(data.repo_branch, json.string)),
      #("provider", json.nullable(data.provider, json.string)),
      #("repo_path", json.nullable(data.repo_path, json.string)),
      #("deploy_key_id", json.nullable(data.deploy_key_id, json.string)),
      #("cmd", json.nullable(data.cmd, json.string)),
      #("id", json.nullable(data.id, json.int))
    ],
  )
}

pub fn build_status_decoder() {
  use active <- decode.optional_field(
    "active",
    None,
    decode.optional(decode.int),
  )
  use pending_concurrency <- decode.optional_field(
    "pending_concurrency",
    None,
    decode.optional(decode.int),
  )
  use enqueued <- decode.optional_field(
    "enqueued",
    None,
    decode.optional(decode.int),
  )
  use build_count <- decode.optional_field(
    "build_count",
    None,
    decode.optional(decode.int),
  )
  use minutes <- decode.optional_field(
    "minutes",
    None,
    decode.optional(internal_0_decoder()),
  )
  decode.success(
    BuildStatus(
      active: active,
      pending_concurrency: pending_concurrency,
      enqueued: enqueued,
      build_count: build_count,
      minutes: minutes,
    ),
  )
}

pub fn build_status_encode(data: BuildStatus) {
  json.object(
    [
      #("active", json.nullable(data.active, json.int)),
      #("pending_concurrency", json.nullable(data.pending_concurrency, json.int)),
      #("enqueued", json.nullable(data.enqueued, json.int)),
      #("build_count", json.nullable(data.build_count, json.int)),
      #("minutes", json.nullable(data.minutes, internal_0_encode))
    ],
  )
}
