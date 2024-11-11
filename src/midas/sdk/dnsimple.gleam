import gleam/bit_array
import gleam/dynamic
import gleam/http
import gleam/http/request
import gleam/http/response.{Response}
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{None, Some}
import gleam/result.{try}
import gleam/string
import gleam/uri.{Uri}
import midas/sdk/dnsimple/operations
import midas/sdk/dnsimple/schema
import midas/task as t
import snag

pub type App {
  App(client_id: String, client_secret: String, redirect_uri: String)
}

const auth_host = "dnsimple.com"

const auth_path = "/oauth/authorize"

pub fn authenticate(app) {
  let state = int.to_string(int.random(1_000_000_000))
  do_authenticate(app, state)
}

pub fn do_authenticate(app, state) {
  let App(client_id, client_secret, redirect_uri) = app
  let url = auth_url(client_id, redirect_uri, state)
  use redirect <- t.do(t.follow(url))
  use #(code, returned_state) <- t.try(
    auth_redirect(redirect) |> result.map_error(snag.new),
  )
  use Nil <- t.try(case returned_state == state {
    True -> Ok(Nil)
    False -> Error(snag.new("returned state was not equal to sent state"))
  })

  let request =
    token_request(client_id, client_secret, redirect_uri, code, state)
  use response <- t.do(t.fetch(request))
  use token <- t.try(token_response(response))
  t.Done(token)
}

fn auth_url(client_id, redirect_uri, state) {
  let query = [
    #("client_id", client_id),
    #("response_type", "code"),
    #("redirect_uri", redirect_uri),
    #("state", state),
  ]
  let query = Some(uri.query_to_string(query))
  Uri(Some("https"), None, Some(auth_host), None, auth_path, query, None)
  |> uri.to_string
}

pub fn auth_redirect(redirect) {
  let Uri(query: query, ..) = redirect
  use query <- try(case query {
    Some(query) -> Ok(query)
    None -> Error("uri did not have a query: " <> string.inspect(redirect))
  })
  use parts <- try(
    uri.parse_query(query)
    |> result.replace_error("Failed to parse query: " <> query),
  )
  use code <- try(key_find(parts, "code"))
  use returned_state <- try(key_find(parts, "state"))
  Ok(#(code, returned_state))
}

fn key_find(items, key) {
  list.key_find(items, key)
  |> result.replace_error("Did not find key: " <> key)
}

const token_path = "/v2/oauth/access_token"

pub fn token_request(client_id, client_secret, redirect_uri, code, state) {
  let query = [
    #("grant_type", "authorization_code"),
    #("client_id", client_id),
    #("client_secret", client_secret),
    #("code", code),
    #("redirect_uri", redirect_uri),
    #("state", state),
  ]

  request.new()
  |> request.set_host(api_host)
  |> request.set_method(http.Post)
  |> request.set_path(token_path)
  |> request.prepend_header("content-type", "application/x-www-form-urlencoded")
  |> request.set_body(bit_array.from_string(uri.query_to_string(query)))
}

pub fn token_response(response) {
  let Response(body: body, ..) = response
  let assert Ok(body) = bit_array.to_string(body)
  let decoder =
    dynamic.decode2(
      fn(a, b) { #(a, b) },
      dynamic.field("access_token", dynamic.string),
      dynamic.field("account_id", dynamic.int),
    )
  let assert Ok(token) = json.decode(body, decoder)
  Ok(token)
}

pub const api_host = "api.dnsimple.com"

fn base_request(token) {
  request.new()
  |> request.set_host(api_host)
  |> request.prepend_header("Authorization", string.append("Bearer ", token))
  |> request.set_body(<<>>)
}

fn get(token, path) {
  base_request(token)
  |> request.set_path(path)
  |> request.set_body(<<>>)
}

fn handle_errors(response) {
  case response {
    Ok(Ok(data)) -> Ok(data)
    Ok(Error(message)) ->
      // snag.new(option.unwrap(message, "no error message"))
      snag.new(message)
      |> snag.layer("error from api")
      |> Error
    Error(reason) ->
      snag.new(string.inspect(reason))
      |> snag.layer("failed to decode sites")
      |> Error
  }
}

// fn post(token, path, mime, content) {
//   base_request(token)
//   |> request.set_method(http.Post)
//   |> request.set_path(path)
//   |> request.prepend_header("content-type", mime)
//   |> request.set_body(content)
// }

// pub fn list_domains(token, account) {
//   let request = list_domains_request(token, account)
//   use response <- t.do(t.fetch(request))
//   use response <- t.try(list_domains_response(response))
//   t.Done(response)
// }

// pub fn list_domains_request(token, account) {
//   let path = "/v2/" <> int.to_string(account) <> "/domains"
//   get(token, path)
// }

// pub fn list_domains_response(response: response.Response(BitArray)) {
//   use json <- try(
//     bit_array.to_string(response.body)
//     |> result.replace_error(snag.new("not utf8 encoded")),
//   )
//   let decoder = dynamic.field("data", dynamic.list(domain_decoder))
//   use videos <- try(
//     json.decode_bits(response.body, decoder)
//     |> result.replace_error(snag.new("failed to decode vieos")),
//   )
//   Ok(videos)
// }

// pub type Domain {
//   Domain(id: Int, name: String)
// }

// fn domain_decoder(raw) {
//   dynamic.decode2(
//     Domain,
//     dynamic.field("id", dynamic.int),
//     dynamic.field("name", dynamic.string),
//   )(raw)
// }
// GENERATED -------------

pub fn register_domain(token, account, domain, data) {
  let request = base_request(token)
  let request =
    operations.register_domain_request(request, account, domain, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.register_domain_response(response)),
  )
  t.Done(data)
}

pub fn check_registrant_change(token, account, data) {
  let request = base_request(token)
  let request =
    operations.check_registrant_change_request(request, account, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_registrant_change_response(response)),
  )
  t.Done(data)
}

pub fn query_dns_analytics(
  token,
  account,
  start_date start_date,
  end_date end_date,
  groupings groupings,
  sort sort,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.query_dns_analytics_request(
      request,
      account,
      start_date,
      end_date,
      groupings,
      sort,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.query_dns_analytics_response(response)),
  )
  t.Done(data)
}

pub fn list_domain_applied_services(token, account, domain) {
  let request = base_request(token)
  let request =
    operations.list_domain_applied_services_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_domain_applied_services_response(response)),
  )
  t.Done(data)
}

pub fn create_domain(token, account, data) {
  let request = base_request(token)
  let request = operations.create_domain_request(request, account, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.create_domain_response(response)))
  t.Done(data)
}

pub fn list_domains(
  token,
  account,
  name_like name_like,
  registrant_id registrant_id,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.list_domains_request(
      request,
      account,
      name_like,
      registrant_id,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.list_domains_response(response)))
  t.Done(data)
}

pub fn create_primary_server(token, account, data) {
  let request = base_request(token)
  let request = operations.create_primary_server_request(request, account, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_primary_server_response(response)),
  )
  t.Done(data)
}

pub fn list_primary_servers(token, account, sort sort) {
  let request = base_request(token)
  let request = operations.list_primary_servers_request(request, account, sort)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_primary_servers_response(response)),
  )
  t.Done(data)
}

pub fn remove_domain_collaborator(token, account, domain, collaborator) {
  let request = base_request(token)
  let request =
    operations.remove_domain_collaborator_request(
      request,
      account,
      domain,
      collaborator,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.remove_domain_collaborator_response(response)),
  )
  t.Done(data)
}

pub fn reject_push(token, account, push) {
  let request = base_request(token)
  let request = operations.reject_push_request(request, account, push)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.reject_push_response(response)))
  t.Done(data)
}

pub fn accept_push(token, account, push, data) {
  let request = base_request(token)
  let request = operations.accept_push_request(request, account, push, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.accept_push_response(response)))
  t.Done(data)
}

pub fn apply_template_to_domain(token, account, domain, template) {
  let request = base_request(token)
  let request =
    operations.apply_template_to_domain_request(
      request,
      account,
      domain,
      template,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apply_template_to_domain_response(response)),
  )
  t.Done(data)
}

pub fn list_pushes(token, account) {
  let request = base_request(token)
  let request = operations.list_pushes_request(request, account)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.list_pushes_response(response)))
  t.Done(data)
}

pub fn list_certificates(token, account, domain, sort sort) {
  let request = base_request(token)
  let request =
    operations.list_certificates_request(request, account, domain, sort)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_certificates_response(response)),
  )
  t.Done(data)
}

pub fn get_zone_file(token, account, zone) {
  let request = base_request(token)
  let request = operations.get_zone_file_request(request, account, zone)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_zone_file_response(response)))
  t.Done(data)
}

pub fn delete_email_forward(token, account, domain, emailforward) {
  let request = base_request(token)
  let request =
    operations.delete_email_forward_request(
      request,
      account,
      domain,
      emailforward,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_email_forward_response(response)),
  )
  t.Done(data)
}

pub fn get_email_forward(token, account, domain, emailforward) {
  let request = base_request(token)
  let request =
    operations.get_email_forward_request(request, account, domain, emailforward)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_email_forward_response(response)),
  )
  t.Done(data)
}

pub fn list_charges(
  token,
  account,
  start_date start_date,
  end_date end_date,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.list_charges_request(
      request,
      account,
      start_date,
      end_date,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.list_charges_response(response)))
  t.Done(data)
}

pub fn purchase_letsencrypt_certificate(token, account, domain, data) {
  let request = base_request(token)
  let request =
    operations.purchase_letsencrypt_certificate_request(
      request,
      account,
      domain,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.purchase_letsencrypt_certificate_response(response)),
  )
  t.Done(data)
}

pub fn domain_renew(token, account, domain, data) {
  let request = base_request(token)
  let request = operations.domain_renew_request(request, account, domain, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.domain_renew_response(response)))
  t.Done(data)
}

pub fn cancel_domain_transfer(token, account, domain, domaintransfer) {
  let request = base_request(token)
  let request =
    operations.cancel_domain_transfer_request(
      request,
      account,
      domain,
      domaintransfer,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.cancel_domain_transfer_response(response)),
  )
  t.Done(data)
}

pub fn get_domain_transfer(token, account, domain, domaintransfer) {
  let request = base_request(token)
  let request =
    operations.get_domain_transfer_request(
      request,
      account,
      domain,
      domaintransfer,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_domain_transfer_response(response)),
  )
  t.Done(data)
}

pub fn get_domain_registration(token, account, domain, domainregistration) {
  let request = base_request(token)
  let request =
    operations.get_domain_registration_request(
      request,
      account,
      domain,
      domainregistration,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_domain_registration_response(response)),
  )
  t.Done(data)
}

pub fn list_tlds(token, sort sort) {
  let request = base_request(token)
  let request = operations.list_tlds_request(request, sort)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.list_tlds_response(response)))
  t.Done(data)
}

pub fn change_domain_delegation_from_vanity(token, account, domain) {
  let request = base_request(token)
  let request =
    operations.change_domain_delegation_from_vanity_request(
      request,
      account,
      domain,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.change_domain_delegation_from_vanity_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn change_domain_delegation_to_vanity(token, account, domain) {
  let request = base_request(token)
  let request =
    operations.change_domain_delegation_to_vanity_request(
      request,
      account,
      domain,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.change_domain_delegation_to_vanity_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn list_accounts(token) {
  let request = base_request(token)
  let request = operations.list_accounts_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.list_accounts_response(response)))
  t.Done(data)
}

pub fn disable_whois_privacy(token, account, domain) {
  let request = base_request(token)
  let request =
    operations.disable_whois_privacy_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.disable_whois_privacy_response(response)),
  )
  t.Done(data)
}

pub fn enable_whois_privacy(token, account, domain) {
  let request = base_request(token)
  let request =
    operations.enable_whois_privacy_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.enable_whois_privacy_response(response)),
  )
  t.Done(data)
}

pub fn get_whois_privacy(token, account, domain) {
  let request = base_request(token)
  let request = operations.get_whois_privacy_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_whois_privacy_response(response)),
  )
  t.Done(data)
}

pub fn renew_whois_privacy(token, account, domain) {
  let request = base_request(token)
  let request = operations.renew_whois_privacy_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.renew_whois_privacy_response(response)),
  )
  t.Done(data)
}

pub fn deactivate_zone_service(token, account, zone) {
  let request = base_request(token)
  let request =
    operations.deactivate_zone_service_request(request, account, zone)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.deactivate_zone_service_response(response)),
  )
  t.Done(data)
}

pub fn activate_zone_service(token, account, zone) {
  let request = base_request(token)
  let request = operations.activate_zone_service_request(request, account, zone)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activate_zone_service_response(response)),
  )
  t.Done(data)
}

pub fn list_zones(token, account, name_like name_like, sort sort) {
  let request = base_request(token)
  let request = operations.list_zones_request(request, account, name_like, sort)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.list_zones_response(response)))
  t.Done(data)
}

pub fn get_tld(token, tld) {
  let request = base_request(token)
  let request = operations.get_tld_request(request, tld)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_tld_response(response)))
  t.Done(data)
}

pub fn delete_domain_delegation_signer_record(token, account, domain, ds) {
  let request = base_request(token)
  let request =
    operations.delete_domain_delegation_signer_record_request(
      request,
      account,
      domain,
      ds,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_domain_delegation_signer_record_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn get_domain_delegation_signer_record(token, account, domain, ds) {
  let request = base_request(token)
  let request =
    operations.get_domain_delegation_signer_record_request(
      request,
      account,
      domain,
      ds,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_domain_delegation_signer_record_response(
      response,
    )),
  )
  t.Done(data)
}

// pub fn delete_registrant_change(token, account, registrantchange) {
//   let request = base_request(token)
//   let request =
//     operations.delete_registrant_change_request(
//       request,
//       account,
//       registrantchange,
//     )
//   use response <- t.do(t.fetch(request))
//   use data <- t.try(
//     handle_errors(operations.delete_registrant_change_response(response)),
//   )
//   t.Done(data)
// }

pub fn get_registrant_change(token, account, registrantchange) {
  let request = base_request(token)
  let request =
    operations.get_registrant_change_request(request, account, registrantchange)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_registrant_change_response(response)),
  )
  t.Done(data)
}

pub fn update_template(token, account, template, data) {
  let request = base_request(token)
  let request =
    operations.update_template_request(request, account, template, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_template_response(response)),
  )
  t.Done(data)
}

pub fn delete_template(token, account, template) {
  let request = base_request(token)
  let request = operations.delete_template_request(request, account, template)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_template_response(response)),
  )
  t.Done(data)
}

pub fn get_template(token, account, template) {
  let request = base_request(token)
  let request = operations.get_template_request(request, account, template)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_template_response(response)))
  t.Done(data)
}

pub fn delete_domain(token, account, domain) {
  let request = base_request(token)
  let request = operations.delete_domain_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_domain_response(response)))
  t.Done(data)
}

pub fn get_domain(token, account, domain) {
  let request = base_request(token)
  let request = operations.get_domain_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_domain_response(response)))
  t.Done(data)
}

pub fn get_zone(token, account, zone) {
  let request = base_request(token)
  let request = operations.get_zone_request(request, account, zone)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_zone_response(response)))
  t.Done(data)
}

pub fn unapply_service_from_domain(token, account, domain, service) {
  let request = base_request(token)
  let request =
    operations.unapply_service_from_domain_request(
      request,
      account,
      domain,
      service,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.unapply_service_from_domain_response(response)),
  )
  t.Done(data)
}

pub fn apply_service_to_domain(token, account, domain, service, data) {
  let request = base_request(token)
  let request =
    operations.apply_service_to_domain_request(
      request,
      account,
      domain,
      service,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apply_service_to_domain_response(response)),
  )
  t.Done(data)
}

pub fn update_zone_record(token, account, zone, zonerecord, data) {
  let request = base_request(token)
  let request =
    operations.update_zone_record_request(
      request,
      account,
      zone,
      zonerecord,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_zone_record_response(response)),
  )
  t.Done(data)
}

pub fn delete_zone_record(token, account, zone, zonerecord, data) {
  let request = base_request(token)
  let request =
    operations.delete_zone_record_request(
      request,
      account,
      zone,
      zonerecord,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_zone_record_response(response)),
  )
  t.Done(data)
}

pub fn get_zone_record(token, account, zone, zonerecord) {
  let request = base_request(token)
  let request =
    operations.get_zone_record_request(request, account, zone, zonerecord)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_zone_record_response(response)),
  )
  t.Done(data)
}

pub fn create_domain_delegation_signer_record(token, account, domain, data) {
  let request = base_request(token)
  let request =
    operations.create_domain_delegation_signer_record_request(
      request,
      account,
      domain,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_domain_delegation_signer_record_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn list_domain_delegation_signer_records(token, account, domain, sort sort) {
  let request = base_request(token)
  let request =
    operations.list_domain_delegation_signer_records_request(
      request,
      account,
      domain,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_domain_delegation_signer_records_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn create_webhook(token, account, data) {
  let request = base_request(token)
  let request = operations.create_webhook_request(request, account, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.create_webhook_response(response)))
  t.Done(data)
}

pub fn list_webhooks(token, account, sort sort) {
  let request = base_request(token)
  let request = operations.list_webhooks_request(request, account, sort)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.list_webhooks_response(response)))
  t.Done(data)
}

pub fn update_contact(token, account, contact, data) {
  let request = base_request(token)
  let request =
    operations.update_contact_request(request, account, contact, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.update_contact_response(response)))
  t.Done(data)
}

pub fn delete_contact(token, account, contact) {
  let request = base_request(token)
  let request = operations.delete_contact_request(request, account, contact)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_contact_response(response)))
  t.Done(data)
}

pub fn get_contact(token, account, contact) {
  let request = base_request(token)
  let request = operations.get_contact_request(request, account, contact)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_contact_response(response)))
  t.Done(data)
}

pub fn create_email_forward(token, account, domain, data) {
  let request = base_request(token)
  let request =
    operations.create_email_forward_request(request, account, domain, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_email_forward_response(response)),
  )
  t.Done(data)
}

pub fn list_email_forwards(token, account, domain, sort sort) {
  let request = base_request(token)
  let request =
    operations.list_email_forwards_request(request, account, domain, sort)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_email_forwards_response(response)),
  )
  t.Done(data)
}

pub fn add_domain_collaborator(token, account, domain, data) {
  let request = base_request(token)
  let request =
    operations.add_domain_collaborator_request(request, account, domain, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_domain_collaborator_response(response)),
  )
  t.Done(data)
}

pub fn list_domain_collaborators(token, account, domain) {
  let request = base_request(token)
  let request =
    operations.list_domain_collaborators_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_domain_collaborators_response(response)),
  )
  t.Done(data)
}

pub fn disable_vanity_name_servers(token, account, domain) {
  let request = base_request(token)
  let request =
    operations.disable_vanity_name_servers_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.disable_vanity_name_servers_response(response)),
  )
  t.Done(data)
}

pub fn enable_vanity_name_servers(token, account, domain) {
  let request = base_request(token)
  let request =
    operations.enable_vanity_name_servers_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.enable_vanity_name_servers_response(response)),
  )
  t.Done(data)
}

// pub fn whoami(token) {
//   let request = base_request(token)
//   let request = operations.whoami_request(request)
//   use response <- t.do(t.fetch(request))
//   use data <- t.try(handle_errors(operations.whoami_response(response)))
//   t.Done(data)
// }

pub fn list_services(token, sort sort) {
  let request = base_request(token)
  let request = operations.list_services_request(request, sort)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.list_services_response(response)))
  t.Done(data)
}

pub fn get_certificate(token, account, domain, certificate) {
  let request = base_request(token)
  let request =
    operations.get_certificate_request(request, account, domain, certificate)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_certificate_response(response)),
  )
  t.Done(data)
}

pub fn check_domain(token, account, domain) {
  let request = base_request(token)
  let request = operations.check_domain_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.check_domain_response(response)))
  t.Done(data)
}

pub fn authorize_domain_transfer_out(token, account, domain) {
  let request = base_request(token)
  let request =
    operations.authorize_domain_transfer_out_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.authorize_domain_transfer_out_response(response)),
  )
  t.Done(data)
}

pub fn transfer_domain(token, account, domain, data) {
  let request = base_request(token)
  let request =
    operations.transfer_domain_request(request, account, domain, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.transfer_domain_response(response)),
  )
  t.Done(data)
}

pub fn get_domain_renewal(token, account, domain, domainrenewal) {
  let request = base_request(token)
  let request =
    operations.get_domain_renewal_request(
      request,
      account,
      domain,
      domainrenewal,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_domain_renewal_response(response)),
  )
  t.Done(data)
}

pub fn download_certificate(token, account, domain, certificate) {
  let request = base_request(token)
  let request =
    operations.download_certificate_request(
      request,
      account,
      domain,
      certificate,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.download_certificate_response(response)),
  )
  t.Done(data)
}

pub fn link_primary_server(token, account, primaryserver) {
  let request = base_request(token)
  let request =
    operations.link_primary_server_request(request, account, primaryserver)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.link_primary_server_response(response)),
  )
  t.Done(data)
}

pub fn issue_letsencrypt_certificate(token, account, domain, purchase_id) {
  let request = base_request(token)
  let request =
    operations.issue_letsencrypt_certificate_request(
      request,
      account,
      domain,
      purchase_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issue_letsencrypt_certificate_response(response)),
  )
  t.Done(data)
}

pub fn get_domain_prices(token, account, domain) {
  let request = base_request(token)
  let request = operations.get_domain_prices_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_domain_prices_response(response)),
  )
  t.Done(data)
}

pub fn create_template(token, account, data) {
  let request = base_request(token)
  let request = operations.create_template_request(request, account, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_template_response(response)),
  )
  t.Done(data)
}

pub fn list_templates(token, account, sort sort) {
  let request = base_request(token)
  let request = operations.list_templates_request(request, account, sort)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.list_templates_response(response)))
  t.Done(data)
}

pub fn create_contact(token, account, data) {
  let request = base_request(token)
  let request = operations.create_contact_request(request, account, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.create_contact_response(response)))
  t.Done(data)
}

pub fn list_contacts(token, account, sort sort) {
  let request = base_request(token)
  let request = operations.list_contacts_request(request, account, sort)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.list_contacts_response(response)))
  t.Done(data)
}

pub fn update_zone_ns_records(token, account, zone, data) {
  let request = base_request(token)
  let request =
    operations.update_zone_ns_records_request(request, account, zone, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_zone_ns_records_response(response)),
  )
  t.Done(data)
}

pub fn disable_domain_dnssec(token, account, domain) {
  let request = base_request(token)
  let request =
    operations.disable_domain_dnssec_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.disable_domain_dnssec_response(response)),
  )
  t.Done(data)
}

pub fn enable_domain_dnssec(token, account, domain) {
  let request = base_request(token)
  let request =
    operations.enable_domain_dnssec_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.enable_domain_dnssec_response(response)),
  )
  t.Done(data)
}

pub fn get_domain_dnssec(token, account, domain) {
  let request = base_request(token)
  let request = operations.get_domain_dnssec_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_domain_dnssec_response(response)),
  )
  t.Done(data)
}

pub fn initiate_domain_push(token, account, domain, data) {
  let request = base_request(token)
  let request =
    operations.initiate_domain_push_request(request, account, domain, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.initiate_domain_push_response(response)),
  )
  t.Done(data)
}

pub fn get_domain_premium_price(token, account, domain, action action) {
  let request = base_request(token)
  let request =
    operations.get_domain_premium_price_request(
      request,
      account,
      domain,
      action,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_domain_premium_price_response(response)),
  )
  t.Done(data)
}

pub fn disable_domain_auto_renewal(token, account, domain) {
  let request = base_request(token)
  let request =
    operations.disable_domain_auto_renewal_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.disable_domain_auto_renewal_response(response)),
  )
  t.Done(data)
}

pub fn enable_domain_auto_renewal(token, account, domain) {
  let request = base_request(token)
  let request =
    operations.enable_domain_auto_renewal_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.enable_domain_auto_renewal_response(response)),
  )
  t.Done(data)
}

pub fn change_domain_delegation(token, account, domain) {
  let request = base_request(token)
  let request =
    operations.change_domain_delegation_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.change_domain_delegation_response(response)),
  )
  t.Done(data)
}

pub fn get_domain_delegation(token, account, domain) {
  let request = base_request(token)
  let request =
    operations.get_domain_delegation_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_domain_delegation_response(response)),
  )
  t.Done(data)
}

pub fn create_zone_record(token, account, zone, data) {
  let request = base_request(token)
  let request =
    operations.create_zone_record_request(request, account, zone, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_zone_record_response(response)),
  )
  t.Done(data)
}

pub fn list_zone_records(
  token,
  account,
  zone,
  name_like name_like,
  name name,
  type_ type_,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.list_zone_records_request(
      request,
      account,
      zone,
      name_like,
      name,
      type_,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_zone_records_response(response)),
  )
  t.Done(data)
}

pub fn create_registrant_change(token, account, data) {
  let request = base_request(token)
  let request =
    operations.create_registrant_change_request(request, account, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_registrant_change_response(response)),
  )
  t.Done(data)
}

pub fn list_registrant_changes(
  token,
  account,
  sort sort,
  state state,
  domain_id domain_id,
  contact_id contact_id,
) {
  let request = base_request(token)
  let request =
    operations.list_registrant_changes_request(
      request,
      account,
      sort,
      state,
      domain_id,
      contact_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_registrant_changes_response(response)),
  )
  t.Done(data)
}

pub fn create_template_record(token, account, template, data) {
  let request = base_request(token)
  let request =
    operations.create_template_record_request(request, account, template, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_template_record_response(response)),
  )
  t.Done(data)
}

pub fn list_template_records(token, account, template, sort sort) {
  let request = base_request(token)
  let request =
    operations.list_template_records_request(request, account, template, sort)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_template_records_response(response)),
  )
  t.Done(data)
}

pub fn check_zone_record_distribution(token, account, zone, zonerecord) {
  let request = base_request(token)
  let request =
    operations.check_zone_record_distribution_request(
      request,
      account,
      zone,
      zonerecord,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_zone_record_distribution_response(response)),
  )
  t.Done(data)
}

pub fn disable_domain_transfer_lock(token, account, domain) {
  let request = base_request(token)
  let request =
    operations.disable_domain_transfer_lock_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.disable_domain_transfer_lock_response(response)),
  )
  t.Done(data)
}

pub fn enable_domain_transfer_lock(token, account, domain) {
  let request = base_request(token)
  let request =
    operations.enable_domain_transfer_lock_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.enable_domain_transfer_lock_response(response)),
  )
  t.Done(data)
}

pub fn get_domain_transfer_lock(token, account, domain) {
  let request = base_request(token)
  let request =
    operations.get_domain_transfer_lock_request(request, account, domain)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_domain_transfer_lock_response(response)),
  )
  t.Done(data)
}

pub fn create_secondary_zone(token, account, data) {
  let request = base_request(token)
  let request = operations.create_secondary_zone_request(request, account, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_secondary_zone_response(response)),
  )
  t.Done(data)
}

pub fn delete_template_record(token, account, template, templaterecord) {
  let request = base_request(token)
  let request =
    operations.delete_template_record_request(
      request,
      account,
      template,
      templaterecord,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_template_record_response(response)),
  )
  t.Done(data)
}

pub fn get_template_record(token, account, template, templaterecord) {
  let request = base_request(token)
  let request =
    operations.get_template_record_request(
      request,
      account,
      template,
      templaterecord,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_template_record_response(response)),
  )
  t.Done(data)
}

pub fn check_zone_distribution(token, account, zone) {
  let request = base_request(token)
  let request =
    operations.check_zone_distribution_request(request, account, zone)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.check_zone_distribution_response(response)),
  )
  t.Done(data)
}

pub fn unlink_primary_server(token, account, primaryserver) {
  let request = base_request(token)
  let request =
    operations.unlink_primary_server_request(request, account, primaryserver)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.unlink_primary_server_response(response)),
  )
  t.Done(data)
}

pub fn get_service(token, service) {
  let request = base_request(token)
  let request = operations.get_service_request(request, service)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_service_response(response)))
  t.Done(data)
}

pub fn delete_webhook(token, account, webhook) {
  let request = base_request(token)
  let request = operations.delete_webhook_request(request, account, webhook)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_webhook_response(response)))
  t.Done(data)
}

pub fn get_webhook(token, account, webhook) {
  let request = base_request(token)
  let request = operations.get_webhook_request(request, account, webhook)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_webhook_response(response)))
  t.Done(data)
}

pub fn get_tld_extended_attributes(token, tld) {
  let request = base_request(token)
  let request = operations.get_tld_extended_attributes_request(request, tld)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_tld_extended_attributes_response(response)),
  )
  t.Done(data)
}

pub fn domain_restore(token, account, domain, data) {
  let request = base_request(token)
  let request =
    operations.domain_restore_request(request, account, domain, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.domain_restore_response(response)))
  t.Done(data)
}

pub fn get_domain_restore(token, account, domain, domainrestore) {
  let request = base_request(token)
  let request =
    operations.get_domain_restore_request(
      request,
      account,
      domain,
      domainrestore,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_domain_restore_response(response)),
  )
  t.Done(data)
}

pub fn purchase_renewal_letsencrypt_certificate(
  token,
  account,
  domain,
  certificate,
  data,
) {
  let request = base_request(token)
  let request =
    operations.purchase_renewal_letsencrypt_certificate_request(
      request,
      account,
      domain,
      certificate,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.purchase_renewal_letsencrypt_certificate_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn get_certificate_private_key(token, account, domain, certificate) {
  let request = base_request(token)
  let request =
    operations.get_certificate_private_key_request(
      request,
      account,
      domain,
      certificate,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_certificate_private_key_response(response)),
  )
  t.Done(data)
}

pub fn remove_primary_server(token, account, primaryserver) {
  let request = base_request(token)
  let request =
    operations.remove_primary_server_request(request, account, primaryserver)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.remove_primary_server_response(response)),
  )
  t.Done(data)
}

pub fn get_primary_server(token, account, primaryserver) {
  let request = base_request(token)
  let request =
    operations.get_primary_server_request(request, account, primaryserver)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_primary_server_response(response)),
  )
  t.Done(data)
}

pub fn issue_renewal_letsencrypt_certificate(
  token,
  account,
  domain,
  certificate,
  renewal_id,
) {
  let request = base_request(token)
  let request =
    operations.issue_renewal_letsencrypt_certificate_request(
      request,
      account,
      domain,
      certificate,
      renewal_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issue_renewal_letsencrypt_certificate_response(
      response,
    )),
  )
  t.Done(data)
}
