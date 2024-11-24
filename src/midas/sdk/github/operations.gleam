import decode/zero
import gleam/bool
import gleam/http
import gleam/http/response
import gleam/int
import gleam/option
import gleam/result
import midas/sdk/github/schema
import midas/sdk/utils
import midas/task

pub fn packages_list_docker_migration_conflicting_packages_for_user_request(
  base,
  username,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/docker/conflicts"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_list_docker_migration_conflicting_packages_for_user_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.package_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn interactions_remove_restrictions_for_org_request(base, org) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/interaction-limits"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn interactions_remove_restrictions_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn interactions_set_restrictions_for_org_request(
  base,
  org,
  interaction_limit,
) {
  let method = http.Put
  let path = "/orgs/" <> org <> "/interaction-limits"
  let query = []
  let body =
    utils.json_to_bits(schema.interaction_limit_to_json(interaction_limit))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn interactions_set_restrictions_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.interaction_limit_response_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn interactions_get_restrictions_for_org_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/interaction-limits"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn interactions_get_restrictions_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.failure(Nil, "Unsupported schema"))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gitignore_get_all_templates_request(base) {
  let method = http.Get
  let path = "/gitignore/templates"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn gitignore_get_all_templates_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.failure(Nil, "Unsupported schema"))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_create_workflow_dispatch_request(
  base,
  owner,
  repo,
  workflow_id,
  data,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/workflows/"
    <> workflow_id
    <> "/dispatches"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_create_workflow_dispatch_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_security_attach_configuration_request(
  base,
  org,
  configuration_id,
  data,
) {
  let method = http.Post
  let path =
    "/orgs/"
    <> org
    <> "/code-security/configurations/"
    <> int.to_string(configuration_id)
    <> "/attach"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn code_security_attach_configuration_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_pages_health_check_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/pages/health"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_pages_health_check_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.pages_health_check_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_scanning_get_variant_analysis_repo_task_request(
  base,
  owner,
  repo,
  codeql_variant_analysis_id,
  repo_owner,
  repo_name,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/code-scanning/codeql/variant-analyses/"
    <> int.to_string(codeql_variant_analysis_id)
    <> "/repos/"
    <> repo_owner
    <> "/"
    <> repo_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_scanning_get_variant_analysis_repo_task_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        schema.code_scanning_variant_analysis_repo_task_decoder(),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_attestations_request(
  base,
  owner,
  repo,
  subject_digest,
  per_page per_page,
  before before,
  after after,
) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/attestations/" <> subject_digest
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("before", before),
    #("after", after),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_attestations_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_get_context_for_user_request(
  base,
  username,
  subject_type subject_type,
  subject_id subject_id,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/hovercard"
  let query = [#("subject_type", subject_type), #("subject_id", subject_id)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_get_context_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.hovercard_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_unfollow_request(base, username) {
  let method = http.Delete
  let path = "/user/following/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_unfollow_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_follow_request(base, username) {
  let method = http.Put
  let path = "/user/following/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_follow_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_check_person_is_followed_by_authenticated_request(base, username) {
  let method = http.Get
  let path = "/user/following/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_check_person_is_followed_by_authenticated_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_unstar_repo_for_authenticated_user_request(base, owner, repo) {
  let method = http.Delete
  let path = "/user/starred/" <> owner <> "/" <> repo
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_unstar_repo_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_star_repo_for_authenticated_user_request(base, owner, repo) {
  let method = http.Put
  let path = "/user/starred/" <> owner <> "/" <> repo
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_star_repo_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_check_repo_is_starred_by_authenticated_user_request(
  base,
  owner,
  repo,
) {
  let method = http.Get
  let path = "/user/starred/" <> owner <> "/" <> repo
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_check_repo_is_starred_by_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_pat_grant_repositories_request(
  base,
  org,
  pat_id,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/personal-access-tokens/"
    <> int.to_string(pat_id)
    <> "/repositories"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_pat_grant_repositories_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.minimal_repository_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_workflow_runs_request(
  base,
  owner,
  repo,
  workflow_id,
  actor actor,
  branch branch,
  event event,
  status status,
  per_page per_page,
  page page,
  created created,
  exclude_pull_requests exclude_pull_requests,
  check_suite_id check_suite_id,
  head_sha head_sha,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/workflows/"
    <> workflow_id
    <> "/runs"
  let query = [
    #("actor", actor),
    #("branch", branch),
    #("event", event),
    #("status", status),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
    #("created", created),
    #(
      "exclude_pull_requests",
      option.map(exclude_pull_requests, bool.to_string),
    ),
    #("check_suite_id", option.map(check_suite_id, int.to_string)),
    #("head_sha", head_sha),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_workflow_runs_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_list_docker_migration_conflicting_packages_for_organization_request(
  base,
  org,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/docker/conflicts"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_list_docker_migration_conflicting_packages_for_organization_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.package_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_update_milestone_request(
  base,
  owner,
  repo,
  milestone_number,
  data,
) {
  let method = http.Patch
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/milestones/"
    <> int.to_string(milestone_number)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn issues_update_milestone_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.milestone_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_delete_milestone_request(base, owner, repo, milestone_number) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/milestones/"
    <> int.to_string(milestone_number)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_delete_milestone_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_get_milestone_request(base, owner, repo, milestone_number) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/milestones/"
    <> int.to_string(milestone_number)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_get_milestone_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.milestone_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_download_zipball_archive_request(base, owner, repo, ref) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/zipball/" <> ref
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_download_zipball_archive_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_remove_all_labels_request(base, owner, repo, issue_number) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
    <> "/labels"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_remove_all_labels_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_add_labels_request(base, owner, repo, issue_number) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
    <> "/labels"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_add_labels_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.label_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_set_labels_request(base, owner, repo, issue_number) {
  let method = http.Put
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
    <> "/labels"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_set_labels_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.label_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_list_labels_on_issue_request(
  base,
  owner,
  repo,
  issue_number,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
    <> "/labels"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_list_labels_on_issue_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.label_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_remove_repo_access_to_self_hosted_runner_group_in_org_request(
  base,
  org,
  runner_group_id,
  repository_id,
) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/actions/runner-groups/"
    <> int.to_string(runner_group_id)
    <> "/repositories/"
    <> int.to_string(repository_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_remove_repo_access_to_self_hosted_runner_group_in_org_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_add_repo_access_to_self_hosted_runner_group_in_org_request(
  base,
  org,
  runner_group_id,
  repository_id,
) {
  let method = http.Put
  let path =
    "/orgs/"
    <> org
    <> "/actions/runner-groups/"
    <> int.to_string(runner_group_id)
    <> "/repositories/"
    <> int.to_string(repository_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_add_repo_access_to_self_hosted_runner_group_in_org_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_list_pending_invitations_legacy_request(
  base,
  team_id,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/teams/" <> int.to_string(team_id) <> "/invitations"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_list_pending_invitations_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.organization_invitation_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn markdown_render_request(base, data) {
  let method = http.Post
  let path = "/markdown"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn markdown_render_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_list_repo_secrets_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/dependabot/secrets"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn dependabot_list_repo_secrets_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_delete_for_team_discussion_request(
  base,
  org,
  team_slug,
  discussion_number,
  reaction_id,
) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/reactions/"
    <> int.to_string(reaction_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn reactions_delete_for_team_discussion_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_teams_request(base, owner, repo, per_page per_page, page page) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/teams"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_teams_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.team_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_delete_actions_cache_by_id_request(base, owner, repo, cache_id) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/caches/"
    <> int.to_string(cache_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_delete_actions_cache_by_id_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_remove_repository_for_secret_for_authenticated_user_request(
  base,
  secret_name,
  repository_id,
) {
  let method = http.Delete
  let path =
    "/user/codespaces/secrets/"
    <> secret_name
    <> "/repositories/"
    <> int.to_string(repository_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_remove_repository_for_secret_for_authenticated_user_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_add_repository_for_secret_for_authenticated_user_request(
  base,
  secret_name,
  repository_id,
) {
  let method = http.Put
  let path =
    "/user/codespaces/secrets/"
    <> secret_name
    <> "/repositories/"
    <> int.to_string(repository_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_add_repository_for_secret_for_authenticated_user_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_dismiss_review_request(
  base,
  owner,
  repo,
  pull_number,
  review_id,
  data,
) {
  let method = http.Put
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/reviews/"
    <> int.to_string(review_id)
    <> "/dismissals"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn pulls_dismiss_review_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.pull_request_review_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_delete_archive_for_authenticated_user_request(
  base,
  migration_id,
) {
  let method = http.Delete
  let path = "/user/migrations/" <> int.to_string(migration_id) <> "/archive"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn migrations_delete_archive_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_get_archive_for_authenticated_user_request(base, migration_id) {
  let method = http.Get
  let path = "/user/migrations/" <> int.to_string(migration_id) <> "/archive"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn migrations_get_archive_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_remove_member_legacy_request(base, team_id, username) {
  let method = http.Delete
  let path = "/teams/" <> int.to_string(team_id) <> "/members/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_remove_member_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_add_member_legacy_request(base, team_id, username) {
  let method = http.Put
  let path = "/teams/" <> int.to_string(team_id) <> "/members/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_add_member_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_get_member_legacy_request(base, team_id, username) {
  let method = http.Get
  let path = "/teams/" <> int.to_string(team_id) <> "/members/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_get_member_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_deployment_protection_rule_request(
  base,
  owner,
  repo,
  environment_name,
  data,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/deployment_protection_rules"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_deployment_protection_rule_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.deployment_protection_rule_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_all_deployment_protection_rules_request(
  base,
  owner,
  repo,
  environment_name,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/deployment_protection_rules"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_all_deployment_protection_rules_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn copilot_copilot_metrics_for_enterprise_request(
  base,
  enterprise,
  since since,
  until until,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/enterprises/" <> enterprise <> "/copilot/metrics"
  let query = [
    #("since", since),
    #("until", until),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn copilot_copilot_metrics_for_enterprise_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.copilot_usage_metrics_day_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_delete_package_version_for_authenticated_user_request(
  base,
  package_type,
  package_name,
  package_version_id,
) {
  let method = http.Delete
  let path =
    "/user/packages/"
    <> package_type
    <> "/"
    <> package_name
    <> "/versions/"
    <> int.to_string(package_version_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_delete_package_version_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_get_package_version_for_authenticated_user_request(
  base,
  package_type,
  package_name,
  package_version_id,
) {
  let method = http.Get
  let path =
    "/user/packages/"
    <> package_type
    <> "/"
    <> package_name
    <> "/versions/"
    <> int.to_string(package_version_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_get_package_version_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.package_version_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_re_run_job_for_workflow_run_request(
  base,
  owner,
  repo,
  job_id,
  data,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/jobs/"
    <> int.to_string(job_id)
    <> "/rerun"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_re_run_job_for_workflow_run_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.empty_object_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_list_org_events_for_authenticated_user_request(
  base,
  username,
  org,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/events/orgs/" <> org
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_list_org_events_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.event_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_invitation_teams_request(
  base,
  org,
  invitation_id,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/invitations/"
    <> int.to_string(invitation_id)
    <> "/teams"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_invitation_teams_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.team_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_move_card_request(base, card_id, data) {
  let method = http.Post
  let path = "/projects/columns/cards/" <> int.to_string(card_id) <> "/moves"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn projects_move_card_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_check_user_can_be_assigned_to_issue_request(
  base,
  owner,
  repo,
  issue_number,
  assignee,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
    <> "/assignees/"
    <> assignee
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_check_user_can_be_assigned_to_issue_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_list_members_legacy_request(
  base,
  team_id,
  role role,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/teams/" <> int.to_string(team_id) <> "/members"
  let query = [
    #("role", role),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_list_members_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_update_import_request(base, owner, repo, data) {
  let method = http.Patch
  let path = "/repos/" <> owner <> "/" <> repo <> "/import"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn migrations_update_import_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.import__decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_cancel_import_request(base, owner, repo) {
  let method = http.Delete
  let path = "/repos/" <> owner <> "/" <> repo <> "/import"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn migrations_cancel_import_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_start_import_request(base, owner, repo, data) {
  let method = http.Put
  let path = "/repos/" <> owner <> "/" <> repo <> "/import"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn migrations_start_import_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.import__decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_get_import_status_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/import"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn migrations_get_import_status_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.import__decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_update_discussion_comment_legacy_request(
  base,
  team_id,
  discussion_number,
  comment_number,
  data,
) {
  let method = http.Patch
  let path =
    "/teams/"
    <> int.to_string(team_id)
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/comments/"
    <> int.to_string(comment_number)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn teams_update_discussion_comment_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.team_discussion_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_delete_discussion_comment_legacy_request(
  base,
  team_id,
  discussion_number,
  comment_number,
) {
  let method = http.Delete
  let path =
    "/teams/"
    <> int.to_string(team_id)
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/comments/"
    <> int.to_string(comment_number)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_delete_discussion_comment_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_get_discussion_comment_legacy_request(
  base,
  team_id,
  discussion_number,
  comment_number,
) {
  let method = http.Get
  let path =
    "/teams/"
    <> int.to_string(team_id)
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/comments/"
    <> int.to_string(comment_number)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_get_discussion_comment_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.team_discussion_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_branches_for_head_commit_request(
  base,
  owner,
  repo,
  commit_sha,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/commits/"
    <> commit_sha
    <> "/branches-where-head"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_branches_for_head_commit_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.branch_short_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_list_accounts_for_plan_stubbed_request(
  base,
  plan_id,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/marketplace_listing/stubbed/plans/"
    <> int.to_string(plan_id)
    <> "/accounts"
  let query = [
    #("sort", sort),
    #("direction", direction),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_list_accounts_for_plan_stubbed_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.marketplace_purchase_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_delete_for_commit_comment_request(
  base,
  owner,
  repo,
  comment_id,
  reaction_id,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/comments/"
    <> int.to_string(comment_id)
    <> "/reactions/"
    <> int.to_string(reaction_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn reactions_delete_for_commit_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_pages_build_request(base, owner, repo, build_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pages/builds/"
    <> int.to_string(build_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_pages_build_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.page_build_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn api_insights_get_route_stats_by_actor_request(
  base,
  org,
  actor_type,
  actor_id,
  min_timestamp min_timestamp,
  max_timestamp max_timestamp,
  page page,
  per_page per_page,
  direction direction,
  sort sort,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/insights/api/route-stats/"
    <> actor_type
    <> "/"
    <> int.to_string(actor_id)
  let query = [
    #("min_timestamp", option.Some(min_timestamp)),
    #("max_timestamp", option.Some(max_timestamp)),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
    #("direction", direction),
    #("sort", panic as "sort"),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn api_insights_get_route_stats_by_actor_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.api_insights_route_stats_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn copilot_usage_metrics_for_enterprise_request(
  base,
  enterprise,
  since since,
  until until,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/enterprises/" <> enterprise <> "/copilot/usage"
  let query = [
    #("since", since),
    #("until", until),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn copilot_usage_metrics_for_enterprise_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.copilot_usage_metrics_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn search_topics_request(base, q q, per_page per_page, page page) {
  let method = http.Get
  let path = "/search/topics"
  let query = [
    #("q", option.Some(q)),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_topics_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_update_environment_variable_request(
  base,
  owner,
  repo,
  environment_name,
  name,
  data,
) {
  let method = http.Patch
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/variables/"
    <> name
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_update_environment_variable_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_delete_environment_variable_request(
  base,
  owner,
  repo,
  environment_name,
  name,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/variables/"
    <> name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_delete_environment_variable_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_environment_variable_request(
  base,
  owner,
  repo,
  environment_name,
  name,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/variables/"
    <> name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_environment_variable_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.actions_variable_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_list_followed_by_authenticated_user_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/following"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_list_followed_by_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_for_user_request(base, username, per_page per_page, page page) {
  let method = http.Get
  let path = "/users/" <> username <> "/orgs"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.organization_simple_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_list_plans_request(base, per_page per_page, page page) {
  let method = http.Get
  let path = "/marketplace_listing/plans"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_list_plans_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.marketplace_listing_plan_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_update_request(base, owner, repo, pull_number, data) {
  let method = http.Patch
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/pulls/" <> int.to_string(pull_number)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn pulls_update_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.pull_request_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_get_request(base, owner, repo, pull_number) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/pulls/" <> int.to_string(pull_number)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn pulls_get_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.pull_request_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_remove_custom_label_from_self_hosted_runner_for_org_request(
  base,
  org,
  runner_id,
  name,
) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/actions/runners/"
    <> int.to_string(runner_id)
    <> "/labels/"
    <> name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_remove_custom_label_from_self_hosted_runner_for_org_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_restore_package_version_for_authenticated_user_request(
  base,
  package_type,
  package_name,
  package_version_id,
) {
  let method = http.Post
  let path =
    "/user/packages/"
    <> package_type
    <> "/"
    <> package_name
    <> "/versions/"
    <> int.to_string(package_version_id)
    <> "/restore"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_restore_package_version_for_authenticated_user_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_replace_all_topics_request(base, owner, repo, data) {
  let method = http.Put
  let path = "/repos/" <> owner <> "/" <> repo <> "/topics"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_replace_all_topics_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.topic_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_all_topics_request(
  base,
  owner,
  repo,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/topics"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_all_topics_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.topic_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_remove_team_access_restrictions_request(base, owner, repo, branch) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/restrictions/teams"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_remove_team_access_restrictions_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.team_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_add_team_access_restrictions_request(base, owner, repo, branch) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/restrictions/teams"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_add_team_access_restrictions_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.team_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_set_team_access_restrictions_request(base, owner, repo, branch) {
  let method = http.Put
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/restrictions/teams"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_set_team_access_restrictions_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.team_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_teams_with_access_to_protected_branch_request(
  base,
  owner,
  repo,
  branch,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/restrictions/teams"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_teams_with_access_to_protected_branch_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.team_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn emojis_get_request(base) {
  let method = http.Get
  let path = "/emojis"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn emojis_get_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn api_insights_get_time_stats_request(
  base,
  org,
  min_timestamp min_timestamp,
  max_timestamp max_timestamp,
  timestamp_increment timestamp_increment,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/insights/api/time-stats"
  let query = [
    #("min_timestamp", option.Some(min_timestamp)),
    #("max_timestamp", option.Some(max_timestamp)),
    #("timestamp_increment", option.Some(timestamp_increment)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn api_insights_get_time_stats_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.api_insights_time_stats_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_list_installations_request(
  base,
  per_page per_page,
  page page,
  since since,
  outdated outdated,
) {
  let method = http.Get
  let path = "/app/installations"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
    #("since", since),
    #("outdated", outdated),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_list_installations_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.installation_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_remove_selected_repo_from_org_secret_request(
  base,
  org,
  secret_name,
  repository_id,
) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/actions/secrets/"
    <> secret_name
    <> "/repositories/"
    <> int.to_string(repository_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_remove_selected_repo_from_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_add_selected_repo_to_org_secret_request(
  base,
  org,
  secret_name,
  repository_id,
) {
  let method = http.Put
  let path =
    "/orgs/"
    <> org
    <> "/actions/secrets/"
    <> secret_name
    <> "/repositories/"
    <> int.to_string(repository_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_add_selected_repo_to_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_test_push_webhook_request(base, owner, repo, hook_id) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/hooks/"
    <> int.to_string(hook_id)
    <> "/tests"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_test_push_webhook_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_list_alerts_for_repo_request(
  base,
  owner,
  repo,
  state state,
  severity severity,
  ecosystem ecosystem,
  package package,
  manifest manifest,
  scope scope,
  sort sort,
  direction direction,
  page page,
  per_page per_page,
  before before,
  after after,
  first first,
  last last,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/dependabot/alerts"
  let query = [
    #("state", state),
    #("severity", severity),
    #("ecosystem", ecosystem),
    #("package", package),
    #("manifest", manifest),
    #("scope", scope),
    #("sort", sort),
    #("direction", direction),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
    #("before", before),
    #("after", after),
    #("first", option.map(first, int.to_string)),
    #("last", option.map(last, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn dependabot_list_alerts_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.dependabot_alert_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_delete_for_pull_request_comment_request(
  base,
  owner,
  repo,
  comment_id,
  reaction_id,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/comments/"
    <> int.to_string(comment_id)
    <> "/reactions/"
    <> int.to_string(reaction_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn reactions_delete_for_pull_request_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn checks_list_for_suite_request(
  base,
  owner,
  repo,
  check_suite_id,
  check_name check_name,
  status status,
  filter filter,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/check-suites/"
    <> int.to_string(check_suite_id)
    <> "/check-runs"
  let query = [
    #("check_name", check_name),
    #("status", status),
    #("filter", filter),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn checks_list_for_suite_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_update_column_request(base, column_id, data) {
  let method = http.Patch
  let path = "/projects/columns/" <> int.to_string(column_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn projects_update_column_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.project_column_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_delete_column_request(base, column_id) {
  let method = http.Delete
  let path = "/projects/columns/" <> int.to_string(column_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn projects_delete_column_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_get_column_request(base, column_id) {
  let method = http.Get
  let path = "/projects/columns/" <> int.to_string(column_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn projects_get_column_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.project_column_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_ping_webhook_request(base, owner, repo, hook_id) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/hooks/"
    <> int.to_string(hook_id)
    <> "/pings"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_ping_webhook_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn security_advisories_create_private_vulnerability_report_request(
  base,
  owner,
  repo,
  private_vulnerability_report_create,
) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/security-advisories/reports"
  let query = []
  let body =
    utils.json_to_bits(schema.private_vulnerability_report_create_to_json(
      private_vulnerability_report_create,
    ))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn security_advisories_create_private_vulnerability_report_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.repository_advisory_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_force_cancel_workflow_run_request(base, owner, repo, run_id) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
    <> "/force-cancel"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_force_cancel_workflow_run_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 ->
      utils.decode_bits(body, schema.empty_object_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_delete_actions_cache_by_key_request(
  base,
  owner,
  repo,
  key key,
  ref ref,
) {
  let method = http.Delete
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/caches"
  let query = [#("key", option.Some(key)), #("ref", ref)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_delete_actions_cache_by_key_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.actions_cache_list_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_actions_cache_list_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
  ref ref,
  key key,
  sort sort,
  direction direction,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/caches"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
    #("ref", ref),
    #("key", key),
    #("sort", sort),
    #("direction", direction),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_actions_cache_list_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.actions_cache_list_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_create_registration_token_for_repo_request(base, owner, repo) {
  let method = http.Post
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/actions/runners/registration-token"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_create_registration_token_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.authentication_token_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_update_webhook_config_for_org_request(base, org, hook_id, data) {
  let method = http.Patch
  let path = "/orgs/" <> org <> "/hooks/" <> int.to_string(hook_id) <> "/config"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn orgs_update_webhook_config_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.webhook_config_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_get_webhook_config_for_org_request(base, org, hook_id) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/hooks/" <> int.to_string(hook_id) <> "/config"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_get_webhook_config_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.webhook_config_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_org_role_teams_request(
  base,
  org,
  role_id,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/organization-roles/"
    <> int.to_string(role_id)
    <> "/teams"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_org_role_teams_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.team_role_assignment_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_get_event_request(base, owner, repo, event_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/events/"
    <> int.to_string(event_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_get_event_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.issue_event_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_get_codespaces_for_user_in_org_request(
  base,
  org,
  username,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/members/" <> username <> "/codespaces"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_get_codespaces_for_user_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_attestation_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/attestations"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_attestation_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_disable_deployment_protection_rule_request(
  base,
  owner,
  repo,
  environment_name,
  protection_rule_id,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/deployment_protection_rules/"
    <> int.to_string(protection_rule_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_disable_deployment_protection_rule_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_custom_deployment_protection_rule_request(
  base,
  owner,
  repo,
  environment_name,
  protection_rule_id,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/deployment_protection_rules/"
    <> int.to_string(protection_rule_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_custom_deployment_protection_rule_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.deployment_protection_rule_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn api_insights_get_summary_stats_request(
  base,
  org,
  min_timestamp min_timestamp,
  max_timestamp max_timestamp,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/insights/api/summary-stats"
  let query = [
    #("min_timestamp", option.Some(min_timestamp)),
    #("max_timestamp", option.Some(max_timestamp)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn api_insights_get_summary_stats_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.api_insights_summary_stats_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn classroom_get_a_classroom_request(base, classroom_id) {
  let method = http.Get
  let path = "/classrooms/" <> int.to_string(classroom_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn classroom_get_a_classroom_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.classroom_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_create_milestone_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/milestones"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn issues_create_milestone_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.milestone_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_list_milestones_request(
  base,
  owner,
  repo,
  state state,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/milestones"
  let query = [
    #("state", state),
    #("sort", sort),
    #("direction", direction),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_list_milestones_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.milestone_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn checks_list_annotations_request(
  base,
  owner,
  repo,
  check_run_id,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/check-runs/"
    <> int.to_string(check_run_id)
    <> "/annotations"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn checks_list_annotations_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.check_annotation_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_disable_private_vulnerability_reporting_request(base, owner, repo) {
  let method = http.Delete
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/private-vulnerability-reporting"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_disable_private_vulnerability_reporting_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_enable_private_vulnerability_reporting_request(base, owner, repo) {
  let method = http.Put
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/private-vulnerability-reporting"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_enable_private_vulnerability_reporting_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_check_private_vulnerability_reporting_request(base, owner, repo) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/private-vulnerability-reporting"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_check_private_vulnerability_reporting_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_list_blocked_by_authenticated_user_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/blocks"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_list_blocked_by_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_scanning_update_default_setup_request(
  base,
  owner,
  repo,
  code_scanning_default_setup_update,
) {
  let method = http.Patch
  let path = "/repos/" <> owner <> "/" <> repo <> "/code-scanning/default-setup"
  let query = []
  let body =
    utils.json_to_bits(schema.code_scanning_default_setup_update_to_json(
      code_scanning_default_setup_update,
    ))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn code_scanning_update_default_setup_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.empty_object_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_scanning_get_default_setup_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/code-scanning/default-setup"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_scanning_get_default_setup_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.code_scanning_default_setup_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn api_insights_get_time_stats_by_actor_request(
  base,
  org,
  actor_type,
  actor_id,
  min_timestamp min_timestamp,
  max_timestamp max_timestamp,
  timestamp_increment timestamp_increment,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/insights/api/time-stats/"
    <> actor_type
    <> "/"
    <> int.to_string(actor_id)
  let query = [
    #("min_timestamp", option.Some(min_timestamp)),
    #("max_timestamp", option.Some(max_timestamp)),
    #("timestamp_increment", option.Some(timestamp_increment)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn api_insights_get_time_stats_by_actor_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.api_insights_time_stats_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_redeliver_webhook_delivery_request(
  base,
  owner,
  repo,
  hook_id,
  delivery_id,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/hooks/"
    <> int.to_string(hook_id)
    <> "/deliveries/"
    <> int.to_string(delivery_id)
    <> "/attempts"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_redeliver_webhook_delivery_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_update_membership_for_authenticated_user_request(base, org, data) {
  let method = http.Patch
  let path = "/user/memberships/orgs/" <> org
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn orgs_update_membership_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.org_membership_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_get_membership_for_authenticated_user_request(base, org) {
  let method = http.Get
  let path = "/user/memberships/orgs/" <> org
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_get_membership_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.org_membership_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn api_insights_get_summary_stats_by_actor_request(
  base,
  org,
  actor_type,
  actor_id,
  min_timestamp min_timestamp,
  max_timestamp max_timestamp,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/insights/api/summary-stats/"
    <> actor_type
    <> "/"
    <> int.to_string(actor_id)
  let query = [
    #("min_timestamp", option.Some(min_timestamp)),
    #("max_timestamp", option.Some(max_timestamp)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn api_insights_get_summary_stats_by_actor_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.api_insights_summary_stats_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_file_request(base, owner, repo, path_, data) {
  let method = http.Delete
  let path = "/repos/" <> owner <> "/" <> repo <> "/contents/" <> path_
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_delete_file_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.file_commit_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_or_update_file_contents_request(
  base,
  owner,
  repo,
  path_,
  data,
) {
  let method = http.Put
  let path = "/repos/" <> owner <> "/" <> repo <> "/contents/" <> path_
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_or_update_file_contents_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.file_commit_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_content_request(base, owner, repo, path_, ref ref) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/contents/" <> path_
  let query = [#("ref", ref)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_content_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.failure(Nil, "Unsupported schema"))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_invitations_for_authenticated_user_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/repository_invitations"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_invitations_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.repository_invitation_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_list_packages_for_user_request(
  base,
  username,
  package_type package_type,
  visibility visibility,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/packages"
  let query = [
    #("package_type", option.Some(package_type)),
    #("visibility", visibility),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_list_packages_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.package_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_org_rule_suite_request(base, org, rule_suite_id) {
  let method = http.Get
  let path =
    "/orgs/" <> org <> "/rulesets/rule-suites/" <> int.to_string(rule_suite_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_org_rule_suite_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.rule_suite_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_commit_request(
  base,
  owner,
  repo,
  ref,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/commits/" <> ref
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_commit_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.commit_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_list_installation_requests_for_authenticated_app_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/app/installation-requests"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_list_installation_requests_for_authenticated_app_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.integration_installation_request_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_start_for_authenticated_user_request(base, data) {
  let method = http.Post
  let path = "/user/migrations"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn migrations_start_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.migration_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_list_for_authenticated_user_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/migrations"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn migrations_list_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.migration_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_update_release_request(base, owner, repo, release_id, data) {
  let method = http.Patch
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/releases/"
    <> int.to_string(release_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_update_release_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.release_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_release_request(base, owner, repo, release_id) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/releases/"
    <> int.to_string(release_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_release_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_release_request(base, owner, repo, release_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/releases/"
    <> int.to_string(release_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_release_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.release_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_list_child_legacy_request(
  base,
  team_id,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/teams/" <> int.to_string(team_id) <> "/teams"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_list_child_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.team_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_create_ssh_signing_key_for_authenticated_user_request(base, data) {
  let method = http.Post
  let path = "/user/ssh_signing_keys"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn users_create_ssh_signing_key_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.ssh_signing_key_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_list_ssh_signing_keys_for_authenticated_user_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/ssh_signing_keys"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_list_ssh_signing_keys_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.ssh_signing_key_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_pages_deployment_request(
  base,
  owner,
  repo,
  pages_deployment_id,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pages/deployments/"
    <> pages_deployment_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_pages_deployment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.pages_deployment_status_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_list_org_secrets_request(
  base,
  org,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/codespaces/secrets"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_list_org_secrets_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn secret_scanning_list_alerts_for_enterprise_request(
  base,
  enterprise,
  state state,
  secret_type secret_type,
  resolution resolution,
  sort sort,
  direction direction,
  per_page per_page,
  before before,
  after after,
  validity validity,
  is_publicly_leaked is_publicly_leaked,
  is_multi_repo is_multi_repo,
) {
  let method = http.Get
  let path = "/enterprises/" <> enterprise <> "/secret-scanning/alerts"
  let query = [
    #("state", state),
    #("secret_type", secret_type),
    #("resolution", resolution),
    #("sort", sort),
    #("direction", direction),
    #("per_page", option.map(per_page, int.to_string)),
    #("before", before),
    #("after", after),
    #("validity", validity),
    #("is_publicly_leaked", option.map(is_publicly_leaked, bool.to_string)),
    #("is_multi_repo", option.map(is_multi_repo, bool.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn secret_scanning_list_alerts_for_enterprise_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.organization_secret_scanning_alert_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_remove_project_legacy_request(base, team_id, project_id) {
  let method = http.Delete
  let path =
    "/teams/"
    <> int.to_string(team_id)
    <> "/projects/"
    <> int.to_string(project_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_remove_project_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_add_or_update_project_permissions_legacy_request(
  base,
  team_id,
  project_id,
  data,
) {
  let method = http.Put
  let path =
    "/teams/"
    <> int.to_string(team_id)
    <> "/projects/"
    <> int.to_string(project_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn teams_add_or_update_project_permissions_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_check_permissions_for_project_legacy_request(
  base,
  team_id,
  project_id,
) {
  let method = http.Get
  let path =
    "/teams/"
    <> int.to_string(team_id)
    <> "/projects/"
    <> int.to_string(project_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_check_permissions_for_project_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.team_project_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_remove_membership_for_user_legacy_request(base, team_id, username) {
  let method = http.Delete
  let path = "/teams/" <> int.to_string(team_id) <> "/memberships/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_remove_membership_for_user_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_add_or_update_membership_for_user_legacy_request(
  base,
  team_id,
  username,
  data,
) {
  let method = http.Put
  let path = "/teams/" <> int.to_string(team_id) <> "/memberships/" <> username
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn teams_add_or_update_membership_for_user_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.team_membership_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_get_membership_for_user_legacy_request(base, team_id, username) {
  let method = http.Get
  let path = "/teams/" <> int.to_string(team_id) <> "/memberships/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_get_membership_for_user_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.team_membership_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_webhook_delivery_request(
  base,
  owner,
  repo,
  hook_id,
  delivery_id,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/hooks/"
    <> int.to_string(hook_id)
    <> "/deliveries/"
    <> int.to_string(delivery_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_webhook_delivery_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.hook_delivery_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_commit_comment_request(base, owner, repo, commit_sha, data) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/commits/"
    <> commit_sha
    <> "/comments"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_commit_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.commit_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_comments_for_commit_request(
  base,
  owner,
  repo,
  commit_sha,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/commits/"
    <> commit_sha
    <> "/comments"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_comments_for_commit_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.commit_comment_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_enable_workflow_request(base, owner, repo, workflow_id) {
  let method = http.Put
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/workflows/"
    <> workflow_id
    <> "/enable"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_enable_workflow_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_create_remove_token_for_org_request(base, org) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/actions/runners/remove-token"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_create_remove_token_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.authentication_token_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_update_authenticated_request(base, data) {
  let method = http.Patch
  let path = "/user"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn users_update_authenticated_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.private_user_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_get_authenticated_request(base) {
  let method = http.Get
  let path = "/user"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_get_authenticated_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.failure(Nil, "Unsupported schema"))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_set_primary_email_visibility_for_authenticated_user_request(
  base,
  data,
) {
  let method = http.Patch
  let path = "/user/email/visibility"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn users_set_primary_email_visibility_for_authenticated_user_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.email_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_set_github_actions_permissions_repository_request(
  base,
  owner,
  repo,
  data,
) {
  let method = http.Put
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/permissions"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_set_github_actions_permissions_repository_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_github_actions_permissions_repository_request(
  base,
  owner,
  repo,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/permissions"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_github_actions_permissions_repository_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.actions_repository_permissions_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_re_run_workflow_request(base, owner, repo, run_id, data) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
    <> "/rerun"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_re_run_workflow_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.empty_object_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_remove_custom_property_request(base, org, custom_property_name) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/properties/schema/" <> custom_property_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_remove_custom_property_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_create_or_update_custom_property_request(
  base,
  org,
  custom_property_name,
  data,
) {
  let method = http.Put
  let path = "/orgs/" <> org <> "/properties/schema/" <> custom_property_name
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn orgs_create_or_update_custom_property_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.custom_property_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_get_custom_property_request(base, org, custom_property_name) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/properties/schema/" <> custom_property_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_get_custom_property_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.custom_property_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_fork_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/forks"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_fork_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 ->
      utils.decode_bits(body, schema.full_repository_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_forks_request(
  base,
  owner,
  repo,
  sort sort,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/forks"
  let query = [
    #("sort", sort),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_forks_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.minimal_repository_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_org_ruleset_request(base, org, data) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/rulesets"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_org_ruleset_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.repository_ruleset_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_org_rulesets_request(
  base,
  org,
  per_page per_page,
  page page,
  targets targets,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/rulesets"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
    #("targets", targets),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_org_rulesets_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.repository_ruleset_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_list_request(base, since since, per_page per_page) {
  let method = http.Get
  let path = "/users"
  let query = [
    #("since", option.map(since, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_list_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_submit_review_request(
  base,
  owner,
  repo,
  pull_number,
  review_id,
  data,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/reviews/"
    <> int.to_string(review_id)
    <> "/events"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn pulls_submit_review_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.pull_request_review_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_list_packages_for_organization_request(
  base,
  org,
  package_type package_type,
  visibility visibility,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/packages"
  let query = [
    #("package_type", option.Some(package_type)),
    #("visibility", visibility),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_list_packages_for_organization_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.package_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_repo_secrets_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/secrets"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_repo_secrets_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_create_org_variable_request(base, org, data) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/actions/variables"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_create_org_variable_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.empty_object_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_org_variables_request(
  base,
  org,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/actions/variables"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_org_variables_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_cancel_workflow_run_request(base, owner, repo, run_id) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
    <> "/cancel"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_cancel_workflow_run_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 ->
      utils.decode_bits(body, schema.empty_object_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_self_hosted_runners_for_repo_request(
  base,
  owner,
  repo,
  name name,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/runners"
  let query = [
    #("name", name),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_self_hosted_runners_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_participation_stats_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/stats/participation"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_participation_stats_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.participation_stats_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_update_repo_variable_request(base, owner, repo, name, data) {
  let method = http.Patch
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/variables/" <> name
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_update_repo_variable_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_delete_repo_variable_request(base, owner, repo, name) {
  let method = http.Delete
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/variables/" <> name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_delete_repo_variable_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_repo_variable_request(base, owner, repo, name) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/variables/" <> name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_repo_variable_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.actions_variable_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_scanning_create_variant_analysis_request(base, owner, repo, data) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/code-scanning/codeql/variant-analyses"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn code_scanning_create_variant_analysis_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.code_scanning_variant_analysis_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_mark_notifications_as_read_request(base, data) {
  let method = http.Put
  let path = "/notifications"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn activity_mark_notifications_as_read_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_list_notifications_for_authenticated_user_request(
  base,
  all all,
  participating participating,
  since since,
  before before,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/notifications"
  let query = [
    #("all", option.map(all, bool.to_string)),
    #("participating", option.map(participating, bool.to_string)),
    #("since", since),
    #("before", before),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_list_notifications_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.thread_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_set_workflow_access_to_repository_request(
  base,
  owner,
  repo,
  actions_workflow_access_to_repository,
) {
  let method = http.Put
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/permissions/access"
  let query = []
  let body =
    utils.json_to_bits(schema.actions_workflow_access_to_repository_to_json(
      actions_workflow_access_to_repository,
    ))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_set_workflow_access_to_repository_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_workflow_access_to_repository_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/permissions/access"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_workflow_access_to_repository_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        schema.actions_workflow_access_to_repository_decoder(),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_delete_authorization_request(base, client_id, data) {
  let method = http.Delete
  let path = "/applications/" <> client_id <> "/grant"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn apps_delete_authorization_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_get_all_package_versions_for_package_owned_by_authenticated_user_request(
  base,
  package_type,
  package_name,
  page page,
  per_page per_page,
  state state,
) {
  let method = http.Get
  let path =
    "/user/packages/" <> package_type <> "/" <> package_name <> "/versions"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
    #("state", state),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_get_all_package_versions_for_package_owned_by_authenticated_user_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.package_version_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_update_release_asset_request(base, owner, repo, asset_id, data) {
  let method = http.Patch
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/releases/assets/"
    <> int.to_string(asset_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_update_release_asset_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.release_asset_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_release_asset_request(base, owner, repo, asset_id) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/releases/assets/"
    <> int.to_string(asset_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_release_asset_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_release_asset_request(base, owner, repo, asset_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/releases/assets/"
    <> int.to_string(asset_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_release_asset_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.release_asset_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_list_events_request(
  base,
  owner,
  repo,
  issue_number,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
    <> "/events"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_list_events_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.issue_event_for_issue_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_all_environments_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/environments"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_all_environments_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn classroom_get_assignment_grades_request(base, assignment_id) {
  let method = http.Get
  let path = "/assignments/" <> int.to_string(assignment_id) <> "/grades"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn classroom_get_assignment_grades_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.classroom_assignment_grade_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_set_custom_oidc_sub_claim_for_repo_request(
  base,
  owner,
  repo,
  data,
) {
  let method = http.Put
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/actions/oidc/customization/sub"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_set_custom_oidc_sub_claim_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.empty_object_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_custom_oidc_sub_claim_for_repo_request(base, owner, repo) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/actions/oidc/customization/sub"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_custom_oidc_sub_claim_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.oidc_custom_sub_repo_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_webhook_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/hooks"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_webhook_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.hook_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_webhooks_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/hooks"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_webhooks_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.hook_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_get_org_public_key_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/dependabot/secrets/public-key"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn dependabot_get_org_public_key_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.dependabot_public_key_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_scanning_update_alert_request(base, owner, repo, alert_number, data) {
  let method = http.Patch
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/code-scanning/alerts/"
    <> int.to_string(alert_number)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn code_scanning_update_alert_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.code_scanning_alert_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_scanning_get_alert_request(base, owner, repo, alert_number) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/code-scanning/alerts/"
    <> int.to_string(alert_number)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_scanning_get_alert_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.code_scanning_alert_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn meta_get_octocat_request(base, s s) {
  let method = http.Get
  let path = "/octocat"
  let query = [#("s", s)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn meta_get_octocat_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_workflow_request(base, owner, repo, workflow_id) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/actions/workflows/" <> workflow_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_workflow_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.workflow_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_update_discussion_legacy_request(
  base,
  team_id,
  discussion_number,
  data,
) {
  let method = http.Patch
  let path =
    "/teams/"
    <> int.to_string(team_id)
    <> "/discussions/"
    <> int.to_string(discussion_number)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn teams_update_discussion_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.team_discussion_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_delete_discussion_legacy_request(base, team_id, discussion_number) {
  let method = http.Delete
  let path =
    "/teams/"
    <> int.to_string(team_id)
    <> "/discussions/"
    <> int.to_string(discussion_number)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_delete_discussion_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_get_discussion_legacy_request(base, team_id, discussion_number) {
  let method = http.Get
  let path =
    "/teams/"
    <> int.to_string(team_id)
    <> "/discussions/"
    <> int.to_string(discussion_number)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_get_discussion_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.team_discussion_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn security_advisories_list_org_repository_advisories_request(
  base,
  org,
  direction direction,
  sort sort,
  before before,
  after after,
  per_page per_page,
  state state,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/security-advisories"
  let query = [
    #("direction", direction),
    #("sort", sort),
    #("before", before),
    #("after", after),
    #("per_page", option.map(per_page, int.to_string)),
    #("state", state),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn security_advisories_list_org_repository_advisories_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.repository_advisory_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_list_public_emails_for_authenticated_user_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/public_emails"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_list_public_emails_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.email_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_list_repos_in_org_request(
  base,
  org,
  team_slug,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/teams/" <> team_slug <> "/repos"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_list_repos_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.minimal_repository_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_revoke_org_role_user_request(base, org, username, role_id) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/organization-roles/users/"
    <> username
    <> "/"
    <> int.to_string(role_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_revoke_org_role_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_assign_user_to_org_role_request(base, org, username, role_id) {
  let method = http.Put
  let path =
    "/orgs/"
    <> org
    <> "/organization-roles/users/"
    <> username
    <> "/"
    <> int.to_string(role_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_assign_user_to_org_role_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_collaborator_permission_level_request(
  base,
  owner,
  repo,
  username,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/collaborators/"
    <> username
    <> "/permission"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_collaborator_permission_level_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        schema.repository_collaborator_permission_decoder(),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_update_pat_access_request(base, org, pat_id, data) {
  let method = http.Post
  let path =
    "/orgs/" <> org <> "/personal-access-tokens/" <> int.to_string(pat_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn orgs_update_pat_access_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_create_discussion_comment_in_org_request(
  base,
  org,
  team_slug,
  discussion_number,
  data,
) {
  let method = http.Post
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/comments"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn teams_create_discussion_comment_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.team_discussion_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_list_discussion_comments_in_org_request(
  base,
  org,
  team_slug,
  discussion_number,
  direction direction,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/comments"
  let query = [
    #("direction", direction),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_list_discussion_comments_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.team_discussion_comment_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_delete_for_issue_comment_request(
  base,
  owner,
  repo,
  comment_id,
  reaction_id,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/comments/"
    <> int.to_string(comment_id)
    <> "/reactions/"
    <> int.to_string(reaction_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn reactions_delete_for_issue_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_security_create_configuration_request(base, org, data) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/code-security/configurations"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn code_security_create_configuration_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.code_security_configuration_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_security_get_configurations_for_org_request(
  base,
  org,
  target_type target_type,
  per_page per_page,
  before before,
  after after,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/code-security/configurations"
  let query = [
    #("target_type", target_type),
    #("per_page", option.map(per_page, int.to_string)),
    #("before", before),
    #("after", after),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_security_get_configurations_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.code_security_configuration_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_delete_self_hosted_runner_from_repo_request(
  base,
  owner,
  repo,
  runner_id,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runners/"
    <> int.to_string(runner_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_delete_self_hosted_runner_from_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_self_hosted_runner_for_repo_request(
  base,
  owner,
  repo,
  runner_id,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runners/"
    <> int.to_string(runner_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_self_hosted_runner_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.runner_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_delete_artifact_request(base, owner, repo, artifact_id) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/artifacts/"
    <> int.to_string(artifact_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_delete_artifact_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_artifact_request(base, owner, repo, artifact_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/artifacts/"
    <> int.to_string(artifact_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_artifact_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.artifact_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_repo_ruleset_request(base, owner, repo, ruleset_id) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/rulesets/"
    <> int.to_string(ruleset_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_repo_ruleset_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_update_repo_ruleset_request(base, owner, repo, ruleset_id, data) {
  let method = http.Put
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/rulesets/"
    <> int.to_string(ruleset_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_update_repo_ruleset_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.repository_ruleset_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_repo_ruleset_request(
  base,
  owner,
  repo,
  ruleset_id,
  includes_parents includes_parents,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/rulesets/"
    <> int.to_string(ruleset_id)
  let query = [
    #("includes_parents", option.map(includes_parents, bool.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_repo_ruleset_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.repository_ruleset_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_upload_release_asset_request(
  base,
  owner,
  repo,
  release_id,
  name name,
  label label,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/releases/"
    <> int.to_string(release_id)
    <> "/assets"
  let query = [#("name", option.Some(name)), #("label", label)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_upload_release_asset_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.release_asset_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_release_assets_request(
  base,
  owner,
  repo,
  release_id,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/releases/"
    <> int.to_string(release_id)
    <> "/assets"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_release_assets_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.release_asset_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_create_for_team_discussion_comment_legacy_request(
  base,
  team_id,
  discussion_number,
  comment_number,
  data,
) {
  let method = http.Post
  let path =
    "/teams/"
    <> int.to_string(team_id)
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/comments/"
    <> int.to_string(comment_number)
    <> "/reactions"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn reactions_create_for_team_discussion_comment_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.reaction_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_list_for_team_discussion_comment_legacy_request(
  base,
  team_id,
  discussion_number,
  comment_number,
  content content,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/teams/"
    <> int.to_string(team_id)
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/comments/"
    <> int.to_string(comment_number)
    <> "/reactions"
  let query = [
    #("content", content),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn reactions_list_for_team_discussion_comment_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.reaction_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn checks_create_suite_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/check-suites"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn checks_create_suite_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.check_suite_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependency_graph_export_sbom_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/dependency-graph/sbom"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn dependency_graph_export_sbom_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.dependency_graph_spdx_sbom_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_update_request(base, owner, repo, data) {
  let method = http.Patch
  let path = "/repos/" <> owner <> "/" <> repo
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_update_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.full_repository_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_request(base, owner, repo) {
  let method = http.Delete
  let path = "/repos/" <> owner <> "/" <> repo
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.full_repository_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_public_request(base, since since) {
  let method = http.Get
  let path = "/repositories"
  let query = [#("since", option.map(since, int.to_string))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_public_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.minimal_repository_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn search_labels_request(
  base,
  repository_id repository_id,
  q q,
  sort sort,
  order order,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/search/labels"
  let query = [
    #("repository_id", option.Some(int.to_string(repository_id))),
    #("q", option.Some(q)),
    #("sort", sort),
    #("order", order),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_labels_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_artifacts_for_repo_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
  name name,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/artifacts"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
    #("name", name),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_artifacts_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_webhook_deliveries_request(
  base,
  owner,
  repo,
  hook_id,
  per_page per_page,
  cursor cursor,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/hooks/"
    <> int.to_string(hook_id)
    <> "/deliveries"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_webhook_deliveries_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.hook_delivery_item_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_create_label_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/labels"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn issues_create_label_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.label_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_list_labels_for_repo_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/labels"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_list_labels_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.label_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_list_public_request(
  base,
  since since,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/gists/public"
  let query = [
    #("since", since),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn gists_list_public_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.base_gist_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn markdown_render_raw_request(base) {
  let method = http.Post
  let path = "/markdown/raw"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn markdown_render_raw_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_revoke_org_role_team_request(base, org, team_slug, role_id) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/organization-roles/teams/"
    <> team_slug
    <> "/"
    <> int.to_string(role_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_revoke_org_role_team_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_assign_team_to_org_role_request(base, org, team_slug, role_id) {
  let method = http.Put
  let path =
    "/orgs/"
    <> org
    <> "/organization-roles/teams/"
    <> team_slug
    <> "/"
    <> int.to_string(role_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_assign_team_to_org_role_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_tag_protection_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/tags/protection"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_tag_protection_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.tag_protection_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_tag_protection_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/tags/protection"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_tag_protection_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.tag_protection_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_update_webhook_request(base, org, hook_id, data) {
  let method = http.Patch
  let path = "/orgs/" <> org <> "/hooks/" <> int.to_string(hook_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn orgs_update_webhook_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.org_hook_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_delete_webhook_request(base, org, hook_id) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/hooks/" <> int.to_string(hook_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_delete_webhook_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_get_webhook_request(base, org, hook_id) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/hooks/" <> int.to_string(hook_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_get_webhook_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.org_hook_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_remove_collaborator_request(base, project_id, username) {
  let method = http.Delete
  let path =
    "/projects/" <> int.to_string(project_id) <> "/collaborators/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn projects_remove_collaborator_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_add_collaborator_request(base, project_id, username, data) {
  let method = http.Put
  let path =
    "/projects/" <> int.to_string(project_id) <> "/collaborators/" <> username
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn projects_add_collaborator_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_scanning_list_recent_analyses_request(
  base,
  owner,
  repo,
  tool_name tool_name,
  tool_guid tool_guid,
  page page,
  per_page per_page,
  pr pr,
  ref ref,
  sarif_id sarif_id,
  direction direction,
  sort sort,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/code-scanning/analyses"
  let query = [
    #("tool_name", tool_name),
    #("tool_guid", tool_guid),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
    #("pr", option.map(pr, int.to_string)),
    #("ref", ref),
    #("sarif_id", sarif_id),
    #("direction", direction),
    #("sort", sort),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_scanning_list_recent_analyses_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.code_scanning_analysis_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_set_selected_repos_for_org_secret_request(
  base,
  org,
  secret_name,
  data,
) {
  let method = http.Put
  let path =
    "/orgs/" <> org <> "/dependabot/secrets/" <> secret_name <> "/repositories"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn dependabot_set_selected_repos_for_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_list_selected_repos_for_org_secret_request(
  base,
  org,
  secret_name,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path =
    "/orgs/" <> org <> "/dependabot/secrets/" <> secret_name <> "/repositories"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn dependabot_list_selected_repos_for_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_org_rule_suites_request(
  base,
  org,
  ref ref,
  repository_name repository_name,
  time_period time_period,
  actor_name actor_name,
  rule_suite_result rule_suite_result,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/rulesets/rule-suites"
  let query = [
    #("ref", ref),
    #("repository_name", option.map(repository_name, int.to_string)),
    #("time_period", time_period),
    #("actor_name", actor_name),
    #("rule_suite_result", rule_suite_result),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_org_rule_suites_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.rule_suites_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_create_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/pulls"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn pulls_create_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.pull_request_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_list_request(
  base,
  owner,
  repo,
  state state,
  head head,
  base_ base_,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/pulls"
  let query = [
    #("state", state),
    #("head", head),
    #("base_", base_),
    #("sort", sort),
    #("direction", direction),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn pulls_list_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.pull_request_simple_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_memberships_for_authenticated_user_request(
  base,
  state state,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/memberships/orgs"
  let query = [
    #("state", state),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_memberships_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.org_membership_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_list_events_for_repo_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/issues/events"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_list_events_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.issue_event_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_reset_token_request(base, client_id, data) {
  let method = http.Patch
  let path = "/applications/" <> client_id <> "/token"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn apps_reset_token_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.authorization_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_delete_token_request(base, client_id, data) {
  let method = http.Delete
  let path = "/applications/" <> client_id <> "/token"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn apps_delete_token_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_check_token_request(base, client_id, data) {
  let method = http.Post
  let path = "/applications/" <> client_id <> "/token"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn apps_check_token_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.authorization_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_environment_secrets_request(
  base,
  owner,
  repo,
  environment_name,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/secrets"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_environment_secrets_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_actions_cache_usage_for_org_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/actions/cache/usage"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_actions_cache_usage_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        schema.actions_cache_usage_org_enterprise_decoder(),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_get_commit_authors_request(base, owner, repo, since since) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/import/authors"
  let query = [#("since", option.map(since, int.to_string))]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn migrations_get_commit_authors_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.porter_author_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_remove_all_custom_labels_from_self_hosted_runner_for_repo_request(
  base,
  owner,
  repo,
  runner_id,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runners/"
    <> int.to_string(runner_id)
    <> "/labels"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_remove_all_custom_labels_from_self_hosted_runner_for_repo_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_add_custom_labels_to_self_hosted_runner_for_repo_request(
  base,
  owner,
  repo,
  runner_id,
  data,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runners/"
    <> int.to_string(runner_id)
    <> "/labels"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_add_custom_labels_to_self_hosted_runner_for_repo_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_set_custom_labels_for_self_hosted_runner_for_repo_request(
  base,
  owner,
  repo,
  runner_id,
  data,
) {
  let method = http.Put
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runners/"
    <> int.to_string(runner_id)
    <> "/labels"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_set_custom_labels_for_self_hosted_runner_for_repo_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_labels_for_self_hosted_runner_for_repo_request(
  base,
  owner,
  repo,
  runner_id,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runners/"
    <> int.to_string(runner_id)
    <> "/labels"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_labels_for_self_hosted_runner_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_list_projects_legacy_request(
  base,
  team_id,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/teams/" <> int.to_string(team_id) <> "/projects"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_list_projects_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.team_project_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_cancel_invitation_request(base, org, invitation_id) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/invitations/" <> int.to_string(invitation_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_cancel_invitation_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn copilot_copilot_metrics_for_team_request(
  base,
  org,
  team_slug,
  since since,
  until until,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/team/" <> team_slug <> "/copilot/metrics"
  let query = [
    #("since", since),
    #("until", until),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn copilot_copilot_metrics_for_team_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.copilot_usage_metrics_day_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_deployment_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/deployments"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_deployment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.deployment_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_deployments_request(
  base,
  owner,
  repo,
  sha sha,
  ref ref,
  task task,
  environment environment,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/deployments"
  let query = [
    #("sha", sha),
    #("ref", ref),
    #("task", task),
    #("environment", environment),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_deployments_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.deployment_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_check_user_can_be_assigned_request(base, owner, repo, assignee) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/assignees/" <> assignee
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_check_user_can_be_assigned_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn secret_scanning_update_alert_request(
  base,
  owner,
  repo,
  alert_number,
  data,
) {
  let method = http.Patch
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/secret-scanning/alerts/"
    <> int.to_string(alert_number)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn secret_scanning_update_alert_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.secret_scanning_alert_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn secret_scanning_get_alert_request(base, owner, repo, alert_number) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/secret-scanning/alerts/"
    <> int.to_string(alert_number)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn secret_scanning_get_alert_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.secret_scanning_alert_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_jobs_for_workflow_run_request(
  base,
  owner,
  repo,
  run_id,
  filter filter,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
    <> "/jobs"
  let query = [
    #("filter", filter),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_jobs_for_workflow_run_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_commit_statuses_for_ref_request(
  base,
  owner,
  repo,
  ref,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/commits/" <> ref <> "/statuses"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_commit_statuses_for_ref_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.status_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_codeowners_errors_request(base, owner, repo, ref ref) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/codeowners/errors"
  let query = [#("ref", ref)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_codeowners_errors_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.codeowners_errors_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_security_update_configuration_request(
  base,
  org,
  configuration_id,
  data,
) {
  let method = http.Patch
  let path =
    "/orgs/"
    <> org
    <> "/code-security/configurations/"
    <> int.to_string(configuration_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn code_security_update_configuration_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_security_delete_configuration_request(base, org, configuration_id) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/code-security/configurations/"
    <> int.to_string(configuration_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_security_delete_configuration_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_security_get_configuration_request(base, org, configuration_id) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/code-security/configurations/"
    <> int.to_string(configuration_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_security_get_configuration_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.code_security_configuration_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_delete_repo_secret_request(base, owner, repo, secret_name) {
  let method = http.Delete
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/codespaces/secrets/" <> secret_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_delete_repo_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_create_or_update_repo_secret_request(
  base,
  owner,
  repo,
  secret_name,
  data,
) {
  let method = http.Put
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/codespaces/secrets/" <> secret_name
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn codespaces_create_or_update_repo_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_get_repo_secret_request(base, owner, repo, secret_name) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/codespaces/secrets/" <> secret_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_get_repo_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.repo_codespaces_secret_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_access_restrictions_request(base, owner, repo, branch) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/restrictions"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_access_restrictions_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_access_restrictions_request(base, owner, repo, branch) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/restrictions"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_access_restrictions_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.branch_restriction_policy_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_commit_status_request(base, owner, repo, sha, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/statuses/" <> sha
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_commit_status_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.status_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_create_for_release_request(base, owner, repo, release_id, data) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/releases/"
    <> int.to_string(release_id)
    <> "/reactions"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn reactions_create_for_release_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.reaction_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_list_for_release_request(
  base,
  owner,
  repo,
  release_id,
  content content,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/releases/"
    <> int.to_string(release_id)
    <> "/reactions"
  let query = [
    #("content", content),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn reactions_list_for_release_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.reaction_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_fork_request(base, gist_id) {
  let method = http.Post
  let path = "/gists/" <> gist_id <> "/forks"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn gists_fork_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.base_gist_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_list_forks_request(base, gist_id, per_page per_page, page page) {
  let method = http.Get
  let path = "/gists/" <> gist_id <> "/forks"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn gists_list_forks_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.gist_simple_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn copilot_cancel_copilot_seat_assignment_for_teams_request(base, org, data) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/copilot/billing/selected_teams"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn copilot_cancel_copilot_seat_assignment_for_teams_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn copilot_add_copilot_seats_for_teams_request(base, org, data) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/copilot/billing/selected_teams"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn copilot_add_copilot_seats_for_teams_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_create_column_request(base, project_id, data) {
  let method = http.Post
  let path = "/projects/" <> int.to_string(project_id) <> "/columns"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn projects_create_column_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.project_column_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_list_columns_request(
  base,
  project_id,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/projects/" <> int.to_string(project_id) <> "/columns"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn projects_list_columns_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.project_column_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn copilot_list_copilot_seats_for_enterprise_request(
  base,
  enterprise,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/enterprises/" <> enterprise <> "/copilot/billing/seats"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn copilot_list_copilot_seats_for_enterprise_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn git_create_ref_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/git/refs"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn git_create_ref_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.git_ref_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn checks_list_suites_for_ref_request(
  base,
  owner,
  repo,
  ref,
  app_id app_id,
  check_name check_name,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/commits/" <> ref <> "/check-suites"
  let query = [
    #("app_id", option.map(app_id, int.to_string)),
    #("check_name", check_name),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn checks_list_suites_for_ref_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_collaborators_request(
  base,
  owner,
  repo,
  affiliation affiliation,
  permission permission,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/collaborators"
  let query = [
    #("affiliation", affiliation),
    #("permission", permission),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_collaborators_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.collaborator_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_in_org_request(base, org, data) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/repos"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.full_repository_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_for_org_request(
  base,
  org,
  type_ type_,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/repos"
  let query = [
    #("type_", type_),
    #("sort", sort),
    #("direction", direction),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.minimal_repository_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_delete_package_version_for_user_request(
  base,
  username,
  package_type,
  package_name,
  package_version_id,
) {
  let method = http.Delete
  let path =
    "/users/"
    <> username
    <> "/packages/"
    <> package_type
    <> "/"
    <> package_name
    <> "/versions/"
    <> int.to_string(package_version_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_delete_package_version_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_get_package_version_for_user_request(
  base,
  username,
  package_type,
  package_name,
  package_version_id,
) {
  let method = http.Get
  let path =
    "/users/"
    <> username
    <> "/packages/"
    <> package_type
    <> "/"
    <> package_name
    <> "/versions/"
    <> int.to_string(package_version_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_get_package_version_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.package_version_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_runner_applications_for_repo_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/runners/downloads"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_runner_applications_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.runner_application_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_delete_repo_subscription_request(base, owner, repo) {
  let method = http.Delete
  let path = "/repos/" <> owner <> "/" <> repo <> "/subscription"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_delete_repo_subscription_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_set_repo_subscription_request(base, owner, repo, data) {
  let method = http.Put
  let path = "/repos/" <> owner <> "/" <> repo <> "/subscription"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn activity_set_repo_subscription_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.repository_subscription_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_get_repo_subscription_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/subscription"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_get_repo_subscription_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.repository_subscription_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_generate_runner_jitconfig_for_repo_request(
  base,
  owner,
  repo,
  data,
) {
  let method = http.Post
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/actions/runners/generate-jitconfig"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_generate_runner_jitconfig_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn copilot_copilot_metrics_for_organization_request(
  base,
  org,
  since since,
  until until,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/copilot/metrics"
  let query = [
    #("since", since),
    #("until", until),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn copilot_copilot_metrics_for_organization_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.copilot_usage_metrics_day_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_list_comments_for_review_request(
  base,
  owner,
  repo,
  pull_number,
  review_id,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/reviews/"
    <> int.to_string(review_id)
    <> "/comments"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn pulls_list_comments_for_review_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.review_comment_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_for_user_request(
  base,
  username,
  type_ type_,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/repos"
  let query = [
    #("type_", type_),
    #("sort", sort),
    #("direction", direction),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.minimal_repository_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_get_org_role_request(base, org, role_id) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/organization-roles/" <> int.to_string(role_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_get_org_role_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.organization_role_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_environment_public_key_request(
  base,
  owner,
  repo,
  environment_name,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/secrets/public-key"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_environment_public_key_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.actions_public_key_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_delete_package_version_for_org_request(
  base,
  org,
  package_type,
  package_name,
  package_version_id,
) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/packages/"
    <> package_type
    <> "/"
    <> package_name
    <> "/versions/"
    <> int.to_string(package_version_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_delete_package_version_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_get_package_version_for_organization_request(
  base,
  org,
  package_type,
  package_name,
  package_version_id,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/packages/"
    <> package_type
    <> "/"
    <> package_name
    <> "/versions/"
    <> int.to_string(package_version_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_get_package_version_for_organization_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.package_version_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_restore_package_version_for_user_request(
  base,
  username,
  package_type,
  package_name,
  package_version_id,
) {
  let method = http.Post
  let path =
    "/users/"
    <> username
    <> "/packages/"
    <> package_type
    <> "/"
    <> package_name
    <> "/versions/"
    <> int.to_string(package_version_id)
    <> "/restore"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_restore_package_version_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn meta_get_request(base) {
  let method = http.Get
  let path = "/meta"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn meta_get_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.api_overview_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_get_status_for_org_request(
  base,
  org,
  migration_id,
  exclude exclude,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/migrations/" <> int.to_string(migration_id)
  let query = [#("exclude", panic as "exclude")]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn migrations_get_status_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.migration_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn git_get_ref_request(base, owner, repo, ref) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/git/ref/" <> ref
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn git_get_ref_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.git_ref_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn api_insights_get_user_stats_request(
  base,
  org,
  user_id,
  min_timestamp min_timestamp,
  max_timestamp max_timestamp,
  page page,
  per_page per_page,
  direction direction,
  sort sort,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/insights/api/user-stats/" <> user_id
  let query = [
    #("min_timestamp", option.Some(min_timestamp)),
    #("max_timestamp", option.Some(max_timestamp)),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
    #("direction", direction),
    #("sort", panic as "sort"),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn api_insights_get_user_stats_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.api_insights_user_stats_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_job_for_workflow_run_request(base, owner, repo, job_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/jobs/"
    <> int.to_string(job_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_job_for_workflow_run_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.job_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_set_github_actions_default_workflow_permissions_repository_request(
  base,
  owner,
  repo,
  actions_set_default_workflow_permissions,
) {
  let method = http.Put
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/actions/permissions/workflow"
  let query = []
  let body =
    utils.json_to_bits(schema.actions_set_default_workflow_permissions_to_json(
      actions_set_default_workflow_permissions,
    ))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_set_github_actions_default_workflow_permissions_repository_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_github_actions_default_workflow_permissions_repository_request(
  base,
  owner,
  repo,
) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/actions/permissions/workflow"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_github_actions_default_workflow_permissions_repository_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        schema.actions_get_default_workflow_permissions_decoder(),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn copilot_usage_metrics_for_team_request(
  base,
  org,
  team_slug,
  since since,
  until until,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/team/" <> team_slug <> "/copilot/usage"
  let query = [
    #("since", since),
    #("until", until),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn copilot_usage_metrics_for_team_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.copilot_usage_metrics_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_remove_outside_collaborator_request(base, org, username) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/outside_collaborators/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_remove_outside_collaborator_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_convert_member_to_outside_collaborator_request(
  base,
  org,
  username,
  data,
) {
  let method = http.Put
  let path = "/orgs/" <> org <> "/outside_collaborators/" <> username
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn orgs_convert_member_to_outside_collaborator_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_set_allowed_actions_organization_request(
  base,
  org,
  selected_actions,
) {
  let method = http.Put
  let path = "/orgs/" <> org <> "/actions/permissions/selected-actions"
  let query = []
  let body =
    utils.json_to_bits(schema.selected_actions_to_json(selected_actions))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_set_allowed_actions_organization_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_allowed_actions_organization_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/actions/permissions/selected-actions"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_allowed_actions_organization_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.selected_actions_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_delete_org_secret_request(base, org, secret_name) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/actions/secrets/" <> secret_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_delete_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_create_or_update_org_secret_request(base, org, secret_name, data) {
  let method = http.Put
  let path = "/orgs/" <> org <> "/actions/secrets/" <> secret_name
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_create_or_update_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_org_secret_request(base, org, secret_name) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/actions/secrets/" <> secret_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.organization_actions_secret_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_generate_release_notes_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/releases/generate-notes"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_generate_release_notes_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.release_notes_content_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_jobs_for_workflow_run_attempt_request(
  base,
  owner,
  repo,
  run_id,
  attempt_number,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
    <> "/attempts/"
    <> int.to_string(attempt_number)
    <> "/jobs"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_jobs_for_workflow_run_attempt_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_top_referrers_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/traffic/popular/referrers"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_top_referrers_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.referrer_traffic_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_check_following_for_user_request(base, username, target_user) {
  let method = http.Get
  let path = "/users/" <> username <> "/following/" <> target_user
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_check_following_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_get_subscription_plan_for_account_stubbed_request(base, account_id) {
  let method = http.Get
  let path =
    "/marketplace_listing/stubbed/accounts/" <> int.to_string(account_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_get_subscription_plan_for_account_stubbed_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.marketplace_purchase_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn meta_get_zen_request(base) {
  let method = http.Get
  let path = "/zen"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn meta_get_zen_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.failure(Nil, "Unsupported schema"))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_update_request(base, gist_id, data) {
  let method = http.Patch
  let path = "/gists/" <> gist_id
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn gists_update_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.gist_simple_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_delete_request(base, gist_id) {
  let method = http.Delete
  let path = "/gists/" <> gist_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn gists_delete_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_get_request(base, gist_id) {
  let method = http.Get
  let path = "/gists/" <> gist_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn gists_get_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.gist_simple_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_restore_package_version_for_org_request(
  base,
  org,
  package_type,
  package_name,
  package_version_id,
) {
  let method = http.Post
  let path =
    "/orgs/"
    <> org
    <> "/packages/"
    <> package_type
    <> "/"
    <> package_name
    <> "/versions/"
    <> int.to_string(package_version_id)
    <> "/restore"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_restore_package_version_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_create_self_hosted_runner_group_for_org_request(base, org, data) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/actions/runner-groups"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_create_self_hosted_runner_group_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.runner_groups_org_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_self_hosted_runner_groups_for_org_request(
  base,
  org,
  per_page per_page,
  page page,
  visible_to_repository visible_to_repository,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/actions/runner-groups"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
    #("visible_to_repository", visible_to_repository),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_self_hosted_runner_groups_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_list_watchers_for_repo_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/subscribers"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_list_watchers_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_repo_organization_secrets_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/actions/organization-secrets"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_repo_organization_secrets_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_update_legacy_request(base, team_id, data) {
  let method = http.Patch
  let path = "/teams/" <> int.to_string(team_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn teams_update_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.team_full_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_delete_legacy_request(base, team_id) {
  let method = http.Delete
  let path = "/teams/" <> int.to_string(team_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_delete_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_get_legacy_request(base, team_id) {
  let method = http.Get
  let path = "/teams/" <> int.to_string(team_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_get_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.team_full_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_list_public_events_for_repo_network_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/networks/" <> owner <> "/" <> repo <> "/events"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_list_public_events_for_repo_network_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.event_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn checks_rerequest_run_request(base, owner, repo, check_run_id) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/check-runs/"
    <> int.to_string(check_run_id)
    <> "/rerequest"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn checks_rerequest_run_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.empty_object_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn classroom_get_an_assignment_request(base, assignment_id) {
  let method = http.Get
  let path = "/assignments/" <> int.to_string(assignment_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn classroom_get_an_assignment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.classroom_assignment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_create_comment_request(base, owner, repo, issue_number, data) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
    <> "/comments"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn issues_create_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.issue_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_list_comments_request(
  base,
  owner,
  repo,
  issue_number,
  since since,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
    <> "/comments"
  let query = [
    #("since", since),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_list_comments_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.issue_comment_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_update_branch_request(base, owner, repo, pull_number, data) {
  let method = http.Put
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/update-branch"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn pulls_update_branch_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_compare_commits_request(
  base,
  owner,
  repo,
  basehead,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/compare/" <> basehead
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_compare_commits_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.commit_comparison_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_create_for_team_discussion_legacy_request(
  base,
  team_id,
  discussion_number,
  data,
) {
  let method = http.Post
  let path =
    "/teams/"
    <> int.to_string(team_id)
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/reactions"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn reactions_create_for_team_discussion_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.reaction_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_list_for_team_discussion_legacy_request(
  base,
  team_id,
  discussion_number,
  content content,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/teams/"
    <> int.to_string(team_id)
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/reactions"
  let query = [
    #("content", content),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn reactions_list_for_team_discussion_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.reaction_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_merge_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/merges"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_merge_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_revoke_installation_access_token_request(base) {
  let method = http.Delete
  let path = "/installation/token"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_revoke_installation_access_token_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_revoke_all_org_roles_user_request(base, org, username) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/organization-roles/users/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_revoke_all_org_roles_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_release_by_tag_request(base, owner, repo, tag) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/releases/tags/" <> tag
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_release_by_tag_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.release_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_list_org_secrets_request(
  base,
  org,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/dependabot/secrets"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn dependabot_list_org_secrets_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_create_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/issues"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn issues_create_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.issue_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_list_for_repo_request(
  base,
  owner,
  repo,
  milestone milestone,
  state state,
  assignee assignee,
  creator creator,
  mentioned mentioned,
  labels labels,
  sort sort,
  direction direction,
  since since,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/issues"
  let query = [
    #("milestone", milestone),
    #("state", state),
    #("assignee", assignee),
    #("creator", creator),
    #("mentioned", mentioned),
    #("labels", labels),
    #("sort", sort),
    #("direction", direction),
    #("since", since),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_list_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.issue_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_create_for_repo_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/projects"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn projects_create_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.project_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_list_for_repo_request(
  base,
  owner,
  repo,
  state state,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/projects"
  let query = [
    #("state", state),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn projects_list_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.project_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_get_authenticated_request(base) {
  let method = http.Get
  let path = "/app"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_get_authenticated_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.integration_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_latest_release_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/releases/latest"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_latest_release_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.release_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_list_ssh_signing_keys_for_user_request(
  base,
  username,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/ssh_signing_keys"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_list_ssh_signing_keys_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.ssh_signing_key_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_autolink_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/autolinks"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_autolink_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.autolink_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_autolinks_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/autolinks"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_autolinks_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.autolink_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_enable_or_disable_security_product_on_all_org_repos_request(
  base,
  org,
  security_product,
  enablement,
  data,
) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/" <> security_product <> "/" <> enablement
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn orgs_enable_or_disable_security_product_on_all_org_repos_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_delete_secret_for_authenticated_user_request(
  base,
  secret_name,
) {
  let method = http.Delete
  let path = "/user/codespaces/secrets/" <> secret_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_delete_secret_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_create_or_update_secret_for_authenticated_user_request(
  base,
  secret_name,
  data,
) {
  let method = http.Put
  let path = "/user/codespaces/secrets/" <> secret_name
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn codespaces_create_or_update_secret_for_authenticated_user_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_get_secret_for_authenticated_user_request(base, secret_name) {
  let method = http.Get
  let path = "/user/codespaces/secrets/" <> secret_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_get_secret_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.codespaces_secret_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_blocked_users_request(base, org, per_page per_page, page page) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/blocks"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_blocked_users_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_list_alerts_for_enterprise_request(
  base,
  enterprise,
  state state,
  severity severity,
  ecosystem ecosystem,
  package package,
  scope scope,
  sort sort,
  direction direction,
  before before,
  after after,
  first first,
  last last,
  per_page per_page,
) {
  let method = http.Get
  let path = "/enterprises/" <> enterprise <> "/dependabot/alerts"
  let query = [
    #("state", state),
    #("severity", severity),
    #("ecosystem", ecosystem),
    #("package", package),
    #("scope", scope),
    #("sort", sort),
    #("direction", direction),
    #("before", before),
    #("after", after),
    #("first", option.map(first, int.to_string)),
    #("last", option.map(last, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn dependabot_list_alerts_for_enterprise_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.dependabot_alert_with_repository_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_list_public_events_for_user_request(
  base,
  username,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/events/public"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_list_public_events_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.event_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_create_with_repo_for_authenticated_user_request(
  base,
  owner,
  repo,
  data,
) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/codespaces"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn codespaces_create_with_repo_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.codespace_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_list_in_repository_for_authenticated_user_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/codespaces"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_list_in_repository_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn classroom_list_assignments_for_a_classroom_request(
  base,
  classroom_id,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/classrooms/" <> int.to_string(classroom_id) <> "/assignments"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn classroom_list_assignments_for_a_classroom_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.simple_classroom_assignment_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_get_repo_installation_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/installation"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_get_repo_installation_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.installation_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_revoke_all_org_roles_team_request(base, org, team_slug) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/organization-roles/teams/" <> team_slug
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_revoke_all_org_roles_team_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn search_issues_and_pull_requests_request(
  base,
  q q,
  sort sort,
  order order,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/search/issues"
  let query = [
    #("q", option.Some(q)),
    #("sort", sort),
    #("order", order),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_issues_and_pull_requests_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn copilot_usage_metrics_for_org_request(
  base,
  org,
  since since,
  until until,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/copilot/usage"
  let query = [
    #("since", since),
    #("until", until),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn copilot_usage_metrics_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.copilot_usage_metrics_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_update_self_hosted_runner_group_for_org_request(
  base,
  org,
  runner_group_id,
  data,
) {
  let method = http.Patch
  let path =
    "/orgs/"
    <> org
    <> "/actions/runner-groups/"
    <> int.to_string(runner_group_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_update_self_hosted_runner_group_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.runner_groups_org_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_delete_self_hosted_runner_group_from_org_request(
  base,
  org,
  runner_group_id,
) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/actions/runner-groups/"
    <> int.to_string(runner_group_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_delete_self_hosted_runner_group_from_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_self_hosted_runner_group_for_org_request(
  base,
  org,
  runner_group_id,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/actions/runner-groups/"
    <> int.to_string(runner_group_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_self_hosted_runner_group_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.runner_groups_org_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_create_or_update_custom_properties_values_for_repos_request(
  base,
  org,
  data,
) {
  let method = http.Patch
  let path = "/orgs/" <> org <> "/properties/values"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn orgs_create_or_update_custom_properties_values_for_repos_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_custom_properties_values_for_repos_request(
  base,
  org,
  per_page per_page,
  page page,
  repository_query repository_query,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/properties/values"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
    #("repository_query", repository_query),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_custom_properties_values_for_repos_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.org_repo_custom_property_values_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_list_repos_starred_by_user_request(
  base,
  username,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/starred"
  let query = [
    #("sort", sort),
    #("direction", direction),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_list_repos_starred_by_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.failure(Nil, "Unsupported schema"))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_workflow_runs_for_repo_request(
  base,
  owner,
  repo,
  actor actor,
  branch branch,
  event event,
  status status,
  per_page per_page,
  page page,
  created created,
  exclude_pull_requests exclude_pull_requests,
  check_suite_id check_suite_id,
  head_sha head_sha,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/runs"
  let query = [
    #("actor", actor),
    #("branch", branch),
    #("event", event),
    #("status", status),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
    #("created", created),
    #(
      "exclude_pull_requests",
      option.map(exclude_pull_requests, bool.to_string),
    ),
    #("check_suite_id", option.map(check_suite_id, int.to_string)),
    #("head_sha", head_sha),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_workflow_runs_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_scanning_delete_codeql_database_request(base, owner, repo, language) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/code-scanning/codeql/databases/"
    <> language
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_scanning_delete_codeql_database_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_scanning_get_codeql_database_request(base, owner, repo, language) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/code-scanning/codeql/databases/"
    <> language
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_scanning_get_codeql_database_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.code_scanning_codeql_database_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_code_frequency_stats_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/stats/code_frequency"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_code_frequency_stats_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_re_run_workflow_failed_jobs_request(
  base,
  owner,
  repo,
  run_id,
  data,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
    <> "/rerun-failed-jobs"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_re_run_workflow_failed_jobs_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.empty_object_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_set_selected_repositories_enabled_github_actions_organization_request(
  base,
  org,
  data,
) {
  let method = http.Put
  let path = "/orgs/" <> org <> "/actions/permissions/repositories"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_set_selected_repositories_enabled_github_actions_organization_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_selected_repositories_enabled_github_actions_organization_request(
  base,
  org,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/actions/permissions/repositories"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_selected_repositories_enabled_github_actions_organization_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_list_comments_for_repo_request(
  base,
  owner,
  repo,
  sort sort,
  direction direction,
  since since,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/issues/comments"
  let query = [
    #("sort", sort),
    #("direction", direction),
    #("since", since),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_list_comments_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.issue_comment_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_tags_request(base, owner, repo, per_page per_page, page page) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/tags"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_tags_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.tag_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_redeliver_webhook_delivery_request(base, delivery_id) {
  let method = http.Post
  let path =
    "/app/hook/deliveries/" <> int.to_string(delivery_id) <> "/attempts"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_redeliver_webhook_delivery_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_publish_for_authenticated_user_request(
  base,
  codespace_name,
  data,
) {
  let method = http.Post
  let path = "/user/codespaces/" <> codespace_name <> "/publish"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn codespaces_publish_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.codespace_with_full_repository_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_security_get_configuration_for_repository_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/code-security-configuration"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_security_get_configuration_for_repository_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_workflow_run_attempt_request(
  base,
  owner,
  repo,
  run_id,
  attempt_number,
  exclude_pull_requests exclude_pull_requests,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
    <> "/attempts/"
    <> int.to_string(attempt_number)
  let query = [
    #(
      "exclude_pull_requests",
      option.map(exclude_pull_requests, bool.to_string),
    ),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_workflow_run_attempt_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.workflow_run_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_update_webhook_config_for_app_request(base, data) {
  let method = http.Patch
  let path = "/app/hook/config"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn apps_update_webhook_config_for_app_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.webhook_config_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_get_webhook_config_for_app_request(base) {
  let method = http.Get
  let path = "/app/hook/config"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_get_webhook_config_for_app_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.webhook_config_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_reviews_for_run_request(base, owner, repo, run_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
    <> "/approvals"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_reviews_for_run_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.environment_approvals_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_disable_workflow_request(base, owner, repo, workflow_id) {
  let method = http.Put
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/workflows/"
    <> workflow_id
    <> "/disable"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_disable_workflow_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_delete_package_for_authenticated_user_request(
  base,
  package_type,
  package_name,
) {
  let method = http.Delete
  let path = "/user/packages/" <> package_type <> "/" <> package_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_delete_package_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_get_package_for_authenticated_user_request(
  base,
  package_type,
  package_name,
) {
  let method = http.Get
  let path = "/user/packages/" <> package_type <> "/" <> package_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_get_package_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.package_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_repo_public_key_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/secrets/public-key"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_repo_public_key_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.actions_public_key_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_list_repo_events_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/events"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_list_repo_events_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.event_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_update_for_authenticated_user_request(
  base,
  codespace_name,
  data,
) {
  let method = http.Patch
  let path = "/user/codespaces/" <> codespace_name
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn codespaces_update_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.codespace_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_delete_for_authenticated_user_request(base, codespace_name) {
  let method = http.Delete
  let path = "/user/codespaces/" <> codespace_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_delete_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_get_for_authenticated_user_request(base, codespace_name) {
  let method = http.Get
  let path = "/user/codespaces/" <> codespace_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_get_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.codespace_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_request(base, since since, per_page per_page) {
  let method = http.Get
  let path = "/organizations"
  let query = [
    #("since", option.map(since, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.organization_simple_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_list_pending_invitations_in_org_request(
  base,
  org,
  team_slug,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/teams/" <> team_slug <> "/invitations"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_list_pending_invitations_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.organization_invitation_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_start_for_org_request(base, org, data) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/migrations"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn migrations_start_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.migration_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_list_for_org_request(
  base,
  org,
  per_page per_page,
  page page,
  exclude exclude,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/migrations"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
    #("exclude", panic as "exclude"),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn migrations_list_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.migration_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_create_or_update_custom_properties_request(base, org, data) {
  let method = http.Patch
  let path = "/orgs/" <> org <> "/properties/schema"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn orgs_create_or_update_custom_properties_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.custom_property_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_get_all_custom_properties_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/properties/schema"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_get_all_custom_properties_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.custom_property_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_remove_repo_in_org_request(base, org, team_slug, owner, repo) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/repos/"
    <> owner
    <> "/"
    <> repo
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_remove_repo_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_add_or_update_repo_permissions_in_org_request(
  base,
  org,
  team_slug,
  owner,
  repo,
  data,
) {
  let method = http.Put
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/repos/"
    <> owner
    <> "/"
    <> repo
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn teams_add_or_update_repo_permissions_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_check_permissions_for_repo_in_org_request(
  base,
  org,
  team_slug,
  owner,
  repo,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/repos/"
    <> owner
    <> "/"
    <> repo
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_check_permissions_for_repo_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn git_list_matching_refs_request(base, owner, repo, ref) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/git/matching-refs/" <> ref
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn git_list_matching_refs_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.git_ref_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_unsuspend_installation_request(base, installation_id) {
  let method = http.Delete
  let path =
    "/app/installations/" <> int.to_string(installation_id) <> "/suspended"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_unsuspend_installation_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_suspend_installation_request(base, installation_id) {
  let method = http.Put
  let path =
    "/app/installations/" <> int.to_string(installation_id) <> "/suspended"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_suspend_installation_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_list_starred_request(
  base,
  since since,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/gists/starred"
  let query = [
    #("since", since),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn gists_list_starred_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.base_gist_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn secret_scanning_create_push_protection_bypass_request(
  base,
  owner,
  repo,
  data,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/secret-scanning/push-protection-bypasses"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn secret_scanning_create_push_protection_bypass_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        schema.secret_scanning_push_protection_bypass_decoder(),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_list_labels_for_milestone_request(
  base,
  owner,
  repo,
  milestone_number,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/milestones/"
    <> int.to_string(milestone_number)
    <> "/labels"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_list_labels_for_milestone_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.label_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_delete_workflow_run_request(base, owner, repo, run_id) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_delete_workflow_run_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_workflow_run_request(
  base,
  owner,
  repo,
  run_id,
  exclude_pull_requests exclude_pull_requests,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
  let query = [
    #(
      "exclude_pull_requests",
      option.map(exclude_pull_requests, bool.to_string),
    ),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_workflow_run_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.workflow_run_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn git_get_tag_request(base, owner, repo, tag_sha) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/git/tags/" <> tag_sha
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn git_get_tag_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.git_tag_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_remove_custom_label_from_self_hosted_runner_for_repo_request(
  base,
  owner,
  repo,
  runner_id,
  name,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runners/"
    <> int.to_string(runner_id)
    <> "/labels/"
    <> name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_remove_custom_label_from_self_hosted_runner_for_repo_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_get_revision_request(base, gist_id, sha) {
  let method = http.Get
  let path = "/gists/" <> gist_id <> "/" <> sha
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn gists_get_revision_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.gist_simple_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_update_discussion_comment_in_org_request(
  base,
  org,
  team_slug,
  discussion_number,
  comment_number,
  data,
) {
  let method = http.Patch
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/comments/"
    <> int.to_string(comment_number)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn teams_update_discussion_comment_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.team_discussion_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_delete_discussion_comment_in_org_request(
  base,
  org,
  team_slug,
  discussion_number,
  comment_number,
) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/comments/"
    <> int.to_string(comment_number)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_delete_discussion_comment_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_get_discussion_comment_in_org_request(
  base,
  org,
  team_slug,
  discussion_number,
  comment_number,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/comments/"
    <> int.to_string(comment_number)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_get_discussion_comment_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.team_discussion_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_check_permissions_for_devcontainer_request(
  base,
  owner,
  repo,
  ref ref,
  devcontainer_path devcontainer_path,
) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/codespaces/permissions_check"
  let query = [
    #("ref", option.Some(ref)),
    #("devcontainer_path", option.Some(devcontainer_path)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_check_permissions_for_devcontainer_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        schema.codespaces_permissions_check_for_devcontainer_decoder(),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_get_subscription_plan_for_account_request(base, account_id) {
  let method = http.Get
  let path = "/marketplace_listing/accounts/" <> int.to_string(account_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_get_subscription_plan_for_account_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.marketplace_purchase_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_contributors_request(
  base,
  owner,
  repo,
  anon anon,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/contributors"
  let query = [
    #("anon", anon),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_contributors_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_list_members_in_org_request(
  base,
  org,
  team_slug,
  role role,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/teams/" <> team_slug <> "/members"
  let query = [
    #("role", role),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_list_members_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn secret_scanning_list_alerts_for_repo_request(
  base,
  owner,
  repo,
  state state,
  secret_type secret_type,
  resolution resolution,
  sort sort,
  direction direction,
  page page,
  per_page per_page,
  before before,
  after after,
  validity validity,
  is_publicly_leaked is_publicly_leaked,
  is_multi_repo is_multi_repo,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/secret-scanning/alerts"
  let query = [
    #("state", state),
    #("secret_type", secret_type),
    #("resolution", resolution),
    #("sort", sort),
    #("direction", direction),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
    #("before", before),
    #("after", after),
    #("validity", validity),
    #("is_publicly_leaked", option.map(is_publicly_leaked, bool.to_string)),
    #("is_multi_repo", option.map(is_multi_repo, bool.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn secret_scanning_list_alerts_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.secret_scanning_alert_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_map_commit_author_request(base, owner, repo, author_id, data) {
  let method = http.Patch
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/import/authors/"
    <> int.to_string(author_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn migrations_map_commit_author_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.porter_author_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_create_comment_request(base, gist_id, data) {
  let method = http.Post
  let path = "/gists/" <> gist_id <> "/comments"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn gists_create_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.gist_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_list_comments_request(base, gist_id, per_page per_page, page page) {
  let method = http.Get
  let path = "/gists/" <> gist_id <> "/comments"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn gists_list_comments_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.gist_comment_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_restore_package_for_authenticated_user_request(
  base,
  package_type,
  package_name,
  token_ token_,
) {
  let method = http.Post
  let path =
    "/user/packages/" <> package_type <> "/" <> package_name <> "/restore"
  let query = [#("token_", token_)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_restore_package_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_scanning_get_sarif_request(base, owner, repo, sarif_id) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/code-scanning/sarifs/" <> sarif_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_scanning_get_sarif_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.code_scanning_sarifs_status_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_mark_repo_notifications_as_read_request(base, owner, repo, data) {
  let method = http.Put
  let path = "/repos/" <> owner <> "/" <> repo <> "/notifications"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn activity_mark_repo_notifications_as_read_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_list_repo_notifications_for_authenticated_user_request(
  base,
  owner,
  repo,
  all all,
  participating participating,
  since since,
  before before,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/notifications"
  let query = [
    #("all", option.map(all, bool.to_string)),
    #("participating", option.map(participating, bool.to_string)),
    #("since", since),
    #("before", before),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_list_repo_notifications_for_authenticated_user_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.thread_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn search_users_request(
  base,
  q q,
  sort sort,
  order order,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/search/users"
  let query = [
    #("q", option.Some(q)),
    #("sort", sort),
    #("order", order),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_users_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_list_stargazers_for_repo_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/stargazers"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_list_stargazers_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.failure(Nil, "Unsupported schema"))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_update_request(base, owner, repo, issue_number, data) {
  let method = http.Patch
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn issues_update_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.issue_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_get_request(base, owner, repo, issue_number) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_get_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.issue_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_get_org_public_key_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/codespaces/secrets/public-key"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_get_org_public_key_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.codespaces_public_key_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_create_card_request(base, column_id) {
  let method = http.Post
  let path = "/projects/columns/" <> int.to_string(column_id) <> "/cards"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn projects_create_card_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.project_card_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_list_cards_request(
  base,
  column_id,
  archived_state archived_state,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/projects/columns/" <> int.to_string(column_id) <> "/cards"
  let query = [
    #("archived_state", archived_state),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn projects_list_cards_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.project_card_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_cancel_pages_deployment_request(
  base,
  owner,
  repo,
  pages_deployment_id,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pages/deployments/"
    <> pages_deployment_id
    <> "/cancel"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_cancel_pages_deployment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_update_label_request(base, owner, repo, name, data) {
  let method = http.Patch
  let path = "/repos/" <> owner <> "/" <> repo <> "/labels/" <> name
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn issues_update_label_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.label_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_delete_label_request(base, owner, repo, name) {
  let method = http.Delete
  let path = "/repos/" <> owner <> "/" <> repo <> "/labels/" <> name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_delete_label_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_get_label_request(base, owner, repo, name) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/labels/" <> name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_get_label_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.label_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_commit_activity_stats_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/stats/commit_activity"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_commit_activity_stats_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_create_discussion_legacy_request(base, team_id, data) {
  let method = http.Post
  let path = "/teams/" <> int.to_string(team_id) <> "/discussions"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn teams_create_discussion_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.team_discussion_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_list_discussions_legacy_request(
  base,
  team_id,
  direction direction,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/teams/" <> int.to_string(team_id) <> "/discussions"
  let query = [
    #("direction", direction),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_list_discussions_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.team_discussion_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_move_column_request(base, column_id, data) {
  let method = http.Post
  let path = "/projects/columns/" <> int.to_string(column_id) <> "/moves"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn projects_move_column_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_admin_branch_protection_request(base, owner, repo, branch) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/enforce_admins"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_admin_branch_protection_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_set_admin_branch_protection_request(base, owner, repo, branch) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/enforce_admins"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_set_admin_branch_protection_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.protected_branch_admin_enforced_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_admin_branch_protection_request(base, owner, repo, branch) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/enforce_admins"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_admin_branch_protection_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.protected_branch_admin_enforced_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_create_for_authenticated_user_request(base, data) {
  let method = http.Post
  let path = "/user/projects"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn projects_create_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.project_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_public_members_request(base, org, per_page per_page, page page) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/public_members"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_public_members_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_branch_rules_request(
  base,
  owner,
  repo,
  branch,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/rules/branches/" <> branch
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_branch_rules_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.repository_rule_detailed_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_list_for_authenticated_user_request(
  base,
  filter filter,
  state state,
  labels labels,
  sort sort,
  direction direction,
  since since,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/issues"
  let query = [
    #("filter", filter),
    #("state", state),
    #("labels", labels),
    #("sort", sort),
    #("direction", direction),
    #("since", since),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_list_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.issue_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn classroom_list_classrooms_request(base, page page, per_page per_page) {
  let method = http.Get
  let path = "/classrooms"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn classroom_list_classrooms_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_classroom_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_create_registration_token_for_org_request(base, org) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/actions/runners/registration-token"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_create_registration_token_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.authentication_token_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_create_for_authenticated_user_request(base) {
  let method = http.Post
  let path = "/user/codespaces"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_create_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.codespace_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_list_for_authenticated_user_request(
  base,
  per_page per_page,
  page page,
  repository_id repository_id,
) {
  let method = http.Get
  let path = "/user/codespaces"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
    #("repository_id", option.map(repository_id, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_list_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_org_roles_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/organization-roles"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_org_roles_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_remove_selected_repo_from_org_secret_request(
  base,
  org,
  secret_name,
  repository_id,
) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/dependabot/secrets/"
    <> secret_name
    <> "/repositories/"
    <> int.to_string(repository_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn dependabot_remove_selected_repo_from_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_add_selected_repo_to_org_secret_request(
  base,
  org,
  secret_name,
  repository_id,
) {
  let method = http.Put
  let path =
    "/orgs/"
    <> org
    <> "/dependabot/secrets/"
    <> secret_name
    <> "/repositories/"
    <> int.to_string(repository_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn dependabot_add_selected_repo_to_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn api_insights_get_time_stats_by_user_request(
  base,
  org,
  user_id,
  min_timestamp min_timestamp,
  max_timestamp max_timestamp,
  timestamp_increment timestamp_increment,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/insights/api/time-stats/users/" <> user_id
  let query = [
    #("min_timestamp", option.Some(min_timestamp)),
    #("max_timestamp", option.Some(max_timestamp)),
    #("timestamp_increment", option.Some(timestamp_increment)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn api_insights_get_time_stats_by_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.api_insights_time_stats_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_delete_pending_review_request(
  base,
  owner,
  repo,
  pull_number,
  review_id,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/reviews/"
    <> int.to_string(review_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn pulls_delete_pending_review_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.pull_request_review_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_update_review_request(
  base,
  owner,
  repo,
  pull_number,
  review_id,
  data,
) {
  let method = http.Put
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/reviews/"
    <> int.to_string(review_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn pulls_update_review_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.pull_request_review_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_get_review_request(base, owner, repo, pull_number, review_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/reviews/"
    <> int.to_string(review_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn pulls_get_review_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.pull_request_review_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn meta_root_request(base) {
  let method = http.Get
  let path = "/"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn meta_root_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.root_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_set_selected_repos_for_org_secret_request(
  base,
  org,
  secret_name,
  data,
) {
  let method = http.Put
  let path =
    "/orgs/" <> org <> "/codespaces/secrets/" <> secret_name <> "/repositories"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn codespaces_set_selected_repos_for_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_list_selected_repos_for_org_secret_request(
  base,
  org,
  secret_name,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path =
    "/orgs/" <> org <> "/codespaces/secrets/" <> secret_name <> "/repositories"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_list_selected_repos_for_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_latest_pages_build_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/pages/builds/latest"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_latest_pages_build_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.page_build_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_approve_workflow_run_request(base, owner, repo, run_id) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
    <> "/approve"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_approve_workflow_run_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.empty_object_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_unstar_request(base, gist_id) {
  let method = http.Delete
  let path = "/gists/" <> gist_id <> "/star"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn gists_unstar_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_star_request(base, gist_id) {
  let method = http.Put
  let path = "/gists/" <> gist_id <> "/star"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn gists_star_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_check_is_starred_request(base, gist_id) {
  let method = http.Get
  let path = "/gists/" <> gist_id <> "/star"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn gists_check_is_starred_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn git_create_tag_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/git/tags"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn git_create_tag_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.git_tag_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn api_insights_get_summary_stats_by_user_request(
  base,
  org,
  user_id,
  min_timestamp min_timestamp,
  max_timestamp max_timestamp,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/insights/api/summary-stats/users/" <> user_id
  let query = [
    #("min_timestamp", option.Some(min_timestamp)),
    #("max_timestamp", option.Some(max_timestamp)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn api_insights_get_summary_stats_by_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.api_insights_summary_stats_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_create_invitation_request(base, org, data) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/invitations"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn orgs_create_invitation_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.organization_invitation_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_pending_invitations_request(
  base,
  org,
  per_page per_page,
  page page,
  role role,
  invitation_source invitation_source,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/invitations"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
    #("role", role),
    #("invitation_source", invitation_source),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_pending_invitations_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.organization_invitation_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_remove_user_access_restrictions_request(
  base,
  owner,
  repo,
  branch,
  data,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/restrictions/users"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_remove_user_access_restrictions_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_add_user_access_restrictions_request(
  base,
  owner,
  repo,
  branch,
  data,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/restrictions/users"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_add_user_access_restrictions_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_set_user_access_restrictions_request(
  base,
  owner,
  repo,
  branch,
  data,
) {
  let method = http.Put
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/restrictions/users"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_set_user_access_restrictions_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_users_with_access_to_protected_branch_request(
  base,
  owner,
  repo,
  branch,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/restrictions/users"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_users_with_access_to_protected_branch_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_list_received_public_events_for_user_request(
  base,
  username,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/received_events/public"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_list_received_public_events_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.event_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_remove_member_request(base, org, username) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/members/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_remove_member_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_check_membership_for_user_request(base, org, username) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/members/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_check_membership_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codes_of_conduct_get_conduct_code_request(base, key) {
  let method = http.Get
  let path = "/codes_of_conduct/" <> key
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codes_of_conduct_get_conduct_code_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.code_of_conduct_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_list_repos_accessible_to_installation_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/installation/repositories"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_list_repos_accessible_to_installation_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_top_paths_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/traffic/popular/paths"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_top_paths_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.content_traffic_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_delete_workflow_run_logs_request(base, owner, repo, run_id) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
    <> "/logs"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_delete_workflow_run_logs_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_download_workflow_run_logs_request(base, owner, repo, run_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
    <> "/logs"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_download_workflow_run_logs_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_get_webhook_delivery_request(base, org, hook_id, delivery_id) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/hooks/"
    <> int.to_string(hook_id)
    <> "/deliveries/"
    <> int.to_string(delivery_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_get_webhook_delivery_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.hook_delivery_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_list_subscriptions_for_authenticated_user_stubbed_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/marketplace_purchases/stubbed"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_list_subscriptions_for_authenticated_user_stubbed_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.user_marketplace_purchase_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_org_role_users_request(
  base,
  org,
  role_id,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/organization-roles/"
    <> int.to_string(role_id)
    <> "/users"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_org_role_users_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.user_role_assignment_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn checks_rerequest_suite_request(base, owner, repo, check_suite_id) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/check-suites/"
    <> int.to_string(check_suite_id)
    <> "/rerequest"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn checks_rerequest_suite_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.empty_object_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_app_installations_request(
  base,
  org,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/installations"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_app_installations_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_delete_repo_secret_request(base, owner, repo, secret_name) {
  let method = http.Delete
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/dependabot/secrets/" <> secret_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn dependabot_delete_repo_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_create_or_update_repo_secret_request(
  base,
  owner,
  repo,
  secret_name,
  data,
) {
  let method = http.Put
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/dependabot/secrets/" <> secret_name
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn dependabot_create_or_update_repo_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_get_repo_secret_request(base, owner, repo, secret_name) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/dependabot/secrets/" <> secret_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn dependabot_get_repo_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.dependabot_secret_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_commit_signature_protection_request(
  base,
  owner,
  repo,
  branch,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/required_signatures"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_commit_signature_protection_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_commit_signature_protection_request(
  base,
  owner,
  repo,
  branch,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/required_signatures"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_create_commit_signature_protection_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.protected_branch_admin_enforced_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_commit_signature_protection_request(base, owner, repo, branch) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/required_signatures"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_commit_signature_protection_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.protected_branch_admin_enforced_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_create_repo_variable_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/variables"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_create_repo_variable_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.empty_object_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_repo_variables_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/variables"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_repo_variables_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_download_workflow_run_attempt_logs_request(
  base,
  owner,
  repo,
  run_id,
  attempt_number,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
    <> "/attempts/"
    <> int.to_string(attempt_number)
    <> "/logs"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_download_workflow_run_attempt_logs_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_create_with_pr_for_authenticated_user_request(
  base,
  owner,
  repo,
  pull_number,
  data,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/codespaces"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn codespaces_create_with_pr_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.codespace_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_delete_for_release_request(
  base,
  owner,
  repo,
  release_id,
  reaction_id,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/releases/"
    <> int.to_string(release_id)
    <> "/reactions/"
    <> int.to_string(reaction_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn reactions_delete_for_release_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_remove_project_in_org_request(base, org, team_slug, project_id) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/projects/"
    <> int.to_string(project_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_remove_project_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_add_or_update_project_permissions_in_org_request(
  base,
  org,
  team_slug,
  project_id,
  data,
) {
  let method = http.Put
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/projects/"
    <> int.to_string(project_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn teams_add_or_update_project_permissions_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_check_permissions_for_project_in_org_request(
  base,
  org,
  team_slug,
  project_id,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/projects/"
    <> int.to_string(project_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_check_permissions_for_project_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.team_project_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_members_request(
  base,
  org,
  filter filter,
  role role,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/members"
  let query = [
    #("filter", filter),
    #("role", role),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_members_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_pat_grant_request_repositories_request(
  base,
  org,
  pat_request_id,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/personal-access-token-requests/"
    <> int.to_string(pat_request_id)
    <> "/repositories"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_pat_grant_request_repositories_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.minimal_repository_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_list_review_comments_for_repo_request(
  base,
  owner,
  repo,
  sort sort,
  direction direction,
  since since,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/pulls/comments"
  let query = [
    #("sort", sort),
    #("direction", direction),
    #("since", since),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn pulls_list_review_comments_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.pull_request_review_comment_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_scanning_list_alerts_for_repo_request(
  base,
  owner,
  repo,
  tool_name tool_name,
  tool_guid tool_guid,
  page page,
  per_page per_page,
  ref ref,
  pr pr,
  direction direction,
  before before,
  after after,
  sort sort,
  state state,
  severity severity,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/code-scanning/alerts"
  let query = [
    #("tool_name", tool_name),
    #("tool_guid", tool_guid),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
    #("ref", ref),
    #("pr", option.map(pr, int.to_string)),
    #("direction", direction),
    #("before", before),
    #("after", after),
    #("sort", sort),
    #("state", state),
    #("severity", severity),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_scanning_list_alerts_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.code_scanning_alert_items_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn security_advisories_create_repository_advisory_cve_request_request(
  base,
  owner,
  repo,
  ghsa_id,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/security-advisories/"
    <> ghsa_id
    <> "/cve"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn security_advisories_create_repository_advisory_cve_request_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_delete_public_ssh_key_for_authenticated_user_request(base, key_id) {
  let method = http.Delete
  let path = "/user/keys/" <> int.to_string(key_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_delete_public_ssh_key_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_get_public_ssh_key_for_authenticated_user_request(base, key_id) {
  let method = http.Get
  let path = "/user/keys/" <> int.to_string(key_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_get_public_ssh_key_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.key_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_list_child_in_org_request(
  base,
  org,
  team_slug,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/teams/" <> team_slug <> "/teams"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_list_child_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.team_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_remove_status_check_contexts_request(base, owner, repo, branch) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/required_status_checks/contexts"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_remove_status_check_contexts_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.failure(Nil, "Unsupported schema"))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_add_status_check_contexts_request(base, owner, repo, branch) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/required_status_checks/contexts"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_add_status_check_contexts_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.failure(Nil, "Unsupported schema"))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_set_status_check_contexts_request(base, owner, repo, branch) {
  let method = http.Put
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/required_status_checks/contexts"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_set_status_check_contexts_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.failure(Nil, "Unsupported schema"))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_all_status_check_contexts_request(base, owner, repo, branch) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/required_status_checks/contexts"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_all_status_check_contexts_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.failure(Nil, "Unsupported schema"))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_update_org_variable_request(base, org, name, data) {
  let method = http.Patch
  let path = "/orgs/" <> org <> "/actions/variables/" <> name
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_update_org_variable_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_delete_org_variable_request(base, org, name) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/actions/variables/" <> name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_delete_org_variable_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_org_variable_request(base, org, name) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/actions/variables/" <> name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_org_variable_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.organization_actions_variable_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_set_codespaces_access_request(base, org, data) {
  let method = http.Put
  let path = "/orgs/" <> org <> "/codespaces/access"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn codespaces_set_codespaces_access_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_security_set_configuration_as_default_request(
  base,
  org,
  configuration_id,
  data,
) {
  let method = http.Put
  let path =
    "/orgs/"
    <> org
    <> "/code-security/configurations/"
    <> int.to_string(configuration_id)
    <> "/defaults"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn code_security_set_configuration_as_default_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn security_advisories_create_fork_request(base, owner, repo, ghsa_id) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/security-advisories/"
    <> ghsa_id
    <> "/forks"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn security_advisories_create_fork_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 ->
      utils.decode_bits(body, schema.full_repository_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn oidc_update_oidc_custom_sub_template_for_org_request(
  base,
  org,
  oidc_custom_sub,
) {
  let method = http.Put
  let path = "/orgs/" <> org <> "/actions/oidc/customization/sub"
  let query = []
  let body = utils.json_to_bits(schema.oidc_custom_sub_to_json(oidc_custom_sub))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn oidc_update_oidc_custom_sub_template_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.empty_object_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn oidc_get_oidc_custom_sub_template_for_org_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/actions/oidc/customization/sub"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn oidc_get_oidc_custom_sub_template_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.oidc_custom_sub_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_delete_email_for_authenticated_user_request(base) {
  let method = http.Delete
  let path = "/user/emails"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_delete_email_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_add_email_for_authenticated_user_request(base) {
  let method = http.Post
  let path = "/user/emails"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_add_email_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, zero.list(schema.email_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_list_emails_for_authenticated_user_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/emails"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_list_emails_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.email_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_pages_site_request(base, owner, repo) {
  let method = http.Delete
  let path = "/repos/" <> owner <> "/" <> repo <> "/pages"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_pages_site_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_pages_site_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/pages"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_pages_site_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.page_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_update_information_about_pages_site_request(
  base,
  owner,
  repo,
  data,
) {
  let method = http.Put
  let path = "/repos/" <> owner <> "/" <> repo <> "/pages"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_update_information_about_pages_site_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_pages_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/pages"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_pages_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.page_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_list_repos_for_authenticated_user_request(
  base,
  migration_id,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/user/migrations/" <> int.to_string(migration_id) <> "/repositories"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn migrations_list_repos_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.minimal_repository_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_mark_thread_as_read_request(base, thread_id) {
  let method = http.Patch
  let path = "/notifications/threads/" <> int.to_string(thread_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_mark_thread_as_read_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    205 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_mark_thread_as_done_request(base, thread_id) {
  let method = http.Delete
  let path = "/notifications/threads/" <> int.to_string(thread_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_mark_thread_as_done_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_get_thread_request(base, thread_id) {
  let method = http.Get
  let path = "/notifications/threads/" <> int.to_string(thread_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_get_thread_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.thread_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_stop_in_organization_request(
  base,
  org,
  username,
  codespace_name,
) {
  let method = http.Post
  let path =
    "/orgs/"
    <> org
    <> "/members/"
    <> username
    <> "/codespaces/"
    <> codespace_name
    <> "/stop"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_stop_in_organization_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.codespace_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn copilot_get_copilot_organization_details_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/copilot/billing"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn copilot_get_copilot_organization_details_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.copilot_organization_details_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn security_advisories_create_repository_advisory_request(
  base,
  owner,
  repo,
  repository_advisory_create,
) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/security-advisories"
  let query = []
  let body =
    utils.json_to_bits(schema.repository_advisory_create_to_json(
      repository_advisory_create,
    ))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn security_advisories_create_repository_advisory_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.repository_advisory_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn security_advisories_list_repository_advisories_request(
  base,
  owner,
  repo,
  direction direction,
  sort sort,
  before before,
  after after,
  per_page per_page,
  state state,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/security-advisories"
  let query = [
    #("direction", direction),
    #("sort", sort),
    #("before", before),
    #("after", after),
    #("per_page", option.map(per_page, int.to_string)),
    #("state", state),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn security_advisories_list_repository_advisories_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.repository_advisory_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_get_repo_public_key_request(base, owner, repo) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/dependabot/secrets/public-key"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn dependabot_get_repo_public_key_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.dependabot_public_key_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_for_authenticated_user_request(base, data) {
  let method = http.Post
  let path = "/user/repos"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.full_repository_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_for_authenticated_user_request(
  base,
  visibility visibility,
  affiliation affiliation,
  type_ type_,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
  since since,
  before before,
) {
  let method = http.Get
  let path = "/user/repos"
  let query = [
    #("visibility", visibility),
    #("affiliation", affiliation),
    #("type_", type_),
    #("sort", sort),
    #("direction", direction),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
    #("since", since),
    #("before", before),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.repository_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_remove_app_access_restrictions_request(
  base,
  owner,
  repo,
  branch,
  data,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/restrictions/apps"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_remove_app_access_restrictions_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.integration_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_add_app_access_restrictions_request(
  base,
  owner,
  repo,
  branch,
  data,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/restrictions/apps"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_add_app_access_restrictions_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.integration_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_set_app_access_restrictions_request(
  base,
  owner,
  repo,
  branch,
  data,
) {
  let method = http.Put
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/restrictions/apps"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_set_app_access_restrictions_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.integration_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_apps_with_access_to_protected_branch_request(
  base,
  owner,
  repo,
  branch,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/restrictions/apps"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_apps_with_access_to_protected_branch_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.integration_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn copilot_copilot_metrics_for_enterprise_team_request(
  base,
  enterprise,
  team_slug,
  since since,
  until until,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path =
    "/enterprises/" <> enterprise <> "/team/" <> team_slug <> "/copilot/metrics"
  let query = [
    #("since", since),
    #("until", until),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn copilot_copilot_metrics_for_enterprise_team_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.copilot_usage_metrics_day_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_deploy_key_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/keys"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_deploy_key_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.deploy_key_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_deploy_keys_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/keys"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_deploy_keys_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.deploy_key_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_commit_comments_for_repo_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/comments"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_commit_comments_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.commit_comment_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_unlock_repo_for_authenticated_user_request(
  base,
  migration_id,
  repo_name,
) {
  let method = http.Delete
  let path =
    "/user/migrations/"
    <> int.to_string(migration_id)
    <> "/repos/"
    <> repo_name
    <> "/lock"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn migrations_unlock_repo_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_list_assignees_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/assignees"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_list_assignees_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_remove_public_membership_for_authenticated_user_request(
  base,
  org,
  username,
) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/public_members/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_remove_public_membership_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_set_public_membership_for_authenticated_user_request(
  base,
  org,
  username,
) {
  let method = http.Put
  let path = "/orgs/" <> org <> "/public_members/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_set_public_membership_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_check_public_membership_for_user_request(base, org, username) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/public_members/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_check_public_membership_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_create_discussion_comment_legacy_request(
  base,
  team_id,
  discussion_number,
  data,
) {
  let method = http.Post
  let path =
    "/teams/"
    <> int.to_string(team_id)
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/comments"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn teams_create_discussion_comment_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.team_discussion_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_list_discussion_comments_legacy_request(
  base,
  team_id,
  discussion_number,
  direction direction,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/teams/"
    <> int.to_string(team_id)
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/comments"
  let query = [
    #("direction", direction),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_list_discussion_comments_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.team_discussion_comment_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_disable_automated_security_fixes_request(base, owner, repo) {
  let method = http.Delete
  let path = "/repos/" <> owner <> "/" <> repo <> "/automated-security-fixes"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_disable_automated_security_fixes_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_enable_automated_security_fixes_request(base, owner, repo) {
  let method = http.Put
  let path = "/repos/" <> owner <> "/" <> repo <> "/automated-security-fixes"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_enable_automated_security_fixes_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_check_automated_security_fixes_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/automated-security-fixes"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_check_automated_security_fixes_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.check_automated_security_fixes_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_attestations_request(
  base,
  org,
  subject_digest,
  per_page per_page,
  before before,
  after after,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/attestations/" <> subject_digest
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("before", before),
    #("after", after),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_attestations_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_webhook_deliveries_request(
  base,
  org,
  hook_id,
  per_page per_page,
  cursor cursor,
) {
  let method = http.Get
  let path =
    "/orgs/" <> org <> "/hooks/" <> int.to_string(hook_id) <> "/deliveries"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_webhook_deliveries_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.hook_delivery_item_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_delete_ssh_signing_key_for_authenticated_user_request(
  base,
  ssh_signing_key_id,
) {
  let method = http.Delete
  let path = "/user/ssh_signing_keys/" <> int.to_string(ssh_signing_key_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_delete_ssh_signing_key_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_get_ssh_signing_key_for_authenticated_user_request(
  base,
  ssh_signing_key_id,
) {
  let method = http.Get
  let path = "/user/ssh_signing_keys/" <> int.to_string(ssh_signing_key_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_get_ssh_signing_key_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.ssh_signing_key_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_scanning_get_variant_analysis_request(
  base,
  owner,
  repo,
  codeql_variant_analysis_id,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/code-scanning/codeql/variant-analyses/"
    <> int.to_string(codeql_variant_analysis_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_scanning_get_variant_analysis_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.code_scanning_variant_analysis_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn copilot_get_copilot_seat_details_for_user_request(base, org, username) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/members/" <> username <> "/copilot"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn copilot_get_copilot_seat_details_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.copilot_seat_details_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_create_for_team_discussion_comment_in_org_request(
  base,
  org,
  team_slug,
  discussion_number,
  comment_number,
  data,
) {
  let method = http.Post
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/comments/"
    <> int.to_string(comment_number)
    <> "/reactions"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn reactions_create_for_team_discussion_comment_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.reaction_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_list_for_team_discussion_comment_in_org_request(
  base,
  org,
  team_slug,
  discussion_number,
  comment_number,
  content content,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/comments/"
    <> int.to_string(comment_number)
    <> "/reactions"
  let query = [
    #("content", content),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn reactions_list_for_team_discussion_comment_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.reaction_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_update_discussion_in_org_request(
  base,
  org,
  team_slug,
  discussion_number,
  data,
) {
  let method = http.Patch
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/discussions/"
    <> int.to_string(discussion_number)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn teams_update_discussion_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.team_discussion_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_delete_discussion_in_org_request(
  base,
  org,
  team_slug,
  discussion_number,
) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/discussions/"
    <> int.to_string(discussion_number)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_delete_discussion_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_get_discussion_in_org_request(
  base,
  org,
  team_slug,
  discussion_number,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/discussions/"
    <> int.to_string(discussion_number)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_get_discussion_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.team_discussion_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_delete_gpg_key_for_authenticated_user_request(base, gpg_key_id) {
  let method = http.Delete
  let path = "/user/gpg_keys/" <> int.to_string(gpg_key_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_delete_gpg_key_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_get_gpg_key_for_authenticated_user_request(base, gpg_key_id) {
  let method = http.Get
  let path = "/user/gpg_keys/" <> int.to_string(gpg_key_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_get_gpg_key_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.gpg_key_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_get_status_for_authenticated_user_request(
  base,
  migration_id,
  exclude exclude,
) {
  let method = http.Get
  let path = "/user/migrations/" <> int.to_string(migration_id)
  let query = [#("exclude", panic as "exclude")]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn migrations_get_status_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.migration_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn interactions_remove_restrictions_for_repo_request(base, owner, repo) {
  let method = http.Delete
  let path = "/repos/" <> owner <> "/" <> repo <> "/interaction-limits"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn interactions_remove_restrictions_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn interactions_set_restrictions_for_repo_request(
  base,
  owner,
  repo,
  interaction_limit,
) {
  let method = http.Put
  let path = "/repos/" <> owner <> "/" <> repo <> "/interaction-limits"
  let query = []
  let body =
    utils.json_to_bits(schema.interaction_limit_to_json(interaction_limit))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn interactions_set_restrictions_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.interaction_limit_response_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn interactions_get_restrictions_for_repo_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/interaction-limits"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn interactions_get_restrictions_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.failure(Nil, "Unsupported schema"))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_list_social_accounts_for_user_request(
  base,
  username,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/social_accounts"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_list_social_accounts_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.social_account_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_community_profile_metrics_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/community/profile"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_community_profile_metrics_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.community_profile_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn rate_limit_get_request(base) {
  let method = http.Get
  let path = "/rate_limit"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn rate_limit_get_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.rate_limit_overview_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn copilot_list_copilot_seats_request(
  base,
  org,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/copilot/billing/seats"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn copilot_list_copilot_seats_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_create_installation_access_token_request(
  base,
  installation_id,
  data,
) {
  let method = http.Post
  let path =
    "/app/installations/" <> int.to_string(installation_id) <> "/access_tokens"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn apps_create_installation_access_token_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.installation_token_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn git_update_ref_request(base, owner, repo, ref, data) {
  let method = http.Patch
  let path = "/repos/" <> owner <> "/" <> repo <> "/git/refs/" <> ref
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn git_update_ref_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.git_ref_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn git_delete_ref_request(base, owner, repo, ref) {
  let method = http.Delete
  let path = "/repos/" <> owner <> "/" <> repo <> "/git/refs/" <> ref
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn git_delete_ref_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_pages_deployment_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/pages/deployments"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_pages_deployment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.page_deployment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_create_for_issue_request(base, owner, repo, issue_number, data) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
    <> "/reactions"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn reactions_create_for_issue_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.reaction_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_list_for_issue_request(
  base,
  owner,
  repo,
  issue_number,
  content content,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
    <> "/reactions"
  let query = [
    #("content", content),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn reactions_list_for_issue_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.reaction_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn meta_get_all_versions_request(base) {
  let method = http.Get
  let path = "/versions"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn meta_get_all_versions_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.failure(Nil, "Unsupported schema"))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_unlock_request(base, owner, repo, issue_number) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
    <> "/lock"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_unlock_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_lock_request(base, owner, repo, issue_number, data) {
  let method = http.Put
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
    <> "/lock"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn issues_lock_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_autolink_request(base, owner, repo, autolink_id) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/autolinks/"
    <> int.to_string(autolink_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_autolink_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_autolink_request(base, owner, repo, autolink_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/autolinks/"
    <> int.to_string(autolink_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_autolink_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.autolink_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_deployment_request(base, owner, repo, deployment_id) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/deployments/"
    <> int.to_string(deployment_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_deployment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_deployment_request(base, owner, repo, deployment_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/deployments/"
    <> int.to_string(deployment_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_deployment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.deployment_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_remove_requested_reviewers_request(
  base,
  owner,
  repo,
  pull_number,
  data,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/requested_reviewers"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn pulls_remove_requested_reviewers_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.pull_request_simple_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_request_reviewers_request(base, owner, repo, pull_number, data) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/requested_reviewers"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn pulls_request_reviewers_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.pull_request_simple_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_list_requested_reviewers_request(base, owner, repo, pull_number) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/requested_reviewers"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn pulls_list_requested_reviewers_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.pull_request_review_request_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_disable_selected_repository_github_actions_organization_request(
  base,
  org,
  repository_id,
) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/actions/permissions/repositories/"
    <> int.to_string(repository_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_disable_selected_repository_github_actions_organization_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_enable_selected_repository_github_actions_organization_request(
  base,
  org,
  repository_id,
) {
  let method = http.Put
  let path =
    "/orgs/"
    <> org
    <> "/actions/permissions/repositories/"
    <> int.to_string(repository_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_enable_selected_repository_github_actions_organization_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_codespace_machines_for_authenticated_user_request(
  base,
  codespace_name,
) {
  let method = http.Get
  let path = "/user/codespaces/" <> codespace_name <> "/machines"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_codespace_machines_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_remove_membership_for_user_request(base, org, username) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/memberships/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_remove_membership_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_set_membership_for_user_request(base, org, username, data) {
  let method = http.Put
  let path = "/orgs/" <> org <> "/memberships/" <> username
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn orgs_set_membership_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.org_membership_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_get_membership_for_user_request(base, org, username) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/memberships/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_get_membership_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.org_membership_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_list_installation_repos_for_authenticated_user_request(
  base,
  installation_id,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/user/installations/" <> int.to_string(installation_id) <> "/repositories"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_list_installation_repos_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_create_request(base, org, data) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/teams"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn teams_create_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.team_full_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_list_request(base, org, per_page per_page, page page) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/teams"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_list_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.team_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_remove_all_custom_labels_from_self_hosted_runner_for_org_request(
  base,
  org,
  runner_id,
) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/actions/runners/"
    <> int.to_string(runner_id)
    <> "/labels"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_remove_all_custom_labels_from_self_hosted_runner_for_org_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_add_custom_labels_to_self_hosted_runner_for_org_request(
  base,
  org,
  runner_id,
  data,
) {
  let method = http.Post
  let path =
    "/orgs/"
    <> org
    <> "/actions/runners/"
    <> int.to_string(runner_id)
    <> "/labels"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_add_custom_labels_to_self_hosted_runner_for_org_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_set_custom_labels_for_self_hosted_runner_for_org_request(
  base,
  org,
  runner_id,
  data,
) {
  let method = http.Put
  let path =
    "/orgs/"
    <> org
    <> "/actions/runners/"
    <> int.to_string(runner_id)
    <> "/labels"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_set_custom_labels_for_self_hosted_runner_for_org_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_labels_for_self_hosted_runner_for_org_request(
  base,
  org,
  runner_id,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/actions/runners/"
    <> int.to_string(runner_id)
    <> "/labels"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_labels_for_self_hosted_runner_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_create_gpg_key_for_authenticated_user_request(base, data) {
  let method = http.Post
  let path = "/user/gpg_keys"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn users_create_gpg_key_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.gpg_key_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_list_gpg_keys_for_authenticated_user_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/gpg_keys"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_list_gpg_keys_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.gpg_key_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_update_card_request(base, card_id, data) {
  let method = http.Patch
  let path = "/projects/columns/cards/" <> int.to_string(card_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn projects_update_card_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.project_card_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_delete_card_request(base, card_id) {
  let method = http.Delete
  let path = "/projects/columns/cards/" <> int.to_string(card_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn projects_delete_card_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_get_card_request(base, card_id) {
  let method = http.Get
  let path = "/projects/columns/cards/" <> int.to_string(card_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn projects_get_card_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.project_card_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn security_advisories_update_repository_advisory_request(
  base,
  owner,
  repo,
  ghsa_id,
  repository_advisory_update,
) {
  let method = http.Patch
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/security-advisories/" <> ghsa_id
  let query = []
  let body =
    utils.json_to_bits(schema.repository_advisory_update_to_json(
      repository_advisory_update,
    ))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn security_advisories_update_repository_advisory_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.repository_advisory_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn security_advisories_get_repository_advisory_request(
  base,
  owner,
  repo,
  ghsa_id,
) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/security-advisories/" <> ghsa_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn security_advisories_get_repository_advisory_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.repository_advisory_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_create_environment_variable_request(
  base,
  owner,
  repo,
  environment_name,
  data,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/variables"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_create_environment_variable_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.empty_object_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_environment_variables_request(
  base,
  owner,
  repo,
  environment_name,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/variables"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_environment_variables_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_list_received_events_for_user_request(
  base,
  username,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/received_events"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_list_received_events_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.event_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn classroom_list_accepted_assignments_for_an_assignment_request(
  base,
  assignment_id,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path =
    "/assignments/" <> int.to_string(assignment_id) <> "/accepted_assignments"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn classroom_list_accepted_assignments_for_an_assignment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.classroom_accepted_assignment_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_review_pat_grant_request_request(base, org, pat_request_id, data) {
  let method = http.Post
  let path =
    "/orgs/"
    <> org
    <> "/personal-access-token-requests/"
    <> int.to_string(pat_request_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn orgs_review_pat_grant_request_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_get_by_id_request(base, account_id) {
  let method = http.Get
  let path = "/user/" <> int.to_string(account_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_get_by_id_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.failure(Nil, "Unsupported schema"))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_list_attestations_request(
  base,
  username,
  subject_digest,
  per_page per_page,
  before before,
  after after,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/attestations/" <> subject_digest
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("before", before),
    #("after", after),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_list_attestations_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_repo_workflows_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/workflows"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_repo_workflows_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_deploy_key_request(base, owner, repo, key_id) {
  let method = http.Delete
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/keys/" <> int.to_string(key_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_deploy_key_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_deploy_key_request(base, owner, repo, key_id) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/keys/" <> int.to_string(key_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_deploy_key_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.deploy_key_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_update_commit_comment_request(base, owner, repo, comment_id, data) {
  let method = http.Patch
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/comments/"
    <> int.to_string(comment_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_update_commit_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.commit_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_commit_comment_request(base, owner, repo, comment_id) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/comments/"
    <> int.to_string(comment_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_commit_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_commit_comment_request(base, owner, repo, comment_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/comments/"
    <> int.to_string(comment_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_commit_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.commit_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_update_webhook_request(base, owner, repo, hook_id, data) {
  let method = http.Patch
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/hooks/" <> int.to_string(hook_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_update_webhook_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.hook_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_webhook_request(base, owner, repo, hook_id) {
  let method = http.Delete
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/hooks/" <> int.to_string(hook_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_webhook_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_webhook_request(base, owner, repo, hook_id) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/hooks/" <> int.to_string(hook_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_webhook_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.hook_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_download_job_logs_for_workflow_run_request(
  base,
  owner,
  repo,
  job_id,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/jobs/"
    <> int.to_string(job_id)
    <> "/logs"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_download_job_logs_for_workflow_run_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_actions_cache_usage_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/actions/cache/usage"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_actions_cache_usage_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        schema.actions_cache_usage_by_repository_decoder(),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_security_detach_configuration_request(base, org, data) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/code-security/configurations/detach"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn code_security_detach_configuration_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn copilot_usage_metrics_for_enterprise_team_request(
  base,
  enterprise,
  team_slug,
  since since,
  until until,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path =
    "/enterprises/" <> enterprise <> "/team/" <> team_slug <> "/copilot/usage"
  let query = [
    #("since", since),
    #("until", until),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn copilot_usage_metrics_for_enterprise_team_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.copilot_usage_metrics_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_remove_security_manager_team_request(base, org, team_slug) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/security-managers/teams/" <> team_slug
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_remove_security_manager_team_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_add_security_manager_team_request(base, org, team_slug) {
  let method = http.Put
  let path = "/orgs/" <> org <> "/security-managers/teams/" <> team_slug
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_add_security_manager_team_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_list_repos_starred_by_authenticated_user_request(
  base,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/starred"
  let query = [
    #("sort", sort),
    #("direction", direction),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_list_repos_starred_by_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.repository_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_list_devcontainers_in_repository_for_authenticated_user_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/codespaces/devcontainers"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_list_devcontainers_in_repository_for_authenticated_user_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn billing_get_github_actions_billing_user_request(base, username) {
  let method = http.Get
  let path = "/users/" <> username <> "/settings/billing/actions"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn billing_get_github_actions_billing_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.actions_billing_usage_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_update_invitation_request(base, owner, repo, invitation_id, data) {
  let method = http.Patch
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/invitations/"
    <> int.to_string(invitation_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_update_invitation_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.repository_invitation_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_invitation_request(base, owner, repo, invitation_id) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/invitations/"
    <> int.to_string(invitation_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_invitation_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_set_selected_repos_for_org_variable_request(
  base,
  org,
  name,
  data,
) {
  let method = http.Put
  let path = "/orgs/" <> org <> "/actions/variables/" <> name <> "/repositories"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_set_selected_repos_for_org_variable_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_selected_repos_for_org_variable_request(
  base,
  org,
  name,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/actions/variables/" <> name <> "/repositories"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_selected_repos_for_org_variable_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_workflow_run_usage_request(base, owner, repo, run_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
    <> "/timing"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_workflow_run_usage_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.workflow_run_usage_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_unblock_user_request(base, org, username) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/blocks/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_unblock_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_block_user_request(base, org, username) {
  let method = http.Put
  let path = "/orgs/" <> org <> "/blocks/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_block_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_check_blocked_user_request(base, org, username) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/blocks/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_check_blocked_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_create_from_manifest_request(base, code) {
  let method = http.Post
  let path = "/app-manifests/" <> code <> "/conversions"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_create_from_manifest_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, zero.failure(Nil, "Unsupported schema"))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_list_request(
  base,
  filter filter,
  state state,
  labels labels,
  sort sort,
  direction direction,
  since since,
  collab collab,
  orgs orgs,
  owned owned,
  pulls pulls,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/issues"
  let query = [
    #("filter", filter),
    #("state", state),
    #("labels", labels),
    #("sort", sort),
    #("direction", direction),
    #("since", since),
    #("collab", option.map(collab, bool.to_string)),
    #("orgs", option.map(orgs, bool.to_string)),
    #("owned", option.map(owned, bool.to_string)),
    #("pulls", option.map(pulls, bool.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_list_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.issue_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_update_alert_request(base, owner, repo, alert_number, data) {
  let method = http.Patch
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/dependabot/alerts/"
    <> int.to_string(alert_number)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn dependabot_update_alert_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.dependabot_alert_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_get_alert_request(base, owner, repo, alert_number) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/dependabot/alerts/"
    <> int.to_string(alert_number)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn dependabot_get_alert_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.dependabot_alert_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_scope_token_request(base, client_id, data) {
  let method = http.Post
  let path = "/applications/" <> client_id <> "/token/scoped"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn apps_scope_token_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.authorization_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_update_review_comment_request(base, owner, repo, comment_id, data) {
  let method = http.Patch
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/comments/"
    <> int.to_string(comment_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn pulls_update_review_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.pull_request_review_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_delete_review_comment_request(base, owner, repo, comment_id) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/comments/"
    <> int.to_string(comment_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn pulls_delete_review_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_get_review_comment_request(base, owner, repo, comment_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/comments/"
    <> int.to_string(comment_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn pulls_get_review_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.pull_request_review_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn licenses_get_request(base, license) {
  let method = http.Get
  let path = "/licenses/" <> license
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn licenses_get_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.license_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_list_subscriptions_for_authenticated_user_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/marketplace_purchases"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_list_subscriptions_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.user_marketplace_purchase_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_create_public_ssh_key_for_authenticated_user_request(base, data) {
  let method = http.Post
  let path = "/user/keys"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn users_create_public_ssh_key_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.key_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_list_public_ssh_keys_for_authenticated_user_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/keys"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_list_public_ssh_keys_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.key_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_actions_cache_usage_by_repo_for_org_request(
  base,
  org,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/actions/cache/usage-by-repository"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_actions_cache_usage_by_repo_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_punch_card_stats_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/stats/punch_card"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_punch_card_stats_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn licenses_get_for_repo_request(base, owner, repo, ref ref) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/license"
  let query = [#("ref", ref)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn licenses_get_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.license_content_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_generate_runner_jitconfig_for_org_request(base, org, data) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/actions/runners/generate-jitconfig"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_generate_runner_jitconfig_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_delete_org_secret_request(base, org, secret_name) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/codespaces/secrets/" <> secret_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_delete_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_create_or_update_org_secret_request(
  base,
  org,
  secret_name,
  data,
) {
  let method = http.Put
  let path = "/orgs/" <> org <> "/codespaces/secrets/" <> secret_name
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn codespaces_create_or_update_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_get_org_secret_request(base, org, secret_name) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/codespaces/secrets/" <> secret_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_get_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.codespaces_org_secret_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_list_commits_request(
  base,
  owner,
  repo,
  pull_number,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/commits"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn pulls_list_commits_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.commit_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn billing_get_github_actions_billing_org_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/settings/billing/actions"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn billing_get_github_actions_billing_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.actions_billing_usage_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_security_get_default_configurations_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/code-security/configurations/defaults"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_security_get_default_configurations_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        schema.code_security_default_configurations_decoder(),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_delete_package_for_user_request(
  base,
  username,
  package_type,
  package_name,
) {
  let method = http.Delete
  let path =
    "/users/" <> username <> "/packages/" <> package_type <> "/" <> package_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_delete_package_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_get_package_for_user_request(
  base,
  username,
  package_type,
  package_name,
) {
  let method = http.Get
  let path =
    "/users/" <> username <> "/packages/" <> package_type <> "/" <> package_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_get_package_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.package_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_repo_machines_for_authenticated_user_request(
  base,
  owner,
  repo,
  location location,
  client_ip client_ip,
  ref ref,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/codespaces/machines"
  let query = [
    #("location", location),
    #("client_ip", client_ip),
    #("ref", ref),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_repo_machines_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_list_repos_watched_by_user_request(
  base,
  username,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/subscriptions"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_list_repos_watched_by_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.minimal_repository_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_delete_repo_secret_request(base, owner, repo, secret_name) {
  let method = http.Delete
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/actions/secrets/" <> secret_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_delete_repo_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_create_or_update_repo_secret_request(
  base,
  owner,
  repo,
  secret_name,
  data,
) {
  let method = http.Put
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/actions/secrets/" <> secret_name
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_create_or_update_repo_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_repo_secret_request(base, owner, repo, secret_name) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/actions/secrets/" <> secret_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_repo_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.actions_secret_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn interactions_remove_restrictions_for_authenticated_user_request(base) {
  let method = http.Delete
  let path = "/user/interaction-limits"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn interactions_remove_restrictions_for_authenticated_user_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn interactions_set_restrictions_for_authenticated_user_request(
  base,
  interaction_limit,
) {
  let method = http.Put
  let path = "/user/interaction-limits"
  let query = []
  let body =
    utils.json_to_bits(schema.interaction_limit_to_json(interaction_limit))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn interactions_set_restrictions_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.interaction_limit_response_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn interactions_get_restrictions_for_authenticated_user_request(base) {
  let method = http.Get
  let path = "/user/interaction-limits"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn interactions_get_restrictions_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_create_review_request(base, owner, repo, pull_number, data) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/reviews"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn pulls_create_review_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.pull_request_review_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_list_reviews_request(
  base,
  owner,
  repo,
  pull_number,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/reviews"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn pulls_list_reviews_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.pull_request_review_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_request_pages_build_request(base, owner, repo) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/pages/builds"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_request_pages_build_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.page_build_status_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_pages_builds_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/pages/builds"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_pages_builds_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.page_build_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_restore_package_for_user_request(
  base,
  username,
  package_type,
  package_name,
  token_ token_,
) {
  let method = http.Post
  let path =
    "/users/"
    <> username
    <> "/packages/"
    <> package_type
    <> "/"
    <> package_name
    <> "/restore"
  let query = [#("token_", token_)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_restore_package_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_list_followers_for_user_request(
  base,
  username,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/followers"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_list_followers_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_scanning_upload_sarif_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/code-scanning/sarifs"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn code_scanning_upload_sarif_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 ->
      utils.decode_bits(body, schema.code_scanning_sarifs_receipt_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_set_github_actions_default_workflow_permissions_organization_request(
  base,
  org,
  actions_set_default_workflow_permissions,
) {
  let method = http.Put
  let path = "/orgs/" <> org <> "/actions/permissions/workflow"
  let query = []
  let body =
    utils.json_to_bits(schema.actions_set_default_workflow_permissions_to_json(
      actions_set_default_workflow_permissions,
    ))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_set_github_actions_default_workflow_permissions_organization_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_github_actions_default_workflow_permissions_organization_request(
  base,
  org,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/actions/permissions/workflow"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_github_actions_default_workflow_permissions_organization_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        schema.actions_get_default_workflow_permissions_decoder(),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_list_public_events_request(base, per_page per_page, page page) {
  let method = http.Get
  let path = "/events"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_list_public_events_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.event_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_get_permission_for_user_request(base, project_id, username) {
  let method = http.Get
  let path =
    "/projects/"
    <> int.to_string(project_id)
    <> "/collaborators/"
    <> username
    <> "/permission"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn projects_get_permission_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.project_collaborator_permission_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_ping_webhook_request(base, org, hook_id) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/hooks/" <> int.to_string(hook_id) <> "/pings"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_ping_webhook_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_pull_requests_associated_with_commit_request(
  base,
  owner,
  repo,
  commit_sha,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/commits/" <> commit_sha <> "/pulls"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_pull_requests_associated_with_commit_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.pull_request_simple_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_create_reply_for_review_comment_request(
  base,
  owner,
  repo,
  pull_number,
  comment_id,
  data,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/comments/"
    <> int.to_string(comment_id)
    <> "/replies"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn pulls_create_reply_for_review_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.pull_request_review_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_merge_upstream_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/merge-upstream"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_merge_upstream_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.merged_upstream_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_branches_request(
  base,
  owner,
  repo,
  protected protected,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/branches"
  let query = [
    #("protected", option.map(protected, bool.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_branches_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.short_branch_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_list_alerts_for_org_request(
  base,
  org,
  state state,
  severity severity,
  ecosystem ecosystem,
  package package,
  scope scope,
  sort sort,
  direction direction,
  before before,
  after after,
  first first,
  last last,
  per_page per_page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/dependabot/alerts"
  let query = [
    #("state", state),
    #("severity", severity),
    #("ecosystem", ecosystem),
    #("package", package),
    #("scope", scope),
    #("sort", sort),
    #("direction", direction),
    #("before", before),
    #("after", after),
    #("first", option.map(first, int.to_string)),
    #("last", option.map(last, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn dependabot_list_alerts_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.dependabot_alert_with_repository_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_delete_package_for_org_request(
  base,
  org,
  package_type,
  package_name,
) {
  let method = http.Delete
  let path =
    "/orgs/" <> org <> "/packages/" <> package_type <> "/" <> package_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_delete_package_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_get_package_for_organization_request(
  base,
  org,
  package_type,
  package_name,
) {
  let method = http.Get
  let path =
    "/orgs/" <> org <> "/packages/" <> package_type <> "/" <> package_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_get_package_for_organization_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.package_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_remove_label_request(base, owner, repo, issue_number, name) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
    <> "/labels/"
    <> name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_remove_label_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.label_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_repo_organization_variables_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/actions/organization-variables"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_repo_organization_variables_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_update_request(base, project_id, data) {
  let method = http.Patch
  let path = "/projects/" <> int.to_string(project_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn projects_update_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.project_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_delete_request(base, project_id) {
  let method = http.Delete
  let path = "/projects/" <> int.to_string(project_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn projects_delete_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_get_request(base, project_id) {
  let method = http.Get
  let path = "/projects/" <> int.to_string(project_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn projects_get_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.project_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_get_public_key_for_authenticated_user_request(base) {
  let method = http.Get
  let path = "/user/codespaces/secrets/public-key"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_get_public_key_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.codespaces_user_public_key_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_restore_package_for_org_request(
  base,
  org,
  package_type,
  package_name,
  token_ token_,
) {
  let method = http.Post
  let path =
    "/orgs/"
    <> org
    <> "/packages/"
    <> package_type
    <> "/"
    <> package_name
    <> "/restore"
  let query = [#("token_", token_)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_restore_package_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_update_webhook_config_for_repo_request(
  base,
  owner,
  repo,
  hook_id,
  data,
) {
  let method = http.Patch
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/hooks/"
    <> int.to_string(hook_id)
    <> "/config"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_update_webhook_config_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.webhook_config_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_webhook_config_for_repo_request(base, owner, repo, hook_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/hooks/"
    <> int.to_string(hook_id)
    <> "/config"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_webhook_config_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.webhook_config_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_branch_request(base, owner, repo, branch) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/branches/" <> branch
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_branch_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.branch_with_protection_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn git_get_blob_request(base, owner, repo, file_sha) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/git/blobs/" <> file_sha
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn git_get_blob_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.blob_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_list_for_user_request(
  base,
  username,
  state state,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/projects"
  let query = [
    #("state", state),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn projects_list_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.project_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn billing_get_shared_storage_billing_org_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/settings/billing/shared-storage"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn billing_get_shared_storage_billing_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.combined_billing_usage_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_list_docker_migration_conflicting_packages_for_authenticated_user_request(
  base,
) {
  let method = http.Get
  let path = "/user/docker/conflicts"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_list_docker_migration_conflicting_packages_for_authenticated_user_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.package_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn git_create_commit_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/git/commits"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn git_create_commit_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.git_commit_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_review_pending_deployments_for_run_request(
  base,
  owner,
  repo,
  run_id,
  data,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
    <> "/pending_deployments"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_review_pending_deployments_for_run_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.deployment_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_pending_deployments_for_run_request(
  base,
  owner,
  repo,
  run_id,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
    <> "/pending_deployments"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_pending_deployments_for_run_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.pending_deployment_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_activities_request(
  base,
  owner,
  repo,
  direction direction,
  per_page per_page,
  before before,
  after after,
  ref ref,
  actor actor,
  time_period time_period,
  activity_type activity_type,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/activity"
  let query = [
    #("direction", direction),
    #("per_page", option.map(per_page, int.to_string)),
    #("before", before),
    #("after", after),
    #("ref", ref),
    #("actor", actor),
    #("time_period", time_period),
    #("activity_type", activity_type),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_activities_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.activity_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_get_user_installation_request(base, username) {
  let method = http.Get
  let path = "/users/" <> username <> "/installation"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_get_user_installation_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.installation_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn copilot_cancel_copilot_seat_assignment_for_users_request(base, org, data) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/copilot/billing/selected_users"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn copilot_cancel_copilot_seat_assignment_for_users_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn copilot_add_copilot_seats_for_users_request(base, org, data) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/copilot/billing/selected_users"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn copilot_add_copilot_seats_for_users_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_set_lfs_preference_request(base, owner, repo, data) {
  let method = http.Patch
  let path = "/repos/" <> owner <> "/" <> repo <> "/import/lfs"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn migrations_set_lfs_preference_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.import__decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_security_manager_teams_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/security-managers"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_security_manager_teams_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.team_simple_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_outside_collaborators_request(
  base,
  org,
  filter filter,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/outside_collaborators"
  let query = [
    #("filter", filter),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_outside_collaborators_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_remove_selected_repo_from_org_secret_request(
  base,
  org,
  secret_name,
  repository_id,
) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/codespaces/secrets/"
    <> secret_name
    <> "/repositories/"
    <> int.to_string(repository_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_remove_selected_repo_from_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_add_selected_repo_to_org_secret_request(
  base,
  org,
  secret_name,
  repository_id,
) {
  let method = http.Put
  let path =
    "/orgs/"
    <> org
    <> "/codespaces/secrets/"
    <> secret_name
    <> "/repositories/"
    <> int.to_string(repository_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_add_selected_repo_to_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gitignore_get_template_request(base, name) {
  let method = http.Get
  let path = "/gitignore/templates/" <> name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn gitignore_get_template_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.gitignore_template_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_review_custom_gates_for_run_request(base, owner, repo, run_id) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
    <> "/deployment_protection_rule"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_review_custom_gates_for_run_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_get_by_slug_request(base, app_slug) {
  let method = http.Get
  let path = "/apps/" <> app_slug
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_get_by_slug_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.integration_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_scanning_list_codeql_databases_request(base, owner, repo) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/code-scanning/codeql/databases"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_scanning_list_codeql_databases_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.code_scanning_codeql_database_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_combined_status_for_ref_request(
  base,
  owner,
  repo,
  ref,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/commits/" <> ref <> "/status"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_combined_status_for_ref_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.combined_commit_status_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_remove_membership_for_user_in_org_request(
  base,
  org,
  team_slug,
  username,
) {
  let method = http.Delete
  let path =
    "/orgs/" <> org <> "/teams/" <> team_slug <> "/memberships/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_remove_membership_for_user_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_add_or_update_membership_for_user_in_org_request(
  base,
  org,
  team_slug,
  username,
  data,
) {
  let method = http.Put
  let path =
    "/orgs/" <> org <> "/teams/" <> team_slug <> "/memberships/" <> username
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn teams_add_or_update_membership_for_user_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.team_membership_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_get_membership_for_user_in_org_request(
  base,
  org,
  team_slug,
  username,
) {
  let method = http.Get
  let path =
    "/orgs/" <> org <> "/teams/" <> team_slug <> "/memberships/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_get_membership_for_user_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.team_membership_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_scanning_list_alert_instances_request(
  base,
  owner,
  repo,
  alert_number,
  page page,
  per_page per_page,
  ref ref,
  pr pr,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/code-scanning/alerts/"
    <> int.to_string(alert_number)
    <> "/instances"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
    #("ref", ref),
    #("pr", option.map(pr, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_scanning_list_alert_instances_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.code_scanning_alert_instance_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_delete_archive_for_org_request(base, org, migration_id) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/migrations/"
    <> int.to_string(migration_id)
    <> "/archive"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn migrations_delete_archive_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_download_archive_for_org_request(base, org, migration_id) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/migrations/"
    <> int.to_string(migration_id)
    <> "/archive"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn migrations_download_archive_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_redeliver_webhook_delivery_request(base, org, hook_id, delivery_id) {
  let method = http.Post
  let path =
    "/orgs/"
    <> org
    <> "/hooks/"
    <> int.to_string(hook_id)
    <> "/deliveries/"
    <> int.to_string(delivery_id)
    <> "/attempts"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_redeliver_webhook_delivery_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_create_review_comment_request(base, owner, repo, pull_number, data) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/comments"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn pulls_create_review_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.pull_request_review_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_list_review_comments_request(
  base,
  owner,
  repo,
  pull_number,
  sort sort,
  direction direction,
  since since,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/comments"
  let query = [
    #("sort", sort),
    #("direction", direction),
    #("since", since),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn pulls_list_review_comments_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.pull_request_review_comment_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_create_remove_token_for_repo_request(base, owner, repo) {
  let method = http.Post
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/actions/runners/remove-token"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_create_remove_token_for_repo_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.authentication_token_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_list_for_org_request(
  base,
  org,
  filter filter,
  state state,
  labels labels,
  sort sort,
  direction direction,
  since since,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/issues"
  let query = [
    #("filter", filter),
    #("state", state),
    #("labels", labels),
    #("sort", sort),
    #("direction", direction),
    #("since", since),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_list_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.issue_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_get_feeds_request(base) {
  let method = http.Get
  let path = "/feeds"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_get_feeds_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.feed_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_list_in_organization_request(
  base,
  org,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/codespaces"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_list_in_organization_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn checks_update_request(base, owner, repo, check_run_id, data) {
  let method = http.Patch
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/check-runs/"
    <> int.to_string(check_run_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn checks_update_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.check_run_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn checks_get_request(base, owner, repo, check_run_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/check-runs/"
    <> int.to_string(check_run_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn checks_get_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.check_run_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_set_self_hosted_runners_in_group_for_org_request(
  base,
  org,
  runner_group_id,
  data,
) {
  let method = http.Put
  let path =
    "/orgs/"
    <> org
    <> "/actions/runner-groups/"
    <> int.to_string(runner_group_id)
    <> "/runners"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_set_self_hosted_runners_in_group_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_self_hosted_runners_in_group_for_org_request(
  base,
  org,
  runner_group_id,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/actions/runner-groups/"
    <> int.to_string(runner_group_id)
    <> "/runners"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_self_hosted_runners_in_group_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_rename_branch_request(base, owner, repo, branch, data) {
  let method = http.Post
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/branches/" <> branch <> "/rename"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_rename_branch_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.branch_with_protection_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_readme_request(base, owner, repo, ref ref) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/readme"
  let query = [#("ref", ref)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_readme_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.content_file_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_list_events_for_authenticated_user_request(
  base,
  username,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/events"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_list_events_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.event_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_create_for_org_request(base, org, data) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/projects"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn projects_create_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.project_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_list_for_org_request(
  base,
  org,
  state state,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/projects"
  let query = [
    #("state", state),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn projects_list_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.project_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_deployment_branch_policy_request(
  base,
  owner,
  repo,
  environment_name,
  branch_policy_id,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/deployment-branch-policies/"
    <> int.to_string(branch_policy_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_deployment_branch_policy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_update_deployment_branch_policy_request(
  base,
  owner,
  repo,
  environment_name,
  branch_policy_id,
  deployment_branch_policy_name_pattern,
) {
  let method = http.Put
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/deployment-branch-policies/"
    <> int.to_string(branch_policy_id)
  let query = []
  let body =
    utils.json_to_bits(schema.deployment_branch_policy_name_pattern_to_json(
      deployment_branch_policy_name_pattern,
    ))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_update_deployment_branch_policy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.deployment_branch_policy_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_deployment_branch_policy_request(
  base,
  owner,
  repo,
  environment_name,
  branch_policy_id,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/deployment-branch-policies/"
    <> int.to_string(branch_policy_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_deployment_branch_policy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.deployment_branch_policy_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_repo_rule_suite_request(base, owner, repo, rule_suite_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/rulesets/rule-suites/"
    <> int.to_string(rule_suite_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_repo_rule_suite_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.rule_suite_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn git_get_commit_request(base, owner, repo, commit_sha) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/git/commits/" <> commit_sha
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn git_get_commit_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.git_commit_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_get_org_installation_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/installation"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_get_org_installation_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.installation_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_update_in_org_request(base, org, team_slug, data) {
  let method = http.Patch
  let path = "/orgs/" <> org <> "/teams/" <> team_slug
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn teams_update_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.team_full_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_delete_in_org_request(base, org, team_slug) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/teams/" <> team_slug
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_delete_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_get_by_name_request(base, org, team_slug) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/teams/" <> team_slug
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_get_by_name_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.team_full_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_deployment_status_request(
  base,
  owner,
  repo,
  deployment_id,
  status_id,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/deployments/"
    <> int.to_string(deployment_id)
    <> "/statuses/"
    <> int.to_string(status_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_deployment_status_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.deployment_status_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_remove_collaborator_request(base, owner, repo, username) {
  let method = http.Delete
  let path = "/repos/" <> owner <> "/" <> repo <> "/collaborators/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_remove_collaborator_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_add_collaborator_request(base, owner, repo, username, data) {
  let method = http.Put
  let path = "/repos/" <> owner <> "/" <> repo <> "/collaborators/" <> username
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_add_collaborator_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_check_collaborator_request(base, owner, repo, username) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/collaborators/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_check_collaborator_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_delete_codespaces_access_users_request(base, org, data) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/codespaces/access/selected_users"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn codespaces_delete_codespaces_access_users_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_set_codespaces_access_users_request(base, org, data) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/codespaces/access/selected_users"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn codespaces_set_codespaces_access_users_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn billing_get_shared_storage_billing_user_request(base, username) {
  let method = http.Get
  let path = "/users/" <> username <> "/settings/billing/shared-storage"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn billing_get_shared_storage_billing_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.combined_billing_usage_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_or_update_custom_properties_values_request(
  base,
  owner,
  repo,
  data,
) {
  let method = http.Patch
  let path = "/repos/" <> owner <> "/" <> repo <> "/properties/values"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_or_update_custom_properties_values_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_custom_properties_values_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/properties/values"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_custom_properties_values_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.custom_property_value_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_set_github_actions_permissions_organization_request(
  base,
  org,
  data,
) {
  let method = http.Put
  let path = "/orgs/" <> org <> "/actions/permissions"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_set_github_actions_permissions_organization_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_github_actions_permissions_organization_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/actions/permissions"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_github_actions_permissions_organization_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.actions_organization_permissions_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn git_get_tree_request(base, owner, repo, tree_sha, recursive recursive) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/git/trees/" <> tree_sha
  let query = [#("recursive", recursive)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn git_get_tree_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.git_tree_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_create_for_team_discussion_in_org_request(
  base,
  org,
  team_slug,
  discussion_number,
  data,
) {
  let method = http.Post
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/reactions"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn reactions_create_for_team_discussion_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.reaction_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_list_for_team_discussion_in_org_request(
  base,
  org,
  team_slug,
  discussion_number,
  content content,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/reactions"
  let query = [
    #("content", content),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn reactions_list_for_team_discussion_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.reaction_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn security_advisories_list_global_advisories_request(
  base,
  ghsa_id ghsa_id,
  type_ type_,
  cve_id cve_id,
  ecosystem ecosystem,
  severity severity,
  cwes cwes,
  is_withdrawn is_withdrawn,
  affects affects,
  published published,
  updated updated,
  modified modified,
  epss_percentage epss_percentage,
  epss_percentile epss_percentile,
  before before,
  after after,
  direction direction,
  per_page per_page,
  sort sort,
) {
  let method = http.Get
  let path = "/advisories"
  let query = [
    #("ghsa_id", ghsa_id),
    #("type_", type_),
    #("cve_id", cve_id),
    #("ecosystem", ecosystem),
    #("severity", severity),
    #("cwes", panic as "cwes"),
    #("is_withdrawn", option.map(is_withdrawn, bool.to_string)),
    #("affects", panic as "affects"),
    #("published", published),
    #("updated", updated),
    #("modified", modified),
    #("epss_percentage", epss_percentage),
    #("epss_percentile", epss_percentile),
    #("before", before),
    #("after", after),
    #("direction", direction),
    #("per_page", option.map(per_page, int.to_string)),
    #("sort", sort),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn security_advisories_list_global_advisories_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.global_advisory_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_list_repo_secrets_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/codespaces/secrets"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_list_repo_secrets_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_update_comment_request(base, gist_id, comment_id, data) {
  let method = http.Patch
  let path = "/gists/" <> gist_id <> "/comments/" <> int.to_string(comment_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn gists_update_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.gist_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_delete_comment_request(base, gist_id, comment_id) {
  let method = http.Delete
  let path = "/gists/" <> gist_id <> "/comments/" <> int.to_string(comment_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn gists_delete_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_get_comment_request(base, gist_id, comment_id) {
  let method = http.Get
  let path = "/gists/" <> gist_id <> "/comments/" <> int.to_string(comment_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn gists_get_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.gist_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependency_graph_diff_range_request(
  base,
  owner,
  repo,
  basehead,
  name name,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/dependency-graph/compare/"
    <> basehead
  let query = [#("name", name)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn dependency_graph_diff_range_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.dependency_graph_diff_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_update_status_check_protection_request(
  base,
  owner,
  repo,
  branch,
  data,
) {
  let method = http.Patch
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/required_status_checks"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_update_status_check_protection_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.status_check_policy_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_remove_status_check_protection_request(base, owner, repo, branch) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/required_status_checks"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_remove_status_check_protection_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_status_checks_protection_request(base, owner, repo, branch) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/required_status_checks"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_status_checks_protection_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.status_check_policy_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_delete_environment_secret_request(
  base,
  owner,
  repo,
  environment_name,
  secret_name,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/secrets/"
    <> secret_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_delete_environment_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_create_or_update_environment_secret_request(
  base,
  owner,
  repo,
  environment_name,
  secret_name,
  data,
) {
  let method = http.Put
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/secrets/"
    <> secret_name
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_create_or_update_environment_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_environment_secret_request(
  base,
  owner,
  repo,
  environment_name,
  secret_name,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/secrets/"
    <> secret_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_environment_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.actions_secret_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_download_artifact_request(
  base,
  owner,
  repo,
  artifact_id,
  archive_format,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/artifacts/"
    <> int.to_string(artifact_id)
    <> "/"
    <> archive_format
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_download_artifact_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_update_comment_request(base, owner, repo, comment_id, data) {
  let method = http.Patch
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/comments/"
    <> int.to_string(comment_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn issues_update_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.issue_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_delete_comment_request(base, owner, repo, comment_id) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/comments/"
    <> int.to_string(comment_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_delete_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_get_comment_request(base, owner, repo, comment_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/comments/"
    <> int.to_string(comment_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_get_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.issue_comment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_set_repo_access_to_self_hosted_runner_group_in_org_request(
  base,
  org,
  runner_group_id,
  data,
) {
  let method = http.Put
  let path =
    "/orgs/"
    <> org
    <> "/actions/runner-groups/"
    <> int.to_string(runner_group_id)
    <> "/repositories"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_set_repo_access_to_self_hosted_runner_group_in_org_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_repo_access_to_self_hosted_runner_group_in_org_request(
  base,
  org,
  runner_group_id,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/actions/runner-groups/"
    <> int.to_string(runner_group_id)
    <> "/repositories"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_repo_access_to_self_hosted_runner_group_in_org_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_merge_request(base, owner, repo, pull_number, data) {
  let method = http.Put
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/merge"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn pulls_merge_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.pull_request_merge_result_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_check_if_merged_request(base, owner, repo, pull_number) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/merge"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn pulls_check_if_merged_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_remove_self_hosted_runner_from_group_for_org_request(
  base,
  org,
  runner_group_id,
  runner_id,
) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/actions/runner-groups/"
    <> int.to_string(runner_group_id)
    <> "/runners/"
    <> int.to_string(runner_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_remove_self_hosted_runner_from_group_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_add_self_hosted_runner_to_group_for_org_request(
  base,
  org,
  runner_group_id,
  runner_id,
) {
  let method = http.Put
  let path =
    "/orgs/"
    <> org
    <> "/actions/runner-groups/"
    <> int.to_string(runner_group_id)
    <> "/runners/"
    <> int.to_string(runner_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_add_self_hosted_runner_to_group_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn search_code_request(
  base,
  q q,
  sort sort,
  order order,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/search/code"
  let query = [
    #("q", option.Some(q)),
    #("sort", sort),
    #("order", order),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_code_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_list_public_org_events_request(
  base,
  org,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/events"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_list_public_org_events_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.event_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn checks_create_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/check-runs"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn checks_create_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.check_run_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_set_repositories_for_secret_for_authenticated_user_request(
  base,
  secret_name,
  data,
) {
  let method = http.Put
  let path = "/user/codespaces/secrets/" <> secret_name <> "/repositories"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn codespaces_set_repositories_for_secret_for_authenticated_user_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_list_repositories_for_secret_for_authenticated_user_request(
  base,
  secret_name,
) {
  let method = http.Get
  let path = "/user/codespaces/secrets/" <> secret_name <> "/repositories"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_list_repositories_for_secret_for_authenticated_user_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_delete_from_organization_request(
  base,
  org,
  username,
  codespace_name,
) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/members/"
    <> username
    <> "/codespaces/"
    <> codespace_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_delete_from_organization_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_remove_assignees_request(base, owner, repo, issue_number, data) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
    <> "/assignees"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn issues_remove_assignees_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.issue_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_add_assignees_request(base, owner, repo, issue_number, data) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
    <> "/assignees"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn issues_add_assignees_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.issue_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_create_for_commit_comment_request(
  base,
  owner,
  repo,
  comment_id,
  data,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/comments/"
    <> int.to_string(comment_id)
    <> "/reactions"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn reactions_create_for_commit_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.reaction_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_list_for_commit_comment_request(
  base,
  owner,
  repo,
  comment_id,
  content content,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/comments/"
    <> int.to_string(comment_id)
    <> "/reactions"
  let query = [
    #("content", content),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn reactions_list_for_commit_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.reaction_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_org_secrets_request(base, org, per_page per_page, page page) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/actions/secrets"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_org_secrets_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn projects_list_collaborators_request(
  base,
  project_id,
  affiliation affiliation,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/projects/" <> int.to_string(project_id) <> "/collaborators"
  let query = [
    #("affiliation", affiliation),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn projects_list_collaborators_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_deployment_status_request(
  base,
  owner,
  repo,
  deployment_id,
  data,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/deployments/"
    <> int.to_string(deployment_id)
    <> "/statuses"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_deployment_status_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.deployment_status_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_deployment_statuses_request(
  base,
  owner,
  repo,
  deployment_id,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/deployments/"
    <> int.to_string(deployment_id)
    <> "/statuses"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_deployment_statuses_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.deployment_status_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_self_hosted_runners_for_org_request(
  base,
  org,
  name name,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/actions/runners"
  let query = [
    #("name", name),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_self_hosted_runners_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_repo_ruleset_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/rulesets"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_repo_ruleset_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.repository_ruleset_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_repo_rulesets_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
  includes_parents includes_parents,
  targets targets,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/rulesets"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
    #("includes_parents", option.map(includes_parents, bool.to_string)),
    #("targets", targets),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_repo_rulesets_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.repository_ruleset_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_list_repos_legacy_request(
  base,
  team_id,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/teams/" <> int.to_string(team_id) <> "/repos"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_list_repos_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.minimal_repository_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_delete_installation_request(base, installation_id) {
  let method = http.Delete
  let path = "/app/installations/" <> int.to_string(installation_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_delete_installation_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_get_installation_request(base, installation_id) {
  let method = http.Get
  let path = "/app/installations/" <> int.to_string(installation_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_get_installation_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.installation_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_org_public_key_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/actions/secrets/public-key"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_org_public_key_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.actions_public_key_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_commits_request(
  base,
  owner,
  repo,
  sha sha,
  path_ path_,
  author author,
  committer committer,
  since since,
  until until,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/commits"
  let query = [
    #("sha", sha),
    #("path_", path_),
    #("author", author),
    #("committer", committer),
    #("since", since),
    #("until", until),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_commits_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.commit_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_create_for_pull_request_review_comment_request(
  base,
  owner,
  repo,
  comment_id,
  data,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/comments/"
    <> int.to_string(comment_id)
    <> "/reactions"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn reactions_create_for_pull_request_review_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.reaction_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_list_for_pull_request_review_comment_request(
  base,
  owner,
  repo,
  comment_id,
  content content,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/comments/"
    <> int.to_string(comment_id)
    <> "/reactions"
  let query = [
    #("content", content),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn reactions_list_for_pull_request_review_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.reaction_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_views_request(base, owner, repo, per per) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/traffic/views"
  let query = [#("per", per)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_views_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.view_traffic_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_remove_repo_legacy_request(base, team_id, owner, repo) {
  let method = http.Delete
  let path =
    "/teams/" <> int.to_string(team_id) <> "/repos/" <> owner <> "/" <> repo
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_remove_repo_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_add_or_update_repo_permissions_legacy_request(
  base,
  team_id,
  owner,
  repo,
  data,
) {
  let method = http.Put
  let path =
    "/teams/" <> int.to_string(team_id) <> "/repos/" <> owner <> "/" <> repo
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn teams_add_or_update_repo_permissions_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_check_permissions_for_repo_legacy_request(
  base,
  team_id,
  owner,
  repo,
) {
  let method = http.Get
  let path =
    "/teams/" <> int.to_string(team_id) <> "/repos/" <> owner <> "/" <> repo
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_check_permissions_for_repo_legacy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codes_of_conduct_get_all_codes_of_conduct_request(base) {
  let method = http.Get
  let path = "/codes_of_conduct"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codes_of_conduct_get_all_codes_of_conduct_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.code_of_conduct_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_start_for_authenticated_user_request(base, codespace_name) {
  let method = http.Post
  let path = "/user/codespaces/" <> codespace_name <> "/start"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_start_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.codespace_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn search_commits_request(
  base,
  q q,
  sort sort,
  order order,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/search/commits"
  let query = [
    #("q", option.Some(q)),
    #("sort", sort),
    #("order", order),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_commits_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_for_authenticated_user_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/orgs"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.organization_simple_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_org_ruleset_request(base, org, ruleset_id) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/rulesets/" <> int.to_string(ruleset_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_org_ruleset_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_update_org_ruleset_request(base, org, ruleset_id, data) {
  let method = http.Put
  let path = "/orgs/" <> org <> "/rulesets/" <> int.to_string(ruleset_id)
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_update_org_ruleset_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.repository_ruleset_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_org_ruleset_request(base, org, ruleset_id) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/rulesets/" <> int.to_string(ruleset_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_org_ruleset_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.repository_ruleset_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_get_export_details_for_authenticated_user_request(
  base,
  codespace_name,
  export_id,
) {
  let method = http.Get
  let path = "/user/codespaces/" <> codespace_name <> "/exports/" <> export_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_get_export_details_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.codespace_export_details_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_get_repo_public_key_request(base, owner, repo) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/codespaces/secrets/public-key"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_get_repo_public_key_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.codespaces_public_key_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependency_graph_create_repository_snapshot_request(
  base,
  owner,
  repo,
  snapshot,
) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/dependency-graph/snapshots"
  let query = []
  let body = utils.json_to_bits(schema.snapshot_to_json(snapshot))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn dependency_graph_create_repository_snapshot_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_failed_invitations_request(
  base,
  org,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/failed_invitations"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_failed_invitations_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.organization_invitation_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_get_webhook_delivery_request(base, delivery_id) {
  let method = http.Get
  let path = "/app/hook/deliveries/" <> int.to_string(delivery_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_get_webhook_delivery_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.hook_delivery_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn secret_scanning_list_locations_for_alert_request(
  base,
  owner,
  repo,
  alert_number,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/secret-scanning/alerts/"
    <> int.to_string(alert_number)
    <> "/locations"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn secret_scanning_list_locations_for_alert_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.secret_scanning_location_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn secret_scanning_list_alerts_for_org_request(
  base,
  org,
  state state,
  secret_type secret_type,
  resolution resolution,
  sort sort,
  direction direction,
  page page,
  per_page per_page,
  before before,
  after after,
  validity validity,
  is_publicly_leaked is_publicly_leaked,
  is_multi_repo is_multi_repo,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/secret-scanning/alerts"
  let query = [
    #("state", state),
    #("secret_type", secret_type),
    #("resolution", resolution),
    #("sort", sort),
    #("direction", direction),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
    #("before", before),
    #("after", after),
    #("validity", validity),
    #("is_publicly_leaked", option.map(is_publicly_leaked, bool.to_string)),
    #("is_multi_repo", option.map(is_multi_repo, bool.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn secret_scanning_list_alerts_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.organization_secret_scanning_alert_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_list_following_for_user_request(
  base,
  username,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/following"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_list_following_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_tag_protection_request(base, owner, repo, tag_protection_id) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/tags/protection/"
    <> int.to_string(tag_protection_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_tag_protection_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_delete_self_hosted_runner_from_org_request(base, org, runner_id) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/actions/runners/" <> int.to_string(runner_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_delete_self_hosted_runner_from_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_self_hosted_runner_for_org_request(base, org, runner_id) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/actions/runners/" <> int.to_string(runner_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_self_hosted_runner_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.runner_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn pulls_list_files_request(
  base,
  owner,
  repo,
  pull_number,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/pulls/"
    <> int.to_string(pull_number)
    <> "/files"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn pulls_list_files_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.diff_entry_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_create_webhook_request(base, org, data) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/hooks"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn orgs_create_webhook_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.org_hook_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_webhooks_request(base, org, per_page per_page, page page) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/hooks"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_webhooks_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.org_hook_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_list_installations_for_authenticated_user_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/installations"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_list_installations_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn security_advisories_get_global_advisory_request(base, ghsa_id) {
  let method = http.Get
  let path = "/advisories/" <> ghsa_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn security_advisories_get_global_advisory_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.global_advisory_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_release_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/releases"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_release_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.release_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_releases_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/releases"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_releases_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.release_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_languages_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/languages"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_languages_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.language_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_pre_flight_with_repo_for_authenticated_user_request(
  base,
  owner,
  repo,
  ref ref,
  client_ip client_ip,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/codespaces/new"
  let query = [#("ref", ref), #("client_ip", client_ip)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_pre_flight_with_repo_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_delete_for_team_discussion_comment_request(
  base,
  org,
  team_slug,
  discussion_number,
  comment_number,
  reaction_id,
) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/teams/"
    <> team_slug
    <> "/discussions/"
    <> int.to_string(discussion_number)
    <> "/comments/"
    <> int.to_string(comment_number)
    <> "/reactions/"
    <> int.to_string(reaction_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn reactions_delete_for_team_discussion_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_transfer_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/transfer"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_transfer_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 ->
      utils.decode_bits(body, schema.minimal_repository_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_list_secrets_for_authenticated_user_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/codespaces/secrets"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_list_secrets_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_list_for_user_request(
  base,
  username,
  since since,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/gists"
  let query = [
    #("since", since),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn gists_list_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.base_gist_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_update_request(base, org, data) {
  let method = http.Patch
  let path = "/orgs/" <> org
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn orgs_update_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.organization_full_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_delete_request(base, org) {
  let method = http.Delete
  let path = "/orgs/" <> org
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_delete_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_get_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_get_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.organization_full_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_list_projects_in_org_request(
  base,
  org,
  team_slug,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/teams/" <> team_slug <> "/projects"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_list_projects_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.team_project_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_update_pull_request_review_protection_request(
  base,
  owner,
  repo,
  branch,
  data,
) {
  let method = http.Patch
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/required_pull_request_reviews"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_update_pull_request_review_protection_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        schema.protected_branch_pull_request_review_decoder(),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_pull_request_review_protection_request(
  base,
  owner,
  repo,
  branch,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/required_pull_request_reviews"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_pull_request_review_protection_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_pull_request_review_protection_request(
  base,
  owner,
  repo,
  branch,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/branches/"
    <> branch
    <> "/protection/required_pull_request_reviews"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_pull_request_review_protection_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        schema.protected_branch_pull_request_review_decoder(),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_set_selected_repos_for_org_secret_request(
  base,
  org,
  secret_name,
  data,
) {
  let method = http.Put
  let path =
    "/orgs/" <> org <> "/actions/secrets/" <> secret_name <> "/repositories"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_set_selected_repos_for_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_selected_repos_for_org_secret_request(
  base,
  org,
  secret_name,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path =
    "/orgs/" <> org <> "/actions/secrets/" <> secret_name <> "/repositories"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_selected_repos_for_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_unlock_repo_for_org_request(
  base,
  org,
  migration_id,
  repo_name,
) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/migrations/"
    <> int.to_string(migration_id)
    <> "/repos/"
    <> repo_name
    <> "/lock"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn migrations_unlock_repo_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_custom_deployment_rule_integrations_request(
  base,
  owner,
  repo,
  environment_name,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/deployment_protection_rules/apps"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_custom_deployment_rule_integrations_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_remove_selected_repo_from_org_variable_request(
  base,
  org,
  name,
  repository_id,
) {
  let method = http.Delete
  let path =
    "/orgs/"
    <> org
    <> "/actions/variables/"
    <> name
    <> "/repositories/"
    <> int.to_string(repository_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_remove_selected_repo_from_org_variable_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_add_selected_repo_to_org_variable_request(
  base,
  org,
  name,
  repository_id,
) {
  let method = http.Put
  let path =
    "/orgs/"
    <> org
    <> "/actions/variables/"
    <> name
    <> "/repositories/"
    <> int.to_string(repository_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_add_selected_repo_to_org_variable_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_list_repos_for_org_request(
  base,
  org,
  migration_id,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/migrations/"
    <> int.to_string(migration_id)
    <> "/repositories"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn migrations_list_repos_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.minimal_repository_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_delete_social_account_for_authenticated_user_request(base, data) {
  let method = http.Delete
  let path = "/user/social_accounts"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn users_delete_social_account_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_add_social_account_for_authenticated_user_request(base, data) {
  let method = http.Post
  let path = "/user/social_accounts"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn users_add_social_account_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, zero.list(schema.social_account_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_list_social_accounts_for_authenticated_user_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/social_accounts"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_list_social_accounts_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.social_account_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_delete_for_issue_request(
  base,
  owner,
  repo,
  issue_number,
  reaction_id,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
    <> "/reactions/"
    <> int.to_string(reaction_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn reactions_delete_for_issue_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_remove_repo_from_installation_for_authenticated_user_request(
  base,
  installation_id,
  repository_id,
) {
  let method = http.Delete
  let path =
    "/user/installations/"
    <> int.to_string(installation_id)
    <> "/repositories/"
    <> int.to_string(repository_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_remove_repo_from_installation_for_authenticated_user_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_add_repo_to_installation_for_authenticated_user_request(
  base,
  installation_id,
  repository_id,
) {
  let method = http.Put
  let path =
    "/user/installations/"
    <> int.to_string(installation_id)
    <> "/repositories/"
    <> int.to_string(repository_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_add_repo_to_installation_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_list_gpg_keys_for_user_request(
  base,
  username,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/gpg_keys"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_list_gpg_keys_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.gpg_key_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_list_packages_for_authenticated_user_request(
  base,
  package_type package_type,
  visibility visibility,
  page page,
  per_page per_page,
) {
  let method = http.Get
  let path = "/user/packages"
  let query = [
    #("package_type", option.Some(package_type)),
    #("visibility", visibility),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_list_packages_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.package_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_create_discussion_in_org_request(base, org, team_slug, data) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/teams/" <> team_slug <> "/discussions"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn teams_create_discussion_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.team_discussion_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_list_discussions_in_org_request(
  base,
  org,
  team_slug,
  direction direction,
  per_page per_page,
  page page,
  pinned pinned,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/teams/" <> team_slug <> "/discussions"
  let query = [
    #("direction", direction),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
    #("pinned", pinned),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_list_discussions_in_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.team_discussion_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn checks_list_for_ref_request(
  base,
  owner,
  repo,
  ref,
  check_name check_name,
  status status,
  filter filter,
  per_page per_page,
  page page,
  app_id app_id,
) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/commits/" <> ref <> "/check-runs"
  let query = [
    #("check_name", check_name),
    #("status", status),
    #("filter", filter),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
    #("app_id", option.map(app_id, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn checks_list_for_ref_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_an_environment_request(base, owner, repo, environment_name) {
  let method = http.Delete
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/environments/" <> environment_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_an_environment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_or_update_environment_request(
  base,
  owner,
  repo,
  environment_name,
  data,
) {
  let method = http.Put
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/environments/" <> environment_name
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_or_update_environment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.environment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_environment_request(base, owner, repo, environment_name) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/environments/" <> environment_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_environment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.environment_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_download_tarball_archive_request(base, owner, repo, ref) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/tarball/" <> ref
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_download_tarball_archive_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_update_pat_accesses_request(base, org, data) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/personal-access-tokens"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn orgs_update_pat_accesses_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_pat_grants_request(
  base,
  org,
  per_page per_page,
  page page,
  sort sort,
  direction direction,
  owner owner,
  repository repository,
  permission permission,
  last_used_before last_used_before,
  last_used_after last_used_after,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/personal-access-tokens"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
    #("sort", sort),
    #("direction", direction),
    #("owner", panic as "owner"),
    #("repository", repository),
    #("permission", permission),
    #("last_used_before", last_used_before),
    #("last_used_after", last_used_after),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_pat_grants_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.organization_programmatic_access_grant_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_accept_invitation_for_authenticated_user_request(
  base,
  invitation_id,
) {
  let method = http.Patch
  let path = "/user/repository_invitations/" <> int.to_string(invitation_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_accept_invitation_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_decline_invitation_for_authenticated_user_request(
  base,
  invitation_id,
) {
  let method = http.Delete
  let path = "/user/repository_invitations/" <> int.to_string(invitation_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_decline_invitation_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_security_get_repositories_for_configuration_request(
  base,
  org,
  configuration_id,
  per_page per_page,
  before before,
  after after,
  status status,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/code-security/configurations/"
    <> int.to_string(configuration_id)
    <> "/repositories"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("before", before),
    #("after", after),
    #("status", status),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_security_get_repositories_for_configuration_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.code_security_configuration_repositories_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_repo_rule_suites_request(
  base,
  owner,
  repo,
  ref ref,
  time_period time_period,
  actor_name actor_name,
  rule_suite_result rule_suite_result,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/rulesets/rule-suites"
  let query = [
    #("ref", ref),
    #("time_period", time_period),
    #("actor_name", actor_name),
    #("rule_suite_result", rule_suite_result),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_repo_rule_suites_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.rule_suites_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_invitations_request(
  base,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/invitations"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_invitations_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.repository_invitation_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_get_by_username_request(base, username) {
  let method = http.Get
  let path = "/users/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_get_by_username_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.failure(Nil, "Unsupported schema"))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_workflow_run_artifacts_request(
  base,
  owner,
  repo,
  run_id,
  per_page per_page,
  page page,
  name name,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/runs/"
    <> int.to_string(run_id)
    <> "/artifacts"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
    #("name", name),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_workflow_run_artifacts_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_get_all_package_versions_for_package_owned_by_org_request(
  base,
  org,
  package_type,
  package_name,
  page page,
  per_page per_page,
  state state,
) {
  let method = http.Get
  let path =
    "/orgs/"
    <> org
    <> "/packages/"
    <> package_type
    <> "/"
    <> package_name
    <> "/versions"
  let query = [
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
    #("state", state),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_get_all_package_versions_for_package_owned_by_org_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.package_version_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_readme_in_directory_request(base, owner, repo, dir, ref ref) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/readme/" <> dir
  let query = [#("ref", ref)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_readme_in_directory_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.content_file_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn teams_list_for_authenticated_user_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/teams"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn teams_list_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.team_full_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_scanning_delete_analysis_request(
  base,
  owner,
  repo,
  analysis_id,
  confirm_delete confirm_delete,
) {
  let method = http.Delete
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/code-scanning/analyses/"
    <> int.to_string(analysis_id)
  let query = [#("confirm_delete", confirm_delete)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_scanning_delete_analysis_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.code_scanning_analysis_deletion_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_scanning_get_analysis_request(base, owner, repo, analysis_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/code-scanning/analyses/"
    <> int.to_string(analysis_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_scanning_get_analysis_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.code_scanning_analysis_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn git_create_blob_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/git/blobs"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn git_create_blob_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.short_blob_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_workflow_usage_request(base, owner, repo, workflow_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/actions/workflows/"
    <> workflow_id
    <> "/timing"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_workflow_usage_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.workflow_usage_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_list_webhook_deliveries_request(
  base,
  per_page per_page,
  cursor cursor,
) {
  let method = http.Get
  let path = "/app/hook/deliveries"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("cursor", cursor),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_list_webhook_deliveries_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.hook_delivery_item_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn checks_set_suites_preferences_request(base, owner, repo, data) {
  let method = http.Patch
  let path = "/repos/" <> owner <> "/" <> repo <> "/check-suites/preferences"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn checks_set_suites_preferences_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.check_suite_preference_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn api_insights_get_subject_stats_request(
  base,
  org,
  min_timestamp min_timestamp,
  max_timestamp max_timestamp,
  page page,
  per_page per_page,
  direction direction,
  sort sort,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/insights/api/subject-stats"
  let query = [
    #("min_timestamp", option.Some(min_timestamp)),
    #("max_timestamp", option.Some(max_timestamp)),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
    #("direction", direction),
    #("sort", panic as "sort"),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn api_insights_get_subject_stats_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.api_insights_subject_stats_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_create_request(base, data) {
  let method = http.Post
  let path = "/gists"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn gists_create_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.gist_simple_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_list_request(base, since since, per_page per_page, page page) {
  let method = http.Get
  let path = "/gists"
  let query = [
    #("since", since),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn gists_list_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.base_gist_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_list_public_keys_for_user_request(
  base,
  username,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/users/" <> username <> "/keys"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_list_public_keys_for_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.key_simple_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_delete_branch_protection_request(base, owner, repo, branch) {
  let method = http.Delete
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/branches/" <> branch <> "/protection"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_delete_branch_protection_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_update_branch_protection_request(base, owner, repo, branch, data) {
  let method = http.Put
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/branches/" <> branch <> "/protection"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_update_branch_protection_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.protected_branch_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_branch_protection_request(base, owner, repo, branch) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/branches/" <> branch <> "/protection"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_branch_protection_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.branch_protection_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn migrations_get_large_files_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/import/large_files"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn migrations_get_large_files_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.porter_large_file_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_list_watched_repos_for_authenticated_user_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/subscriptions"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_list_watched_repos_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.minimal_repository_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_using_template_request(
  base,
  template_owner,
  template_repo,
  data,
) {
  let method = http.Post
  let path = "/repos/" <> template_owner <> "/" <> template_repo <> "/generate"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_using_template_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 ->
      utils.decode_bits(body, schema.full_repository_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn billing_get_github_packages_billing_org_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/settings/billing/packages"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn billing_get_github_packages_billing_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.packages_billing_usage_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn code_scanning_list_alerts_for_org_request(
  base,
  org,
  tool_name tool_name,
  tool_guid tool_guid,
  before before,
  after after,
  page page,
  per_page per_page,
  direction direction,
  state state,
  sort sort,
  severity severity,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/code-scanning/alerts"
  let query = [
    #("tool_name", tool_name),
    #("tool_guid", tool_guid),
    #("before", before),
    #("after", after),
    #("page", option.map(page, int.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
    #("direction", direction),
    #("state", state),
    #("sort", sort),
    #("severity", severity),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn code_scanning_list_alerts_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.code_scanning_organization_alert_items_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_delete_org_secret_request(base, org, secret_name) {
  let method = http.Delete
  let path = "/orgs/" <> org <> "/dependabot/secrets/" <> secret_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn dependabot_delete_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_create_or_update_org_secret_request(
  base,
  org,
  secret_name,
  data,
) {
  let method = http.Put
  let path = "/orgs/" <> org <> "/dependabot/secrets/" <> secret_name
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn dependabot_create_or_update_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn dependabot_get_org_secret_request(base, org, secret_name) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/dependabot/secrets/" <> secret_name
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn dependabot_get_org_secret_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.organization_dependabot_secret_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn licenses_get_all_commonly_used_request(
  base,
  featured featured,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/licenses"
  let query = [
    #("featured", option.map(featured, bool.to_string)),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn licenses_get_all_commonly_used_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.license_simple_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_export_for_authenticated_user_request(base, codespace_name) {
  let method = http.Post
  let path = "/user/codespaces/" <> codespace_name <> "/exports"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_export_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 ->
      utils.decode_bits(body, schema.codespace_export_details_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_list_accounts_for_plan_request(
  base,
  plan_id,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/marketplace_listing/plans/" <> int.to_string(plan_id) <> "/accounts"
  let query = [
    #("sort", sort),
    #("direction", direction),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_list_accounts_for_plan_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.marketplace_purchase_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn packages_get_all_package_versions_for_package_owned_by_user_request(
  base,
  username,
  package_type,
  package_name,
) {
  let method = http.Get
  let path =
    "/users/"
    <> username
    <> "/packages/"
    <> package_type
    <> "/"
    <> package_name
    <> "/versions"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn packages_get_all_package_versions_for_package_owned_by_user_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.package_version_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_list_runner_applications_for_org_request(base, org) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/actions/runners/downloads"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_list_runner_applications_for_org_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.runner_application_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_delete_thread_subscription_request(base, thread_id) {
  let method = http.Delete
  let path =
    "/notifications/threads/" <> int.to_string(thread_id) <> "/subscription"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_delete_thread_subscription_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_set_thread_subscription_request(base, thread_id, data) {
  let method = http.Put
  let path =
    "/notifications/threads/" <> int.to_string(thread_id) <> "/subscription"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn activity_set_thread_subscription_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.thread_subscription_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn activity_get_thread_subscription_for_authenticated_user_request(
  base,
  thread_id,
) {
  let method = http.Get
  let path =
    "/notifications/threads/" <> int.to_string(thread_id) <> "/subscription"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn activity_get_thread_subscription_for_authenticated_user_response(
  response,
) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.thread_subscription_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn git_create_tree_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/git/trees"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn git_create_tree_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    201 -> utils.decode_bits(body, schema.git_tree_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_dispatch_event_request(base, owner, repo, data) {
  let method = http.Post
  let path = "/repos/" <> owner <> "/" <> repo <> "/dispatches"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_dispatch_event_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_contributors_stats_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/stats/contributors"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_contributors_stats_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn gists_list_commits_request(base, gist_id, per_page per_page, page page) {
  let method = http.Get
  let path = "/gists/" <> gist_id <> "/commits"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn gists_list_commits_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.gist_commit_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn billing_get_github_packages_billing_user_request(base, username) {
  let method = http.Get
  let path = "/users/" <> username <> "/settings/billing/packages"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn billing_get_github_packages_billing_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.packages_billing_usage_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn issues_list_events_for_timeline_request(
  base,
  owner,
  repo,
  issue_number,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/"
    <> int.to_string(issue_number)
    <> "/timeline"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn issues_list_events_for_timeline_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.timeline_issue_events_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_unblock_request(base, username) {
  let method = http.Delete
  let path = "/user/blocks/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_unblock_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_block_request(base, username) {
  let method = http.Put
  let path = "/user/blocks/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_block_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_check_blocked_request(base, username) {
  let method = http.Get
  let path = "/user/blocks/" <> username
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_check_blocked_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn search_repos_request(
  base,
  q q,
  sort sort,
  order order,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/search/repositories"
  let query = [
    #("q", option.Some(q)),
    #("sort", sort),
    #("order", order),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_repos_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_review_pat_grant_requests_in_bulk_request(base, org, data) {
  let method = http.Post
  let path = "/orgs/" <> org <> "/personal-access-token-requests"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn orgs_review_pat_grant_requests_in_bulk_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    202 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn orgs_list_pat_grant_requests_request(
  base,
  org,
  per_page per_page,
  page page,
  sort sort,
  direction direction,
  owner owner,
  repository repository,
  permission permission,
  last_used_before last_used_before,
  last_used_after last_used_after,
) {
  let method = http.Get
  let path = "/orgs/" <> org <> "/personal-access-token-requests"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
    #("sort", sort),
    #("direction", direction),
    #("owner", panic as "owner"),
    #("repository", repository),
    #("permission", permission),
    #("last_used_before", last_used_before),
    #("last_used_after", last_used_after),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn orgs_list_pat_grant_requests_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(
          schema.organization_programmatic_access_grant_request_decoder(),
        ),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn checks_get_suite_request(base, owner, repo, check_suite_id) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/check-suites/"
    <> int.to_string(check_suite_id)
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn checks_get_suite_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.check_suite_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_create_deployment_branch_policy_request(
  base,
  owner,
  repo,
  environment_name,
  deployment_branch_policy_name_pattern_with_type,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/deployment-branch-policies"
  let query = []
  let body =
    utils.json_to_bits(
      schema.deployment_branch_policy_name_pattern_with_type_to_json(
        deployment_branch_policy_name_pattern_with_type,
      ),
    )
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn repos_create_deployment_branch_policy_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.deployment_branch_policy_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_list_deployment_branch_policies_request(
  base,
  owner,
  repo,
  environment_name,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/environments/"
    <> environment_name
    <> "/deployment-branch-policies"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_list_deployment_branch_policies_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, zero.dynamic) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn codespaces_stop_for_authenticated_user_request(base, codespace_name) {
  let method = http.Post
  let path = "/user/codespaces/" <> codespace_name <> "/stop"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn codespaces_stop_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.codespace_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_create_for_issue_comment_request(
  base,
  owner,
  repo,
  comment_id,
  data,
) {
  let method = http.Post
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/comments/"
    <> int.to_string(comment_id)
    <> "/reactions"
  let query = []
  let body = data
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn reactions_create_for_issue_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 -> utils.decode_bits(body, schema.reaction_decoder()) |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn reactions_list_for_issue_comment_request(
  base,
  owner,
  repo,
  comment_id,
  content content,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path =
    "/repos/"
    <> owner
    <> "/"
    <> repo
    <> "/issues/comments/"
    <> int.to_string(comment_id)
    <> "/reactions"
  let query = [
    #("content", content),
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn reactions_list_for_issue_comment_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.reaction_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_set_allowed_actions_repository_request(
  base,
  owner,
  repo,
  selected_actions,
) {
  let method = http.Put
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/actions/permissions/selected-actions"
  let query = []
  let body =
    utils.json_to_bits(schema.selected_actions_to_json(selected_actions))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn actions_set_allowed_actions_repository_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn actions_get_allowed_actions_repository_request(base, owner, repo) {
  let method = http.Get
  let path =
    "/repos/" <> owner <> "/" <> repo <> "/actions/permissions/selected-actions"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn actions_get_allowed_actions_repository_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.selected_actions_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn apps_list_plans_stubbed_request(base, per_page per_page, page page) {
  let method = http.Get
  let path = "/marketplace_listing/stubbed/plans"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn apps_list_plans_stubbed_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(
        body,
        zero.list(schema.marketplace_listing_plan_decoder()),
      )
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn users_list_followers_for_authenticated_user_request(
  base,
  per_page per_page,
  page page,
) {
  let method = http.Get
  let path = "/user/followers"
  let query = [
    #("per_page", option.map(per_page, int.to_string)),
    #("page", option.map(page, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn users_list_followers_for_authenticated_user_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, zero.list(schema.simple_user_decoder()))
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_get_clones_request(base, owner, repo, per per) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/traffic/clones"
  let query = [#("per", per)]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_get_clones_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    200 ->
      utils.decode_bits(body, schema.clone_traffic_decoder())
      |> result.map(Ok)
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_disable_vulnerability_alerts_request(base, owner, repo) {
  let method = http.Delete
  let path = "/repos/" <> owner <> "/" <> repo <> "/vulnerability-alerts"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_disable_vulnerability_alerts_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_enable_vulnerability_alerts_request(base, owner, repo) {
  let method = http.Put
  let path = "/repos/" <> owner <> "/" <> repo <> "/vulnerability-alerts"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_enable_vulnerability_alerts_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}

pub fn repos_check_vulnerability_alerts_request(base, owner, repo) {
  let method = http.Get
  let path = "/repos/" <> owner <> "/" <> repo <> "/vulnerability-alerts"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn repos_check_vulnerability_alerts_response(response) {
  let response.Response(status: status, body: body, ..) = response
  case status {
    204 -> Ok(Nil) |> Ok
    _ -> "API doesn't describe default response" |> Error |> Ok
  }
}
