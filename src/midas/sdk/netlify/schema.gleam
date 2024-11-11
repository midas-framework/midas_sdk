import decode/zero
import gleam/json
import gleam/option.{type Option, None}

pub type AssetPublicSignature {
  AssetPublicSignature(url: Option(String))
}

pub type SiteFunction {
  SiteFunction(
    branch: Option(String),
    created_at: Option(String),
    provider: Option(String),
    log_type: Option(String),
    id: Option(String),
    functions: Option(Nil),
  )
}

pub type DnsZones {
  DnsZones
}

pub type HookType {
  HookType(
    name: Option(String),
    events: Option(List(String)),
    fields: Option(Nil),
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

pub type File {
  File(
    size: Option(Int),
    path: Option(String),
    mime_type: Option(String),
    sha: Option(String),
    id: Option(String),
  )
}

pub type TrafficRulesConfig {
  TrafficRulesConfig(action: Option(Nil))
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

pub type EnvVar {
  EnvVar(
    values: Option(Nil),
    is_secret: Option(Bool),
    updated_at: Option(String),
    updated_by: Option(Nil),
    scopes: Option(List(String)),
    key: Option(String),
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

pub type Member {
  Member(
    role: Option(String),
    avatar: Option(String),
    id: Option(String),
    full_name: Option(String),
    email: Option(String),
  )
}

pub type FunctionConfig {
  FunctionConfig(
    priority: Option(Int),
    display_name: Option(String),
    routes: Option(Nil),
    generator: Option(String),
    traffic_rules: Option(Nil),
    build_data: Option(Nil),
    excluded_routes: Option(Nil),
  )
}

pub type PluginParams {
  PluginParams(pinned_version: Option(String))
}

pub type DnsRecords {
  DnsRecords
}

pub type DeployKey {
  DeployKey(
    public_key: Option(String),
    created_at: Option(String),
    id: Option(String),
  )
}

pub type Function {
  Function(name: Option(String), sha: Option(String), id: Option(String))
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

pub type PluginRun {
  PluginRun(
    package: Option(String),
    summary: Option(String),
    reporting_event: Option(String),
    text: Option(String),
    state: Option(String),
    deploy_id: Option(String),
    version: Option(String),
    title: Option(String),
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

pub type SiteSetup {
  SiteSetup(
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
    processing_settings: Option(Nil),
    state: Option(String),
    custom_domain: Option(String),
    repo: Option(Nil),
    build_settings: Option(Nil),
    screenshot_url: Option(String),
    capabilities: Option(Nil),
    deploy_url: Option(String),
    updated_at: Option(String),
    branch_deploy_custom_domain: Option(String),
    default_hooks_data: Option(Nil),
    functions_region: Option(String),
    published_deploy: Option(Nil),
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

pub type AccessToken {
  AccessToken(
    user_email: Option(String),
    created_at: Option(String),
    user_id: Option(String),
    id: Option(String),
    access_token: Option(String),
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
    events: Option(Nil),
    long_description: Option(String),
    id: Option(String),
    description: Option(String),
    manifest_url: Option(String),
  )
}

pub type DnsZone {
  DnsZone(
    records: Option(Nil),
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

pub type AssetForm {
  AssetForm(url: Option(String), fields: Option(Nil))
}

pub type Plugin {
  Plugin(package: Option(String), pinned_version: Option(String))
}

pub type SplitTestSetup {
  SplitTestSetup(branch_tests: Option(Nil))
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

pub type DeployFiles {
  DeployFiles(
    draft: Option(Bool),
    branch: Option(String),
    functions_config: Option(Nil),
    function_schedules: Option(Nil),
    files: Option(Nil),
    framework_version: Option(String),
    functions: Option(Nil),
    async: Option(Bool),
    framework: Option(String),
  )
}

pub type AccountSetup {
  AccountSetup(
    type_id: Option(String),
    payment_method_id: Option(String),
    period: Option(String),
    name: Option(String),
    extra_seats_block: Option(Int),
  )
}

pub type Metadata {
  Metadata
}

pub type FunctionSchedule {
  FunctionSchedule(name: Option(String), cron: Option(String))
}

pub type BuildSetup {
  BuildSetup(clear_cache: Option(Bool), image: Option(String))
}

pub type AccountAddMemberSetup {
  AccountAddMemberSetup(role: Option(String), email: Option(String))
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

pub type AccountUpdateMemberSetup {
  AccountUpdateMemberSetup(
    site_ids: Option(List(String)),
    role: Option(String),
    site_access: Option(String),
  )
}

pub type AccountUsageCapability {
  AccountUsageCapability(included: Option(Int), used: Option(Int))
}

pub type Submission {
  Submission(
    body: Option(String),
    summary: Option(String),
    number: Option(Int),
    created_at: Option(String),
    data: Option(Nil),
    name: Option(String),
    last_name: Option(String),
    site_url: Option(String),
    first_name: Option(String),
    id: Option(String),
    email: Option(String),
    company: Option(String),
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

pub type SplitTest {
  SplitTest(
    path: Option(String),
    active: Option(Bool),
    created_at: Option(String),
    name: Option(String),
    branches: Option(Nil),
    site_id: Option(String),
    updated_at: Option(String),
    id: Option(String),
    unpublished_at: Option(String),
  )
}

pub type BuildHookSetup {
  BuildHookSetup(branch: Option(String), title: Option(String))
}

pub type User {
  User(
    last_login: Option(String),
    avatar_url: Option(String),
    created_at: Option(String),
    login_providers: Option(List(String)),
    affiliate_id: Option(String),
    uid: Option(String),
    onboarding_progress: Option(Nil),
    site_count: Option(Int),
    id: Option(String),
    full_name: Option(String),
    email: Option(String),
  )
}

pub type BuildLogMsg {
  BuildLogMsg(
    section: Option(String),
    message: Option(String),
    error: Option(Bool),
  )
}

pub type Purge {
  Purge(
    site_slug: Option(String),
    site_id: Option(String),
    cache_tags: Option(List(String)),
  )
}

pub type ServiceInstance {
  ServiceInstance(
    config: Option(Nil),
    created_at: Option(String),
    external_attributes: Option(Nil),
    env: Option(Nil),
    url: Option(String),
    service_path: Option(String),
    service_name: Option(String),
    service_slug: Option(String),
    snippets: Option(Nil),
    updated_at: Option(String),
    auth_url: Option(String),
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

pub type AuditLog {
  AuditLog(account_id: Option(String), payload: Option(Nil), id: Option(String))
}

pub type AssetSignature {
  AssetSignature(form: Option(Nil), asset: Option(Nil))
}

pub type DnsZoneSetup {
  DnsZoneSetup(
    name: Option(String),
    site_id: Option(String),
    account_slug: Option(String),
  )
}

pub type Error {
  Error(message: Option(String), code: Option(Int))
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

pub type ExcludedFunctionRoute {
  ExcludedFunctionRoute(
    literal: Option(String),
    pattern: Option(String),
    expression: Option(String),
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
    processing_settings: Option(Nil),
    state: Option(String),
    custom_domain: Option(String),
    build_settings: Option(Nil),
    screenshot_url: Option(String),
    capabilities: Option(Nil),
    deploy_url: Option(String),
    updated_at: Option(String),
    branch_deploy_custom_domain: Option(String),
    default_hooks_data: Option(Nil),
    functions_region: Option(String),
    published_deploy: Option(Nil),
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

pub type SplitTests {
  SplitTests
}

pub type AccountType {
  AccountType(
    monthly_seats_addon_dollar_price: Option(Int),
    yearly_seats_addon_dollar_price: Option(Int),
    name: Option(String),
    capabilities: Option(Nil),
    monthly_dollar_price: Option(Int),
    id: Option(String),
    yearly_dollar_price: Option(Int),
    description: Option(String),
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

pub type PaymentMethod {
  PaymentMethod(
    method_name: Option(String),
    created_at: Option(String),
    data: Option(Nil),
    state: Option(String),
    updated_at: Option(String),
    type_: Option(String),
    id: Option(String),
  )
}

pub type TrafficRulesAggregateConfig {
  TrafficRulesAggregateConfig(keys: Option(Nil))
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
    function_schedules: Option(Nil),
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

pub type EnvVarUser {
  EnvVarUser(
    avatar_url: Option(String),
    id: Option(String),
    full_name: Option(String),
    email: Option(String),
  )
}

pub type Form {
  Form(
    created_at: Option(String),
    name: Option(String),
    paths: Option(List(String)),
    site_id: Option(String),
    fields: Option(Nil),
    id: Option(String),
    submission_count: Option(Int),
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
    capabilities: Option(Nil),
    updated_at: Option(String),
    billing_email: Option(String),
    type_: Option(String),
    id: Option(String),
    billing_details: Option(String),
  )
}

pub type TrafficRulesRateLimitConfig {
  TrafficRulesRateLimitConfig(
    window_limit: Option(Int),
    algorithm: Option(String),
    window_size: Option(Int),
  )
}

pub type Hook {
  Hook(
    created_at: Option(String),
    data: Option(Nil),
    site_id: Option(String),
    updated_at: Option(String),
    event: Option(String),
    type_: Option(String),
    id: Option(String),
    disabled: Option(Bool),
  )
}

pub type DevServerHookSetup {
  DevServerHookSetup(
    branch: Option(String),
    title: Option(String),
    type_: Option(String),
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
    env: Option(Nil),
    repo_branch: Option(String),
    provider: Option(String),
    repo_path: Option(String),
    deploy_key_id: Option(String),
    cmd: Option(String),
    id: Option(Int),
  )
}

pub type BuildStatus {
  BuildStatus(
    active: Option(Int),
    pending_concurrency: Option(Int),
    enqueued: Option(Int),
    build_count: Option(Int),
    minutes: Option(Nil),
  )
}

pub const asset_public_signature = AssetPublicSignature(url: None)

pub const site_function = SiteFunction(
  branch: None,
  created_at: None,
  provider: None,
  log_type: None,
  id: None,
  functions: None,
)

pub const dns_zones = []

pub const hook_type = HookType(name: None, events: None, fields: None)

pub const snippet = Snippet(
  general_position: None,
  general: None,
  site_id: None,
  goal: None,
  goal_position: None,
  title: None,
  id: None,
)

pub const file = File(
  size: None,
  path: None,
  mime_type: None,
  sha: None,
  id: None,
)

pub const traffic_rules_config = TrafficRulesConfig(action: None)

pub const dev_server_hook = DevServerHook(
  branch: None,
  created_at: None,
  url: None,
  site_id: None,
  title: None,
  type_: None,
  id: None,
)

pub const env_var = EnvVar(
  values: None,
  is_secret: None,
  updated_at: None,
  updated_by: None,
  scopes: None,
  key: None,
)

pub const dns_record = DnsRecord(
  priority: None,
  ttl: None,
  flag: None,
  value: None,
  hostname: None,
  site_id: None,
  dns_zone_id: None,
  type_: None,
  tag: None,
  id: None,
  managed: None,
)

pub const member = Member(
  role: None,
  avatar: None,
  id: None,
  full_name: None,
  email: None,
)

pub const function_config = FunctionConfig(
  priority: None,
  display_name: None,
  routes: None,
  generator: None,
  traffic_rules: None,
  build_data: None,
  excluded_routes: None,
)

pub const plugin_params = PluginParams(pinned_version: None)

pub const dns_records = []

pub const deploy_key = DeployKey(public_key: None, created_at: None, id: None)

pub const function = Function(name: None, sha: None, id: None)

pub const dev_server = DevServer(
  branch: None,
  live_at: None,
  created_at: None,
  error_at: None,
  url: None,
  done_at: None,
  state: None,
  starting_at: None,
  site_id: None,
  updated_at: None,
  title: None,
  id: None,
)

pub const plugin_run = PluginRun(
  package: None,
  summary: None,
  reporting_event: None,
  text: None,
  state: None,
  deploy_id: None,
  version: None,
  title: None,
)

pub const env_var_value = EnvVarValue(
  context: None,
  value: None,
  context_parameter: None,
  id: None,
)

pub const site_setup = SiteSetup(
  domain_aliases: None,
  deploy_preview_custom_domain: None,
  session_id: None,
  id_domain: None,
  notification_email: None,
  managed_dns: None,
  plan: None,
  build_image: None,
  created_at: None,
  name: None,
  ssl: None,
  account_id: None,
  url: None,
  user_id: None,
  processing_settings: None,
  state: None,
  custom_domain: None,
  repo: None,
  build_settings: None,
  screenshot_url: None,
  capabilities: None,
  deploy_url: None,
  updated_at: None,
  branch_deploy_custom_domain: None,
  default_hooks_data: None,
  functions_region: None,
  published_deploy: None,
  force_ssl: None,
  prerender: None,
  id: None,
  deploy_hook: None,
  password: None,
  ssl_url: None,
  account_name: None,
  account_slug: None,
  git_provider: None,
  admin_url: None,
)

pub const dns_record_create = DnsRecordCreate(
  port: None,
  priority: None,
  ttl: None,
  flag: None,
  value: None,
  hostname: None,
  weight: None,
  type_: None,
  tag: None,
)

pub const access_token = AccessToken(
  user_email: None,
  created_at: None,
  user_id: None,
  id: None,
  access_token: None,
)

pub const service = Service(
  environments: None,
  created_at: None,
  name: None,
  slug: None,
  service_path: None,
  updated_at: None,
  tags: None,
  icon: None,
  events: None,
  long_description: None,
  id: None,
  description: None,
  manifest_url: None,
)

pub const dns_zone = DnsZone(
  records: None,
  domain: None,
  ipv6_enabled: None,
  created_at: None,
  name: None,
  errors: None,
  account_id: None,
  dedicated: None,
  user_id: None,
  site_id: None,
  updated_at: None,
  dns_servers: None,
  id: None,
  supported_record_types: None,
  account_name: None,
  account_slug: None,
)

pub const asset_form = AssetForm(url: None, fields: None)

pub const plugin = Plugin(package: None, pinned_version: None)

pub const split_test_setup = SplitTestSetup(branch_tests: None)

pub const function_route = FunctionRoute(
  literal: None,
  pattern: None,
  methods: None,
  expression: None,
  prefer_static: None,
)

pub const build_hook = BuildHook(
  branch: None,
  created_at: None,
  url: None,
  site_id: None,
  title: None,
  id: None,
)

pub const asset = Asset(
  content_type: None,
  size: None,
  created_at: None,
  name: None,
  creator_id: None,
  url: None,
  state: None,
  visibility: None,
  site_id: None,
  updated_at: None,
  id: None,
  key: None,
)

pub const deploy_files = DeployFiles(
  draft: None,
  branch: None,
  functions_config: None,
  function_schedules: None,
  files: None,
  framework_version: None,
  functions: None,
  async: None,
  framework: None,
)

pub const account_setup = AccountSetup(
  type_id: None,
  payment_method_id: None,
  period: None,
  name: None,
  extra_seats_block: None,
)

pub const metadata = Metadata

pub const function_schedule = FunctionSchedule(name: None, cron: None)

pub const build_setup = BuildSetup(clear_cache: None, image: None)

pub const account_add_member_setup = AccountAddMemberSetup(
  role: None,
  email: None,
)

pub const build = Build(
  done: None,
  error: None,
  created_at: None,
  sha: None,
  deploy_id: None,
  id: None,
)

pub const account_update_member_setup = AccountUpdateMemberSetup(
  site_ids: None,
  role: None,
  site_access: None,
)

pub const account_usage_capability = AccountUsageCapability(
  included: None,
  used: None,
)

pub const submission = Submission(
  body: None,
  summary: None,
  number: None,
  created_at: None,
  data: None,
  name: None,
  last_name: None,
  site_url: None,
  first_name: None,
  id: None,
  email: None,
  company: None,
)

pub const ticket = Ticket(
  created_at: None,
  client_id: None,
  id: None,
  authorized: None,
)

pub const split_test = SplitTest(
  path: None,
  active: None,
  created_at: None,
  name: None,
  branches: None,
  site_id: None,
  updated_at: None,
  id: None,
  unpublished_at: None,
)

pub const build_hook_setup = BuildHookSetup(branch: None, title: None)

pub const user = User(
  last_login: None,
  avatar_url: None,
  created_at: None,
  login_providers: None,
  affiliate_id: None,
  uid: None,
  onboarding_progress: None,
  site_count: None,
  id: None,
  full_name: None,
  email: None,
)

pub const build_log_msg = BuildLogMsg(section: None, message: None, error: None)

pub const purge = Purge(site_slug: None, site_id: None, cache_tags: None)

pub const service_instance = ServiceInstance(
  config: None,
  created_at: None,
  external_attributes: None,
  env: None,
  url: None,
  service_path: None,
  service_name: None,
  service_slug: None,
  snippets: None,
  updated_at: None,
  auth_url: None,
  id: None,
)

pub const sni_certificate = SniCertificate(
  created_at: None,
  domains: None,
  state: None,
  updated_at: None,
  expires_at: None,
)

pub const audit_log = AuditLog(account_id: None, payload: None, id: None)

pub const asset_signature = AssetSignature(form: None, asset: None)

pub const dns_zone_setup = DnsZoneSetup(
  name: None,
  site_id: None,
  account_slug: None,
)

pub const error = Error(message: None, code: None)

pub const deployed_branch = DeployedBranch(
  name: None,
  slug: None,
  url: None,
  deploy_id: None,
  id: None,
  ssl_url: None,
)

pub const excluded_function_route = ExcludedFunctionRoute(
  literal: None,
  pattern: None,
  expression: None,
)

pub const site = Site(
  domain_aliases: None,
  deploy_preview_custom_domain: None,
  session_id: None,
  id_domain: None,
  notification_email: None,
  managed_dns: None,
  plan: None,
  build_image: None,
  created_at: None,
  name: None,
  ssl: None,
  account_id: None,
  url: None,
  user_id: None,
  processing_settings: None,
  state: None,
  custom_domain: None,
  build_settings: None,
  screenshot_url: None,
  capabilities: None,
  deploy_url: None,
  updated_at: None,
  branch_deploy_custom_domain: None,
  default_hooks_data: None,
  functions_region: None,
  published_deploy: None,
  force_ssl: None,
  prerender: None,
  id: None,
  deploy_hook: None,
  password: None,
  ssl_url: None,
  account_name: None,
  account_slug: None,
  git_provider: None,
  admin_url: None,
)

pub const split_tests = []

pub const account_type = AccountType(
  monthly_seats_addon_dollar_price: None,
  yearly_seats_addon_dollar_price: None,
  name: None,
  capabilities: None,
  monthly_dollar_price: None,
  id: None,
  yearly_dollar_price: None,
  description: None,
)

pub const account_update_setup = AccountUpdateSetup(
  type_id: None,
  name: None,
  slug: None,
  extra_seats_block: None,
  billing_name: None,
  billing_email: None,
  billing_details: None,
)

pub const payment_method = PaymentMethod(
  method_name: None,
  created_at: None,
  data: None,
  state: None,
  updated_at: None,
  type_: None,
  id: None,
)

pub const traffic_rules_aggregate_config = TrafficRulesAggregateConfig(
  keys: None,
)

pub const deploy = Deploy(
  draft: None,
  branch: None,
  review_id: None,
  published_at: None,
  deploy_ssl_url: None,
  commit_url: None,
  review_url: None,
  created_at: None,
  locked: None,
  commit_ref: None,
  name: None,
  build_id: None,
  url: None,
  context: None,
  user_id: None,
  error_message: None,
  skipped: None,
  state: None,
  site_id: None,
  function_schedules: None,
  screenshot_url: None,
  deploy_url: None,
  updated_at: None,
  title: None,
  id: None,
  required_functions: None,
  ssl_url: None,
  framework: None,
  admin_url: None,
  required: None,
)

pub const env_var_user = EnvVarUser(
  avatar_url: None,
  id: None,
  full_name: None,
  email: None,
)

pub const form = Form(
  created_at: None,
  name: None,
  paths: None,
  site_id: None,
  fields: None,
  id: None,
  submission_count: None,
)

pub const account_membership = AccountMembership(
  type_id: None,
  payment_method_id: None,
  billing_period: None,
  roles_allowed: None,
  created_at: None,
  name: None,
  slug: None,
  owner_ids: None,
  billing_name: None,
  type_name: None,
  capabilities: None,
  updated_at: None,
  billing_email: None,
  type_: None,
  id: None,
  billing_details: None,
)

pub const traffic_rules_rate_limit_config = TrafficRulesRateLimitConfig(
  window_limit: None,
  algorithm: None,
  window_size: None,
)

pub const hook = Hook(
  created_at: None,
  data: None,
  site_id: None,
  updated_at: None,
  event: None,
  type_: None,
  id: None,
  disabled: None,
)

pub const dev_server_hook_setup = DevServerHookSetup(
  branch: None,
  title: None,
  type_: None,
)

pub const plugin_run_data = PluginRunData(
  package: None,
  summary: None,
  reporting_event: None,
  text: None,
  state: None,
  version: None,
  title: None,
)

pub const repo_info = RepoInfo(
  installation_id: None,
  stop_builds: None,
  repo_url: None,
  allowed_branches: None,
  public_repo: None,
  functions_dir: None,
  private_logs: None,
  dir: None,
  env: None,
  repo_branch: None,
  provider: None,
  repo_path: None,
  deploy_key_id: None,
  cmd: None,
  id: None,
)

pub const build_status = BuildStatus(
  active: None,
  pending_concurrency: None,
  enqueued: None,
  build_count: None,
  minutes: None,
)

pub fn asset_public_signature_to_json(data: AssetPublicSignature) {
  json.object([#("url", json.nullable(data.url, json.string))])
}

pub fn asset_public_signature_decoder() {
  use url <- zero.field("url", zero.optional(zero.string))
  zero.success(AssetPublicSignature(url: url))
}

pub fn site_function_to_json(data: SiteFunction) {
  json.object([
    #("branch", json.nullable(data.branch, json.string)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("provider", json.nullable(data.provider, json.string)),
    #("log_type", json.nullable(data.log_type, json.string)),
    #("id", json.nullable(data.id, json.string)),
    #("functions", json.null()),
  ])
}

pub fn site_function_decoder() {
  use branch <- zero.field("branch", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use provider <- zero.field("provider", zero.optional(zero.string))
  use log_type <- zero.field("log_type", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  use functions <- zero.field("functions", zero.optional(zero.success(Nil)))
  zero.success(SiteFunction(
    branch: branch,
    created_at: created_at,
    provider: provider,
    log_type: log_type,
    id: id,
    functions: functions,
  ))
}

pub fn dns_zones_decoder() {
  zero.list(dns_zone_decoder())
}

pub fn hook_type_to_json(data: HookType) {
  json.object([
    #("name", json.nullable(data.name, json.string)),
    #("events", json.null()),
    #("fields", json.null()),
  ])
}

pub fn hook_type_decoder() {
  use name <- zero.field("name", zero.optional(zero.string))
  use events <- zero.field("events", zero.optional(zero.list(zero.string)))
  use fields <- zero.field("fields", zero.optional(zero.success(Nil)))
  zero.success(HookType(name: name, events: events, fields: fields))
}

pub fn snippet_to_json(data: Snippet) {
  json.object([
    #("general_position", json.nullable(data.general_position, json.string)),
    #("general", json.nullable(data.general, json.string)),
    #("site_id", json.nullable(data.site_id, json.string)),
    #("goal", json.nullable(data.goal, json.string)),
    #("goal_position", json.nullable(data.goal_position, json.string)),
    #("title", json.nullable(data.title, json.string)),
    #("id", json.nullable(data.id, json.int)),
  ])
}

pub fn snippet_decoder() {
  use general_position <- zero.field(
    "general_position",
    zero.optional(zero.string),
  )
  use general <- zero.field("general", zero.optional(zero.string))
  use site_id <- zero.field("site_id", zero.optional(zero.string))
  use goal <- zero.field("goal", zero.optional(zero.string))
  use goal_position <- zero.field("goal_position", zero.optional(zero.string))
  use title <- zero.field("title", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  zero.success(Snippet(
    general_position: general_position,
    general: general,
    site_id: site_id,
    goal: goal,
    goal_position: goal_position,
    title: title,
    id: id,
  ))
}

pub fn file_to_json(data: File) {
  json.object([
    #("size", json.nullable(data.size, json.int)),
    #("path", json.nullable(data.path, json.string)),
    #("mime_type", json.nullable(data.mime_type, json.string)),
    #("sha", json.nullable(data.sha, json.string)),
    #("id", json.nullable(data.id, json.string)),
  ])
}

pub fn file_decoder() {
  use size <- zero.field("size", zero.optional(zero.int))
  use path <- zero.field("path", zero.optional(zero.string))
  use mime_type <- zero.field("mime_type", zero.optional(zero.string))
  use sha <- zero.field("sha", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  zero.success(File(
    size: size,
    path: path,
    mime_type: mime_type,
    sha: sha,
    id: id,
  ))
}

pub fn traffic_rules_config_to_json(data: TrafficRulesConfig) {
  json.object([#("action", json.null())])
}

pub fn traffic_rules_config_decoder() {
  use action <- zero.field("action", zero.optional(zero.success(Nil)))
  zero.success(TrafficRulesConfig(action: action))
}

pub fn dev_server_hook_to_json(data: DevServerHook) {
  json.object([
    #("branch", json.nullable(data.branch, json.string)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("url", json.nullable(data.url, json.string)),
    #("site_id", json.nullable(data.site_id, json.string)),
    #("title", json.nullable(data.title, json.string)),
    #("type", json.nullable(data.type_, json.string)),
    #("id", json.nullable(data.id, json.string)),
  ])
}

pub fn dev_server_hook_decoder() {
  use branch <- zero.field("branch", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use url <- zero.field("url", zero.optional(zero.string))
  use site_id <- zero.field("site_id", zero.optional(zero.string))
  use title <- zero.field("title", zero.optional(zero.string))
  use type_ <- zero.field("type", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  zero.success(DevServerHook(
    branch: branch,
    created_at: created_at,
    url: url,
    site_id: site_id,
    title: title,
    type_: type_,
    id: id,
  ))
}

pub fn env_var_to_json(data: EnvVar) {
  json.object([
    #("values", json.null()),
    #("is_secret", json.nullable(data.is_secret, json.bool)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("updated_by", json.null()),
    #("scopes", json.null()),
    #("key", json.nullable(data.key, json.string)),
  ])
}

pub fn env_var_decoder() {
  use values <- zero.field("values", zero.optional(zero.success(Nil)))
  use is_secret <- zero.field("is_secret", zero.optional(zero.bool))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use updated_by <- zero.field("updated_by", zero.optional(zero.success(Nil)))
  use scopes <- zero.field("scopes", zero.optional(zero.list(zero.string)))
  use key <- zero.field("key", zero.optional(zero.string))
  zero.success(EnvVar(
    values: values,
    is_secret: is_secret,
    updated_at: updated_at,
    updated_by: updated_by,
    scopes: scopes,
    key: key,
  ))
}

pub fn dns_record_to_json(data: DnsRecord) {
  json.object([
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
    #("managed", json.nullable(data.managed, json.bool)),
  ])
}

pub fn dns_record_decoder() {
  use priority <- zero.field("priority", zero.optional(zero.int))
  use ttl <- zero.field("ttl", zero.optional(zero.int))
  use flag <- zero.field("flag", zero.optional(zero.int))
  use value <- zero.field("value", zero.optional(zero.string))
  use hostname <- zero.field("hostname", zero.optional(zero.string))
  use site_id <- zero.field("site_id", zero.optional(zero.string))
  use dns_zone_id <- zero.field("dns_zone_id", zero.optional(zero.string))
  use type_ <- zero.field("type", zero.optional(zero.string))
  use tag <- zero.field("tag", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  use managed <- zero.field("managed", zero.optional(zero.bool))
  zero.success(DnsRecord(
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
  ))
}

pub fn member_to_json(data: Member) {
  json.object([
    #("role", json.nullable(data.role, json.string)),
    #("avatar", json.nullable(data.avatar, json.string)),
    #("id", json.nullable(data.id, json.string)),
    #("full_name", json.nullable(data.full_name, json.string)),
    #("email", json.nullable(data.email, json.string)),
  ])
}

pub fn member_decoder() {
  use role <- zero.field("role", zero.optional(zero.string))
  use avatar <- zero.field("avatar", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  use full_name <- zero.field("full_name", zero.optional(zero.string))
  use email <- zero.field("email", zero.optional(zero.string))
  zero.success(Member(
    role: role,
    avatar: avatar,
    id: id,
    full_name: full_name,
    email: email,
  ))
}

pub fn function_config_to_json(data: FunctionConfig) {
  json.object([
    #("priority", json.nullable(data.priority, json.int)),
    #("display_name", json.nullable(data.display_name, json.string)),
    #("routes", json.null()),
    #("generator", json.nullable(data.generator, json.string)),
    #("traffic_rules", json.null()),
    #("build_data", json.null()),
    #("excluded_routes", json.null()),
  ])
}

pub fn function_config_decoder() {
  use priority <- zero.field("priority", zero.optional(zero.int))
  use display_name <- zero.field("display_name", zero.optional(zero.string))
  use routes <- zero.field("routes", zero.optional(zero.success(Nil)))
  use generator <- zero.field("generator", zero.optional(zero.string))
  use traffic_rules <- zero.field(
    "traffic_rules",
    zero.optional(zero.success(Nil)),
  )
  use build_data <- zero.field("build_data", zero.optional(zero.success(Nil)))
  use excluded_routes <- zero.field(
    "excluded_routes",
    zero.optional(zero.success(Nil)),
  )
  zero.success(FunctionConfig(
    priority: priority,
    display_name: display_name,
    routes: routes,
    generator: generator,
    traffic_rules: traffic_rules,
    build_data: build_data,
    excluded_routes: excluded_routes,
  ))
}

pub fn plugin_params_to_json(data: PluginParams) {
  json.object([
    #("pinned_version", json.nullable(data.pinned_version, json.string)),
  ])
}

pub fn plugin_params_decoder() {
  use pinned_version <- zero.field("pinned_version", zero.optional(zero.string))
  zero.success(PluginParams(pinned_version: pinned_version))
}

pub fn dns_records_decoder() {
  zero.list(dns_record_decoder())
}

pub fn deploy_key_to_json(data: DeployKey) {
  json.object([
    #("public_key", json.nullable(data.public_key, json.string)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("id", json.nullable(data.id, json.string)),
  ])
}

pub fn deploy_key_decoder() {
  use public_key <- zero.field("public_key", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  zero.success(DeployKey(public_key: public_key, created_at: created_at, id: id))
}

pub fn function_to_json(data: Function) {
  json.object([
    #("name", json.nullable(data.name, json.string)),
    #("sha", json.nullable(data.sha, json.string)),
    #("id", json.nullable(data.id, json.string)),
  ])
}

pub fn function_decoder() {
  use name <- zero.field("name", zero.optional(zero.string))
  use sha <- zero.field("sha", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  zero.success(Function(name: name, sha: sha, id: id))
}

pub fn dev_server_to_json(data: DevServer) {
  json.object([
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
    #("id", json.nullable(data.id, json.string)),
  ])
}

pub fn dev_server_decoder() {
  use branch <- zero.field("branch", zero.optional(zero.string))
  use live_at <- zero.field("live_at", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use error_at <- zero.field("error_at", zero.optional(zero.string))
  use url <- zero.field("url", zero.optional(zero.string))
  use done_at <- zero.field("done_at", zero.optional(zero.string))
  use state <- zero.field("state", zero.optional(zero.string))
  use starting_at <- zero.field("starting_at", zero.optional(zero.string))
  use site_id <- zero.field("site_id", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use title <- zero.field("title", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  zero.success(DevServer(
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
  ))
}

pub fn plugin_run_to_json(data: PluginRun) {
  json.object([
    #("package", json.nullable(data.package, json.string)),
    #("summary", json.nullable(data.summary, json.string)),
    #("reporting_event", json.nullable(data.reporting_event, json.string)),
    #("text", json.nullable(data.text, json.string)),
    #("state", json.nullable(data.state, json.string)),
    #("deploy_id", json.nullable(data.deploy_id, json.string)),
    #("version", json.nullable(data.version, json.string)),
    #("title", json.nullable(data.title, json.string)),
  ])
}

pub fn plugin_run_decoder() {
  use package <- zero.field("package", zero.optional(zero.string))
  use summary <- zero.field("summary", zero.optional(zero.string))
  use reporting_event <- zero.field(
    "reporting_event",
    zero.optional(zero.string),
  )
  use text <- zero.field("text", zero.optional(zero.string))
  use state <- zero.field("state", zero.optional(zero.string))
  use deploy_id <- zero.field("deploy_id", zero.optional(zero.string))
  use version <- zero.field("version", zero.optional(zero.string))
  use title <- zero.field("title", zero.optional(zero.string))
  zero.success(PluginRun(
    package: package,
    summary: summary,
    reporting_event: reporting_event,
    text: text,
    state: state,
    deploy_id: deploy_id,
    version: version,
    title: title,
  ))
}

pub fn env_var_value_to_json(data: EnvVarValue) {
  json.object([
    #("context", json.nullable(data.context, json.string)),
    #("value", json.nullable(data.value, json.string)),
    #("context_parameter", json.nullable(data.context_parameter, json.string)),
    #("id", json.nullable(data.id, json.string)),
  ])
}

pub fn env_var_value_decoder() {
  use context <- zero.field("context", zero.optional(zero.string))
  use value <- zero.field("value", zero.optional(zero.string))
  use context_parameter <- zero.field(
    "context_parameter",
    zero.optional(zero.string),
  )
  use id <- zero.field("id", zero.optional(zero.string))
  zero.success(EnvVarValue(
    context: context,
    value: value,
    context_parameter: context_parameter,
    id: id,
  ))
}

pub fn site_setup_to_json(data: SiteSetup) {
  json.object([
    #("domain_aliases", json.null()),
    #(
      "deploy_preview_custom_domain",
      json.nullable(data.deploy_preview_custom_domain, json.string),
    ),
    #("session_id", json.nullable(data.session_id, json.string)),
    #("id_domain", json.nullable(data.id_domain, json.string)),
    #("notification_email", json.nullable(data.notification_email, json.string)),
    #("managed_dns", json.nullable(data.managed_dns, json.bool)),
    #("plan", json.nullable(data.plan, json.string)),
    #("build_image", json.nullable(data.build_image, json.string)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("ssl", json.nullable(data.ssl, json.bool)),
    #("account_id", json.nullable(data.account_id, json.string)),
    #("url", json.nullable(data.url, json.string)),
    #("user_id", json.nullable(data.user_id, json.string)),
    #("processing_settings", json.null()),
    #("state", json.nullable(data.state, json.string)),
    #("custom_domain", json.nullable(data.custom_domain, json.string)),
    #("repo", json.null()),
    #("build_settings", json.null()),
    #("screenshot_url", json.nullable(data.screenshot_url, json.string)),
    #("capabilities", json.null()),
    #("deploy_url", json.nullable(data.deploy_url, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #(
      "branch_deploy_custom_domain",
      json.nullable(data.branch_deploy_custom_domain, json.string),
    ),
    #("default_hooks_data", json.null()),
    #("functions_region", json.nullable(data.functions_region, json.string)),
    #("published_deploy", json.null()),
    #("force_ssl", json.nullable(data.force_ssl, json.bool)),
    #("prerender", json.nullable(data.prerender, json.string)),
    #("id", json.nullable(data.id, json.string)),
    #("deploy_hook", json.nullable(data.deploy_hook, json.string)),
    #("password", json.nullable(data.password, json.string)),
    #("ssl_url", json.nullable(data.ssl_url, json.string)),
    #("account_name", json.nullable(data.account_name, json.string)),
    #("account_slug", json.nullable(data.account_slug, json.string)),
    #("git_provider", json.nullable(data.git_provider, json.string)),
    #("admin_url", json.nullable(data.admin_url, json.string)),
  ])
}

pub fn site_setup_decoder() {
  use domain_aliases <- zero.field(
    "domain_aliases",
    zero.optional(zero.list(zero.string)),
  )
  use deploy_preview_custom_domain <- zero.field(
    "deploy_preview_custom_domain",
    zero.optional(zero.string),
  )
  use session_id <- zero.field("session_id", zero.optional(zero.string))
  use id_domain <- zero.field("id_domain", zero.optional(zero.string))
  use notification_email <- zero.field(
    "notification_email",
    zero.optional(zero.string),
  )
  use managed_dns <- zero.field("managed_dns", zero.optional(zero.bool))
  use plan <- zero.field("plan", zero.optional(zero.string))
  use build_image <- zero.field("build_image", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use ssl <- zero.field("ssl", zero.optional(zero.bool))
  use account_id <- zero.field("account_id", zero.optional(zero.string))
  use url <- zero.field("url", zero.optional(zero.string))
  use user_id <- zero.field("user_id", zero.optional(zero.string))
  use processing_settings <- zero.field(
    "processing_settings",
    zero.optional(zero.success(Nil)),
  )
  use state <- zero.field("state", zero.optional(zero.string))
  use custom_domain <- zero.field("custom_domain", zero.optional(zero.string))
  use repo <- zero.field("repo", zero.optional(zero.success(Nil)))
  use build_settings <- zero.field(
    "build_settings",
    zero.optional(zero.success(Nil)),
  )
  use screenshot_url <- zero.field("screenshot_url", zero.optional(zero.string))
  use capabilities <- zero.field(
    "capabilities",
    zero.optional(zero.success(Nil)),
  )
  use deploy_url <- zero.field("deploy_url", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use branch_deploy_custom_domain <- zero.field(
    "branch_deploy_custom_domain",
    zero.optional(zero.string),
  )
  use default_hooks_data <- zero.field(
    "default_hooks_data",
    zero.optional(zero.success(Nil)),
  )
  use functions_region <- zero.field(
    "functions_region",
    zero.optional(zero.string),
  )
  use published_deploy <- zero.field(
    "published_deploy",
    zero.optional(zero.success(Nil)),
  )
  use force_ssl <- zero.field("force_ssl", zero.optional(zero.bool))
  use prerender <- zero.field("prerender", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  use deploy_hook <- zero.field("deploy_hook", zero.optional(zero.string))
  use password <- zero.field("password", zero.optional(zero.string))
  use ssl_url <- zero.field("ssl_url", zero.optional(zero.string))
  use account_name <- zero.field("account_name", zero.optional(zero.string))
  use account_slug <- zero.field("account_slug", zero.optional(zero.string))
  use git_provider <- zero.field("git_provider", zero.optional(zero.string))
  use admin_url <- zero.field("admin_url", zero.optional(zero.string))
  zero.success(SiteSetup(
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
    repo: repo,
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
  ))
}

pub fn dns_record_create_to_json(data: DnsRecordCreate) {
  json.object([
    #("port", json.nullable(data.port, json.int)),
    #("priority", json.nullable(data.priority, json.int)),
    #("ttl", json.nullable(data.ttl, json.int)),
    #("flag", json.nullable(data.flag, json.int)),
    #("value", json.nullable(data.value, json.string)),
    #("hostname", json.nullable(data.hostname, json.string)),
    #("weight", json.nullable(data.weight, json.int)),
    #("type", json.nullable(data.type_, json.string)),
    #("tag", json.nullable(data.tag, json.string)),
  ])
}

pub fn dns_record_create_decoder() {
  use port <- zero.field("port", zero.optional(zero.int))
  use priority <- zero.field("priority", zero.optional(zero.int))
  use ttl <- zero.field("ttl", zero.optional(zero.int))
  use flag <- zero.field("flag", zero.optional(zero.int))
  use value <- zero.field("value", zero.optional(zero.string))
  use hostname <- zero.field("hostname", zero.optional(zero.string))
  use weight <- zero.field("weight", zero.optional(zero.int))
  use type_ <- zero.field("type", zero.optional(zero.string))
  use tag <- zero.field("tag", zero.optional(zero.string))
  zero.success(DnsRecordCreate(
    port: port,
    priority: priority,
    ttl: ttl,
    flag: flag,
    value: value,
    hostname: hostname,
    weight: weight,
    type_: type_,
    tag: tag,
  ))
}

pub fn access_token_to_json(data: AccessToken) {
  json.object([
    #("user_email", json.nullable(data.user_email, json.string)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("user_id", json.nullable(data.user_id, json.string)),
    #("id", json.nullable(data.id, json.string)),
    #("access_token", json.nullable(data.access_token, json.string)),
  ])
}

pub fn access_token_decoder() {
  use user_email <- zero.field("user_email", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use user_id <- zero.field("user_id", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  use access_token <- zero.field("access_token", zero.optional(zero.string))
  zero.success(AccessToken(
    user_email: user_email,
    created_at: created_at,
    user_id: user_id,
    id: id,
    access_token: access_token,
  ))
}

pub fn service_to_json(data: Service) {
  json.object([
    #("environments", json.null()),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("slug", json.nullable(data.slug, json.string)),
    #("service_path", json.nullable(data.service_path, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("tags", json.null()),
    #("icon", json.nullable(data.icon, json.string)),
    #("events", json.null()),
    #("long_description", json.nullable(data.long_description, json.string)),
    #("id", json.nullable(data.id, json.string)),
    #("description", json.nullable(data.description, json.string)),
    #("manifest_url", json.nullable(data.manifest_url, json.string)),
  ])
}

pub fn service_decoder() {
  use environments <- zero.field(
    "environments",
    zero.optional(zero.list(zero.string)),
  )
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use slug <- zero.field("slug", zero.optional(zero.string))
  use service_path <- zero.field("service_path", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use tags <- zero.field("tags", zero.optional(zero.list(zero.string)))
  use icon <- zero.field("icon", zero.optional(zero.string))
  use events <- zero.field("events", zero.optional(zero.success(Nil)))
  use long_description <- zero.field(
    "long_description",
    zero.optional(zero.string),
  )
  use id <- zero.field("id", zero.optional(zero.string))
  use description <- zero.field("description", zero.optional(zero.string))
  use manifest_url <- zero.field("manifest_url", zero.optional(zero.string))
  zero.success(Service(
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
  ))
}

pub fn dns_zone_to_json(data: DnsZone) {
  json.object([
    #("records", json.null()),
    #("domain", json.nullable(data.domain, json.string)),
    #("ipv6_enabled", json.nullable(data.ipv6_enabled, json.bool)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("errors", json.null()),
    #("account_id", json.nullable(data.account_id, json.string)),
    #("dedicated", json.nullable(data.dedicated, json.bool)),
    #("user_id", json.nullable(data.user_id, json.string)),
    #("site_id", json.nullable(data.site_id, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("dns_servers", json.null()),
    #("id", json.nullable(data.id, json.string)),
    #("supported_record_types", json.null()),
    #("account_name", json.nullable(data.account_name, json.string)),
    #("account_slug", json.nullable(data.account_slug, json.string)),
  ])
}

pub fn dns_zone_decoder() {
  use records <- zero.field("records", zero.optional(zero.success(Nil)))
  use domain <- zero.field("domain", zero.optional(zero.string))
  use ipv6_enabled <- zero.field("ipv6_enabled", zero.optional(zero.bool))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use errors <- zero.field("errors", zero.optional(zero.list(zero.string)))
  use account_id <- zero.field("account_id", zero.optional(zero.string))
  use dedicated <- zero.field("dedicated", zero.optional(zero.bool))
  use user_id <- zero.field("user_id", zero.optional(zero.string))
  use site_id <- zero.field("site_id", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use dns_servers <- zero.field(
    "dns_servers",
    zero.optional(zero.list(zero.string)),
  )
  use id <- zero.field("id", zero.optional(zero.string))
  use supported_record_types <- zero.field(
    "supported_record_types",
    zero.optional(zero.list(zero.string)),
  )
  use account_name <- zero.field("account_name", zero.optional(zero.string))
  use account_slug <- zero.field("account_slug", zero.optional(zero.string))
  zero.success(DnsZone(
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
  ))
}

pub fn asset_form_to_json(data: AssetForm) {
  json.object([
    #("url", json.nullable(data.url, json.string)),
    #("fields", json.null()),
  ])
}

pub fn asset_form_decoder() {
  use url <- zero.field("url", zero.optional(zero.string))
  use fields <- zero.field("fields", zero.optional(zero.success(Nil)))
  zero.success(AssetForm(url: url, fields: fields))
}

pub fn plugin_to_json(data: Plugin) {
  json.object([
    #("package", json.nullable(data.package, json.string)),
    #("pinned_version", json.nullable(data.pinned_version, json.string)),
  ])
}

pub fn plugin_decoder() {
  use package <- zero.field("package", zero.optional(zero.string))
  use pinned_version <- zero.field("pinned_version", zero.optional(zero.string))
  zero.success(Plugin(package: package, pinned_version: pinned_version))
}

pub fn split_test_setup_to_json(data: SplitTestSetup) {
  json.object([#("branch_tests", json.null())])
}

pub fn split_test_setup_decoder() {
  use branch_tests <- zero.field(
    "branch_tests",
    zero.optional(zero.success(Nil)),
  )
  zero.success(SplitTestSetup(branch_tests: branch_tests))
}

pub fn function_route_to_json(data: FunctionRoute) {
  json.object([
    #("literal", json.nullable(data.literal, json.string)),
    #("pattern", json.nullable(data.pattern, json.string)),
    #("methods", json.null()),
    #("expression", json.nullable(data.expression, json.string)),
    #("prefer_static", json.nullable(data.prefer_static, json.bool)),
  ])
}

pub fn function_route_decoder() {
  use literal <- zero.field("literal", zero.optional(zero.string))
  use pattern <- zero.field("pattern", zero.optional(zero.string))
  use methods <- zero.field("methods", zero.optional(zero.list(zero.string)))
  use expression <- zero.field("expression", zero.optional(zero.string))
  use prefer_static <- zero.field("prefer_static", zero.optional(zero.bool))
  zero.success(FunctionRoute(
    literal: literal,
    pattern: pattern,
    methods: methods,
    expression: expression,
    prefer_static: prefer_static,
  ))
}

pub fn build_hook_to_json(data: BuildHook) {
  json.object([
    #("branch", json.nullable(data.branch, json.string)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("url", json.nullable(data.url, json.string)),
    #("site_id", json.nullable(data.site_id, json.string)),
    #("title", json.nullable(data.title, json.string)),
    #("id", json.nullable(data.id, json.string)),
  ])
}

pub fn build_hook_decoder() {
  use branch <- zero.field("branch", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use url <- zero.field("url", zero.optional(zero.string))
  use site_id <- zero.field("site_id", zero.optional(zero.string))
  use title <- zero.field("title", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  zero.success(BuildHook(
    branch: branch,
    created_at: created_at,
    url: url,
    site_id: site_id,
    title: title,
    id: id,
  ))
}

pub fn asset_to_json(data: Asset) {
  json.object([
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
    #("key", json.nullable(data.key, json.string)),
  ])
}

pub fn asset_decoder() {
  use content_type <- zero.field("content_type", zero.optional(zero.string))
  use size <- zero.field("size", zero.optional(zero.int))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use creator_id <- zero.field("creator_id", zero.optional(zero.string))
  use url <- zero.field("url", zero.optional(zero.string))
  use state <- zero.field("state", zero.optional(zero.string))
  use visibility <- zero.field("visibility", zero.optional(zero.string))
  use site_id <- zero.field("site_id", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  use key <- zero.field("key", zero.optional(zero.string))
  zero.success(Asset(
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
  ))
}

pub fn deploy_files_to_json(data: DeployFiles) {
  json.object([
    #("draft", json.nullable(data.draft, json.bool)),
    #("branch", json.nullable(data.branch, json.string)),
    #("functions_config", json.null()),
    #("function_schedules", json.null()),
    #("files", json.null()),
    #("framework_version", json.nullable(data.framework_version, json.string)),
    #("functions", json.null()),
    #("async", json.nullable(data.async, json.bool)),
    #("framework", json.nullable(data.framework, json.string)),
  ])
}

pub fn deploy_files_decoder() {
  use draft <- zero.field("draft", zero.optional(zero.bool))
  use branch <- zero.field("branch", zero.optional(zero.string))
  use functions_config <- zero.field(
    "functions_config",
    zero.optional(zero.success(Nil)),
  )
  use function_schedules <- zero.field(
    "function_schedules",
    zero.optional(zero.success(Nil)),
  )
  use files <- zero.field("files", zero.optional(zero.success(Nil)))
  use framework_version <- zero.field(
    "framework_version",
    zero.optional(zero.string),
  )
  use functions <- zero.field("functions", zero.optional(zero.success(Nil)))
  use async <- zero.field("async", zero.optional(zero.bool))
  use framework <- zero.field("framework", zero.optional(zero.string))
  zero.success(DeployFiles(
    draft: draft,
    branch: branch,
    functions_config: functions_config,
    function_schedules: function_schedules,
    files: files,
    framework_version: framework_version,
    functions: functions,
    async: async,
    framework: framework,
  ))
}

pub fn account_setup_to_json(data: AccountSetup) {
  json.object([
    #("type_id", json.nullable(data.type_id, json.string)),
    #("payment_method_id", json.nullable(data.payment_method_id, json.string)),
    #("period", json.nullable(data.period, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("extra_seats_block", json.nullable(data.extra_seats_block, json.int)),
  ])
}

pub fn account_setup_decoder() {
  use type_id <- zero.field("type_id", zero.optional(zero.string))
  use payment_method_id <- zero.field(
    "payment_method_id",
    zero.optional(zero.string),
  )
  use period <- zero.field("period", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use extra_seats_block <- zero.field(
    "extra_seats_block",
    zero.optional(zero.int),
  )
  zero.success(AccountSetup(
    type_id: type_id,
    payment_method_id: payment_method_id,
    period: period,
    name: name,
    extra_seats_block: extra_seats_block,
  ))
}

pub fn metadata_to_json(data: Metadata) {
  json.object([])
}

pub fn metadata_decoder() {
  zero.success(Metadata)
}

pub fn function_schedule_to_json(data: FunctionSchedule) {
  json.object([
    #("name", json.nullable(data.name, json.string)),
    #("cron", json.nullable(data.cron, json.string)),
  ])
}

pub fn function_schedule_decoder() {
  use name <- zero.field("name", zero.optional(zero.string))
  use cron <- zero.field("cron", zero.optional(zero.string))
  zero.success(FunctionSchedule(name: name, cron: cron))
}

pub fn build_setup_to_json(data: BuildSetup) {
  json.object([
    #("clear_cache", json.nullable(data.clear_cache, json.bool)),
    #("image", json.nullable(data.image, json.string)),
  ])
}

pub fn build_setup_decoder() {
  use clear_cache <- zero.field("clear_cache", zero.optional(zero.bool))
  use image <- zero.field("image", zero.optional(zero.string))
  zero.success(BuildSetup(clear_cache: clear_cache, image: image))
}

pub fn account_add_member_setup_to_json(data: AccountAddMemberSetup) {
  json.object([
    #("role", json.nullable(data.role, json.string)),
    #("email", json.nullable(data.email, json.string)),
  ])
}

pub fn account_add_member_setup_decoder() {
  use role <- zero.field("role", zero.optional(zero.string))
  use email <- zero.field("email", zero.optional(zero.string))
  zero.success(AccountAddMemberSetup(role: role, email: email))
}

pub fn build_to_json(data: Build) {
  json.object([
    #("done", json.nullable(data.done, json.bool)),
    #("error", json.nullable(data.error, json.string)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("sha", json.nullable(data.sha, json.string)),
    #("deploy_id", json.nullable(data.deploy_id, json.string)),
    #("id", json.nullable(data.id, json.string)),
  ])
}

pub fn build_decoder() {
  use done <- zero.field("done", zero.optional(zero.bool))
  use error <- zero.field("error", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use sha <- zero.field("sha", zero.optional(zero.string))
  use deploy_id <- zero.field("deploy_id", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  zero.success(Build(
    done: done,
    error: error,
    created_at: created_at,
    sha: sha,
    deploy_id: deploy_id,
    id: id,
  ))
}

pub fn account_update_member_setup_to_json(data: AccountUpdateMemberSetup) {
  json.object([
    #("site_ids", json.null()),
    #("role", json.nullable(data.role, json.string)),
    #("site_access", json.nullable(data.site_access, json.string)),
  ])
}

pub fn account_update_member_setup_decoder() {
  use site_ids <- zero.field("site_ids", zero.optional(zero.list(zero.string)))
  use role <- zero.field("role", zero.optional(zero.string))
  use site_access <- zero.field("site_access", zero.optional(zero.string))
  zero.success(AccountUpdateMemberSetup(
    site_ids: site_ids,
    role: role,
    site_access: site_access,
  ))
}

pub fn account_usage_capability_to_json(data: AccountUsageCapability) {
  json.object([
    #("included", json.nullable(data.included, json.int)),
    #("used", json.nullable(data.used, json.int)),
  ])
}

pub fn account_usage_capability_decoder() {
  use included <- zero.field("included", zero.optional(zero.int))
  use used <- zero.field("used", zero.optional(zero.int))
  zero.success(AccountUsageCapability(included: included, used: used))
}

pub fn submission_to_json(data: Submission) {
  json.object([
    #("body", json.nullable(data.body, json.string)),
    #("summary", json.nullable(data.summary, json.string)),
    #("number", json.nullable(data.number, json.int)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("data", json.null()),
    #("name", json.nullable(data.name, json.string)),
    #("last_name", json.nullable(data.last_name, json.string)),
    #("site_url", json.nullable(data.site_url, json.string)),
    #("first_name", json.nullable(data.first_name, json.string)),
    #("id", json.nullable(data.id, json.string)),
    #("email", json.nullable(data.email, json.string)),
    #("company", json.nullable(data.company, json.string)),
  ])
}

pub fn submission_decoder() {
  use body <- zero.field("body", zero.optional(zero.string))
  use summary <- zero.field("summary", zero.optional(zero.string))
  use number <- zero.field("number", zero.optional(zero.int))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use data <- zero.field("data", zero.optional(zero.success(Nil)))
  use name <- zero.field("name", zero.optional(zero.string))
  use last_name <- zero.field("last_name", zero.optional(zero.string))
  use site_url <- zero.field("site_url", zero.optional(zero.string))
  use first_name <- zero.field("first_name", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  use email <- zero.field("email", zero.optional(zero.string))
  use company <- zero.field("company", zero.optional(zero.string))
  zero.success(Submission(
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
  ))
}

pub fn ticket_to_json(data: Ticket) {
  json.object([
    #("created_at", json.nullable(data.created_at, json.string)),
    #("client_id", json.nullable(data.client_id, json.string)),
    #("id", json.nullable(data.id, json.string)),
    #("authorized", json.nullable(data.authorized, json.bool)),
  ])
}

pub fn ticket_decoder() {
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use client_id <- zero.field("client_id", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  use authorized <- zero.field("authorized", zero.optional(zero.bool))
  zero.success(Ticket(
    created_at: created_at,
    client_id: client_id,
    id: id,
    authorized: authorized,
  ))
}

pub fn split_test_to_json(data: SplitTest) {
  json.object([
    #("path", json.nullable(data.path, json.string)),
    #("active", json.nullable(data.active, json.bool)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("branches", json.null()),
    #("site_id", json.nullable(data.site_id, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.string)),
    #("unpublished_at", json.nullable(data.unpublished_at, json.string)),
  ])
}

pub fn split_test_decoder() {
  use path <- zero.field("path", zero.optional(zero.string))
  use active <- zero.field("active", zero.optional(zero.bool))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use branches <- zero.field("branches", zero.optional(zero.success(Nil)))
  use site_id <- zero.field("site_id", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  use unpublished_at <- zero.field("unpublished_at", zero.optional(zero.string))
  zero.success(SplitTest(
    path: path,
    active: active,
    created_at: created_at,
    name: name,
    branches: branches,
    site_id: site_id,
    updated_at: updated_at,
    id: id,
    unpublished_at: unpublished_at,
  ))
}

pub fn build_hook_setup_to_json(data: BuildHookSetup) {
  json.object([
    #("branch", json.nullable(data.branch, json.string)),
    #("title", json.nullable(data.title, json.string)),
  ])
}

pub fn build_hook_setup_decoder() {
  use branch <- zero.field("branch", zero.optional(zero.string))
  use title <- zero.field("title", zero.optional(zero.string))
  zero.success(BuildHookSetup(branch: branch, title: title))
}

pub fn user_to_json(data: User) {
  json.object([
    #("last_login", json.nullable(data.last_login, json.string)),
    #("avatar_url", json.nullable(data.avatar_url, json.string)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("login_providers", json.null()),
    #("affiliate_id", json.nullable(data.affiliate_id, json.string)),
    #("uid", json.nullable(data.uid, json.string)),
    #("onboarding_progress", json.null()),
    #("site_count", json.nullable(data.site_count, json.int)),
    #("id", json.nullable(data.id, json.string)),
    #("full_name", json.nullable(data.full_name, json.string)),
    #("email", json.nullable(data.email, json.string)),
  ])
}

pub fn user_decoder() {
  use last_login <- zero.field("last_login", zero.optional(zero.string))
  use avatar_url <- zero.field("avatar_url", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use login_providers <- zero.field(
    "login_providers",
    zero.optional(zero.list(zero.string)),
  )
  use affiliate_id <- zero.field("affiliate_id", zero.optional(zero.string))
  use uid <- zero.field("uid", zero.optional(zero.string))
  use onboarding_progress <- zero.field(
    "onboarding_progress",
    zero.optional(zero.success(Nil)),
  )
  use site_count <- zero.field("site_count", zero.optional(zero.int))
  use id <- zero.field("id", zero.optional(zero.string))
  use full_name <- zero.field("full_name", zero.optional(zero.string))
  use email <- zero.field("email", zero.optional(zero.string))
  zero.success(User(
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
  ))
}

pub fn build_log_msg_to_json(data: BuildLogMsg) {
  json.object([
    #("section", json.nullable(data.section, json.string)),
    #("message", json.nullable(data.message, json.string)),
    #("error", json.nullable(data.error, json.bool)),
  ])
}

pub fn build_log_msg_decoder() {
  use section <- zero.field("section", zero.optional(zero.string))
  use message <- zero.field("message", zero.optional(zero.string))
  use error <- zero.field("error", zero.optional(zero.bool))
  zero.success(BuildLogMsg(section: section, message: message, error: error))
}

pub fn purge_to_json(data: Purge) {
  json.object([
    #("site_slug", json.nullable(data.site_slug, json.string)),
    #("site_id", json.nullable(data.site_id, json.string)),
    #("cache_tags", json.null()),
  ])
}

pub fn purge_decoder() {
  use site_slug <- zero.field("site_slug", zero.optional(zero.string))
  use site_id <- zero.field("site_id", zero.optional(zero.string))
  use cache_tags <- zero.field(
    "cache_tags",
    zero.optional(zero.list(zero.string)),
  )
  zero.success(Purge(
    site_slug: site_slug,
    site_id: site_id,
    cache_tags: cache_tags,
  ))
}

pub fn service_instance_to_json(data: ServiceInstance) {
  json.object([
    #("config", json.null()),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("external_attributes", json.null()),
    #("env", json.null()),
    #("url", json.nullable(data.url, json.string)),
    #("service_path", json.nullable(data.service_path, json.string)),
    #("service_name", json.nullable(data.service_name, json.string)),
    #("service_slug", json.nullable(data.service_slug, json.string)),
    #("snippets", json.null()),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("auth_url", json.nullable(data.auth_url, json.string)),
    #("id", json.nullable(data.id, json.string)),
  ])
}

pub fn service_instance_decoder() {
  use config <- zero.field("config", zero.optional(zero.success(Nil)))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use external_attributes <- zero.field(
    "external_attributes",
    zero.optional(zero.success(Nil)),
  )
  use env <- zero.field("env", zero.optional(zero.success(Nil)))
  use url <- zero.field("url", zero.optional(zero.string))
  use service_path <- zero.field("service_path", zero.optional(zero.string))
  use service_name <- zero.field("service_name", zero.optional(zero.string))
  use service_slug <- zero.field("service_slug", zero.optional(zero.string))
  use snippets <- zero.field("snippets", zero.optional(zero.success(Nil)))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use auth_url <- zero.field("auth_url", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  zero.success(ServiceInstance(
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
  ))
}

pub fn sni_certificate_to_json(data: SniCertificate) {
  json.object([
    #("created_at", json.nullable(data.created_at, json.string)),
    #("domains", json.null()),
    #("state", json.nullable(data.state, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("expires_at", json.nullable(data.expires_at, json.string)),
  ])
}

pub fn sni_certificate_decoder() {
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use domains <- zero.field("domains", zero.optional(zero.list(zero.string)))
  use state <- zero.field("state", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use expires_at <- zero.field("expires_at", zero.optional(zero.string))
  zero.success(SniCertificate(
    created_at: created_at,
    domains: domains,
    state: state,
    updated_at: updated_at,
    expires_at: expires_at,
  ))
}

pub fn audit_log_to_json(data: AuditLog) {
  json.object([
    #("account_id", json.nullable(data.account_id, json.string)),
    #("payload", json.null()),
    #("id", json.nullable(data.id, json.string)),
  ])
}

pub fn audit_log_decoder() {
  use account_id <- zero.field("account_id", zero.optional(zero.string))
  use payload <- zero.field("payload", zero.optional(zero.success(Nil)))
  use id <- zero.field("id", zero.optional(zero.string))
  zero.success(AuditLog(account_id: account_id, payload: payload, id: id))
}

pub fn asset_signature_to_json(data: AssetSignature) {
  json.object([#("form", json.null()), #("asset", json.null())])
}

pub fn asset_signature_decoder() {
  use form <- zero.field("form", zero.optional(zero.success(Nil)))
  use asset <- zero.field("asset", zero.optional(zero.success(Nil)))
  zero.success(AssetSignature(form: form, asset: asset))
}

pub fn dns_zone_setup_to_json(data: DnsZoneSetup) {
  json.object([
    #("name", json.nullable(data.name, json.string)),
    #("site_id", json.nullable(data.site_id, json.string)),
    #("account_slug", json.nullable(data.account_slug, json.string)),
  ])
}

pub fn dns_zone_setup_decoder() {
  use name <- zero.field("name", zero.optional(zero.string))
  use site_id <- zero.field("site_id", zero.optional(zero.string))
  use account_slug <- zero.field("account_slug", zero.optional(zero.string))
  zero.success(DnsZoneSetup(
    name: name,
    site_id: site_id,
    account_slug: account_slug,
  ))
}

pub fn error_to_json(data: Error) {
  json.object([
    #("message", json.nullable(data.message, json.string)),
    #("code", json.nullable(data.code, json.int)),
  ])
}

pub fn error_decoder() {
  use message <- zero.field("message", zero.optional(zero.string))
  use code <- zero.field("code", zero.optional(zero.int))
  zero.success(Error(message: message, code: code))
}

pub fn deployed_branch_to_json(data: DeployedBranch) {
  json.object([
    #("name", json.nullable(data.name, json.string)),
    #("slug", json.nullable(data.slug, json.string)),
    #("url", json.nullable(data.url, json.string)),
    #("deploy_id", json.nullable(data.deploy_id, json.string)),
    #("id", json.nullable(data.id, json.string)),
    #("ssl_url", json.nullable(data.ssl_url, json.string)),
  ])
}

pub fn deployed_branch_decoder() {
  use name <- zero.field("name", zero.optional(zero.string))
  use slug <- zero.field("slug", zero.optional(zero.string))
  use url <- zero.field("url", zero.optional(zero.string))
  use deploy_id <- zero.field("deploy_id", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  use ssl_url <- zero.field("ssl_url", zero.optional(zero.string))
  zero.success(DeployedBranch(
    name: name,
    slug: slug,
    url: url,
    deploy_id: deploy_id,
    id: id,
    ssl_url: ssl_url,
  ))
}

pub fn excluded_function_route_to_json(data: ExcludedFunctionRoute) {
  json.object([
    #("literal", json.nullable(data.literal, json.string)),
    #("pattern", json.nullable(data.pattern, json.string)),
    #("expression", json.nullable(data.expression, json.string)),
  ])
}

pub fn excluded_function_route_decoder() {
  use literal <- zero.field("literal", zero.optional(zero.string))
  use pattern <- zero.field("pattern", zero.optional(zero.string))
  use expression <- zero.field("expression", zero.optional(zero.string))
  zero.success(ExcludedFunctionRoute(
    literal: literal,
    pattern: pattern,
    expression: expression,
  ))
}

pub fn site_to_json(data: Site) {
  json.object([
    #("domain_aliases", json.null()),
    #(
      "deploy_preview_custom_domain",
      json.nullable(data.deploy_preview_custom_domain, json.string),
    ),
    #("session_id", json.nullable(data.session_id, json.string)),
    #("id_domain", json.nullable(data.id_domain, json.string)),
    #("notification_email", json.nullable(data.notification_email, json.string)),
    #("managed_dns", json.nullable(data.managed_dns, json.bool)),
    #("plan", json.nullable(data.plan, json.string)),
    #("build_image", json.nullable(data.build_image, json.string)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("ssl", json.nullable(data.ssl, json.bool)),
    #("account_id", json.nullable(data.account_id, json.string)),
    #("url", json.nullable(data.url, json.string)),
    #("user_id", json.nullable(data.user_id, json.string)),
    #("processing_settings", json.null()),
    #("state", json.nullable(data.state, json.string)),
    #("custom_domain", json.nullable(data.custom_domain, json.string)),
    #("build_settings", json.null()),
    #("screenshot_url", json.nullable(data.screenshot_url, json.string)),
    #("capabilities", json.null()),
    #("deploy_url", json.nullable(data.deploy_url, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #(
      "branch_deploy_custom_domain",
      json.nullable(data.branch_deploy_custom_domain, json.string),
    ),
    #("default_hooks_data", json.null()),
    #("functions_region", json.nullable(data.functions_region, json.string)),
    #("published_deploy", json.null()),
    #("force_ssl", json.nullable(data.force_ssl, json.bool)),
    #("prerender", json.nullable(data.prerender, json.string)),
    #("id", json.nullable(data.id, json.string)),
    #("deploy_hook", json.nullable(data.deploy_hook, json.string)),
    #("password", json.nullable(data.password, json.string)),
    #("ssl_url", json.nullable(data.ssl_url, json.string)),
    #("account_name", json.nullable(data.account_name, json.string)),
    #("account_slug", json.nullable(data.account_slug, json.string)),
    #("git_provider", json.nullable(data.git_provider, json.string)),
    #("admin_url", json.nullable(data.admin_url, json.string)),
  ])
}

pub fn site_decoder() {
  use domain_aliases <- zero.field(
    "domain_aliases",
    zero.optional(zero.list(zero.string)),
  )
  use deploy_preview_custom_domain <- zero.field(
    "deploy_preview_custom_domain",
    zero.optional(zero.string),
  )
  use session_id <- zero.field("session_id", zero.optional(zero.string))
  use id_domain <- zero.field("id_domain", zero.optional(zero.string))
  use notification_email <- zero.field(
    "notification_email",
    zero.optional(zero.string),
  )
  use managed_dns <- zero.field("managed_dns", zero.optional(zero.bool))
  use plan <- zero.field("plan", zero.optional(zero.string))
  use build_image <- zero.field("build_image", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use ssl <- zero.field("ssl", zero.optional(zero.bool))
  use account_id <- zero.field("account_id", zero.optional(zero.string))
  use url <- zero.field("url", zero.optional(zero.string))
  use user_id <- zero.field("user_id", zero.optional(zero.string))
  use processing_settings <- zero.field(
    "processing_settings",
    zero.optional(zero.success(Nil)),
  )
  use state <- zero.field("state", zero.optional(zero.string))
  use custom_domain <- zero.field("custom_domain", zero.optional(zero.string))
  use build_settings <- zero.field(
    "build_settings",
    zero.optional(zero.success(Nil)),
  )
  use screenshot_url <- zero.field("screenshot_url", zero.optional(zero.string))
  use capabilities <- zero.field(
    "capabilities",
    zero.optional(zero.success(Nil)),
  )
  use deploy_url <- zero.field("deploy_url", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use branch_deploy_custom_domain <- zero.field(
    "branch_deploy_custom_domain",
    zero.optional(zero.string),
  )
  use default_hooks_data <- zero.field(
    "default_hooks_data",
    zero.optional(zero.success(Nil)),
  )
  use functions_region <- zero.field(
    "functions_region",
    zero.optional(zero.string),
  )
  use published_deploy <- zero.field(
    "published_deploy",
    zero.optional(zero.success(Nil)),
  )
  use force_ssl <- zero.field("force_ssl", zero.optional(zero.bool))
  use prerender <- zero.field("prerender", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  use deploy_hook <- zero.field("deploy_hook", zero.optional(zero.string))
  use password <- zero.field("password", zero.optional(zero.string))
  use ssl_url <- zero.field("ssl_url", zero.optional(zero.string))
  use account_name <- zero.field("account_name", zero.optional(zero.string))
  use account_slug <- zero.field("account_slug", zero.optional(zero.string))
  use git_provider <- zero.field("git_provider", zero.optional(zero.string))
  use admin_url <- zero.field("admin_url", zero.optional(zero.string))
  zero.success(Site(
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
  ))
}

pub fn split_tests_decoder() {
  zero.list(split_test_decoder())
}

pub fn account_type_to_json(data: AccountType) {
  json.object([
    #(
      "monthly_seats_addon_dollar_price",
      json.nullable(data.monthly_seats_addon_dollar_price, json.int),
    ),
    #(
      "yearly_seats_addon_dollar_price",
      json.nullable(data.yearly_seats_addon_dollar_price, json.int),
    ),
    #("name", json.nullable(data.name, json.string)),
    #("capabilities", json.null()),
    #(
      "monthly_dollar_price",
      json.nullable(data.monthly_dollar_price, json.int),
    ),
    #("id", json.nullable(data.id, json.string)),
    #("yearly_dollar_price", json.nullable(data.yearly_dollar_price, json.int)),
    #("description", json.nullable(data.description, json.string)),
  ])
}

pub fn account_type_decoder() {
  use monthly_seats_addon_dollar_price <- zero.field(
    "monthly_seats_addon_dollar_price",
    zero.optional(zero.int),
  )
  use yearly_seats_addon_dollar_price <- zero.field(
    "yearly_seats_addon_dollar_price",
    zero.optional(zero.int),
  )
  use name <- zero.field("name", zero.optional(zero.string))
  use capabilities <- zero.field(
    "capabilities",
    zero.optional(zero.success(Nil)),
  )
  use monthly_dollar_price <- zero.field(
    "monthly_dollar_price",
    zero.optional(zero.int),
  )
  use id <- zero.field("id", zero.optional(zero.string))
  use yearly_dollar_price <- zero.field(
    "yearly_dollar_price",
    zero.optional(zero.int),
  )
  use description <- zero.field("description", zero.optional(zero.string))
  zero.success(AccountType(
    monthly_seats_addon_dollar_price: monthly_seats_addon_dollar_price,
    yearly_seats_addon_dollar_price: yearly_seats_addon_dollar_price,
    name: name,
    capabilities: capabilities,
    monthly_dollar_price: monthly_dollar_price,
    id: id,
    yearly_dollar_price: yearly_dollar_price,
    description: description,
  ))
}

pub fn account_update_setup_to_json(data: AccountUpdateSetup) {
  json.object([
    #("type_id", json.nullable(data.type_id, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("slug", json.nullable(data.slug, json.string)),
    #("extra_seats_block", json.nullable(data.extra_seats_block, json.int)),
    #("billing_name", json.nullable(data.billing_name, json.string)),
    #("billing_email", json.nullable(data.billing_email, json.string)),
    #("billing_details", json.nullable(data.billing_details, json.string)),
  ])
}

pub fn account_update_setup_decoder() {
  use type_id <- zero.field("type_id", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use slug <- zero.field("slug", zero.optional(zero.string))
  use extra_seats_block <- zero.field(
    "extra_seats_block",
    zero.optional(zero.int),
  )
  use billing_name <- zero.field("billing_name", zero.optional(zero.string))
  use billing_email <- zero.field("billing_email", zero.optional(zero.string))
  use billing_details <- zero.field(
    "billing_details",
    zero.optional(zero.string),
  )
  zero.success(AccountUpdateSetup(
    type_id: type_id,
    name: name,
    slug: slug,
    extra_seats_block: extra_seats_block,
    billing_name: billing_name,
    billing_email: billing_email,
    billing_details: billing_details,
  ))
}

pub fn payment_method_to_json(data: PaymentMethod) {
  json.object([
    #("method_name", json.nullable(data.method_name, json.string)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("data", json.null()),
    #("state", json.nullable(data.state, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("type", json.nullable(data.type_, json.string)),
    #("id", json.nullable(data.id, json.string)),
  ])
}

pub fn payment_method_decoder() {
  use method_name <- zero.field("method_name", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use data <- zero.field("data", zero.optional(zero.success(Nil)))
  use state <- zero.field("state", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use type_ <- zero.field("type", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  zero.success(PaymentMethod(
    method_name: method_name,
    created_at: created_at,
    data: data,
    state: state,
    updated_at: updated_at,
    type_: type_,
    id: id,
  ))
}

pub fn traffic_rules_aggregate_config_to_json(data: TrafficRulesAggregateConfig) {
  json.object([#("keys", json.null())])
}

pub fn traffic_rules_aggregate_config_decoder() {
  use keys <- zero.field("keys", zero.optional(zero.success(Nil)))
  zero.success(TrafficRulesAggregateConfig(keys: keys))
}

pub fn deploy_to_json(data: Deploy) {
  json.object([
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
    #("function_schedules", json.null()),
    #("screenshot_url", json.nullable(data.screenshot_url, json.string)),
    #("deploy_url", json.nullable(data.deploy_url, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("title", json.nullable(data.title, json.string)),
    #("id", json.nullable(data.id, json.string)),
    #("required_functions", json.null()),
    #("ssl_url", json.nullable(data.ssl_url, json.string)),
    #("framework", json.nullable(data.framework, json.string)),
    #("admin_url", json.nullable(data.admin_url, json.string)),
    #("required", json.null()),
  ])
}

pub fn deploy_decoder() {
  use draft <- zero.field("draft", zero.optional(zero.bool))
  use branch <- zero.field("branch", zero.optional(zero.string))
  use review_id <- zero.field("review_id", zero.optional(zero.float))
  use published_at <- zero.field("published_at", zero.optional(zero.string))
  use deploy_ssl_url <- zero.field("deploy_ssl_url", zero.optional(zero.string))
  use commit_url <- zero.field("commit_url", zero.optional(zero.string))
  use review_url <- zero.field("review_url", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use locked <- zero.field("locked", zero.optional(zero.bool))
  use commit_ref <- zero.field("commit_ref", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use build_id <- zero.field("build_id", zero.optional(zero.string))
  use url <- zero.field("url", zero.optional(zero.string))
  use context <- zero.field("context", zero.optional(zero.string))
  use user_id <- zero.field("user_id", zero.optional(zero.string))
  use error_message <- zero.field("error_message", zero.optional(zero.string))
  use skipped <- zero.field("skipped", zero.optional(zero.bool))
  use state <- zero.field("state", zero.optional(zero.string))
  use site_id <- zero.field("site_id", zero.optional(zero.string))
  use function_schedules <- zero.field(
    "function_schedules",
    zero.optional(zero.success(Nil)),
  )
  use screenshot_url <- zero.field("screenshot_url", zero.optional(zero.string))
  use deploy_url <- zero.field("deploy_url", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use title <- zero.field("title", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  use required_functions <- zero.field(
    "required_functions",
    zero.optional(zero.list(zero.string)),
  )
  use ssl_url <- zero.field("ssl_url", zero.optional(zero.string))
  use framework <- zero.field("framework", zero.optional(zero.string))
  use admin_url <- zero.field("admin_url", zero.optional(zero.string))
  use required <- zero.field("required", zero.optional(zero.list(zero.string)))
  zero.success(Deploy(
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
  ))
}

pub fn env_var_user_to_json(data: EnvVarUser) {
  json.object([
    #("avatar_url", json.nullable(data.avatar_url, json.string)),
    #("id", json.nullable(data.id, json.string)),
    #("full_name", json.nullable(data.full_name, json.string)),
    #("email", json.nullable(data.email, json.string)),
  ])
}

pub fn env_var_user_decoder() {
  use avatar_url <- zero.field("avatar_url", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  use full_name <- zero.field("full_name", zero.optional(zero.string))
  use email <- zero.field("email", zero.optional(zero.string))
  zero.success(EnvVarUser(
    avatar_url: avatar_url,
    id: id,
    full_name: full_name,
    email: email,
  ))
}

pub fn form_to_json(data: Form) {
  json.object([
    #("created_at", json.nullable(data.created_at, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("paths", json.null()),
    #("site_id", json.nullable(data.site_id, json.string)),
    #("fields", json.null()),
    #("id", json.nullable(data.id, json.string)),
    #("submission_count", json.nullable(data.submission_count, json.int)),
  ])
}

pub fn form_decoder() {
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use paths <- zero.field("paths", zero.optional(zero.list(zero.string)))
  use site_id <- zero.field("site_id", zero.optional(zero.string))
  use fields <- zero.field("fields", zero.optional(zero.success(Nil)))
  use id <- zero.field("id", zero.optional(zero.string))
  use submission_count <- zero.field(
    "submission_count",
    zero.optional(zero.int),
  )
  zero.success(Form(
    created_at: created_at,
    name: name,
    paths: paths,
    site_id: site_id,
    fields: fields,
    id: id,
    submission_count: submission_count,
  ))
}

pub fn account_membership_to_json(data: AccountMembership) {
  json.object([
    #("type_id", json.nullable(data.type_id, json.string)),
    #("payment_method_id", json.nullable(data.payment_method_id, json.string)),
    #("billing_period", json.nullable(data.billing_period, json.string)),
    #("roles_allowed", json.null()),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("slug", json.nullable(data.slug, json.string)),
    #("owner_ids", json.null()),
    #("billing_name", json.nullable(data.billing_name, json.string)),
    #("type_name", json.nullable(data.type_name, json.string)),
    #("capabilities", json.null()),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("billing_email", json.nullable(data.billing_email, json.string)),
    #("type", json.nullable(data.type_, json.string)),
    #("id", json.nullable(data.id, json.string)),
    #("billing_details", json.nullable(data.billing_details, json.string)),
  ])
}

pub fn account_membership_decoder() {
  use type_id <- zero.field("type_id", zero.optional(zero.string))
  use payment_method_id <- zero.field(
    "payment_method_id",
    zero.optional(zero.string),
  )
  use billing_period <- zero.field("billing_period", zero.optional(zero.string))
  use roles_allowed <- zero.field(
    "roles_allowed",
    zero.optional(zero.list(zero.string)),
  )
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use slug <- zero.field("slug", zero.optional(zero.string))
  use owner_ids <- zero.field(
    "owner_ids",
    zero.optional(zero.list(zero.string)),
  )
  use billing_name <- zero.field("billing_name", zero.optional(zero.string))
  use type_name <- zero.field("type_name", zero.optional(zero.string))
  use capabilities <- zero.field(
    "capabilities",
    zero.optional(zero.success(Nil)),
  )
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use billing_email <- zero.field("billing_email", zero.optional(zero.string))
  use type_ <- zero.field("type", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  use billing_details <- zero.field(
    "billing_details",
    zero.optional(zero.string),
  )
  zero.success(AccountMembership(
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
  ))
}

pub fn traffic_rules_rate_limit_config_to_json(
  data: TrafficRulesRateLimitConfig,
) {
  json.object([
    #("window_limit", json.nullable(data.window_limit, json.int)),
    #("algorithm", json.nullable(data.algorithm, json.string)),
    #("window_size", json.nullable(data.window_size, json.int)),
  ])
}

pub fn traffic_rules_rate_limit_config_decoder() {
  use window_limit <- zero.field("window_limit", zero.optional(zero.int))
  use algorithm <- zero.field("algorithm", zero.optional(zero.string))
  use window_size <- zero.field("window_size", zero.optional(zero.int))
  zero.success(TrafficRulesRateLimitConfig(
    window_limit: window_limit,
    algorithm: algorithm,
    window_size: window_size,
  ))
}

pub fn hook_to_json(data: Hook) {
  json.object([
    #("created_at", json.nullable(data.created_at, json.string)),
    #("data", json.null()),
    #("site_id", json.nullable(data.site_id, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("event", json.nullable(data.event, json.string)),
    #("type", json.nullable(data.type_, json.string)),
    #("id", json.nullable(data.id, json.string)),
    #("disabled", json.nullable(data.disabled, json.bool)),
  ])
}

pub fn hook_decoder() {
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use data <- zero.field("data", zero.optional(zero.success(Nil)))
  use site_id <- zero.field("site_id", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use event <- zero.field("event", zero.optional(zero.string))
  use type_ <- zero.field("type", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.string))
  use disabled <- zero.field("disabled", zero.optional(zero.bool))
  zero.success(Hook(
    created_at: created_at,
    data: data,
    site_id: site_id,
    updated_at: updated_at,
    event: event,
    type_: type_,
    id: id,
    disabled: disabled,
  ))
}

pub fn dev_server_hook_setup_to_json(data: DevServerHookSetup) {
  json.object([
    #("branch", json.nullable(data.branch, json.string)),
    #("title", json.nullable(data.title, json.string)),
    #("type", json.nullable(data.type_, json.string)),
  ])
}

pub fn dev_server_hook_setup_decoder() {
  use branch <- zero.field("branch", zero.optional(zero.string))
  use title <- zero.field("title", zero.optional(zero.string))
  use type_ <- zero.field("type", zero.optional(zero.string))
  zero.success(DevServerHookSetup(branch: branch, title: title, type_: type_))
}

pub fn plugin_run_data_to_json(data: PluginRunData) {
  json.object([
    #("package", json.nullable(data.package, json.string)),
    #("summary", json.nullable(data.summary, json.string)),
    #("reporting_event", json.nullable(data.reporting_event, json.string)),
    #("text", json.nullable(data.text, json.string)),
    #("state", json.nullable(data.state, json.string)),
    #("version", json.nullable(data.version, json.string)),
    #("title", json.nullable(data.title, json.string)),
  ])
}

pub fn plugin_run_data_decoder() {
  use package <- zero.field("package", zero.optional(zero.string))
  use summary <- zero.field("summary", zero.optional(zero.string))
  use reporting_event <- zero.field(
    "reporting_event",
    zero.optional(zero.string),
  )
  use text <- zero.field("text", zero.optional(zero.string))
  use state <- zero.field("state", zero.optional(zero.string))
  use version <- zero.field("version", zero.optional(zero.string))
  use title <- zero.field("title", zero.optional(zero.string))
  zero.success(PluginRunData(
    package: package,
    summary: summary,
    reporting_event: reporting_event,
    text: text,
    state: state,
    version: version,
    title: title,
  ))
}

pub fn repo_info_to_json(data: RepoInfo) {
  json.object([
    #("installation_id", json.nullable(data.installation_id, json.int)),
    #("stop_builds", json.nullable(data.stop_builds, json.bool)),
    #("repo_url", json.nullable(data.repo_url, json.string)),
    #("allowed_branches", json.null()),
    #("public_repo", json.nullable(data.public_repo, json.bool)),
    #("functions_dir", json.nullable(data.functions_dir, json.string)),
    #("private_logs", json.nullable(data.private_logs, json.bool)),
    #("dir", json.nullable(data.dir, json.string)),
    #("env", json.null()),
    #("repo_branch", json.nullable(data.repo_branch, json.string)),
    #("provider", json.nullable(data.provider, json.string)),
    #("repo_path", json.nullable(data.repo_path, json.string)),
    #("deploy_key_id", json.nullable(data.deploy_key_id, json.string)),
    #("cmd", json.nullable(data.cmd, json.string)),
    #("id", json.nullable(data.id, json.int)),
  ])
}

pub fn repo_info_decoder() {
  use installation_id <- zero.field("installation_id", zero.optional(zero.int))
  use stop_builds <- zero.field("stop_builds", zero.optional(zero.bool))
  use repo_url <- zero.field("repo_url", zero.optional(zero.string))
  use allowed_branches <- zero.field(
    "allowed_branches",
    zero.optional(zero.list(zero.string)),
  )
  use public_repo <- zero.field("public_repo", zero.optional(zero.bool))
  use functions_dir <- zero.field("functions_dir", zero.optional(zero.string))
  use private_logs <- zero.field("private_logs", zero.optional(zero.bool))
  use dir <- zero.field("dir", zero.optional(zero.string))
  use env <- zero.field("env", zero.optional(zero.success(Nil)))
  use repo_branch <- zero.field("repo_branch", zero.optional(zero.string))
  use provider <- zero.field("provider", zero.optional(zero.string))
  use repo_path <- zero.field("repo_path", zero.optional(zero.string))
  use deploy_key_id <- zero.field("deploy_key_id", zero.optional(zero.string))
  use cmd <- zero.field("cmd", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  zero.success(RepoInfo(
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
  ))
}

pub fn build_status_to_json(data: BuildStatus) {
  json.object([
    #("active", json.nullable(data.active, json.int)),
    #("pending_concurrency", json.nullable(data.pending_concurrency, json.int)),
    #("enqueued", json.nullable(data.enqueued, json.int)),
    #("build_count", json.nullable(data.build_count, json.int)),
    #("minutes", json.null()),
  ])
}

pub fn build_status_decoder() {
  use active <- zero.field("active", zero.optional(zero.int))
  use pending_concurrency <- zero.field(
    "pending_concurrency",
    zero.optional(zero.int),
  )
  use enqueued <- zero.field("enqueued", zero.optional(zero.int))
  use build_count <- zero.field("build_count", zero.optional(zero.int))
  use minutes <- zero.field("minutes", zero.optional(zero.success(Nil)))
  zero.success(BuildStatus(
    active: active,
    pending_concurrency: pending_concurrency,
    enqueued: enqueued,
    build_count: build_count,
    minutes: minutes,
  ))
}
