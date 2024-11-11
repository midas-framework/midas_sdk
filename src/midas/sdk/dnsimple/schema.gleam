import decode/zero
import gleam/json
import gleam/option.{type Option, None}

pub type EventTemplateDelete {
  EventTemplateDelete(template: Option(Nil))
}

pub type CertificateDownload {
  CertificateDownload(
    chain: Option(List(String)),
    root: Option(String),
    server: Option(String),
  )
}

pub type EventEmailForwardCreate {
  EventEmailForwardCreate(email_forward: Option(Nil))
}

pub type BillingSettings {
  BillingSettings
}

pub type EventDnsseccreate {
  EventDnsseccreate(dnssec: Option(Nil))
}

pub type EventOauthApplicationDelete {
  EventOauthApplicationDelete(oauth_application: Option(Nil))
}

pub type EventDomainResolutionDisable {
  EventDomainResolutionDisable(domain: Option(Nil))
}

pub type DomainRegistration {
  DomainRegistration(
    period: Option(Int),
    created_at: Option(String),
    registrant_id: Option(Int),
    state: Option(String),
    whois_privacy: Option(Bool),
    domain_id: Option(Int),
    updated_at: Option(String),
    id: Option(Int),
    auto_renew: Option(Bool),
  )
}

pub type ZoneRecord {
  ZoneRecord(
    system_record: Option(Bool),
    priority: Option(Int),
    created_at: Option(String),
    name: Option(String),
    ttl: Option(Int),
    zone_id: Option(String),
    parent_id: Option(Int),
    updated_at: Option(String),
    content: Option(String),
    type_: Option(String),
    id: Option(Int),
    regions: Option(Nil),
  )
}

pub type EventTemplateUpdate {
  EventTemplateUpdate(template: Option(Nil))
}

pub type EventWhoisPrivacyEnable {
  EventWhoisPrivacyEnable(domain: Option(Nil), whois_privacy: Option(Nil))
}

pub type EventCertificateRemovePrivateKey {
  EventCertificateRemovePrivateKey(certificate: Option(Nil))
}

pub type Subscription {
  Subscription(
    plan_name: Option(String),
    created_at: Option(String),
    state: Option(String),
    updated_at: Option(String),
    id: Option(Int),
  )
}

pub type EventDomainAutoRenewalDisable {
  EventDomainAutoRenewalDisable(domain: Option(Nil))
}

pub type EventOauthApplicationUpdate {
  EventOauthApplicationUpdate(oauth_application: Option(Nil))
}

pub type EventPushAccept {
  EventPushAccept(push: Option(Nil))
}

pub type EventCertificateAutoRenewalDisable {
  EventCertificateAutoRenewalDisable(certificate: Option(Nil))
}

pub type EventAccountUpdate {
  EventAccountUpdate(account: Option(Nil))
}

pub type EventCertificateIssue {
  EventCertificateIssue(certificate: Option(Nil))
}

pub type EventWhoisPrivacyPurchase {
  EventWhoisPrivacyPurchase(domain: Option(Nil), whois_privacy: Option(Nil))
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

pub type RegistrantChange {
  RegistrantChange(
    created_at: Option(String),
    irt_lock_lifted_by: Option(String),
    account_id: Option(Int),
    state: Option(String),
    domain_id: Option(Int),
    updated_at: Option(String),
    contact_id: Option(Int),
    id: Option(Int),
    extended_attributes: Option(Nil),
    registry_owner_change: Option(Bool),
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

pub type Push {
  Push(
    created_at: Option(String),
    accepted_at: Option(String),
    account_id: Option(Int),
    domain_id: Option(Int),
    updated_at: Option(String),
    contact_id: Option(Int),
    id: Option(Int),
  )
}

pub type DomainTransferLock {
  DomainTransferLock(enabled: Option(Bool))
}

pub type EventTemplateApply {
  EventTemplateApply(zone: Option(Nil), template: Option(Nil))
}

pub type EventDomainCreate {
  EventDomainCreate(domain: Option(Nil))
}

pub type EventSubscriptionUnsubscribe {
  EventSubscriptionUnsubscribe(subscription: Option(Nil))
}

pub type EventSecondaryDnsdelete {
  EventSecondaryDnsdelete(configuration: Option(Nil))
}

pub type Template {
  Template(
    created_at: Option(String),
    name: Option(String),
    account_id: Option(Int),
    sid: Option(String),
    updated_at: Option(String),
    id: Option(Int),
    description: Option(String),
  )
}

pub type VanityNameServer {
  VanityNameServer(
    ipv4: Option(String),
    ipv6: Option(String),
    created_at: Option(String),
    name: Option(String),
    updated_at: Option(String),
    id: Option(Int),
  )
}

pub type OauthApplication {
  OauthApplication(
    created_at: Option(String),
    name: Option(String),
    updated_at: Option(String),
    id: Option(Int),
    description: Option(String),
    homepage_url: Option(String),
  )
}

pub type EventAccountAddUser {
  EventAccountAddUser(user: Option(Nil), account: Option(Nil))
}

pub type EventWebhookCreate {
  EventWebhookCreate(webhook: Option(Nil))
}

pub type EventDnssecrotationComplete {
  EventDnssecrotationComplete(
    dnssec: Option(Nil),
    delegation_signer_record: Option(Nil),
  )
}

pub type EventDomainRegistrantChange {
  EventDomainRegistrantChange(domain: Option(Nil), registrant: Option(Nil))
}

pub type ExtendedAttributeOption {
  ExtendedAttributeOption(
    value: Option(String),
    title: Option(String),
    description: Option(String),
  )
}

pub type EventDomainTransferStarted {
  EventDomainTransferStarted(domain: Option(Nil))
}

pub type WhoisPrivacyRenewal {
  WhoisPrivacyRenewal(
    enabled: Option(Bool),
    whois_privacy_id: Option(Int),
    created_at: Option(String),
    expires_on: Option(String),
    state: Option(String),
    domain_id: Option(Int),
    updated_at: Option(String),
    id: Option(Int),
  )
}

pub type EventDomainRegistrantChangeCancelled {
  EventDomainRegistrantChangeCancelled(
    domain: Option(Nil),
    registrant: Option(Nil),
  )
}

pub type EventSecondaryDnsupdate {
  EventSecondaryDnsupdate(configuration: Option(Nil))
}

pub type EventAccountPaymentDetailsUpdate {
  EventAccountPaymentDetailsUpdate(account: Option(Nil))
}

pub type EventOauthApplicationRevokeAccessTokens {
  EventOauthApplicationRevokeAccessTokens(oauth_application: Option(Nil))
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

pub type EventInvoiceCollect {
  EventInvoiceCollect(invoice: Option(Nil))
}

pub type Webhook {
  Webhook(url: Option(String), id: Option(Int), suppressed_at: Option(String))
}

pub type Certificate {
  Certificate(
    csr: Option(String),
    alternate_names: Option(List(String)),
    authority_identifier: Option(String),
    created_at: Option(String),
    expires_on: Option(String),
    name: Option(String),
    state: Option(String),
    domain_id: Option(Int),
    years: Option(Int),
    updated_at: Option(String),
    contact_id: Option(Int),
    id: Option(Int),
    auto_renew: Option(Bool),
    expires_at: Option(String),
    common_name: Option(String),
  )
}

pub type EventDomainTransferLockEnable {
  EventDomainTransferLockEnable(domain: Option(Nil))
}

pub type EventOauthApplicationResetClientSecret {
  EventOauthApplicationResetClientSecret(oauth_application: Option(Nil))
}

pub type WebhookAccount {
  WebhookAccount(
    display: Option(String),
    identifier: Option(String),
    id: Option(Int),
  )
}

pub type EventDomainDelegationChange {
  EventDomainDelegationChange(domain: Option(Nil), name_servers: Option(Nil))
}

pub type EventRecordDelete {
  EventRecordDelete(zone_record: Option(Nil))
}

pub type DomainPremiumPrice {
  DomainPremiumPrice(premium_price: Option(String), action: Option(String))
}

pub type EventSubscriptionRenew {
  EventSubscriptionRenew(subscription: Option(Nil))
}

pub type SecondaryDns {
  SecondaryDns(
    created_at: Option(String),
    zone_id: Option(String),
    whitelisted_ips: Option(List(String)),
    updated_at: Option(String),
    id: Option(Int),
    name_servers: Option(List(String)),
  )
}

pub type Service {
  Service(
    settings: Option(Nil),
    default_subdomain: Option(String),
    created_at: Option(String),
    name: Option(String),
    requires_setup: Option(Bool),
    sid: Option(String),
    updated_at: Option(String),
    setup_description: Option(String),
    id: Option(Int),
    description: Option(String),
  )
}

pub type Actor {
  Actor(identifier: Option(String), pretty: Option(String), id: Option(Int))
}

pub type TradeExtendedAttributes {
  TradeExtendedAttributes
}

pub type Charge {
  Charge(
    items: Option(Nil),
    reference: Option(String),
    state: Option(String),
    total_amount: Option(String),
    invoiced_at: Option(String),
    balance_amount: Option(String),
  )
}

pub type EventAccountInvitationAccept {
  EventAccountInvitationAccept(
    account_invitation: Option(Nil),
    account: Option(Nil),
  )
}

pub type DomainRenewal {
  DomainRenewal(
    period: Option(Int),
    created_at: Option(String),
    state: Option(String),
    domain_id: Option(Int),
    updated_at: Option(String),
    id: Option(Int),
  )
}

pub type EventAccountBillingSettingsUpdate {
  EventAccountBillingSettingsUpdate(
    billing_settings: Option(Nil),
    account: Option(Nil),
  )
}

pub type EventDomainTransferLockDisable {
  EventDomainTransferLockDisable(domain: Option(Nil))
}

pub type EventSubscriptionMigrate {
  EventSubscriptionMigrate(subscription: Option(Nil))
}

pub type EventRecordUpdate {
  EventRecordUpdate(zone_record: Option(Nil))
}

pub type CertificatePrivateKey {
  CertificatePrivateKey(private_key: Option(String))
}

pub type EventSubscriptionSubscribe {
  EventSubscriptionSubscribe(subscription: Option(Nil))
}

pub type EventWhoisPrivacyRenew {
  EventWhoisPrivacyRenew(domain: Option(Nil), whois_privacy: Option(Nil))
}

pub type EventPushReject {
  EventPushReject(push: Option(Nil))
}

pub type DelegationSigner {
  DelegationSigner(
    digest: Option(String),
    public_key: Option(String),
    created_at: Option(String),
    algorithm: Option(String),
    digest_type: Option(String),
    domain_id: Option(Int),
    updated_at: Option(String),
    keytag: Option(String),
    id: Option(Int),
  )
}

pub type EventDomainRenewStarted {
  EventDomainRenewStarted(domain: Option(Nil), auto_: Option(Bool))
}

pub type EventZoneDelete {
  EventZoneDelete(zone: Option(Nil))
}

pub type EventDomainRestoreStarted {
  EventDomainRestoreStarted(domain: Option(Nil), auto_: Option(Bool))
}

pub type EventContactDelete {
  EventContactDelete(contact: Option(Nil))
}

pub type EventTemplateCreate {
  EventTemplateCreate(template: Option(Nil))
}

pub type EventAccountInvitationRemove {
  EventAccountInvitationRemove(
    account_invitation: Option(Nil),
    account: Option(Nil),
  )
}

pub type EventDomainRegisterCancelled {
  EventDomainRegisterCancelled(domain: Option(Nil))
}

pub type EventDomainRestore {
  EventDomainRestore(domain: Option(Nil), auto_: Option(Bool))
}

pub type EventTemplateRecordDelete {
  EventTemplateRecordDelete(template_record: Option(Nil))
}

pub type ZoneDistribution {
  ZoneDistribution(distributed: Option(Bool))
}

pub type EventOauthApplicationCreate {
  EventOauthApplicationCreate(oauth_application: Option(Nil))
}

pub type EventDomainRenew {
  EventDomainRenew(domain: Option(Nil), auto_: Option(Bool))
}

pub type DomainTransfer {
  DomainTransfer(
    created_at: Option(String),
    registrant_id: Option(Int),
    status_description: Option(String),
    state: Option(String),
    whois_privacy: Option(Bool),
    domain_id: Option(Int),
    updated_at: Option(String),
    id: Option(Int),
    auto_renew: Option(Bool),
  )
}

pub type EventContactUpdate {
  EventContactUpdate(contact: Option(Nil))
}

pub type EventCertificateAutoRenewalEnable {
  EventCertificateAutoRenewalEnable(certificate: Option(Nil))
}

pub type EventEmailForwardDelete {
  EventEmailForwardDelete(email_forward: Option(Nil))
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

pub type LetsencryptCertificateRenewal {
  LetsencryptCertificateRenewal(
    new_certificate_id: Option(Int),
    created_at: Option(String),
    state: Option(String),
    updated_at: Option(String),
    id: Option(Int),
    old_certificate_id: Option(Int),
    auto_renew: Option(Bool),
  )
}

pub type NameServer {
  NameServer(
    ipv4: Option(String),
    ipv6: Option(String),
    created_at: Option(String),
    name: Option(String),
    updated_at: Option(String),
    id: Option(Int),
  )
}

pub type EventDomainAutoRenewalEnable {
  EventDomainAutoRenewalEnable(domain: Option(Nil))
}

pub type EventWhoisPrivacyDisable {
  EventWhoisPrivacyDisable(domain: Option(Nil), whois_privacy: Option(Nil))
}

pub type EventPushInitiate {
  EventPushInitiate(push: Option(Nil))
}

pub type Invoice {
  Invoice(
    created_at: Option(String),
    updated_at: Option(String),
    invoice_number: Option(String),
    id: Option(Int),
  )
}

pub type Account {
  Account(
    created_at: Option(String),
    updated_at: Option(String),
    id: Option(Int),
    email: Option(String),
    plan_identifier: Option(String),
  )
}

pub type EventDnssecdelete {
  EventDnssecdelete(dnssec: Option(Nil))
}

pub type RegistrantChangeCheck {
  RegistrantChangeCheck(
    domain_id: Option(Int),
    contact_id: Option(Int),
    extended_attributes: Option(Nil),
    registry_owner_change: Option(Bool),
  )
}

pub type EventDomainResolutionEnable {
  EventDomainResolutionEnable(domain: Option(Nil))
}

pub type Zone {
  Zone(
    reverse: Option(Bool),
    active: Option(Bool),
    created_at: Option(String),
    name: Option(String),
    account_id: Option(Int),
    secondary: Option(Bool),
    last_transferred_at: Option(String),
    updated_at: Option(String),
    id: Option(Int),
  )
}

pub type EventEmailForwardUpdate {
  EventEmailForwardUpdate(email_forward: Option(Nil))
}

pub type Tld {
  Tld(
    minimum_registration: Option(Int),
    tld: Option(String),
    tld_type: Option(Int),
    transfer_enabled: Option(Bool),
    auto_renew_only: Option(Bool),
    whois_privacy: Option(Bool),
    idn: Option(Bool),
    dnssec_interface_type: Option(String),
    renewal_enabled: Option(Bool),
    registration_enabled: Option(Bool),
  )
}

pub type EventNameServerDeregister {
  EventNameServerDeregister(name_server: Option(Nil))
}

pub type User {
  User(
    created_at: Option(String),
    updated_at: Option(String),
    id: Option(Int),
    email: Option(String),
  )
}

pub type EventNameServerRegister {
  EventNameServerRegister(name_server: Option(Nil))
}

pub type TemplateRecord {
  TemplateRecord(
    template_id: Option(Int),
    priority: Option(Int),
    created_at: Option(String),
    name: Option(String),
    ttl: Option(Int),
    updated_at: Option(String),
    content: Option(String),
    type_: Option(String),
    id: Option(Int),
  )
}

pub type LetsencryptCertificatePurchase {
  LetsencryptCertificatePurchase(
    certificate_id: Option(Int),
    created_at: Option(String),
    state: Option(String),
    updated_at: Option(String),
    id: Option(Int),
    auto_renew: Option(Bool),
  )
}

pub type EventSecondaryDnscreate {
  EventSecondaryDnscreate(configuration: Option(Nil))
}

pub type DomainRestore {
  DomainRestore(
    created_at: Option(String),
    state: Option(String),
    domain_id: Option(Int),
    updated_at: Option(String),
    id: Option(Int),
  )
}

pub type EmailForward {
  EmailForward(
    created_at: Option(String),
    from: Option(String),
    destination_email: Option(String),
    alias_email: Option(String),
    domain_id: Option(Int),
    updated_at: Option(String),
    id: Option(Int),
    to: Option(String),
  )
}

pub type EventCertificateAutoRenewalFailed {
  EventCertificateAutoRenewalFailed(certificate: Option(Nil))
}

pub type EventDomainDelete {
  EventDomainDelete(domain: Option(Nil))
}

pub type EventDomainTransfer {
  EventDomainTransfer(domain: Option(Nil))
}

pub type EventCertificateReissue {
  EventCertificateReissue(certificate: Option(Nil))
}

pub type EventVanityEnable {
  EventVanityEnable(domain: Option(Nil))
}

pub type ZoneFile {
  ZoneFile(zone: Option(String))
}

pub type EventWebhookDelete {
  EventWebhookDelete(webhook: Option(Nil))
}

pub type Dnssec {
  Dnssec(
    enabled: Option(Bool),
    created_at: Option(String),
    updated_at: Option(String),
  )
}

pub type EventAccountInvitationCreate {
  EventAccountInvitationCreate(
    account_invitation: Option(Nil),
    account: Option(Nil),
  )
}

pub type EventDomainRegistrantChangeStarted {
  EventDomainRegistrantChangeStarted(
    domain: Option(Nil),
    registrant: Option(Nil),
  )
}

pub type Error {
  Error(message: Option(String))
}

pub type EventDomainTransferCancelled {
  EventDomainTransferCancelled(domain: Option(Nil))
}

pub type EventAccountInvitationResend {
  EventAccountInvitationResend(
    account_invitation: Option(Nil),
    account: Option(Nil),
  )
}

pub type EventRecordCreate {
  EventRecordCreate(zone_record: Option(Nil))
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

pub type AccountInvitation {
  AccountInvitation(
    invitation_accepted_at: Option(String),
    created_at: Option(String),
    account_id: Option(Int),
    invitation_sent_at: Option(String),
    updated_at: Option(String),
    token: Option(String),
    id: Option(Int),
    email: Option(String),
  )
}

pub type Collaborator {
  Collaborator(
    domain_name: Option(String),
    user_email: Option(String),
    created_at: Option(String),
    accepted_at: Option(String),
    user_id: Option(Int),
    domain_id: Option(Int),
    updated_at: Option(String),
    invitation: Option(Bool),
    id: Option(Int),
  )
}

pub type PrimaryServer {
  PrimaryServer(
    port: Option(Int),
    ip: Option(String),
    created_at: Option(String),
    name: Option(String),
    account_id: Option(Int),
    linked_secondary_zones: Option(List(String)),
    updated_at: Option(String),
    id: Option(Int),
  )
}

pub type Domain {
  Domain(
    created_at: Option(String),
    expires_on: Option(String),
    name: Option(String),
    private_whois: Option(Bool),
    account_id: Option(Int),
    unicode_name: Option(String),
    registrant_id: Option(Int),
    state: Option(String),
    updated_at: Option(String),
    id: Option(Int),
    auto_renew: Option(Bool),
    expires_at: Option(String),
  )
}

pub type EventVanityDisable {
  EventVanityDisable(domain: Option(Nil))
}

pub type ExtendedAttribute {
  ExtendedAttribute(
    name: Option(String),
    description: Option(String),
    options: Option(Nil),
    required: Option(Bool),
  )
}

pub type EventZoneCreate {
  EventZoneCreate(zone: Option(Nil))
}

pub type EventDnssecrotationStart {
  EventDnssecrotationStart(
    dnssec: Option(Nil),
    delegation_signer_record: Option(Nil),
  )
}

pub type EventAccountRemoveUser {
  EventAccountRemoveUser(user: Option(Nil), account: Option(Nil))
}

pub type EventContactCreate {
  EventContactCreate(contact: Option(Nil))
}

pub type EventDomainRenewCancelled {
  EventDomainRenewCancelled(domain: Option(Nil), auto_: Option(Bool))
}

pub type EventTemplateRecordCreate {
  EventTemplateRecordCreate(template_record: Option(Nil))
}

pub type DomainCheckResult {
  DomainCheckResult(
    domain: Option(String),
    available: Option(Bool),
    premium: Option(Bool),
  )
}

pub type EventDomainRestoreCancelled {
  EventDomainRestoreCancelled(domain: Option(Nil), auto_: Option(Bool))
}

pub type EventDomainRegister {
  EventDomainRegister(domain: Option(Nil))
}

pub type WhoisPrivacy {
  WhoisPrivacy(
    enabled: Option(Bool),
    created_at: Option(String),
    expires_on: Option(String),
    domain_id: Option(Int),
    updated_at: Option(String),
    id: Option(Int),
  )
}

pub type EventDomainRegisterStarted {
  EventDomainRegisterStarted(domain: Option(Nil))
}

pub type Contact {
  Contact(
    postal_code: Option(String),
    created_at: Option(String),
    city: Option(String),
    account_id: Option(Int),
    phone: Option(String),
    last_name: Option(String),
    label: Option(String),
    job_title: Option(String),
    country: Option(String),
    organization_name: Option(String),
    updated_at: Option(String),
    first_name: Option(String),
    id: Option(Int),
    email: Option(String),
    address1: Option(String),
    fax: Option(String),
    address2: Option(String),
    state_province: Option(String),
  )
}

pub const event_template_delete = EventTemplateDelete(template: None)

pub const certificate_download = CertificateDownload(
  chain: None,
  root: None,
  server: None,
)

pub const event_email_forward_create = EventEmailForwardCreate(
  email_forward: None,
)

pub const billing_settings = BillingSettings

pub const event_dnsseccreate = EventDnsseccreate(dnssec: None)

pub const event_oauth_application_delete = EventOauthApplicationDelete(
  oauth_application: None,
)

pub const event_domain_resolution_disable = EventDomainResolutionDisable(
  domain: None,
)

pub const domain_registration = DomainRegistration(
  period: None,
  created_at: None,
  registrant_id: None,
  state: None,
  whois_privacy: None,
  domain_id: None,
  updated_at: None,
  id: None,
  auto_renew: None,
)

pub const zone_record = ZoneRecord(
  system_record: None,
  priority: None,
  created_at: None,
  name: None,
  ttl: None,
  zone_id: None,
  parent_id: None,
  updated_at: None,
  content: None,
  type_: None,
  id: None,
  regions: None,
)

pub const event_template_update = EventTemplateUpdate(template: None)

pub const event_whois_privacy_enable = EventWhoisPrivacyEnable(
  domain: None,
  whois_privacy: None,
)

pub const event_certificate_remove_private_key = EventCertificateRemovePrivateKey(
  certificate: None,
)

pub const subscription = Subscription(
  plan_name: None,
  created_at: None,
  state: None,
  updated_at: None,
  id: None,
)

pub const event_domain_auto_renewal_disable = EventDomainAutoRenewalDisable(
  domain: None,
)

pub const event_oauth_application_update = EventOauthApplicationUpdate(
  oauth_application: None,
)

pub const event_push_accept = EventPushAccept(push: None)

pub const event_certificate_auto_renewal_disable = EventCertificateAutoRenewalDisable(
  certificate: None,
)

pub const event_account_update = EventAccountUpdate(account: None)

pub const event_certificate_issue = EventCertificateIssue(certificate: None)

pub const event_whois_privacy_purchase = EventWhoisPrivacyPurchase(
  domain: None,
  whois_privacy: None,
)

pub const service_setting = ServiceSetting(
  example: None,
  name: None,
  label: None,
  append: None,
  password: None,
  description: None,
)

pub const registrant_change = RegistrantChange(
  created_at: None,
  irt_lock_lifted_by: None,
  account_id: None,
  state: None,
  domain_id: None,
  updated_at: None,
  contact_id: None,
  id: None,
  extended_attributes: None,
  registry_owner_change: None,
)

pub const pagination = Pagination(
  total_pages: None,
  per_page: None,
  current_page: None,
  total_entries: None,
)

pub const push = Push(
  created_at: None,
  accepted_at: None,
  account_id: None,
  domain_id: None,
  updated_at: None,
  contact_id: None,
  id: None,
)

pub const domain_transfer_lock = DomainTransferLock(enabled: None)

pub const event_template_apply = EventTemplateApply(zone: None, template: None)

pub const event_domain_create = EventDomainCreate(domain: None)

pub const event_subscription_unsubscribe = EventSubscriptionUnsubscribe(
  subscription: None,
)

pub const event_secondary_dnsdelete = EventSecondaryDnsdelete(
  configuration: None,
)

pub const template = Template(
  created_at: None,
  name: None,
  account_id: None,
  sid: None,
  updated_at: None,
  id: None,
  description: None,
)

pub const vanity_name_server = VanityNameServer(
  ipv4: None,
  ipv6: None,
  created_at: None,
  name: None,
  updated_at: None,
  id: None,
)

pub const oauth_application = OauthApplication(
  created_at: None,
  name: None,
  updated_at: None,
  id: None,
  description: None,
  homepage_url: None,
)

pub const event_account_add_user = EventAccountAddUser(
  user: None,
  account: None,
)

pub const event_webhook_create = EventWebhookCreate(webhook: None)

pub const event_dnssecrotation_complete = EventDnssecrotationComplete(
  dnssec: None,
  delegation_signer_record: None,
)

pub const event_domain_registrant_change = EventDomainRegistrantChange(
  domain: None,
  registrant: None,
)

pub const extended_attribute_option = ExtendedAttributeOption(
  value: None,
  title: None,
  description: None,
)

pub const event_domain_transfer_started = EventDomainTransferStarted(
  domain: None,
)

pub const whois_privacy_renewal = WhoisPrivacyRenewal(
  enabled: None,
  whois_privacy_id: None,
  created_at: None,
  expires_on: None,
  state: None,
  domain_id: None,
  updated_at: None,
  id: None,
)

pub const event_domain_registrant_change_cancelled = EventDomainRegistrantChangeCancelled(
  domain: None,
  registrant: None,
)

pub const event_secondary_dnsupdate = EventSecondaryDnsupdate(
  configuration: None,
)

pub const event_account_payment_details_update = EventAccountPaymentDetailsUpdate(
  account: None,
)

pub const event_oauth_application_revoke_access_tokens = EventOauthApplicationRevokeAccessTokens(
  oauth_application: None,
)

pub const webhook_payload = WebhookPayload(
  data: None,
  name: None,
  account: None,
  api_version: None,
  actor: None,
  request_identifier: None,
)

pub const event_invoice_collect = EventInvoiceCollect(invoice: None)

pub const webhook = Webhook(url: None, id: None, suppressed_at: None)

pub const certificate = Certificate(
  csr: None,
  alternate_names: None,
  authority_identifier: None,
  created_at: None,
  expires_on: None,
  name: None,
  state: None,
  domain_id: None,
  years: None,
  updated_at: None,
  contact_id: None,
  id: None,
  auto_renew: None,
  expires_at: None,
  common_name: None,
)

pub const event_domain_transfer_lock_enable = EventDomainTransferLockEnable(
  domain: None,
)

pub const event_oauth_application_reset_client_secret = EventOauthApplicationResetClientSecret(
  oauth_application: None,
)

pub const webhook_account = WebhookAccount(
  display: None,
  identifier: None,
  id: None,
)

pub const event_domain_delegation_change = EventDomainDelegationChange(
  domain: None,
  name_servers: None,
)

pub const event_record_delete = EventRecordDelete(zone_record: None)

pub const domain_premium_price = DomainPremiumPrice(
  premium_price: None,
  action: None,
)

pub const event_subscription_renew = EventSubscriptionRenew(subscription: None)

pub const secondary_dns = SecondaryDns(
  created_at: None,
  zone_id: None,
  whitelisted_ips: None,
  updated_at: None,
  id: None,
  name_servers: None,
)

pub const service = Service(
  settings: None,
  default_subdomain: None,
  created_at: None,
  name: None,
  requires_setup: None,
  sid: None,
  updated_at: None,
  setup_description: None,
  id: None,
  description: None,
)

pub const actor = Actor(identifier: None, pretty: None, id: None)

pub const trade_extended_attributes = TradeExtendedAttributes

pub const charge = Charge(
  items: None,
  reference: None,
  state: None,
  total_amount: None,
  invoiced_at: None,
  balance_amount: None,
)

pub const event_account_invitation_accept = EventAccountInvitationAccept(
  account_invitation: None,
  account: None,
)

pub const domain_renewal = DomainRenewal(
  period: None,
  created_at: None,
  state: None,
  domain_id: None,
  updated_at: None,
  id: None,
)

pub const event_account_billing_settings_update = EventAccountBillingSettingsUpdate(
  billing_settings: None,
  account: None,
)

pub const event_domain_transfer_lock_disable = EventDomainTransferLockDisable(
  domain: None,
)

pub const event_subscription_migrate = EventSubscriptionMigrate(
  subscription: None,
)

pub const event_record_update = EventRecordUpdate(zone_record: None)

pub const certificate_private_key = CertificatePrivateKey(private_key: None)

pub const event_subscription_subscribe = EventSubscriptionSubscribe(
  subscription: None,
)

pub const event_whois_privacy_renew = EventWhoisPrivacyRenew(
  domain: None,
  whois_privacy: None,
)

pub const event_push_reject = EventPushReject(push: None)

pub const delegation_signer = DelegationSigner(
  digest: None,
  public_key: None,
  created_at: None,
  algorithm: None,
  digest_type: None,
  domain_id: None,
  updated_at: None,
  keytag: None,
  id: None,
)

pub const event_domain_renew_started = EventDomainRenewStarted(
  domain: None,
  auto_: None,
)

pub const event_zone_delete = EventZoneDelete(zone: None)

pub const event_domain_restore_started = EventDomainRestoreStarted(
  domain: None,
  auto_: None,
)

pub const event_contact_delete = EventContactDelete(contact: None)

pub const event_template_create = EventTemplateCreate(template: None)

pub const event_account_invitation_remove = EventAccountInvitationRemove(
  account_invitation: None,
  account: None,
)

pub const event_domain_register_cancelled = EventDomainRegisterCancelled(
  domain: None,
)

pub const event_domain_restore = EventDomainRestore(domain: None, auto_: None)

pub const event_template_record_delete = EventTemplateRecordDelete(
  template_record: None,
)

pub const zone_distribution = ZoneDistribution(distributed: None)

pub const event_oauth_application_create = EventOauthApplicationCreate(
  oauth_application: None,
)

pub const event_domain_renew = EventDomainRenew(domain: None, auto_: None)

pub const domain_transfer = DomainTransfer(
  created_at: None,
  registrant_id: None,
  status_description: None,
  state: None,
  whois_privacy: None,
  domain_id: None,
  updated_at: None,
  id: None,
  auto_renew: None,
)

pub const event_contact_update = EventContactUpdate(contact: None)

pub const event_certificate_auto_renewal_enable = EventCertificateAutoRenewalEnable(
  certificate: None,
)

pub const event_email_forward_delete = EventEmailForwardDelete(
  email_forward: None,
)

pub const domain_prices = DomainPrices(
  renewal_price: None,
  registration_price: None,
  domain: None,
  transfer_price: None,
  premium: None,
  restore_price: None,
)

pub const letsencrypt_certificate_renewal = LetsencryptCertificateRenewal(
  new_certificate_id: None,
  created_at: None,
  state: None,
  updated_at: None,
  id: None,
  old_certificate_id: None,
  auto_renew: None,
)

pub const name_server = NameServer(
  ipv4: None,
  ipv6: None,
  created_at: None,
  name: None,
  updated_at: None,
  id: None,
)

pub const event_domain_auto_renewal_enable = EventDomainAutoRenewalEnable(
  domain: None,
)

pub const event_whois_privacy_disable = EventWhoisPrivacyDisable(
  domain: None,
  whois_privacy: None,
)

pub const event_push_initiate = EventPushInitiate(push: None)

pub const invoice = Invoice(
  created_at: None,
  updated_at: None,
  invoice_number: None,
  id: None,
)

pub const account = Account(
  created_at: None,
  updated_at: None,
  id: None,
  email: None,
  plan_identifier: None,
)

pub const event_dnssecdelete = EventDnssecdelete(dnssec: None)

pub const registrant_change_check = RegistrantChangeCheck(
  domain_id: None,
  contact_id: None,
  extended_attributes: None,
  registry_owner_change: None,
)

pub const event_domain_resolution_enable = EventDomainResolutionEnable(
  domain: None,
)

pub const zone = Zone(
  reverse: None,
  active: None,
  created_at: None,
  name: None,
  account_id: None,
  secondary: None,
  last_transferred_at: None,
  updated_at: None,
  id: None,
)

pub const event_email_forward_update = EventEmailForwardUpdate(
  email_forward: None,
)

pub const tld = Tld(
  minimum_registration: None,
  tld: None,
  tld_type: None,
  transfer_enabled: None,
  auto_renew_only: None,
  whois_privacy: None,
  idn: None,
  dnssec_interface_type: None,
  renewal_enabled: None,
  registration_enabled: None,
)

pub const event_name_server_deregister = EventNameServerDeregister(
  name_server: None,
)

pub const user = User(created_at: None, updated_at: None, id: None, email: None)

pub const event_name_server_register = EventNameServerRegister(
  name_server: None,
)

pub const template_record = TemplateRecord(
  template_id: None,
  priority: None,
  created_at: None,
  name: None,
  ttl: None,
  updated_at: None,
  content: None,
  type_: None,
  id: None,
)

pub const letsencrypt_certificate_purchase = LetsencryptCertificatePurchase(
  certificate_id: None,
  created_at: None,
  state: None,
  updated_at: None,
  id: None,
  auto_renew: None,
)

pub const event_secondary_dnscreate = EventSecondaryDnscreate(
  configuration: None,
)

pub const domain_restore = DomainRestore(
  created_at: None,
  state: None,
  domain_id: None,
  updated_at: None,
  id: None,
)

pub const email_forward = EmailForward(
  created_at: None,
  from: None,
  destination_email: None,
  alias_email: None,
  domain_id: None,
  updated_at: None,
  id: None,
  to: None,
)

pub const event_certificate_auto_renewal_failed = EventCertificateAutoRenewalFailed(
  certificate: None,
)

pub const event_domain_delete = EventDomainDelete(domain: None)

pub const event_domain_transfer = EventDomainTransfer(domain: None)

pub const event_certificate_reissue = EventCertificateReissue(certificate: None)

pub const event_vanity_enable = EventVanityEnable(domain: None)

pub const zone_file = ZoneFile(zone: None)

pub const event_webhook_delete = EventWebhookDelete(webhook: None)

pub const dnssec = Dnssec(enabled: None, created_at: None, updated_at: None)

pub const event_account_invitation_create = EventAccountInvitationCreate(
  account_invitation: None,
  account: None,
)

pub const event_domain_registrant_change_started = EventDomainRegistrantChangeStarted(
  domain: None,
  registrant: None,
)

pub const error = Error(message: None)

pub const event_domain_transfer_cancelled = EventDomainTransferCancelled(
  domain: None,
)

pub const event_account_invitation_resend = EventAccountInvitationResend(
  account_invitation: None,
  account: None,
)

pub const event_record_create = EventRecordCreate(zone_record: None)

pub const charge_item = ChargeItem(
  product_type: None,
  product_id: None,
  amount: None,
  product_reference: None,
  description: None,
)

pub const account_invitation = AccountInvitation(
  invitation_accepted_at: None,
  created_at: None,
  account_id: None,
  invitation_sent_at: None,
  updated_at: None,
  token: None,
  id: None,
  email: None,
)

pub const collaborator = Collaborator(
  domain_name: None,
  user_email: None,
  created_at: None,
  accepted_at: None,
  user_id: None,
  domain_id: None,
  updated_at: None,
  invitation: None,
  id: None,
)

pub const primary_server = PrimaryServer(
  port: None,
  ip: None,
  created_at: None,
  name: None,
  account_id: None,
  linked_secondary_zones: None,
  updated_at: None,
  id: None,
)

pub const domain = Domain(
  created_at: None,
  expires_on: None,
  name: None,
  private_whois: None,
  account_id: None,
  unicode_name: None,
  registrant_id: None,
  state: None,
  updated_at: None,
  id: None,
  auto_renew: None,
  expires_at: None,
)

pub const event_vanity_disable = EventVanityDisable(domain: None)

pub const extended_attribute = ExtendedAttribute(
  name: None,
  description: None,
  options: None,
  required: None,
)

pub const event_zone_create = EventZoneCreate(zone: None)

pub const event_dnssecrotation_start = EventDnssecrotationStart(
  dnssec: None,
  delegation_signer_record: None,
)

pub const event_account_remove_user = EventAccountRemoveUser(
  user: None,
  account: None,
)

pub const event_contact_create = EventContactCreate(contact: None)

pub const event_domain_renew_cancelled = EventDomainRenewCancelled(
  domain: None,
  auto_: None,
)

pub const event_template_record_create = EventTemplateRecordCreate(
  template_record: None,
)

pub const domain_check_result = DomainCheckResult(
  domain: None,
  available: None,
  premium: None,
)

pub const event_domain_restore_cancelled = EventDomainRestoreCancelled(
  domain: None,
  auto_: None,
)

pub const event_domain_register = EventDomainRegister(domain: None)

pub const whois_privacy = WhoisPrivacy(
  enabled: None,
  created_at: None,
  expires_on: None,
  domain_id: None,
  updated_at: None,
  id: None,
)

pub const event_domain_register_started = EventDomainRegisterStarted(
  domain: None,
)

pub const contact = Contact(
  postal_code: None,
  created_at: None,
  city: None,
  account_id: None,
  phone: None,
  last_name: None,
  label: None,
  job_title: None,
  country: None,
  organization_name: None,
  updated_at: None,
  first_name: None,
  id: None,
  email: None,
  address1: None,
  fax: None,
  address2: None,
  state_province: None,
)

pub fn event_template_delete_to_json(data: EventTemplateDelete) {
  json.object([#("template", json.null())])
}

pub fn event_template_delete_decoder() {
  use template <- zero.field("template", zero.optional(zero.success(Nil)))
  zero.success(EventTemplateDelete(template: template))
}

pub fn certificate_download_to_json(data: CertificateDownload) {
  json.object([
    #("chain", json.null()),
    #("root", json.nullable(data.root, json.string)),
    #("server", json.nullable(data.server, json.string)),
  ])
}

pub fn certificate_download_decoder() {
  use chain <- zero.field("chain", zero.optional(zero.list(zero.string)))
  use root <- zero.field("root", zero.optional(zero.string))
  use server <- zero.field("server", zero.optional(zero.string))
  zero.success(CertificateDownload(chain: chain, root: root, server: server))
}

pub fn event_email_forward_create_to_json(data: EventEmailForwardCreate) {
  json.object([#("email_forward", json.null())])
}

pub fn event_email_forward_create_decoder() {
  use email_forward <- zero.field(
    "email_forward",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventEmailForwardCreate(email_forward: email_forward))
}

pub fn billing_settings_to_json(data: BillingSettings) {
  json.object([])
}

pub fn billing_settings_decoder() {
  zero.success(BillingSettings)
}

pub fn event_dnsseccreate_to_json(data: EventDnsseccreate) {
  json.object([#("dnssec", json.null())])
}

pub fn event_dnsseccreate_decoder() {
  use dnssec <- zero.field("dnssec", zero.optional(zero.success(Nil)))
  zero.success(EventDnsseccreate(dnssec: dnssec))
}

pub fn event_oauth_application_delete_to_json(data: EventOauthApplicationDelete) {
  json.object([#("oauth_application", json.null())])
}

pub fn event_oauth_application_delete_decoder() {
  use oauth_application <- zero.field(
    "oauth_application",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventOauthApplicationDelete(oauth_application: oauth_application))
}

pub fn event_domain_resolution_disable_to_json(
  data: EventDomainResolutionDisable,
) {
  json.object([#("domain", json.null())])
}

pub fn event_domain_resolution_disable_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  zero.success(EventDomainResolutionDisable(domain: domain))
}

pub fn domain_registration_to_json(data: DomainRegistration) {
  json.object([
    #("period", json.nullable(data.period, json.int)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("registrant_id", json.nullable(data.registrant_id, json.int)),
    #("state", json.nullable(data.state, json.string)),
    #("whois_privacy", json.nullable(data.whois_privacy, json.bool)),
    #("domain_id", json.nullable(data.domain_id, json.int)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
    #("auto_renew", json.nullable(data.auto_renew, json.bool)),
  ])
}

pub fn domain_registration_decoder() {
  use period <- zero.field("period", zero.optional(zero.int))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use registrant_id <- zero.field("registrant_id", zero.optional(zero.int))
  use state <- zero.field("state", zero.optional(zero.string))
  use whois_privacy <- zero.field("whois_privacy", zero.optional(zero.bool))
  use domain_id <- zero.field("domain_id", zero.optional(zero.int))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  use auto_renew <- zero.field("auto_renew", zero.optional(zero.bool))
  zero.success(DomainRegistration(
    period: period,
    created_at: created_at,
    registrant_id: registrant_id,
    state: state,
    whois_privacy: whois_privacy,
    domain_id: domain_id,
    updated_at: updated_at,
    id: id,
    auto_renew: auto_renew,
  ))
}

pub fn zone_record_to_json(data: ZoneRecord) {
  json.object([
    #("system_record", json.nullable(data.system_record, json.bool)),
    #("priority", json.nullable(data.priority, json.int)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("ttl", json.nullable(data.ttl, json.int)),
    #("zone_id", json.nullable(data.zone_id, json.string)),
    #("parent_id", json.nullable(data.parent_id, json.int)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("content", json.nullable(data.content, json.string)),
    #("type", json.nullable(data.type_, json.string)),
    #("id", json.nullable(data.id, json.int)),
    #("regions", json.null()),
  ])
}

pub fn zone_record_decoder() {
  use system_record <- zero.field("system_record", zero.optional(zero.bool))
  use priority <- zero.field("priority", zero.optional(zero.int))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use ttl <- zero.field("ttl", zero.optional(zero.int))
  use zone_id <- zero.field("zone_id", zero.optional(zero.string))
  use parent_id <- zero.field("parent_id", zero.optional(zero.int))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use content <- zero.field("content", zero.optional(zero.string))
  use type_ <- zero.field("type", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  use regions <- zero.field("regions", zero.optional(zero.success(Nil)))
  zero.success(ZoneRecord(
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
  ))
}

pub fn event_template_update_to_json(data: EventTemplateUpdate) {
  json.object([#("template", json.null())])
}

pub fn event_template_update_decoder() {
  use template <- zero.field("template", zero.optional(zero.success(Nil)))
  zero.success(EventTemplateUpdate(template: template))
}

pub fn event_whois_privacy_enable_to_json(data: EventWhoisPrivacyEnable) {
  json.object([#("domain", json.null()), #("whois_privacy", json.null())])
}

pub fn event_whois_privacy_enable_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  use whois_privacy <- zero.field(
    "whois_privacy",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventWhoisPrivacyEnable(
    domain: domain,
    whois_privacy: whois_privacy,
  ))
}

pub fn event_certificate_remove_private_key_to_json(
  data: EventCertificateRemovePrivateKey,
) {
  json.object([#("certificate", json.null())])
}

pub fn event_certificate_remove_private_key_decoder() {
  use certificate <- zero.field("certificate", zero.optional(zero.success(Nil)))
  zero.success(EventCertificateRemovePrivateKey(certificate: certificate))
}

pub fn subscription_to_json(data: Subscription) {
  json.object([
    #("plan_name", json.nullable(data.plan_name, json.string)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("state", json.nullable(data.state, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
  ])
}

pub fn subscription_decoder() {
  use plan_name <- zero.field("plan_name", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use state <- zero.field("state", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  zero.success(Subscription(
    plan_name: plan_name,
    created_at: created_at,
    state: state,
    updated_at: updated_at,
    id: id,
  ))
}

pub fn event_domain_auto_renewal_disable_to_json(
  data: EventDomainAutoRenewalDisable,
) {
  json.object([#("domain", json.null())])
}

pub fn event_domain_auto_renewal_disable_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  zero.success(EventDomainAutoRenewalDisable(domain: domain))
}

pub fn event_oauth_application_update_to_json(data: EventOauthApplicationUpdate) {
  json.object([#("oauth_application", json.null())])
}

pub fn event_oauth_application_update_decoder() {
  use oauth_application <- zero.field(
    "oauth_application",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventOauthApplicationUpdate(oauth_application: oauth_application))
}

pub fn event_push_accept_to_json(data: EventPushAccept) {
  json.object([#("push", json.null())])
}

pub fn event_push_accept_decoder() {
  use push <- zero.field("push", zero.optional(zero.success(Nil)))
  zero.success(EventPushAccept(push: push))
}

pub fn event_certificate_auto_renewal_disable_to_json(
  data: EventCertificateAutoRenewalDisable,
) {
  json.object([#("certificate", json.null())])
}

pub fn event_certificate_auto_renewal_disable_decoder() {
  use certificate <- zero.field("certificate", zero.optional(zero.success(Nil)))
  zero.success(EventCertificateAutoRenewalDisable(certificate: certificate))
}

pub fn event_account_update_to_json(data: EventAccountUpdate) {
  json.object([#("account", json.null())])
}

pub fn event_account_update_decoder() {
  use account <- zero.field("account", zero.optional(zero.success(Nil)))
  zero.success(EventAccountUpdate(account: account))
}

pub fn event_certificate_issue_to_json(data: EventCertificateIssue) {
  json.object([#("certificate", json.null())])
}

pub fn event_certificate_issue_decoder() {
  use certificate <- zero.field("certificate", zero.optional(zero.success(Nil)))
  zero.success(EventCertificateIssue(certificate: certificate))
}

pub fn event_whois_privacy_purchase_to_json(data: EventWhoisPrivacyPurchase) {
  json.object([#("domain", json.null()), #("whois_privacy", json.null())])
}

pub fn event_whois_privacy_purchase_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  use whois_privacy <- zero.field(
    "whois_privacy",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventWhoisPrivacyPurchase(
    domain: domain,
    whois_privacy: whois_privacy,
  ))
}

pub fn service_setting_to_json(data: ServiceSetting) {
  json.object([
    #("example", json.nullable(data.example, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("label", json.nullable(data.label, json.string)),
    #("append", json.nullable(data.append, json.string)),
    #("password", json.nullable(data.password, json.bool)),
    #("description", json.nullable(data.description, json.string)),
  ])
}

pub fn service_setting_decoder() {
  use example <- zero.field("example", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use label <- zero.field("label", zero.optional(zero.string))
  use append <- zero.field("append", zero.optional(zero.string))
  use password <- zero.field("password", zero.optional(zero.bool))
  use description <- zero.field("description", zero.optional(zero.string))
  zero.success(ServiceSetting(
    example: example,
    name: name,
    label: label,
    append: append,
    password: password,
    description: description,
  ))
}

pub fn registrant_change_to_json(data: RegistrantChange) {
  json.object([
    #("created_at", json.nullable(data.created_at, json.string)),
    #("irt_lock_lifted_by", json.nullable(data.irt_lock_lifted_by, json.string)),
    #("account_id", json.nullable(data.account_id, json.int)),
    #("state", json.nullable(data.state, json.string)),
    #("domain_id", json.nullable(data.domain_id, json.int)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("contact_id", json.nullable(data.contact_id, json.int)),
    #("id", json.nullable(data.id, json.int)),
    #("extended_attributes", json.null()),
    #(
      "registry_owner_change",
      json.nullable(data.registry_owner_change, json.bool),
    ),
  ])
}

pub fn registrant_change_decoder() {
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use irt_lock_lifted_by <- zero.field(
    "irt_lock_lifted_by",
    zero.optional(zero.string),
  )
  use account_id <- zero.field("account_id", zero.optional(zero.int))
  use state <- zero.field("state", zero.optional(zero.string))
  use domain_id <- zero.field("domain_id", zero.optional(zero.int))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use contact_id <- zero.field("contact_id", zero.optional(zero.int))
  use id <- zero.field("id", zero.optional(zero.int))
  use extended_attributes <- zero.field(
    "extended_attributes",
    zero.optional(zero.success(Nil)),
  )
  use registry_owner_change <- zero.field(
    "registry_owner_change",
    zero.optional(zero.bool),
  )
  zero.success(RegistrantChange(
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
  ))
}

pub fn pagination_to_json(data: Pagination) {
  json.object([
    #("total_pages", json.nullable(data.total_pages, json.int)),
    #("per_page", json.nullable(data.per_page, json.int)),
    #("current_page", json.nullable(data.current_page, json.int)),
    #("total_entries", json.nullable(data.total_entries, json.int)),
  ])
}

pub fn pagination_decoder() {
  use total_pages <- zero.field("total_pages", zero.optional(zero.int))
  use per_page <- zero.field("per_page", zero.optional(zero.int))
  use current_page <- zero.field("current_page", zero.optional(zero.int))
  use total_entries <- zero.field("total_entries", zero.optional(zero.int))
  zero.success(Pagination(
    total_pages: total_pages,
    per_page: per_page,
    current_page: current_page,
    total_entries: total_entries,
  ))
}

pub fn push_to_json(data: Push) {
  json.object([
    #("created_at", json.nullable(data.created_at, json.string)),
    #("accepted_at", json.nullable(data.accepted_at, json.string)),
    #("account_id", json.nullable(data.account_id, json.int)),
    #("domain_id", json.nullable(data.domain_id, json.int)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("contact_id", json.nullable(data.contact_id, json.int)),
    #("id", json.nullable(data.id, json.int)),
  ])
}

pub fn push_decoder() {
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use accepted_at <- zero.field("accepted_at", zero.optional(zero.string))
  use account_id <- zero.field("account_id", zero.optional(zero.int))
  use domain_id <- zero.field("domain_id", zero.optional(zero.int))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use contact_id <- zero.field("contact_id", zero.optional(zero.int))
  use id <- zero.field("id", zero.optional(zero.int))
  zero.success(Push(
    created_at: created_at,
    accepted_at: accepted_at,
    account_id: account_id,
    domain_id: domain_id,
    updated_at: updated_at,
    contact_id: contact_id,
    id: id,
  ))
}

pub fn domain_transfer_lock_to_json(data: DomainTransferLock) {
  json.object([#("enabled", json.nullable(data.enabled, json.bool))])
}

pub fn domain_transfer_lock_decoder() {
  use enabled <- zero.field("enabled", zero.optional(zero.bool))
  zero.success(DomainTransferLock(enabled: enabled))
}

pub fn event_template_apply_to_json(data: EventTemplateApply) {
  json.object([#("zone", json.null()), #("template", json.null())])
}

pub fn event_template_apply_decoder() {
  use zone <- zero.field("zone", zero.optional(zero.success(Nil)))
  use template <- zero.field("template", zero.optional(zero.success(Nil)))
  zero.success(EventTemplateApply(zone: zone, template: template))
}

pub fn event_domain_create_to_json(data: EventDomainCreate) {
  json.object([#("domain", json.null())])
}

pub fn event_domain_create_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  zero.success(EventDomainCreate(domain: domain))
}

pub fn event_subscription_unsubscribe_to_json(
  data: EventSubscriptionUnsubscribe,
) {
  json.object([#("subscription", json.null())])
}

pub fn event_subscription_unsubscribe_decoder() {
  use subscription <- zero.field(
    "subscription",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventSubscriptionUnsubscribe(subscription: subscription))
}

pub fn event_secondary_dnsdelete_to_json(data: EventSecondaryDnsdelete) {
  json.object([#("configuration", json.null())])
}

pub fn event_secondary_dnsdelete_decoder() {
  use configuration <- zero.field(
    "configuration",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventSecondaryDnsdelete(configuration: configuration))
}

pub fn template_to_json(data: Template) {
  json.object([
    #("created_at", json.nullable(data.created_at, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("account_id", json.nullable(data.account_id, json.int)),
    #("sid", json.nullable(data.sid, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
    #("description", json.nullable(data.description, json.string)),
  ])
}

pub fn template_decoder() {
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use account_id <- zero.field("account_id", zero.optional(zero.int))
  use sid <- zero.field("sid", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  use description <- zero.field("description", zero.optional(zero.string))
  zero.success(Template(
    created_at: created_at,
    name: name,
    account_id: account_id,
    sid: sid,
    updated_at: updated_at,
    id: id,
    description: description,
  ))
}

pub fn vanity_name_server_to_json(data: VanityNameServer) {
  json.object([
    #("ipv4", json.nullable(data.ipv4, json.string)),
    #("ipv6", json.nullable(data.ipv6, json.string)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
  ])
}

pub fn vanity_name_server_decoder() {
  use ipv4 <- zero.field("ipv4", zero.optional(zero.string))
  use ipv6 <- zero.field("ipv6", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  zero.success(VanityNameServer(
    ipv4: ipv4,
    ipv6: ipv6,
    created_at: created_at,
    name: name,
    updated_at: updated_at,
    id: id,
  ))
}

pub fn oauth_application_to_json(data: OauthApplication) {
  json.object([
    #("created_at", json.nullable(data.created_at, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
    #("description", json.nullable(data.description, json.string)),
    #("homepage_url", json.nullable(data.homepage_url, json.string)),
  ])
}

pub fn oauth_application_decoder() {
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  use description <- zero.field("description", zero.optional(zero.string))
  use homepage_url <- zero.field("homepage_url", zero.optional(zero.string))
  zero.success(OauthApplication(
    created_at: created_at,
    name: name,
    updated_at: updated_at,
    id: id,
    description: description,
    homepage_url: homepage_url,
  ))
}

pub fn event_account_add_user_to_json(data: EventAccountAddUser) {
  json.object([#("user", json.null()), #("account", json.null())])
}

pub fn event_account_add_user_decoder() {
  use user <- zero.field("user", zero.optional(zero.success(Nil)))
  use account <- zero.field("account", zero.optional(zero.success(Nil)))
  zero.success(EventAccountAddUser(user: user, account: account))
}

pub fn event_webhook_create_to_json(data: EventWebhookCreate) {
  json.object([#("webhook", json.null())])
}

pub fn event_webhook_create_decoder() {
  use webhook <- zero.field("webhook", zero.optional(zero.success(Nil)))
  zero.success(EventWebhookCreate(webhook: webhook))
}

pub fn event_dnssecrotation_complete_to_json(data: EventDnssecrotationComplete) {
  json.object([
    #("dnssec", json.null()),
    #("delegation_signer_record", json.null()),
  ])
}

pub fn event_dnssecrotation_complete_decoder() {
  use dnssec <- zero.field("dnssec", zero.optional(zero.success(Nil)))
  use delegation_signer_record <- zero.field(
    "delegation_signer_record",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventDnssecrotationComplete(
    dnssec: dnssec,
    delegation_signer_record: delegation_signer_record,
  ))
}

pub fn event_domain_registrant_change_to_json(data: EventDomainRegistrantChange) {
  json.object([#("domain", json.null()), #("registrant", json.null())])
}

pub fn event_domain_registrant_change_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  use registrant <- zero.field("registrant", zero.optional(zero.success(Nil)))
  zero.success(EventDomainRegistrantChange(
    domain: domain,
    registrant: registrant,
  ))
}

pub fn extended_attribute_option_to_json(data: ExtendedAttributeOption) {
  json.object([
    #("value", json.nullable(data.value, json.string)),
    #("title", json.nullable(data.title, json.string)),
    #("description", json.nullable(data.description, json.string)),
  ])
}

pub fn extended_attribute_option_decoder() {
  use value <- zero.field("value", zero.optional(zero.string))
  use title <- zero.field("title", zero.optional(zero.string))
  use description <- zero.field("description", zero.optional(zero.string))
  zero.success(ExtendedAttributeOption(
    value: value,
    title: title,
    description: description,
  ))
}

pub fn event_domain_transfer_started_to_json(data: EventDomainTransferStarted) {
  json.object([#("domain", json.null())])
}

pub fn event_domain_transfer_started_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  zero.success(EventDomainTransferStarted(domain: domain))
}

pub fn whois_privacy_renewal_to_json(data: WhoisPrivacyRenewal) {
  json.object([
    #("enabled", json.nullable(data.enabled, json.bool)),
    #("whois_privacy_id", json.nullable(data.whois_privacy_id, json.int)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("expires_on", json.nullable(data.expires_on, json.string)),
    #("state", json.nullable(data.state, json.string)),
    #("domain_id", json.nullable(data.domain_id, json.int)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
  ])
}

pub fn whois_privacy_renewal_decoder() {
  use enabled <- zero.field("enabled", zero.optional(zero.bool))
  use whois_privacy_id <- zero.field(
    "whois_privacy_id",
    zero.optional(zero.int),
  )
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use expires_on <- zero.field("expires_on", zero.optional(zero.string))
  use state <- zero.field("state", zero.optional(zero.string))
  use domain_id <- zero.field("domain_id", zero.optional(zero.int))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  zero.success(WhoisPrivacyRenewal(
    enabled: enabled,
    whois_privacy_id: whois_privacy_id,
    created_at: created_at,
    expires_on: expires_on,
    state: state,
    domain_id: domain_id,
    updated_at: updated_at,
    id: id,
  ))
}

pub fn event_domain_registrant_change_cancelled_to_json(
  data: EventDomainRegistrantChangeCancelled,
) {
  json.object([#("domain", json.null()), #("registrant", json.null())])
}

pub fn event_domain_registrant_change_cancelled_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  use registrant <- zero.field("registrant", zero.optional(zero.success(Nil)))
  zero.success(EventDomainRegistrantChangeCancelled(
    domain: domain,
    registrant: registrant,
  ))
}

pub fn event_secondary_dnsupdate_to_json(data: EventSecondaryDnsupdate) {
  json.object([#("configuration", json.null())])
}

pub fn event_secondary_dnsupdate_decoder() {
  use configuration <- zero.field(
    "configuration",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventSecondaryDnsupdate(configuration: configuration))
}

pub fn event_account_payment_details_update_to_json(
  data: EventAccountPaymentDetailsUpdate,
) {
  json.object([#("account", json.null())])
}

pub fn event_account_payment_details_update_decoder() {
  use account <- zero.field("account", zero.optional(zero.success(Nil)))
  zero.success(EventAccountPaymentDetailsUpdate(account: account))
}

pub fn event_oauth_application_revoke_access_tokens_to_json(
  data: EventOauthApplicationRevokeAccessTokens,
) {
  json.object([#("oauth_application", json.null())])
}

pub fn event_oauth_application_revoke_access_tokens_decoder() {
  use oauth_application <- zero.field(
    "oauth_application",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventOauthApplicationRevokeAccessTokens(
    oauth_application: oauth_application,
  ))
}

pub fn webhook_payload_to_json(data: WebhookPayload) {
  json.object([
    #("data", json.null()),
    #("name", json.nullable(data.name, json.string)),
    #("account", json.null()),
    #("api_version", json.nullable(data.api_version, json.string)),
    #("actor", json.null()),
    #("request_identifier", json.nullable(data.request_identifier, json.string)),
  ])
}

pub fn webhook_payload_decoder() {
  use data <- zero.field("data", zero.optional(zero.success(Nil)))
  use name <- zero.field("name", zero.optional(zero.string))
  use account <- zero.field("account", zero.optional(zero.success(Nil)))
  use api_version <- zero.field("api_version", zero.optional(zero.string))
  use actor <- zero.field("actor", zero.optional(zero.success(Nil)))
  use request_identifier <- zero.field(
    "request_identifier",
    zero.optional(zero.string),
  )
  zero.success(WebhookPayload(
    data: data,
    name: name,
    account: account,
    api_version: api_version,
    actor: actor,
    request_identifier: request_identifier,
  ))
}

pub fn event_invoice_collect_to_json(data: EventInvoiceCollect) {
  json.object([#("invoice", json.null())])
}

pub fn event_invoice_collect_decoder() {
  use invoice <- zero.field("invoice", zero.optional(zero.success(Nil)))
  zero.success(EventInvoiceCollect(invoice: invoice))
}

pub fn webhook_to_json(data: Webhook) {
  json.object([
    #("url", json.nullable(data.url, json.string)),
    #("id", json.nullable(data.id, json.int)),
    #("suppressed_at", json.nullable(data.suppressed_at, json.string)),
  ])
}

pub fn webhook_decoder() {
  use url <- zero.field("url", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  use suppressed_at <- zero.field("suppressed_at", zero.optional(zero.string))
  zero.success(Webhook(url: url, id: id, suppressed_at: suppressed_at))
}

pub fn certificate_to_json(data: Certificate) {
  json.object([
    #("csr", json.nullable(data.csr, json.string)),
    #("alternate_names", json.null()),
    #(
      "authority_identifier",
      json.nullable(data.authority_identifier, json.string),
    ),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("expires_on", json.nullable(data.expires_on, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("state", json.nullable(data.state, json.string)),
    #("domain_id", json.nullable(data.domain_id, json.int)),
    #("years", json.nullable(data.years, json.int)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("contact_id", json.nullable(data.contact_id, json.int)),
    #("id", json.nullable(data.id, json.int)),
    #("auto_renew", json.nullable(data.auto_renew, json.bool)),
    #("expires_at", json.nullable(data.expires_at, json.string)),
    #("common_name", json.nullable(data.common_name, json.string)),
  ])
}

pub fn certificate_decoder() {
  use csr <- zero.field("csr", zero.optional(zero.string))
  use alternate_names <- zero.field(
    "alternate_names",
    zero.optional(zero.list(zero.string)),
  )
  use authority_identifier <- zero.field(
    "authority_identifier",
    zero.optional(zero.string),
  )
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use expires_on <- zero.field("expires_on", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use state <- zero.field("state", zero.optional(zero.string))
  use domain_id <- zero.field("domain_id", zero.optional(zero.int))
  use years <- zero.field("years", zero.optional(zero.int))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use contact_id <- zero.field("contact_id", zero.optional(zero.int))
  use id <- zero.field("id", zero.optional(zero.int))
  use auto_renew <- zero.field("auto_renew", zero.optional(zero.bool))
  use expires_at <- zero.field("expires_at", zero.optional(zero.string))
  use common_name <- zero.field("common_name", zero.optional(zero.string))
  zero.success(Certificate(
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
  ))
}

pub fn event_domain_transfer_lock_enable_to_json(
  data: EventDomainTransferLockEnable,
) {
  json.object([#("domain", json.null())])
}

pub fn event_domain_transfer_lock_enable_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  zero.success(EventDomainTransferLockEnable(domain: domain))
}

pub fn event_oauth_application_reset_client_secret_to_json(
  data: EventOauthApplicationResetClientSecret,
) {
  json.object([#("oauth_application", json.null())])
}

pub fn event_oauth_application_reset_client_secret_decoder() {
  use oauth_application <- zero.field(
    "oauth_application",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventOauthApplicationResetClientSecret(
    oauth_application: oauth_application,
  ))
}

pub fn webhook_account_to_json(data: WebhookAccount) {
  json.object([
    #("display", json.nullable(data.display, json.string)),
    #("identifier", json.nullable(data.identifier, json.string)),
    #("id", json.nullable(data.id, json.int)),
  ])
}

pub fn webhook_account_decoder() {
  use display <- zero.field("display", zero.optional(zero.string))
  use identifier <- zero.field("identifier", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  zero.success(WebhookAccount(display: display, identifier: identifier, id: id))
}

pub fn event_domain_delegation_change_to_json(data: EventDomainDelegationChange) {
  json.object([#("domain", json.null()), #("name_servers", json.null())])
}

pub fn event_domain_delegation_change_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  use name_servers <- zero.field(
    "name_servers",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventDomainDelegationChange(
    domain: domain,
    name_servers: name_servers,
  ))
}

pub fn event_record_delete_to_json(data: EventRecordDelete) {
  json.object([#("zone_record", json.null())])
}

pub fn event_record_delete_decoder() {
  use zone_record <- zero.field("zone_record", zero.optional(zero.success(Nil)))
  zero.success(EventRecordDelete(zone_record: zone_record))
}

pub fn domain_premium_price_to_json(data: DomainPremiumPrice) {
  json.object([
    #("premium_price", json.nullable(data.premium_price, json.string)),
    #("action", json.nullable(data.action, json.string)),
  ])
}

pub fn domain_premium_price_decoder() {
  use premium_price <- zero.field("premium_price", zero.optional(zero.string))
  use action <- zero.field("action", zero.optional(zero.string))
  zero.success(DomainPremiumPrice(premium_price: premium_price, action: action))
}

pub fn event_subscription_renew_to_json(data: EventSubscriptionRenew) {
  json.object([#("subscription", json.null())])
}

pub fn event_subscription_renew_decoder() {
  use subscription <- zero.field(
    "subscription",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventSubscriptionRenew(subscription: subscription))
}

pub fn secondary_dns_to_json(data: SecondaryDns) {
  json.object([
    #("created_at", json.nullable(data.created_at, json.string)),
    #("zone_id", json.nullable(data.zone_id, json.string)),
    #("whitelisted_ips", json.null()),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
    #("name_servers", json.null()),
  ])
}

pub fn secondary_dns_decoder() {
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use zone_id <- zero.field("zone_id", zero.optional(zero.string))
  use whitelisted_ips <- zero.field(
    "whitelisted_ips",
    zero.optional(zero.list(zero.string)),
  )
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  use name_servers <- zero.field(
    "name_servers",
    zero.optional(zero.list(zero.string)),
  )
  zero.success(SecondaryDns(
    created_at: created_at,
    zone_id: zone_id,
    whitelisted_ips: whitelisted_ips,
    updated_at: updated_at,
    id: id,
    name_servers: name_servers,
  ))
}

pub fn service_to_json(data: Service) {
  json.object([
    #("settings", json.null()),
    #("default_subdomain", json.nullable(data.default_subdomain, json.string)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("requires_setup", json.nullable(data.requires_setup, json.bool)),
    #("sid", json.nullable(data.sid, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("setup_description", json.nullable(data.setup_description, json.string)),
    #("id", json.nullable(data.id, json.int)),
    #("description", json.nullable(data.description, json.string)),
  ])
}

pub fn service_decoder() {
  use settings <- zero.field("settings", zero.optional(zero.success(Nil)))
  use default_subdomain <- zero.field(
    "default_subdomain",
    zero.optional(zero.string),
  )
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use requires_setup <- zero.field("requires_setup", zero.optional(zero.bool))
  use sid <- zero.field("sid", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use setup_description <- zero.field(
    "setup_description",
    zero.optional(zero.string),
  )
  use id <- zero.field("id", zero.optional(zero.int))
  use description <- zero.field("description", zero.optional(zero.string))
  zero.success(Service(
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
  ))
}

pub fn actor_to_json(data: Actor) {
  json.object([
    #("identifier", json.nullable(data.identifier, json.string)),
    #("pretty", json.nullable(data.pretty, json.string)),
    #("id", json.nullable(data.id, json.int)),
  ])
}

pub fn actor_decoder() {
  use identifier <- zero.field("identifier", zero.optional(zero.string))
  use pretty <- zero.field("pretty", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  zero.success(Actor(identifier: identifier, pretty: pretty, id: id))
}

pub fn trade_extended_attributes_to_json(data: TradeExtendedAttributes) {
  json.object([])
}

pub fn trade_extended_attributes_decoder() {
  zero.success(TradeExtendedAttributes)
}

pub fn charge_to_json(data: Charge) {
  json.object([
    #("items", json.null()),
    #("reference", json.nullable(data.reference, json.string)),
    #("state", json.nullable(data.state, json.string)),
    #("total_amount", json.nullable(data.total_amount, json.string)),
    #("invoiced_at", json.nullable(data.invoiced_at, json.string)),
    #("balance_amount", json.nullable(data.balance_amount, json.string)),
  ])
}

pub fn charge_decoder() {
  use items <- zero.field("items", zero.optional(zero.success(Nil)))
  use reference <- zero.field("reference", zero.optional(zero.string))
  use state <- zero.field("state", zero.optional(zero.string))
  use total_amount <- zero.field("total_amount", zero.optional(zero.string))
  use invoiced_at <- zero.field("invoiced_at", zero.optional(zero.string))
  use balance_amount <- zero.field("balance_amount", zero.optional(zero.string))
  zero.success(Charge(
    items: items,
    reference: reference,
    state: state,
    total_amount: total_amount,
    invoiced_at: invoiced_at,
    balance_amount: balance_amount,
  ))
}

pub fn event_account_invitation_accept_to_json(
  data: EventAccountInvitationAccept,
) {
  json.object([#("account_invitation", json.null()), #("account", json.null())])
}

pub fn event_account_invitation_accept_decoder() {
  use account_invitation <- zero.field(
    "account_invitation",
    zero.optional(zero.success(Nil)),
  )
  use account <- zero.field("account", zero.optional(zero.success(Nil)))
  zero.success(EventAccountInvitationAccept(
    account_invitation: account_invitation,
    account: account,
  ))
}

pub fn domain_renewal_to_json(data: DomainRenewal) {
  json.object([
    #("period", json.nullable(data.period, json.int)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("state", json.nullable(data.state, json.string)),
    #("domain_id", json.nullable(data.domain_id, json.int)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
  ])
}

pub fn domain_renewal_decoder() {
  use period <- zero.field("period", zero.optional(zero.int))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use state <- zero.field("state", zero.optional(zero.string))
  use domain_id <- zero.field("domain_id", zero.optional(zero.int))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  zero.success(DomainRenewal(
    period: period,
    created_at: created_at,
    state: state,
    domain_id: domain_id,
    updated_at: updated_at,
    id: id,
  ))
}

pub fn event_account_billing_settings_update_to_json(
  data: EventAccountBillingSettingsUpdate,
) {
  json.object([#("billing_settings", json.null()), #("account", json.null())])
}

pub fn event_account_billing_settings_update_decoder() {
  use billing_settings <- zero.field(
    "billing_settings",
    zero.optional(zero.success(Nil)),
  )
  use account <- zero.field("account", zero.optional(zero.success(Nil)))
  zero.success(EventAccountBillingSettingsUpdate(
    billing_settings: billing_settings,
    account: account,
  ))
}

pub fn event_domain_transfer_lock_disable_to_json(
  data: EventDomainTransferLockDisable,
) {
  json.object([#("domain", json.null())])
}

pub fn event_domain_transfer_lock_disable_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  zero.success(EventDomainTransferLockDisable(domain: domain))
}

pub fn event_subscription_migrate_to_json(data: EventSubscriptionMigrate) {
  json.object([#("subscription", json.null())])
}

pub fn event_subscription_migrate_decoder() {
  use subscription <- zero.field(
    "subscription",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventSubscriptionMigrate(subscription: subscription))
}

pub fn event_record_update_to_json(data: EventRecordUpdate) {
  json.object([#("zone_record", json.null())])
}

pub fn event_record_update_decoder() {
  use zone_record <- zero.field("zone_record", zero.optional(zero.success(Nil)))
  zero.success(EventRecordUpdate(zone_record: zone_record))
}

pub fn certificate_private_key_to_json(data: CertificatePrivateKey) {
  json.object([#("private_key", json.nullable(data.private_key, json.string))])
}

pub fn certificate_private_key_decoder() {
  use private_key <- zero.field("private_key", zero.optional(zero.string))
  zero.success(CertificatePrivateKey(private_key: private_key))
}

pub fn event_subscription_subscribe_to_json(data: EventSubscriptionSubscribe) {
  json.object([#("subscription", json.null())])
}

pub fn event_subscription_subscribe_decoder() {
  use subscription <- zero.field(
    "subscription",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventSubscriptionSubscribe(subscription: subscription))
}

pub fn event_whois_privacy_renew_to_json(data: EventWhoisPrivacyRenew) {
  json.object([#("domain", json.null()), #("whois_privacy", json.null())])
}

pub fn event_whois_privacy_renew_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  use whois_privacy <- zero.field(
    "whois_privacy",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventWhoisPrivacyRenew(
    domain: domain,
    whois_privacy: whois_privacy,
  ))
}

pub fn event_push_reject_to_json(data: EventPushReject) {
  json.object([#("push", json.null())])
}

pub fn event_push_reject_decoder() {
  use push <- zero.field("push", zero.optional(zero.success(Nil)))
  zero.success(EventPushReject(push: push))
}

pub fn delegation_signer_to_json(data: DelegationSigner) {
  json.object([
    #("digest", json.nullable(data.digest, json.string)),
    #("public_key", json.nullable(data.public_key, json.string)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("algorithm", json.nullable(data.algorithm, json.string)),
    #("digest_type", json.nullable(data.digest_type, json.string)),
    #("domain_id", json.nullable(data.domain_id, json.int)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("keytag", json.nullable(data.keytag, json.string)),
    #("id", json.nullable(data.id, json.int)),
  ])
}

pub fn delegation_signer_decoder() {
  use digest <- zero.field("digest", zero.optional(zero.string))
  use public_key <- zero.field("public_key", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use algorithm <- zero.field("algorithm", zero.optional(zero.string))
  use digest_type <- zero.field("digest_type", zero.optional(zero.string))
  use domain_id <- zero.field("domain_id", zero.optional(zero.int))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use keytag <- zero.field("keytag", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  zero.success(DelegationSigner(
    digest: digest,
    public_key: public_key,
    created_at: created_at,
    algorithm: algorithm,
    digest_type: digest_type,
    domain_id: domain_id,
    updated_at: updated_at,
    keytag: keytag,
    id: id,
  ))
}

pub fn event_domain_renew_started_to_json(data: EventDomainRenewStarted) {
  json.object([
    #("domain", json.null()),
    #("auto", json.nullable(data.auto_, json.bool)),
  ])
}

pub fn event_domain_renew_started_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  use auto_ <- zero.field("auto", zero.optional(zero.bool))
  zero.success(EventDomainRenewStarted(domain: domain, auto_: auto_))
}

pub fn event_zone_delete_to_json(data: EventZoneDelete) {
  json.object([#("zone", json.null())])
}

pub fn event_zone_delete_decoder() {
  use zone <- zero.field("zone", zero.optional(zero.success(Nil)))
  zero.success(EventZoneDelete(zone: zone))
}

pub fn event_domain_restore_started_to_json(data: EventDomainRestoreStarted) {
  json.object([
    #("domain", json.null()),
    #("auto", json.nullable(data.auto_, json.bool)),
  ])
}

pub fn event_domain_restore_started_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  use auto_ <- zero.field("auto", zero.optional(zero.bool))
  zero.success(EventDomainRestoreStarted(domain: domain, auto_: auto_))
}

pub fn event_contact_delete_to_json(data: EventContactDelete) {
  json.object([#("contact", json.null())])
}

pub fn event_contact_delete_decoder() {
  use contact <- zero.field("contact", zero.optional(zero.success(Nil)))
  zero.success(EventContactDelete(contact: contact))
}

pub fn event_template_create_to_json(data: EventTemplateCreate) {
  json.object([#("template", json.null())])
}

pub fn event_template_create_decoder() {
  use template <- zero.field("template", zero.optional(zero.success(Nil)))
  zero.success(EventTemplateCreate(template: template))
}

pub fn event_account_invitation_remove_to_json(
  data: EventAccountInvitationRemove,
) {
  json.object([#("account_invitation", json.null()), #("account", json.null())])
}

pub fn event_account_invitation_remove_decoder() {
  use account_invitation <- zero.field(
    "account_invitation",
    zero.optional(zero.success(Nil)),
  )
  use account <- zero.field("account", zero.optional(zero.success(Nil)))
  zero.success(EventAccountInvitationRemove(
    account_invitation: account_invitation,
    account: account,
  ))
}

pub fn event_domain_register_cancelled_to_json(
  data: EventDomainRegisterCancelled,
) {
  json.object([#("domain", json.null())])
}

pub fn event_domain_register_cancelled_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  zero.success(EventDomainRegisterCancelled(domain: domain))
}

pub fn event_domain_restore_to_json(data: EventDomainRestore) {
  json.object([
    #("domain", json.null()),
    #("auto", json.nullable(data.auto_, json.bool)),
  ])
}

pub fn event_domain_restore_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  use auto_ <- zero.field("auto", zero.optional(zero.bool))
  zero.success(EventDomainRestore(domain: domain, auto_: auto_))
}

pub fn event_template_record_delete_to_json(data: EventTemplateRecordDelete) {
  json.object([#("template_record", json.null())])
}

pub fn event_template_record_delete_decoder() {
  use template_record <- zero.field(
    "template_record",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventTemplateRecordDelete(template_record: template_record))
}

pub fn zone_distribution_to_json(data: ZoneDistribution) {
  json.object([#("distributed", json.nullable(data.distributed, json.bool))])
}

pub fn zone_distribution_decoder() {
  use distributed <- zero.field("distributed", zero.optional(zero.bool))
  zero.success(ZoneDistribution(distributed: distributed))
}

pub fn event_oauth_application_create_to_json(data: EventOauthApplicationCreate) {
  json.object([#("oauth_application", json.null())])
}

pub fn event_oauth_application_create_decoder() {
  use oauth_application <- zero.field(
    "oauth_application",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventOauthApplicationCreate(oauth_application: oauth_application))
}

pub fn event_domain_renew_to_json(data: EventDomainRenew) {
  json.object([
    #("domain", json.null()),
    #("auto", json.nullable(data.auto_, json.bool)),
  ])
}

pub fn event_domain_renew_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  use auto_ <- zero.field("auto", zero.optional(zero.bool))
  zero.success(EventDomainRenew(domain: domain, auto_: auto_))
}

pub fn domain_transfer_to_json(data: DomainTransfer) {
  json.object([
    #("created_at", json.nullable(data.created_at, json.string)),
    #("registrant_id", json.nullable(data.registrant_id, json.int)),
    #("status_description", json.nullable(data.status_description, json.string)),
    #("state", json.nullable(data.state, json.string)),
    #("whois_privacy", json.nullable(data.whois_privacy, json.bool)),
    #("domain_id", json.nullable(data.domain_id, json.int)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
    #("auto_renew", json.nullable(data.auto_renew, json.bool)),
  ])
}

pub fn domain_transfer_decoder() {
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use registrant_id <- zero.field("registrant_id", zero.optional(zero.int))
  use status_description <- zero.field(
    "status_description",
    zero.optional(zero.string),
  )
  use state <- zero.field("state", zero.optional(zero.string))
  use whois_privacy <- zero.field("whois_privacy", zero.optional(zero.bool))
  use domain_id <- zero.field("domain_id", zero.optional(zero.int))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  use auto_renew <- zero.field("auto_renew", zero.optional(zero.bool))
  zero.success(DomainTransfer(
    created_at: created_at,
    registrant_id: registrant_id,
    status_description: status_description,
    state: state,
    whois_privacy: whois_privacy,
    domain_id: domain_id,
    updated_at: updated_at,
    id: id,
    auto_renew: auto_renew,
  ))
}

pub fn event_contact_update_to_json(data: EventContactUpdate) {
  json.object([#("contact", json.null())])
}

pub fn event_contact_update_decoder() {
  use contact <- zero.field("contact", zero.optional(zero.success(Nil)))
  zero.success(EventContactUpdate(contact: contact))
}

pub fn event_certificate_auto_renewal_enable_to_json(
  data: EventCertificateAutoRenewalEnable,
) {
  json.object([#("certificate", json.null())])
}

pub fn event_certificate_auto_renewal_enable_decoder() {
  use certificate <- zero.field("certificate", zero.optional(zero.success(Nil)))
  zero.success(EventCertificateAutoRenewalEnable(certificate: certificate))
}

pub fn event_email_forward_delete_to_json(data: EventEmailForwardDelete) {
  json.object([#("email_forward", json.null())])
}

pub fn event_email_forward_delete_decoder() {
  use email_forward <- zero.field(
    "email_forward",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventEmailForwardDelete(email_forward: email_forward))
}

pub fn domain_prices_to_json(data: DomainPrices) {
  json.object([
    #("renewal_price", json.nullable(data.renewal_price, json.float)),
    #("registration_price", json.nullable(data.registration_price, json.float)),
    #("domain", json.nullable(data.domain, json.string)),
    #("transfer_price", json.nullable(data.transfer_price, json.float)),
    #("premium", json.nullable(data.premium, json.bool)),
    #("restore_price", json.nullable(data.restore_price, json.float)),
  ])
}

pub fn domain_prices_decoder() {
  use renewal_price <- zero.field("renewal_price", zero.optional(zero.float))
  use registration_price <- zero.field(
    "registration_price",
    zero.optional(zero.float),
  )
  use domain <- zero.field("domain", zero.optional(zero.string))
  use transfer_price <- zero.field("transfer_price", zero.optional(zero.float))
  use premium <- zero.field("premium", zero.optional(zero.bool))
  use restore_price <- zero.field("restore_price", zero.optional(zero.float))
  zero.success(DomainPrices(
    renewal_price: renewal_price,
    registration_price: registration_price,
    domain: domain,
    transfer_price: transfer_price,
    premium: premium,
    restore_price: restore_price,
  ))
}

pub fn letsencrypt_certificate_renewal_to_json(
  data: LetsencryptCertificateRenewal,
) {
  json.object([
    #("new_certificate_id", json.nullable(data.new_certificate_id, json.int)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("state", json.nullable(data.state, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
    #("old_certificate_id", json.nullable(data.old_certificate_id, json.int)),
    #("auto_renew", json.nullable(data.auto_renew, json.bool)),
  ])
}

pub fn letsencrypt_certificate_renewal_decoder() {
  use new_certificate_id <- zero.field(
    "new_certificate_id",
    zero.optional(zero.int),
  )
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use state <- zero.field("state", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  use old_certificate_id <- zero.field(
    "old_certificate_id",
    zero.optional(zero.int),
  )
  use auto_renew <- zero.field("auto_renew", zero.optional(zero.bool))
  zero.success(LetsencryptCertificateRenewal(
    new_certificate_id: new_certificate_id,
    created_at: created_at,
    state: state,
    updated_at: updated_at,
    id: id,
    old_certificate_id: old_certificate_id,
    auto_renew: auto_renew,
  ))
}

pub fn name_server_to_json(data: NameServer) {
  json.object([
    #("ipv4", json.nullable(data.ipv4, json.string)),
    #("ipv6", json.nullable(data.ipv6, json.string)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
  ])
}

pub fn name_server_decoder() {
  use ipv4 <- zero.field("ipv4", zero.optional(zero.string))
  use ipv6 <- zero.field("ipv6", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  zero.success(NameServer(
    ipv4: ipv4,
    ipv6: ipv6,
    created_at: created_at,
    name: name,
    updated_at: updated_at,
    id: id,
  ))
}

pub fn event_domain_auto_renewal_enable_to_json(
  data: EventDomainAutoRenewalEnable,
) {
  json.object([#("domain", json.null())])
}

pub fn event_domain_auto_renewal_enable_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  zero.success(EventDomainAutoRenewalEnable(domain: domain))
}

pub fn event_whois_privacy_disable_to_json(data: EventWhoisPrivacyDisable) {
  json.object([#("domain", json.null()), #("whois_privacy", json.null())])
}

pub fn event_whois_privacy_disable_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  use whois_privacy <- zero.field(
    "whois_privacy",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventWhoisPrivacyDisable(
    domain: domain,
    whois_privacy: whois_privacy,
  ))
}

pub fn event_push_initiate_to_json(data: EventPushInitiate) {
  json.object([#("push", json.null())])
}

pub fn event_push_initiate_decoder() {
  use push <- zero.field("push", zero.optional(zero.success(Nil)))
  zero.success(EventPushInitiate(push: push))
}

pub fn invoice_to_json(data: Invoice) {
  json.object([
    #("created_at", json.nullable(data.created_at, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("invoice_number", json.nullable(data.invoice_number, json.string)),
    #("id", json.nullable(data.id, json.int)),
  ])
}

pub fn invoice_decoder() {
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use invoice_number <- zero.field("invoice_number", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  zero.success(Invoice(
    created_at: created_at,
    updated_at: updated_at,
    invoice_number: invoice_number,
    id: id,
  ))
}

pub fn account_to_json(data: Account) {
  json.object([
    #("created_at", json.nullable(data.created_at, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
    #("email", json.nullable(data.email, json.string)),
    #("plan_identifier", json.nullable(data.plan_identifier, json.string)),
  ])
}

pub fn account_decoder() {
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  use email <- zero.field("email", zero.optional(zero.string))
  use plan_identifier <- zero.field(
    "plan_identifier",
    zero.optional(zero.string),
  )
  zero.success(Account(
    created_at: created_at,
    updated_at: updated_at,
    id: id,
    email: email,
    plan_identifier: plan_identifier,
  ))
}

pub fn event_dnssecdelete_to_json(data: EventDnssecdelete) {
  json.object([#("dnssec", json.null())])
}

pub fn event_dnssecdelete_decoder() {
  use dnssec <- zero.field("dnssec", zero.optional(zero.success(Nil)))
  zero.success(EventDnssecdelete(dnssec: dnssec))
}

pub fn registrant_change_check_to_json(data: RegistrantChangeCheck) {
  json.object([
    #("domain_id", json.nullable(data.domain_id, json.int)),
    #("contact_id", json.nullable(data.contact_id, json.int)),
    #("extended_attributes", json.null()),
    #(
      "registry_owner_change",
      json.nullable(data.registry_owner_change, json.bool),
    ),
  ])
}

pub fn registrant_change_check_decoder() {
  use domain_id <- zero.field("domain_id", zero.optional(zero.int))
  use contact_id <- zero.field("contact_id", zero.optional(zero.int))
  use extended_attributes <- zero.field(
    "extended_attributes",
    zero.optional(zero.success(Nil)),
  )
  use registry_owner_change <- zero.field(
    "registry_owner_change",
    zero.optional(zero.bool),
  )
  zero.success(RegistrantChangeCheck(
    domain_id: domain_id,
    contact_id: contact_id,
    extended_attributes: extended_attributes,
    registry_owner_change: registry_owner_change,
  ))
}

pub fn event_domain_resolution_enable_to_json(data: EventDomainResolutionEnable) {
  json.object([#("domain", json.null())])
}

pub fn event_domain_resolution_enable_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  zero.success(EventDomainResolutionEnable(domain: domain))
}

pub fn zone_to_json(data: Zone) {
  json.object([
    #("reverse", json.nullable(data.reverse, json.bool)),
    #("active", json.nullable(data.active, json.bool)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("account_id", json.nullable(data.account_id, json.int)),
    #("secondary", json.nullable(data.secondary, json.bool)),
    #(
      "last_transferred_at",
      json.nullable(data.last_transferred_at, json.string),
    ),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
  ])
}

pub fn zone_decoder() {
  use reverse <- zero.field("reverse", zero.optional(zero.bool))
  use active <- zero.field("active", zero.optional(zero.bool))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use account_id <- zero.field("account_id", zero.optional(zero.int))
  use secondary <- zero.field("secondary", zero.optional(zero.bool))
  use last_transferred_at <- zero.field(
    "last_transferred_at",
    zero.optional(zero.string),
  )
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  zero.success(Zone(
    reverse: reverse,
    active: active,
    created_at: created_at,
    name: name,
    account_id: account_id,
    secondary: secondary,
    last_transferred_at: last_transferred_at,
    updated_at: updated_at,
    id: id,
  ))
}

pub fn event_email_forward_update_to_json(data: EventEmailForwardUpdate) {
  json.object([#("email_forward", json.null())])
}

pub fn event_email_forward_update_decoder() {
  use email_forward <- zero.field(
    "email_forward",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventEmailForwardUpdate(email_forward: email_forward))
}

pub fn tld_to_json(data: Tld) {
  json.object([
    #(
      "minimum_registration",
      json.nullable(data.minimum_registration, json.int),
    ),
    #("tld", json.nullable(data.tld, json.string)),
    #("tld_type", json.nullable(data.tld_type, json.int)),
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
    ),
  ])
}

pub fn tld_decoder() {
  use minimum_registration <- zero.field(
    "minimum_registration",
    zero.optional(zero.int),
  )
  use tld <- zero.field("tld", zero.optional(zero.string))
  use tld_type <- zero.field("tld_type", zero.optional(zero.int))
  use transfer_enabled <- zero.field(
    "transfer_enabled",
    zero.optional(zero.bool),
  )
  use auto_renew_only <- zero.field("auto_renew_only", zero.optional(zero.bool))
  use whois_privacy <- zero.field("whois_privacy", zero.optional(zero.bool))
  use idn <- zero.field("idn", zero.optional(zero.bool))
  use dnssec_interface_type <- zero.field(
    "dnssec_interface_type",
    zero.optional(zero.string),
  )
  use renewal_enabled <- zero.field("renewal_enabled", zero.optional(zero.bool))
  use registration_enabled <- zero.field(
    "registration_enabled",
    zero.optional(zero.bool),
  )
  zero.success(Tld(
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
  ))
}

pub fn event_name_server_deregister_to_json(data: EventNameServerDeregister) {
  json.object([#("name_server", json.null())])
}

pub fn event_name_server_deregister_decoder() {
  use name_server <- zero.field("name_server", zero.optional(zero.success(Nil)))
  zero.success(EventNameServerDeregister(name_server: name_server))
}

pub fn user_to_json(data: User) {
  json.object([
    #("created_at", json.nullable(data.created_at, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
    #("email", json.nullable(data.email, json.string)),
  ])
}

pub fn user_decoder() {
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  use email <- zero.field("email", zero.optional(zero.string))
  zero.success(User(
    created_at: created_at,
    updated_at: updated_at,
    id: id,
    email: email,
  ))
}

pub fn event_name_server_register_to_json(data: EventNameServerRegister) {
  json.object([#("name_server", json.null())])
}

pub fn event_name_server_register_decoder() {
  use name_server <- zero.field("name_server", zero.optional(zero.success(Nil)))
  zero.success(EventNameServerRegister(name_server: name_server))
}

pub fn template_record_to_json(data: TemplateRecord) {
  json.object([
    #("template_id", json.nullable(data.template_id, json.int)),
    #("priority", json.nullable(data.priority, json.int)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("ttl", json.nullable(data.ttl, json.int)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("content", json.nullable(data.content, json.string)),
    #("type", json.nullable(data.type_, json.string)),
    #("id", json.nullable(data.id, json.int)),
  ])
}

pub fn template_record_decoder() {
  use template_id <- zero.field("template_id", zero.optional(zero.int))
  use priority <- zero.field("priority", zero.optional(zero.int))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use ttl <- zero.field("ttl", zero.optional(zero.int))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use content <- zero.field("content", zero.optional(zero.string))
  use type_ <- zero.field("type", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  zero.success(TemplateRecord(
    template_id: template_id,
    priority: priority,
    created_at: created_at,
    name: name,
    ttl: ttl,
    updated_at: updated_at,
    content: content,
    type_: type_,
    id: id,
  ))
}

pub fn letsencrypt_certificate_purchase_to_json(
  data: LetsencryptCertificatePurchase,
) {
  json.object([
    #("certificate_id", json.nullable(data.certificate_id, json.int)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("state", json.nullable(data.state, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
    #("auto_renew", json.nullable(data.auto_renew, json.bool)),
  ])
}

pub fn letsencrypt_certificate_purchase_decoder() {
  use certificate_id <- zero.field("certificate_id", zero.optional(zero.int))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use state <- zero.field("state", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  use auto_renew <- zero.field("auto_renew", zero.optional(zero.bool))
  zero.success(LetsencryptCertificatePurchase(
    certificate_id: certificate_id,
    created_at: created_at,
    state: state,
    updated_at: updated_at,
    id: id,
    auto_renew: auto_renew,
  ))
}

pub fn event_secondary_dnscreate_to_json(data: EventSecondaryDnscreate) {
  json.object([#("configuration", json.null())])
}

pub fn event_secondary_dnscreate_decoder() {
  use configuration <- zero.field(
    "configuration",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventSecondaryDnscreate(configuration: configuration))
}

pub fn domain_restore_to_json(data: DomainRestore) {
  json.object([
    #("created_at", json.nullable(data.created_at, json.string)),
    #("state", json.nullable(data.state, json.string)),
    #("domain_id", json.nullable(data.domain_id, json.int)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
  ])
}

pub fn domain_restore_decoder() {
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use state <- zero.field("state", zero.optional(zero.string))
  use domain_id <- zero.field("domain_id", zero.optional(zero.int))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  zero.success(DomainRestore(
    created_at: created_at,
    state: state,
    domain_id: domain_id,
    updated_at: updated_at,
    id: id,
  ))
}

pub fn email_forward_to_json(data: EmailForward) {
  json.object([
    #("created_at", json.nullable(data.created_at, json.string)),
    #("from", json.nullable(data.from, json.string)),
    #("destination_email", json.nullable(data.destination_email, json.string)),
    #("alias_email", json.nullable(data.alias_email, json.string)),
    #("domain_id", json.nullable(data.domain_id, json.int)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
    #("to", json.nullable(data.to, json.string)),
  ])
}

pub fn email_forward_decoder() {
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use from <- zero.field("from", zero.optional(zero.string))
  use destination_email <- zero.field(
    "destination_email",
    zero.optional(zero.string),
  )
  use alias_email <- zero.field("alias_email", zero.optional(zero.string))
  use domain_id <- zero.field("domain_id", zero.optional(zero.int))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  use to <- zero.field("to", zero.optional(zero.string))
  zero.success(EmailForward(
    created_at: created_at,
    from: from,
    destination_email: destination_email,
    alias_email: alias_email,
    domain_id: domain_id,
    updated_at: updated_at,
    id: id,
    to: to,
  ))
}

pub fn event_certificate_auto_renewal_failed_to_json(
  data: EventCertificateAutoRenewalFailed,
) {
  json.object([#("certificate", json.null())])
}

pub fn event_certificate_auto_renewal_failed_decoder() {
  use certificate <- zero.field("certificate", zero.optional(zero.success(Nil)))
  zero.success(EventCertificateAutoRenewalFailed(certificate: certificate))
}

pub fn event_domain_delete_to_json(data: EventDomainDelete) {
  json.object([#("domain", json.null())])
}

pub fn event_domain_delete_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  zero.success(EventDomainDelete(domain: domain))
}

pub fn event_domain_transfer_to_json(data: EventDomainTransfer) {
  json.object([#("domain", json.null())])
}

pub fn event_domain_transfer_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  zero.success(EventDomainTransfer(domain: domain))
}

pub fn event_certificate_reissue_to_json(data: EventCertificateReissue) {
  json.object([#("certificate", json.null())])
}

pub fn event_certificate_reissue_decoder() {
  use certificate <- zero.field("certificate", zero.optional(zero.success(Nil)))
  zero.success(EventCertificateReissue(certificate: certificate))
}

pub fn event_vanity_enable_to_json(data: EventVanityEnable) {
  json.object([#("domain", json.null())])
}

pub fn event_vanity_enable_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  zero.success(EventVanityEnable(domain: domain))
}

pub fn zone_file_to_json(data: ZoneFile) {
  json.object([#("zone", json.nullable(data.zone, json.string))])
}

pub fn zone_file_decoder() {
  use zone <- zero.field("zone", zero.optional(zero.string))
  zero.success(ZoneFile(zone: zone))
}

pub fn event_webhook_delete_to_json(data: EventWebhookDelete) {
  json.object([#("webhook", json.null())])
}

pub fn event_webhook_delete_decoder() {
  use webhook <- zero.field("webhook", zero.optional(zero.success(Nil)))
  zero.success(EventWebhookDelete(webhook: webhook))
}

pub fn dnssec_to_json(data: Dnssec) {
  json.object([
    #("enabled", json.nullable(data.enabled, json.bool)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
  ])
}

pub fn dnssec_decoder() {
  use enabled <- zero.field("enabled", zero.optional(zero.bool))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  zero.success(Dnssec(
    enabled: enabled,
    created_at: created_at,
    updated_at: updated_at,
  ))
}

pub fn event_account_invitation_create_to_json(
  data: EventAccountInvitationCreate,
) {
  json.object([#("account_invitation", json.null()), #("account", json.null())])
}

pub fn event_account_invitation_create_decoder() {
  use account_invitation <- zero.field(
    "account_invitation",
    zero.optional(zero.success(Nil)),
  )
  use account <- zero.field("account", zero.optional(zero.success(Nil)))
  zero.success(EventAccountInvitationCreate(
    account_invitation: account_invitation,
    account: account,
  ))
}

pub fn event_domain_registrant_change_started_to_json(
  data: EventDomainRegistrantChangeStarted,
) {
  json.object([#("domain", json.null()), #("registrant", json.null())])
}

pub fn event_domain_registrant_change_started_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  use registrant <- zero.field("registrant", zero.optional(zero.success(Nil)))
  zero.success(EventDomainRegistrantChangeStarted(
    domain: domain,
    registrant: registrant,
  ))
}

pub fn error_to_json(data: Error) {
  json.object([#("message", json.nullable(data.message, json.string))])
}

pub fn error_decoder() {
  use message <- zero.field("message", zero.optional(zero.string))
  zero.success(Error(message: message))
}

pub fn event_domain_transfer_cancelled_to_json(
  data: EventDomainTransferCancelled,
) {
  json.object([#("domain", json.null())])
}

pub fn event_domain_transfer_cancelled_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  zero.success(EventDomainTransferCancelled(domain: domain))
}

pub fn event_account_invitation_resend_to_json(
  data: EventAccountInvitationResend,
) {
  json.object([#("account_invitation", json.null()), #("account", json.null())])
}

pub fn event_account_invitation_resend_decoder() {
  use account_invitation <- zero.field(
    "account_invitation",
    zero.optional(zero.success(Nil)),
  )
  use account <- zero.field("account", zero.optional(zero.success(Nil)))
  zero.success(EventAccountInvitationResend(
    account_invitation: account_invitation,
    account: account,
  ))
}

pub fn event_record_create_to_json(data: EventRecordCreate) {
  json.object([#("zone_record", json.null())])
}

pub fn event_record_create_decoder() {
  use zone_record <- zero.field("zone_record", zero.optional(zero.success(Nil)))
  zero.success(EventRecordCreate(zone_record: zone_record))
}

pub fn charge_item_to_json(data: ChargeItem) {
  json.object([
    #("product_type", json.nullable(data.product_type, json.string)),
    #("product_id", json.nullable(data.product_id, json.int)),
    #("amount", json.nullable(data.amount, json.string)),
    #("product_reference", json.nullable(data.product_reference, json.string)),
    #("description", json.nullable(data.description, json.string)),
  ])
}

pub fn charge_item_decoder() {
  use product_type <- zero.field("product_type", zero.optional(zero.string))
  use product_id <- zero.field("product_id", zero.optional(zero.int))
  use amount <- zero.field("amount", zero.optional(zero.string))
  use product_reference <- zero.field(
    "product_reference",
    zero.optional(zero.string),
  )
  use description <- zero.field("description", zero.optional(zero.string))
  zero.success(ChargeItem(
    product_type: product_type,
    product_id: product_id,
    amount: amount,
    product_reference: product_reference,
    description: description,
  ))
}

pub fn account_invitation_to_json(data: AccountInvitation) {
  json.object([
    #(
      "invitation_accepted_at",
      json.nullable(data.invitation_accepted_at, json.string),
    ),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("account_id", json.nullable(data.account_id, json.int)),
    #("invitation_sent_at", json.nullable(data.invitation_sent_at, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("token", json.nullable(data.token, json.string)),
    #("id", json.nullable(data.id, json.int)),
    #("email", json.nullable(data.email, json.string)),
  ])
}

pub fn account_invitation_decoder() {
  use invitation_accepted_at <- zero.field(
    "invitation_accepted_at",
    zero.optional(zero.string),
  )
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use account_id <- zero.field("account_id", zero.optional(zero.int))
  use invitation_sent_at <- zero.field(
    "invitation_sent_at",
    zero.optional(zero.string),
  )
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use token <- zero.field("token", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  use email <- zero.field("email", zero.optional(zero.string))
  zero.success(AccountInvitation(
    invitation_accepted_at: invitation_accepted_at,
    created_at: created_at,
    account_id: account_id,
    invitation_sent_at: invitation_sent_at,
    updated_at: updated_at,
    token: token,
    id: id,
    email: email,
  ))
}

pub fn collaborator_to_json(data: Collaborator) {
  json.object([
    #("domain_name", json.nullable(data.domain_name, json.string)),
    #("user_email", json.nullable(data.user_email, json.string)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("accepted_at", json.nullable(data.accepted_at, json.string)),
    #("user_id", json.nullable(data.user_id, json.int)),
    #("domain_id", json.nullable(data.domain_id, json.int)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("invitation", json.nullable(data.invitation, json.bool)),
    #("id", json.nullable(data.id, json.int)),
  ])
}

pub fn collaborator_decoder() {
  use domain_name <- zero.field("domain_name", zero.optional(zero.string))
  use user_email <- zero.field("user_email", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use accepted_at <- zero.field("accepted_at", zero.optional(zero.string))
  use user_id <- zero.field("user_id", zero.optional(zero.int))
  use domain_id <- zero.field("domain_id", zero.optional(zero.int))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use invitation <- zero.field("invitation", zero.optional(zero.bool))
  use id <- zero.field("id", zero.optional(zero.int))
  zero.success(Collaborator(
    domain_name: domain_name,
    user_email: user_email,
    created_at: created_at,
    accepted_at: accepted_at,
    user_id: user_id,
    domain_id: domain_id,
    updated_at: updated_at,
    invitation: invitation,
    id: id,
  ))
}

pub fn primary_server_to_json(data: PrimaryServer) {
  json.object([
    #("port", json.nullable(data.port, json.int)),
    #("ip", json.nullable(data.ip, json.string)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("account_id", json.nullable(data.account_id, json.int)),
    #("linked_secondary_zones", json.null()),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
  ])
}

pub fn primary_server_decoder() {
  use port <- zero.field("port", zero.optional(zero.int))
  use ip <- zero.field("ip", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use account_id <- zero.field("account_id", zero.optional(zero.int))
  use linked_secondary_zones <- zero.field(
    "linked_secondary_zones",
    zero.optional(zero.list(zero.string)),
  )
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  zero.success(PrimaryServer(
    port: port,
    ip: ip,
    created_at: created_at,
    name: name,
    account_id: account_id,
    linked_secondary_zones: linked_secondary_zones,
    updated_at: updated_at,
    id: id,
  ))
}

pub fn domain_to_json(data: Domain) {
  json.object([
    #("created_at", json.nullable(data.created_at, json.string)),
    #("expires_on", json.nullable(data.expires_on, json.string)),
    #("name", json.nullable(data.name, json.string)),
    #("private_whois", json.nullable(data.private_whois, json.bool)),
    #("account_id", json.nullable(data.account_id, json.int)),
    #("unicode_name", json.nullable(data.unicode_name, json.string)),
    #("registrant_id", json.nullable(data.registrant_id, json.int)),
    #("state", json.nullable(data.state, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
    #("auto_renew", json.nullable(data.auto_renew, json.bool)),
    #("expires_at", json.nullable(data.expires_at, json.string)),
  ])
}

pub fn domain_decoder() {
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use expires_on <- zero.field("expires_on", zero.optional(zero.string))
  use name <- zero.field("name", zero.optional(zero.string))
  use private_whois <- zero.field("private_whois", zero.optional(zero.bool))
  use account_id <- zero.field("account_id", zero.optional(zero.int))
  use unicode_name <- zero.field("unicode_name", zero.optional(zero.string))
  use registrant_id <- zero.field("registrant_id", zero.optional(zero.int))
  use state <- zero.field("state", zero.optional(zero.string))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  use auto_renew <- zero.field("auto_renew", zero.optional(zero.bool))
  use expires_at <- zero.field("expires_at", zero.optional(zero.string))
  zero.success(Domain(
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
  ))
}

pub fn event_vanity_disable_to_json(data: EventVanityDisable) {
  json.object([#("domain", json.null())])
}

pub fn event_vanity_disable_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  zero.success(EventVanityDisable(domain: domain))
}

pub fn extended_attribute_to_json(data: ExtendedAttribute) {
  json.object([
    #("name", json.nullable(data.name, json.string)),
    #("description", json.nullable(data.description, json.string)),
    #("options", json.null()),
    #("required", json.nullable(data.required, json.bool)),
  ])
}

pub fn extended_attribute_decoder() {
  use name <- zero.field("name", zero.optional(zero.string))
  use description <- zero.field("description", zero.optional(zero.string))
  use options <- zero.field("options", zero.optional(zero.success(Nil)))
  use required <- zero.field("required", zero.optional(zero.bool))
  zero.success(ExtendedAttribute(
    name: name,
    description: description,
    options: options,
    required: required,
  ))
}

pub fn event_zone_create_to_json(data: EventZoneCreate) {
  json.object([#("zone", json.null())])
}

pub fn event_zone_create_decoder() {
  use zone <- zero.field("zone", zero.optional(zero.success(Nil)))
  zero.success(EventZoneCreate(zone: zone))
}

pub fn event_dnssecrotation_start_to_json(data: EventDnssecrotationStart) {
  json.object([
    #("dnssec", json.null()),
    #("delegation_signer_record", json.null()),
  ])
}

pub fn event_dnssecrotation_start_decoder() {
  use dnssec <- zero.field("dnssec", zero.optional(zero.success(Nil)))
  use delegation_signer_record <- zero.field(
    "delegation_signer_record",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventDnssecrotationStart(
    dnssec: dnssec,
    delegation_signer_record: delegation_signer_record,
  ))
}

pub fn event_account_remove_user_to_json(data: EventAccountRemoveUser) {
  json.object([#("user", json.null()), #("account", json.null())])
}

pub fn event_account_remove_user_decoder() {
  use user <- zero.field("user", zero.optional(zero.success(Nil)))
  use account <- zero.field("account", zero.optional(zero.success(Nil)))
  zero.success(EventAccountRemoveUser(user: user, account: account))
}

pub fn event_contact_create_to_json(data: EventContactCreate) {
  json.object([#("contact", json.null())])
}

pub fn event_contact_create_decoder() {
  use contact <- zero.field("contact", zero.optional(zero.success(Nil)))
  zero.success(EventContactCreate(contact: contact))
}

pub fn event_domain_renew_cancelled_to_json(data: EventDomainRenewCancelled) {
  json.object([
    #("domain", json.null()),
    #("auto", json.nullable(data.auto_, json.bool)),
  ])
}

pub fn event_domain_renew_cancelled_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  use auto_ <- zero.field("auto", zero.optional(zero.bool))
  zero.success(EventDomainRenewCancelled(domain: domain, auto_: auto_))
}

pub fn event_template_record_create_to_json(data: EventTemplateRecordCreate) {
  json.object([#("template_record", json.null())])
}

pub fn event_template_record_create_decoder() {
  use template_record <- zero.field(
    "template_record",
    zero.optional(zero.success(Nil)),
  )
  zero.success(EventTemplateRecordCreate(template_record: template_record))
}

pub fn domain_check_result_to_json(data: DomainCheckResult) {
  json.object([
    #("domain", json.nullable(data.domain, json.string)),
    #("available", json.nullable(data.available, json.bool)),
    #("premium", json.nullable(data.premium, json.bool)),
  ])
}

pub fn domain_check_result_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.string))
  use available <- zero.field("available", zero.optional(zero.bool))
  use premium <- zero.field("premium", zero.optional(zero.bool))
  zero.success(DomainCheckResult(
    domain: domain,
    available: available,
    premium: premium,
  ))
}

pub fn event_domain_restore_cancelled_to_json(data: EventDomainRestoreCancelled) {
  json.object([
    #("domain", json.null()),
    #("auto", json.nullable(data.auto_, json.bool)),
  ])
}

pub fn event_domain_restore_cancelled_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  use auto_ <- zero.field("auto", zero.optional(zero.bool))
  zero.success(EventDomainRestoreCancelled(domain: domain, auto_: auto_))
}

pub fn event_domain_register_to_json(data: EventDomainRegister) {
  json.object([#("domain", json.null())])
}

pub fn event_domain_register_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  zero.success(EventDomainRegister(domain: domain))
}

pub fn whois_privacy_to_json(data: WhoisPrivacy) {
  json.object([
    #("enabled", json.nullable(data.enabled, json.bool)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("expires_on", json.nullable(data.expires_on, json.string)),
    #("domain_id", json.nullable(data.domain_id, json.int)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("id", json.nullable(data.id, json.int)),
  ])
}

pub fn whois_privacy_decoder() {
  use enabled <- zero.field("enabled", zero.optional(zero.bool))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use expires_on <- zero.field("expires_on", zero.optional(zero.string))
  use domain_id <- zero.field("domain_id", zero.optional(zero.int))
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  zero.success(WhoisPrivacy(
    enabled: enabled,
    created_at: created_at,
    expires_on: expires_on,
    domain_id: domain_id,
    updated_at: updated_at,
    id: id,
  ))
}

pub fn event_domain_register_started_to_json(data: EventDomainRegisterStarted) {
  json.object([#("domain", json.null())])
}

pub fn event_domain_register_started_decoder() {
  use domain <- zero.field("domain", zero.optional(zero.success(Nil)))
  zero.success(EventDomainRegisterStarted(domain: domain))
}

pub fn contact_to_json(data: Contact) {
  json.object([
    #("postal_code", json.nullable(data.postal_code, json.string)),
    #("created_at", json.nullable(data.created_at, json.string)),
    #("city", json.nullable(data.city, json.string)),
    #("account_id", json.nullable(data.account_id, json.int)),
    #("phone", json.nullable(data.phone, json.string)),
    #("last_name", json.nullable(data.last_name, json.string)),
    #("label", json.nullable(data.label, json.string)),
    #("job_title", json.nullable(data.job_title, json.string)),
    #("country", json.nullable(data.country, json.string)),
    #("organization_name", json.nullable(data.organization_name, json.string)),
    #("updated_at", json.nullable(data.updated_at, json.string)),
    #("first_name", json.nullable(data.first_name, json.string)),
    #("id", json.nullable(data.id, json.int)),
    #("email", json.nullable(data.email, json.string)),
    #("address1", json.nullable(data.address1, json.string)),
    #("fax", json.nullable(data.fax, json.string)),
    #("address2", json.nullable(data.address2, json.string)),
    #("state_province", json.nullable(data.state_province, json.string)),
  ])
}

pub fn contact_decoder() {
  use postal_code <- zero.field("postal_code", zero.optional(zero.string))
  use created_at <- zero.field("created_at", zero.optional(zero.string))
  use city <- zero.field("city", zero.optional(zero.string))
  use account_id <- zero.field("account_id", zero.optional(zero.int))
  use phone <- zero.field("phone", zero.optional(zero.string))
  use last_name <- zero.field("last_name", zero.optional(zero.string))
  use label <- zero.field("label", zero.optional(zero.string))
  use job_title <- zero.field("job_title", zero.optional(zero.string))
  use country <- zero.field("country", zero.optional(zero.string))
  use organization_name <- zero.field(
    "organization_name",
    zero.optional(zero.string),
  )
  use updated_at <- zero.field("updated_at", zero.optional(zero.string))
  use first_name <- zero.field("first_name", zero.optional(zero.string))
  use id <- zero.field("id", zero.optional(zero.int))
  use email <- zero.field("email", zero.optional(zero.string))
  use address1 <- zero.field("address1", zero.optional(zero.string))
  use fax <- zero.field("fax", zero.optional(zero.string))
  use address2 <- zero.field("address2", zero.optional(zero.string))
  use state_province <- zero.field("state_province", zero.optional(zero.string))
  zero.success(Contact(
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
  ))
}
