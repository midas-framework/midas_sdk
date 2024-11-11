import decode/zero
import gleam/bool
import gleam/http
import gleam/http/response
import gleam/int
import gleam/option
import gleam/result
import midas/sdk/netlify/schema
import midas/sdk/utils
import midas/task

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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn change_domain_delegation_to_vanity_request(base, account, domain) {
  let method = http.Put
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

pub fn change_domain_delegation_to_vanity_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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

// pub fn delete_registrant_change_response(response) {
//   let response.Response(status: status, body: body, ..) = response
//   case status {
//     204 -> Ok(Nil) |> Ok
//     202 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
//     _ -> "API doesn't describe default response" |> Error |> Ok
//   }
// }

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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> utils.decode_bits(body, schema.error_decoder()) |> result.map(Error)
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn change_domain_delegation_request(base, account, domain) {
  let method = http.Put
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

pub fn change_domain_delegation_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    202 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
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
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}
