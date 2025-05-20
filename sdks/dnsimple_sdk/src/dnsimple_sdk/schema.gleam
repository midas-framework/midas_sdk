import gleam/option.{type Option, None}
import dnsimple_sdk/utils
import gleam/json
import gleam/dynamic
import gleam/dynamic/decode

pub type Contact {
  Contact(
    postal_code: Option(String),
    created_at: Option(DateTime),
    city: Option(String),
    account_id: Option(Int),
    phone: Option(String),
    last_name: Option(String),
    label: Option(String),
    job_title: Option(String),
    country: Option(String),
    organization_name: Option(String),
    updated_at: Option(DateTime),
    first_name: Option(String),
    id: Option(Int),
    email: Option(String),
    address1: Option(String),
    fax: Option(String),
    address2: Option(String),
    state_province: Option(String),
  )
}

pub type EventDomainRegisterStarted {
  EventDomainRegisterStarted(domain: Option(Domain))
}

pub type WhoisPrivacy {
  WhoisPrivacy(
    enabled: Option(Bool),
    created_at: Option(DateTime),
    expires_on: Option(Date),
    domain_id: Option(Int),
    updated_at: Option(DateTime),
    id: Option(Int),
  )
}

pub type EventDomainRegister {
  EventDomainRegister(domain: Option(Domain))
}

pub type EventDomainRestoreCancelled {
  EventDomainRestoreCancelled(domain: Option(Domain), auto_: Option(Bool))
}

pub type DomainCheckResult {
  DomainCheckResult(
    domain: Option(String),
    available: Option(Bool),
    premium: Option(Bool),
  )
}

pub type EventTemplateRecordCreate {
  EventTemplateRecordCreate(template_record: Option(TemplateRecord))
}

pub type EventDomainRenewCancelled {
  EventDomainRenewCancelled(domain: Option(Domain), auto_: Option(Bool))
}

pub type EventContactCreate {
  EventContactCreate(contact: Option(Contact))
}

pub type EventAccountRemoveUser {
  EventAccountRemoveUser(user: Option(User), account: Option(Account))
}

pub type EventDnssecrotationStart {
  EventDnssecrotationStart(
    dnssec: Option(Dnssec),
    delegation_signer_record: Option(DelegationSigner),
  )
}

pub type EventZoneCreate {
  EventZoneCreate(zone: Option(Zone))
}

pub type ExtendedAttribute {
  ExtendedAttribute(
    name: Option(String),
    description: Option(String),
    options: Option(List(ExtendedAttributeOption)),
    required: Option(Bool),
  )
}

pub type EventVanityDisable {
  EventVanityDisable(domain: Option(Domain))
}

pub type Domain {
  Domain(
    created_at: Option(DateTime),
    expires_on: Option(Date),
    name: Option(String),
    private_whois: Option(Bool),
    account_id: Option(Int),
    unicode_name: Option(String),
    registrant_id: Option(Int),
    state: Option(String),
    updated_at: Option(DateTime),
    id: Option(Int),
    auto_renew: Option(Bool),
    expires_at: Option(NullableDateTime),
  )
}

pub type PrimaryServer {
  PrimaryServer(
    port: Option(Int),
    ip: Option(String),
    created_at: Option(DateTime),
    name: Option(String),
    account_id: Option(Int),
    linked_secondary_zones: Option(List(String)),
    updated_at: Option(DateTime),
    id: Option(Int),
  )
}

pub type Collaborator {
  Collaborator(
    domain_name: Option(String),
    user_email: Option(String),
    created_at: Option(DateTime),
    accepted_at: Option(DateTime),
    user_id: Option(Int),
    domain_id: Option(Int),
    updated_at: Option(DateTime),
    invitation: Option(Bool),
    id: Option(Int),
  )
}

pub type AccountInvitation {
  AccountInvitation(
    invitation_accepted_at: Option(NullableDateTime),
    created_at: Option(DateTime),
    account_id: Option(Int),
    invitation_sent_at: Option(DateTime),
    updated_at: Option(DateTime),
    token_: Option(String),
    id: Option(Int),
    email: Option(String),
  )
}

pub type ChargeItem {
  ChargeItem(
    product_type: Option(String),
    product_id: Option(Int),
    amount: Option(String),
    product_reference: Option(String),
    description: Option(String),
  )
}

pub type EventRecordCreate {
  EventRecordCreate(zone_record: Option(ZoneRecord))
}

pub type EventAccountInvitationResend {
  EventAccountInvitationResend(
    account_invitation: Option(AccountInvitation),
    account: Option(Account),
  )
}

pub type EventDomainTransferCancelled {
  EventDomainTransferCancelled(domain: Option(Domain))
}

pub type Error {
  Error(message: Option(String))
}

pub type EventDomainRegistrantChangeStarted {
  EventDomainRegistrantChangeStarted(
    domain: Option(Domain),
    registrant: Option(Contact),
  )
}

pub type EventAccountInvitationCreate {
  EventAccountInvitationCreate(
    account_invitation: Option(AccountInvitation),
    account: Option(Account),
  )
}

pub type Dnssec {
  Dnssec(
    enabled: Option(Bool),
    created_at: Option(DateTime),
    updated_at: Option(DateTime),
  )
}

pub type EventWebhookDelete {
  EventWebhookDelete(webhook: Option(Webhook))
}

pub type ZoneFile {
  ZoneFile(zone: Option(String))
}

pub type EventVanityEnable {
  EventVanityEnable(domain: Option(Domain))
}

pub type EventCertificateReissue {
  EventCertificateReissue(certificate: Option(Certificate))
}

pub type EventDomainTransfer {
  EventDomainTransfer(domain: Option(Domain))
}

pub type EventDomainDelete {
  EventDomainDelete(domain: Option(Domain))
}

pub type EventCertificateAutoRenewalFailed {
  EventCertificateAutoRenewalFailed(certificate: Option(Certificate))
}

pub type EmailForward {
  EmailForward(
    created_at: Option(DateTime),
    from: Option(String),
    destination_email: Option(String),
    alias_email: Option(String),
    domain_id: Option(Int),
    updated_at: Option(DateTime),
    id: Option(Int),
    to: Option(String),
  )
}

pub type DomainRestore {
  DomainRestore(
    created_at: Option(DateTime),
    state: Option(String),
    domain_id: Option(Int),
    updated_at: Option(DateTime),
    id: Option(Int),
  )
}

pub type EventSecondaryDnscreate {
  EventSecondaryDnscreate(configuration: Option(SecondaryDns))
}

pub type LetsencryptCertificatePurchase {
  LetsencryptCertificatePurchase(
    certificate_id: Option(Int),
    created_at: Option(DateTime),
    state: Option(String),
    updated_at: Option(DateTime),
    id: Option(Int),
    auto_renew: Option(Bool),
  )
}

pub type TemplateRecord {
  TemplateRecord(
    template_id: Option(Int),
    priority: Option(Int),
    created_at: Option(DateTime),
    name: Option(String),
    ttl: Option(Ttl),
    updated_at: Option(DateTime),
    content: Option(String),
    type_: Option(TemplateRecordType),
    id: Option(Int),
  )
}

pub type EventNameServerRegister {
  EventNameServerRegister(name_server: Option(Nil))
}

pub type User {
  User(
    created_at: Option(DateTime),
    updated_at: Option(DateTime),
    id: Option(Int),
    email: Option(String),
  )
}

pub type EventNameServerDeregister {
  EventNameServerDeregister(name_server: Option(Nil))
}

pub type Tld {
  Tld(
    minimum_registration: Option(Int),
    tld: Option(String),
    tld_type: Option(Tldtype),
    transfer_enabled: Option(Bool),
    auto_renew_only: Option(Bool),
    whois_privacy: Option(Bool),
    idn: Option(Bool),
    dnssec_interface_type: Option(String),
    renewal_enabled: Option(Bool),
    registration_enabled: Option(Bool),
  )
}

pub type EventEmailForwardUpdate {
  EventEmailForwardUpdate(email_forward: Option(EmailForward))
}

pub type Zone {
  Zone(
    reverse: Option(Bool),
    active: Option(Bool),
    created_at: Option(DateTime),
    name: Option(String),
    account_id: Option(Int),
    secondary: Option(Bool),
    last_transferred_at: Option(DateTime),
    updated_at: Option(DateTime),
    id: Option(Int),
  )
}

pub type EventDomainResolutionEnable {
  EventDomainResolutionEnable(domain: Option(Domain))
}

pub type RegistrantChangeCheck {
  RegistrantChangeCheck(
    domain_id: Option(Int),
    contact_id: Option(Int),
    extended_attributes: Option(List(ExtendedAttribute)),
    registry_owner_change: Option(Bool),
  )
}

pub type EventDnssecdelete {
  EventDnssecdelete(dnssec: Option(Dnssec))
}

pub type Account {
  Account(
    created_at: Option(DateTime),
    updated_at: Option(DateTime),
    id: Option(Int),
    email: Option(String),
    plan_identifier: Option(String),
  )
}

pub type Invoice {
  Invoice(
    created_at: Option(DateTime),
    updated_at: Option(DateTime),
    invoice_number: Option(String),
    id: Option(Int),
  )
}

pub type EventPushInitiate {
  EventPushInitiate(push: Option(Push))
}

pub type EventWhoisPrivacyDisable {
  EventWhoisPrivacyDisable(
    domain: Option(Domain),
    whois_privacy: Option(WhoisPrivacy),
  )
}

pub type EventDomainAutoRenewalEnable {
  EventDomainAutoRenewalEnable(domain: Option(Domain))
}

pub type NameServer {
  NameServer(
    ipv4: Option(String),
    ipv6: Option(String),
    created_at: Option(DateTime),
    name: Option(String),
    updated_at: Option(DateTime),
    id: Option(Int),
  )
}

pub type LetsencryptCertificateRenewal {
  LetsencryptCertificateRenewal(
    new_certificate_id: Option(Int),
    created_at: Option(DateTime),
    state: Option(String),
    updated_at: Option(DateTime),
    id: Option(Int),
    old_certificate_id: Option(Int),
    auto_renew: Option(Bool),
  )
}

pub type DomainPrices {
  DomainPrices(
    renewal_price: Option(Float),
    registration_price: Option(Float),
    domain: Option(String),
    transfer_price: Option(Float),
    premium: Option(Bool),
    restore_price: Option(Float),
  )
}

pub type EventEmailForwardDelete {
  EventEmailForwardDelete(email_forward: Option(EmailForward))
}

pub type EventCertificateAutoRenewalEnable {
  EventCertificateAutoRenewalEnable(certificate: Option(Certificate))
}

pub type EventContactUpdate {
  EventContactUpdate(contact: Option(Contact))
}

pub type DomainTransfer {
  DomainTransfer(
    created_at: Option(DateTime),
    registrant_id: Option(Int),
    status_description: Option(String),
    state: Option(String),
    whois_privacy: Option(Bool),
    domain_id: Option(Int),
    updated_at: Option(DateTime),
    id: Option(Int),
    auto_renew: Option(Bool),
  )
}

pub type EventDomainRenew {
  EventDomainRenew(domain: Option(Domain), auto_: Option(Bool))
}

pub type EventOauthApplicationCreate {
  EventOauthApplicationCreate(oauth_application: Option(OauthApplication))
}

pub type ZoneDistribution {
  ZoneDistribution(distributed: Option(Bool))
}

pub type EventTemplateRecordDelete {
  EventTemplateRecordDelete(template_record: Option(TemplateRecord))
}

pub type EventDomainRestore {
  EventDomainRestore(domain: Option(Domain), auto_: Option(Bool))
}

pub type EventDomainRegisterCancelled {
  EventDomainRegisterCancelled(domain: Option(Domain))
}

pub type EventAccountInvitationRemove {
  EventAccountInvitationRemove(
    account_invitation: Option(AccountInvitation),
    account: Option(Account),
  )
}

pub type EventTemplateCreate {
  EventTemplateCreate(template: Option(Template))
}

pub type EventContactDelete {
  EventContactDelete(contact: Option(Contact))
}

pub type EventDomainRestoreStarted {
  EventDomainRestoreStarted(domain: Option(Domain), auto_: Option(Bool))
}

pub type EventZoneDelete {
  EventZoneDelete(zone: Option(Zone))
}

pub type EventDomainRenewStarted {
  EventDomainRenewStarted(domain: Option(Domain), auto_: Option(Bool))
}

pub type DelegationSigner {
  DelegationSigner(
    digest: Option(String),
    public_key: Option(String),
    created_at: Option(DateTime),
    algorithm: Option(String),
    digest_type: Option(String),
    domain_id: Option(Int),
    updated_at: Option(DateTime),
    keytag: Option(String),
    id: Option(Int),
  )
}

pub type EventPushReject {
  EventPushReject(push: Option(Push))
}

pub type EventWhoisPrivacyRenew {
  EventWhoisPrivacyRenew(
    domain: Option(Domain),
    whois_privacy: Option(WhoisPrivacy),
  )
}

pub type EventSubscriptionSubscribe {
  EventSubscriptionSubscribe(subscription: Option(Subscription))
}

pub type CertificatePrivateKey {
  CertificatePrivateKey(private_key: Option(String))
}

pub type EventRecordUpdate {
  EventRecordUpdate(zone_record: Option(ZoneRecord))
}

pub type EventSubscriptionMigrate {
  EventSubscriptionMigrate(subscription: Option(Subscription))
}

pub type EventDomainTransferLockDisable {
  EventDomainTransferLockDisable(domain: Option(Domain))
}

pub type EventAccountBillingSettingsUpdate {
  EventAccountBillingSettingsUpdate(
    billing_settings: Option(BillingSettings),
    account: Option(Account),
  )
}

pub type DomainRenewal {
  DomainRenewal(
    period: Option(Int),
    created_at: Option(DateTime),
    state: Option(String),
    domain_id: Option(Int),
    updated_at: Option(DateTime),
    id: Option(Int),
  )
}

pub type EventAccountInvitationAccept {
  EventAccountInvitationAccept(
    account_invitation: Option(AccountInvitation),
    account: Option(Account),
  )
}

pub type Charge {
  Charge(
    items: Option(List(ChargeItem)),
    reference: Option(String),
    state: Option(String),
    total_amount: Option(String),
    invoiced_at: Option(DateTime),
    balance_amount: Option(String),
  )
}

pub type TradeExtendedAttributes {
  TradeExtendedAttributes()
}

pub type Actor {
  Actor(identifier: Option(String), pretty: Option(String), id: Option(Int))
}

pub type Service {
  Service(
    settings: Option(List(ServiceSetting)),
    default_subdomain: Option(String),
    created_at: Option(DateTime),
    name: Option(String),
    requires_setup: Option(Bool),
    sid: Option(String),
    updated_at: Option(DateTime),
    setup_description: Option(String),
    id: Option(Int),
    description: Option(String),
  )
}

pub type SecondaryDns {
  SecondaryDns(
    created_at: Option(DateTime),
    zone_id: Option(String),
    whitelisted_ips: Option(List(String)),
    updated_at: Option(DateTime),
    id: Option(Int),
    name_servers: Option(List(String)),
  )
}

pub type EventSubscriptionRenew {
  EventSubscriptionRenew(subscription: Option(Subscription))
}

pub type DomainPremiumPrice {
  DomainPremiumPrice(premium_price: Option(String), action: Option(String))
}

pub type EventRecordDelete {
  EventRecordDelete(zone_record: Option(ZoneRecord))
}

pub type EventDomainDelegationChange {
  EventDomainDelegationChange(
    domain: Option(Domain),
    name_servers: Option(List(NameServer)),
  )
}

pub type WebhookAccount {
  WebhookAccount(
    display: Option(String),
    identifier: Option(String),
    id: Option(Int),
  )
}

pub type EventOauthApplicationResetClientSecret {
  EventOauthApplicationResetClientSecret(
    oauth_application: Option(OauthApplication),
  )
}

pub type EventDomainTransferLockEnable {
  EventDomainTransferLockEnable(domain: Option(Domain))
}

pub type Certificate {
  Certificate(
    csr: Option(String),
    alternate_names: Option(List(String)),
    authority_identifier: Option(String),
    created_at: Option(DateTime),
    expires_on: Option(Date),
    name: Option(String),
    state: Option(String),
    domain_id: Option(Int),
    years: Option(Int),
    updated_at: Option(DateTime),
    contact_id: Option(Int),
    id: Option(Int),
    auto_renew: Option(Bool),
    expires_at: Option(DateTime),
    common_name: Option(String),
  )
}

pub type Webhook {
  Webhook(url: Option(String), id: Option(Int), suppressed_at: Option(DateTime))
}

pub type EventInvoiceCollect {
  EventInvoiceCollect(invoice: Option(Invoice))
}

pub type WebhookPayload {
  WebhookPayload(
    data: Option(Nil),
    name: Option(String),
    account: Option(Nil),
    api_version: Option(String),
    actor: Option(Nil),
    request_identifier: Option(String),
  )
}

pub type EventOauthApplicationRevokeAccessTokens {
  EventOauthApplicationRevokeAccessTokens(
    oauth_application: Option(OauthApplication),
  )
}

pub type EventAccountPaymentDetailsUpdate {
  EventAccountPaymentDetailsUpdate(account: Option(Account))
}

pub type EventSecondaryDnsupdate {
  EventSecondaryDnsupdate(configuration: Option(SecondaryDns))
}

pub type EventDomainRegistrantChangeCancelled {
  EventDomainRegistrantChangeCancelled(
    domain: Option(Domain),
    registrant: Option(Contact),
  )
}

pub type WhoisPrivacyRenewal {
  WhoisPrivacyRenewal(
    enabled: Option(Bool),
    whois_privacy_id: Option(Int),
    created_at: Option(DateTime),
    expires_on: Option(Date),
    state: Option(String),
    domain_id: Option(Int),
    updated_at: Option(DateTime),
    id: Option(Int),
  )
}

pub type EventDomainTransferStarted {
  EventDomainTransferStarted(domain: Option(Domain))
}

pub type ExtendedAttributeOption {
  ExtendedAttributeOption(
    value: Option(String),
    title: Option(String),
    description: Option(String),
  )
}

pub type EventDomainRegistrantChange {
  EventDomainRegistrantChange(
    domain: Option(Domain),
    registrant: Option(Contact),
  )
}

pub type EventDnssecrotationComplete {
  EventDnssecrotationComplete(
    dnssec: Option(Dnssec),
    delegation_signer_record: Option(DelegationSigner),
  )
}

pub type EventWebhookCreate {
  EventWebhookCreate(webhook: Option(Webhook))
}

pub type EventAccountAddUser {
  EventAccountAddUser(user: Option(User), account: Option(Account))
}

pub type OauthApplication {
  OauthApplication(
    created_at: Option(DateTime),
    name: Option(String),
    updated_at: Option(DateTime),
    id: Option(Int),
    description: Option(String),
    homepage_url: Option(String),
  )
}

pub type VanityNameServer {
  VanityNameServer(
    ipv4: Option(String),
    ipv6: Option(String),
    created_at: Option(DateTime),
    name: Option(String),
    updated_at: Option(DateTime),
    id: Option(Int),
  )
}

pub type Template {
  Template(
    created_at: Option(DateTime),
    name: Option(String),
    account_id: Option(Int),
    sid: Option(String),
    updated_at: Option(DateTime),
    id: Option(Int),
    description: Option(String),
  )
}

pub type EventSecondaryDnsdelete {
  EventSecondaryDnsdelete(configuration: Option(SecondaryDns))
}

pub type EventSubscriptionUnsubscribe {
  EventSubscriptionUnsubscribe(subscription: Option(Subscription))
}

pub type EventDomainCreate {
  EventDomainCreate(domain: Option(Domain))
}

pub type EventTemplateApply {
  EventTemplateApply(zone: Option(Zone), template: Option(Template))
}

pub type DomainTransferLock {
  DomainTransferLock(enabled: Option(Bool))
}

pub type Push {
  Push(
    created_at: Option(DateTime),
    accepted_at: Option(NullableDateTime),
    account_id: Option(Int),
    domain_id: Option(Int),
    updated_at: Option(DateTime),
    contact_id: Option(Int),
    id: Option(Int),
  )
}

pub type Pagination {
  Pagination(
    total_pages: Option(Int),
    per_page: Option(Int),
    current_page: Option(Int),
    total_entries: Option(Int),
  )
}

pub type RegistrantChange {
  RegistrantChange(
    created_at: Option(DateTime),
    irt_lock_lifted_by: Option(Date),
    account_id: Option(Int),
    state: Option(String),
    domain_id: Option(Int),
    updated_at: Option(DateTime),
    contact_id: Option(Int),
    id: Option(Int),
    extended_attributes: Option(TradeExtendedAttributes),
    registry_owner_change: Option(Bool),
  )
}

pub type ServiceSetting {
  ServiceSetting(
    example: Option(String),
    name: Option(String),
    label: Option(String),
    append: Option(String),
    password: Option(Bool),
    description: Option(String),
  )
}

pub type EventWhoisPrivacyPurchase {
  EventWhoisPrivacyPurchase(
    domain: Option(Domain),
    whois_privacy: Option(WhoisPrivacy),
  )
}

pub type EventCertificateIssue {
  EventCertificateIssue(certificate: Option(Certificate))
}

pub type EventAccountUpdate {
  EventAccountUpdate(account: Option(Account))
}

pub type EventCertificateAutoRenewalDisable {
  EventCertificateAutoRenewalDisable(certificate: Option(Certificate))
}

pub type EventPushAccept {
  EventPushAccept(push: Option(Push))
}

pub type EventOauthApplicationUpdate {
  EventOauthApplicationUpdate(oauth_application: Option(OauthApplication))
}

pub type EventDomainAutoRenewalDisable {
  EventDomainAutoRenewalDisable(domain: Option(Domain))
}

pub type Subscription {
  Subscription(
    plan_name: Option(String),
    created_at: Option(DateTime),
    state: Option(String),
    updated_at: Option(DateTime),
    id: Option(Int),
  )
}

pub type EventCertificateRemovePrivateKey {
  EventCertificateRemovePrivateKey(certificate: Option(Certificate))
}

pub type EventWhoisPrivacyEnable {
  EventWhoisPrivacyEnable(
    domain: Option(Domain),
    whois_privacy: Option(WhoisPrivacy),
  )
}

pub type EventTemplateUpdate {
  EventTemplateUpdate(template: Option(Template))
}

pub type ZoneRecord {
  ZoneRecord(
    system_record: Option(Bool),
    priority: Option(Int),
    created_at: Option(DateTime),
    name: Option(String),
    ttl: Option(Ttl),
    zone_id: Option(String),
    parent_id: Option(Int),
    updated_at: Option(DateTime),
    content: Option(String),
    type_: Option(ZoneRecordType),
    id: Option(Int),
    regions: Option(List(ZoneRecordRegion)),
  )
}

pub type DomainRegistration {
  DomainRegistration(
    period: Option(Int),
    created_at: Option(DateTime),
    registrant_id: Option(Int),
    state: Option(String),
    whois_privacy: Option(Bool),
    domain_id: Option(Int),
    updated_at: Option(DateTime),
    id: Option(Int),
    auto_renew: Option(Bool),
  )
}

pub type EventDomainResolutionDisable {
  EventDomainResolutionDisable(domain: Option(Domain))
}

pub type EventOauthApplicationDelete {
  EventOauthApplicationDelete(oauth_application: Option(OauthApplication))
}

pub type EventDnsseccreate {
  EventDnsseccreate(dnssec: Option(Dnssec))
}

pub type BillingSettings {
  BillingSettings()
}

pub type EventEmailForwardCreate {
  EventEmailForwardCreate(email_forward: Option(EmailForward))
}

pub type CertificateDownload {
  CertificateDownload(
    chain: Option(List(String)),
    root: Option(String),
    server: Option(String),
  )
}

pub type EventTemplateDelete {
  EventTemplateDelete(template: Option(Template))
}

pub type TemplateRecordType =
  String

pub type Tldtype =
  Int

pub type Ttl =
  Int

pub type Date =
  String

pub type NullableDate =
  String

pub type ZoneRecordRegion =
  String

pub type DomainNameServer =
  String

pub type ZoneRecordType =
  String

pub type DateTime =
  String

pub type NullableDateTime =
  String

pub fn event_template_delete_decoder() {
  use template <- decode.optional_field(
    "template",
    None,
    decode.optional(template_decoder()),
  )
  decode.success(EventTemplateDelete(template: template))
}

pub fn event_template_delete_encode(data: EventTemplateDelete) {
  json.object([#("template", json.nullable(data.template, template_encode))])
}

pub fn certificate_download_decoder() {
  use chain <- decode.optional_field(
    "chain",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use root <- decode.optional_field("root", None, decode.optional(decode.string))
  use server <- decode.optional_field(
    "server",
    None,
    decode.optional(decode.string),
  )
  decode.success(CertificateDownload(chain: chain, root: root, server: server))
}

pub fn certificate_download_encode(data: CertificateDownload) {
  json.object(
    [
      #("chain", json.nullable(data.chain, json.array(_, json.string))),
      #("root", json.nullable(data.root, json.string)),
      #("server", json.nullable(data.server, json.string))
    ],
  )
}

pub fn event_email_forward_create_decoder() {
  use email_forward <- decode.optional_field(
    "email_forward",
    None,
    decode.optional(email_forward_decoder()),
  )
  decode.success(EventEmailForwardCreate(email_forward: email_forward))
}

pub fn event_email_forward_create_encode(data: EventEmailForwardCreate) {
  json.object(
    [#("email_forward", json.nullable(data.email_forward, email_forward_encode))],
  )
}

pub fn billing_settings_decoder() {
  decode.success(BillingSettings)
}

pub fn billing_settings_encode(_data: BillingSettings) {
  json.object([])
}

pub fn event_dnsseccreate_decoder() {
  use dnssec <- decode.optional_field(
    "dnssec",
    None,
    decode.optional(dnssec_decoder()),
  )
  decode.success(EventDnsseccreate(dnssec: dnssec))
}

pub fn event_dnsseccreate_encode(data: EventDnsseccreate) {
  json.object([#("dnssec", json.nullable(data.dnssec, dnssec_encode))])
}

pub fn event_oauth_application_delete_decoder() {
  use oauth_application <- decode.optional_field(
    "oauth_application",
    None,
    decode.optional(oauth_application_decoder()),
  )
  decode.success(
    EventOauthApplicationDelete(oauth_application: oauth_application),
  )
}

pub fn event_oauth_application_delete_encode(data: EventOauthApplicationDelete) {
  json.object(
    [
      #(
        "oauth_application",
        json.nullable(data.oauth_application, oauth_application_encode),
      )
    ],
  )
}

pub fn event_domain_resolution_disable_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  decode.success(EventDomainResolutionDisable(domain: domain))
}

pub fn event_domain_resolution_disable_encode(data: EventDomainResolutionDisable) {
  json.object([#("domain", json.nullable(data.domain, domain_encode))])
}

pub fn domain_registration_decoder() {
  use period <- decode.optional_field(
    "period",
    None,
    decode.optional(decode.int),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use registrant_id <- decode.optional_field(
    "registrant_id",
    None,
    decode.optional(decode.int),
  )
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use whois_privacy <- decode.optional_field(
    "whois_privacy",
    None,
    decode.optional(decode.bool),
  )
  use domain_id <- decode.optional_field(
    "domain_id",
    None,
    decode.optional(decode.int),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  use auto_renew <- decode.optional_field(
    "auto_renew",
    None,
    decode.optional(decode.bool),
  )
  decode.success(
    DomainRegistration(
      period: period,
      created_at: created_at,
      registrant_id: registrant_id,
      state: state,
      whois_privacy: whois_privacy,
      domain_id: domain_id,
      updated_at: updated_at,
      id: id,
      auto_renew: auto_renew,
    ),
  )
}

pub fn domain_registration_encode(data: DomainRegistration) {
  json.object(
    [
      #("period", json.nullable(data.period, json.int)),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("registrant_id", json.nullable(data.registrant_id, json.int)),
      #("state", json.nullable(data.state, json.string)),
      #("whois_privacy", json.nullable(data.whois_privacy, json.bool)),
      #("domain_id", json.nullable(data.domain_id, json.int)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int)),
      #("auto_renew", json.nullable(data.auto_renew, json.bool))
    ],
  )
}

pub fn zone_record_decoder() {
  use system_record <- decode.optional_field(
    "system_record",
    None,
    decode.optional(decode.bool),
  )
  use priority <- decode.optional_field(
    "priority",
    None,
    decode.optional(decode.int),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use ttl <- decode.optional_field("ttl", None, decode.optional(ttl_decoder()))
  use zone_id <- decode.optional_field(
    "zone_id",
    None,
    decode.optional(decode.string),
  )
  use parent_id <- decode.optional_field(
    "parent_id",
    None,
    decode.optional(decode.int),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use content <- decode.optional_field(
    "content",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(zone_record_type_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  use regions <- decode.optional_field(
    "regions",
    None,
    decode.optional(decode.list(zone_record_region_decoder())),
  )
  decode.success(
    ZoneRecord(
      system_record: system_record,
      priority: priority,
      created_at: created_at,
      name: name,
      ttl: ttl,
      zone_id: zone_id,
      parent_id: parent_id,
      updated_at: updated_at,
      content: content,
      type_: type_,
      id: id,
      regions: regions,
    ),
  )
}

pub fn zone_record_encode(data: ZoneRecord) {
  json.object(
    [
      #("system_record", json.nullable(data.system_record, json.bool)),
      #("priority", json.nullable(data.priority, json.int)),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("name", json.nullable(data.name, json.string)),
      #("ttl", json.nullable(data.ttl, ttl_encode)),
      #("zone_id", json.nullable(data.zone_id, json.string)),
      #("parent_id", json.nullable(data.parent_id, json.int)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("content", json.nullable(data.content, json.string)),
      #("type", json.nullable(data.type_, zone_record_type_encode)),
      #("id", json.nullable(data.id, json.int)),
      #(
        "regions",
        json.nullable(data.regions, json.array(_, zone_record_region_encode)),
      )
    ],
  )
}

pub fn event_template_update_decoder() {
  use template <- decode.optional_field(
    "template",
    None,
    decode.optional(template_decoder()),
  )
  decode.success(EventTemplateUpdate(template: template))
}

pub fn event_template_update_encode(data: EventTemplateUpdate) {
  json.object([#("template", json.nullable(data.template, template_encode))])
}

pub fn event_whois_privacy_enable_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  use whois_privacy <- decode.optional_field(
    "whois_privacy",
    None,
    decode.optional(whois_privacy_decoder()),
  )
  decode.success(
    EventWhoisPrivacyEnable(domain: domain, whois_privacy: whois_privacy),
  )
}

pub fn event_whois_privacy_enable_encode(data: EventWhoisPrivacyEnable) {
  json.object(
    [
      #("domain", json.nullable(data.domain, domain_encode)),
      #("whois_privacy", json.nullable(data.whois_privacy, whois_privacy_encode))
    ],
  )
}

pub fn event_certificate_remove_private_key_decoder() {
  use certificate <- decode.optional_field(
    "certificate",
    None,
    decode.optional(certificate_decoder()),
  )
  decode.success(EventCertificateRemovePrivateKey(certificate: certificate))
}

pub fn event_certificate_remove_private_key_encode(
  data: EventCertificateRemovePrivateKey,
) {
  json.object(
    [#("certificate", json.nullable(data.certificate, certificate_encode))],
  )
}

pub fn subscription_decoder() {
  use plan_name <- decode.optional_field(
    "plan_name",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  decode.success(
    Subscription(
      plan_name: plan_name,
      created_at: created_at,
      state: state,
      updated_at: updated_at,
      id: id,
    ),
  )
}

pub fn subscription_encode(data: Subscription) {
  json.object(
    [
      #("plan_name", json.nullable(data.plan_name, json.string)),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("state", json.nullable(data.state, json.string)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int))
    ],
  )
}

pub fn event_domain_auto_renewal_disable_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  decode.success(EventDomainAutoRenewalDisable(domain: domain))
}

pub fn event_domain_auto_renewal_disable_encode(
  data: EventDomainAutoRenewalDisable,
) {
  json.object([#("domain", json.nullable(data.domain, domain_encode))])
}

pub fn event_oauth_application_update_decoder() {
  use oauth_application <- decode.optional_field(
    "oauth_application",
    None,
    decode.optional(oauth_application_decoder()),
  )
  decode.success(
    EventOauthApplicationUpdate(oauth_application: oauth_application),
  )
}

pub fn event_oauth_application_update_encode(data: EventOauthApplicationUpdate) {
  json.object(
    [
      #(
        "oauth_application",
        json.nullable(data.oauth_application, oauth_application_encode),
      )
    ],
  )
}

pub fn event_push_accept_decoder() {
  use push <- decode.optional_field(
    "push",
    None,
    decode.optional(push_decoder()),
  )
  decode.success(EventPushAccept(push: push))
}

pub fn event_push_accept_encode(data: EventPushAccept) {
  json.object([#("push", json.nullable(data.push, push_encode))])
}

pub fn nullable_date_time_decoder() {
  decode.string
}

pub fn nullable_date_time_encode(data: NullableDateTime) {
  json.string(data)
}

pub fn event_certificate_auto_renewal_disable_decoder() {
  use certificate <- decode.optional_field(
    "certificate",
    None,
    decode.optional(certificate_decoder()),
  )
  decode.success(EventCertificateAutoRenewalDisable(certificate: certificate))
}

pub fn event_certificate_auto_renewal_disable_encode(
  data: EventCertificateAutoRenewalDisable,
) {
  json.object(
    [#("certificate", json.nullable(data.certificate, certificate_encode))],
  )
}

pub fn event_account_update_decoder() {
  use account <- decode.optional_field(
    "account",
    None,
    decode.optional(account_decoder()),
  )
  decode.success(EventAccountUpdate(account: account))
}

pub fn event_account_update_encode(data: EventAccountUpdate) {
  json.object([#("account", json.nullable(data.account, account_encode))])
}

pub fn event_certificate_issue_decoder() {
  use certificate <- decode.optional_field(
    "certificate",
    None,
    decode.optional(certificate_decoder()),
  )
  decode.success(EventCertificateIssue(certificate: certificate))
}

pub fn event_certificate_issue_encode(data: EventCertificateIssue) {
  json.object(
    [#("certificate", json.nullable(data.certificate, certificate_encode))],
  )
}

pub fn event_whois_privacy_purchase_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  use whois_privacy <- decode.optional_field(
    "whois_privacy",
    None,
    decode.optional(whois_privacy_decoder()),
  )
  decode.success(
    EventWhoisPrivacyPurchase(domain: domain, whois_privacy: whois_privacy),
  )
}

pub fn event_whois_privacy_purchase_encode(data: EventWhoisPrivacyPurchase) {
  json.object(
    [
      #("domain", json.nullable(data.domain, domain_encode)),
      #("whois_privacy", json.nullable(data.whois_privacy, whois_privacy_encode))
    ],
  )
}

pub fn date_time_decoder() {
  decode.string
}

pub fn date_time_encode(data: DateTime) {
  json.string(data)
}

pub fn service_setting_decoder() {
  use example <- decode.optional_field(
    "example",
    None,
    decode.optional(decode.string),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use label <- decode.optional_field(
    "label",
    None,
    decode.optional(decode.string),
  )
  use append <- decode.optional_field(
    "append",
    None,
    decode.optional(decode.string),
  )
  use password <- decode.optional_field(
    "password",
    None,
    decode.optional(decode.bool),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ServiceSetting(
      example: example,
      name: name,
      label: label,
      append: append,
      password: password,
      description: description,
    ),
  )
}

pub fn service_setting_encode(data: ServiceSetting) {
  json.object(
    [
      #("example", json.nullable(data.example, json.string)),
      #("name", json.nullable(data.name, json.string)),
      #("label", json.nullable(data.label, json.string)),
      #("append", json.nullable(data.append, json.string)),
      #("password", json.nullable(data.password, json.bool)),
      #("description", json.nullable(data.description, json.string))
    ],
  )
}

pub fn registrant_change_decoder() {
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use irt_lock_lifted_by <- decode.optional_field(
    "irt_lock_lifted_by",
    None,
    decode.optional(date_decoder()),
  )
  use account_id <- decode.optional_field(
    "account_id",
    None,
    decode.optional(decode.int),
  )
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use domain_id <- decode.optional_field(
    "domain_id",
    None,
    decode.optional(decode.int),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use contact_id <- decode.optional_field(
    "contact_id",
    None,
    decode.optional(decode.int),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  use extended_attributes <- decode.optional_field(
    "extended_attributes",
    None,
    decode.optional(trade_extended_attributes_decoder()),
  )
  use registry_owner_change <- decode.optional_field(
    "registry_owner_change",
    None,
    decode.optional(decode.bool),
  )
  decode.success(
    RegistrantChange(
      created_at: created_at,
      irt_lock_lifted_by: irt_lock_lifted_by,
      account_id: account_id,
      state: state,
      domain_id: domain_id,
      updated_at: updated_at,
      contact_id: contact_id,
      id: id,
      extended_attributes: extended_attributes,
      registry_owner_change: registry_owner_change,
    ),
  )
}

pub fn registrant_change_encode(data: RegistrantChange) {
  json.object(
    [
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #(
        "irt_lock_lifted_by",
        json.nullable(data.irt_lock_lifted_by, date_encode),
      ),
      #("account_id", json.nullable(data.account_id, json.int)),
      #("state", json.nullable(data.state, json.string)),
      #("domain_id", json.nullable(data.domain_id, json.int)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("contact_id", json.nullable(data.contact_id, json.int)),
      #("id", json.nullable(data.id, json.int)),
      #(
        "extended_attributes",
        json.nullable(data.extended_attributes, trade_extended_attributes_encode),
      ),
      #(
        "registry_owner_change",
        json.nullable(data.registry_owner_change, json.bool),
      )
    ],
  )
}

pub fn pagination_decoder() {
  use total_pages <- decode.optional_field(
    "total_pages",
    None,
    decode.optional(decode.int),
  )
  use per_page <- decode.optional_field(
    "per_page",
    None,
    decode.optional(decode.int),
  )
  use current_page <- decode.optional_field(
    "current_page",
    None,
    decode.optional(decode.int),
  )
  use total_entries <- decode.optional_field(
    "total_entries",
    None,
    decode.optional(decode.int),
  )
  decode.success(
    Pagination(
      total_pages: total_pages,
      per_page: per_page,
      current_page: current_page,
      total_entries: total_entries,
    ),
  )
}

pub fn pagination_encode(data: Pagination) {
  json.object(
    [
      #("total_pages", json.nullable(data.total_pages, json.int)),
      #("per_page", json.nullable(data.per_page, json.int)),
      #("current_page", json.nullable(data.current_page, json.int)),
      #("total_entries", json.nullable(data.total_entries, json.int))
    ],
  )
}

pub fn push_decoder() {
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use accepted_at <- decode.optional_field(
    "accepted_at",
    None,
    decode.optional(nullable_date_time_decoder()),
  )
  use account_id <- decode.optional_field(
    "account_id",
    None,
    decode.optional(decode.int),
  )
  use domain_id <- decode.optional_field(
    "domain_id",
    None,
    decode.optional(decode.int),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use contact_id <- decode.optional_field(
    "contact_id",
    None,
    decode.optional(decode.int),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  decode.success(
    Push(
      created_at: created_at,
      accepted_at: accepted_at,
      account_id: account_id,
      domain_id: domain_id,
      updated_at: updated_at,
      contact_id: contact_id,
      id: id,
    ),
  )
}

pub fn push_encode(data: Push) {
  json.object(
    [
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #(
        "accepted_at",
        json.nullable(data.accepted_at, nullable_date_time_encode),
      ),
      #("account_id", json.nullable(data.account_id, json.int)),
      #("domain_id", json.nullable(data.domain_id, json.int)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("contact_id", json.nullable(data.contact_id, json.int)),
      #("id", json.nullable(data.id, json.int))
    ],
  )
}

pub fn domain_transfer_lock_decoder() {
  use enabled <- decode.optional_field(
    "enabled",
    None,
    decode.optional(decode.bool),
  )
  decode.success(DomainTransferLock(enabled: enabled))
}

pub fn domain_transfer_lock_encode(data: DomainTransferLock) {
  json.object([#("enabled", json.nullable(data.enabled, json.bool))])
}

pub fn event_template_apply_decoder() {
  use zone <- decode.optional_field(
    "zone",
    None,
    decode.optional(zone_decoder()),
  )
  use template <- decode.optional_field(
    "template",
    None,
    decode.optional(template_decoder()),
  )
  decode.success(EventTemplateApply(zone: zone, template: template))
}

pub fn event_template_apply_encode(data: EventTemplateApply) {
  json.object(
    [
      #("zone", json.nullable(data.zone, zone_encode)),
      #("template", json.nullable(data.template, template_encode))
    ],
  )
}

pub fn event_domain_create_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  decode.success(EventDomainCreate(domain: domain))
}

pub fn event_domain_create_encode(data: EventDomainCreate) {
  json.object([#("domain", json.nullable(data.domain, domain_encode))])
}

pub fn event_subscription_unsubscribe_decoder() {
  use subscription <- decode.optional_field(
    "subscription",
    None,
    decode.optional(subscription_decoder()),
  )
  decode.success(EventSubscriptionUnsubscribe(subscription: subscription))
}

pub fn event_subscription_unsubscribe_encode(data: EventSubscriptionUnsubscribe) {
  json.object(
    [#("subscription", json.nullable(data.subscription, subscription_encode))],
  )
}

pub fn event_secondary_dnsdelete_decoder() {
  use configuration <- decode.optional_field(
    "configuration",
    None,
    decode.optional(secondary_dns_decoder()),
  )
  decode.success(EventSecondaryDnsdelete(configuration: configuration))
}

pub fn event_secondary_dnsdelete_encode(data: EventSecondaryDnsdelete) {
  json.object(
    [#("configuration", json.nullable(data.configuration, secondary_dns_encode))],
  )
}

pub fn template_decoder() {
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use account_id <- decode.optional_field(
    "account_id",
    None,
    decode.optional(decode.int),
  )
  use sid <- decode.optional_field("sid", None, decode.optional(decode.string))
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    Template(
      created_at: created_at,
      name: name,
      account_id: account_id,
      sid: sid,
      updated_at: updated_at,
      id: id,
      description: description,
    ),
  )
}

pub fn template_encode(data: Template) {
  json.object(
    [
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("name", json.nullable(data.name, json.string)),
      #("account_id", json.nullable(data.account_id, json.int)),
      #("sid", json.nullable(data.sid, json.string)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int)),
      #("description", json.nullable(data.description, json.string))
    ],
  )
}

pub fn vanity_name_server_decoder() {
  use ipv4 <- decode.optional_field("ipv4", None, decode.optional(decode.string))
  use ipv6 <- decode.optional_field("ipv6", None, decode.optional(decode.string))
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  decode.success(
    VanityNameServer(
      ipv4: ipv4,
      ipv6: ipv6,
      created_at: created_at,
      name: name,
      updated_at: updated_at,
      id: id,
    ),
  )
}

pub fn vanity_name_server_encode(data: VanityNameServer) {
  json.object(
    [
      #("ipv4", json.nullable(data.ipv4, json.string)),
      #("ipv6", json.nullable(data.ipv6, json.string)),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("name", json.nullable(data.name, json.string)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int))
    ],
  )
}

pub fn oauth_application_decoder() {
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use homepage_url <- decode.optional_field(
    "homepage_url",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    OauthApplication(
      created_at: created_at,
      name: name,
      updated_at: updated_at,
      id: id,
      description: description,
      homepage_url: homepage_url,
    ),
  )
}

pub fn oauth_application_encode(data: OauthApplication) {
  json.object(
    [
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("name", json.nullable(data.name, json.string)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int)),
      #("description", json.nullable(data.description, json.string)),
      #("homepage_url", json.nullable(data.homepage_url, json.string))
    ],
  )
}

pub fn event_account_add_user_decoder() {
  use user <- decode.optional_field(
    "user",
    None,
    decode.optional(user_decoder()),
  )
  use account <- decode.optional_field(
    "account",
    None,
    decode.optional(account_decoder()),
  )
  decode.success(EventAccountAddUser(user: user, account: account))
}

pub fn event_account_add_user_encode(data: EventAccountAddUser) {
  json.object(
    [
      #("user", json.nullable(data.user, user_encode)),
      #("account", json.nullable(data.account, account_encode))
    ],
  )
}

pub fn event_webhook_create_decoder() {
  use webhook <- decode.optional_field(
    "webhook",
    None,
    decode.optional(webhook_decoder()),
  )
  decode.success(EventWebhookCreate(webhook: webhook))
}

pub fn event_webhook_create_encode(data: EventWebhookCreate) {
  json.object([#("webhook", json.nullable(data.webhook, webhook_encode))])
}

pub fn event_dnssecrotation_complete_decoder() {
  use dnssec <- decode.optional_field(
    "dnssec",
    None,
    decode.optional(dnssec_decoder()),
  )
  use delegation_signer_record <- decode.optional_field(
    "delegation_signer_record",
    None,
    decode.optional(delegation_signer_decoder()),
  )
  decode.success(
    EventDnssecrotationComplete(
      dnssec: dnssec,
      delegation_signer_record: delegation_signer_record,
    ),
  )
}

pub fn event_dnssecrotation_complete_encode(data: EventDnssecrotationComplete) {
  json.object(
    [
      #("dnssec", json.nullable(data.dnssec, dnssec_encode)),
      #(
        "delegation_signer_record",
        json.nullable(data.delegation_signer_record, delegation_signer_encode),
      )
    ],
  )
}

pub fn event_domain_registrant_change_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  use registrant <- decode.optional_field(
    "registrant",
    None,
    decode.optional(contact_decoder()),
  )
  decode.success(
    EventDomainRegistrantChange(domain: domain, registrant: registrant),
  )
}

pub fn event_domain_registrant_change_encode(data: EventDomainRegistrantChange) {
  json.object(
    [
      #("domain", json.nullable(data.domain, domain_encode)),
      #("registrant", json.nullable(data.registrant, contact_encode))
    ],
  )
}

pub fn extended_attribute_option_decoder() {
  use value <- decode.optional_field(
    "value",
    None,
    decode.optional(decode.string),
  )
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ExtendedAttributeOption(value: value, title: title, description: description),
  )
}

pub fn extended_attribute_option_encode(data: ExtendedAttributeOption) {
  json.object(
    [
      #("value", json.nullable(data.value, json.string)),
      #("title", json.nullable(data.title, json.string)),
      #("description", json.nullable(data.description, json.string))
    ],
  )
}

pub fn event_domain_transfer_started_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  decode.success(EventDomainTransferStarted(domain: domain))
}

pub fn event_domain_transfer_started_encode(data: EventDomainTransferStarted) {
  json.object([#("domain", json.nullable(data.domain, domain_encode))])
}

pub fn whois_privacy_renewal_decoder() {
  use enabled <- decode.optional_field(
    "enabled",
    None,
    decode.optional(decode.bool),
  )
  use whois_privacy_id <- decode.optional_field(
    "whois_privacy_id",
    None,
    decode.optional(decode.int),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use expires_on <- decode.optional_field(
    "expires_on",
    None,
    decode.optional(date_decoder()),
  )
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use domain_id <- decode.optional_field(
    "domain_id",
    None,
    decode.optional(decode.int),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  decode.success(
    WhoisPrivacyRenewal(
      enabled: enabled,
      whois_privacy_id: whois_privacy_id,
      created_at: created_at,
      expires_on: expires_on,
      state: state,
      domain_id: domain_id,
      updated_at: updated_at,
      id: id,
    ),
  )
}

pub fn whois_privacy_renewal_encode(data: WhoisPrivacyRenewal) {
  json.object(
    [
      #("enabled", json.nullable(data.enabled, json.bool)),
      #("whois_privacy_id", json.nullable(data.whois_privacy_id, json.int)),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("expires_on", json.nullable(data.expires_on, date_encode)),
      #("state", json.nullable(data.state, json.string)),
      #("domain_id", json.nullable(data.domain_id, json.int)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int))
    ],
  )
}

pub fn event_domain_registrant_change_cancelled_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  use registrant <- decode.optional_field(
    "registrant",
    None,
    decode.optional(contact_decoder()),
  )
  decode.success(
    EventDomainRegistrantChangeCancelled(domain: domain, registrant: registrant),
  )
}

pub fn event_domain_registrant_change_cancelled_encode(
  data: EventDomainRegistrantChangeCancelled,
) {
  json.object(
    [
      #("domain", json.nullable(data.domain, domain_encode)),
      #("registrant", json.nullable(data.registrant, contact_encode))
    ],
  )
}

pub fn event_secondary_dnsupdate_decoder() {
  use configuration <- decode.optional_field(
    "configuration",
    None,
    decode.optional(secondary_dns_decoder()),
  )
  decode.success(EventSecondaryDnsupdate(configuration: configuration))
}

pub fn event_secondary_dnsupdate_encode(data: EventSecondaryDnsupdate) {
  json.object(
    [#("configuration", json.nullable(data.configuration, secondary_dns_encode))],
  )
}

pub fn event_account_payment_details_update_decoder() {
  use account <- decode.optional_field(
    "account",
    None,
    decode.optional(account_decoder()),
  )
  decode.success(EventAccountPaymentDetailsUpdate(account: account))
}

pub fn event_account_payment_details_update_encode(
  data: EventAccountPaymentDetailsUpdate,
) {
  json.object([#("account", json.nullable(data.account, account_encode))])
}

pub fn event_oauth_application_revoke_access_tokens_decoder() {
  use oauth_application <- decode.optional_field(
    "oauth_application",
    None,
    decode.optional(oauth_application_decoder()),
  )
  decode.success(
    EventOauthApplicationRevokeAccessTokens(oauth_application: oauth_application),
  )
}

pub fn event_oauth_application_revoke_access_tokens_encode(
  data: EventOauthApplicationRevokeAccessTokens,
) {
  json.object(
    [
      #(
        "oauth_application",
        json.nullable(data.oauth_application, oauth_application_encode),
      )
    ],
  )
}

pub fn webhook_payload_decoder() {
  use data <- decode.optional_field(
    "data",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use account <- decode.optional_field(
    "account",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use api_version <- decode.optional_field(
    "api_version",
    None,
    decode.optional(decode.string),
  )
  use actor <- decode.optional_field(
    "actor",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  use request_identifier <- decode.optional_field(
    "request_identifier",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    WebhookPayload(
      data: data,
      name: name,
      account: account,
      api_version: api_version,
      actor: actor,
      request_identifier: request_identifier,
    ),
  )
}

pub fn webhook_payload_encode(data: WebhookPayload) {
  json.object(
    [
      #(
        "data",
        json.nullable(data.data, fn(_) { panic as "AnyOf inside field" }),
      ),
      #("name", json.nullable(data.name, json.string)),
      #(
        "account",
        json.nullable(data.account, fn(_) { panic as "AllOf inside field" }),
      ),
      #("api_version", json.nullable(data.api_version, json.string)),
      #(
        "actor",
        json.nullable(data.actor, fn(_) { panic as "AllOf inside field" }),
      ),
      #(
        "request_identifier",
        json.nullable(data.request_identifier, json.string),
      )
    ],
  )
}

pub fn event_invoice_collect_decoder() {
  use invoice <- decode.optional_field(
    "invoice",
    None,
    decode.optional(invoice_decoder()),
  )
  decode.success(EventInvoiceCollect(invoice: invoice))
}

pub fn event_invoice_collect_encode(data: EventInvoiceCollect) {
  json.object([#("invoice", json.nullable(data.invoice, invoice_encode))])
}

pub fn webhook_decoder() {
  use url <- decode.optional_field("url", None, decode.optional(decode.string))
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  use suppressed_at <- decode.optional_field(
    "suppressed_at",
    None,
    decode.optional(date_time_decoder()),
  )
  decode.success(Webhook(url: url, id: id, suppressed_at: suppressed_at))
}

pub fn webhook_encode(data: Webhook) {
  json.object(
    [
      #("url", json.nullable(data.url, json.string)),
      #("id", json.nullable(data.id, json.int)),
      #("suppressed_at", json.nullable(data.suppressed_at, date_time_encode))
    ],
  )
}

pub fn certificate_decoder() {
  use csr <- decode.optional_field("csr", None, decode.optional(decode.string))
  use alternate_names <- decode.optional_field(
    "alternate_names",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use authority_identifier <- decode.optional_field(
    "authority_identifier",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use expires_on <- decode.optional_field(
    "expires_on",
    None,
    decode.optional(date_decoder()),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use domain_id <- decode.optional_field(
    "domain_id",
    None,
    decode.optional(decode.int),
  )
  use years <- decode.optional_field("years", None, decode.optional(decode.int))
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use contact_id <- decode.optional_field(
    "contact_id",
    None,
    decode.optional(decode.int),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  use auto_renew <- decode.optional_field(
    "auto_renew",
    None,
    decode.optional(decode.bool),
  )
  use expires_at <- decode.optional_field(
    "expires_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use common_name <- decode.optional_field(
    "common_name",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    Certificate(
      csr: csr,
      alternate_names: alternate_names,
      authority_identifier: authority_identifier,
      created_at: created_at,
      expires_on: expires_on,
      name: name,
      state: state,
      domain_id: domain_id,
      years: years,
      updated_at: updated_at,
      contact_id: contact_id,
      id: id,
      auto_renew: auto_renew,
      expires_at: expires_at,
      common_name: common_name,
    ),
  )
}

pub fn certificate_encode(data: Certificate) {
  json.object(
    [
      #("csr", json.nullable(data.csr, json.string)),
      #(
        "alternate_names",
        json.nullable(data.alternate_names, json.array(_, json.string)),
      ),
      #(
        "authority_identifier",
        json.nullable(data.authority_identifier, json.string),
      ),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("expires_on", json.nullable(data.expires_on, date_encode)),
      #("name", json.nullable(data.name, json.string)),
      #("state", json.nullable(data.state, json.string)),
      #("domain_id", json.nullable(data.domain_id, json.int)),
      #("years", json.nullable(data.years, json.int)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("contact_id", json.nullable(data.contact_id, json.int)),
      #("id", json.nullable(data.id, json.int)),
      #("auto_renew", json.nullable(data.auto_renew, json.bool)),
      #("expires_at", json.nullable(data.expires_at, date_time_encode)),
      #("common_name", json.nullable(data.common_name, json.string))
    ],
  )
}

pub fn event_domain_transfer_lock_enable_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  decode.success(EventDomainTransferLockEnable(domain: domain))
}

pub fn event_domain_transfer_lock_enable_encode(
  data: EventDomainTransferLockEnable,
) {
  json.object([#("domain", json.nullable(data.domain, domain_encode))])
}

pub fn event_oauth_application_reset_client_secret_decoder() {
  use oauth_application <- decode.optional_field(
    "oauth_application",
    None,
    decode.optional(oauth_application_decoder()),
  )
  decode.success(
    EventOauthApplicationResetClientSecret(oauth_application: oauth_application),
  )
}

pub fn event_oauth_application_reset_client_secret_encode(
  data: EventOauthApplicationResetClientSecret,
) {
  json.object(
    [
      #(
        "oauth_application",
        json.nullable(data.oauth_application, oauth_application_encode),
      )
    ],
  )
}

pub fn zone_record_type_decoder() {
  decode.string
}

pub fn zone_record_type_encode(data: ZoneRecordType) {
  json.string(data)
}

pub fn webhook_account_decoder() {
  use display <- decode.optional_field(
    "display",
    None,
    decode.optional(decode.string),
  )
  use identifier <- decode.optional_field(
    "identifier",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  decode.success(
    WebhookAccount(display: display, identifier: identifier, id: id),
  )
}

pub fn webhook_account_encode(data: WebhookAccount) {
  json.object(
    [
      #("display", json.nullable(data.display, json.string)),
      #("identifier", json.nullable(data.identifier, json.string)),
      #("id", json.nullable(data.id, json.int))
    ],
  )
}

pub fn event_domain_delegation_change_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  use name_servers <- decode.optional_field(
    "name_servers",
    None,
    decode.optional(decode.list(name_server_decoder())),
  )
  decode.success(
    EventDomainDelegationChange(domain: domain, name_servers: name_servers),
  )
}

pub fn event_domain_delegation_change_encode(data: EventDomainDelegationChange) {
  json.object(
    [
      #("domain", json.nullable(data.domain, domain_encode)),
      #(
        "name_servers",
        json.nullable(data.name_servers, json.array(_, name_server_encode)),
      )
    ],
  )
}

pub fn event_record_delete_decoder() {
  use zone_record <- decode.optional_field(
    "zone_record",
    None,
    decode.optional(zone_record_decoder()),
  )
  decode.success(EventRecordDelete(zone_record: zone_record))
}

pub fn event_record_delete_encode(data: EventRecordDelete) {
  json.object(
    [#("zone_record", json.nullable(data.zone_record, zone_record_encode))],
  )
}

pub fn domain_premium_price_decoder() {
  use premium_price <- decode.optional_field(
    "premium_price",
    None,
    decode.optional(decode.string),
  )
  use action <- decode.optional_field(
    "action",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    DomainPremiumPrice(premium_price: premium_price, action: action),
  )
}

pub fn domain_premium_price_encode(data: DomainPremiumPrice) {
  json.object(
    [
      #("premium_price", json.nullable(data.premium_price, json.string)),
      #("action", json.nullable(data.action, json.string))
    ],
  )
}

pub fn event_subscription_renew_decoder() {
  use subscription <- decode.optional_field(
    "subscription",
    None,
    decode.optional(subscription_decoder()),
  )
  decode.success(EventSubscriptionRenew(subscription: subscription))
}

pub fn event_subscription_renew_encode(data: EventSubscriptionRenew) {
  json.object(
    [#("subscription", json.nullable(data.subscription, subscription_encode))],
  )
}

pub fn secondary_dns_decoder() {
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use zone_id <- decode.optional_field(
    "zone_id",
    None,
    decode.optional(decode.string),
  )
  use whitelisted_ips <- decode.optional_field(
    "whitelisted_ips",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  use name_servers <- decode.optional_field(
    "name_servers",
    None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(
    SecondaryDns(
      created_at: created_at,
      zone_id: zone_id,
      whitelisted_ips: whitelisted_ips,
      updated_at: updated_at,
      id: id,
      name_servers: name_servers,
    ),
  )
}

pub fn secondary_dns_encode(data: SecondaryDns) {
  json.object(
    [
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("zone_id", json.nullable(data.zone_id, json.string)),
      #(
        "whitelisted_ips",
        json.nullable(data.whitelisted_ips, json.array(_, json.string)),
      ),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int)),
      #(
        "name_servers",
        json.nullable(data.name_servers, json.array(_, json.string)),
      )
    ],
  )
}

pub fn service_decoder() {
  use settings <- decode.optional_field(
    "settings",
    None,
    decode.optional(decode.list(service_setting_decoder())),
  )
  use default_subdomain <- decode.optional_field(
    "default_subdomain",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use requires_setup <- decode.optional_field(
    "requires_setup",
    None,
    decode.optional(decode.bool),
  )
  use sid <- decode.optional_field("sid", None, decode.optional(decode.string))
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use setup_description <- decode.optional_field(
    "setup_description",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    Service(
      settings: settings,
      default_subdomain: default_subdomain,
      created_at: created_at,
      name: name,
      requires_setup: requires_setup,
      sid: sid,
      updated_at: updated_at,
      setup_description: setup_description,
      id: id,
      description: description,
    ),
  )
}

pub fn service_encode(data: Service) {
  json.object(
    [
      #(
        "settings",
        json.nullable(data.settings, json.array(_, service_setting_encode)),
      ),
      #("default_subdomain", json.nullable(data.default_subdomain, json.string)),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("name", json.nullable(data.name, json.string)),
      #("requires_setup", json.nullable(data.requires_setup, json.bool)),
      #("sid", json.nullable(data.sid, json.string)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("setup_description", json.nullable(data.setup_description, json.string)),
      #("id", json.nullable(data.id, json.int)),
      #("description", json.nullable(data.description, json.string))
    ],
  )
}

pub fn actor_decoder() {
  use identifier <- decode.optional_field(
    "identifier",
    None,
    decode.optional(decode.string),
  )
  use pretty <- decode.optional_field(
    "pretty",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  decode.success(Actor(identifier: identifier, pretty: pretty, id: id))
}

pub fn actor_encode(data: Actor) {
  json.object(
    [
      #("identifier", json.nullable(data.identifier, json.string)),
      #("pretty", json.nullable(data.pretty, json.string)),
      #("id", json.nullable(data.id, json.int))
    ],
  )
}

pub fn trade_extended_attributes_decoder() {
  decode.success(TradeExtendedAttributes)
}

pub fn trade_extended_attributes_encode(_data: TradeExtendedAttributes) {
  json.object([])
}

pub fn charge_decoder() {
  use items <- decode.optional_field(
    "items",
    None,
    decode.optional(decode.list(charge_item_decoder())),
  )
  use reference <- decode.optional_field(
    "reference",
    None,
    decode.optional(decode.string),
  )
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use total_amount <- decode.optional_field(
    "total_amount",
    None,
    decode.optional(decode.string),
  )
  use invoiced_at <- decode.optional_field(
    "invoiced_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use balance_amount <- decode.optional_field(
    "balance_amount",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    Charge(
      items: items,
      reference: reference,
      state: state,
      total_amount: total_amount,
      invoiced_at: invoiced_at,
      balance_amount: balance_amount,
    ),
  )
}

pub fn charge_encode(data: Charge) {
  json.object(
    [
      #("items", json.nullable(data.items, json.array(_, charge_item_encode))),
      #("reference", json.nullable(data.reference, json.string)),
      #("state", json.nullable(data.state, json.string)),
      #("total_amount", json.nullable(data.total_amount, json.string)),
      #("invoiced_at", json.nullable(data.invoiced_at, date_time_encode)),
      #("balance_amount", json.nullable(data.balance_amount, json.string))
    ],
  )
}

pub fn event_account_invitation_accept_decoder() {
  use account_invitation <- decode.optional_field(
    "account_invitation",
    None,
    decode.optional(account_invitation_decoder()),
  )
  use account <- decode.optional_field(
    "account",
    None,
    decode.optional(account_decoder()),
  )
  decode.success(
    EventAccountInvitationAccept(
      account_invitation: account_invitation,
      account: account,
    ),
  )
}

pub fn event_account_invitation_accept_encode(data: EventAccountInvitationAccept) {
  json.object(
    [
      #(
        "account_invitation",
        json.nullable(data.account_invitation, account_invitation_encode),
      ),
      #("account", json.nullable(data.account, account_encode))
    ],
  )
}

pub fn domain_renewal_decoder() {
  use period <- decode.optional_field(
    "period",
    None,
    decode.optional(decode.int),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use domain_id <- decode.optional_field(
    "domain_id",
    None,
    decode.optional(decode.int),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  decode.success(
    DomainRenewal(
      period: period,
      created_at: created_at,
      state: state,
      domain_id: domain_id,
      updated_at: updated_at,
      id: id,
    ),
  )
}

pub fn domain_renewal_encode(data: DomainRenewal) {
  json.object(
    [
      #("period", json.nullable(data.period, json.int)),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("state", json.nullable(data.state, json.string)),
      #("domain_id", json.nullable(data.domain_id, json.int)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int))
    ],
  )
}

pub fn event_account_billing_settings_update_decoder() {
  use billing_settings <- decode.optional_field(
    "billing_settings",
    None,
    decode.optional(billing_settings_decoder()),
  )
  use account <- decode.optional_field(
    "account",
    None,
    decode.optional(account_decoder()),
  )
  decode.success(
    EventAccountBillingSettingsUpdate(
      billing_settings: billing_settings,
      account: account,
    ),
  )
}

pub fn event_account_billing_settings_update_encode(
  data: EventAccountBillingSettingsUpdate,
) {
  json.object(
    [
      #(
        "billing_settings",
        json.nullable(data.billing_settings, billing_settings_encode),
      ),
      #("account", json.nullable(data.account, account_encode))
    ],
  )
}

pub fn event_domain_transfer_lock_disable_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  decode.success(EventDomainTransferLockDisable(domain: domain))
}

pub fn event_domain_transfer_lock_disable_encode(
  data: EventDomainTransferLockDisable,
) {
  json.object([#("domain", json.nullable(data.domain, domain_encode))])
}

pub fn event_subscription_migrate_decoder() {
  use subscription <- decode.optional_field(
    "subscription",
    None,
    decode.optional(subscription_decoder()),
  )
  decode.success(EventSubscriptionMigrate(subscription: subscription))
}

pub fn event_subscription_migrate_encode(data: EventSubscriptionMigrate) {
  json.object(
    [#("subscription", json.nullable(data.subscription, subscription_encode))],
  )
}

pub fn event_record_update_decoder() {
  use zone_record <- decode.optional_field(
    "zone_record",
    None,
    decode.optional(zone_record_decoder()),
  )
  decode.success(EventRecordUpdate(zone_record: zone_record))
}

pub fn event_record_update_encode(data: EventRecordUpdate) {
  json.object(
    [#("zone_record", json.nullable(data.zone_record, zone_record_encode))],
  )
}

pub fn certificate_private_key_decoder() {
  use private_key <- decode.optional_field(
    "private_key",
    None,
    decode.optional(decode.string),
  )
  decode.success(CertificatePrivateKey(private_key: private_key))
}

pub fn certificate_private_key_encode(data: CertificatePrivateKey) {
  json.object([#("private_key", json.nullable(data.private_key, json.string))])
}

pub fn event_subscription_subscribe_decoder() {
  use subscription <- decode.optional_field(
    "subscription",
    None,
    decode.optional(subscription_decoder()),
  )
  decode.success(EventSubscriptionSubscribe(subscription: subscription))
}

pub fn event_subscription_subscribe_encode(data: EventSubscriptionSubscribe) {
  json.object(
    [#("subscription", json.nullable(data.subscription, subscription_encode))],
  )
}

pub fn event_whois_privacy_renew_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  use whois_privacy <- decode.optional_field(
    "whois_privacy",
    None,
    decode.optional(whois_privacy_decoder()),
  )
  decode.success(
    EventWhoisPrivacyRenew(domain: domain, whois_privacy: whois_privacy),
  )
}

pub fn event_whois_privacy_renew_encode(data: EventWhoisPrivacyRenew) {
  json.object(
    [
      #("domain", json.nullable(data.domain, domain_encode)),
      #("whois_privacy", json.nullable(data.whois_privacy, whois_privacy_encode))
    ],
  )
}

pub fn event_push_reject_decoder() {
  use push <- decode.optional_field(
    "push",
    None,
    decode.optional(push_decoder()),
  )
  decode.success(EventPushReject(push: push))
}

pub fn event_push_reject_encode(data: EventPushReject) {
  json.object([#("push", json.nullable(data.push, push_encode))])
}

pub fn delegation_signer_decoder() {
  use digest <- decode.optional_field(
    "digest",
    None,
    decode.optional(decode.string),
  )
  use public_key <- decode.optional_field(
    "public_key",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use algorithm <- decode.optional_field(
    "algorithm",
    None,
    decode.optional(decode.string),
  )
  use digest_type <- decode.optional_field(
    "digest_type",
    None,
    decode.optional(decode.string),
  )
  use domain_id <- decode.optional_field(
    "domain_id",
    None,
    decode.optional(decode.int),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use keytag <- decode.optional_field(
    "keytag",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  decode.success(
    DelegationSigner(
      digest: digest,
      public_key: public_key,
      created_at: created_at,
      algorithm: algorithm,
      digest_type: digest_type,
      domain_id: domain_id,
      updated_at: updated_at,
      keytag: keytag,
      id: id,
    ),
  )
}

pub fn delegation_signer_encode(data: DelegationSigner) {
  json.object(
    [
      #("digest", json.nullable(data.digest, json.string)),
      #("public_key", json.nullable(data.public_key, json.string)),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("algorithm", json.nullable(data.algorithm, json.string)),
      #("digest_type", json.nullable(data.digest_type, json.string)),
      #("domain_id", json.nullable(data.domain_id, json.int)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("keytag", json.nullable(data.keytag, json.string)),
      #("id", json.nullable(data.id, json.int))
    ],
  )
}

pub fn domain_name_server_decoder() {
  decode.string
}

pub fn domain_name_server_encode(data: DomainNameServer) {
  json.string(data)
}

pub fn event_domain_renew_started_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  use auto_ <- decode.optional_field("auto", None, decode.optional(decode.bool))
  decode.success(EventDomainRenewStarted(domain: domain, auto_: auto_))
}

pub fn event_domain_renew_started_encode(data: EventDomainRenewStarted) {
  json.object(
    [
      #("domain", json.nullable(data.domain, domain_encode)),
      #("auto", json.nullable(data.auto_, json.bool))
    ],
  )
}

pub fn event_zone_delete_decoder() {
  use zone <- decode.optional_field(
    "zone",
    None,
    decode.optional(zone_decoder()),
  )
  decode.success(EventZoneDelete(zone: zone))
}

pub fn event_zone_delete_encode(data: EventZoneDelete) {
  json.object([#("zone", json.nullable(data.zone, zone_encode))])
}

pub fn event_domain_restore_started_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  use auto_ <- decode.optional_field("auto", None, decode.optional(decode.bool))
  decode.success(EventDomainRestoreStarted(domain: domain, auto_: auto_))
}

pub fn event_domain_restore_started_encode(data: EventDomainRestoreStarted) {
  json.object(
    [
      #("domain", json.nullable(data.domain, domain_encode)),
      #("auto", json.nullable(data.auto_, json.bool))
    ],
  )
}

pub fn event_contact_delete_decoder() {
  use contact <- decode.optional_field(
    "contact",
    None,
    decode.optional(contact_decoder()),
  )
  decode.success(EventContactDelete(contact: contact))
}

pub fn event_contact_delete_encode(data: EventContactDelete) {
  json.object([#("contact", json.nullable(data.contact, contact_encode))])
}

pub fn zone_record_region_decoder() {
  decode.string
}

pub fn zone_record_region_encode(data: ZoneRecordRegion) {
  json.string(data)
}

pub fn event_template_create_decoder() {
  use template <- decode.optional_field(
    "template",
    None,
    decode.optional(template_decoder()),
  )
  decode.success(EventTemplateCreate(template: template))
}

pub fn event_template_create_encode(data: EventTemplateCreate) {
  json.object([#("template", json.nullable(data.template, template_encode))])
}

pub fn event_account_invitation_remove_decoder() {
  use account_invitation <- decode.optional_field(
    "account_invitation",
    None,
    decode.optional(account_invitation_decoder()),
  )
  use account <- decode.optional_field(
    "account",
    None,
    decode.optional(account_decoder()),
  )
  decode.success(
    EventAccountInvitationRemove(
      account_invitation: account_invitation,
      account: account,
    ),
  )
}

pub fn event_account_invitation_remove_encode(data: EventAccountInvitationRemove) {
  json.object(
    [
      #(
        "account_invitation",
        json.nullable(data.account_invitation, account_invitation_encode),
      ),
      #("account", json.nullable(data.account, account_encode))
    ],
  )
}

pub fn event_domain_register_cancelled_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  decode.success(EventDomainRegisterCancelled(domain: domain))
}

pub fn event_domain_register_cancelled_encode(data: EventDomainRegisterCancelled) {
  json.object([#("domain", json.nullable(data.domain, domain_encode))])
}

pub fn event_domain_restore_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  use auto_ <- decode.optional_field("auto", None, decode.optional(decode.bool))
  decode.success(EventDomainRestore(domain: domain, auto_: auto_))
}

pub fn event_domain_restore_encode(data: EventDomainRestore) {
  json.object(
    [
      #("domain", json.nullable(data.domain, domain_encode)),
      #("auto", json.nullable(data.auto_, json.bool))
    ],
  )
}

pub fn event_template_record_delete_decoder() {
  use template_record <- decode.optional_field(
    "template_record",
    None,
    decode.optional(template_record_decoder()),
  )
  decode.success(EventTemplateRecordDelete(template_record: template_record))
}

pub fn event_template_record_delete_encode(data: EventTemplateRecordDelete) {
  json.object(
    [
      #(
        "template_record",
        json.nullable(data.template_record, template_record_encode),
      )
    ],
  )
}

pub fn zone_distribution_decoder() {
  use distributed <- decode.optional_field(
    "distributed",
    None,
    decode.optional(decode.bool),
  )
  decode.success(ZoneDistribution(distributed: distributed))
}

pub fn zone_distribution_encode(data: ZoneDistribution) {
  json.object([#("distributed", json.nullable(data.distributed, json.bool))])
}

pub fn event_oauth_application_create_decoder() {
  use oauth_application <- decode.optional_field(
    "oauth_application",
    None,
    decode.optional(oauth_application_decoder()),
  )
  decode.success(
    EventOauthApplicationCreate(oauth_application: oauth_application),
  )
}

pub fn event_oauth_application_create_encode(data: EventOauthApplicationCreate) {
  json.object(
    [
      #(
        "oauth_application",
        json.nullable(data.oauth_application, oauth_application_encode),
      )
    ],
  )
}

pub fn nullable_date_decoder() {
  decode.string
}

pub fn nullable_date_encode(data: NullableDate) {
  json.string(data)
}

pub fn event_domain_renew_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  use auto_ <- decode.optional_field("auto", None, decode.optional(decode.bool))
  decode.success(EventDomainRenew(domain: domain, auto_: auto_))
}

pub fn event_domain_renew_encode(data: EventDomainRenew) {
  json.object(
    [
      #("domain", json.nullable(data.domain, domain_encode)),
      #("auto", json.nullable(data.auto_, json.bool))
    ],
  )
}

pub fn domain_transfer_decoder() {
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use registrant_id <- decode.optional_field(
    "registrant_id",
    None,
    decode.optional(decode.int),
  )
  use status_description <- decode.optional_field(
    "status_description",
    None,
    decode.optional(decode.string),
  )
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use whois_privacy <- decode.optional_field(
    "whois_privacy",
    None,
    decode.optional(decode.bool),
  )
  use domain_id <- decode.optional_field(
    "domain_id",
    None,
    decode.optional(decode.int),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  use auto_renew <- decode.optional_field(
    "auto_renew",
    None,
    decode.optional(decode.bool),
  )
  decode.success(
    DomainTransfer(
      created_at: created_at,
      registrant_id: registrant_id,
      status_description: status_description,
      state: state,
      whois_privacy: whois_privacy,
      domain_id: domain_id,
      updated_at: updated_at,
      id: id,
      auto_renew: auto_renew,
    ),
  )
}

pub fn domain_transfer_encode(data: DomainTransfer) {
  json.object(
    [
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("registrant_id", json.nullable(data.registrant_id, json.int)),
      #(
        "status_description",
        json.nullable(data.status_description, json.string),
      ),
      #("state", json.nullable(data.state, json.string)),
      #("whois_privacy", json.nullable(data.whois_privacy, json.bool)),
      #("domain_id", json.nullable(data.domain_id, json.int)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int)),
      #("auto_renew", json.nullable(data.auto_renew, json.bool))
    ],
  )
}

pub fn event_contact_update_decoder() {
  use contact <- decode.optional_field(
    "contact",
    None,
    decode.optional(contact_decoder()),
  )
  decode.success(EventContactUpdate(contact: contact))
}

pub fn event_contact_update_encode(data: EventContactUpdate) {
  json.object([#("contact", json.nullable(data.contact, contact_encode))])
}

pub fn event_certificate_auto_renewal_enable_decoder() {
  use certificate <- decode.optional_field(
    "certificate",
    None,
    decode.optional(certificate_decoder()),
  )
  decode.success(EventCertificateAutoRenewalEnable(certificate: certificate))
}

pub fn event_certificate_auto_renewal_enable_encode(
  data: EventCertificateAutoRenewalEnable,
) {
  json.object(
    [#("certificate", json.nullable(data.certificate, certificate_encode))],
  )
}

pub fn date_decoder() {
  decode.string
}

pub fn date_encode(data: Date) {
  json.string(data)
}

pub fn event_email_forward_delete_decoder() {
  use email_forward <- decode.optional_field(
    "email_forward",
    None,
    decode.optional(email_forward_decoder()),
  )
  decode.success(EventEmailForwardDelete(email_forward: email_forward))
}

pub fn event_email_forward_delete_encode(data: EventEmailForwardDelete) {
  json.object(
    [#("email_forward", json.nullable(data.email_forward, email_forward_encode))],
  )
}

pub fn domain_prices_decoder() {
  use renewal_price <- decode.optional_field(
    "renewal_price",
    None,
    decode.optional(decode.float),
  )
  use registration_price <- decode.optional_field(
    "registration_price",
    None,
    decode.optional(decode.float),
  )
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(decode.string),
  )
  use transfer_price <- decode.optional_field(
    "transfer_price",
    None,
    decode.optional(decode.float),
  )
  use premium <- decode.optional_field(
    "premium",
    None,
    decode.optional(decode.bool),
  )
  use restore_price <- decode.optional_field(
    "restore_price",
    None,
    decode.optional(decode.float),
  )
  decode.success(
    DomainPrices(
      renewal_price: renewal_price,
      registration_price: registration_price,
      domain: domain,
      transfer_price: transfer_price,
      premium: premium,
      restore_price: restore_price,
    ),
  )
}

pub fn domain_prices_encode(data: DomainPrices) {
  json.object(
    [
      #("renewal_price", json.nullable(data.renewal_price, json.float)),
      #("registration_price", json.nullable(data.registration_price, json.float)),
      #("domain", json.nullable(data.domain, json.string)),
      #("transfer_price", json.nullable(data.transfer_price, json.float)),
      #("premium", json.nullable(data.premium, json.bool)),
      #("restore_price", json.nullable(data.restore_price, json.float))
    ],
  )
}

pub fn letsencrypt_certificate_renewal_decoder() {
  use new_certificate_id <- decode.optional_field(
    "new_certificate_id",
    None,
    decode.optional(decode.int),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  use old_certificate_id <- decode.optional_field(
    "old_certificate_id",
    None,
    decode.optional(decode.int),
  )
  use auto_renew <- decode.optional_field(
    "auto_renew",
    None,
    decode.optional(decode.bool),
  )
  decode.success(
    LetsencryptCertificateRenewal(
      new_certificate_id: new_certificate_id,
      created_at: created_at,
      state: state,
      updated_at: updated_at,
      id: id,
      old_certificate_id: old_certificate_id,
      auto_renew: auto_renew,
    ),
  )
}

pub fn letsencrypt_certificate_renewal_encode(
  data: LetsencryptCertificateRenewal,
) {
  json.object(
    [
      #("new_certificate_id", json.nullable(data.new_certificate_id, json.int)),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("state", json.nullable(data.state, json.string)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int)),
      #("old_certificate_id", json.nullable(data.old_certificate_id, json.int)),
      #("auto_renew", json.nullable(data.auto_renew, json.bool))
    ],
  )
}

pub fn name_server_decoder() {
  use ipv4 <- decode.optional_field("ipv4", None, decode.optional(decode.string))
  use ipv6 <- decode.optional_field("ipv6", None, decode.optional(decode.string))
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  decode.success(
    NameServer(
      ipv4: ipv4,
      ipv6: ipv6,
      created_at: created_at,
      name: name,
      updated_at: updated_at,
      id: id,
    ),
  )
}

pub fn name_server_encode(data: NameServer) {
  json.object(
    [
      #("ipv4", json.nullable(data.ipv4, json.string)),
      #("ipv6", json.nullable(data.ipv6, json.string)),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("name", json.nullable(data.name, json.string)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int))
    ],
  )
}

pub fn event_domain_auto_renewal_enable_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  decode.success(EventDomainAutoRenewalEnable(domain: domain))
}

pub fn event_domain_auto_renewal_enable_encode(
  data: EventDomainAutoRenewalEnable,
) {
  json.object([#("domain", json.nullable(data.domain, domain_encode))])
}

pub fn event_whois_privacy_disable_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  use whois_privacy <- decode.optional_field(
    "whois_privacy",
    None,
    decode.optional(whois_privacy_decoder()),
  )
  decode.success(
    EventWhoisPrivacyDisable(domain: domain, whois_privacy: whois_privacy),
  )
}

pub fn event_whois_privacy_disable_encode(data: EventWhoisPrivacyDisable) {
  json.object(
    [
      #("domain", json.nullable(data.domain, domain_encode)),
      #("whois_privacy", json.nullable(data.whois_privacy, whois_privacy_encode))
    ],
  )
}

pub fn event_push_initiate_decoder() {
  use push <- decode.optional_field(
    "push",
    None,
    decode.optional(push_decoder()),
  )
  decode.success(EventPushInitiate(push: push))
}

pub fn event_push_initiate_encode(data: EventPushInitiate) {
  json.object([#("push", json.nullable(data.push, push_encode))])
}

pub fn invoice_decoder() {
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use invoice_number <- decode.optional_field(
    "invoice_number",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  decode.success(
    Invoice(
      created_at: created_at,
      updated_at: updated_at,
      invoice_number: invoice_number,
      id: id,
    ),
  )
}

pub fn invoice_encode(data: Invoice) {
  json.object(
    [
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("invoice_number", json.nullable(data.invoice_number, json.string)),
      #("id", json.nullable(data.id, json.int))
    ],
  )
}

pub fn account_decoder() {
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.string),
  )
  use plan_identifier <- decode.optional_field(
    "plan_identifier",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    Account(
      created_at: created_at,
      updated_at: updated_at,
      id: id,
      email: email,
      plan_identifier: plan_identifier,
    ),
  )
}

pub fn account_encode(data: Account) {
  json.object(
    [
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int)),
      #("email", json.nullable(data.email, json.string)),
      #("plan_identifier", json.nullable(data.plan_identifier, json.string))
    ],
  )
}

pub fn event_dnssecdelete_decoder() {
  use dnssec <- decode.optional_field(
    "dnssec",
    None,
    decode.optional(dnssec_decoder()),
  )
  decode.success(EventDnssecdelete(dnssec: dnssec))
}

pub fn event_dnssecdelete_encode(data: EventDnssecdelete) {
  json.object([#("dnssec", json.nullable(data.dnssec, dnssec_encode))])
}

pub fn registrant_change_check_decoder() {
  use domain_id <- decode.optional_field(
    "domain_id",
    None,
    decode.optional(decode.int),
  )
  use contact_id <- decode.optional_field(
    "contact_id",
    None,
    decode.optional(decode.int),
  )
  use extended_attributes <- decode.optional_field(
    "extended_attributes",
    None,
    decode.optional(decode.list(extended_attribute_decoder())),
  )
  use registry_owner_change <- decode.optional_field(
    "registry_owner_change",
    None,
    decode.optional(decode.bool),
  )
  decode.success(
    RegistrantChangeCheck(
      domain_id: domain_id,
      contact_id: contact_id,
      extended_attributes: extended_attributes,
      registry_owner_change: registry_owner_change,
    ),
  )
}

pub fn registrant_change_check_encode(data: RegistrantChangeCheck) {
  json.object(
    [
      #("domain_id", json.nullable(data.domain_id, json.int)),
      #("contact_id", json.nullable(data.contact_id, json.int)),
      #(
        "extended_attributes",
        json.nullable(
          data.extended_attributes,
          json.array(_, extended_attribute_encode),
        ),
      ),
      #(
        "registry_owner_change",
        json.nullable(data.registry_owner_change, json.bool),
      )
    ],
  )
}

pub fn event_domain_resolution_enable_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  decode.success(EventDomainResolutionEnable(domain: domain))
}

pub fn event_domain_resolution_enable_encode(data: EventDomainResolutionEnable) {
  json.object([#("domain", json.nullable(data.domain, domain_encode))])
}

pub fn zone_decoder() {
  use reverse <- decode.optional_field(
    "reverse",
    None,
    decode.optional(decode.bool),
  )
  use active <- decode.optional_field(
    "active",
    None,
    decode.optional(decode.bool),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use account_id <- decode.optional_field(
    "account_id",
    None,
    decode.optional(decode.int),
  )
  use secondary <- decode.optional_field(
    "secondary",
    None,
    decode.optional(decode.bool),
  )
  use last_transferred_at <- decode.optional_field(
    "last_transferred_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  decode.success(
    Zone(
      reverse: reverse,
      active: active,
      created_at: created_at,
      name: name,
      account_id: account_id,
      secondary: secondary,
      last_transferred_at: last_transferred_at,
      updated_at: updated_at,
      id: id,
    ),
  )
}

pub fn zone_encode(data: Zone) {
  json.object(
    [
      #("reverse", json.nullable(data.reverse, json.bool)),
      #("active", json.nullable(data.active, json.bool)),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("name", json.nullable(data.name, json.string)),
      #("account_id", json.nullable(data.account_id, json.int)),
      #("secondary", json.nullable(data.secondary, json.bool)),
      #(
        "last_transferred_at",
        json.nullable(data.last_transferred_at, date_time_encode),
      ),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int))
    ],
  )
}

pub fn event_email_forward_update_decoder() {
  use email_forward <- decode.optional_field(
    "email_forward",
    None,
    decode.optional(email_forward_decoder()),
  )
  decode.success(EventEmailForwardUpdate(email_forward: email_forward))
}

pub fn event_email_forward_update_encode(data: EventEmailForwardUpdate) {
  json.object(
    [#("email_forward", json.nullable(data.email_forward, email_forward_encode))],
  )
}

pub fn ttl_decoder() {
  decode.int
}

pub fn ttl_encode(data: Ttl) {
  json.int(data)
}

pub fn tld_decoder() {
  use minimum_registration <- decode.optional_field(
    "minimum_registration",
    None,
    decode.optional(decode.int),
  )
  use tld <- decode.optional_field("tld", None, decode.optional(decode.string))
  use tld_type <- decode.optional_field(
    "tld_type",
    None,
    decode.optional(tldtype_decoder()),
  )
  use transfer_enabled <- decode.optional_field(
    "transfer_enabled",
    None,
    decode.optional(decode.bool),
  )
  use auto_renew_only <- decode.optional_field(
    "auto_renew_only",
    None,
    decode.optional(decode.bool),
  )
  use whois_privacy <- decode.optional_field(
    "whois_privacy",
    None,
    decode.optional(decode.bool),
  )
  use idn <- decode.optional_field("idn", None, decode.optional(decode.bool))
  use dnssec_interface_type <- decode.optional_field(
    "dnssec_interface_type",
    None,
    decode.optional(decode.string),
  )
  use renewal_enabled <- decode.optional_field(
    "renewal_enabled",
    None,
    decode.optional(decode.bool),
  )
  use registration_enabled <- decode.optional_field(
    "registration_enabled",
    None,
    decode.optional(decode.bool),
  )
  decode.success(
    Tld(
      minimum_registration: minimum_registration,
      tld: tld,
      tld_type: tld_type,
      transfer_enabled: transfer_enabled,
      auto_renew_only: auto_renew_only,
      whois_privacy: whois_privacy,
      idn: idn,
      dnssec_interface_type: dnssec_interface_type,
      renewal_enabled: renewal_enabled,
      registration_enabled: registration_enabled,
    ),
  )
}

pub fn tld_encode(data: Tld) {
  json.object(
    [
      #(
        "minimum_registration",
        json.nullable(data.minimum_registration, json.int),
      ),
      #("tld", json.nullable(data.tld, json.string)),
      #("tld_type", json.nullable(data.tld_type, tldtype_encode)),
      #("transfer_enabled", json.nullable(data.transfer_enabled, json.bool)),
      #("auto_renew_only", json.nullable(data.auto_renew_only, json.bool)),
      #("whois_privacy", json.nullable(data.whois_privacy, json.bool)),
      #("idn", json.nullable(data.idn, json.bool)),
      #(
        "dnssec_interface_type",
        json.nullable(data.dnssec_interface_type, json.string),
      ),
      #("renewal_enabled", json.nullable(data.renewal_enabled, json.bool)),
      #(
        "registration_enabled",
        json.nullable(data.registration_enabled, json.bool),
      )
    ],
  )
}

pub fn event_name_server_deregister_decoder() {
  use name_server <- decode.optional_field(
    "name_server",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  decode.success(EventNameServerDeregister(name_server: name_server))
}

pub fn event_name_server_deregister_encode(data: EventNameServerDeregister) {
  json.object(
    [
      #(
        "name_server",
        json.nullable(
          data.name_server,
          fn(_) { panic as "Literal object inside field" },
        ),
      )
    ],
  )
}

pub fn user_decoder() {
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    User(created_at: created_at, updated_at: updated_at, id: id, email: email),
  )
}

pub fn user_encode(data: User) {
  json.object(
    [
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int)),
      #("email", json.nullable(data.email, json.string))
    ],
  )
}

pub fn event_name_server_register_decoder() {
  use name_server <- decode.optional_field(
    "name_server",
    None,
    decode.optional(decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) })),
  )
  decode.success(EventNameServerRegister(name_server: name_server))
}

pub fn event_name_server_register_encode(data: EventNameServerRegister) {
  json.object(
    [
      #(
        "name_server",
        json.nullable(
          data.name_server,
          fn(_) { panic as "Literal object inside field" },
        ),
      )
    ],
  )
}

pub fn template_record_decoder() {
  use template_id <- decode.optional_field(
    "template_id",
    None,
    decode.optional(decode.int),
  )
  use priority <- decode.optional_field(
    "priority",
    None,
    decode.optional(decode.int),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use ttl <- decode.optional_field("ttl", None, decode.optional(ttl_decoder()))
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use content <- decode.optional_field(
    "content",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(template_record_type_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  decode.success(
    TemplateRecord(
      template_id: template_id,
      priority: priority,
      created_at: created_at,
      name: name,
      ttl: ttl,
      updated_at: updated_at,
      content: content,
      type_: type_,
      id: id,
    ),
  )
}

pub fn template_record_encode(data: TemplateRecord) {
  json.object(
    [
      #("template_id", json.nullable(data.template_id, json.int)),
      #("priority", json.nullable(data.priority, json.int)),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("name", json.nullable(data.name, json.string)),
      #("ttl", json.nullable(data.ttl, ttl_encode)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("content", json.nullable(data.content, json.string)),
      #("type", json.nullable(data.type_, template_record_type_encode)),
      #("id", json.nullable(data.id, json.int))
    ],
  )
}

pub fn letsencrypt_certificate_purchase_decoder() {
  use certificate_id <- decode.optional_field(
    "certificate_id",
    None,
    decode.optional(decode.int),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  use auto_renew <- decode.optional_field(
    "auto_renew",
    None,
    decode.optional(decode.bool),
  )
  decode.success(
    LetsencryptCertificatePurchase(
      certificate_id: certificate_id,
      created_at: created_at,
      state: state,
      updated_at: updated_at,
      id: id,
      auto_renew: auto_renew,
    ),
  )
}

pub fn letsencrypt_certificate_purchase_encode(
  data: LetsencryptCertificatePurchase,
) {
  json.object(
    [
      #("certificate_id", json.nullable(data.certificate_id, json.int)),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("state", json.nullable(data.state, json.string)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int)),
      #("auto_renew", json.nullable(data.auto_renew, json.bool))
    ],
  )
}

pub fn event_secondary_dnscreate_decoder() {
  use configuration <- decode.optional_field(
    "configuration",
    None,
    decode.optional(secondary_dns_decoder()),
  )
  decode.success(EventSecondaryDnscreate(configuration: configuration))
}

pub fn event_secondary_dnscreate_encode(data: EventSecondaryDnscreate) {
  json.object(
    [#("configuration", json.nullable(data.configuration, secondary_dns_encode))],
  )
}

pub fn domain_restore_decoder() {
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use domain_id <- decode.optional_field(
    "domain_id",
    None,
    decode.optional(decode.int),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  decode.success(
    DomainRestore(
      created_at: created_at,
      state: state,
      domain_id: domain_id,
      updated_at: updated_at,
      id: id,
    ),
  )
}

pub fn domain_restore_encode(data: DomainRestore) {
  json.object(
    [
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("state", json.nullable(data.state, json.string)),
      #("domain_id", json.nullable(data.domain_id, json.int)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int))
    ],
  )
}

pub fn email_forward_decoder() {
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use from <- decode.optional_field("from", None, decode.optional(decode.string))
  use destination_email <- decode.optional_field(
    "destination_email",
    None,
    decode.optional(decode.string),
  )
  use alias_email <- decode.optional_field(
    "alias_email",
    None,
    decode.optional(decode.string),
  )
  use domain_id <- decode.optional_field(
    "domain_id",
    None,
    decode.optional(decode.int),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  use to <- decode.optional_field("to", None, decode.optional(decode.string))
  decode.success(
    EmailForward(
      created_at: created_at,
      from: from,
      destination_email: destination_email,
      alias_email: alias_email,
      domain_id: domain_id,
      updated_at: updated_at,
      id: id,
      to: to,
    ),
  )
}

pub fn email_forward_encode(data: EmailForward) {
  json.object(
    [
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("from", json.nullable(data.from, json.string)),
      #("destination_email", json.nullable(data.destination_email, json.string)),
      #("alias_email", json.nullable(data.alias_email, json.string)),
      #("domain_id", json.nullable(data.domain_id, json.int)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int)),
      #("to", json.nullable(data.to, json.string))
    ],
  )
}

pub fn event_certificate_auto_renewal_failed_decoder() {
  use certificate <- decode.optional_field(
    "certificate",
    None,
    decode.optional(certificate_decoder()),
  )
  decode.success(EventCertificateAutoRenewalFailed(certificate: certificate))
}

pub fn event_certificate_auto_renewal_failed_encode(
  data: EventCertificateAutoRenewalFailed,
) {
  json.object(
    [#("certificate", json.nullable(data.certificate, certificate_encode))],
  )
}

pub fn event_domain_delete_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  decode.success(EventDomainDelete(domain: domain))
}

pub fn event_domain_delete_encode(data: EventDomainDelete) {
  json.object([#("domain", json.nullable(data.domain, domain_encode))])
}

pub fn event_domain_transfer_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  decode.success(EventDomainTransfer(domain: domain))
}

pub fn event_domain_transfer_encode(data: EventDomainTransfer) {
  json.object([#("domain", json.nullable(data.domain, domain_encode))])
}

pub fn event_certificate_reissue_decoder() {
  use certificate <- decode.optional_field(
    "certificate",
    None,
    decode.optional(certificate_decoder()),
  )
  decode.success(EventCertificateReissue(certificate: certificate))
}

pub fn event_certificate_reissue_encode(data: EventCertificateReissue) {
  json.object(
    [#("certificate", json.nullable(data.certificate, certificate_encode))],
  )
}

pub fn event_vanity_enable_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  decode.success(EventVanityEnable(domain: domain))
}

pub fn event_vanity_enable_encode(data: EventVanityEnable) {
  json.object([#("domain", json.nullable(data.domain, domain_encode))])
}

pub fn zone_file_decoder() {
  use zone <- decode.optional_field("zone", None, decode.optional(decode.string))
  decode.success(ZoneFile(zone: zone))
}

pub fn zone_file_encode(data: ZoneFile) {
  json.object([#("zone", json.nullable(data.zone, json.string))])
}

pub fn event_webhook_delete_decoder() {
  use webhook <- decode.optional_field(
    "webhook",
    None,
    decode.optional(webhook_decoder()),
  )
  decode.success(EventWebhookDelete(webhook: webhook))
}

pub fn event_webhook_delete_encode(data: EventWebhookDelete) {
  json.object([#("webhook", json.nullable(data.webhook, webhook_encode))])
}

pub fn dnssec_decoder() {
  use enabled <- decode.optional_field(
    "enabled",
    None,
    decode.optional(decode.bool),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  decode.success(
    Dnssec(enabled: enabled, created_at: created_at, updated_at: updated_at),
  )
}

pub fn dnssec_encode(data: Dnssec) {
  json.object(
    [
      #("enabled", json.nullable(data.enabled, json.bool)),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode))
    ],
  )
}

pub fn event_account_invitation_create_decoder() {
  use account_invitation <- decode.optional_field(
    "account_invitation",
    None,
    decode.optional(account_invitation_decoder()),
  )
  use account <- decode.optional_field(
    "account",
    None,
    decode.optional(account_decoder()),
  )
  decode.success(
    EventAccountInvitationCreate(
      account_invitation: account_invitation,
      account: account,
    ),
  )
}

pub fn event_account_invitation_create_encode(data: EventAccountInvitationCreate) {
  json.object(
    [
      #(
        "account_invitation",
        json.nullable(data.account_invitation, account_invitation_encode),
      ),
      #("account", json.nullable(data.account, account_encode))
    ],
  )
}

pub fn event_domain_registrant_change_started_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  use registrant <- decode.optional_field(
    "registrant",
    None,
    decode.optional(contact_decoder()),
  )
  decode.success(
    EventDomainRegistrantChangeStarted(domain: domain, registrant: registrant),
  )
}

pub fn event_domain_registrant_change_started_encode(
  data: EventDomainRegistrantChangeStarted,
) {
  json.object(
    [
      #("domain", json.nullable(data.domain, domain_encode)),
      #("registrant", json.nullable(data.registrant, contact_encode))
    ],
  )
}

pub fn error_decoder() {
  use message <- decode.optional_field(
    "message",
    None,
    decode.optional(decode.string),
  )
  decode.success(Error(message: message))
}

pub fn error_encode(data: Error) {
  json.object([#("message", json.nullable(data.message, json.string))])
}

pub fn event_domain_transfer_cancelled_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  decode.success(EventDomainTransferCancelled(domain: domain))
}

pub fn event_domain_transfer_cancelled_encode(data: EventDomainTransferCancelled) {
  json.object([#("domain", json.nullable(data.domain, domain_encode))])
}

pub fn event_account_invitation_resend_decoder() {
  use account_invitation <- decode.optional_field(
    "account_invitation",
    None,
    decode.optional(account_invitation_decoder()),
  )
  use account <- decode.optional_field(
    "account",
    None,
    decode.optional(account_decoder()),
  )
  decode.success(
    EventAccountInvitationResend(
      account_invitation: account_invitation,
      account: account,
    ),
  )
}

pub fn event_account_invitation_resend_encode(data: EventAccountInvitationResend) {
  json.object(
    [
      #(
        "account_invitation",
        json.nullable(data.account_invitation, account_invitation_encode),
      ),
      #("account", json.nullable(data.account, account_encode))
    ],
  )
}

pub fn event_record_create_decoder() {
  use zone_record <- decode.optional_field(
    "zone_record",
    None,
    decode.optional(zone_record_decoder()),
  )
  decode.success(EventRecordCreate(zone_record: zone_record))
}

pub fn event_record_create_encode(data: EventRecordCreate) {
  json.object(
    [#("zone_record", json.nullable(data.zone_record, zone_record_encode))],
  )
}

pub fn charge_item_decoder() {
  use product_type <- decode.optional_field(
    "product_type",
    None,
    decode.optional(decode.string),
  )
  use product_id <- decode.optional_field(
    "product_id",
    None,
    decode.optional(decode.int),
  )
  use amount <- decode.optional_field(
    "amount",
    None,
    decode.optional(decode.string),
  )
  use product_reference <- decode.optional_field(
    "product_reference",
    None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    ChargeItem(
      product_type: product_type,
      product_id: product_id,
      amount: amount,
      product_reference: product_reference,
      description: description,
    ),
  )
}

pub fn charge_item_encode(data: ChargeItem) {
  json.object(
    [
      #("product_type", json.nullable(data.product_type, json.string)),
      #("product_id", json.nullable(data.product_id, json.int)),
      #("amount", json.nullable(data.amount, json.string)),
      #("product_reference", json.nullable(data.product_reference, json.string)),
      #("description", json.nullable(data.description, json.string))
    ],
  )
}

pub fn tldtype_decoder() {
  decode.int
}

pub fn tldtype_encode(data: Tldtype) {
  json.int(data)
}

pub fn account_invitation_decoder() {
  use invitation_accepted_at <- decode.optional_field(
    "invitation_accepted_at",
    None,
    decode.optional(nullable_date_time_decoder()),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use account_id <- decode.optional_field(
    "account_id",
    None,
    decode.optional(decode.int),
  )
  use invitation_sent_at <- decode.optional_field(
    "invitation_sent_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use token_ <- decode.optional_field(
    "token",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    AccountInvitation(
      invitation_accepted_at: invitation_accepted_at,
      created_at: created_at,
      account_id: account_id,
      invitation_sent_at: invitation_sent_at,
      updated_at: updated_at,
      token_: token_,
      id: id,
      email: email,
    ),
  )
}

pub fn account_invitation_encode(data: AccountInvitation) {
  json.object(
    [
      #(
        "invitation_accepted_at",
        json.nullable(data.invitation_accepted_at, nullable_date_time_encode),
      ),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("account_id", json.nullable(data.account_id, json.int)),
      #(
        "invitation_sent_at",
        json.nullable(data.invitation_sent_at, date_time_encode),
      ),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("token", json.nullable(data.token_, json.string)),
      #("id", json.nullable(data.id, json.int)),
      #("email", json.nullable(data.email, json.string))
    ],
  )
}

pub fn collaborator_decoder() {
  use domain_name <- decode.optional_field(
    "domain_name",
    None,
    decode.optional(decode.string),
  )
  use user_email <- decode.optional_field(
    "user_email",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use accepted_at <- decode.optional_field(
    "accepted_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use user_id <- decode.optional_field(
    "user_id",
    None,
    decode.optional(decode.int),
  )
  use domain_id <- decode.optional_field(
    "domain_id",
    None,
    decode.optional(decode.int),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use invitation <- decode.optional_field(
    "invitation",
    None,
    decode.optional(decode.bool),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  decode.success(
    Collaborator(
      domain_name: domain_name,
      user_email: user_email,
      created_at: created_at,
      accepted_at: accepted_at,
      user_id: user_id,
      domain_id: domain_id,
      updated_at: updated_at,
      invitation: invitation,
      id: id,
    ),
  )
}

pub fn collaborator_encode(data: Collaborator) {
  json.object(
    [
      #("domain_name", json.nullable(data.domain_name, json.string)),
      #("user_email", json.nullable(data.user_email, json.string)),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("accepted_at", json.nullable(data.accepted_at, date_time_encode)),
      #("user_id", json.nullable(data.user_id, json.int)),
      #("domain_id", json.nullable(data.domain_id, json.int)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("invitation", json.nullable(data.invitation, json.bool)),
      #("id", json.nullable(data.id, json.int))
    ],
  )
}

pub fn primary_server_decoder() {
  use port <- decode.optional_field("port", None, decode.optional(decode.int))
  use ip <- decode.optional_field("ip", None, decode.optional(decode.string))
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use account_id <- decode.optional_field(
    "account_id",
    None,
    decode.optional(decode.int),
  )
  use linked_secondary_zones <- decode.optional_field(
    "linked_secondary_zones",
    None,
    decode.optional(decode.list(decode.string)),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  decode.success(
    PrimaryServer(
      port: port,
      ip: ip,
      created_at: created_at,
      name: name,
      account_id: account_id,
      linked_secondary_zones: linked_secondary_zones,
      updated_at: updated_at,
      id: id,
    ),
  )
}

pub fn primary_server_encode(data: PrimaryServer) {
  json.object(
    [
      #("port", json.nullable(data.port, json.int)),
      #("ip", json.nullable(data.ip, json.string)),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("name", json.nullable(data.name, json.string)),
      #("account_id", json.nullable(data.account_id, json.int)),
      #(
        "linked_secondary_zones",
        json.nullable(data.linked_secondary_zones, json.array(_, json.string)),
      ),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int))
    ],
  )
}

pub fn template_record_type_decoder() {
  decode.string
}

pub fn template_record_type_encode(data: TemplateRecordType) {
  json.string(data)
}

pub fn domain_decoder() {
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use expires_on <- decode.optional_field(
    "expires_on",
    None,
    decode.optional(date_decoder()),
  )
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use private_whois <- decode.optional_field(
    "private_whois",
    None,
    decode.optional(decode.bool),
  )
  use account_id <- decode.optional_field(
    "account_id",
    None,
    decode.optional(decode.int),
  )
  use unicode_name <- decode.optional_field(
    "unicode_name",
    None,
    decode.optional(decode.string),
  )
  use registrant_id <- decode.optional_field(
    "registrant_id",
    None,
    decode.optional(decode.int),
  )
  use state <- decode.optional_field(
    "state",
    None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  use auto_renew <- decode.optional_field(
    "auto_renew",
    None,
    decode.optional(decode.bool),
  )
  use expires_at <- decode.optional_field(
    "expires_at",
    None,
    decode.optional(nullable_date_time_decoder()),
  )
  decode.success(
    Domain(
      created_at: created_at,
      expires_on: expires_on,
      name: name,
      private_whois: private_whois,
      account_id: account_id,
      unicode_name: unicode_name,
      registrant_id: registrant_id,
      state: state,
      updated_at: updated_at,
      id: id,
      auto_renew: auto_renew,
      expires_at: expires_at,
    ),
  )
}

pub fn domain_encode(data: Domain) {
  json.object(
    [
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("expires_on", json.nullable(data.expires_on, date_encode)),
      #("name", json.nullable(data.name, json.string)),
      #("private_whois", json.nullable(data.private_whois, json.bool)),
      #("account_id", json.nullable(data.account_id, json.int)),
      #("unicode_name", json.nullable(data.unicode_name, json.string)),
      #("registrant_id", json.nullable(data.registrant_id, json.int)),
      #("state", json.nullable(data.state, json.string)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int)),
      #("auto_renew", json.nullable(data.auto_renew, json.bool)),
      #("expires_at", json.nullable(data.expires_at, nullable_date_time_encode))
    ],
  )
}

pub fn event_vanity_disable_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  decode.success(EventVanityDisable(domain: domain))
}

pub fn event_vanity_disable_encode(data: EventVanityDisable) {
  json.object([#("domain", json.nullable(data.domain, domain_encode))])
}

pub fn extended_attribute_decoder() {
  use name <- decode.optional_field("name", None, decode.optional(decode.string))
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use options <- decode.optional_field(
    "options",
    None,
    decode.optional(decode.list(extended_attribute_option_decoder())),
  )
  use required <- decode.optional_field(
    "required",
    None,
    decode.optional(decode.bool),
  )
  decode.success(
    ExtendedAttribute(
      name: name,
      description: description,
      options: options,
      required: required,
    ),
  )
}

pub fn extended_attribute_encode(data: ExtendedAttribute) {
  json.object(
    [
      #("name", json.nullable(data.name, json.string)),
      #("description", json.nullable(data.description, json.string)),
      #(
        "options",
        json.nullable(
          data.options,
          json.array(_, extended_attribute_option_encode),
        ),
      ),
      #("required", json.nullable(data.required, json.bool))
    ],
  )
}

pub fn event_zone_create_decoder() {
  use zone <- decode.optional_field(
    "zone",
    None,
    decode.optional(zone_decoder()),
  )
  decode.success(EventZoneCreate(zone: zone))
}

pub fn event_zone_create_encode(data: EventZoneCreate) {
  json.object([#("zone", json.nullable(data.zone, zone_encode))])
}

pub fn event_dnssecrotation_start_decoder() {
  use dnssec <- decode.optional_field(
    "dnssec",
    None,
    decode.optional(dnssec_decoder()),
  )
  use delegation_signer_record <- decode.optional_field(
    "delegation_signer_record",
    None,
    decode.optional(delegation_signer_decoder()),
  )
  decode.success(
    EventDnssecrotationStart(
      dnssec: dnssec,
      delegation_signer_record: delegation_signer_record,
    ),
  )
}

pub fn event_dnssecrotation_start_encode(data: EventDnssecrotationStart) {
  json.object(
    [
      #("dnssec", json.nullable(data.dnssec, dnssec_encode)),
      #(
        "delegation_signer_record",
        json.nullable(data.delegation_signer_record, delegation_signer_encode),
      )
    ],
  )
}

pub fn event_account_remove_user_decoder() {
  use user <- decode.optional_field(
    "user",
    None,
    decode.optional(user_decoder()),
  )
  use account <- decode.optional_field(
    "account",
    None,
    decode.optional(account_decoder()),
  )
  decode.success(EventAccountRemoveUser(user: user, account: account))
}

pub fn event_account_remove_user_encode(data: EventAccountRemoveUser) {
  json.object(
    [
      #("user", json.nullable(data.user, user_encode)),
      #("account", json.nullable(data.account, account_encode))
    ],
  )
}

pub fn event_contact_create_decoder() {
  use contact <- decode.optional_field(
    "contact",
    None,
    decode.optional(contact_decoder()),
  )
  decode.success(EventContactCreate(contact: contact))
}

pub fn event_contact_create_encode(data: EventContactCreate) {
  json.object([#("contact", json.nullable(data.contact, contact_encode))])
}

pub fn event_domain_renew_cancelled_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  use auto_ <- decode.optional_field("auto", None, decode.optional(decode.bool))
  decode.success(EventDomainRenewCancelled(domain: domain, auto_: auto_))
}

pub fn event_domain_renew_cancelled_encode(data: EventDomainRenewCancelled) {
  json.object(
    [
      #("domain", json.nullable(data.domain, domain_encode)),
      #("auto", json.nullable(data.auto_, json.bool))
    ],
  )
}

pub fn event_template_record_create_decoder() {
  use template_record <- decode.optional_field(
    "template_record",
    None,
    decode.optional(template_record_decoder()),
  )
  decode.success(EventTemplateRecordCreate(template_record: template_record))
}

pub fn event_template_record_create_encode(data: EventTemplateRecordCreate) {
  json.object(
    [
      #(
        "template_record",
        json.nullable(data.template_record, template_record_encode),
      )
    ],
  )
}

pub fn domain_check_result_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(decode.string),
  )
  use available <- decode.optional_field(
    "available",
    None,
    decode.optional(decode.bool),
  )
  use premium <- decode.optional_field(
    "premium",
    None,
    decode.optional(decode.bool),
  )
  decode.success(
    DomainCheckResult(domain: domain, available: available, premium: premium),
  )
}

pub fn domain_check_result_encode(data: DomainCheckResult) {
  json.object(
    [
      #("domain", json.nullable(data.domain, json.string)),
      #("available", json.nullable(data.available, json.bool)),
      #("premium", json.nullable(data.premium, json.bool))
    ],
  )
}

pub fn event_domain_restore_cancelled_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  use auto_ <- decode.optional_field("auto", None, decode.optional(decode.bool))
  decode.success(EventDomainRestoreCancelled(domain: domain, auto_: auto_))
}

pub fn event_domain_restore_cancelled_encode(data: EventDomainRestoreCancelled) {
  json.object(
    [
      #("domain", json.nullable(data.domain, domain_encode)),
      #("auto", json.nullable(data.auto_, json.bool))
    ],
  )
}

pub fn event_domain_register_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  decode.success(EventDomainRegister(domain: domain))
}

pub fn event_domain_register_encode(data: EventDomainRegister) {
  json.object([#("domain", json.nullable(data.domain, domain_encode))])
}

pub fn whois_privacy_decoder() {
  use enabled <- decode.optional_field(
    "enabled",
    None,
    decode.optional(decode.bool),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use expires_on <- decode.optional_field(
    "expires_on",
    None,
    decode.optional(date_decoder()),
  )
  use domain_id <- decode.optional_field(
    "domain_id",
    None,
    decode.optional(decode.int),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  decode.success(
    WhoisPrivacy(
      enabled: enabled,
      created_at: created_at,
      expires_on: expires_on,
      domain_id: domain_id,
      updated_at: updated_at,
      id: id,
    ),
  )
}

pub fn whois_privacy_encode(data: WhoisPrivacy) {
  json.object(
    [
      #("enabled", json.nullable(data.enabled, json.bool)),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("expires_on", json.nullable(data.expires_on, date_encode)),
      #("domain_id", json.nullable(data.domain_id, json.int)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("id", json.nullable(data.id, json.int))
    ],
  )
}

pub fn event_domain_register_started_decoder() {
  use domain <- decode.optional_field(
    "domain",
    None,
    decode.optional(domain_decoder()),
  )
  decode.success(EventDomainRegisterStarted(domain: domain))
}

pub fn event_domain_register_started_encode(data: EventDomainRegisterStarted) {
  json.object([#("domain", json.nullable(data.domain, domain_encode))])
}

pub fn contact_decoder() {
  use postal_code <- decode.optional_field(
    "postal_code",
    None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "created_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use city <- decode.optional_field("city", None, decode.optional(decode.string))
  use account_id <- decode.optional_field(
    "account_id",
    None,
    decode.optional(decode.int),
  )
  use phone <- decode.optional_field(
    "phone",
    None,
    decode.optional(decode.string),
  )
  use last_name <- decode.optional_field(
    "last_name",
    None,
    decode.optional(decode.string),
  )
  use label <- decode.optional_field(
    "label",
    None,
    decode.optional(decode.string),
  )
  use job_title <- decode.optional_field(
    "job_title",
    None,
    decode.optional(decode.string),
  )
  use country <- decode.optional_field(
    "country",
    None,
    decode.optional(decode.string),
  )
  use organization_name <- decode.optional_field(
    "organization_name",
    None,
    decode.optional(decode.string),
  )
  use updated_at <- decode.optional_field(
    "updated_at",
    None,
    decode.optional(date_time_decoder()),
  )
  use first_name <- decode.optional_field(
    "first_name",
    None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field("id", None, decode.optional(decode.int))
  use email <- decode.optional_field(
    "email",
    None,
    decode.optional(decode.string),
  )
  use address1 <- decode.optional_field(
    "address1",
    None,
    decode.optional(decode.string),
  )
  use fax <- decode.optional_field("fax", None, decode.optional(decode.string))
  use address2 <- decode.optional_field(
    "address2",
    None,
    decode.optional(decode.string),
  )
  use state_province <- decode.optional_field(
    "state_province",
    None,
    decode.optional(decode.string),
  )
  decode.success(
    Contact(
      postal_code: postal_code,
      created_at: created_at,
      city: city,
      account_id: account_id,
      phone: phone,
      last_name: last_name,
      label: label,
      job_title: job_title,
      country: country,
      organization_name: organization_name,
      updated_at: updated_at,
      first_name: first_name,
      id: id,
      email: email,
      address1: address1,
      fax: fax,
      address2: address2,
      state_province: state_province,
    ),
  )
}

pub fn contact_encode(data: Contact) {
  json.object(
    [
      #("postal_code", json.nullable(data.postal_code, json.string)),
      #("created_at", json.nullable(data.created_at, date_time_encode)),
      #("city", json.nullable(data.city, json.string)),
      #("account_id", json.nullable(data.account_id, json.int)),
      #("phone", json.nullable(data.phone, json.string)),
      #("last_name", json.nullable(data.last_name, json.string)),
      #("label", json.nullable(data.label, json.string)),
      #("job_title", json.nullable(data.job_title, json.string)),
      #("country", json.nullable(data.country, json.string)),
      #("organization_name", json.nullable(data.organization_name, json.string)),
      #("updated_at", json.nullable(data.updated_at, date_time_encode)),
      #("first_name", json.nullable(data.first_name, json.string)),
      #("id", json.nullable(data.id, json.int)),
      #("email", json.nullable(data.email, json.string)),
      #("address1", json.nullable(data.address1, json.string)),
      #("fax", json.nullable(data.fax, json.string)),
      #("address2", json.nullable(data.address2, json.string)),
      #("state_province", json.nullable(data.state_province, json.string))
    ],
  )
}
