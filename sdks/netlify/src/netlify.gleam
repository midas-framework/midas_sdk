import gleam/bit_array
import gleam/dynamic/decode
import gleam/http
import gleam/http/request
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{None, Some}
import gleam/result.{try}
import gleam/string
import gleam/uri.{Uri}
import midas/task as t
import netlify/operations
import snag

pub type App {
  App(client_id: String, redirect_uri: String)
}

const auth_host = "app.netlify.com"

const auth_path = "/authorize"

pub fn authenticate(app) {
  let App(client_id, redirect_uri) = app
  let state = int.to_string(int.random(1_000_000_000))
  let url = auth_url(client_id, redirect_uri, state)

  use redirect <- t.do(t.follow(url))
  use #(access_token, token_type, returned_state) <- t.try(
    auth_redirect(redirect) |> result.map_error(snag.new),
  )
  use Nil <- t.try(case returned_state == state {
    True -> Ok(Nil)
    False -> Error(snag.new("returned state was not equal to sent state"))
  })

  use Nil <- t.try(case token_type == "Bearer" {
    True -> Ok(Nil)
    False -> Error(snag.new("returned token_type was not 'Bearer'"))
  })
  t.Done(access_token)
}

fn auth_url(client_id, redirect_uri, state) {
  let query = [
    #("client_id", client_id),
    #("response_type", "token"),
    #("redirect_uri", redirect_uri),
    #("state", state),
  ]
  let query = Some(uri.query_to_string(query))
  Uri(Some("https"), None, Some(auth_host), None, auth_path, query, None)
  |> uri.to_string
}

pub fn auth_redirect(redirect) {
  let Uri(fragment: fragment, ..) = redirect
  use hash <- try(case fragment {
    Some(hash) -> Ok(hash)
    None -> Error("uri did not have a fragment")
  })
  use parts <- try(
    uri.parse_query(hash)
    |> result.replace_error("Failed to parse query: " <> hash),
  )
  use access_token <- try(key_find(parts, "access_token"))
  use token_type <- try(key_find(parts, "token_type"))
  use returned_state <- try(key_find(parts, "state"))
  Ok(#(access_token, token_type, returned_state))
}

fn key_find(items, key) {
  list.key_find(items, key)
  |> result.replace_error("Did not find key: " <> key)
}

pub const api_host = "api.netlify.com"

pub fn deploy_site(token, site_id, files) {
  use zipped <- t.do(t.zip(files))
  let path = string.concat(["/api/v1/sites/", site_id, "/deploys"])
  let r = post(token, path, "application/zip", zipped)

  use response <- t.do(t.fetch(r))
  use body <- t.do(case response.status {
    200 -> t.Done(response.body)
    other ->
      t.Abort(snag.new("Status was not OK got: " <> int.to_string(other)))
  })
  let assert Ok(body) = bit_array.to_string(body)
  let assert Ok(data) =
    json.parse(body, decode.field("state", decode.string, decode.success))
  t.Done(data)
}

pub fn base_request(token) {
  request.new()
  |> request.set_host(api_host)
  |> request.prepend_header("Authorization", string.append("Bearer ", token))
  |> request.set_path("/api/v1")
  |> request.set_body(<<>>)
}

fn post(token, path, mime, content) {
  base_request(token)
  |> request.set_method(http.Post)
  |> request.set_path(path)
  |> request.prepend_header("content-type", mime)
  |> request.set_body(content)
}

fn handle_errors(response) {
  case response {
    Ok(response) -> Ok(response)
    Error(reason) ->
      snag.new(string.inspect(reason))
      |> snag.layer("failed to decode")
      |> Error
  }
}

// GENERATED -------------

pub fn enable_hook(token, hook_id) {
  let request = base_request(token)
  let request = operations.enable_hook_request(request, hook_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.enable_hook_response(response)))
  t.Done(data)
}

pub fn search_site_functions(token, site_id, filter filter) {
  let request = base_request(token)
  let request =
    operations.search_site_functions_request(request, site_id, filter)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.search_site_functions_response(response)),
  )
  t.Done(data)
}

pub fn list_account_types_for_user(token) {
  let request = base_request(token)
  let request = operations.list_account_types_for_user_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_account_types_for_user_response(response)),
  )
  t.Done(data)
}

pub fn create_site_asset(
  token,
  site_id,
  name name,
  size size,
  content_type content_type,
  visibility visibility,
) {
  let request = base_request(token)
  let request =
    operations.create_site_asset_request(
      request,
      site_id,
      name,
      size,
      content_type,
      visibility,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_site_asset_response(response)),
  )
  t.Done(data)
}

pub fn list_site_assets(token, site_id) {
  let request = base_request(token)
  let request = operations.list_site_assets_request(request, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_site_assets_response(response)),
  )
  t.Done(data)
}

pub fn add_member_to_account(token, account_slug, account_add_member_setup) {
  let request = base_request(token)
  let request =
    operations.add_member_to_account_request(
      request,
      account_slug,
      account_add_member_setup,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.add_member_to_account_response(response)),
  )
  t.Done(data)
}

pub fn list_members_for_account(token, account_slug) {
  let request = base_request(token)
  let request =
    operations.list_members_for_account_request(request, account_slug)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_members_for_account_response(response)),
  )
  t.Done(data)
}

pub fn update_split_test(token, site_id, split_test_id, split_test_setup) {
  let request = base_request(token)
  let request =
    operations.update_split_test_request(
      request,
      site_id,
      split_test_id,
      split_test_setup,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_split_test_response(response)),
  )
  t.Done(data)
}

pub fn get_split_test(token, site_id, split_test_id) {
  let request = base_request(token)
  let request =
    operations.get_split_test_request(request, site_id, split_test_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_split_test_response(response)))
  t.Done(data)
}

pub fn delete_dns_zone(token, zone_id) {
  let request = base_request(token)
  let request = operations.delete_dns_zone_request(request, zone_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_dns_zone_response(response)),
  )
  t.Done(data)
}

pub fn get_dns_zone(token, zone_id) {
  let request = base_request(token)
  let request = operations.get_dns_zone_request(request, zone_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_dns_zone_response(response)))
  t.Done(data)
}

pub fn create_site(token, site_setup, configure_dns configure_dns) {
  let request = base_request(token)
  let request =
    operations.create_site_request(request, site_setup, configure_dns)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.create_site_response(response)))
  t.Done(data)
}

pub fn list_sites(token, name name, filter filter, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.list_sites_request(request, name, filter, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.list_sites_response(response)))
  t.Done(data)
}

pub fn delete_env_var_value(token, account_id, key, id, site_id site_id) {
  let request = base_request(token)
  let request =
    operations.delete_env_var_value_request(
      request,
      account_id,
      key,
      id,
      site_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_env_var_value_response(response)),
  )
  t.Done(data)
}

pub fn create_deploy_key(token) {
  let request = base_request(token)
  let request = operations.create_deploy_key_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_deploy_key_response(response)),
  )
  t.Done(data)
}

pub fn list_deploy_keys(token) {
  let request = base_request(token)
  let request = operations.list_deploy_keys_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_deploy_keys_response(response)),
  )
  t.Done(data)
}

pub fn transfer_dns_zone(
  token,
  zone_id,
  account_id account_id,
  transfer_account_id transfer_account_id,
  transfer_user_id transfer_user_id,
) {
  let request = base_request(token)
  let request =
    operations.transfer_dns_zone_request(
      request,
      zone_id,
      account_id,
      transfer_account_id,
      transfer_user_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.transfer_dns_zone_response(response)),
  )
  t.Done(data)
}

pub fn enable_split_test(token, site_id, split_test_id) {
  let request = base_request(token)
  let request =
    operations.enable_split_test_request(request, site_id, split_test_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.enable_split_test_response(response)),
  )
  t.Done(data)
}

pub fn get_site_file_by_path_name(token, site_id, file_path) {
  let request = base_request(token)
  let request =
    operations.get_site_file_by_path_name_request(request, site_id, file_path)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_site_file_by_path_name_response(response)),
  )
  t.Done(data)
}

pub fn delete_site_dev_server_hook(token, site_id, id) {
  let request = base_request(token)
  let request =
    operations.delete_site_dev_server_hook_request(request, site_id, id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_site_dev_server_hook_response(response)),
  )
  t.Done(data)
}

pub fn update_site_dev_server_hook(token, site_id, id, dev_server_hook_setup) {
  let request = base_request(token)
  let request =
    operations.update_site_dev_server_hook_request(
      request,
      site_id,
      id,
      dev_server_hook_setup,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_site_dev_server_hook_response(response)),
  )
  t.Done(data)
}

pub fn get_site_dev_server_hook(token, site_id, id) {
  let request = base_request(token)
  let request =
    operations.get_site_dev_server_hook_request(request, site_id, id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_site_dev_server_hook_response(response)),
  )
  t.Done(data)
}

pub fn purge_cache(token, purge) {
  let request = base_request(token)
  let request = operations.purge_cache_request(request, purge)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.purge_cache_response(response)))
  t.Done(data)
}

pub fn list_site_deployed_branches(token, site_id) {
  let request = base_request(token)
  let request = operations.list_site_deployed_branches_request(request, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_site_deployed_branches_response(response)),
  )
  t.Done(data)
}

pub fn list_account_audit_events(
  token,
  account_id,
  query query,
  log_type log_type,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.list_account_audit_events_request(
      request,
      account_id,
      query,
      log_type,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_account_audit_events_response(response)),
  )
  t.Done(data)
}

pub fn show_ticket(token, ticket_id) {
  let request = base_request(token)
  let request = operations.show_ticket_request(request, ticket_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.show_ticket_response(response)))
  t.Done(data)
}

pub fn list_site_files(token, site_id) {
  let request = base_request(token)
  let request = operations.list_site_files_request(request, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_site_files_response(response)),
  )
  t.Done(data)
}

pub fn create_site_dev_server_hook(token, site_id, dev_server_hook_setup) {
  let request = base_request(token)
  let request =
    operations.create_site_dev_server_hook_request(
      request,
      site_id,
      dev_server_hook_setup,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_site_dev_server_hook_response(response)),
  )
  t.Done(data)
}

pub fn list_site_dev_server_hooks(token, site_id) {
  let request = base_request(token)
  let request = operations.list_site_dev_server_hooks_request(request, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_site_dev_server_hooks_response(response)),
  )
  t.Done(data)
}

pub fn create_dns_record(token, zone_id, dns_record_create) {
  let request = base_request(token)
  let request =
    operations.create_dns_record_request(request, zone_id, dns_record_create)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_dns_record_response(response)),
  )
  t.Done(data)
}

pub fn get_dns_records(token, zone_id) {
  let request = base_request(token)
  let request = operations.get_dns_records_request(request, zone_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_dns_records_response(response)),
  )
  t.Done(data)
}

pub fn get_current_user(token) {
  let request = base_request(token)
  let request = operations.get_current_user_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_current_user_response(response)),
  )
  t.Done(data)
}

pub fn delete_deploy_key(token, key_id) {
  let request = base_request(token)
  let request = operations.delete_deploy_key_request(request, key_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_deploy_key_response(response)),
  )
  t.Done(data)
}

pub fn get_deploy_key(token, key_id) {
  let request = base_request(token)
  let request = operations.get_deploy_key_request(request, key_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_deploy_key_response(response)))
  t.Done(data)
}

pub fn exchange_ticket(token, ticket_id) {
  let request = base_request(token)
  let request = operations.exchange_ticket_request(request, ticket_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.exchange_ticket_response(response)),
  )
  t.Done(data)
}

pub fn create_split_test(token, site_id, split_test_setup) {
  let request = base_request(token)
  let request =
    operations.create_split_test_request(request, site_id, split_test_setup)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_split_test_response(response)),
  )
  t.Done(data)
}

pub fn get_split_tests(token, site_id) {
  let request = base_request(token)
  let request = operations.get_split_tests_request(request, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_split_tests_response(response)),
  )
  t.Done(data)
}

pub fn set_env_var_value(token, account_id, key, data, site_id site_id) {
  let request = base_request(token)
  let request =
    operations.set_env_var_value_request(
      request,
      account_id,
      key,
      data,
      site_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.set_env_var_value_response(response)),
  )
  t.Done(data)
}

pub fn delete_env_var(token, account_id, key, site_id site_id) {
  let request = base_request(token)
  let request =
    operations.delete_env_var_request(request, account_id, key, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_env_var_response(response)))
  t.Done(data)
}

pub fn update_env_var(token, account_id, key, data, site_id site_id) {
  let request = base_request(token)
  let request =
    operations.update_env_var_request(request, account_id, key, data, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.update_env_var_response(response)))
  t.Done(data)
}

pub fn get_env_var(token, account_id, key, site_id site_id) {
  let request = base_request(token)
  let request =
    operations.get_env_var_request(request, account_id, key, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_env_var_response(response)))
  t.Done(data)
}

pub fn cancel_site_deploy(token, deploy_id) {
  let request = base_request(token)
  let request = operations.cancel_site_deploy_request(request, deploy_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.cancel_site_deploy_response(response)),
  )
  t.Done(data)
}

pub fn list_payment_methods_for_user(token) {
  let request = base_request(token)
  let request = operations.list_payment_methods_for_user_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_payment_methods_for_user_response(response)),
  )
  t.Done(data)
}

pub fn delete_service_instance(token, site_id, addon, instance_id) {
  let request = base_request(token)
  let request =
    operations.delete_service_instance_request(
      request,
      site_id,
      addon,
      instance_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_service_instance_response(response)),
  )
  t.Done(data)
}

pub fn update_service_instance(token, site_id, addon, instance_id, data) {
  let request = base_request(token)
  let request =
    operations.update_service_instance_request(
      request,
      site_id,
      addon,
      instance_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_service_instance_response(response)),
  )
  t.Done(data)
}

pub fn show_service_instance(token, site_id, addon, instance_id) {
  let request = base_request(token)
  let request =
    operations.show_service_instance_request(
      request,
      site_id,
      addon,
      instance_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.show_service_instance_response(response)),
  )
  t.Done(data)
}

pub fn create_account(token, account_setup) {
  let request = base_request(token)
  let request = operations.create_account_request(request, account_setup)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.create_account_response(response)))
  t.Done(data)
}

pub fn list_accounts_for_user(token) {
  let request = base_request(token)
  let request = operations.list_accounts_for_user_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_accounts_for_user_response(response)),
  )
  t.Done(data)
}

pub fn delete_submission(token, submission_id) {
  let request = base_request(token)
  let request = operations.delete_submission_request(request, submission_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_submission_response(response)),
  )
  t.Done(data)
}

pub fn list_form_submission(
  token,
  submission_id,
  query query,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.list_form_submission_request(
      request,
      submission_id,
      query,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_form_submission_response(response)),
  )
  t.Done(data)
}

pub fn delete_hook(token, hook_id) {
  let request = base_request(token)
  let request = operations.delete_hook_request(request, hook_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_hook_response(response)))
  t.Done(data)
}

pub fn update_hook(token, hook_id, hook) {
  let request = base_request(token)
  let request = operations.update_hook_request(request, hook_id, hook)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.update_hook_response(response)))
  t.Done(data)
}

pub fn get_hook(token, hook_id) {
  let request = base_request(token)
  let request = operations.get_hook_request(request, hook_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_hook_response(response)))
  t.Done(data)
}

pub fn update_site(token, site_id, site_setup) {
  let request = base_request(token)
  let request = operations.update_site_request(request, site_id, site_setup)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.update_site_response(response)))
  t.Done(data)
}

pub fn delete_site(token, site_id) {
  let request = base_request(token)
  let request = operations.delete_site_request(request, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_site_response(response)))
  t.Done(data)
}

pub fn get_site(token, site_id) {
  let request = base_request(token)
  let request = operations.get_site_request(request, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_site_response(response)))
  t.Done(data)
}

pub fn list_site_forms(token, site_id) {
  let request = base_request(token)
  let request = operations.list_site_forms_request(request, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_site_forms_response(response)),
  )
  t.Done(data)
}

pub fn show_service_manifest(token, addon_name) {
  let request = base_request(token)
  let request = operations.show_service_manifest_request(request, addon_name)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.show_service_manifest_response(response)),
  )
  t.Done(data)
}

pub fn delete_site_build_hook(token, site_id, id) {
  let request = base_request(token)
  let request = operations.delete_site_build_hook_request(request, site_id, id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_site_build_hook_response(response)),
  )
  t.Done(data)
}

pub fn update_site_build_hook(token, site_id, id, build_hook_setup) {
  let request = base_request(token)
  let request =
    operations.update_site_build_hook_request(
      request,
      site_id,
      id,
      build_hook_setup,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_site_build_hook_response(response)),
  )
  t.Done(data)
}

pub fn get_site_build_hook(token, site_id, id) {
  let request = base_request(token)
  let request = operations.get_site_build_hook_request(request, site_id, id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_site_build_hook_response(response)),
  )
  t.Done(data)
}

pub fn delete_deploy(token, deploy_id) {
  let request = base_request(token)
  let request = operations.delete_deploy_request(request, deploy_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_deploy_response(response)))
  t.Done(data)
}

pub fn get_deploy(token, deploy_id) {
  let request = base_request(token)
  let request = operations.get_deploy_request(request, deploy_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_deploy_response(response)))
  t.Done(data)
}

pub fn create_site_snippet(token, site_id, snippet) {
  let request = base_request(token)
  let request =
    operations.create_site_snippet_request(request, site_id, snippet)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_site_snippet_response(response)),
  )
  t.Done(data)
}

pub fn list_site_snippets(token, site_id) {
  let request = base_request(token)
  let request = operations.list_site_snippets_request(request, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_site_snippets_response(response)),
  )
  t.Done(data)
}

pub fn create_service_instance(token, site_id, addon, data) {
  let request = base_request(token)
  let request =
    operations.create_service_instance_request(request, site_id, addon, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_service_instance_response(response)),
  )
  t.Done(data)
}

pub fn get_site_build(token, build_id) {
  let request = base_request(token)
  let request = operations.get_site_build_request(request, build_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_site_build_response(response)))
  t.Done(data)
}

pub fn get_account_build_status(token, account_id) {
  let request = base_request(token)
  let request = operations.get_account_build_status_request(request, account_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_account_build_status_response(response)),
  )
  t.Done(data)
}

pub fn create_site_in_team(
  token,
  account_slug,
  site_setup,
  configure_dns configure_dns,
) {
  let request = base_request(token)
  let request =
    operations.create_site_in_team_request(
      request,
      account_slug,
      site_setup,
      configure_dns,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_site_in_team_response(response)),
  )
  t.Done(data)
}

pub fn list_sites_for_account(
  token,
  account_slug,
  name name,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.list_sites_for_account_request(
      request,
      account_slug,
      name,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_sites_for_account_response(response)),
  )
  t.Done(data)
}

pub fn upload_deploy_file(token, deploy_id, path_, size size) {
  let request = base_request(token)
  let request =
    operations.upload_deploy_file_request(request, deploy_id, path_, size)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.upload_deploy_file_response(response)),
  )
  t.Done(data)
}

pub fn get_site_env_vars(token, site_id, context_name context_name, scope scope) {
  let request = base_request(token)
  let request =
    operations.get_site_env_vars_request(request, site_id, context_name, scope)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_site_env_vars_response(response)),
  )
  t.Done(data)
}

pub fn delete_dns_record(token, zone_id, dns_record_id) {
  let request = base_request(token)
  let request =
    operations.delete_dns_record_request(request, zone_id, dns_record_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_dns_record_response(response)),
  )
  t.Done(data)
}

pub fn get_individual_dns_record(token, zone_id, dns_record_id) {
  let request = base_request(token)
  let request =
    operations.get_individual_dns_record_request(
      request,
      zone_id,
      dns_record_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_individual_dns_record_response(response)),
  )
  t.Done(data)
}

pub fn create_site_deploy(
  token,
  site_id,
  deploy_files,
  title title,
  deploy_previews deploy_previews,
  production production,
  state state,
  branch branch,
  latest_published latest_published,
) {
  let request = base_request(token)
  let request =
    operations.create_site_deploy_request(
      request,
      site_id,
      deploy_files,
      title,
      deploy_previews,
      production,
      state,
      branch,
      latest_published,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_site_deploy_response(response)),
  )
  t.Done(data)
}

pub fn list_site_deploys(
  token,
  site_id,
  page page,
  per_page per_page,
  deploy_previews deploy_previews,
  production production,
  state state,
  branch branch,
  latest_published latest_published,
) {
  let request = base_request(token)
  let request =
    operations.list_site_deploys_request(
      request,
      site_id,
      page,
      per_page,
      deploy_previews,
      production,
      state,
      branch,
      latest_published,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_site_deploys_response(response)),
  )
  t.Done(data)
}

pub fn provision_site_tlscertificate(
  token,
  site_id,
  certificate certificate,
  key key,
  ca_certificates ca_certificates,
) {
  let request = base_request(token)
  let request =
    operations.provision_site_tlscertificate_request(
      request,
      site_id,
      certificate,
      key,
      ca_certificates,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.provision_site_tlscertificate_response(response)),
  )
  t.Done(data)
}

pub fn show_site_tlscertificate(token, site_id) {
  let request = base_request(token)
  let request = operations.show_site_tlscertificate_request(request, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.show_site_tlscertificate_response(response)),
  )
  t.Done(data)
}

pub fn cancel_account(token, account_id) {
  let request = base_request(token)
  let request = operations.cancel_account_request(request, account_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.cancel_account_response(response)))
  t.Done(data)
}

pub fn update_account(token, account_id, account_update_setup) {
  let request = base_request(token)
  let request =
    operations.update_account_request(request, account_id, account_update_setup)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.update_account_response(response)))
  t.Done(data)
}

pub fn get_account(token, account_id) {
  let request = base_request(token)
  let request = operations.get_account_request(request, account_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_account_response(response)))
  t.Done(data)
}

pub fn create_env_vars(token, account_id, data, site_id site_id) {
  let request = base_request(token)
  let request =
    operations.create_env_vars_request(request, account_id, data, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_env_vars_response(response)),
  )
  t.Done(data)
}

pub fn get_env_vars(
  token,
  account_id,
  context_name context_name,
  scope scope,
  site_id site_id,
) {
  let request = base_request(token)
  let request =
    operations.get_env_vars_request(
      request,
      account_id,
      context_name,
      scope,
      site_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_env_vars_response(response)))
  t.Done(data)
}

pub fn configure_dnsfor_site(token, site_id) {
  let request = base_request(token)
  let request = operations.configure_dnsfor_site_request(request, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.configure_dnsfor_site_response(response)),
  )
  t.Done(data)
}

pub fn get_dnsfor_site(token, site_id) {
  let request = base_request(token)
  let request = operations.get_dnsfor_site_request(request, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_dnsfor_site_response(response)),
  )
  t.Done(data)
}

pub fn list_form_submissions(token, form_id, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.list_form_submissions_request(request, form_id, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_form_submissions_response(response)),
  )
  t.Done(data)
}

pub fn update_site_metadata(token, site_id, metadata) {
  let request = base_request(token)
  let request =
    operations.update_site_metadata_request(request, site_id, metadata)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_site_metadata_response(response)),
  )
  t.Done(data)
}

pub fn get_site_metadata(token, site_id) {
  let request = base_request(token)
  let request = operations.get_site_metadata_request(request, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_site_metadata_response(response)),
  )
  t.Done(data)
}

pub fn show_service(token, addon_name) {
  let request = base_request(token)
  let request = operations.show_service_request(request, addon_name)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.show_service_response(response)))
  t.Done(data)
}

pub fn list_hook_types(token) {
  let request = base_request(token)
  let request = operations.list_hook_types_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_hook_types_response(response)),
  )
  t.Done(data)
}

pub fn list_site_submissions(token, site_id, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.list_site_submissions_request(request, site_id, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_site_submissions_response(response)),
  )
  t.Done(data)
}

pub fn delete_site_dev_servers(token, site_id, branch branch) {
  let request = base_request(token)
  let request =
    operations.delete_site_dev_servers_request(request, site_id, branch)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_site_dev_servers_response(response)),
  )
  t.Done(data)
}

pub fn create_site_dev_server(token, site_id, branch branch) {
  let request = base_request(token)
  let request =
    operations.create_site_dev_server_request(request, site_id, branch)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_site_dev_server_response(response)),
  )
  t.Done(data)
}

pub fn list_site_dev_servers(token, site_id, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.list_site_dev_servers_request(request, site_id, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_site_dev_servers_response(response)),
  )
  t.Done(data)
}

pub fn list_service_instances_for_site(token, site_id) {
  let request = base_request(token)
  let request =
    operations.list_service_instances_for_site_request(request, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_service_instances_for_site_response(response)),
  )
  t.Done(data)
}

pub fn get_site_asset_public_signature(token, site_id, asset_id) {
  let request = base_request(token)
  let request =
    operations.get_site_asset_public_signature_request(
      request,
      site_id,
      asset_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_site_asset_public_signature_response(response)),
  )
  t.Done(data)
}

pub fn delete_site_asset(token, site_id, asset_id) {
  let request = base_request(token)
  let request = operations.delete_site_asset_request(request, site_id, asset_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_site_asset_response(response)),
  )
  t.Done(data)
}

pub fn update_site_asset(token, site_id, asset_id, state state) {
  let request = base_request(token)
  let request =
    operations.update_site_asset_request(request, site_id, asset_id, state)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_site_asset_response(response)),
  )
  t.Done(data)
}

pub fn get_site_asset_info(token, site_id, asset_id) {
  let request = base_request(token)
  let request =
    operations.get_site_asset_info_request(request, site_id, asset_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_site_asset_info_response(response)),
  )
  t.Done(data)
}

pub fn remove_account_member(token, account_slug, member_id) {
  let request = base_request(token)
  let request =
    operations.remove_account_member_request(request, account_slug, member_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.remove_account_member_response(response)),
  )
  t.Done(data)
}

pub fn update_account_member(
  token,
  account_slug,
  member_id,
  account_update_member_setup,
) {
  let request = base_request(token)
  let request =
    operations.update_account_member_request(
      request,
      account_slug,
      member_id,
      account_update_member_setup,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_account_member_response(response)),
  )
  t.Done(data)
}

pub fn get_account_member(token, account_slug, member_id) {
  let request = base_request(token)
  let request =
    operations.get_account_member_request(request, account_slug, member_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_account_member_response(response)),
  )
  t.Done(data)
}

pub fn upload_deploy_function(
  token,
  deploy_id,
  name,
  runtime runtime,
  invocation_mode invocation_mode,
  timeout timeout,
  size size,
) {
  let request = base_request(token)
  let request =
    operations.upload_deploy_function_request(
      request,
      deploy_id,
      name,
      runtime,
      invocation_mode,
      timeout,
      size,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.upload_deploy_function_response(response)),
  )
  t.Done(data)
}

pub fn lock_deploy(token, deploy_id) {
  let request = base_request(token)
  let request = operations.lock_deploy_request(request, deploy_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.lock_deploy_response(response)))
  t.Done(data)
}

pub fn delete_site_deploy(token, site_id, deploy_id) {
  let request = base_request(token)
  let request =
    operations.delete_site_deploy_request(request, site_id, deploy_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_site_deploy_response(response)),
  )
  t.Done(data)
}

pub fn update_site_deploy(token, site_id, deploy_id, deploy_files) {
  let request = base_request(token)
  let request =
    operations.update_site_deploy_request(
      request,
      site_id,
      deploy_id,
      deploy_files,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_site_deploy_response(response)),
  )
  t.Done(data)
}

pub fn get_site_deploy(token, site_id, deploy_id) {
  let request = base_request(token)
  let request = operations.get_site_deploy_request(request, site_id, deploy_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_site_deploy_response(response)),
  )
  t.Done(data)
}

pub fn update_site_build_log(token, build_id) {
  let request = base_request(token)
  let request = operations.update_site_build_log_request(request, build_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_site_build_log_response(response)),
  )
  t.Done(data)
}

pub fn get_site_dev_server(token, site_id, dev_server_id) {
  let request = base_request(token)
  let request =
    operations.get_site_dev_server_request(request, site_id, dev_server_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_site_dev_server_response(response)),
  )
  t.Done(data)
}

pub fn delete_site_form(token, site_id, form_id) {
  let request = base_request(token)
  let request = operations.delete_site_form_request(request, site_id, form_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_site_form_response(response)),
  )
  t.Done(data)
}

pub fn restore_site_deploy(token, site_id, deploy_id) {
  let request = base_request(token)
  let request =
    operations.restore_site_deploy_request(request, site_id, deploy_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.restore_site_deploy_response(response)),
  )
  t.Done(data)
}

pub fn disable_split_test(token, site_id, split_test_id) {
  let request = base_request(token)
  let request =
    operations.disable_split_test_request(request, site_id, split_test_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.disable_split_test_response(response)),
  )
  t.Done(data)
}

pub fn notify_build_start(
  token,
  build_id,
  buildbot_version buildbot_version,
  build_version build_version,
) {
  let request = base_request(token)
  let request =
    operations.notify_build_start_request(
      request,
      build_id,
      buildbot_version,
      build_version,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.notify_build_start_response(response)),
  )
  t.Done(data)
}

pub fn create_site_build_hook(token, site_id, build_hook_setup) {
  let request = base_request(token)
  let request =
    operations.create_site_build_hook_request(
      request,
      site_id,
      build_hook_setup,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_site_build_hook_response(response)),
  )
  t.Done(data)
}

pub fn list_site_build_hooks(token, site_id) {
  let request = base_request(token)
  let request = operations.list_site_build_hooks_request(request, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_site_build_hooks_response(response)),
  )
  t.Done(data)
}

pub fn delete_site_snippet(token, site_id, snippet_id) {
  let request = base_request(token)
  let request =
    operations.delete_site_snippet_request(request, site_id, snippet_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_site_snippet_response(response)),
  )
  t.Done(data)
}

pub fn update_site_snippet(token, site_id, snippet_id, snippet) {
  let request = base_request(token)
  let request =
    operations.update_site_snippet_request(
      request,
      site_id,
      snippet_id,
      snippet,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_site_snippet_response(response)),
  )
  t.Done(data)
}

pub fn get_site_snippet(token, site_id, snippet_id) {
  let request = base_request(token)
  let request =
    operations.get_site_snippet_request(request, site_id, snippet_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_site_snippet_response(response)),
  )
  t.Done(data)
}

pub fn unlink_site_repo(token, site_id) {
  let request = base_request(token)
  let request = operations.unlink_site_repo_request(request, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.unlink_site_repo_response(response)),
  )
  t.Done(data)
}

pub fn create_dns_zone(token, dns_zone_setup) {
  let request = base_request(token)
  let request = operations.create_dns_zone_request(request, dns_zone_setup)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_dns_zone_response(response)),
  )
  t.Done(data)
}

pub fn get_dns_zones(token, account_slug account_slug) {
  let request = base_request(token)
  let request = operations.get_dns_zones_request(request, account_slug)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_dns_zones_response(response)))
  t.Done(data)
}

pub fn get_services(token, search search) {
  let request = base_request(token)
  let request = operations.get_services_request(request, search)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.get_services_response(response)))
  t.Done(data)
}

pub fn create_site_build(token, site_id, build_setup) {
  let request = base_request(token)
  let request =
    operations.create_site_build_request(request, site_id, build_setup)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_site_build_response(response)),
  )
  t.Done(data)
}

pub fn list_site_builds(token, site_id, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.list_site_builds_request(request, site_id, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_site_builds_response(response)),
  )
  t.Done(data)
}

pub fn create_hook_by_site_id(token, hook, site_id site_id) {
  let request = base_request(token)
  let request =
    operations.create_hook_by_site_id_request(request, hook, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_hook_by_site_id_response(response)),
  )
  t.Done(data)
}

pub fn list_hooks_by_site_id(token, site_id site_id) {
  let request = base_request(token)
  let request = operations.list_hooks_by_site_id_request(request, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_hooks_by_site_id_response(response)),
  )
  t.Done(data)
}

pub fn create_ticket(token, client_id client_id) {
  let request = base_request(token)
  let request = operations.create_ticket_request(request, client_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.create_ticket_response(response)))
  t.Done(data)
}

pub fn rollback_site_deploy(token, site_id) {
  let request = base_request(token)
  let request = operations.rollback_site_deploy_request(request, site_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.rollback_site_deploy_response(response)),
  )
  t.Done(data)
}

pub fn unlock_deploy(token, deploy_id) {
  let request = base_request(token)
  let request = operations.unlock_deploy_request(request, deploy_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.unlock_deploy_response(response)))
  t.Done(data)
}
