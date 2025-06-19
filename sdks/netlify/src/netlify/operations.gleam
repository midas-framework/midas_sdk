import gleam/bool
import gleam/result
import gleam/dynamic/decode
import gleam/json
import gleam/float
import gleam/int
import gleam/http/response
import gleam/http
import netlify/schema
import netlify/utils
import gleam/option.{type Option, None}

pub type ShowServiceManifestResponse {
  ShowServiceManifestResponse()
}

pub fn enable_hook_request(base, hook_id) {
  let method = http.Post
  let path = "/hooks/" <> hook_id <> "/enable"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn enable_hook_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.hook_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn search_site_functions_request(base, site_id, filter filter) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/functions"
  let query = [#("filter", filter)]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn search_site_functions_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.site_function_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_account_types_for_user_request(base) {
  let method = http.Get
  let path = "/accounts/types"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_account_types_for_user_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.account_type_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_site_asset_request(
  base,
  site_id,
  name name,
  size size,
  content_type content_type,
  visibility visibility,
) {
  let method = http.Post
  let path = "/sites/" <> site_id <> "/assets"
  let query = [
    #("name", option.Some(name)),
    #("size", option.Some(int.to_string(size))),
    #("content_type", option.Some(content_type)),
    #("visibility", visibility)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn create_site_asset_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.asset_signature_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_site_assets_request(base, site_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/assets"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_site_assets_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.asset_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn add_member_to_account_request(
  base,
  account_slug,
  account_add_member_setup,
) {
  let method = http.Post
  let path = "/" <> account_slug <> "/members"
  let query = []
  let body = utils.json_to_bits(
    schema.account_add_member_setup_encode(account_add_member_setup),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn add_member_to_account_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.member_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_members_for_account_request(base, account_slug) {
  let method = http.Get
  let path = "/" <> account_slug <> "/members"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_members_for_account_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.member_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn update_split_test_request(base, site_id, split_test_id, split_test_setup) {
  let method = http.Put
  let path = "/sites/" <> site_id <> "/traffic_splits/" <> split_test_id
  let query = []
  let body = utils.json_to_bits(schema.split_test_setup_encode(split_test_setup))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn update_split_test_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.split_test_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_split_test_request(base, site_id, split_test_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/traffic_splits/" <> split_test_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_split_test_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.split_test_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_dns_zone_request(base, zone_id) {
  let method = http.Delete
  let path = "/dns_zones/" <> zone_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_dns_zone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_dns_zone_request(base, zone_id) {
  let method = http.Get
  let path = "/dns_zones/" <> zone_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_dns_zone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.dns_zone_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_site_request(base, site_setup, configure_dns configure_dns) {
  let method = http.Post
  let path = "/sites"
  let query = [#("configure_dns", option.map(configure_dns, bool.to_string))]
  let body = utils.json_to_bits(schema.site_setup_encode(site_setup))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_site_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.site_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_sites_request(
  base,
  name name,
  filter filter,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/sites"
  let query = [
    #("name", name),
    #("filter", filter),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_sites_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.site_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_env_var_value_request(base, account_id, key, id, site_id site_id) {
  let method = http.Delete
  let path = "/accounts/" <> account_id <> "/env/" <> key <> "/value/" <> id
  let query = [#("site_id", site_id)]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_env_var_value_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_deploy_key_request(base) {
  let method = http.Post
  let path = "/deploy_keys"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn create_deploy_key_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.deploy_key_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_deploy_keys_request(base) {
  let method = http.Get
  let path = "/deploy_keys"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_deploy_keys_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.deploy_key_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn transfer_dns_zone_request(
  base,
  zone_id,
  account_id account_id,
  transfer_account_id transfer_account_id,
  transfer_user_id transfer_user_id,
) {
  let method = http.Put
  let path = "/dns_zones/" <> zone_id <> "/transfer"
  let query = [
    #("account_id", option.Some(account_id)),
    #("transfer_account_id", option.Some(transfer_account_id)),
    #("transfer_user_id", option.Some(transfer_user_id))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn transfer_dns_zone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.dns_zone_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn enable_split_test_request(base, site_id, split_test_id) {
  let method = http.Post
  let path = "/sites/" <> site_id <> "/traffic_splits/" <> split_test_id <> "/publish"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn enable_split_test_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_site_file_by_path_name_request(base, site_id, file_path) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/files/" <> file_path
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_site_file_by_path_name_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.file_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_site_dev_server_hook_request(base, site_id, id) {
  let method = http.Delete
  let path = "/sites/" <> site_id <> "/dev_server_hooks/" <> id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_site_dev_server_hook_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn update_site_dev_server_hook_request(
  base,
  site_id,
  id,
  dev_server_hook_setup,
) {
  let method = http.Put
  let path = "/sites/" <> site_id <> "/dev_server_hooks/" <> id
  let query = []
  let body = utils.json_to_bits(
    schema.dev_server_hook_setup_encode(dev_server_hook_setup),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn update_site_dev_server_hook_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_site_dev_server_hook_request(base, site_id, id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/dev_server_hooks/" <> id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_site_dev_server_hook_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.dev_server_hook_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn purge_cache_request(base, purge) {
  let method = http.Post
  let path = "/purge"
  let query = []
  let body = utils.json_to_bits(schema.purge_encode(purge))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn purge_cache_response(response) {
  let response.Response(status:, ..) = response
  case status {
    202 -> Ok(Nil) |> Ok
    _ -> Error(Nil) |> Ok
  }
}

pub fn list_site_deployed_branches_request(base, site_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/deployed-branches"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_site_deployed_branches_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.deployed_branch_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_account_audit_events_request(
  base,
  account_id,
  query query,
  log_type log_type,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/accounts/" <> account_id <> "/audit"
  let query = [
    #("query", query),
    #("log_type", log_type),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_account_audit_events_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.audit_log_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn show_ticket_request(base, ticket_id) {
  let method = http.Get
  let path = "/oauth/tickets/" <> ticket_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn show_ticket_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.ticket_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_site_files_request(base, site_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/files"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_site_files_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.file_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_site_dev_server_hook_request(base, site_id, dev_server_hook_setup) {
  let method = http.Post
  let path = "/sites/" <> site_id <> "/dev_server_hooks"
  let query = []
  let body = utils.json_to_bits(
    schema.dev_server_hook_setup_encode(dev_server_hook_setup),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_site_dev_server_hook_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.dev_server_hook_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_site_dev_server_hooks_request(base, site_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/dev_server_hooks"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_site_dev_server_hooks_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.dev_server_hook_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_dns_record_request(base, zone_id, dns_record_create) {
  let method = http.Post
  let path = "/dns_zones/" <> zone_id <> "/dns_records"
  let query = []
  let body = utils.json_to_bits(
    schema.dns_record_create_encode(dns_record_create),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_dns_record_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.dns_record_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_dns_records_request(base, zone_id) {
  let method = http.Get
  let path = "/dns_zones/" <> zone_id <> "/dns_records"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_dns_records_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.dns_records_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_current_user_request(base) {
  let method = http.Get
  let path = "/user"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_current_user_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.user_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_deploy_key_request(base, key_id) {
  let method = http.Delete
  let path = "/deploy_keys/" <> key_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_deploy_key_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_deploy_key_request(base, key_id) {
  let method = http.Get
  let path = "/deploy_keys/" <> key_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_deploy_key_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.deploy_key_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn exchange_ticket_request(base, ticket_id) {
  let method = http.Post
  let path = "/oauth/tickets/" <> ticket_id <> "/exchange"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn exchange_ticket_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.access_token_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_split_test_request(base, site_id, split_test_setup) {
  let method = http.Post
  let path = "/sites/" <> site_id <> "/traffic_splits"
  let query = []
  let body = utils.json_to_bits(schema.split_test_setup_encode(split_test_setup))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_split_test_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.split_test_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_split_tests_request(base, site_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/traffic_splits"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_split_tests_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.split_tests_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn set_env_var_value_request(base, account_id, key, data, site_id site_id) {
  let method = http.Patch
  let path = "/accounts/" <> account_id <> "/env/" <> key
  let query = [#("site_id", site_id)]
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn set_env_var_value_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.env_var_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_env_var_request(base, account_id, key, site_id site_id) {
  let method = http.Delete
  let path = "/accounts/" <> account_id <> "/env/" <> key
  let query = [#("site_id", site_id)]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_env_var_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn update_env_var_request(base, account_id, key, data, site_id site_id) {
  let method = http.Put
  let path = "/accounts/" <> account_id <> "/env/" <> key
  let query = [#("site_id", site_id)]
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn update_env_var_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.env_var_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_env_var_request(base, account_id, key, site_id site_id) {
  let method = http.Get
  let path = "/accounts/" <> account_id <> "/env/" <> key
  let query = [#("site_id", site_id)]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_env_var_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.env_var_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn cancel_site_deploy_request(base, deploy_id) {
  let method = http.Post
  let path = "/deploys/" <> deploy_id <> "/cancel"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn cancel_site_deploy_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.deploy_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_payment_methods_for_user_request(base) {
  let method = http.Get
  let path = "/billing/payment_methods"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_payment_methods_for_user_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.payment_method_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_service_instance_request(base, site_id, addon, instance_id) {
  let method = http.Delete
  let path = "/sites/" <> site_id <> "/services/" <> addon <> "/instances/" <> instance_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_service_instance_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn update_service_instance_request(base, site_id, addon, instance_id, data) {
  let method = http.Put
  let path = "/sites/" <> site_id <> "/services/" <> addon <> "/instances/" <> instance_id
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn update_service_instance_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn show_service_instance_request(base, site_id, addon, instance_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/services/" <> addon <> "/instances/" <> instance_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn show_service_instance_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.service_instance_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_account_request(base, account_setup) {
  let method = http.Post
  let path = "/accounts"
  let query = []
  let body = utils.json_to_bits(schema.account_setup_encode(account_setup))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_account_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.account_membership_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_accounts_for_user_request(base) {
  let method = http.Get
  let path = "/accounts"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_accounts_for_user_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(
      body,
      decode.list(schema.account_membership_decoder()),
    ) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_submission_request(base, submission_id) {
  let method = http.Delete
  let path = "/submissions/" <> submission_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_submission_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_form_submission_request(
  base,
  submission_id,
  query query,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/submissions/" <> submission_id
  let query = [
    #("query", query),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_form_submission_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.submission_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_hook_request(base, hook_id) {
  let method = http.Delete
  let path = "/hooks/" <> hook_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_hook_response(response) {
  let response.Response(status:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> response |> Error |> Ok
  }
}

pub fn update_hook_request(base, hook_id, hook) {
  let method = http.Put
  let path = "/hooks/" <> hook_id
  let query = []
  let body = utils.json_to_bits(schema.hook_encode(hook))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn update_hook_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.hook_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_hook_request(base, hook_id) {
  let method = http.Get
  let path = "/hooks/" <> hook_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_hook_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.hook_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn update_site_request(base, site_id, site_setup) {
  let method = http.Patch
  let path = "/sites/" <> site_id
  let query = []
  let body = utils.json_to_bits(schema.site_setup_encode(site_setup))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn update_site_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.site_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_site_request(base, site_id) {
  let method = http.Delete
  let path = "/sites/" <> site_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_site_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_site_request(base, site_id) {
  let method = http.Get
  let path = "/sites/" <> site_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_site_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.site_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_site_forms_request(base, site_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/forms"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_site_forms_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.form_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn show_service_manifest_request(base, addon_name) {
  let method = http.Get
  let path = "/services/" <> addon_name <> "/manifest"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn show_service_manifest_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, {
        decode.success(ShowServiceManifestResponse)
      }) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_site_build_hook_request(base, site_id, id) {
  let method = http.Delete
  let path = "/sites/" <> site_id <> "/build_hooks/" <> id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_site_build_hook_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn update_site_build_hook_request(base, site_id, id, build_hook_setup) {
  let method = http.Put
  let path = "/sites/" <> site_id <> "/build_hooks/" <> id
  let query = []
  let body = utils.json_to_bits(schema.build_hook_setup_encode(build_hook_setup))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn update_site_build_hook_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_site_build_hook_request(base, site_id, id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/build_hooks/" <> id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_site_build_hook_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.build_hook_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_deploy_request(base, deploy_id) {
  let method = http.Delete
  let path = "/deploys/" <> deploy_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_deploy_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_deploy_request(base, deploy_id) {
  let method = http.Get
  let path = "/deploys/" <> deploy_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_deploy_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.deploy_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_site_snippet_request(base, site_id, snippet) {
  let method = http.Post
  let path = "/sites/" <> site_id <> "/snippets"
  let query = []
  let body = utils.json_to_bits(schema.snippet_encode(snippet))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_site_snippet_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.snippet_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_site_snippets_request(base, site_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/snippets"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_site_snippets_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.snippet_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_service_instance_request(base, site_id, addon, data) {
  let method = http.Post
  let path = "/sites/" <> site_id <> "/services/" <> addon <> "/instances"
  let query = []
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_service_instance_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.service_instance_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_site_build_request(base, build_id) {
  let method = http.Get
  let path = "/builds/" <> build_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_site_build_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.build_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_account_build_status_request(base, account_id) {
  let method = http.Get
  let path = "/" <> account_id <> "/builds/status"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_account_build_status_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.build_status_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_site_in_team_request(
  base,
  account_slug,
  site_setup,
  configure_dns configure_dns,
) {
  let method = http.Post
  let path = "/" <> account_slug <> "/sites"
  let query = [#("configure_dns", option.map(configure_dns, bool.to_string))]
  let body = utils.json_to_bits(schema.site_setup_encode(site_setup))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_site_in_team_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.site_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_sites_for_account_request(
  base,
  account_slug,
  name name,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/" <> account_slug <> "/sites"
  let query = [
    #("name", name),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_sites_for_account_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.site_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn upload_deploy_file_request(base, deploy_id, path_, size size) {
  let method = http.Put
  let path = "/deploys/" <> deploy_id <> "/files/" <> path_
  let query = [#("size", option.map(size, int.to_string))]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn upload_deploy_file_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.file_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_site_env_vars_request(
  base,
  site_id,
  context_name context_name,
  scope scope,
) {
  let method = http.Get
  let path = "/api/v1/sites/" <> site_id <> "/env"
  let query = [#("context_name", context_name), #("scope", scope)]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_site_env_vars_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.env_var_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_dns_record_request(base, zone_id, dns_record_id) {
  let method = http.Delete
  let path = "/dns_zones/" <> zone_id <> "/dns_records/" <> dns_record_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_dns_record_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_individual_dns_record_request(base, zone_id, dns_record_id) {
  let method = http.Get
  let path = "/dns_zones/" <> zone_id <> "/dns_records/" <> dns_record_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_individual_dns_record_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.dns_record_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_site_deploy_request(
  base,
  site_id,
  deploy_files,
  title title,
  deploy_previews deploy_previews,
  production production,
  state state,
  branch branch,
  latest_published latest_published,
) {
  let method = http.Post
  let path = "/sites/" <> site_id <> "/deploys"
  let query = [
    #("title", title),
    #("deploy_previews", option.map(deploy_previews, bool.to_string)),
    #("production", option.map(production, bool.to_string)),
    #("state", state),
    #("branch", branch),
    #("latest_published", option.map(latest_published, bool.to_string))
  ]
  let body = utils.json_to_bits(schema.deploy_files_encode(deploy_files))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_site_deploy_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.deploy_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_site_deploys_request(
  base,
  site_id,
  page page,
  per_page per_page,
  deploy_previews deploy_previews,
  production production,
  state state,
  branch branch,
  latest_published latest_published,
) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/deploys"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
    #("deploy_previews", option.map(deploy_previews, bool.to_string)),
    #("production", option.map(production, bool.to_string)),
    #("state", state),
    #("branch", branch),
    #("latest_published", option.map(latest_published, bool.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_site_deploys_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.deploy_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn provision_site_tlscertificate_request(
  base,
  site_id,
  certificate certificate,
  key key,
  ca_certificates ca_certificates,
) {
  let method = http.Post
  let path = "/sites/" <> site_id <> "/ssl"
  let query = [
    #("certificate", certificate),
    #("key", key),
    #("ca_certificates", ca_certificates)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn provision_site_tlscertificate_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.sni_certificate_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn show_site_tlscertificate_request(base, site_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/ssl"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn show_site_tlscertificate_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.sni_certificate_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn cancel_account_request(base, account_id) {
  let method = http.Delete
  let path = "/accounts/" <> account_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn cancel_account_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn update_account_request(base, account_id, account_update_setup) {
  let method = http.Put
  let path = "/accounts/" <> account_id
  let query = []
  let body = utils.json_to_bits(
    schema.account_update_setup_encode(account_update_setup),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn update_account_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.account_membership_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_account_request(base, account_id) {
  let method = http.Get
  let path = "/accounts/" <> account_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_account_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(
      body,
      decode.list(schema.account_membership_decoder()),
    ) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_env_vars_request(base, account_id, data, site_id site_id) {
  let method = http.Post
  let path = "/accounts/" <> account_id <> "/env"
  let query = [#("site_id", site_id)]
  let body = data
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_env_vars_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, decode.list(schema.env_var_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_env_vars_request(
  base,
  account_id,
  context_name context_name,
  scope scope,
  site_id site_id,
) {
  let method = http.Get
  let path = "/accounts/" <> account_id <> "/env"
  let query = [
    #("context_name", context_name),
    #("scope", scope),
    #("site_id", site_id)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_env_vars_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.env_var_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn configure_dnsfor_site_request(base, site_id) {
  let method = http.Put
  let path = "/sites/" <> site_id <> "/dns"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn configure_dnsfor_site_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.dns_zone_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_dnsfor_site_request(base, site_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/dns"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_dnsfor_site_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.dns_zone_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_form_submissions_request(base, form_id, page page, per_page per_page) {
  let method = http.Get
  let path = "/forms/" <> form_id <> "/submissions"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_form_submissions_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.submission_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn update_site_metadata_request(base, site_id, metadata) {
  let method = http.Put
  let path = "/sites/" <> site_id <> "/metadata"
  let query = []
  let body = utils.json_to_bits(schema.metadata_encode(metadata))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn update_site_metadata_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_site_metadata_request(base, site_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/metadata"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_site_metadata_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.metadata_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn show_service_request(base, addon_name) {
  let method = http.Get
  let path = "/services/" <> addon_name
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn show_service_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.service_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_hook_types_request(base) {
  let method = http.Get
  let path = "/hooks/types"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_hook_types_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.hook_type_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_site_submissions_request(base, site_id, page page, per_page per_page) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/submissions"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_site_submissions_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.submission_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_site_dev_servers_request(base, site_id, branch branch) {
  let method = http.Delete
  let path = "/sites/" <> site_id <> "/dev_servers"
  let query = [#("branch", branch)]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_site_dev_servers_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    202 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_site_dev_server_request(base, site_id, branch branch) {
  let method = http.Post
  let path = "/sites/" <> site_id <> "/dev_servers"
  let query = [#("branch", branch)]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn create_site_dev_server_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.dev_server_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_site_dev_servers_request(base, site_id, page page, per_page per_page) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/dev_servers"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_site_dev_servers_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.dev_server_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_service_instances_for_site_request(base, site_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/service-instances"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_service_instances_for_site_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.service_instance_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_site_asset_public_signature_request(base, site_id, asset_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/assets/" <> asset_id <> "/public_signature"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_site_asset_public_signature_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.asset_public_signature_decoder()) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_site_asset_request(base, site_id, asset_id) {
  let method = http.Delete
  let path = "/sites/" <> site_id <> "/assets/" <> asset_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_site_asset_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn update_site_asset_request(base, site_id, asset_id, state state) {
  let method = http.Put
  let path = "/sites/" <> site_id <> "/assets/" <> asset_id
  let query = [#("state", option.Some(state))]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn update_site_asset_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.asset_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_site_asset_info_request(base, site_id, asset_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/assets/" <> asset_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_site_asset_info_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.asset_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn remove_account_member_request(base, account_slug, member_id) {
  let method = http.Delete
  let path = "/" <> account_slug <> "/members/" <> member_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn remove_account_member_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn update_account_member_request(
  base,
  account_slug,
  member_id,
  account_update_member_setup,
) {
  let method = http.Put
  let path = "/" <> account_slug <> "/members/" <> member_id
  let query = []
  let body = utils.json_to_bits(
    schema.account_update_member_setup_encode(account_update_member_setup),
  )
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn update_account_member_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.member_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_account_member_request(base, account_slug, member_id) {
  let method = http.Get
  let path = "/" <> account_slug <> "/members/" <> member_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_account_member_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.member_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn upload_deploy_function_request(
  base,
  deploy_id,
  name,
  runtime runtime,
  invocation_mode invocation_mode,
  timeout timeout,
  size size,
) {
  let method = http.Put
  let path = "/deploys/" <> deploy_id <> "/functions/" <> name
  let query = [
    #("runtime", runtime),
    #("invocation_mode", invocation_mode),
    #("timeout", option.map(timeout, int.to_string)),
    #("size", option.map(size, int.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn upload_deploy_function_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.function_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn lock_deploy_request(base, deploy_id) {
  let method = http.Post
  let path = "/deploys/" <> deploy_id <> "/lock"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn lock_deploy_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.deploy_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_site_deploy_request(base, site_id, deploy_id) {
  let method = http.Delete
  let path = "/sites/" <> site_id <> "/deploys/" <> deploy_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_site_deploy_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn update_site_deploy_request(base, site_id, deploy_id, deploy_files) {
  let method = http.Put
  let path = "/sites/" <> site_id <> "/deploys/" <> deploy_id
  let query = []
  let body = utils.json_to_bits(schema.deploy_files_encode(deploy_files))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn update_site_deploy_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.deploy_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_site_deploy_request(base, site_id, deploy_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/deploys/" <> deploy_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_site_deploy_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.deploy_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn update_site_build_log_request(base, build_id) {
  let method = http.Post
  let path = "/builds/" <> build_id <> "/log"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn update_site_build_log_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_site_dev_server_request(base, site_id, dev_server_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/dev_servers/" <> dev_server_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_site_dev_server_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.dev_server_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn delete_site_form_request(base, site_id, form_id) {
  let method = http.Delete
  let path = "/sites/" <> site_id <> "/forms/" <> form_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_site_form_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn restore_site_deploy_request(base, site_id, deploy_id) {
  let method = http.Post
  let path = "/sites/" <> site_id <> "/deploys/" <> deploy_id <> "/restore"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn restore_site_deploy_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.deploy_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn disable_split_test_request(base, site_id, split_test_id) {
  let method = http.Post
  let path = "/sites/" <> site_id <> "/traffic_splits/" <> split_test_id <> "/unpublish"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn disable_split_test_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn notify_build_start_request(
  base,
  build_id,
  buildbot_version buildbot_version,
  build_version build_version,
) {
  let method = http.Post
  let path = "/builds/" <> build_id <> "/start"
  let query = [
    #("buildbot_version", buildbot_version),
    #("build_version", build_version)
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn notify_build_start_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_site_build_hook_request(base, site_id, build_hook_setup) {
  let method = http.Post
  let path = "/sites/" <> site_id <> "/build_hooks"
  let query = []
  let body = utils.json_to_bits(schema.build_hook_setup_encode(build_hook_setup))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_site_build_hook_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.build_hook_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_site_build_hooks_request(base, site_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/build_hooks"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_site_build_hooks_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.build_hook_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn delete_site_snippet_request(base, site_id, snippet_id) {
  let method = http.Delete
  let path = "/sites/" <> site_id <> "/snippets/" <> snippet_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn delete_site_snippet_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn update_site_snippet_request(base, site_id, snippet_id, snippet) {
  let method = http.Put
  let path = "/sites/" <> site_id <> "/snippets/" <> snippet_id
  let query = []
  let body = utils.json_to_bits(schema.snippet_encode(snippet))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn update_site_snippet_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_site_snippet_request(base, site_id, snippet_id) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/snippets/" <> snippet_id
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_site_snippet_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.snippet_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn unlink_site_repo_request(base, site_id) {
  let method = http.Put
  let path = "/sites/" <> site_id <> "/unlink_repo"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn unlink_site_repo_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.site_decoder()) |> result.map(Ok)
    _ -> Error(Nil) |> Ok
  }
}

pub fn create_dns_zone_request(base, dns_zone_setup) {
  let method = http.Post
  let path = "/dns_zones"
  let query = []
  let body = utils.json_to_bits(schema.dns_zone_setup_encode(dns_zone_setup))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_dns_zone_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.dns_zone_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_dns_zones_request(base, account_slug account_slug) {
  let method = http.Get
  let path = "/dns_zones"
  let query = [#("account_slug", account_slug)]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_dns_zones_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.dns_zones_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn get_services_request(base, search search) {
  let method = http.Get
  let path = "/services/"
  let query = [#("search", search)]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn get_services_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.service_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_site_build_request(base, site_id, build_setup) {
  let method = http.Post
  let path = "/sites/" <> site_id <> "/builds"
  let query = []
  let body = utils.json_to_bits(schema.build_setup_encode(build_setup))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_site_build_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.build_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_site_builds_request(base, site_id, page page, per_page per_page) {
  let method = http.Get
  let path = "/sites/" <> site_id <> "/builds"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string))
  ]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_site_builds_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.build_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_hook_by_site_id_request(base, hook, site_id site_id) {
  let method = http.Post
  let path = "/hooks"
  let query = [#("site_id", option.Some(site_id))]
  let body = utils.json_to_bits(schema.hook_encode(hook))
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  ) |> utils.set_body("application/json", body)
}

pub fn create_hook_by_site_id_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.hook_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn list_hooks_by_site_id_request(base, site_id site_id) {
  let method = http.Get
  let path = "/hooks"
  let query = [#("site_id", option.Some(site_id))]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn list_hooks_by_site_id_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, decode.list(schema.hook_decoder())) |> result.map(
      Ok,
    )
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn create_ticket_request(base, client_id client_id) {
  let method = http.Post
  let path = "/oauth/tickets"
  let query = [#("client_id", option.Some(client_id))]
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn create_ticket_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.ticket_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn rollback_site_deploy_request(base, site_id) {
  let method = http.Put
  let path = "/sites/" <> site_id <> "/rollback"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn rollback_site_deploy_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}

pub fn unlock_deploy_request(base, deploy_id) {
  let method = http.Post
  let path = "/deploys/" <> deploy_id <> "/unlock"
  let query = []
  base |> utils.set_method(method) |> utils.append_path(path) |> utils.set_query(
    query,
  )
}

pub fn unlock_deploy_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.deploy_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.error_decoder()) |> result.map(Error)
  }
}
