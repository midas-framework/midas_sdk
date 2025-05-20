import dnsimple_sdk/schema
import dnsimple_sdk/utils
import gleam/bool
import gleam/dynamic/decode
import gleam/float
import gleam/http
import gleam/http/response
import gleam/int
import gleam/json
import gleam/option.{type Option, None}
import gleam/result

pub type RegisterDomainResponse {
  RegisterDomainResponse(data: Option(schema.DomainRegistration))
}

pub type CheckRegistrantChangeResponse {
  CheckRegistrantChangeResponse(data: Option(schema.RegistrantChangeCheck))
}

pub type QueryDnsAnalyticsResponse {
  QueryDnsAnalyticsResponse(
    query: Option(Nil),
    data: Option(Nil),
    pagination: Option(schema.Pagination),
  )
}

pub type ListDomainAppliedServicesResponse {
  ListDomainAppliedServicesResponse(
    data: Option(List(schema.Service)),
    pagination: Option(schema.Pagination),
  )
}

pub type CreateDomainResponse {
  CreateDomainResponse(data: Option(schema.Domain))
}

pub type ListDomainsResponse {
  ListDomainsResponse(
    data: Option(List(schema.Domain)),
    pagination: Option(schema.Pagination),
  )
}

pub type CreatePrimaryServerResponse {
  CreatePrimaryServerResponse(data: Option(schema.PrimaryServer))
}

pub type ListPrimaryServersResponse {
  ListPrimaryServersResponse(
    data: Option(List(schema.PrimaryServer)),
    pagination: Option(schema.Pagination),
  )
}

pub type ListPushesResponse {
  ListPushesResponse(
    data: Option(List(schema.Push)),
    pagination: Option(schema.Pagination),
  )
}

pub type ListCertificatesResponse {
  ListCertificatesResponse(
    data: Option(List(schema.Certificate)),
    pagination: Option(schema.Pagination),
  )
}

pub type GetZoneFileResponse {
  GetZoneFileResponse(data: Option(schema.ZoneFile))
}

pub type GetEmailForwardResponse {
  GetEmailForwardResponse(data: Option(schema.EmailForward))
}

pub type ListChargesResponse {
  ListChargesResponse(
    data: Option(List(schema.Charge)),
    pagination: Option(schema.Pagination),
  )
}

pub type PurchaseLetsencryptCertificateResponse {
  PurchaseLetsencryptCertificateResponse(
    data: Option(schema.LetsencryptCertificatePurchase),
  )
}

pub type DomainRenewResponse {
  DomainRenewResponse(data: Option(schema.DomainRenewal))
}

pub type CancelDomainTransferResponse {
  CancelDomainTransferResponse(data: Option(schema.DomainTransfer))
}

pub type GetDomainTransferResponse {
  GetDomainTransferResponse(data: Option(schema.DomainTransfer))
}

pub type GetDomainRegistrationResponse {
  GetDomainRegistrationResponse(data: Option(schema.DomainRegistration))
}

pub type ListTldsResponse {
  ListTldsResponse(
    data: Option(List(schema.Tld)),
    pagination: Option(schema.Pagination),
  )
}

pub type ChangeDomainDelegationToVanityResponse {
  ChangeDomainDelegationToVanityResponse(data: Option(List(schema.NameServer)))
}

pub type ListAccountsResponse {
  ListAccountsResponse(data: Option(List(schema.Account)))
}

pub type DisableWhoisPrivacyResponse {
  DisableWhoisPrivacyResponse(data: Option(schema.WhoisPrivacy))
}

pub type EnableWhoisPrivacyResponse {
  EnableWhoisPrivacyResponse(data: Option(schema.WhoisPrivacy))
}

pub type GetWhoisPrivacyResponse {
  GetWhoisPrivacyResponse(data: Option(schema.WhoisPrivacy))
}

pub type RenewWhoisPrivacyResponse {
  RenewWhoisPrivacyResponse(data: Option(schema.WhoisPrivacyRenewal))
}

pub type DeactivateZoneServiceResponse {
  DeactivateZoneServiceResponse(data: Option(schema.Zone))
}

pub type ActivateZoneServiceResponse {
  ActivateZoneServiceResponse(data: Option(schema.Zone))
}

pub type ListZonesResponse {
  ListZonesResponse(
    data: Option(List(schema.Zone)),
    pagination: Option(schema.Pagination),
  )
}

pub type GetTldResponse {
  GetTldResponse(data: Option(schema.Tld))
}

pub type GetDomainDelegationSignerRecordResponse {
  GetDomainDelegationSignerRecordResponse(data: Option(schema.DelegationSigner))
}

pub type DeleteRegistrantChangeResponse {
  DeleteRegistrantChangeResponse(data: Option(schema.RegistrantChange))
}

pub type GetRegistrantChangeResponse {
  GetRegistrantChangeResponse(data: Option(schema.RegistrantChange))
}

pub type UpdateTemplateResponse {
  UpdateTemplateResponse(data: Option(schema.Template))
}

pub type GetTemplateResponse {
  GetTemplateResponse(data: Option(schema.Template))
}

pub type GetDomainResponse {
  GetDomainResponse(data: Option(schema.Domain))
}

pub type GetZoneResponse {
  GetZoneResponse(data: Option(schema.Zone))
}

pub type UpdateZoneRecordResponse {
  UpdateZoneRecordResponse(data: Option(schema.ZoneRecord))
}

pub type GetZoneRecordResponse {
  GetZoneRecordResponse(data: Option(schema.ZoneRecord))
}

pub type CreateDomainDelegationSignerRecordResponse {
  CreateDomainDelegationSignerRecordResponse(
    data: Option(schema.DelegationSigner),
  )
}

pub type ListDomainDelegationSignerRecordsResponse {
  ListDomainDelegationSignerRecordsResponse(
    data: Option(List(schema.DelegationSigner)),
    pagination: Option(schema.Pagination),
  )
}

pub type CreateWebhookResponse {
  CreateWebhookResponse(data: Option(schema.Webhook))
}

pub type ListWebhooksResponse {
  ListWebhooksResponse(data: Option(List(schema.Webhook)))
}

pub type UpdateContactResponse {
  UpdateContactResponse(data: Option(schema.Contact))
}

pub type GetContactResponse {
  GetContactResponse(data: Option(schema.Contact))
}

pub type CreateEmailForwardResponse {
  CreateEmailForwardResponse(data: Option(schema.EmailForward))
}

pub type ListEmailForwardsResponse {
  ListEmailForwardsResponse(
    data: Option(List(schema.EmailForward)),
    pagination: Option(schema.Pagination),
  )
}

pub type AddDomainCollaboratorResponse {
  AddDomainCollaboratorResponse(data: Option(schema.Collaborator))
}

pub type ListDomainCollaboratorsResponse {
  ListDomainCollaboratorsResponse(
    data: Option(List(schema.Collaborator)),
    pagination: Option(schema.Pagination),
  )
}

pub type EnableVanityNameServersResponse {
  EnableVanityNameServersResponse(data: Option(List(schema.VanityNameServer)))
}

pub type WhoamiResponse {
  WhoamiResponse(data: Option(Nil))
}

pub type ListServicesResponse {
  ListServicesResponse(
    data: Option(List(schema.Service)),
    pagination: Option(schema.Pagination),
  )
}

pub type GetCertificateResponse {
  GetCertificateResponse(data: Option(schema.Certificate))
}

pub type CheckDomainResponse {
  CheckDomainResponse(data: Option(schema.DomainCheckResult))
}

pub type TransferDomainResponse {
  TransferDomainResponse(data: Option(schema.DomainTransfer))
}

pub type GetDomainRenewalResponse {
  GetDomainRenewalResponse(data: Option(schema.DomainRenewal))
}

pub type DownloadCertificateResponse {
  DownloadCertificateResponse(data: Option(schema.CertificateDownload))
}

pub type LinkPrimaryServerResponse {
  LinkPrimaryServerResponse(data: Option(schema.PrimaryServer))
}

pub type IssueLetsencryptCertificateResponse {
  IssueLetsencryptCertificateResponse(data: Option(schema.Certificate))
}

pub type GetDomainPricesResponse {
  GetDomainPricesResponse(data: Option(schema.DomainPrices))
}

pub type CreateTemplateResponse {
  CreateTemplateResponse(data: Option(schema.Template))
}

pub type ListTemplatesResponse {
  ListTemplatesResponse(
    data: Option(List(schema.Template)),
    pagination: Option(schema.Pagination),
  )
}

pub type CreateContactResponse {
  CreateContactResponse(data: Option(schema.Contact))
}

pub type ListContactsResponse {
  ListContactsResponse(
    data: Option(List(schema.Contact)),
    pagination: Option(schema.Pagination),
  )
}

pub type UpdateZoneNsRecordsResponse {
  UpdateZoneNsRecordsResponse(data: Option(List(schema.ZoneRecord)))
}

pub type EnableDomainDnssecResponse {
  EnableDomainDnssecResponse(data: Option(schema.Dnssec))
}

pub type GetDomainDnssecResponse {
  GetDomainDnssecResponse(data: Option(schema.Dnssec))
}

pub type InitiateDomainPushResponse {
  InitiateDomainPushResponse(data: Option(schema.Push))
}

pub type GetDomainPremiumPriceResponse {
  GetDomainPremiumPriceResponse(data: Option(schema.DomainPremiumPrice))
}

pub type ChangeDomainDelegationResponse {
  ChangeDomainDelegationResponse(data: Option(List(schema.DomainNameServer)))
}

pub type GetDomainDelegationResponse {
  GetDomainDelegationResponse(data: Option(List(schema.DomainNameServer)))
}

pub type CreateZoneRecordResponse {
  CreateZoneRecordResponse(data: Option(schema.ZoneRecord))
}

pub type ListZoneRecordsResponse {
  ListZoneRecordsResponse(
    data: Option(List(schema.ZoneRecord)),
    pagination: Option(schema.Pagination),
  )
}

pub type CreateRegistrantChangeResponse {
  CreateRegistrantChangeResponse(data: Option(schema.RegistrantChange))
}

pub type ListRegistrantChangesResponse {
  ListRegistrantChangesResponse(
    data: Option(List(schema.RegistrantChange)),
    pagination: Option(schema.Pagination),
  )
}

pub type CreateTemplateRecordResponse {
  CreateTemplateRecordResponse(data: Option(schema.TemplateRecord))
}

pub type ListTemplateRecordsResponse {
  ListTemplateRecordsResponse(
    data: Option(List(schema.TemplateRecord)),
    pagination: Option(schema.Pagination),
  )
}

pub type CheckZoneRecordDistributionResponse {
  CheckZoneRecordDistributionResponse(data: Option(schema.ZoneDistribution))
}

pub type DisableDomainTransferLockResponse {
  DisableDomainTransferLockResponse(data: Option(schema.DomainTransferLock))
}

pub type EnableDomainTransferLockResponse {
  EnableDomainTransferLockResponse(data: Option(schema.DomainTransferLock))
}

pub type GetDomainTransferLockResponse {
  GetDomainTransferLockResponse(data: Option(schema.DomainTransferLock))
}

pub type CreateSecondaryZoneResponse {
  CreateSecondaryZoneResponse(data: Option(schema.Zone))
}

pub type GetTemplateRecordResponse {
  GetTemplateRecordResponse(data: Option(schema.TemplateRecord))
}

pub type CheckZoneDistributionResponse {
  CheckZoneDistributionResponse(data: Option(schema.ZoneDistribution))
}

pub type UnlinkPrimaryServerResponse {
  UnlinkPrimaryServerResponse(data: Option(schema.PrimaryServer))
}

pub type GetServiceResponse {
  GetServiceResponse(data: Option(schema.Service))
}

pub type GetWebhookResponse {
  GetWebhookResponse(data: Option(schema.Webhook))
}

pub type GetTldExtendedAttributesResponse {
  GetTldExtendedAttributesResponse(data: Option(List(schema.ExtendedAttribute)))
}

pub type DomainRestoreResponse {
  DomainRestoreResponse(data: Option(schema.DomainRestore))
}

pub type GetDomainRestoreResponse {
  GetDomainRestoreResponse(data: Option(schema.DomainRestore))
}

pub type PurchaseRenewalLetsencryptCertificateResponse {
  PurchaseRenewalLetsencryptCertificateResponse(
    data: Option(schema.LetsencryptCertificateRenewal),
  )
}

pub type GetCertificatePrivateKeyResponse {
  GetCertificatePrivateKeyResponse(data: Option(schema.CertificatePrivateKey))
}

pub type GetPrimaryServerResponse {
  GetPrimaryServerResponse(data: Option(schema.PrimaryServer))
}

pub type IssueRenewalLetsencryptCertificateResponse {
  IssueRenewalLetsencryptCertificateResponse(data: Option(schema.Certificate))
}

pub fn register_domain_request(base, account, domain, data) {
  let method = http.Post
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/registrations"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn register_domain_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.domain_registration_decoder()),
        )
        decode.success(RegisterDomainResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        use errors <- decode.optional_field(
          "errors",
          None,
          decode.optional(
            decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
          ),
        )
        decode.success(RegisterDomainResponse(message: message, errors: errors))
      })
      |> result.map(Error)
  }
}

pub fn check_registrant_change_request(base, account, data) {
  let method = http.Post
  let path =
    "/" <> int.to_string(account) <> "/registrar/registrant_changes/check"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn check_registrant_change_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.registrant_change_check_decoder()),
        )
        decode.success(CheckRegistrantChangeResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        use errors <- decode.optional_field(
          "errors",
          None,
          decode.optional(
            decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
          ),
        )
        decode.success(CheckRegistrantChangeResponse(
          message: message,
          errors: errors,
        ))
      })
      |> result.map(Error)
  }
}

pub fn query_dns_analytics_request(
  base,
  account,
  start_date start_date,
  end_date end_date,
  groupings groupings,
  sort sort,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/" <> int.to_string(account) <> "/dns_analytics"
  let query = [
    #("start_date", start_date),
    #("end_date", end_date),
    #("groupings", groupings),
    #("sort", sort),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn query_dns_analytics_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use query <- decode.optional_field(
          "query",
          None,
          decode.optional(
            decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
          ),
        )
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(
            decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
          ),
        )
        use pagination <- decode.optional_field(
          "pagination",
          None,
          decode.optional(schema.pagination_decoder()),
        )
        decode.success(QueryDnsAnalyticsResponse(
          query: query,
          data: data,
          pagination: pagination,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_domain_applied_services_request(base, account, domain) {
  let method = http.Get
  let path =
    "/" <> int.to_string(account) <> "/domains/" <> domain <> "/services"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_domain_applied_services_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.service_decoder())),
        )
        use pagination <- decode.optional_field(
          "pagination",
          None,
          decode.optional(schema.pagination_decoder()),
        )
        decode.success(ListDomainAppliedServicesResponse(
          data: data,
          pagination: pagination,
        ))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(ListDomainAppliedServicesResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn create_domain_request(base, account, data) {
  let method = http.Post
  let path = "/" <> int.to_string(account) <> "/domains"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_domain_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.domain_decoder()),
        )
        decode.success(CreateDomainResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        use errors <- decode.optional_field(
          "errors",
          None,
          decode.optional(
            decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
          ),
        )
        decode.success(CreateDomainResponse(message: message, errors: errors))
      })
      |> result.map(Error)
  }
}

pub fn list_domains_request(
  base,
  account,
  name_like name_like,
  registrant_id registrant_id,
  sort sort,
) {
  let method = http.Get
  let path = "/" <> int.to_string(account) <> "/domains"
  let query = [
    #("name_like", name_like),
    #("registrant_id", option.map(registrant_id, int.to_string)),
    #("sort", sort),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_domains_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.domain_decoder())),
        )
        use pagination <- decode.optional_field(
          "pagination",
          None,
          decode.optional(schema.pagination_decoder()),
        )
        decode.success(ListDomainsResponse(data: data, pagination: pagination))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn create_primary_server_request(base, account, data) {
  let method = http.Post
  let path = "/" <> int.to_string(account) <> "/secondary_dns/primaries"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_primary_server_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.primary_server_decoder()),
        )
        decode.success(CreatePrimaryServerResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        use errors <- decode.optional_field(
          "errors",
          None,
          decode.optional(
            decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
          ),
        )
        decode.success(CreatePrimaryServerResponse(
          message: message,
          errors: errors,
        ))
      })
      |> result.map(Error)
  }
}

pub fn list_primary_servers_request(base, account, sort sort) {
  let method = http.Get
  let path = "/" <> int.to_string(account) <> "/secondary_dns/primaries"
  let query = [#("sort", sort)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_primary_servers_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.primary_server_decoder())),
        )
        use pagination <- decode.optional_field(
          "pagination",
          None,
          decode.optional(schema.pagination_decoder()),
        )
        decode.success(ListPrimaryServersResponse(
          data: data,
          pagination: pagination,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn remove_domain_collaborator_request(base, account, domain, collaborator) {
  let method = http.Delete
  let path =
    "/"
    <> int.to_string(account)
    <> "/domains/"
    <> domain
    <> "/collaborators/"
    <> int.to_string(collaborator)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn remove_domain_collaborator_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn reject_push_request(base, account, push) {
  let method = http.Delete
  let path = "/" <> int.to_string(account) <> "/pushes/" <> int.to_string(push)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn reject_push_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn accept_push_request(base, account, push, data) {
  let method = http.Post
  let path = "/" <> int.to_string(account) <> "/pushes/" <> int.to_string(push)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn accept_push_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn apply_template_to_domain_request(base, account, domain, template) {
  let method = http.Post
  let path =
    "/"
    <> int.to_string(account)
    <> "/domains/"
    <> domain
    <> "/templates/"
    <> template
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apply_template_to_domain_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(ApplyTemplateToDomainResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn list_pushes_request(base, account) {
  let method = http.Get
  let path = "/" <> int.to_string(account) <> "/pushes"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_pushes_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.push_decoder())),
        )
        use pagination <- decode.optional_field(
          "pagination",
          None,
          decode.optional(schema.pagination_decoder()),
        )
        decode.success(ListPushesResponse(data: data, pagination: pagination))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_certificates_request(base, account, domain, sort sort) {
  let method = http.Get
  let path =
    "/" <> int.to_string(account) <> "/domains/" <> domain <> "/certificates"
  let query = [#("sort", sort)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_certificates_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.certificate_decoder())),
        )
        use pagination <- decode.optional_field(
          "pagination",
          None,
          decode.optional(schema.pagination_decoder()),
        )
        decode.success(ListCertificatesResponse(
          data: data,
          pagination: pagination,
        ))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(ListCertificatesResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn get_zone_file_request(base, account, zone) {
  let method = http.Get
  let path = "/" <> int.to_string(account) <> "/zones/" <> zone <> "/file"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_zone_file_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.zone_file_decoder()),
        )
        decode.success(GetZoneFileResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(GetZoneFileResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn delete_email_forward_request(base, account, domain, emailforward) {
  let method = http.Delete
  let path =
    "/"
    <> int.to_string(account)
    <> "/domains/"
    <> domain
    <> "/email_forwards/"
    <> int.to_string(emailforward)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn delete_email_forward_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(DeleteEmailForwardResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn get_email_forward_request(base, account, domain, emailforward) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/domains/"
    <> domain
    <> "/email_forwards/"
    <> int.to_string(emailforward)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_email_forward_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.email_forward_decoder()),
        )
        decode.success(GetEmailForwardResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_charges_request(
  base,
  account,
  start_date start_date,
  end_date end_date,
  sort sort,
) {
  let method = http.Get
  let path = "/" <> int.to_string(account) <> "/billing/charges"
  let query = [
    #("start_date", start_date),
    #("end_date", end_date),
    #("sort", sort),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_charges_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.charge_decoder())),
        )
        use pagination <- decode.optional_field(
          "pagination",
          None,
          decode.optional(schema.pagination_decoder()),
        )
        decode.success(ListChargesResponse(data: data, pagination: pagination))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn purchase_letsencrypt_certificate_request(base, account, domain, data) {
  let method = http.Post
  let path =
    "/"
    <> int.to_string(account)
    <> "/domains/"
    <> domain
    <> "/certificates/letsencrypt"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn purchase_letsencrypt_certificate_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.letsencrypt_certificate_purchase_decoder()),
        )
        decode.success(PurchaseLetsencryptCertificateResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(PurchaseLetsencryptCertificateResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn domain_renew_request(base, account, domain, data) {
  let method = http.Post
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/renewals"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn domain_renew_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.domain_renewal_decoder()),
        )
        decode.success(DomainRenewResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        use errors <- decode.optional_field(
          "errors",
          None,
          decode.optional(
            decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
          ),
        )
        decode.success(DomainRenewResponse(message: message, errors: errors))
      })
      |> result.map(Error)
  }
}

pub fn cancel_domain_transfer_request(base, account, domain, domaintransfer) {
  let method = http.Delete
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/transfers/"
    <> int.to_string(domaintransfer)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn cancel_domain_transfer_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    202 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.domain_transfer_decoder()),
        )
        decode.success(CancelDomainTransferResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(CancelDomainTransferResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn get_domain_transfer_request(base, account, domain, domaintransfer) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/transfers/"
    <> int.to_string(domaintransfer)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_domain_transfer_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.domain_transfer_decoder()),
        )
        decode.success(GetDomainTransferResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(GetDomainTransferResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn get_domain_registration_request(
  base,
  account,
  domain,
  domainregistration,
) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/registrations/"
    <> int.to_string(domainregistration)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_domain_registration_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.domain_registration_decoder()),
        )
        decode.success(GetDomainRegistrationResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(GetDomainRegistrationResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn list_tlds_request(base, sort sort) {
  let method = http.Get
  let path = "/tlds"
  let query = [#("sort", sort)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_tlds_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.tld_decoder())),
        )
        use pagination <- decode.optional_field(
          "pagination",
          None,
          decode.optional(schema.pagination_decoder()),
        )
        decode.success(ListTldsResponse(data: data, pagination: pagination))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn change_domain_delegation_from_vanity_request(base, account, domain) {
  let method = http.Delete
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/delegation/vanity"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn change_domain_delegation_from_vanity_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn change_domain_delegation_to_vanity_request(base, account, domain, data) {
  let method = http.Put
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/delegation/vanity"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn change_domain_delegation_to_vanity_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.name_server_decoder())),
        )
        decode.success(ChangeDomainDelegationToVanityResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_accounts_request(base) {
  let method = http.Get
  let path = "/accounts"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_accounts_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.account_decoder())),
        )
        decode.success(ListAccountsResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn disable_whois_privacy_request(base, account, domain) {
  let method = http.Delete
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/whois_privacy"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn disable_whois_privacy_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.whois_privacy_decoder()),
        )
        decode.success(DisableWhoisPrivacyResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(DisableWhoisPrivacyResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn enable_whois_privacy_request(base, account, domain) {
  let method = http.Put
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/whois_privacy"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn enable_whois_privacy_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.whois_privacy_decoder()),
        )
        decode.success(EnableWhoisPrivacyResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(EnableWhoisPrivacyResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn get_whois_privacy_request(base, account, domain) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/whois_privacy"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_whois_privacy_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.whois_privacy_decoder()),
        )
        decode.success(GetWhoisPrivacyResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(GetWhoisPrivacyResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn renew_whois_privacy_request(base, account, domain) {
  let method = http.Post
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/whois_privacy/renewals"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn renew_whois_privacy_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.whois_privacy_renewal_decoder()),
        )
        decode.success(RenewWhoisPrivacyResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn deactivate_zone_service_request(base, account, zone) {
  let method = http.Delete
  let path = "/" <> int.to_string(account) <> "/zones/" <> zone <> "/activation"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn deactivate_zone_service_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.zone_decoder()),
        )
        decode.success(DeactivateZoneServiceResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(DeactivateZoneServiceResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn activate_zone_service_request(base, account, zone) {
  let method = http.Put
  let path = "/" <> int.to_string(account) <> "/zones/" <> zone <> "/activation"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activate_zone_service_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.zone_decoder()),
        )
        decode.success(ActivateZoneServiceResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(ActivateZoneServiceResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn list_zones_request(base, account, name_like name_like, sort sort) {
  let method = http.Get
  let path = "/" <> int.to_string(account) <> "/zones"
  let query = [#("name_like", name_like), #("sort", sort)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_zones_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.zone_decoder())),
        )
        use pagination <- decode.optional_field(
          "pagination",
          None,
          decode.optional(schema.pagination_decoder()),
        )
        decode.success(ListZonesResponse(data: data, pagination: pagination))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_tld_request(base, tld) {
  let method = http.Get
  let path = "/tlds/" <> tld
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_tld_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.tld_decoder()),
        )
        decode.success(GetTldResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(GetTldResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn delete_domain_delegation_signer_record_request(base, account, domain, ds) {
  let method = http.Delete
  let path =
    "/"
    <> int.to_string(account)
    <> "/domains/"
    <> domain
    <> "/ds_records/"
    <> int.to_string(ds)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn delete_domain_delegation_signer_record_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn get_domain_delegation_signer_record_request(base, account, domain, ds) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/domains/"
    <> domain
    <> "/ds_records/"
    <> int.to_string(ds)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_domain_delegation_signer_record_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.delegation_signer_decoder()),
        )
        decode.success(GetDomainDelegationSignerRecordResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn delete_registrant_change_request(base, account, registrantchange) {
  let method = http.Delete
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/registrant_changes/"
    <> int.to_string(registrantchange)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn delete_registrant_change_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    202 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.registrant_change_decoder()),
        )
        decode.success(DeleteRegistrantChangeResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_registrant_change_request(base, account, registrantchange) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/registrant_changes/"
    <> int.to_string(registrantchange)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_registrant_change_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.registrant_change_decoder()),
        )
        decode.success(GetRegistrantChangeResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(GetRegistrantChangeResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn update_template_request(base, account, template, data) {
  let method = http.Patch
  let path = "/" <> int.to_string(account) <> "/templates/" <> template
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn update_template_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.template_decoder()),
        )
        decode.success(UpdateTemplateResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(UpdateTemplateResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn delete_template_request(base, account, template) {
  let method = http.Delete
  let path = "/" <> int.to_string(account) <> "/templates/" <> template
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn delete_template_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn get_template_request(base, account, template) {
  let method = http.Get
  let path = "/" <> int.to_string(account) <> "/templates/" <> template
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_template_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.template_decoder()),
        )
        decode.success(GetTemplateResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(GetTemplateResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn delete_domain_request(base, account, domain) {
  let method = http.Delete
  let path = "/" <> int.to_string(account) <> "/domains/" <> domain
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn delete_domain_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn get_domain_request(base, account, domain) {
  let method = http.Get
  let path = "/" <> int.to_string(account) <> "/domains/" <> domain
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_domain_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.domain_decoder()),
        )
        decode.success(GetDomainResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_zone_request(base, account, zone) {
  let method = http.Get
  let path = "/" <> int.to_string(account) <> "/zones/" <> zone
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_zone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.zone_decoder()),
        )
        decode.success(GetZoneResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(GetZoneResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn unapply_service_from_domain_request(base, account, domain, service) {
  let method = http.Delete
  let path =
    "/"
    <> int.to_string(account)
    <> "/domains/"
    <> domain
    <> "/services/"
    <> service
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn unapply_service_from_domain_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn apply_service_to_domain_request(base, account, domain, service, data) {
  let method = http.Post
  let path =
    "/"
    <> int.to_string(account)
    <> "/domains/"
    <> domain
    <> "/services/"
    <> service
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn apply_service_to_domain_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn update_zone_record_request(base, account, zone, zonerecord, data) {
  let method = http.Patch
  let path =
    "/"
    <> int.to_string(account)
    <> "/zones/"
    <> zone
    <> "/records/"
    <> int.to_string(zonerecord)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn update_zone_record_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.zone_record_decoder()),
        )
        decode.success(UpdateZoneRecordResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn delete_zone_record_request(base, account, zone, zonerecord, data) {
  let method = http.Delete
  let path =
    "/"
    <> int.to_string(account)
    <> "/zones/"
    <> zone
    <> "/records/"
    <> int.to_string(zonerecord)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn delete_zone_record_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(DeleteZoneRecordResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn get_zone_record_request(base, account, zone, zonerecord) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/zones/"
    <> zone
    <> "/records/"
    <> int.to_string(zonerecord)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_zone_record_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.zone_record_decoder()),
        )
        decode.success(GetZoneRecordResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(GetZoneRecordResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn create_domain_delegation_signer_record_request(
  base,
  account,
  domain,
  data,
) {
  let method = http.Post
  let path =
    "/" <> int.to_string(account) <> "/domains/" <> domain <> "/ds_records"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_domain_delegation_signer_record_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.delegation_signer_decoder()),
        )
        decode.success(CreateDomainDelegationSignerRecordResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_domain_delegation_signer_records_request(
  base,
  account,
  domain,
  sort sort,
) {
  let method = http.Get
  let path =
    "/" <> int.to_string(account) <> "/domains/" <> domain <> "/ds_records"
  let query = [#("sort", sort)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_domain_delegation_signer_records_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.delegation_signer_decoder())),
        )
        use pagination <- decode.optional_field(
          "pagination",
          None,
          decode.optional(schema.pagination_decoder()),
        )
        decode.success(ListDomainDelegationSignerRecordsResponse(
          data: data,
          pagination: pagination,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn create_webhook_request(base, account, data) {
  let method = http.Post
  let path = "/" <> int.to_string(account) <> "/webhooks"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_webhook_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.webhook_decoder()),
        )
        decode.success(CreateWebhookResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        use errors <- decode.optional_field(
          "errors",
          None,
          decode.optional(
            decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
          ),
        )
        decode.success(CreateWebhookResponse(message: message, errors: errors))
      })
      |> result.map(Error)
  }
}

pub fn list_webhooks_request(base, account, sort sort) {
  let method = http.Get
  let path = "/" <> int.to_string(account) <> "/webhooks"
  let query = [#("sort", sort)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_webhooks_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.webhook_decoder())),
        )
        decode.success(ListWebhooksResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn update_contact_request(base, account, contact, data) {
  let method = http.Patch
  let path =
    "/" <> int.to_string(account) <> "/contacts/" <> int.to_string(contact)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn update_contact_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.contact_decoder()),
        )
        decode.success(UpdateContactResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn delete_contact_request(base, account, contact) {
  let method = http.Delete
  let path =
    "/" <> int.to_string(account) <> "/contacts/" <> int.to_string(contact)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn delete_contact_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(DeleteContactResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn get_contact_request(base, account, contact) {
  let method = http.Get
  let path =
    "/" <> int.to_string(account) <> "/contacts/" <> int.to_string(contact)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_contact_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.contact_decoder()),
        )
        decode.success(GetContactResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(GetContactResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn create_email_forward_request(base, account, domain, data) {
  let method = http.Post
  let path =
    "/" <> int.to_string(account) <> "/domains/" <> domain <> "/email_forwards"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_email_forward_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.email_forward_decoder()),
        )
        decode.success(CreateEmailForwardResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_email_forwards_request(base, account, domain, sort sort) {
  let method = http.Get
  let path =
    "/" <> int.to_string(account) <> "/domains/" <> domain <> "/email_forwards"
  let query = [#("sort", sort)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_email_forwards_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.email_forward_decoder())),
        )
        use pagination <- decode.optional_field(
          "pagination",
          None,
          decode.optional(schema.pagination_decoder()),
        )
        decode.success(ListEmailForwardsResponse(
          data: data,
          pagination: pagination,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn add_domain_collaborator_request(base, account, domain, data) {
  let method = http.Post
  let path =
    "/" <> int.to_string(account) <> "/domains/" <> domain <> "/collaborators"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn add_domain_collaborator_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.collaborator_decoder()),
        )
        decode.success(AddDomainCollaboratorResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_domain_collaborators_request(base, account, domain) {
  let method = http.Get
  let path =
    "/" <> int.to_string(account) <> "/domains/" <> domain <> "/collaborators"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_domain_collaborators_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.collaborator_decoder())),
        )
        use pagination <- decode.optional_field(
          "pagination",
          None,
          decode.optional(schema.pagination_decoder()),
        )
        decode.success(ListDomainCollaboratorsResponse(
          data: data,
          pagination: pagination,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn disable_vanity_name_servers_request(base, account, domain) {
  let method = http.Delete
  let path = "/" <> int.to_string(account) <> "/vanity/" <> domain
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn disable_vanity_name_servers_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn enable_vanity_name_servers_request(base, account, domain) {
  let method = http.Put
  let path = "/" <> int.to_string(account) <> "/vanity/" <> domain
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn enable_vanity_name_servers_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.vanity_name_server_decoder())),
        )
        decode.success(EnableVanityNameServersResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn whoami_request(base) {
  let method = http.Get
  let path = "/whoami"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn whoami_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(
            decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
          ),
        )
        decode.success(WhoamiResponse(data: data))
      })
      |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_services_request(base, sort sort) {
  let method = http.Get
  let path = "/services"
  let query = [#("sort", sort)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_services_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.service_decoder())),
        )
        use pagination <- decode.optional_field(
          "pagination",
          None,
          decode.optional(schema.pagination_decoder()),
        )
        decode.success(ListServicesResponse(data: data, pagination: pagination))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_certificate_request(base, account, domain, certificate) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/domains/"
    <> domain
    <> "/certificates/"
    <> int.to_string(certificate)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_certificate_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.certificate_decoder()),
        )
        decode.success(GetCertificateResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(GetCertificateResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn check_domain_request(base, account, domain) {
  let method = http.Get
  let path =
    "/" <> int.to_string(account) <> "/registrar/domains/" <> domain <> "/check"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn check_domain_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.domain_check_result_decoder()),
        )
        decode.success(CheckDomainResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn authorize_domain_transfer_out_request(base, account, domain) {
  let method = http.Post
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/authorize_transfer_out"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn authorize_domain_transfer_out_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        use errors <- decode.optional_field(
          "errors",
          None,
          decode.optional(
            decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
          ),
        )
        decode.success(AuthorizeDomainTransferOutResponse(
          message: message,
          errors: errors,
        ))
      })
      |> result.map(Error)
  }
}

pub fn transfer_domain_request(base, account, domain, data) {
  let method = http.Post
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/transfers"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn transfer_domain_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.domain_transfer_decoder()),
        )
        decode.success(TransferDomainResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        use errors <- decode.optional_field(
          "errors",
          None,
          decode.optional(
            decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
          ),
        )
        decode.success(TransferDomainResponse(message: message, errors: errors))
      })
      |> result.map(Error)
  }
}

pub fn get_domain_renewal_request(base, account, domain, domainrenewal) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/renewals/"
    <> int.to_string(domainrenewal)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_domain_renewal_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.domain_renewal_decoder()),
        )
        decode.success(GetDomainRenewalResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(GetDomainRenewalResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn download_certificate_request(base, account, domain, certificate) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/domains/"
    <> domain
    <> "/certificates/"
    <> int.to_string(certificate)
    <> "/download"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn download_certificate_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.certificate_download_decoder()),
        )
        decode.success(DownloadCertificateResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(DownloadCertificateResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn link_primary_server_request(base, account, primaryserver) {
  let method = http.Put
  let path =
    "/"
    <> int.to_string(account)
    <> "/secondary_dns/primaries/"
    <> int.to_string(primaryserver)
    <> "/link"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn link_primary_server_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.primary_server_decoder()),
        )
        decode.success(LinkPrimaryServerResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn issue_letsencrypt_certificate_request(base, account, domain, purchase_id) {
  let method = http.Post
  let path =
    "/"
    <> int.to_string(account)
    <> "/domains/"
    <> domain
    <> "/certificates/letsencrypt/"
    <> int.to_string(purchase_id)
    <> "/issue"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issue_letsencrypt_certificate_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    202 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.certificate_decoder()),
        )
        decode.success(IssueLetsencryptCertificateResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(IssueLetsencryptCertificateResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn get_domain_prices_request(base, account, domain) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/prices"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_domain_prices_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.domain_prices_decoder()),
        )
        decode.success(GetDomainPricesResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        use errors <- decode.optional_field(
          "errors",
          None,
          decode.optional(
            decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
          ),
        )
        decode.success(GetDomainPricesResponse(message: message, errors: errors))
      })
      |> result.map(Error)
  }
}

pub fn create_template_request(base, account, data) {
  let method = http.Post
  let path = "/" <> int.to_string(account) <> "/templates"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_template_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.template_decoder()),
        )
        decode.success(CreateTemplateResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        use errors <- decode.optional_field(
          "errors",
          None,
          decode.optional(
            decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
          ),
        )
        decode.success(CreateTemplateResponse(message: message, errors: errors))
      })
      |> result.map(Error)
  }
}

pub fn list_templates_request(base, account, sort sort) {
  let method = http.Get
  let path = "/" <> int.to_string(account) <> "/templates"
  let query = [#("sort", sort)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_templates_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.template_decoder())),
        )
        use pagination <- decode.optional_field(
          "pagination",
          None,
          decode.optional(schema.pagination_decoder()),
        )
        decode.success(ListTemplatesResponse(data: data, pagination: pagination))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn create_contact_request(base, account, data) {
  let method = http.Post
  let path = "/" <> int.to_string(account) <> "/contacts"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_contact_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.contact_decoder()),
        )
        decode.success(CreateContactResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        use errors <- decode.optional_field(
          "errors",
          None,
          decode.optional(
            decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
          ),
        )
        decode.success(CreateContactResponse(message: message, errors: errors))
      })
      |> result.map(Error)
  }
}

pub fn list_contacts_request(base, account, sort sort) {
  let method = http.Get
  let path = "/" <> int.to_string(account) <> "/contacts"
  let query = [#("sort", sort)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_contacts_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.contact_decoder())),
        )
        use pagination <- decode.optional_field(
          "pagination",
          None,
          decode.optional(schema.pagination_decoder()),
        )
        decode.success(ListContactsResponse(data: data, pagination: pagination))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn update_zone_ns_records_request(base, account, zone, data) {
  let method = http.Put
  let path = "/" <> int.to_string(account) <> "/zones/" <> zone <> "/ns_records"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn update_zone_ns_records_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.zone_record_decoder())),
        )
        decode.success(UpdateZoneNsRecordsResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(UpdateZoneNsRecordsResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn disable_domain_dnssec_request(base, account, domain) {
  let method = http.Delete
  let path = "/" <> int.to_string(account) <> "/domains/" <> domain <> "/dnssec"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn disable_domain_dnssec_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn enable_domain_dnssec_request(base, account, domain) {
  let method = http.Post
  let path = "/" <> int.to_string(account) <> "/domains/" <> domain <> "/dnssec"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn enable_domain_dnssec_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.dnssec_decoder()),
        )
        decode.success(EnableDomainDnssecResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_domain_dnssec_request(base, account, domain) {
  let method = http.Get
  let path = "/" <> int.to_string(account) <> "/domains/" <> domain <> "/dnssec"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_domain_dnssec_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.dnssec_decoder()),
        )
        decode.success(GetDomainDnssecResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn initiate_domain_push_request(base, account, domain, data) {
  let method = http.Post
  let path = "/" <> int.to_string(account) <> "/domains/" <> domain <> "/pushes"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn initiate_domain_push_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.push_decoder()),
        )
        decode.success(InitiateDomainPushResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_domain_premium_price_request(base, account, domain, action action) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/premium_price"
  let query = [#("action", action)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_domain_premium_price_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.domain_premium_price_decoder()),
        )
        decode.success(GetDomainPremiumPriceResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        use errors <- decode.optional_field(
          "errors",
          None,
          decode.optional(
            decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
          ),
        )
        decode.success(GetDomainPremiumPriceResponse(
          message: message,
          errors: errors,
        ))
      })
      |> result.map(Error)
  }
}

pub fn disable_domain_auto_renewal_request(base, account, domain) {
  let method = http.Delete
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/auto_renewal"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn disable_domain_auto_renewal_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn enable_domain_auto_renewal_request(base, account, domain) {
  let method = http.Put
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/auto_renewal"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn enable_domain_auto_renewal_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn change_domain_delegation_request(base, account, domain, data) {
  let method = http.Put
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/delegation"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn change_domain_delegation_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.domain_name_server_decoder())),
        )
        decode.success(ChangeDomainDelegationResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_domain_delegation_request(base, account, domain) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/delegation"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_domain_delegation_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.domain_name_server_decoder())),
        )
        decode.success(GetDomainDelegationResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(GetDomainDelegationResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn create_zone_record_request(base, account, zone, data) {
  let method = http.Post
  let path = "/" <> int.to_string(account) <> "/zones/" <> zone <> "/records"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_zone_record_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.zone_record_decoder()),
        )
        decode.success(CreateZoneRecordResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_zone_records_request(
  base,
  account,
  zone,
  name_like name_like,
  name name,
  type_ type_,
  sort sort,
) {
  let method = http.Get
  let path = "/" <> int.to_string(account) <> "/zones/" <> zone <> "/records"
  let query = [
    #("name_like", name_like),
    #("name", name),
    #("type_", type_),
    #("sort", sort),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_zone_records_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.zone_record_decoder())),
        )
        use pagination <- decode.optional_field(
          "pagination",
          None,
          decode.optional(schema.pagination_decoder()),
        )
        decode.success(ListZoneRecordsResponse(
          data: data,
          pagination: pagination,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn create_registrant_change_request(base, account, data) {
  let method = http.Post
  let path = "/" <> int.to_string(account) <> "/registrar/registrant_changes"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_registrant_change_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.registrant_change_decoder()),
        )
        decode.success(CreateRegistrantChangeResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        use errors <- decode.optional_field(
          "errors",
          None,
          decode.optional(
            decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
          ),
        )
        decode.success(CreateRegistrantChangeResponse(
          message: message,
          errors: errors,
        ))
      })
      |> result.map(Error)
  }
}

pub fn list_registrant_changes_request(
  base,
  account,
  sort sort,
  state state,
  domain_id domain_id,
  contact_id contact_id,
) {
  let method = http.Get
  let path = "/" <> int.to_string(account) <> "/registrar/registrant_changes"
  let query = [
    #("sort", sort),
    #("state", state),
    #("domain_id", domain_id),
    #("contact_id", contact_id),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_registrant_changes_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.registrant_change_decoder())),
        )
        use pagination <- decode.optional_field(
          "pagination",
          None,
          decode.optional(schema.pagination_decoder()),
        )
        decode.success(ListRegistrantChangesResponse(
          data: data,
          pagination: pagination,
        ))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        use errors <- decode.optional_field(
          "errors",
          None,
          decode.optional(
            decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
          ),
        )
        decode.success(ListRegistrantChangesResponse(
          message: message,
          errors: errors,
        ))
      })
      |> result.map(Error)
  }
}

pub fn create_template_record_request(base, account, template, data) {
  let method = http.Post
  let path =
    "/" <> int.to_string(account) <> "/templates/" <> template <> "/records"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_template_record_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.template_record_decoder()),
        )
        decode.success(CreateTemplateRecordResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_template_records_request(base, account, template, sort sort) {
  let method = http.Get
  let path =
    "/" <> int.to_string(account) <> "/templates/" <> template <> "/records"
  let query = [#("sort", sort)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_template_records_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.template_record_decoder())),
        )
        use pagination <- decode.optional_field(
          "pagination",
          None,
          decode.optional(schema.pagination_decoder()),
        )
        decode.success(ListTemplateRecordsResponse(
          data: data,
          pagination: pagination,
        ))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn check_zone_record_distribution_request(base, account, zone, zonerecord) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/zones/"
    <> zone
    <> "/records/"
    <> int.to_string(zonerecord)
    <> "/distribution"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn check_zone_record_distribution_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.zone_distribution_decoder()),
        )
        decode.success(CheckZoneRecordDistributionResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn disable_domain_transfer_lock_request(base, account, domain) {
  let method = http.Delete
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/transfer_lock"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn disable_domain_transfer_lock_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.domain_transfer_lock_decoder()),
        )
        decode.success(DisableDomainTransferLockResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn enable_domain_transfer_lock_request(base, account, domain) {
  let method = http.Post
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/transfer_lock"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn enable_domain_transfer_lock_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.domain_transfer_lock_decoder()),
        )
        decode.success(EnableDomainTransferLockResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_domain_transfer_lock_request(base, account, domain) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/transfer_lock"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_domain_transfer_lock_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.domain_transfer_lock_decoder()),
        )
        decode.success(GetDomainTransferLockResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(GetDomainTransferLockResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn create_secondary_zone_request(base, account, data) {
  let method = http.Post
  let path = "/" <> int.to_string(account) <> "/secondary_dns/zones"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_secondary_zone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.zone_decoder()),
        )
        decode.success(CreateSecondaryZoneResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        use errors <- decode.optional_field(
          "errors",
          None,
          decode.optional(
            decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
          ),
        )
        decode.success(CreateSecondaryZoneResponse(
          message: message,
          errors: errors,
        ))
      })
      |> result.map(Error)
  }
}

pub fn delete_template_record_request(base, account, template, templaterecord) {
  let method = http.Delete
  let path =
    "/"
    <> int.to_string(account)
    <> "/templates/"
    <> template
    <> "/records/"
    <> int.to_string(templaterecord)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn delete_template_record_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(DeleteTemplateRecordResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn get_template_record_request(base, account, template, templaterecord) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/templates/"
    <> template
    <> "/records/"
    <> int.to_string(templaterecord)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_template_record_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.template_record_decoder()),
        )
        decode.success(GetTemplateRecordResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(GetTemplateRecordResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn check_zone_distribution_request(base, account, zone) {
  let method = http.Get
  let path =
    "/" <> int.to_string(account) <> "/zones/" <> zone <> "/distribution"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn check_zone_distribution_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.zone_distribution_decoder()),
        )
        decode.success(CheckZoneDistributionResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn unlink_primary_server_request(base, account, primaryserver) {
  let method = http.Put
  let path =
    "/"
    <> int.to_string(account)
    <> "/secondary_dns/primaries/"
    <> int.to_string(primaryserver)
    <> "/unlink"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn unlink_primary_server_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.primary_server_decoder()),
        )
        decode.success(UnlinkPrimaryServerResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_service_request(base, service) {
  let method = http.Get
  let path = "/services/" <> service
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_service_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.service_decoder()),
        )
        decode.success(GetServiceResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(GetServiceResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn delete_webhook_request(base, account, webhook) {
  let method = http.Delete
  let path =
    "/" <> int.to_string(account) <> "/webhooks/" <> int.to_string(webhook)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn delete_webhook_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn get_webhook_request(base, account, webhook) {
  let method = http.Get
  let path =
    "/" <> int.to_string(account) <> "/webhooks/" <> int.to_string(webhook)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_webhook_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.webhook_decoder()),
        )
        decode.success(GetWebhookResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_tld_extended_attributes_request(base, tld) {
  let method = http.Get
  let path = "/tlds/" <> tld <> "/extended_attributes"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_tld_extended_attributes_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(decode.list(schema.extended_attribute_decoder())),
        )
        decode.success(GetTldExtendedAttributesResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(GetTldExtendedAttributesResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn domain_restore_request(base, account, domain, data) {
  let method = http.Post
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/restores"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn domain_restore_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.domain_restore_decoder()),
        )
        decode.success(DomainRestoreResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_domain_restore_request(base, account, domain, domainrestore) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/registrar/domains/"
    <> domain
    <> "/restores/"
    <> int.to_string(domainrestore)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_domain_restore_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.domain_restore_decoder()),
        )
        decode.success(GetDomainRestoreResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn purchase_renewal_letsencrypt_certificate_request(
  base,
  account,
  domain,
  certificate,
  data,
) {
  let method = http.Post
  let path =
    "/"
    <> int.to_string(account)
    <> "/domains/"
    <> domain
    <> "/certificates/letsencrypt/"
    <> int.to_string(certificate)
    <> "/renewals"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn purchase_renewal_letsencrypt_certificate_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.letsencrypt_certificate_renewal_decoder()),
        )
        decode.success(PurchaseRenewalLetsencryptCertificateResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(PurchaseRenewalLetsencryptCertificateResponse(
          message: message,
        ))
      })
      |> result.map(Error)
  }
}

pub fn get_certificate_private_key_request(base, account, domain, certificate) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/domains/"
    <> domain
    <> "/certificates/"
    <> int.to_string(certificate)
    <> "/private_key"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_certificate_private_key_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.certificate_private_key_decoder()),
        )
        decode.success(GetCertificatePrivateKeyResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(GetCertificatePrivateKeyResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn remove_primary_server_request(base, account, primaryserver) {
  let method = http.Delete
  let path =
    "/"
    <> int.to_string(account)
    <> "/secondary_dns/primaries/"
    <> int.to_string(primaryserver)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn remove_primary_server_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(RemovePrimaryServerResponse(message: message))
      })
      |> result.map(Error)
  }
}

pub fn get_primary_server_request(base, account, primaryserver) {
  let method = http.Get
  let path =
    "/"
    <> int.to_string(account)
    <> "/secondary_dns/primaries/"
    <> int.to_string(primaryserver)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_primary_server_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.primary_server_decoder()),
        )
        decode.success(GetPrimaryServerResponse(data: data))
      })
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn issue_renewal_letsencrypt_certificate_request(
  base,
  account,
  domain,
  certificate,
  renewal_id,
) {
  let method = http.Post
  let path =
    "/"
    <> int.to_string(account)
    <> "/domains/"
    <> domain
    <> "/certificates/letsencrypt/"
    <> int.to_string(certificate)
    <> "/renewals/"
    <> int.to_string(renewal_id)
    <> "/issue"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issue_renewal_letsencrypt_certificate_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    202 ->
      json.parse_bits(body, {
        use data <- decode.optional_field(
          "data",
          None,
          decode.optional(schema.certificate_decoder()),
        )
        decode.success(IssueRenewalLetsencryptCertificateResponse(data: data))
      })
      |> result.map(Ok)
    _ ->
      json.parse_bits(body, {
        use message <- decode.optional_field(
          "message",
          None,
          decode.optional(decode.string),
        )
        decode.success(IssueRenewalLetsencryptCertificateResponse(
          message: message,
        ))
      })
      |> result.map(Error)
  }
}
