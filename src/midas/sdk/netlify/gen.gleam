import gleam/option.{type Option}
import decode/zero

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
  Metadata()
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

pub fn decode_asset_public_signature(raw) {
  let decoder = {
    use url <- zero.field("url", zero.optional(zero.string))
    zero.success(AssetPublicSignature(url: url))
  }
  zero.run(raw, decoder)
}

pub fn decode_site_function(raw) {
  let decoder = {
    use branch <- zero.field("branch", zero.optional(zero.string))
    use created_at <- zero.field("created_at", zero.optional(zero.string))
    use provider <- zero.field("provider", zero.optional(zero.string))
    use log_type <- zero.field("log_type", zero.optional(zero.string))
    use id <- zero.field("id", zero.optional(zero.string))
    use functions <- zero.field("functions", zero.optional(zero.success(Nil)))
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_hook_type(raw) {
  let decoder = {
    use name <- zero.field("name", zero.optional(zero.string))
    use events <- zero.field("events", zero.optional(zero.list(zero.string)))
    use fields <- zero.field("fields", zero.optional(zero.success(Nil)))
    zero.success(HookType(name: name, events: events, fields: fields))
  }
  zero.run(raw, decoder)
}

pub fn decode_snippet(raw) {
  let decoder = {
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_file(raw) {
  let decoder = {
    use size <- zero.field("size", zero.optional(zero.int))
    use path <- zero.field("path", zero.optional(zero.string))
    use mime_type <- zero.field("mime_type", zero.optional(zero.string))
    use sha <- zero.field("sha", zero.optional(zero.string))
    use id <- zero.field("id", zero.optional(zero.string))
    zero.success(
      File(size: size, path: path, mime_type: mime_type, sha: sha, id: id),
    )
  }
  zero.run(raw, decoder)
}

pub fn decode_traffic_rules_config(raw) {
  let decoder = {
    use action <- zero.field("action", zero.optional(zero.success(Nil)))
    zero.success(TrafficRulesConfig(action: action))
  }
  zero.run(raw, decoder)
}

pub fn decode_dev_server_hook(raw) {
  let decoder = {
    use branch <- zero.field("branch", zero.optional(zero.string))
    use created_at <- zero.field("created_at", zero.optional(zero.string))
    use url <- zero.field("url", zero.optional(zero.string))
    use site_id <- zero.field("site_id", zero.optional(zero.string))
    use title <- zero.field("title", zero.optional(zero.string))
    use type_ <- zero.field("type", zero.optional(zero.string))
    use id <- zero.field("id", zero.optional(zero.string))
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_env_var(raw) {
  let decoder = {
    use values <- zero.field("values", zero.optional(zero.success(Nil)))
    use is_secret <- zero.field("is_secret", zero.optional(zero.bool))
    use updated_at <- zero.field("updated_at", zero.optional(zero.string))
    use updated_by <- zero.field("updated_by", zero.optional(zero.success(Nil)))
    use scopes <- zero.field("scopes", zero.optional(zero.list(zero.string)))
    use key <- zero.field("key", zero.optional(zero.string))
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_dns_record(raw) {
  let decoder = {
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_member(raw) {
  let decoder = {
    use role <- zero.field("role", zero.optional(zero.string))
    use avatar <- zero.field("avatar", zero.optional(zero.string))
    use id <- zero.field("id", zero.optional(zero.string))
    use full_name <- zero.field("full_name", zero.optional(zero.string))
    use email <- zero.field("email", zero.optional(zero.string))
    zero.success(
      Member(
        role: role,
        avatar: avatar,
        id: id,
        full_name: full_name,
        email: email,
      ),
    )
  }
  zero.run(raw, decoder)
}

pub fn decode_function_config(raw) {
  let decoder = {
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_plugin_params(raw) {
  let decoder = {
    use pinned_version <- zero.field(
      "pinned_version",
      zero.optional(zero.string),
    )
    zero.success(PluginParams(pinned_version: pinned_version))
  }
  zero.run(raw, decoder)
}

pub fn decode_deploy_key(raw) {
  let decoder = {
    use public_key <- zero.field("public_key", zero.optional(zero.string))
    use created_at <- zero.field("created_at", zero.optional(zero.string))
    use id <- zero.field("id", zero.optional(zero.string))
    zero.success(
      DeployKey(public_key: public_key, created_at: created_at, id: id),
    )
  }
  zero.run(raw, decoder)
}

pub fn decode_function(raw) {
  let decoder = {
    use name <- zero.field("name", zero.optional(zero.string))
    use sha <- zero.field("sha", zero.optional(zero.string))
    use id <- zero.field("id", zero.optional(zero.string))
    zero.success(Function(name: name, sha: sha, id: id))
  }
  zero.run(raw, decoder)
}

pub fn decode_dev_server(raw) {
  let decoder = {
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_plugin_run(raw) {
  let decoder = {
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
    zero.success(
      PluginRun(
        package: package,
        summary: summary,
        reporting_event: reporting_event,
        text: text,
        state: state,
        deploy_id: deploy_id,
        version: version,
        title: title,
      ),
    )
  }
  zero.run(raw, decoder)
}

pub fn decode_env_var_value(raw) {
  let decoder = {
    use context <- zero.field("context", zero.optional(zero.string))
    use value <- zero.field("value", zero.optional(zero.string))
    use context_parameter <- zero.field(
      "context_parameter",
      zero.optional(zero.string),
    )
    use id <- zero.field("id", zero.optional(zero.string))
    zero.success(
      EnvVarValue(
        context: context,
        value: value,
        context_parameter: context_parameter,
        id: id,
      ),
    )
  }
  zero.run(raw, decoder)
}

pub fn decode_site_setup(raw) {
  let decoder = {
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
    use screenshot_url <- zero.field(
      "screenshot_url",
      zero.optional(zero.string),
    )
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
    zero.success(
      SiteSetup(
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
      ),
    )
  }
  zero.run(raw, decoder)
}

pub fn decode_dns_record_create(raw) {
  let decoder = {
    use port <- zero.field("port", zero.optional(zero.int))
    use priority <- zero.field("priority", zero.optional(zero.int))
    use ttl <- zero.field("ttl", zero.optional(zero.int))
    use flag <- zero.field("flag", zero.optional(zero.int))
    use value <- zero.field("value", zero.optional(zero.string))
    use hostname <- zero.field("hostname", zero.optional(zero.string))
    use weight <- zero.field("weight", zero.optional(zero.int))
    use type_ <- zero.field("type", zero.optional(zero.string))
    use tag <- zero.field("tag", zero.optional(zero.string))
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_access_token(raw) {
  let decoder = {
    use user_email <- zero.field("user_email", zero.optional(zero.string))
    use created_at <- zero.field("created_at", zero.optional(zero.string))
    use user_id <- zero.field("user_id", zero.optional(zero.string))
    use id <- zero.field("id", zero.optional(zero.string))
    use access_token <- zero.field("access_token", zero.optional(zero.string))
    zero.success(
      AccessToken(
        user_email: user_email,
        created_at: created_at,
        user_id: user_id,
        id: id,
        access_token: access_token,
      ),
    )
  }
  zero.run(raw, decoder)
}

pub fn decode_service(raw) {
  let decoder = {
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_dns_zone(raw) {
  let decoder = {
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_asset_form(raw) {
  let decoder = {
    use url <- zero.field("url", zero.optional(zero.string))
    use fields <- zero.field("fields", zero.optional(zero.success(Nil)))
    zero.success(AssetForm(url: url, fields: fields))
  }
  zero.run(raw, decoder)
}

pub fn decode_plugin(raw) {
  let decoder = {
    use package <- zero.field("package", zero.optional(zero.string))
    use pinned_version <- zero.field(
      "pinned_version",
      zero.optional(zero.string),
    )
    zero.success(Plugin(package: package, pinned_version: pinned_version))
  }
  zero.run(raw, decoder)
}

pub fn decode_split_test_setup(raw) {
  let decoder = {
    use branch_tests <- zero.field(
      "branch_tests",
      zero.optional(zero.success(Nil)),
    )
    zero.success(SplitTestSetup(branch_tests: branch_tests))
  }
  zero.run(raw, decoder)
}

pub fn decode_function_route(raw) {
  let decoder = {
    use literal <- zero.field("literal", zero.optional(zero.string))
    use pattern <- zero.field("pattern", zero.optional(zero.string))
    use methods <- zero.field("methods", zero.optional(zero.list(zero.string)))
    use expression <- zero.field("expression", zero.optional(zero.string))
    use prefer_static <- zero.field("prefer_static", zero.optional(zero.bool))
    zero.success(
      FunctionRoute(
        literal: literal,
        pattern: pattern,
        methods: methods,
        expression: expression,
        prefer_static: prefer_static,
      ),
    )
  }
  zero.run(raw, decoder)
}

pub fn decode_build_hook(raw) {
  let decoder = {
    use branch <- zero.field("branch", zero.optional(zero.string))
    use created_at <- zero.field("created_at", zero.optional(zero.string))
    use url <- zero.field("url", zero.optional(zero.string))
    use site_id <- zero.field("site_id", zero.optional(zero.string))
    use title <- zero.field("title", zero.optional(zero.string))
    use id <- zero.field("id", zero.optional(zero.string))
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_asset(raw) {
  let decoder = {
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_deploy_files(raw) {
  let decoder = {
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_account_setup(raw) {
  let decoder = {
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
    zero.success(
      AccountSetup(
        type_id: type_id,
        payment_method_id: payment_method_id,
        period: period,
        name: name,
        extra_seats_block: extra_seats_block,
      ),
    )
  }
  zero.run(raw, decoder)
}

pub fn decode_metadata(raw) {
  let decoder = {
    zero.success(Metadata)
  }
  zero.run(raw, decoder)
}

pub fn decode_function_schedule(raw) {
  let decoder = {
    use name <- zero.field("name", zero.optional(zero.string))
    use cron <- zero.field("cron", zero.optional(zero.string))
    zero.success(FunctionSchedule(name: name, cron: cron))
  }
  zero.run(raw, decoder)
}

pub fn decode_build_setup(raw) {
  let decoder = {
    use clear_cache <- zero.field("clear_cache", zero.optional(zero.bool))
    use image <- zero.field("image", zero.optional(zero.string))
    zero.success(BuildSetup(clear_cache: clear_cache, image: image))
  }
  zero.run(raw, decoder)
}

pub fn decode_account_add_member_setup(raw) {
  let decoder = {
    use role <- zero.field("role", zero.optional(zero.string))
    use email <- zero.field("email", zero.optional(zero.string))
    zero.success(AccountAddMemberSetup(role: role, email: email))
  }
  zero.run(raw, decoder)
}

pub fn decode_build(raw) {
  let decoder = {
    use done <- zero.field("done", zero.optional(zero.bool))
    use error <- zero.field("error", zero.optional(zero.string))
    use created_at <- zero.field("created_at", zero.optional(zero.string))
    use sha <- zero.field("sha", zero.optional(zero.string))
    use deploy_id <- zero.field("deploy_id", zero.optional(zero.string))
    use id <- zero.field("id", zero.optional(zero.string))
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_account_update_member_setup(raw) {
  let decoder = {
    use site_ids <- zero.field("site_ids", zero.optional(zero.list(zero.string)))
    use role <- zero.field("role", zero.optional(zero.string))
    use site_access <- zero.field("site_access", zero.optional(zero.string))
    zero.success(
      AccountUpdateMemberSetup(
        site_ids: site_ids,
        role: role,
        site_access: site_access,
      ),
    )
  }
  zero.run(raw, decoder)
}

pub fn decode_account_usage_capability(raw) {
  let decoder = {
    use included <- zero.field("included", zero.optional(zero.int))
    use used <- zero.field("used", zero.optional(zero.int))
    zero.success(AccountUsageCapability(included: included, used: used))
  }
  zero.run(raw, decoder)
}

pub fn decode_submission(raw) {
  let decoder = {
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_ticket(raw) {
  let decoder = {
    use created_at <- zero.field("created_at", zero.optional(zero.string))
    use client_id <- zero.field("client_id", zero.optional(zero.string))
    use id <- zero.field("id", zero.optional(zero.string))
    use authorized <- zero.field("authorized", zero.optional(zero.bool))
    zero.success(
      Ticket(
        created_at: created_at,
        client_id: client_id,
        id: id,
        authorized: authorized,
      ),
    )
  }
  zero.run(raw, decoder)
}

pub fn decode_split_test(raw) {
  let decoder = {
    use path <- zero.field("path", zero.optional(zero.string))
    use active <- zero.field("active", zero.optional(zero.bool))
    use created_at <- zero.field("created_at", zero.optional(zero.string))
    use name <- zero.field("name", zero.optional(zero.string))
    use branches <- zero.field("branches", zero.optional(zero.success(Nil)))
    use site_id <- zero.field("site_id", zero.optional(zero.string))
    use updated_at <- zero.field("updated_at", zero.optional(zero.string))
    use id <- zero.field("id", zero.optional(zero.string))
    use unpublished_at <- zero.field(
      "unpublished_at",
      zero.optional(zero.string),
    )
    zero.success(
      SplitTest(
        path: path,
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
  zero.run(raw, decoder)
}

pub fn decode_build_hook_setup(raw) {
  let decoder = {
    use branch <- zero.field("branch", zero.optional(zero.string))
    use title <- zero.field("title", zero.optional(zero.string))
    zero.success(BuildHookSetup(branch: branch, title: title))
  }
  zero.run(raw, decoder)
}

pub fn decode_user(raw) {
  let decoder = {
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_build_log_msg(raw) {
  let decoder = {
    use section <- zero.field("section", zero.optional(zero.string))
    use message <- zero.field("message", zero.optional(zero.string))
    use error <- zero.field("error", zero.optional(zero.bool))
    zero.success(BuildLogMsg(section: section, message: message, error: error))
  }
  zero.run(raw, decoder)
}

pub fn decode_purge(raw) {
  let decoder = {
    use site_slug <- zero.field("site_slug", zero.optional(zero.string))
    use site_id <- zero.field("site_id", zero.optional(zero.string))
    use cache_tags <- zero.field(
      "cache_tags",
      zero.optional(zero.list(zero.string)),
    )
    zero.success(
      Purge(site_slug: site_slug, site_id: site_id, cache_tags: cache_tags),
    )
  }
  zero.run(raw, decoder)
}

pub fn decode_service_instance(raw) {
  let decoder = {
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_sni_certificate(raw) {
  let decoder = {
    use created_at <- zero.field("created_at", zero.optional(zero.string))
    use domains <- zero.field("domains", zero.optional(zero.list(zero.string)))
    use state <- zero.field("state", zero.optional(zero.string))
    use updated_at <- zero.field("updated_at", zero.optional(zero.string))
    use expires_at <- zero.field("expires_at", zero.optional(zero.string))
    zero.success(
      SniCertificate(
        created_at: created_at,
        domains: domains,
        state: state,
        updated_at: updated_at,
        expires_at: expires_at,
      ),
    )
  }
  zero.run(raw, decoder)
}

pub fn decode_audit_log(raw) {
  let decoder = {
    use account_id <- zero.field("account_id", zero.optional(zero.string))
    use payload <- zero.field("payload", zero.optional(zero.success(Nil)))
    use id <- zero.field("id", zero.optional(zero.string))
    zero.success(AuditLog(account_id: account_id, payload: payload, id: id))
  }
  zero.run(raw, decoder)
}

pub fn decode_asset_signature(raw) {
  let decoder = {
    use form <- zero.field("form", zero.optional(zero.success(Nil)))
    use asset <- zero.field("asset", zero.optional(zero.success(Nil)))
    zero.success(AssetSignature(form: form, asset: asset))
  }
  zero.run(raw, decoder)
}

pub fn decode_dns_zone_setup(raw) {
  let decoder = {
    use name <- zero.field("name", zero.optional(zero.string))
    use site_id <- zero.field("site_id", zero.optional(zero.string))
    use account_slug <- zero.field("account_slug", zero.optional(zero.string))
    zero.success(
      DnsZoneSetup(name: name, site_id: site_id, account_slug: account_slug),
    )
  }
  zero.run(raw, decoder)
}

pub fn decode_error(raw) {
  let decoder = {
    use message <- zero.field("message", zero.optional(zero.string))
    use code <- zero.field("code", zero.optional(zero.int))
    zero.success(Error(message: message, code: code))
  }
  zero.run(raw, decoder)
}

pub fn decode_deployed_branch(raw) {
  let decoder = {
    use name <- zero.field("name", zero.optional(zero.string))
    use slug <- zero.field("slug", zero.optional(zero.string))
    use url <- zero.field("url", zero.optional(zero.string))
    use deploy_id <- zero.field("deploy_id", zero.optional(zero.string))
    use id <- zero.field("id", zero.optional(zero.string))
    use ssl_url <- zero.field("ssl_url", zero.optional(zero.string))
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_excluded_function_route(raw) {
  let decoder = {
    use literal <- zero.field("literal", zero.optional(zero.string))
    use pattern <- zero.field("pattern", zero.optional(zero.string))
    use expression <- zero.field("expression", zero.optional(zero.string))
    zero.success(
      ExcludedFunctionRoute(
        literal: literal,
        pattern: pattern,
        expression: expression,
      ),
    )
  }
  zero.run(raw, decoder)
}

pub fn decode_site(raw) {
  let decoder = {
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
    use screenshot_url <- zero.field(
      "screenshot_url",
      zero.optional(zero.string),
    )
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_account_type(raw) {
  let decoder = {
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_account_update_setup(raw) {
  let decoder = {
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_payment_method(raw) {
  let decoder = {
    use method_name <- zero.field("method_name", zero.optional(zero.string))
    use created_at <- zero.field("created_at", zero.optional(zero.string))
    use data <- zero.field("data", zero.optional(zero.success(Nil)))
    use state <- zero.field("state", zero.optional(zero.string))
    use updated_at <- zero.field("updated_at", zero.optional(zero.string))
    use type_ <- zero.field("type", zero.optional(zero.string))
    use id <- zero.field("id", zero.optional(zero.string))
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_traffic_rules_aggregate_config(raw) {
  let decoder = {
    use keys <- zero.field("keys", zero.optional(zero.success(Nil)))
    zero.success(TrafficRulesAggregateConfig(keys: keys))
  }
  zero.run(raw, decoder)
}

pub fn decode_deploy(raw) {
  let decoder = {
    use draft <- zero.field("draft", zero.optional(zero.bool))
    use branch <- zero.field("branch", zero.optional(zero.string))
    use review_id <- zero.field("review_id", zero.optional(zero.float))
    use published_at <- zero.field("published_at", zero.optional(zero.string))
    use deploy_ssl_url <- zero.field(
      "deploy_ssl_url",
      zero.optional(zero.string),
    )
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
    use screenshot_url <- zero.field(
      "screenshot_url",
      zero.optional(zero.string),
    )
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_env_var_user(raw) {
  let decoder = {
    use avatar_url <- zero.field("avatar_url", zero.optional(zero.string))
    use id <- zero.field("id", zero.optional(zero.string))
    use full_name <- zero.field("full_name", zero.optional(zero.string))
    use email <- zero.field("email", zero.optional(zero.string))
    zero.success(
      EnvVarUser(
        avatar_url: avatar_url,
        id: id,
        full_name: full_name,
        email: email,
      ),
    )
  }
  zero.run(raw, decoder)
}

pub fn decode_form(raw) {
  let decoder = {
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_account_membership(raw) {
  let decoder = {
    use type_id <- zero.field("type_id", zero.optional(zero.string))
    use payment_method_id <- zero.field(
      "payment_method_id",
      zero.optional(zero.string),
    )
    use billing_period <- zero.field(
      "billing_period",
      zero.optional(zero.string),
    )
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_traffic_rules_rate_limit_config(raw) {
  let decoder = {
    use window_limit <- zero.field("window_limit", zero.optional(zero.int))
    use algorithm <- zero.field("algorithm", zero.optional(zero.string))
    use window_size <- zero.field("window_size", zero.optional(zero.int))
    zero.success(
      TrafficRulesRateLimitConfig(
        window_limit: window_limit,
        algorithm: algorithm,
        window_size: window_size,
      ),
    )
  }
  zero.run(raw, decoder)
}

pub fn decode_hook(raw) {
  let decoder = {
    use created_at <- zero.field("created_at", zero.optional(zero.string))
    use data <- zero.field("data", zero.optional(zero.success(Nil)))
    use site_id <- zero.field("site_id", zero.optional(zero.string))
    use updated_at <- zero.field("updated_at", zero.optional(zero.string))
    use event <- zero.field("event", zero.optional(zero.string))
    use type_ <- zero.field("type", zero.optional(zero.string))
    use id <- zero.field("id", zero.optional(zero.string))
    use disabled <- zero.field("disabled", zero.optional(zero.bool))
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_dev_server_hook_setup(raw) {
  let decoder = {
    use branch <- zero.field("branch", zero.optional(zero.string))
    use title <- zero.field("title", zero.optional(zero.string))
    use type_ <- zero.field("type", zero.optional(zero.string))
    zero.success(DevServerHookSetup(branch: branch, title: title, type_: type_))
  }
  zero.run(raw, decoder)
}

pub fn decode_plugin_run_data(raw) {
  let decoder = {
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_repo_info(raw) {
  let decoder = {
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
    zero.success(
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
  zero.run(raw, decoder)
}

pub fn decode_build_status(raw) {
  let decoder = {
    use active <- zero.field("active", zero.optional(zero.int))
    use pending_concurrency <- zero.field(
      "pending_concurrency",
      zero.optional(zero.int),
    )
    use enqueued <- zero.field("enqueued", zero.optional(zero.int))
    use build_count <- zero.field("build_count", zero.optional(zero.int))
    use minutes <- zero.field("minutes", zero.optional(zero.success(Nil)))
    zero.success(
      BuildStatus(
        active: active,
        pending_concurrency: pending_concurrency,
        enqueued: enqueued,
        build_count: build_count,
        minutes: minutes,
      ),
    )
  }
  zero.run(raw, decoder)
}
