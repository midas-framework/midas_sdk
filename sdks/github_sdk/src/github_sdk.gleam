import github_sdk/operations
import gleam/bit_array
import gleam/dynamic/decode
import gleam/http
import gleam/http/request
import gleam/http/response
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{None, Some}
import gleam/result
import gleam/string
import gleam/uri.{Uri}
import midas/task as t
import snag

pub type App {
  App(client_id: String, client_secret: String, redirect_uri: String)
}

const auth_host = "github.com"

const auth_path = "/login/oauth/authorize"

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

  let request = token_request(client_id, client_secret, redirect_uri, code)
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
  use query <- result.try(case query {
    Some(query) -> Ok(query)
    None -> Error("uri did not have a query: " <> string.inspect(redirect))
  })
  use parts <- result.try(
    uri.parse_query(query)
    |> result.replace_error("Failed to parse query: " <> query),
  )
  use code <- result.try(key_find(parts, "code"))
  use returned_state <- result.try(key_find(parts, "state"))
  Ok(#(code, returned_state))
}

fn key_find(items, key) {
  list.key_find(items, key)
  |> result.replace_error("Did not find key: " <> key)
}

pub const api_host = "api.github.com"

const token_path = "/login/oauth/access_token"

pub fn token_request(client_id, client_secret, redirect_uri, code) {
  let query = [
    #("client_id", client_id),
    #("client_secret", client_secret),
    #("code", code),
    #("redirect_uri", redirect_uri),
  ]

  request.new()
  |> request.set_host(auth_host)
  |> request.set_method(http.Post)
  |> request.set_path(token_path)
  |> request.prepend_header("content-type", "application/x-www-form-urlencoded")
  |> request.prepend_header("accept", "application/json")
  |> request.set_body(bit_array.from_string(uri.query_to_string(query)))
}

pub fn token_response(response) {
  let response.Response(status: status, body: body, ..) = response

  case status {
    200 -> {
      let assert Ok(token) =
        json.parse_bits(body, {
          use error <- decode.field("access_token", decode.string)
          decode.success(error)
        })
      Ok(token)
    }
    _ -> {
      let assert Ok(error) =
        json.parse_bits(body, {
          use error <- decode.field("error", decode.string)
          decode.success(error)
        })
      snag.error(error)
      |> snag.context("fetching token")
    }
  }
}

pub fn base_request(token) {
  request.new()
  |> request.set_host(api_host)
  |> request.prepend_header("Authorization", string.append("Bearer ", token))
  |> request.set_body(<<>>)
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

pub fn packages_list_docker_migration_conflicting_packages_for_user(
  token,
  username,
) {
  let request = base_request(token)
  let request =
    operations.packages_list_docker_migration_conflicting_packages_for_user_request(
      request,
      username,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.packages_list_docker_migration_conflicting_packages_for_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn interactions_remove_restrictions_for_org(token, org) {
  let request = base_request(token)
  let request =
    operations.interactions_remove_restrictions_for_org_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.interactions_remove_restrictions_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn interactions_set_restrictions_for_org(token, org, interaction_limit) {
  let request = base_request(token)
  let request =
    operations.interactions_set_restrictions_for_org_request(
      request,
      org,
      interaction_limit,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.interactions_set_restrictions_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn interactions_get_restrictions_for_org(token, org) {
  let request = base_request(token)
  let request =
    operations.interactions_get_restrictions_for_org_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.interactions_get_restrictions_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn gitignore_get_all_templates(token) {
  let request = base_request(token)
  let request = operations.gitignore_get_all_templates_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.gitignore_get_all_templates_response(response)),
  )
  t.Done(data)
}

pub fn actions_create_workflow_dispatch(token, owner, repo, workflow_id, data) {
  let request = base_request(token)
  let request =
    operations.actions_create_workflow_dispatch_request(
      request,
      owner,
      repo,
      workflow_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_create_workflow_dispatch_response(response)),
  )
  t.Done(data)
}

pub fn code_security_attach_configuration(token, org, configuration_id, data) {
  let request = base_request(token)
  let request =
    operations.code_security_attach_configuration_request(
      request,
      org,
      configuration_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_security_attach_configuration_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_pages_health_check(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_get_pages_health_check_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_pages_health_check_response(response)),
  )
  t.Done(data)
}

pub fn code_scanning_get_variant_analysis_repo_task(
  token,
  owner,
  repo,
  codeql_variant_analysis_id,
  repo_owner,
  repo_name,
) {
  let request = base_request(token)
  let request =
    operations.code_scanning_get_variant_analysis_repo_task_request(
      request,
      owner,
      repo,
      codeql_variant_analysis_id,
      repo_owner,
      repo_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.code_scanning_get_variant_analysis_repo_task_response(response),
    ),
  )
  t.Done(data)
}

pub fn repos_list_attestations(
  token,
  owner,
  repo,
  subject_digest,
  per_page per_page,
  before before,
  after after,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_attestations_request(
      request,
      owner,
      repo,
      subject_digest,
      per_page,
      before,
      after,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_attestations_response(response)),
  )
  t.Done(data)
}

pub fn users_get_context_for_user(
  token,
  username,
  subject_type subject_type,
  subject_id subject_id,
) {
  let request = base_request(token)
  let request =
    operations.users_get_context_for_user_request(
      request,
      username,
      subject_type,
      subject_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_get_context_for_user_response(response)),
  )
  t.Done(data)
}

pub fn users_unfollow(token, username) {
  let request = base_request(token)
  let request = operations.users_unfollow_request(request, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.users_unfollow_response(response)))
  t.Done(data)
}

pub fn users_follow(token, username) {
  let request = base_request(token)
  let request = operations.users_follow_request(request, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.users_follow_response(response)))
  t.Done(data)
}

pub fn users_check_person_is_followed_by_authenticated(token, username) {
  let request = base_request(token)
  let request =
    operations.users_check_person_is_followed_by_authenticated_request(
      request,
      username,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.users_check_person_is_followed_by_authenticated_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn activity_unstar_repo_for_authenticated_user(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.activity_unstar_repo_for_authenticated_user_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.activity_unstar_repo_for_authenticated_user_response(response),
    ),
  )
  t.Done(data)
}

pub fn activity_star_repo_for_authenticated_user(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.activity_star_repo_for_authenticated_user_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_star_repo_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn activity_check_repo_is_starred_by_authenticated_user(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.activity_check_repo_is_starred_by_authenticated_user_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.activity_check_repo_is_starred_by_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn orgs_list_pat_grant_repositories(
  token,
  org,
  pat_id,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.orgs_list_pat_grant_repositories_request(
      request,
      org,
      pat_id,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_pat_grant_repositories_response(response)),
  )
  t.Done(data)
}

pub fn actions_list_workflow_runs(
  token,
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
  let request = base_request(token)
  let request =
    operations.actions_list_workflow_runs_request(
      request,
      owner,
      repo,
      workflow_id,
      actor,
      branch,
      event,
      status,
      per_page,
      page,
      created,
      exclude_pull_requests,
      check_suite_id,
      head_sha,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_list_workflow_runs_response(response)),
  )
  t.Done(data)
}

pub fn packages_list_docker_migration_conflicting_packages_for_organization(
  token,
  org,
) {
  let request = base_request(token)
  let request =
    operations.packages_list_docker_migration_conflicting_packages_for_organization_request(
      request,
      org,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.packages_list_docker_migration_conflicting_packages_for_organization_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn issues_update_milestone(token, owner, repo, milestone_number, data) {
  let request = base_request(token)
  let request =
    operations.issues_update_milestone_request(
      request,
      owner,
      repo,
      milestone_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_update_milestone_response(response)),
  )
  t.Done(data)
}

pub fn issues_delete_milestone(token, owner, repo, milestone_number) {
  let request = base_request(token)
  let request =
    operations.issues_delete_milestone_request(
      request,
      owner,
      repo,
      milestone_number,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_delete_milestone_response(response)),
  )
  t.Done(data)
}

pub fn issues_get_milestone(token, owner, repo, milestone_number) {
  let request = base_request(token)
  let request =
    operations.issues_get_milestone_request(
      request,
      owner,
      repo,
      milestone_number,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_get_milestone_response(response)),
  )
  t.Done(data)
}

pub fn repos_download_zipball_archive(token, owner, repo, ref) {
  let request = base_request(token)
  let request =
    operations.repos_download_zipball_archive_request(request, owner, repo, ref)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_download_zipball_archive_response(response)),
  )
  t.Done(data)
}

pub fn issues_remove_all_labels(token, owner, repo, issue_number) {
  let request = base_request(token)
  let request =
    operations.issues_remove_all_labels_request(
      request,
      owner,
      repo,
      issue_number,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_remove_all_labels_response(response)),
  )
  t.Done(data)
}

pub fn issues_add_labels(token, owner, repo, issue_number) {
  let request = base_request(token)
  let request =
    operations.issues_add_labels_request(request, owner, repo, issue_number)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_add_labels_response(response)),
  )
  t.Done(data)
}

pub fn issues_set_labels(token, owner, repo, issue_number) {
  let request = base_request(token)
  let request =
    operations.issues_set_labels_request(request, owner, repo, issue_number)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_set_labels_response(response)),
  )
  t.Done(data)
}

pub fn issues_list_labels_on_issue(
  token,
  owner,
  repo,
  issue_number,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.issues_list_labels_on_issue_request(
      request,
      owner,
      repo,
      issue_number,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_list_labels_on_issue_response(response)),
  )
  t.Done(data)
}

pub fn actions_remove_repo_access_to_self_hosted_runner_group_in_org(
  token,
  org,
  runner_group_id,
  repository_id,
) {
  let request = base_request(token)
  let request =
    operations.actions_remove_repo_access_to_self_hosted_runner_group_in_org_request(
      request,
      org,
      runner_group_id,
      repository_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_remove_repo_access_to_self_hosted_runner_group_in_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_add_repo_access_to_self_hosted_runner_group_in_org(
  token,
  org,
  runner_group_id,
  repository_id,
) {
  let request = base_request(token)
  let request =
    operations.actions_add_repo_access_to_self_hosted_runner_group_in_org_request(
      request,
      org,
      runner_group_id,
      repository_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_add_repo_access_to_self_hosted_runner_group_in_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn teams_list_pending_invitations_legacy(
  token,
  team_id,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.teams_list_pending_invitations_legacy_request(
      request,
      team_id,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_list_pending_invitations_legacy_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn markdown_render(token, data) {
  let request = base_request(token)
  let request = operations.markdown_render_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.markdown_render_response(response)),
  )
  t.Done(data)
}

pub fn dependabot_list_repo_secrets(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.dependabot_list_repo_secrets_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.dependabot_list_repo_secrets_response(response)),
  )
  t.Done(data)
}

pub fn reactions_delete_for_team_discussion(
  token,
  org,
  team_slug,
  discussion_number,
  reaction_id,
) {
  let request = base_request(token)
  let request =
    operations.reactions_delete_for_team_discussion_request(
      request,
      org,
      team_slug,
      discussion_number,
      reaction_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.reactions_delete_for_team_discussion_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_list_teams(token, owner, repo, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.repos_list_teams_request(request, owner, repo, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_teams_response(response)),
  )
  t.Done(data)
}

pub fn actions_delete_actions_cache_by_id(token, owner, repo, cache_id) {
  let request = base_request(token)
  let request =
    operations.actions_delete_actions_cache_by_id_request(
      request,
      owner,
      repo,
      cache_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_delete_actions_cache_by_id_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn codespaces_remove_repository_for_secret_for_authenticated_user(
  token,
  secret_name,
  repository_id,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_remove_repository_for_secret_for_authenticated_user_request(
      request,
      secret_name,
      repository_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_remove_repository_for_secret_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn codespaces_add_repository_for_secret_for_authenticated_user(
  token,
  secret_name,
  repository_id,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_add_repository_for_secret_for_authenticated_user_request(
      request,
      secret_name,
      repository_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_add_repository_for_secret_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn pulls_dismiss_review(token, owner, repo, pull_number, review_id, data) {
  let request = base_request(token)
  let request =
    operations.pulls_dismiss_review_request(
      request,
      owner,
      repo,
      pull_number,
      review_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_dismiss_review_response(response)),
  )
  t.Done(data)
}

pub fn migrations_delete_archive_for_authenticated_user(token, migration_id) {
  let request = base_request(token)
  let request =
    operations.migrations_delete_archive_for_authenticated_user_request(
      request,
      migration_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.migrations_delete_archive_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn migrations_get_archive_for_authenticated_user(token, migration_id) {
  let request = base_request(token)
  let request =
    operations.migrations_get_archive_for_authenticated_user_request(
      request,
      migration_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.migrations_get_archive_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn teams_remove_member_legacy(token, team_id, username) {
  let request = base_request(token)
  let request =
    operations.teams_remove_member_legacy_request(request, team_id, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_remove_member_legacy_response(response)),
  )
  t.Done(data)
}

pub fn teams_add_member_legacy(token, team_id, username) {
  let request = base_request(token)
  let request =
    operations.teams_add_member_legacy_request(request, team_id, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_add_member_legacy_response(response)),
  )
  t.Done(data)
}

pub fn teams_get_member_legacy(token, team_id, username) {
  let request = base_request(token)
  let request =
    operations.teams_get_member_legacy_request(request, team_id, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_get_member_legacy_response(response)),
  )
  t.Done(data)
}

pub fn repos_create_deployment_protection_rule(
  token,
  owner,
  repo,
  environment_name,
  data,
) {
  let request = base_request(token)
  let request =
    operations.repos_create_deployment_protection_rule_request(
      request,
      owner,
      repo,
      environment_name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_deployment_protection_rule_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_all_deployment_protection_rules(
  token,
  owner,
  repo,
  environment_name,
) {
  let request = base_request(token)
  let request =
    operations.repos_get_all_deployment_protection_rules_request(
      request,
      owner,
      repo,
      environment_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_all_deployment_protection_rules_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn copilot_copilot_metrics_for_enterprise(
  token,
  enterprise,
  since since,
  until until,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.copilot_copilot_metrics_for_enterprise_request(
      request,
      enterprise,
      since,
      until,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.copilot_copilot_metrics_for_enterprise_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn packages_delete_package_version_for_authenticated_user(
  token,
  package_type,
  package_name,
  package_version_id,
) {
  let request = base_request(token)
  let request =
    operations.packages_delete_package_version_for_authenticated_user_request(
      request,
      package_type,
      package_name,
      package_version_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.packages_delete_package_version_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn packages_get_package_version_for_authenticated_user(
  token,
  package_type,
  package_name,
  package_version_id,
) {
  let request = base_request(token)
  let request =
    operations.packages_get_package_version_for_authenticated_user_request(
      request,
      package_type,
      package_name,
      package_version_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.packages_get_package_version_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_re_run_job_for_workflow_run(token, owner, repo, job_id, data) {
  let request = base_request(token)
  let request =
    operations.actions_re_run_job_for_workflow_run_request(
      request,
      owner,
      repo,
      job_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_re_run_job_for_workflow_run_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn activity_list_org_events_for_authenticated_user(
  token,
  username,
  org,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.activity_list_org_events_for_authenticated_user_request(
      request,
      username,
      org,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.activity_list_org_events_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn orgs_list_invitation_teams(
  token,
  org,
  invitation_id,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.orgs_list_invitation_teams_request(
      request,
      org,
      invitation_id,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_invitation_teams_response(response)),
  )
  t.Done(data)
}

pub fn projects_move_card(token, card_id, data) {
  let request = base_request(token)
  let request = operations.projects_move_card_request(request, card_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_move_card_response(response)),
  )
  t.Done(data)
}

pub fn issues_check_user_can_be_assigned_to_issue(
  token,
  owner,
  repo,
  issue_number,
  assignee,
) {
  let request = base_request(token)
  let request =
    operations.issues_check_user_can_be_assigned_to_issue_request(
      request,
      owner,
      repo,
      issue_number,
      assignee,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.issues_check_user_can_be_assigned_to_issue_response(response),
    ),
  )
  t.Done(data)
}

pub fn teams_list_members_legacy(
  token,
  team_id,
  role role,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.teams_list_members_legacy_request(
      request,
      team_id,
      role,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_list_members_legacy_response(response)),
  )
  t.Done(data)
}

pub fn migrations_update_import(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.migrations_update_import_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.migrations_update_import_response(response)),
  )
  t.Done(data)
}

pub fn migrations_cancel_import(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.migrations_cancel_import_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.migrations_cancel_import_response(response)),
  )
  t.Done(data)
}

pub fn migrations_start_import(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.migrations_start_import_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.migrations_start_import_response(response)),
  )
  t.Done(data)
}

pub fn migrations_get_import_status(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.migrations_get_import_status_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.migrations_get_import_status_response(response)),
  )
  t.Done(data)
}

pub fn teams_update_discussion_comment_legacy(
  token,
  team_id,
  discussion_number,
  comment_number,
  data,
) {
  let request = base_request(token)
  let request =
    operations.teams_update_discussion_comment_legacy_request(
      request,
      team_id,
      discussion_number,
      comment_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_update_discussion_comment_legacy_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn teams_delete_discussion_comment_legacy(
  token,
  team_id,
  discussion_number,
  comment_number,
) {
  let request = base_request(token)
  let request =
    operations.teams_delete_discussion_comment_legacy_request(
      request,
      team_id,
      discussion_number,
      comment_number,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_delete_discussion_comment_legacy_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn teams_get_discussion_comment_legacy(
  token,
  team_id,
  discussion_number,
  comment_number,
) {
  let request = base_request(token)
  let request =
    operations.teams_get_discussion_comment_legacy_request(
      request,
      team_id,
      discussion_number,
      comment_number,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_get_discussion_comment_legacy_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_list_branches_for_head_commit(token, owner, repo, commit_sha) {
  let request = base_request(token)
  let request =
    operations.repos_list_branches_for_head_commit_request(
      request,
      owner,
      repo,
      commit_sha,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_branches_for_head_commit_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn apps_list_accounts_for_plan_stubbed(
  token,
  plan_id,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.apps_list_accounts_for_plan_stubbed_request(
      request,
      plan_id,
      sort,
      direction,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_list_accounts_for_plan_stubbed_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn reactions_delete_for_commit_comment(
  token,
  owner,
  repo,
  comment_id,
  reaction_id,
) {
  let request = base_request(token)
  let request =
    operations.reactions_delete_for_commit_comment_request(
      request,
      owner,
      repo,
      comment_id,
      reaction_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.reactions_delete_for_commit_comment_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_pages_build(token, owner, repo, build_id) {
  let request = base_request(token)
  let request =
    operations.repos_get_pages_build_request(request, owner, repo, build_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_pages_build_response(response)),
  )
  t.Done(data)
}

pub fn api_insights_get_route_stats_by_actor(
  token,
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
  let request = base_request(token)
  let request =
    operations.api_insights_get_route_stats_by_actor_request(
      request,
      org,
      actor_type,
      actor_id,
      min_timestamp,
      max_timestamp,
      page,
      per_page,
      direction,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_insights_get_route_stats_by_actor_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn copilot_usage_metrics_for_enterprise(
  token,
  enterprise,
  since since,
  until until,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.copilot_usage_metrics_for_enterprise_request(
      request,
      enterprise,
      since,
      until,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.copilot_usage_metrics_for_enterprise_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn search_topics(token, q q, per_page per_page, page page) {
  let request = base_request(token)
  let request = operations.search_topics_request(request, q, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.search_topics_response(response)))
  t.Done(data)
}

pub fn actions_update_environment_variable(
  token,
  owner,
  repo,
  environment_name,
  name,
  data,
) {
  let request = base_request(token)
  let request =
    operations.actions_update_environment_variable_request(
      request,
      owner,
      repo,
      environment_name,
      name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_update_environment_variable_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_delete_environment_variable(
  token,
  owner,
  repo,
  environment_name,
  name,
) {
  let request = base_request(token)
  let request =
    operations.actions_delete_environment_variable_request(
      request,
      owner,
      repo,
      environment_name,
      name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_delete_environment_variable_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_get_environment_variable(
  token,
  owner,
  repo,
  environment_name,
  name,
) {
  let request = base_request(token)
  let request =
    operations.actions_get_environment_variable_request(
      request,
      owner,
      repo,
      environment_name,
      name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_environment_variable_response(response)),
  )
  t.Done(data)
}

pub fn users_list_followed_by_authenticated_user(
  token,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.users_list_followed_by_authenticated_user_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_list_followed_by_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn orgs_list_for_user(token, username, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.orgs_list_for_user_request(request, username, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_for_user_response(response)),
  )
  t.Done(data)
}

pub fn apps_list_plans(token, per_page per_page, page page) {
  let request = base_request(token)
  let request = operations.apps_list_plans_request(request, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_list_plans_response(response)),
  )
  t.Done(data)
}

pub fn pulls_update(token, owner, repo, pull_number, data) {
  let request = base_request(token)
  let request =
    operations.pulls_update_request(request, owner, repo, pull_number, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.pulls_update_response(response)))
  t.Done(data)
}

pub fn pulls_get(token, owner, repo, pull_number) {
  let request = base_request(token)
  let request = operations.pulls_get_request(request, owner, repo, pull_number)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.pulls_get_response(response)))
  t.Done(data)
}

pub fn actions_remove_custom_label_from_self_hosted_runner_for_org(
  token,
  org,
  runner_id,
  name,
) {
  let request = base_request(token)
  let request =
    operations.actions_remove_custom_label_from_self_hosted_runner_for_org_request(
      request,
      org,
      runner_id,
      name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_remove_custom_label_from_self_hosted_runner_for_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn packages_restore_package_version_for_authenticated_user(
  token,
  package_type,
  package_name,
  package_version_id,
) {
  let request = base_request(token)
  let request =
    operations.packages_restore_package_version_for_authenticated_user_request(
      request,
      package_type,
      package_name,
      package_version_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.packages_restore_package_version_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn repos_replace_all_topics(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.repos_replace_all_topics_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_replace_all_topics_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_all_topics(token, owner, repo, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.repos_get_all_topics_request(
      request,
      owner,
      repo,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_all_topics_response(response)),
  )
  t.Done(data)
}

pub fn repos_remove_team_access_restrictions(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_remove_team_access_restrictions_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_remove_team_access_restrictions_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_add_team_access_restrictions(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_add_team_access_restrictions_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_add_team_access_restrictions_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_set_team_access_restrictions(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_set_team_access_restrictions_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_set_team_access_restrictions_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_teams_with_access_to_protected_branch(
  token,
  owner,
  repo,
  branch,
) {
  let request = base_request(token)
  let request =
    operations.repos_get_teams_with_access_to_protected_branch_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.repos_get_teams_with_access_to_protected_branch_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn emojis_get(token) {
  let request = base_request(token)
  let request = operations.emojis_get_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.emojis_get_response(response)))
  t.Done(data)
}

pub fn api_insights_get_time_stats(
  token,
  org,
  min_timestamp min_timestamp,
  max_timestamp max_timestamp,
  timestamp_increment timestamp_increment,
) {
  let request = base_request(token)
  let request =
    operations.api_insights_get_time_stats_request(
      request,
      org,
      min_timestamp,
      max_timestamp,
      timestamp_increment,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_insights_get_time_stats_response(response)),
  )
  t.Done(data)
}

pub fn apps_list_installations(
  token,
  per_page per_page,
  page page,
  since since,
  outdated outdated,
) {
  let request = base_request(token)
  let request =
    operations.apps_list_installations_request(
      request,
      per_page,
      page,
      since,
      outdated,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_list_installations_response(response)),
  )
  t.Done(data)
}

pub fn actions_remove_selected_repo_from_org_secret(
  token,
  org,
  secret_name,
  repository_id,
) {
  let request = base_request(token)
  let request =
    operations.actions_remove_selected_repo_from_org_secret_request(
      request,
      org,
      secret_name,
      repository_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_remove_selected_repo_from_org_secret_response(response),
    ),
  )
  t.Done(data)
}

pub fn actions_add_selected_repo_to_org_secret(
  token,
  org,
  secret_name,
  repository_id,
) {
  let request = base_request(token)
  let request =
    operations.actions_add_selected_repo_to_org_secret_request(
      request,
      org,
      secret_name,
      repository_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_add_selected_repo_to_org_secret_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_test_push_webhook(token, owner, repo, hook_id) {
  let request = base_request(token)
  let request =
    operations.repos_test_push_webhook_request(request, owner, repo, hook_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_test_push_webhook_response(response)),
  )
  t.Done(data)
}

pub fn dependabot_list_alerts_for_repo(
  token,
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
  let request = base_request(token)
  let request =
    operations.dependabot_list_alerts_for_repo_request(
      request,
      owner,
      repo,
      state,
      severity,
      ecosystem,
      package,
      manifest,
      scope,
      sort,
      direction,
      page,
      per_page,
      before,
      after,
      first,
      last,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.dependabot_list_alerts_for_repo_response(response)),
  )
  t.Done(data)
}

pub fn reactions_delete_for_pull_request_comment(
  token,
  owner,
  repo,
  comment_id,
  reaction_id,
) {
  let request = base_request(token)
  let request =
    operations.reactions_delete_for_pull_request_comment_request(
      request,
      owner,
      repo,
      comment_id,
      reaction_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.reactions_delete_for_pull_request_comment_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn checks_list_for_suite(
  token,
  owner,
  repo,
  check_suite_id,
  check_name check_name,
  status status,
  filter filter,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.checks_list_for_suite_request(
      request,
      owner,
      repo,
      check_suite_id,
      check_name,
      status,
      filter,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.checks_list_for_suite_response(response)),
  )
  t.Done(data)
}

pub fn projects_update_column(token, column_id, data) {
  let request = base_request(token)
  let request =
    operations.projects_update_column_request(request, column_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_update_column_response(response)),
  )
  t.Done(data)
}

pub fn projects_delete_column(token, column_id) {
  let request = base_request(token)
  let request = operations.projects_delete_column_request(request, column_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_delete_column_response(response)),
  )
  t.Done(data)
}

pub fn projects_get_column(token, column_id) {
  let request = base_request(token)
  let request = operations.projects_get_column_request(request, column_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_get_column_response(response)),
  )
  t.Done(data)
}

pub fn repos_ping_webhook(token, owner, repo, hook_id) {
  let request = base_request(token)
  let request =
    operations.repos_ping_webhook_request(request, owner, repo, hook_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_ping_webhook_response(response)),
  )
  t.Done(data)
}

pub fn security_advisories_create_private_vulnerability_report(
  token,
  owner,
  repo,
  private_vulnerability_report_create,
) {
  let request = base_request(token)
  let request =
    operations.security_advisories_create_private_vulnerability_report_request(
      request,
      owner,
      repo,
      private_vulnerability_report_create,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.security_advisories_create_private_vulnerability_report_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_force_cancel_workflow_run(token, owner, repo, run_id) {
  let request = base_request(token)
  let request =
    operations.actions_force_cancel_workflow_run_request(
      request,
      owner,
      repo,
      run_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_force_cancel_workflow_run_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_delete_actions_cache_by_key(token, owner, repo, key key, ref ref) {
  let request = base_request(token)
  let request =
    operations.actions_delete_actions_cache_by_key_request(
      request,
      owner,
      repo,
      key,
      ref,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_delete_actions_cache_by_key_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_get_actions_cache_list(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
  ref ref,
  key key,
  sort sort,
  direction direction,
) {
  let request = base_request(token)
  let request =
    operations.actions_get_actions_cache_list_request(
      request,
      owner,
      repo,
      per_page,
      page,
      ref,
      key,
      sort,
      direction,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_actions_cache_list_response(response)),
  )
  t.Done(data)
}

pub fn actions_create_registration_token_for_repo(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.actions_create_registration_token_for_repo_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_create_registration_token_for_repo_response(response),
    ),
  )
  t.Done(data)
}

pub fn orgs_update_webhook_config_for_org(token, org, hook_id, data) {
  let request = base_request(token)
  let request =
    operations.orgs_update_webhook_config_for_org_request(
      request,
      org,
      hook_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_update_webhook_config_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn orgs_get_webhook_config_for_org(token, org, hook_id) {
  let request = base_request(token)
  let request =
    operations.orgs_get_webhook_config_for_org_request(request, org, hook_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_get_webhook_config_for_org_response(response)),
  )
  t.Done(data)
}

pub fn orgs_list_org_role_teams(
  token,
  org,
  role_id,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.orgs_list_org_role_teams_request(
      request,
      org,
      role_id,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_org_role_teams_response(response)),
  )
  t.Done(data)
}

pub fn issues_get_event(token, owner, repo, event_id) {
  let request = base_request(token)
  let request =
    operations.issues_get_event_request(request, owner, repo, event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_get_event_response(response)),
  )
  t.Done(data)
}

pub fn codespaces_get_codespaces_for_user_in_org(
  token,
  org,
  username,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_get_codespaces_for_user_in_org_request(
      request,
      org,
      username,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_get_codespaces_for_user_in_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_create_attestation(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.repos_create_attestation_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_attestation_response(response)),
  )
  t.Done(data)
}

pub fn repos_disable_deployment_protection_rule(
  token,
  owner,
  repo,
  environment_name,
  protection_rule_id,
) {
  let request = base_request(token)
  let request =
    operations.repos_disable_deployment_protection_rule_request(
      request,
      owner,
      repo,
      environment_name,
      protection_rule_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_disable_deployment_protection_rule_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_custom_deployment_protection_rule(
  token,
  owner,
  repo,
  environment_name,
  protection_rule_id,
) {
  let request = base_request(token)
  let request =
    operations.repos_get_custom_deployment_protection_rule_request(
      request,
      owner,
      repo,
      environment_name,
      protection_rule_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.repos_get_custom_deployment_protection_rule_response(response),
    ),
  )
  t.Done(data)
}

pub fn api_insights_get_summary_stats(
  token,
  org,
  min_timestamp min_timestamp,
  max_timestamp max_timestamp,
) {
  let request = base_request(token)
  let request =
    operations.api_insights_get_summary_stats_request(
      request,
      org,
      min_timestamp,
      max_timestamp,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_insights_get_summary_stats_response(response)),
  )
  t.Done(data)
}

pub fn classroom_get_a_classroom(token, classroom_id) {
  let request = base_request(token)
  let request =
    operations.classroom_get_a_classroom_request(request, classroom_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.classroom_get_a_classroom_response(response)),
  )
  t.Done(data)
}

pub fn issues_create_milestone(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.issues_create_milestone_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_create_milestone_response(response)),
  )
  t.Done(data)
}

pub fn issues_list_milestones(
  token,
  owner,
  repo,
  state state,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.issues_list_milestones_request(
      request,
      owner,
      repo,
      state,
      sort,
      direction,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_list_milestones_response(response)),
  )
  t.Done(data)
}

pub fn checks_list_annotations(
  token,
  owner,
  repo,
  check_run_id,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.checks_list_annotations_request(
      request,
      owner,
      repo,
      check_run_id,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.checks_list_annotations_response(response)),
  )
  t.Done(data)
}

pub fn repos_disable_private_vulnerability_reporting(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_disable_private_vulnerability_reporting_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.repos_disable_private_vulnerability_reporting_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn repos_enable_private_vulnerability_reporting(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_enable_private_vulnerability_reporting_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.repos_enable_private_vulnerability_reporting_response(response),
    ),
  )
  t.Done(data)
}

pub fn repos_check_private_vulnerability_reporting(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_check_private_vulnerability_reporting_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.repos_check_private_vulnerability_reporting_response(response),
    ),
  )
  t.Done(data)
}

pub fn users_list_blocked_by_authenticated_user(
  token,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.users_list_blocked_by_authenticated_user_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_list_blocked_by_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn code_scanning_update_default_setup(
  token,
  owner,
  repo,
  code_scanning_default_setup_update,
) {
  let request = base_request(token)
  let request =
    operations.code_scanning_update_default_setup_request(
      request,
      owner,
      repo,
      code_scanning_default_setup_update,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_scanning_update_default_setup_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn code_scanning_get_default_setup(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.code_scanning_get_default_setup_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_scanning_get_default_setup_response(response)),
  )
  t.Done(data)
}

pub fn api_insights_get_time_stats_by_actor(
  token,
  org,
  actor_type,
  actor_id,
  min_timestamp min_timestamp,
  max_timestamp max_timestamp,
  timestamp_increment timestamp_increment,
) {
  let request = base_request(token)
  let request =
    operations.api_insights_get_time_stats_by_actor_request(
      request,
      org,
      actor_type,
      actor_id,
      min_timestamp,
      max_timestamp,
      timestamp_increment,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_insights_get_time_stats_by_actor_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_redeliver_webhook_delivery(
  token,
  owner,
  repo,
  hook_id,
  delivery_id,
) {
  let request = base_request(token)
  let request =
    operations.repos_redeliver_webhook_delivery_request(
      request,
      owner,
      repo,
      hook_id,
      delivery_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_redeliver_webhook_delivery_response(response)),
  )
  t.Done(data)
}

pub fn orgs_update_membership_for_authenticated_user(token, org, data) {
  let request = base_request(token)
  let request =
    operations.orgs_update_membership_for_authenticated_user_request(
      request,
      org,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.orgs_update_membership_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn orgs_get_membership_for_authenticated_user(token, org) {
  let request = base_request(token)
  let request =
    operations.orgs_get_membership_for_authenticated_user_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.orgs_get_membership_for_authenticated_user_response(response),
    ),
  )
  t.Done(data)
}

pub fn api_insights_get_summary_stats_by_actor(
  token,
  org,
  actor_type,
  actor_id,
  min_timestamp min_timestamp,
  max_timestamp max_timestamp,
) {
  let request = base_request(token)
  let request =
    operations.api_insights_get_summary_stats_by_actor_request(
      request,
      org,
      actor_type,
      actor_id,
      min_timestamp,
      max_timestamp,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_insights_get_summary_stats_by_actor_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_delete_file(token, owner, repo, path_, data) {
  let request = base_request(token)
  let request =
    operations.repos_delete_file_request(request, owner, repo, path_, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_file_response(response)),
  )
  t.Done(data)
}

pub fn repos_create_or_update_file_contents(token, owner, repo, path_, data) {
  let request = base_request(token)
  let request =
    operations.repos_create_or_update_file_contents_request(
      request,
      owner,
      repo,
      path_,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_or_update_file_contents_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_content(token, owner, repo, path_, ref ref) {
  let request = base_request(token)
  let request =
    operations.repos_get_content_request(request, owner, repo, path_, ref)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_content_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_invitations_for_authenticated_user(
  token,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_invitations_for_authenticated_user_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.repos_list_invitations_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn packages_list_packages_for_user(
  token,
  username,
  package_type package_type,
  visibility visibility,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.packages_list_packages_for_user_request(
      request,
      username,
      package_type,
      visibility,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.packages_list_packages_for_user_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_org_rule_suite(token, org, rule_suite_id) {
  let request = base_request(token)
  let request =
    operations.repos_get_org_rule_suite_request(request, org, rule_suite_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_org_rule_suite_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_commit(token, owner, repo, ref, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.repos_get_commit_request(
      request,
      owner,
      repo,
      ref,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_commit_response(response)),
  )
  t.Done(data)
}

pub fn apps_list_installation_requests_for_authenticated_app(
  token,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.apps_list_installation_requests_for_authenticated_app_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.apps_list_installation_requests_for_authenticated_app_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn migrations_start_for_authenticated_user(token, data) {
  let request = base_request(token)
  let request =
    operations.migrations_start_for_authenticated_user_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.migrations_start_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn migrations_list_for_authenticated_user(
  token,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.migrations_list_for_authenticated_user_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.migrations_list_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_update_release(token, owner, repo, release_id, data) {
  let request = base_request(token)
  let request =
    operations.repos_update_release_request(
      request,
      owner,
      repo,
      release_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_update_release_response(response)),
  )
  t.Done(data)
}

pub fn repos_delete_release(token, owner, repo, release_id) {
  let request = base_request(token)
  let request =
    operations.repos_delete_release_request(request, owner, repo, release_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_release_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_release(token, owner, repo, release_id) {
  let request = base_request(token)
  let request =
    operations.repos_get_release_request(request, owner, repo, release_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_release_response(response)),
  )
  t.Done(data)
}

pub fn teams_list_child_legacy(token, team_id, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.teams_list_child_legacy_request(request, team_id, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_list_child_legacy_response(response)),
  )
  t.Done(data)
}

pub fn users_create_ssh_signing_key_for_authenticated_user(token, data) {
  let request = base_request(token)
  let request =
    operations.users_create_ssh_signing_key_for_authenticated_user_request(
      request,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.users_create_ssh_signing_key_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn users_list_ssh_signing_keys_for_authenticated_user(
  token,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.users_list_ssh_signing_keys_for_authenticated_user_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.users_list_ssh_signing_keys_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn repos_get_pages_deployment(token, owner, repo, pages_deployment_id) {
  let request = base_request(token)
  let request =
    operations.repos_get_pages_deployment_request(
      request,
      owner,
      repo,
      pages_deployment_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_pages_deployment_response(response)),
  )
  t.Done(data)
}

pub fn codespaces_list_org_secrets(token, org, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.codespaces_list_org_secrets_request(request, org, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_list_org_secrets_response(response)),
  )
  t.Done(data)
}

pub fn secret_scanning_list_alerts_for_enterprise(
  token,
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
  let request = base_request(token)
  let request =
    operations.secret_scanning_list_alerts_for_enterprise_request(
      request,
      enterprise,
      state,
      secret_type,
      resolution,
      sort,
      direction,
      per_page,
      before,
      after,
      validity,
      is_publicly_leaked,
      is_multi_repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.secret_scanning_list_alerts_for_enterprise_response(response),
    ),
  )
  t.Done(data)
}

pub fn teams_remove_project_legacy(token, team_id, project_id) {
  let request = base_request(token)
  let request =
    operations.teams_remove_project_legacy_request(request, team_id, project_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_remove_project_legacy_response(response)),
  )
  t.Done(data)
}

pub fn teams_add_or_update_project_permissions_legacy(
  token,
  team_id,
  project_id,
  data,
) {
  let request = base_request(token)
  let request =
    operations.teams_add_or_update_project_permissions_legacy_request(
      request,
      team_id,
      project_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.teams_add_or_update_project_permissions_legacy_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn teams_check_permissions_for_project_legacy(token, team_id, project_id) {
  let request = base_request(token)
  let request =
    operations.teams_check_permissions_for_project_legacy_request(
      request,
      team_id,
      project_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.teams_check_permissions_for_project_legacy_response(response),
    ),
  )
  t.Done(data)
}

pub fn teams_remove_membership_for_user_legacy(token, team_id, username) {
  let request = base_request(token)
  let request =
    operations.teams_remove_membership_for_user_legacy_request(
      request,
      team_id,
      username,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_remove_membership_for_user_legacy_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn teams_add_or_update_membership_for_user_legacy(
  token,
  team_id,
  username,
  data,
) {
  let request = base_request(token)
  let request =
    operations.teams_add_or_update_membership_for_user_legacy_request(
      request,
      team_id,
      username,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.teams_add_or_update_membership_for_user_legacy_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn teams_get_membership_for_user_legacy(token, team_id, username) {
  let request = base_request(token)
  let request =
    operations.teams_get_membership_for_user_legacy_request(
      request,
      team_id,
      username,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_get_membership_for_user_legacy_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_webhook_delivery(token, owner, repo, hook_id, delivery_id) {
  let request = base_request(token)
  let request =
    operations.repos_get_webhook_delivery_request(
      request,
      owner,
      repo,
      hook_id,
      delivery_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_webhook_delivery_response(response)),
  )
  t.Done(data)
}

pub fn repos_create_commit_comment(token, owner, repo, commit_sha, data) {
  let request = base_request(token)
  let request =
    operations.repos_create_commit_comment_request(
      request,
      owner,
      repo,
      commit_sha,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_commit_comment_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_comments_for_commit(
  token,
  owner,
  repo,
  commit_sha,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_comments_for_commit_request(
      request,
      owner,
      repo,
      commit_sha,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_comments_for_commit_response(response)),
  )
  t.Done(data)
}

pub fn actions_enable_workflow(token, owner, repo, workflow_id) {
  let request = base_request(token)
  let request =
    operations.actions_enable_workflow_request(
      request,
      owner,
      repo,
      workflow_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_enable_workflow_response(response)),
  )
  t.Done(data)
}

pub fn actions_create_remove_token_for_org(token, org) {
  let request = base_request(token)
  let request =
    operations.actions_create_remove_token_for_org_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_create_remove_token_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn users_update_authenticated(token, data) {
  let request = base_request(token)
  let request = operations.users_update_authenticated_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_update_authenticated_response(response)),
  )
  t.Done(data)
}

pub fn users_get_authenticated(token) {
  let request = base_request(token)
  let request = operations.users_get_authenticated_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_get_authenticated_response(response)),
  )
  t.Done(data)
}

pub fn users_set_primary_email_visibility_for_authenticated_user(token, data) {
  let request = base_request(token)
  let request =
    operations.users_set_primary_email_visibility_for_authenticated_user_request(
      request,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.users_set_primary_email_visibility_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_set_github_actions_permissions_repository(
  token,
  owner,
  repo,
  data,
) {
  let request = base_request(token)
  let request =
    operations.actions_set_github_actions_permissions_repository_request(
      request,
      owner,
      repo,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_set_github_actions_permissions_repository_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_get_github_actions_permissions_repository(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.actions_get_github_actions_permissions_repository_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_get_github_actions_permissions_repository_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_re_run_workflow(token, owner, repo, run_id, data) {
  let request = base_request(token)
  let request =
    operations.actions_re_run_workflow_request(
      request,
      owner,
      repo,
      run_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_re_run_workflow_response(response)),
  )
  t.Done(data)
}

pub fn orgs_remove_custom_property(token, org, custom_property_name) {
  let request = base_request(token)
  let request =
    operations.orgs_remove_custom_property_request(
      request,
      org,
      custom_property_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_remove_custom_property_response(response)),
  )
  t.Done(data)
}

pub fn orgs_create_or_update_custom_property(
  token,
  org,
  custom_property_name,
  data,
) {
  let request = base_request(token)
  let request =
    operations.orgs_create_or_update_custom_property_request(
      request,
      org,
      custom_property_name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_create_or_update_custom_property_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn orgs_get_custom_property(token, org, custom_property_name) {
  let request = base_request(token)
  let request =
    operations.orgs_get_custom_property_request(
      request,
      org,
      custom_property_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_get_custom_property_response(response)),
  )
  t.Done(data)
}

pub fn repos_create_fork(token, owner, repo, data) {
  let request = base_request(token)
  let request = operations.repos_create_fork_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_fork_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_forks(
  token,
  owner,
  repo,
  sort sort,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_forks_request(
      request,
      owner,
      repo,
      sort,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_forks_response(response)),
  )
  t.Done(data)
}

pub fn repos_create_org_ruleset(token, org, data) {
  let request = base_request(token)
  let request = operations.repos_create_org_ruleset_request(request, org, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_org_ruleset_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_org_rulesets(
  token,
  org,
  per_page per_page,
  page page,
  targets targets,
) {
  let request = base_request(token)
  let request =
    operations.repos_get_org_rulesets_request(
      request,
      org,
      per_page,
      page,
      targets,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_org_rulesets_response(response)),
  )
  t.Done(data)
}

pub fn users_list(token, since since, per_page per_page) {
  let request = base_request(token)
  let request = operations.users_list_request(request, since, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.users_list_response(response)))
  t.Done(data)
}

pub fn pulls_submit_review(token, owner, repo, pull_number, review_id, data) {
  let request = base_request(token)
  let request =
    operations.pulls_submit_review_request(
      request,
      owner,
      repo,
      pull_number,
      review_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_submit_review_response(response)),
  )
  t.Done(data)
}

pub fn packages_list_packages_for_organization(
  token,
  org,
  package_type package_type,
  visibility visibility,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.packages_list_packages_for_organization_request(
      request,
      org,
      package_type,
      visibility,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.packages_list_packages_for_organization_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_list_repo_secrets(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_repo_secrets_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_list_repo_secrets_response(response)),
  )
  t.Done(data)
}

pub fn actions_create_org_variable(token, org, data) {
  let request = base_request(token)
  let request =
    operations.actions_create_org_variable_request(request, org, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_create_org_variable_response(response)),
  )
  t.Done(data)
}

pub fn actions_list_org_variables(token, org, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.actions_list_org_variables_request(request, org, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_list_org_variables_response(response)),
  )
  t.Done(data)
}

pub fn actions_cancel_workflow_run(token, owner, repo, run_id) {
  let request = base_request(token)
  let request =
    operations.actions_cancel_workflow_run_request(request, owner, repo, run_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_cancel_workflow_run_response(response)),
  )
  t.Done(data)
}

pub fn actions_list_self_hosted_runners_for_repo(
  token,
  owner,
  repo,
  name name,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_self_hosted_runners_for_repo_request(
      request,
      owner,
      repo,
      name,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_list_self_hosted_runners_for_repo_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_participation_stats(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_get_participation_stats_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_participation_stats_response(response)),
  )
  t.Done(data)
}

pub fn actions_update_repo_variable(token, owner, repo, name, data) {
  let request = base_request(token)
  let request =
    operations.actions_update_repo_variable_request(
      request,
      owner,
      repo,
      name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_update_repo_variable_response(response)),
  )
  t.Done(data)
}

pub fn actions_delete_repo_variable(token, owner, repo, name) {
  let request = base_request(token)
  let request =
    operations.actions_delete_repo_variable_request(request, owner, repo, name)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_delete_repo_variable_response(response)),
  )
  t.Done(data)
}

pub fn actions_get_repo_variable(token, owner, repo, name) {
  let request = base_request(token)
  let request =
    operations.actions_get_repo_variable_request(request, owner, repo, name)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_repo_variable_response(response)),
  )
  t.Done(data)
}

pub fn code_scanning_create_variant_analysis(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.code_scanning_create_variant_analysis_request(
      request,
      owner,
      repo,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_scanning_create_variant_analysis_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn activity_mark_notifications_as_read(token, data) {
  let request = base_request(token)
  let request =
    operations.activity_mark_notifications_as_read_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_mark_notifications_as_read_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn activity_list_notifications_for_authenticated_user(
  token,
  all all,
  participating participating,
  since since,
  before before,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.activity_list_notifications_for_authenticated_user_request(
      request,
      all,
      participating,
      since,
      before,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.activity_list_notifications_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_set_workflow_access_to_repository(
  token,
  owner,
  repo,
  actions_workflow_access_to_repository,
) {
  let request = base_request(token)
  let request =
    operations.actions_set_workflow_access_to_repository_request(
      request,
      owner,
      repo,
      actions_workflow_access_to_repository,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_set_workflow_access_to_repository_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_get_workflow_access_to_repository(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.actions_get_workflow_access_to_repository_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_workflow_access_to_repository_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn apps_delete_authorization(token, client_id, data) {
  let request = base_request(token)
  let request =
    operations.apps_delete_authorization_request(request, client_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_delete_authorization_response(response)),
  )
  t.Done(data)
}

pub fn packages_get_all_package_versions_for_package_owned_by_authenticated_user(
  token,
  package_type,
  package_name,
  page page,
  per_page per_page,
  state state,
) {
  let request = base_request(token)
  let request =
    operations.packages_get_all_package_versions_for_package_owned_by_authenticated_user_request(
      request,
      package_type,
      package_name,
      page,
      per_page,
      state,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.packages_get_all_package_versions_for_package_owned_by_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn repos_update_release_asset(token, owner, repo, asset_id, data) {
  let request = base_request(token)
  let request =
    operations.repos_update_release_asset_request(
      request,
      owner,
      repo,
      asset_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_update_release_asset_response(response)),
  )
  t.Done(data)
}

pub fn repos_delete_release_asset(token, owner, repo, asset_id) {
  let request = base_request(token)
  let request =
    operations.repos_delete_release_asset_request(
      request,
      owner,
      repo,
      asset_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_release_asset_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_release_asset(token, owner, repo, asset_id) {
  let request = base_request(token)
  let request =
    operations.repos_get_release_asset_request(request, owner, repo, asset_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_release_asset_response(response)),
  )
  t.Done(data)
}

pub fn issues_list_events(
  token,
  owner,
  repo,
  issue_number,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.issues_list_events_request(
      request,
      owner,
      repo,
      issue_number,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_list_events_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_all_environments(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_get_all_environments_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_all_environments_response(response)),
  )
  t.Done(data)
}

pub fn classroom_get_assignment_grades(token, assignment_id) {
  let request = base_request(token)
  let request =
    operations.classroom_get_assignment_grades_request(request, assignment_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.classroom_get_assignment_grades_response(response)),
  )
  t.Done(data)
}

pub fn actions_set_custom_oidc_sub_claim_for_repo(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.actions_set_custom_oidc_sub_claim_for_repo_request(
      request,
      owner,
      repo,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_set_custom_oidc_sub_claim_for_repo_response(response),
    ),
  )
  t.Done(data)
}

pub fn actions_get_custom_oidc_sub_claim_for_repo(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.actions_get_custom_oidc_sub_claim_for_repo_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_get_custom_oidc_sub_claim_for_repo_response(response),
    ),
  )
  t.Done(data)
}

pub fn repos_create_webhook(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.repos_create_webhook_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_webhook_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_webhooks(token, owner, repo, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.repos_list_webhooks_request(request, owner, repo, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_webhooks_response(response)),
  )
  t.Done(data)
}

pub fn dependabot_get_org_public_key(token, org) {
  let request = base_request(token)
  let request = operations.dependabot_get_org_public_key_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.dependabot_get_org_public_key_response(response)),
  )
  t.Done(data)
}

pub fn code_scanning_update_alert(token, owner, repo, alert_number, data) {
  let request = base_request(token)
  let request =
    operations.code_scanning_update_alert_request(
      request,
      owner,
      repo,
      alert_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_scanning_update_alert_response(response)),
  )
  t.Done(data)
}

pub fn code_scanning_get_alert(token, owner, repo, alert_number) {
  let request = base_request(token)
  let request =
    operations.code_scanning_get_alert_request(
      request,
      owner,
      repo,
      alert_number,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_scanning_get_alert_response(response)),
  )
  t.Done(data)
}

pub fn meta_get_octocat(token, s s) {
  let request = base_request(token)
  let request = operations.meta_get_octocat_request(request, s)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.meta_get_octocat_response(response)),
  )
  t.Done(data)
}

pub fn actions_get_workflow(token, owner, repo, workflow_id) {
  let request = base_request(token)
  let request =
    operations.actions_get_workflow_request(request, owner, repo, workflow_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_workflow_response(response)),
  )
  t.Done(data)
}

pub fn teams_update_discussion_legacy(token, team_id, discussion_number, data) {
  let request = base_request(token)
  let request =
    operations.teams_update_discussion_legacy_request(
      request,
      team_id,
      discussion_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_update_discussion_legacy_response(response)),
  )
  t.Done(data)
}

pub fn teams_delete_discussion_legacy(token, team_id, discussion_number) {
  let request = base_request(token)
  let request =
    operations.teams_delete_discussion_legacy_request(
      request,
      team_id,
      discussion_number,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_delete_discussion_legacy_response(response)),
  )
  t.Done(data)
}

pub fn teams_get_discussion_legacy(token, team_id, discussion_number) {
  let request = base_request(token)
  let request =
    operations.teams_get_discussion_legacy_request(
      request,
      team_id,
      discussion_number,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_get_discussion_legacy_response(response)),
  )
  t.Done(data)
}

pub fn security_advisories_list_org_repository_advisories(
  token,
  org,
  direction direction,
  sort sort,
  before before,
  after after,
  per_page per_page,
  state state,
) {
  let request = base_request(token)
  let request =
    operations.security_advisories_list_org_repository_advisories_request(
      request,
      org,
      direction,
      sort,
      before,
      after,
      per_page,
      state,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.security_advisories_list_org_repository_advisories_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn users_list_public_emails_for_authenticated_user(
  token,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.users_list_public_emails_for_authenticated_user_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.users_list_public_emails_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn teams_list_repos_in_org(
  token,
  org,
  team_slug,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.teams_list_repos_in_org_request(
      request,
      org,
      team_slug,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_list_repos_in_org_response(response)),
  )
  t.Done(data)
}

pub fn orgs_revoke_org_role_user(token, org, username, role_id) {
  let request = base_request(token)
  let request =
    operations.orgs_revoke_org_role_user_request(
      request,
      org,
      username,
      role_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_revoke_org_role_user_response(response)),
  )
  t.Done(data)
}

pub fn orgs_assign_user_to_org_role(token, org, username, role_id) {
  let request = base_request(token)
  let request =
    operations.orgs_assign_user_to_org_role_request(
      request,
      org,
      username,
      role_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_assign_user_to_org_role_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_collaborator_permission_level(token, owner, repo, username) {
  let request = base_request(token)
  let request =
    operations.repos_get_collaborator_permission_level_request(
      request,
      owner,
      repo,
      username,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_collaborator_permission_level_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn orgs_update_pat_access(token, org, pat_id, data) {
  let request = base_request(token)
  let request =
    operations.orgs_update_pat_access_request(request, org, pat_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_update_pat_access_response(response)),
  )
  t.Done(data)
}

pub fn teams_create_discussion_comment_in_org(
  token,
  org,
  team_slug,
  discussion_number,
  data,
) {
  let request = base_request(token)
  let request =
    operations.teams_create_discussion_comment_in_org_request(
      request,
      org,
      team_slug,
      discussion_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_create_discussion_comment_in_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn teams_list_discussion_comments_in_org(
  token,
  org,
  team_slug,
  discussion_number,
  direction direction,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.teams_list_discussion_comments_in_org_request(
      request,
      org,
      team_slug,
      discussion_number,
      direction,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_list_discussion_comments_in_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn reactions_delete_for_issue_comment(
  token,
  owner,
  repo,
  comment_id,
  reaction_id,
) {
  let request = base_request(token)
  let request =
    operations.reactions_delete_for_issue_comment_request(
      request,
      owner,
      repo,
      comment_id,
      reaction_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.reactions_delete_for_issue_comment_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn code_security_create_configuration(token, org, data) {
  let request = base_request(token)
  let request =
    operations.code_security_create_configuration_request(request, org, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_security_create_configuration_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn code_security_get_configurations_for_org(
  token,
  org,
  target_type target_type,
  per_page per_page,
  before before,
  after after,
) {
  let request = base_request(token)
  let request =
    operations.code_security_get_configurations_for_org_request(
      request,
      org,
      target_type,
      per_page,
      before,
      after,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_security_get_configurations_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_delete_self_hosted_runner_from_repo(
  token,
  owner,
  repo,
  runner_id,
) {
  let request = base_request(token)
  let request =
    operations.actions_delete_self_hosted_runner_from_repo_request(
      request,
      owner,
      repo,
      runner_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_delete_self_hosted_runner_from_repo_response(response),
    ),
  )
  t.Done(data)
}

pub fn actions_get_self_hosted_runner_for_repo(token, owner, repo, runner_id) {
  let request = base_request(token)
  let request =
    operations.actions_get_self_hosted_runner_for_repo_request(
      request,
      owner,
      repo,
      runner_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_self_hosted_runner_for_repo_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_delete_artifact(token, owner, repo, artifact_id) {
  let request = base_request(token)
  let request =
    operations.actions_delete_artifact_request(
      request,
      owner,
      repo,
      artifact_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_delete_artifact_response(response)),
  )
  t.Done(data)
}

pub fn actions_get_artifact(token, owner, repo, artifact_id) {
  let request = base_request(token)
  let request =
    operations.actions_get_artifact_request(request, owner, repo, artifact_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_artifact_response(response)),
  )
  t.Done(data)
}

pub fn repos_delete_repo_ruleset(token, owner, repo, ruleset_id) {
  let request = base_request(token)
  let request =
    operations.repos_delete_repo_ruleset_request(
      request,
      owner,
      repo,
      ruleset_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_repo_ruleset_response(response)),
  )
  t.Done(data)
}

pub fn repos_update_repo_ruleset(token, owner, repo, ruleset_id, data) {
  let request = base_request(token)
  let request =
    operations.repos_update_repo_ruleset_request(
      request,
      owner,
      repo,
      ruleset_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_update_repo_ruleset_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_repo_ruleset(
  token,
  owner,
  repo,
  ruleset_id,
  includes_parents includes_parents,
) {
  let request = base_request(token)
  let request =
    operations.repos_get_repo_ruleset_request(
      request,
      owner,
      repo,
      ruleset_id,
      includes_parents,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_repo_ruleset_response(response)),
  )
  t.Done(data)
}

pub fn repos_upload_release_asset(
  token,
  owner,
  repo,
  release_id,
  name name,
  label label,
) {
  let request = base_request(token)
  let request =
    operations.repos_upload_release_asset_request(
      request,
      owner,
      repo,
      release_id,
      name,
      label,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_upload_release_asset_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_release_assets(
  token,
  owner,
  repo,
  release_id,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_release_assets_request(
      request,
      owner,
      repo,
      release_id,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_release_assets_response(response)),
  )
  t.Done(data)
}

pub fn reactions_create_for_team_discussion_comment_legacy(
  token,
  team_id,
  discussion_number,
  comment_number,
  data,
) {
  let request = base_request(token)
  let request =
    operations.reactions_create_for_team_discussion_comment_legacy_request(
      request,
      team_id,
      discussion_number,
      comment_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.reactions_create_for_team_discussion_comment_legacy_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn reactions_list_for_team_discussion_comment_legacy(
  token,
  team_id,
  discussion_number,
  comment_number,
  content content,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.reactions_list_for_team_discussion_comment_legacy_request(
      request,
      team_id,
      discussion_number,
      comment_number,
      content,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.reactions_list_for_team_discussion_comment_legacy_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn checks_create_suite(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.checks_create_suite_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.checks_create_suite_response(response)),
  )
  t.Done(data)
}

pub fn dependency_graph_export_sbom(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.dependency_graph_export_sbom_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.dependency_graph_export_sbom_response(response)),
  )
  t.Done(data)
}

pub fn repos_update(token, owner, repo, data) {
  let request = base_request(token)
  let request = operations.repos_update_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.repos_update_response(response)))
  t.Done(data)
}

pub fn repos_delete(token, owner, repo) {
  let request = base_request(token)
  let request = operations.repos_delete_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.repos_delete_response(response)))
  t.Done(data)
}

pub fn repos_get(token, owner, repo) {
  let request = base_request(token)
  let request = operations.repos_get_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.repos_get_response(response)))
  t.Done(data)
}

pub fn repos_list_public(token, since since) {
  let request = base_request(token)
  let request = operations.repos_list_public_request(request, since)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_public_response(response)),
  )
  t.Done(data)
}

pub fn search_labels(
  token,
  repository_id repository_id,
  q q,
  sort sort,
  order order,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.search_labels_request(
      request,
      repository_id,
      q,
      sort,
      order,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.search_labels_response(response)))
  t.Done(data)
}

pub fn actions_list_artifacts_for_repo(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
  name name,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_artifacts_for_repo_request(
      request,
      owner,
      repo,
      per_page,
      page,
      name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_list_artifacts_for_repo_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_webhook_deliveries(
  token,
  owner,
  repo,
  hook_id,
  per_page per_page,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_webhook_deliveries_request(
      request,
      owner,
      repo,
      hook_id,
      per_page,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_webhook_deliveries_response(response)),
  )
  t.Done(data)
}

pub fn issues_create_label(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.issues_create_label_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_create_label_response(response)),
  )
  t.Done(data)
}

pub fn issues_list_labels_for_repo(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.issues_list_labels_for_repo_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_list_labels_for_repo_response(response)),
  )
  t.Done(data)
}

pub fn gists_list_public(token, since since, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.gists_list_public_request(request, since, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.gists_list_public_response(response)),
  )
  t.Done(data)
}

pub fn markdown_render_raw(token) {
  let request = base_request(token)
  let request = operations.markdown_render_raw_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.markdown_render_raw_response(response)),
  )
  t.Done(data)
}

pub fn orgs_revoke_org_role_team(token, org, team_slug, role_id) {
  let request = base_request(token)
  let request =
    operations.orgs_revoke_org_role_team_request(
      request,
      org,
      team_slug,
      role_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_revoke_org_role_team_response(response)),
  )
  t.Done(data)
}

pub fn orgs_assign_team_to_org_role(token, org, team_slug, role_id) {
  let request = base_request(token)
  let request =
    operations.orgs_assign_team_to_org_role_request(
      request,
      org,
      team_slug,
      role_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_assign_team_to_org_role_response(response)),
  )
  t.Done(data)
}

pub fn repos_create_tag_protection(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.repos_create_tag_protection_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_tag_protection_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_tag_protection(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_list_tag_protection_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_tag_protection_response(response)),
  )
  t.Done(data)
}

pub fn orgs_update_webhook(token, org, hook_id, data) {
  let request = base_request(token)
  let request =
    operations.orgs_update_webhook_request(request, org, hook_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_update_webhook_response(response)),
  )
  t.Done(data)
}

pub fn orgs_delete_webhook(token, org, hook_id) {
  let request = base_request(token)
  let request = operations.orgs_delete_webhook_request(request, org, hook_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_delete_webhook_response(response)),
  )
  t.Done(data)
}

pub fn orgs_get_webhook(token, org, hook_id) {
  let request = base_request(token)
  let request = operations.orgs_get_webhook_request(request, org, hook_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_get_webhook_response(response)),
  )
  t.Done(data)
}

pub fn projects_remove_collaborator(token, project_id, username) {
  let request = base_request(token)
  let request =
    operations.projects_remove_collaborator_request(
      request,
      project_id,
      username,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_remove_collaborator_response(response)),
  )
  t.Done(data)
}

pub fn projects_add_collaborator(token, project_id, username, data) {
  let request = base_request(token)
  let request =
    operations.projects_add_collaborator_request(
      request,
      project_id,
      username,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_add_collaborator_response(response)),
  )
  t.Done(data)
}

pub fn code_scanning_list_recent_analyses(
  token,
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
  let request = base_request(token)
  let request =
    operations.code_scanning_list_recent_analyses_request(
      request,
      owner,
      repo,
      tool_name,
      tool_guid,
      page,
      per_page,
      pr,
      ref,
      sarif_id,
      direction,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_scanning_list_recent_analyses_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn dependabot_set_selected_repos_for_org_secret(
  token,
  org,
  secret_name,
  data,
) {
  let request = base_request(token)
  let request =
    operations.dependabot_set_selected_repos_for_org_secret_request(
      request,
      org,
      secret_name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.dependabot_set_selected_repos_for_org_secret_response(response),
    ),
  )
  t.Done(data)
}

pub fn dependabot_list_selected_repos_for_org_secret(
  token,
  org,
  secret_name,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.dependabot_list_selected_repos_for_org_secret_request(
      request,
      org,
      secret_name,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.dependabot_list_selected_repos_for_org_secret_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn repos_get_org_rule_suites(
  token,
  org,
  ref ref,
  repository_name repository_name,
  time_period time_period,
  actor_name actor_name,
  rule_suite_result rule_suite_result,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_get_org_rule_suites_request(
      request,
      org,
      ref,
      repository_name,
      time_period,
      actor_name,
      rule_suite_result,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_org_rule_suites_response(response)),
  )
  t.Done(data)
}

pub fn pulls_create(token, owner, repo, data) {
  let request = base_request(token)
  let request = operations.pulls_create_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.pulls_create_response(response)))
  t.Done(data)
}

pub fn pulls_list(
  token,
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
  let request = base_request(token)
  let request =
    operations.pulls_list_request(
      request,
      owner,
      repo,
      state,
      head,
      base_,
      sort,
      direction,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.pulls_list_response(response)))
  t.Done(data)
}

pub fn orgs_list_memberships_for_authenticated_user(
  token,
  state state,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.orgs_list_memberships_for_authenticated_user_request(
      request,
      state,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.orgs_list_memberships_for_authenticated_user_response(response),
    ),
  )
  t.Done(data)
}

pub fn issues_list_events_for_repo(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.issues_list_events_for_repo_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_list_events_for_repo_response(response)),
  )
  t.Done(data)
}

pub fn apps_reset_token(token, client_id, data) {
  let request = base_request(token)
  let request = operations.apps_reset_token_request(request, client_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_reset_token_response(response)),
  )
  t.Done(data)
}

pub fn apps_delete_token(token, client_id, data) {
  let request = base_request(token)
  let request = operations.apps_delete_token_request(request, client_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_delete_token_response(response)),
  )
  t.Done(data)
}

pub fn apps_check_token(token, client_id, data) {
  let request = base_request(token)
  let request = operations.apps_check_token_request(request, client_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_check_token_response(response)),
  )
  t.Done(data)
}

pub fn actions_list_environment_secrets(
  token,
  owner,
  repo,
  environment_name,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_environment_secrets_request(
      request,
      owner,
      repo,
      environment_name,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_list_environment_secrets_response(response)),
  )
  t.Done(data)
}

pub fn actions_get_actions_cache_usage_for_org(token, org) {
  let request = base_request(token)
  let request =
    operations.actions_get_actions_cache_usage_for_org_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_actions_cache_usage_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn migrations_get_commit_authors(token, owner, repo, since since) {
  let request = base_request(token)
  let request =
    operations.migrations_get_commit_authors_request(
      request,
      owner,
      repo,
      since,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.migrations_get_commit_authors_response(response)),
  )
  t.Done(data)
}

pub fn actions_remove_all_custom_labels_from_self_hosted_runner_for_repo(
  token,
  owner,
  repo,
  runner_id,
) {
  let request = base_request(token)
  let request =
    operations.actions_remove_all_custom_labels_from_self_hosted_runner_for_repo_request(
      request,
      owner,
      repo,
      runner_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_remove_all_custom_labels_from_self_hosted_runner_for_repo_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_add_custom_labels_to_self_hosted_runner_for_repo(
  token,
  owner,
  repo,
  runner_id,
  data,
) {
  let request = base_request(token)
  let request =
    operations.actions_add_custom_labels_to_self_hosted_runner_for_repo_request(
      request,
      owner,
      repo,
      runner_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_add_custom_labels_to_self_hosted_runner_for_repo_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_set_custom_labels_for_self_hosted_runner_for_repo(
  token,
  owner,
  repo,
  runner_id,
  data,
) {
  let request = base_request(token)
  let request =
    operations.actions_set_custom_labels_for_self_hosted_runner_for_repo_request(
      request,
      owner,
      repo,
      runner_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_set_custom_labels_for_self_hosted_runner_for_repo_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_list_labels_for_self_hosted_runner_for_repo(
  token,
  owner,
  repo,
  runner_id,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_labels_for_self_hosted_runner_for_repo_request(
      request,
      owner,
      repo,
      runner_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_list_labels_for_self_hosted_runner_for_repo_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn teams_list_projects_legacy(token, team_id, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.teams_list_projects_legacy_request(
      request,
      team_id,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_list_projects_legacy_response(response)),
  )
  t.Done(data)
}

pub fn orgs_cancel_invitation(token, org, invitation_id) {
  let request = base_request(token)
  let request =
    operations.orgs_cancel_invitation_request(request, org, invitation_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_cancel_invitation_response(response)),
  )
  t.Done(data)
}

pub fn copilot_copilot_metrics_for_team(
  token,
  org,
  team_slug,
  since since,
  until until,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.copilot_copilot_metrics_for_team_request(
      request,
      org,
      team_slug,
      since,
      until,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.copilot_copilot_metrics_for_team_response(response)),
  )
  t.Done(data)
}

pub fn repos_create_deployment(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.repos_create_deployment_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_deployment_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_deployments(
  token,
  owner,
  repo,
  sha sha,
  ref ref,
  task task,
  environment environment,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_deployments_request(
      request,
      owner,
      repo,
      sha,
      ref,
      task,
      environment,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_deployments_response(response)),
  )
  t.Done(data)
}

pub fn issues_check_user_can_be_assigned(token, owner, repo, assignee) {
  let request = base_request(token)
  let request =
    operations.issues_check_user_can_be_assigned_request(
      request,
      owner,
      repo,
      assignee,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_check_user_can_be_assigned_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn secret_scanning_update_alert(token, owner, repo, alert_number, data) {
  let request = base_request(token)
  let request =
    operations.secret_scanning_update_alert_request(
      request,
      owner,
      repo,
      alert_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.secret_scanning_update_alert_response(response)),
  )
  t.Done(data)
}

pub fn secret_scanning_get_alert(token, owner, repo, alert_number) {
  let request = base_request(token)
  let request =
    operations.secret_scanning_get_alert_request(
      request,
      owner,
      repo,
      alert_number,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.secret_scanning_get_alert_response(response)),
  )
  t.Done(data)
}

pub fn actions_list_jobs_for_workflow_run(
  token,
  owner,
  repo,
  run_id,
  filter filter,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_jobs_for_workflow_run_request(
      request,
      owner,
      repo,
      run_id,
      filter,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_list_jobs_for_workflow_run_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_list_commit_statuses_for_ref(
  token,
  owner,
  repo,
  ref,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_commit_statuses_for_ref_request(
      request,
      owner,
      repo,
      ref,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_commit_statuses_for_ref_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_codeowners_errors(token, owner, repo, ref ref) {
  let request = base_request(token)
  let request =
    operations.repos_codeowners_errors_request(request, owner, repo, ref)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_codeowners_errors_response(response)),
  )
  t.Done(data)
}

pub fn code_security_update_configuration(token, org, configuration_id, data) {
  let request = base_request(token)
  let request =
    operations.code_security_update_configuration_request(
      request,
      org,
      configuration_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_security_update_configuration_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn code_security_delete_configuration(token, org, configuration_id) {
  let request = base_request(token)
  let request =
    operations.code_security_delete_configuration_request(
      request,
      org,
      configuration_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_security_delete_configuration_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn code_security_get_configuration(token, org, configuration_id) {
  let request = base_request(token)
  let request =
    operations.code_security_get_configuration_request(
      request,
      org,
      configuration_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_security_get_configuration_response(response)),
  )
  t.Done(data)
}

pub fn codespaces_delete_repo_secret(token, owner, repo, secret_name) {
  let request = base_request(token)
  let request =
    operations.codespaces_delete_repo_secret_request(
      request,
      owner,
      repo,
      secret_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_delete_repo_secret_response(response)),
  )
  t.Done(data)
}

pub fn codespaces_create_or_update_repo_secret(
  token,
  owner,
  repo,
  secret_name,
  data,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_create_or_update_repo_secret_request(
      request,
      owner,
      repo,
      secret_name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_create_or_update_repo_secret_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn codespaces_get_repo_secret(token, owner, repo, secret_name) {
  let request = base_request(token)
  let request =
    operations.codespaces_get_repo_secret_request(
      request,
      owner,
      repo,
      secret_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_get_repo_secret_response(response)),
  )
  t.Done(data)
}

pub fn repos_delete_access_restrictions(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_delete_access_restrictions_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_access_restrictions_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_access_restrictions(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_get_access_restrictions_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_access_restrictions_response(response)),
  )
  t.Done(data)
}

pub fn repos_create_commit_status(token, owner, repo, sha, data) {
  let request = base_request(token)
  let request =
    operations.repos_create_commit_status_request(
      request,
      owner,
      repo,
      sha,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_commit_status_response(response)),
  )
  t.Done(data)
}

pub fn reactions_create_for_release(token, owner, repo, release_id, data) {
  let request = base_request(token)
  let request =
    operations.reactions_create_for_release_request(
      request,
      owner,
      repo,
      release_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.reactions_create_for_release_response(response)),
  )
  t.Done(data)
}

pub fn reactions_list_for_release(
  token,
  owner,
  repo,
  release_id,
  content content,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.reactions_list_for_release_request(
      request,
      owner,
      repo,
      release_id,
      content,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.reactions_list_for_release_response(response)),
  )
  t.Done(data)
}

pub fn gists_fork(token, gist_id) {
  let request = base_request(token)
  let request = operations.gists_fork_request(request, gist_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.gists_fork_response(response)))
  t.Done(data)
}

pub fn gists_list_forks(token, gist_id, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.gists_list_forks_request(request, gist_id, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.gists_list_forks_response(response)),
  )
  t.Done(data)
}

pub fn copilot_cancel_copilot_seat_assignment_for_teams(token, org, data) {
  let request = base_request(token)
  let request =
    operations.copilot_cancel_copilot_seat_assignment_for_teams_request(
      request,
      org,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.copilot_cancel_copilot_seat_assignment_for_teams_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn copilot_add_copilot_seats_for_teams(token, org, data) {
  let request = base_request(token)
  let request =
    operations.copilot_add_copilot_seats_for_teams_request(request, org, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.copilot_add_copilot_seats_for_teams_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn projects_create_column(token, project_id, data) {
  let request = base_request(token)
  let request =
    operations.projects_create_column_request(request, project_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_create_column_response(response)),
  )
  t.Done(data)
}

pub fn projects_list_columns(token, project_id, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.projects_list_columns_request(
      request,
      project_id,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_list_columns_response(response)),
  )
  t.Done(data)
}

pub fn copilot_list_copilot_seats_for_enterprise(
  token,
  enterprise,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.copilot_list_copilot_seats_for_enterprise_request(
      request,
      enterprise,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.copilot_list_copilot_seats_for_enterprise_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn git_create_ref(token, owner, repo, data) {
  let request = base_request(token)
  let request = operations.git_create_ref_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.git_create_ref_response(response)))
  t.Done(data)
}

pub fn checks_list_suites_for_ref(
  token,
  owner,
  repo,
  ref,
  app_id app_id,
  check_name check_name,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.checks_list_suites_for_ref_request(
      request,
      owner,
      repo,
      ref,
      app_id,
      check_name,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.checks_list_suites_for_ref_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_collaborators(
  token,
  owner,
  repo,
  affiliation affiliation,
  permission permission,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_collaborators_request(
      request,
      owner,
      repo,
      affiliation,
      permission,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_collaborators_response(response)),
  )
  t.Done(data)
}

pub fn repos_create_in_org(token, org, data) {
  let request = base_request(token)
  let request = operations.repos_create_in_org_request(request, org, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_in_org_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_for_org(
  token,
  org,
  type_ type_,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_for_org_request(
      request,
      org,
      type_,
      sort,
      direction,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_for_org_response(response)),
  )
  t.Done(data)
}

pub fn packages_delete_package_version_for_user(
  token,
  username,
  package_type,
  package_name,
  package_version_id,
) {
  let request = base_request(token)
  let request =
    operations.packages_delete_package_version_for_user_request(
      request,
      username,
      package_type,
      package_name,
      package_version_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.packages_delete_package_version_for_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn packages_get_package_version_for_user(
  token,
  username,
  package_type,
  package_name,
  package_version_id,
) {
  let request = base_request(token)
  let request =
    operations.packages_get_package_version_for_user_request(
      request,
      username,
      package_type,
      package_name,
      package_version_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.packages_get_package_version_for_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_list_runner_applications_for_repo(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.actions_list_runner_applications_for_repo_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_list_runner_applications_for_repo_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn activity_delete_repo_subscription(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.activity_delete_repo_subscription_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_delete_repo_subscription_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn activity_set_repo_subscription(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.activity_set_repo_subscription_request(
      request,
      owner,
      repo,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_set_repo_subscription_response(response)),
  )
  t.Done(data)
}

pub fn activity_get_repo_subscription(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.activity_get_repo_subscription_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_get_repo_subscription_response(response)),
  )
  t.Done(data)
}

pub fn actions_generate_runner_jitconfig_for_repo(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.actions_generate_runner_jitconfig_for_repo_request(
      request,
      owner,
      repo,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_generate_runner_jitconfig_for_repo_response(response),
    ),
  )
  t.Done(data)
}

pub fn copilot_copilot_metrics_for_organization(
  token,
  org,
  since since,
  until until,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.copilot_copilot_metrics_for_organization_request(
      request,
      org,
      since,
      until,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.copilot_copilot_metrics_for_organization_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn pulls_list_comments_for_review(
  token,
  owner,
  repo,
  pull_number,
  review_id,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.pulls_list_comments_for_review_request(
      request,
      owner,
      repo,
      pull_number,
      review_id,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_list_comments_for_review_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_for_user(
  token,
  username,
  type_ type_,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_for_user_request(
      request,
      username,
      type_,
      sort,
      direction,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_for_user_response(response)),
  )
  t.Done(data)
}

pub fn orgs_get_org_role(token, org, role_id) {
  let request = base_request(token)
  let request = operations.orgs_get_org_role_request(request, org, role_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_get_org_role_response(response)),
  )
  t.Done(data)
}

pub fn actions_get_environment_public_key(token, owner, repo, environment_name) {
  let request = base_request(token)
  let request =
    operations.actions_get_environment_public_key_request(
      request,
      owner,
      repo,
      environment_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_environment_public_key_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn packages_delete_package_version_for_org(
  token,
  org,
  package_type,
  package_name,
  package_version_id,
) {
  let request = base_request(token)
  let request =
    operations.packages_delete_package_version_for_org_request(
      request,
      org,
      package_type,
      package_name,
      package_version_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.packages_delete_package_version_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn packages_get_package_version_for_organization(
  token,
  org,
  package_type,
  package_name,
  package_version_id,
) {
  let request = base_request(token)
  let request =
    operations.packages_get_package_version_for_organization_request(
      request,
      org,
      package_type,
      package_name,
      package_version_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.packages_get_package_version_for_organization_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn packages_restore_package_version_for_user(
  token,
  username,
  package_type,
  package_name,
  package_version_id,
) {
  let request = base_request(token)
  let request =
    operations.packages_restore_package_version_for_user_request(
      request,
      username,
      package_type,
      package_name,
      package_version_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.packages_restore_package_version_for_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn meta_get(token) {
  let request = base_request(token)
  let request = operations.meta_get_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.meta_get_response(response)))
  t.Done(data)
}

pub fn migrations_get_status_for_org(token, org, migration_id, exclude exclude) {
  let request = base_request(token)
  let request =
    operations.migrations_get_status_for_org_request(
      request,
      org,
      migration_id,
      exclude,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.migrations_get_status_for_org_response(response)),
  )
  t.Done(data)
}

pub fn git_get_ref(token, owner, repo, ref) {
  let request = base_request(token)
  let request = operations.git_get_ref_request(request, owner, repo, ref)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.git_get_ref_response(response)))
  t.Done(data)
}

pub fn api_insights_get_user_stats(
  token,
  org,
  user_id,
  min_timestamp min_timestamp,
  max_timestamp max_timestamp,
  page page,
  per_page per_page,
  direction direction,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.api_insights_get_user_stats_request(
      request,
      org,
      user_id,
      min_timestamp,
      max_timestamp,
      page,
      per_page,
      direction,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_insights_get_user_stats_response(response)),
  )
  t.Done(data)
}

pub fn actions_get_job_for_workflow_run(token, owner, repo, job_id) {
  let request = base_request(token)
  let request =
    operations.actions_get_job_for_workflow_run_request(
      request,
      owner,
      repo,
      job_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_job_for_workflow_run_response(response)),
  )
  t.Done(data)
}

pub fn actions_set_github_actions_default_workflow_permissions_repository(
  token,
  owner,
  repo,
  actions_set_default_workflow_permissions,
) {
  let request = base_request(token)
  let request =
    operations.actions_set_github_actions_default_workflow_permissions_repository_request(
      request,
      owner,
      repo,
      actions_set_default_workflow_permissions,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_set_github_actions_default_workflow_permissions_repository_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_get_github_actions_default_workflow_permissions_repository(
  token,
  owner,
  repo,
) {
  let request = base_request(token)
  let request =
    operations.actions_get_github_actions_default_workflow_permissions_repository_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_get_github_actions_default_workflow_permissions_repository_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn copilot_usage_metrics_for_team(
  token,
  org,
  team_slug,
  since since,
  until until,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.copilot_usage_metrics_for_team_request(
      request,
      org,
      team_slug,
      since,
      until,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.copilot_usage_metrics_for_team_response(response)),
  )
  t.Done(data)
}

pub fn orgs_remove_outside_collaborator(token, org, username) {
  let request = base_request(token)
  let request =
    operations.orgs_remove_outside_collaborator_request(request, org, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_remove_outside_collaborator_response(response)),
  )
  t.Done(data)
}

pub fn orgs_convert_member_to_outside_collaborator(token, org, username, data) {
  let request = base_request(token)
  let request =
    operations.orgs_convert_member_to_outside_collaborator_request(
      request,
      org,
      username,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.orgs_convert_member_to_outside_collaborator_response(response),
    ),
  )
  t.Done(data)
}

pub fn actions_set_allowed_actions_organization(token, org, selected_actions) {
  let request = base_request(token)
  let request =
    operations.actions_set_allowed_actions_organization_request(
      request,
      org,
      selected_actions,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_set_allowed_actions_organization_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_get_allowed_actions_organization(token, org) {
  let request = base_request(token)
  let request =
    operations.actions_get_allowed_actions_organization_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_allowed_actions_organization_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_delete_org_secret(token, org, secret_name) {
  let request = base_request(token)
  let request =
    operations.actions_delete_org_secret_request(request, org, secret_name)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_delete_org_secret_response(response)),
  )
  t.Done(data)
}

pub fn actions_create_or_update_org_secret(token, org, secret_name, data) {
  let request = base_request(token)
  let request =
    operations.actions_create_or_update_org_secret_request(
      request,
      org,
      secret_name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_create_or_update_org_secret_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_get_org_secret(token, org, secret_name) {
  let request = base_request(token)
  let request =
    operations.actions_get_org_secret_request(request, org, secret_name)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_org_secret_response(response)),
  )
  t.Done(data)
}

pub fn repos_generate_release_notes(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.repos_generate_release_notes_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_generate_release_notes_response(response)),
  )
  t.Done(data)
}

pub fn actions_list_jobs_for_workflow_run_attempt(
  token,
  owner,
  repo,
  run_id,
  attempt_number,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_jobs_for_workflow_run_attempt_request(
      request,
      owner,
      repo,
      run_id,
      attempt_number,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_list_jobs_for_workflow_run_attempt_response(response),
    ),
  )
  t.Done(data)
}

pub fn repos_get_top_referrers(token, owner, repo) {
  let request = base_request(token)
  let request = operations.repos_get_top_referrers_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_top_referrers_response(response)),
  )
  t.Done(data)
}

pub fn users_check_following_for_user(token, username, target_user) {
  let request = base_request(token)
  let request =
    operations.users_check_following_for_user_request(
      request,
      username,
      target_user,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_check_following_for_user_response(response)),
  )
  t.Done(data)
}

pub fn apps_get_subscription_plan_for_account_stubbed(token, account_id) {
  let request = base_request(token)
  let request =
    operations.apps_get_subscription_plan_for_account_stubbed_request(
      request,
      account_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.apps_get_subscription_plan_for_account_stubbed_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn meta_get_zen(token) {
  let request = base_request(token)
  let request = operations.meta_get_zen_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.meta_get_zen_response(response)))
  t.Done(data)
}

pub fn gists_update(token, gist_id, data) {
  let request = base_request(token)
  let request = operations.gists_update_request(request, gist_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.gists_update_response(response)))
  t.Done(data)
}

pub fn gists_delete(token, gist_id) {
  let request = base_request(token)
  let request = operations.gists_delete_request(request, gist_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.gists_delete_response(response)))
  t.Done(data)
}

pub fn gists_get(token, gist_id) {
  let request = base_request(token)
  let request = operations.gists_get_request(request, gist_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.gists_get_response(response)))
  t.Done(data)
}

pub fn packages_restore_package_version_for_org(
  token,
  org,
  package_type,
  package_name,
  package_version_id,
) {
  let request = base_request(token)
  let request =
    operations.packages_restore_package_version_for_org_request(
      request,
      org,
      package_type,
      package_name,
      package_version_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.packages_restore_package_version_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_create_self_hosted_runner_group_for_org(token, org, data) {
  let request = base_request(token)
  let request =
    operations.actions_create_self_hosted_runner_group_for_org_request(
      request,
      org,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_create_self_hosted_runner_group_for_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_list_self_hosted_runner_groups_for_org(
  token,
  org,
  per_page per_page,
  page page,
  visible_to_repository visible_to_repository,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_self_hosted_runner_groups_for_org_request(
      request,
      org,
      per_page,
      page,
      visible_to_repository,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_list_self_hosted_runner_groups_for_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn activity_list_watchers_for_repo(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.activity_list_watchers_for_repo_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_list_watchers_for_repo_response(response)),
  )
  t.Done(data)
}

pub fn actions_list_repo_organization_secrets(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_repo_organization_secrets_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_list_repo_organization_secrets_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn teams_update_legacy(token, team_id, data) {
  let request = base_request(token)
  let request = operations.teams_update_legacy_request(request, team_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_update_legacy_response(response)),
  )
  t.Done(data)
}

pub fn teams_delete_legacy(token, team_id) {
  let request = base_request(token)
  let request = operations.teams_delete_legacy_request(request, team_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_delete_legacy_response(response)),
  )
  t.Done(data)
}

pub fn teams_get_legacy(token, team_id) {
  let request = base_request(token)
  let request = operations.teams_get_legacy_request(request, team_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_get_legacy_response(response)),
  )
  t.Done(data)
}

pub fn activity_list_public_events_for_repo_network(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.activity_list_public_events_for_repo_network_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.activity_list_public_events_for_repo_network_response(response),
    ),
  )
  t.Done(data)
}

pub fn checks_rerequest_run(token, owner, repo, check_run_id) {
  let request = base_request(token)
  let request =
    operations.checks_rerequest_run_request(request, owner, repo, check_run_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.checks_rerequest_run_response(response)),
  )
  t.Done(data)
}

pub fn classroom_get_an_assignment(token, assignment_id) {
  let request = base_request(token)
  let request =
    operations.classroom_get_an_assignment_request(request, assignment_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.classroom_get_an_assignment_response(response)),
  )
  t.Done(data)
}

pub fn issues_create_comment(token, owner, repo, issue_number, data) {
  let request = base_request(token)
  let request =
    operations.issues_create_comment_request(
      request,
      owner,
      repo,
      issue_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_create_comment_response(response)),
  )
  t.Done(data)
}

pub fn issues_list_comments(
  token,
  owner,
  repo,
  issue_number,
  since since,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.issues_list_comments_request(
      request,
      owner,
      repo,
      issue_number,
      since,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_list_comments_response(response)),
  )
  t.Done(data)
}

pub fn pulls_update_branch(token, owner, repo, pull_number, data) {
  let request = base_request(token)
  let request =
    operations.pulls_update_branch_request(
      request,
      owner,
      repo,
      pull_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_update_branch_response(response)),
  )
  t.Done(data)
}

pub fn repos_compare_commits(
  token,
  owner,
  repo,
  basehead,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.repos_compare_commits_request(
      request,
      owner,
      repo,
      basehead,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_compare_commits_response(response)),
  )
  t.Done(data)
}

pub fn reactions_create_for_team_discussion_legacy(
  token,
  team_id,
  discussion_number,
  data,
) {
  let request = base_request(token)
  let request =
    operations.reactions_create_for_team_discussion_legacy_request(
      request,
      team_id,
      discussion_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.reactions_create_for_team_discussion_legacy_response(response),
    ),
  )
  t.Done(data)
}

pub fn reactions_list_for_team_discussion_legacy(
  token,
  team_id,
  discussion_number,
  content content,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.reactions_list_for_team_discussion_legacy_request(
      request,
      team_id,
      discussion_number,
      content,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.reactions_list_for_team_discussion_legacy_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_merge(token, owner, repo, data) {
  let request = base_request(token)
  let request = operations.repos_merge_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.repos_merge_response(response)))
  t.Done(data)
}

pub fn apps_revoke_installation_access_token(token) {
  let request = base_request(token)
  let request =
    operations.apps_revoke_installation_access_token_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_revoke_installation_access_token_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn orgs_revoke_all_org_roles_user(token, org, username) {
  let request = base_request(token)
  let request =
    operations.orgs_revoke_all_org_roles_user_request(request, org, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_revoke_all_org_roles_user_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_release_by_tag(token, owner, repo, tag) {
  let request = base_request(token)
  let request =
    operations.repos_get_release_by_tag_request(request, owner, repo, tag)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_release_by_tag_response(response)),
  )
  t.Done(data)
}

pub fn dependabot_list_org_secrets(token, org, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.dependabot_list_org_secrets_request(request, org, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.dependabot_list_org_secrets_response(response)),
  )
  t.Done(data)
}

pub fn issues_create(token, owner, repo, data) {
  let request = base_request(token)
  let request = operations.issues_create_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.issues_create_response(response)))
  t.Done(data)
}

pub fn issues_list_for_repo(
  token,
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
  let request = base_request(token)
  let request =
    operations.issues_list_for_repo_request(
      request,
      owner,
      repo,
      milestone,
      state,
      assignee,
      creator,
      mentioned,
      labels,
      sort,
      direction,
      since,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_list_for_repo_response(response)),
  )
  t.Done(data)
}

pub fn projects_create_for_repo(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.projects_create_for_repo_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_create_for_repo_response(response)),
  )
  t.Done(data)
}

pub fn projects_list_for_repo(
  token,
  owner,
  repo,
  state state,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.projects_list_for_repo_request(
      request,
      owner,
      repo,
      state,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_list_for_repo_response(response)),
  )
  t.Done(data)
}

pub fn apps_get_authenticated(token) {
  let request = base_request(token)
  let request = operations.apps_get_authenticated_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_get_authenticated_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_latest_release(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_get_latest_release_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_latest_release_response(response)),
  )
  t.Done(data)
}

pub fn users_list_ssh_signing_keys_for_user(
  token,
  username,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.users_list_ssh_signing_keys_for_user_request(
      request,
      username,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_list_ssh_signing_keys_for_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_create_autolink(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.repos_create_autolink_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_autolink_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_autolinks(token, owner, repo) {
  let request = base_request(token)
  let request = operations.repos_list_autolinks_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_autolinks_response(response)),
  )
  t.Done(data)
}

pub fn orgs_enable_or_disable_security_product_on_all_org_repos(
  token,
  org,
  security_product,
  enablement,
  data,
) {
  let request = base_request(token)
  let request =
    operations.orgs_enable_or_disable_security_product_on_all_org_repos_request(
      request,
      org,
      security_product,
      enablement,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.orgs_enable_or_disable_security_product_on_all_org_repos_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn codespaces_delete_secret_for_authenticated_user(token, secret_name) {
  let request = base_request(token)
  let request =
    operations.codespaces_delete_secret_for_authenticated_user_request(
      request,
      secret_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_delete_secret_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn codespaces_create_or_update_secret_for_authenticated_user(
  token,
  secret_name,
  data,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_create_or_update_secret_for_authenticated_user_request(
      request,
      secret_name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_create_or_update_secret_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn codespaces_get_secret_for_authenticated_user(token, secret_name) {
  let request = base_request(token)
  let request =
    operations.codespaces_get_secret_for_authenticated_user_request(
      request,
      secret_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_get_secret_for_authenticated_user_response(response),
    ),
  )
  t.Done(data)
}

pub fn orgs_list_blocked_users(token, org, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.orgs_list_blocked_users_request(request, org, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_blocked_users_response(response)),
  )
  t.Done(data)
}

pub fn dependabot_list_alerts_for_enterprise(
  token,
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
  let request = base_request(token)
  let request =
    operations.dependabot_list_alerts_for_enterprise_request(
      request,
      enterprise,
      state,
      severity,
      ecosystem,
      package,
      scope,
      sort,
      direction,
      before,
      after,
      first,
      last,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.dependabot_list_alerts_for_enterprise_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn activity_list_public_events_for_user(
  token,
  username,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.activity_list_public_events_for_user_request(
      request,
      username,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_list_public_events_for_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn codespaces_create_with_repo_for_authenticated_user(
  token,
  owner,
  repo,
  data,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_create_with_repo_for_authenticated_user_request(
      request,
      owner,
      repo,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_create_with_repo_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn codespaces_list_in_repository_for_authenticated_user(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_list_in_repository_for_authenticated_user_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_list_in_repository_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn classroom_list_assignments_for_a_classroom(
  token,
  classroom_id,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.classroom_list_assignments_for_a_classroom_request(
      request,
      classroom_id,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.classroom_list_assignments_for_a_classroom_response(response),
    ),
  )
  t.Done(data)
}

pub fn apps_get_repo_installation(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.apps_get_repo_installation_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_get_repo_installation_response(response)),
  )
  t.Done(data)
}

pub fn orgs_revoke_all_org_roles_team(token, org, team_slug) {
  let request = base_request(token)
  let request =
    operations.orgs_revoke_all_org_roles_team_request(request, org, team_slug)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_revoke_all_org_roles_team_response(response)),
  )
  t.Done(data)
}

pub fn search_issues_and_pull_requests(
  token,
  q q,
  sort sort,
  order order,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.search_issues_and_pull_requests_request(
      request,
      q,
      sort,
      order,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.search_issues_and_pull_requests_response(response)),
  )
  t.Done(data)
}

pub fn copilot_usage_metrics_for_org(
  token,
  org,
  since since,
  until until,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.copilot_usage_metrics_for_org_request(
      request,
      org,
      since,
      until,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.copilot_usage_metrics_for_org_response(response)),
  )
  t.Done(data)
}

pub fn actions_update_self_hosted_runner_group_for_org(
  token,
  org,
  runner_group_id,
  data,
) {
  let request = base_request(token)
  let request =
    operations.actions_update_self_hosted_runner_group_for_org_request(
      request,
      org,
      runner_group_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_update_self_hosted_runner_group_for_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_delete_self_hosted_runner_group_from_org(
  token,
  org,
  runner_group_id,
) {
  let request = base_request(token)
  let request =
    operations.actions_delete_self_hosted_runner_group_from_org_request(
      request,
      org,
      runner_group_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_delete_self_hosted_runner_group_from_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_get_self_hosted_runner_group_for_org(token, org, runner_group_id) {
  let request = base_request(token)
  let request =
    operations.actions_get_self_hosted_runner_group_for_org_request(
      request,
      org,
      runner_group_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_get_self_hosted_runner_group_for_org_response(response),
    ),
  )
  t.Done(data)
}

pub fn orgs_create_or_update_custom_properties_values_for_repos(
  token,
  org,
  data,
) {
  let request = base_request(token)
  let request =
    operations.orgs_create_or_update_custom_properties_values_for_repos_request(
      request,
      org,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.orgs_create_or_update_custom_properties_values_for_repos_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn orgs_list_custom_properties_values_for_repos(
  token,
  org,
  per_page per_page,
  page page,
  repository_query repository_query,
) {
  let request = base_request(token)
  let request =
    operations.orgs_list_custom_properties_values_for_repos_request(
      request,
      org,
      per_page,
      page,
      repository_query,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.orgs_list_custom_properties_values_for_repos_response(response),
    ),
  )
  t.Done(data)
}

pub fn activity_list_repos_starred_by_user(
  token,
  username,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.activity_list_repos_starred_by_user_request(
      request,
      username,
      sort,
      direction,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_list_repos_starred_by_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_list_workflow_runs_for_repo(
  token,
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
  let request = base_request(token)
  let request =
    operations.actions_list_workflow_runs_for_repo_request(
      request,
      owner,
      repo,
      actor,
      branch,
      event,
      status,
      per_page,
      page,
      created,
      exclude_pull_requests,
      check_suite_id,
      head_sha,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_list_workflow_runs_for_repo_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn code_scanning_delete_codeql_database(token, owner, repo, language) {
  let request = base_request(token)
  let request =
    operations.code_scanning_delete_codeql_database_request(
      request,
      owner,
      repo,
      language,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_scanning_delete_codeql_database_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn code_scanning_get_codeql_database(token, owner, repo, language) {
  let request = base_request(token)
  let request =
    operations.code_scanning_get_codeql_database_request(
      request,
      owner,
      repo,
      language,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_scanning_get_codeql_database_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_code_frequency_stats(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_get_code_frequency_stats_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_code_frequency_stats_response(response)),
  )
  t.Done(data)
}

pub fn actions_re_run_workflow_failed_jobs(token, owner, repo, run_id, data) {
  let request = base_request(token)
  let request =
    operations.actions_re_run_workflow_failed_jobs_request(
      request,
      owner,
      repo,
      run_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_re_run_workflow_failed_jobs_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_set_selected_repositories_enabled_github_actions_organization(
  token,
  org,
  data,
) {
  let request = base_request(token)
  let request =
    operations.actions_set_selected_repositories_enabled_github_actions_organization_request(
      request,
      org,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_set_selected_repositories_enabled_github_actions_organization_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_list_selected_repositories_enabled_github_actions_organization(
  token,
  org,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_selected_repositories_enabled_github_actions_organization_request(
      request,
      org,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_list_selected_repositories_enabled_github_actions_organization_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn issues_list_comments_for_repo(
  token,
  owner,
  repo,
  sort sort,
  direction direction,
  since since,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.issues_list_comments_for_repo_request(
      request,
      owner,
      repo,
      sort,
      direction,
      since,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_list_comments_for_repo_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_tags(token, owner, repo, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.repos_list_tags_request(request, owner, repo, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_tags_response(response)),
  )
  t.Done(data)
}

pub fn apps_redeliver_webhook_delivery(token, delivery_id) {
  let request = base_request(token)
  let request =
    operations.apps_redeliver_webhook_delivery_request(request, delivery_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_redeliver_webhook_delivery_response(response)),
  )
  t.Done(data)
}

pub fn codespaces_publish_for_authenticated_user(token, codespace_name, data) {
  let request = base_request(token)
  let request =
    operations.codespaces_publish_for_authenticated_user_request(
      request,
      codespace_name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_publish_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn code_security_get_configuration_for_repository(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.code_security_get_configuration_for_repository_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.code_security_get_configuration_for_repository_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_get_workflow_run_attempt(
  token,
  owner,
  repo,
  run_id,
  attempt_number,
  exclude_pull_requests exclude_pull_requests,
) {
  let request = base_request(token)
  let request =
    operations.actions_get_workflow_run_attempt_request(
      request,
      owner,
      repo,
      run_id,
      attempt_number,
      exclude_pull_requests,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_workflow_run_attempt_response(response)),
  )
  t.Done(data)
}

pub fn apps_update_webhook_config_for_app(token, data) {
  let request = base_request(token)
  let request =
    operations.apps_update_webhook_config_for_app_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_update_webhook_config_for_app_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn apps_get_webhook_config_for_app(token) {
  let request = base_request(token)
  let request = operations.apps_get_webhook_config_for_app_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_get_webhook_config_for_app_response(response)),
  )
  t.Done(data)
}

pub fn actions_get_reviews_for_run(token, owner, repo, run_id) {
  let request = base_request(token)
  let request =
    operations.actions_get_reviews_for_run_request(request, owner, repo, run_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_reviews_for_run_response(response)),
  )
  t.Done(data)
}

pub fn actions_disable_workflow(token, owner, repo, workflow_id) {
  let request = base_request(token)
  let request =
    operations.actions_disable_workflow_request(
      request,
      owner,
      repo,
      workflow_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_disable_workflow_response(response)),
  )
  t.Done(data)
}

pub fn packages_delete_package_for_authenticated_user(
  token,
  package_type,
  package_name,
) {
  let request = base_request(token)
  let request =
    operations.packages_delete_package_for_authenticated_user_request(
      request,
      package_type,
      package_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.packages_delete_package_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn packages_get_package_for_authenticated_user(
  token,
  package_type,
  package_name,
) {
  let request = base_request(token)
  let request =
    operations.packages_get_package_for_authenticated_user_request(
      request,
      package_type,
      package_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.packages_get_package_for_authenticated_user_response(response),
    ),
  )
  t.Done(data)
}

pub fn actions_get_repo_public_key(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.actions_get_repo_public_key_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_repo_public_key_response(response)),
  )
  t.Done(data)
}

pub fn activity_list_repo_events(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.activity_list_repo_events_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_list_repo_events_response(response)),
  )
  t.Done(data)
}

pub fn codespaces_update_for_authenticated_user(token, codespace_name, data) {
  let request = base_request(token)
  let request =
    operations.codespaces_update_for_authenticated_user_request(
      request,
      codespace_name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_update_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn codespaces_delete_for_authenticated_user(token, codespace_name) {
  let request = base_request(token)
  let request =
    operations.codespaces_delete_for_authenticated_user_request(
      request,
      codespace_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_delete_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn codespaces_get_for_authenticated_user(token, codespace_name) {
  let request = base_request(token)
  let request =
    operations.codespaces_get_for_authenticated_user_request(
      request,
      codespace_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_get_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn orgs_list(token, since since, per_page per_page) {
  let request = base_request(token)
  let request = operations.orgs_list_request(request, since, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.orgs_list_response(response)))
  t.Done(data)
}

pub fn teams_list_pending_invitations_in_org(
  token,
  org,
  team_slug,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.teams_list_pending_invitations_in_org_request(
      request,
      org,
      team_slug,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_list_pending_invitations_in_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn migrations_start_for_org(token, org, data) {
  let request = base_request(token)
  let request = operations.migrations_start_for_org_request(request, org, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.migrations_start_for_org_response(response)),
  )
  t.Done(data)
}

pub fn migrations_list_for_org(
  token,
  org,
  per_page per_page,
  page page,
  exclude exclude,
) {
  let request = base_request(token)
  let request =
    operations.migrations_list_for_org_request(
      request,
      org,
      per_page,
      page,
      exclude,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.migrations_list_for_org_response(response)),
  )
  t.Done(data)
}

pub fn orgs_create_or_update_custom_properties(token, org, data) {
  let request = base_request(token)
  let request =
    operations.orgs_create_or_update_custom_properties_request(
      request,
      org,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_create_or_update_custom_properties_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn orgs_get_all_custom_properties(token, org) {
  let request = base_request(token)
  let request = operations.orgs_get_all_custom_properties_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_get_all_custom_properties_response(response)),
  )
  t.Done(data)
}

pub fn teams_remove_repo_in_org(token, org, team_slug, owner, repo) {
  let request = base_request(token)
  let request =
    operations.teams_remove_repo_in_org_request(
      request,
      org,
      team_slug,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_remove_repo_in_org_response(response)),
  )
  t.Done(data)
}

pub fn teams_add_or_update_repo_permissions_in_org(
  token,
  org,
  team_slug,
  owner,
  repo,
  data,
) {
  let request = base_request(token)
  let request =
    operations.teams_add_or_update_repo_permissions_in_org_request(
      request,
      org,
      team_slug,
      owner,
      repo,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.teams_add_or_update_repo_permissions_in_org_response(response),
    ),
  )
  t.Done(data)
}

pub fn teams_check_permissions_for_repo_in_org(
  token,
  org,
  team_slug,
  owner,
  repo,
) {
  let request = base_request(token)
  let request =
    operations.teams_check_permissions_for_repo_in_org_request(
      request,
      org,
      team_slug,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_check_permissions_for_repo_in_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn git_list_matching_refs(token, owner, repo, ref) {
  let request = base_request(token)
  let request =
    operations.git_list_matching_refs_request(request, owner, repo, ref)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.git_list_matching_refs_response(response)),
  )
  t.Done(data)
}

pub fn apps_unsuspend_installation(token, installation_id) {
  let request = base_request(token)
  let request =
    operations.apps_unsuspend_installation_request(request, installation_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_unsuspend_installation_response(response)),
  )
  t.Done(data)
}

pub fn apps_suspend_installation(token, installation_id) {
  let request = base_request(token)
  let request =
    operations.apps_suspend_installation_request(request, installation_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_suspend_installation_response(response)),
  )
  t.Done(data)
}

pub fn gists_list_starred(token, since since, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.gists_list_starred_request(request, since, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.gists_list_starred_response(response)),
  )
  t.Done(data)
}

pub fn secret_scanning_create_push_protection_bypass(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.secret_scanning_create_push_protection_bypass_request(
      request,
      owner,
      repo,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.secret_scanning_create_push_protection_bypass_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn issues_list_labels_for_milestone(
  token,
  owner,
  repo,
  milestone_number,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.issues_list_labels_for_milestone_request(
      request,
      owner,
      repo,
      milestone_number,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_list_labels_for_milestone_response(response)),
  )
  t.Done(data)
}

pub fn actions_delete_workflow_run(token, owner, repo, run_id) {
  let request = base_request(token)
  let request =
    operations.actions_delete_workflow_run_request(request, owner, repo, run_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_delete_workflow_run_response(response)),
  )
  t.Done(data)
}

pub fn actions_get_workflow_run(
  token,
  owner,
  repo,
  run_id,
  exclude_pull_requests exclude_pull_requests,
) {
  let request = base_request(token)
  let request =
    operations.actions_get_workflow_run_request(
      request,
      owner,
      repo,
      run_id,
      exclude_pull_requests,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_workflow_run_response(response)),
  )
  t.Done(data)
}

pub fn git_get_tag(token, owner, repo, tag_sha) {
  let request = base_request(token)
  let request = operations.git_get_tag_request(request, owner, repo, tag_sha)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.git_get_tag_response(response)))
  t.Done(data)
}

pub fn actions_remove_custom_label_from_self_hosted_runner_for_repo(
  token,
  owner,
  repo,
  runner_id,
  name,
) {
  let request = base_request(token)
  let request =
    operations.actions_remove_custom_label_from_self_hosted_runner_for_repo_request(
      request,
      owner,
      repo,
      runner_id,
      name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_remove_custom_label_from_self_hosted_runner_for_repo_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn gists_get_revision(token, gist_id, sha) {
  let request = base_request(token)
  let request = operations.gists_get_revision_request(request, gist_id, sha)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.gists_get_revision_response(response)),
  )
  t.Done(data)
}

pub fn teams_update_discussion_comment_in_org(
  token,
  org,
  team_slug,
  discussion_number,
  comment_number,
  data,
) {
  let request = base_request(token)
  let request =
    operations.teams_update_discussion_comment_in_org_request(
      request,
      org,
      team_slug,
      discussion_number,
      comment_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_update_discussion_comment_in_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn teams_delete_discussion_comment_in_org(
  token,
  org,
  team_slug,
  discussion_number,
  comment_number,
) {
  let request = base_request(token)
  let request =
    operations.teams_delete_discussion_comment_in_org_request(
      request,
      org,
      team_slug,
      discussion_number,
      comment_number,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_delete_discussion_comment_in_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn teams_get_discussion_comment_in_org(
  token,
  org,
  team_slug,
  discussion_number,
  comment_number,
) {
  let request = base_request(token)
  let request =
    operations.teams_get_discussion_comment_in_org_request(
      request,
      org,
      team_slug,
      discussion_number,
      comment_number,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_get_discussion_comment_in_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn codespaces_check_permissions_for_devcontainer(
  token,
  owner,
  repo,
  ref ref,
  devcontainer_path devcontainer_path,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_check_permissions_for_devcontainer_request(
      request,
      owner,
      repo,
      ref,
      devcontainer_path,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_check_permissions_for_devcontainer_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn apps_get_subscription_plan_for_account(token, account_id) {
  let request = base_request(token)
  let request =
    operations.apps_get_subscription_plan_for_account_request(
      request,
      account_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_get_subscription_plan_for_account_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_list_contributors(
  token,
  owner,
  repo,
  anon anon,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_contributors_request(
      request,
      owner,
      repo,
      anon,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_contributors_response(response)),
  )
  t.Done(data)
}

pub fn teams_list_members_in_org(
  token,
  org,
  team_slug,
  role role,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.teams_list_members_in_org_request(
      request,
      org,
      team_slug,
      role,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_list_members_in_org_response(response)),
  )
  t.Done(data)
}

pub fn secret_scanning_list_alerts_for_repo(
  token,
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
  let request = base_request(token)
  let request =
    operations.secret_scanning_list_alerts_for_repo_request(
      request,
      owner,
      repo,
      state,
      secret_type,
      resolution,
      sort,
      direction,
      page,
      per_page,
      before,
      after,
      validity,
      is_publicly_leaked,
      is_multi_repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.secret_scanning_list_alerts_for_repo_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn migrations_map_commit_author(token, owner, repo, author_id, data) {
  let request = base_request(token)
  let request =
    operations.migrations_map_commit_author_request(
      request,
      owner,
      repo,
      author_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.migrations_map_commit_author_response(response)),
  )
  t.Done(data)
}

pub fn gists_create_comment(token, gist_id, data) {
  let request = base_request(token)
  let request = operations.gists_create_comment_request(request, gist_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.gists_create_comment_response(response)),
  )
  t.Done(data)
}

pub fn gists_list_comments(token, gist_id, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.gists_list_comments_request(request, gist_id, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.gists_list_comments_response(response)),
  )
  t.Done(data)
}

pub fn packages_restore_package_for_authenticated_user(
  token,
  package_type,
  package_name,
  token_ token_,
) {
  let request = base_request(token)
  let request =
    operations.packages_restore_package_for_authenticated_user_request(
      request,
      package_type,
      package_name,
      token_,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.packages_restore_package_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn code_scanning_get_sarif(token, owner, repo, sarif_id) {
  let request = base_request(token)
  let request =
    operations.code_scanning_get_sarif_request(request, owner, repo, sarif_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_scanning_get_sarif_response(response)),
  )
  t.Done(data)
}

pub fn activity_mark_repo_notifications_as_read(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.activity_mark_repo_notifications_as_read_request(
      request,
      owner,
      repo,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_mark_repo_notifications_as_read_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn activity_list_repo_notifications_for_authenticated_user(
  token,
  owner,
  repo,
  all all,
  participating participating,
  since since,
  before before,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.activity_list_repo_notifications_for_authenticated_user_request(
      request,
      owner,
      repo,
      all,
      participating,
      since,
      before,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.activity_list_repo_notifications_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn search_users(
  token,
  q q,
  sort sort,
  order order,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.search_users_request(request, q, sort, order, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.search_users_response(response)))
  t.Done(data)
}

pub fn activity_list_stargazers_for_repo(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.activity_list_stargazers_for_repo_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_list_stargazers_for_repo_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn issues_update(token, owner, repo, issue_number, data) {
  let request = base_request(token)
  let request =
    operations.issues_update_request(request, owner, repo, issue_number, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.issues_update_response(response)))
  t.Done(data)
}

pub fn issues_get(token, owner, repo, issue_number) {
  let request = base_request(token)
  let request =
    operations.issues_get_request(request, owner, repo, issue_number)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.issues_get_response(response)))
  t.Done(data)
}

pub fn codespaces_get_org_public_key(token, org) {
  let request = base_request(token)
  let request = operations.codespaces_get_org_public_key_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_get_org_public_key_response(response)),
  )
  t.Done(data)
}

pub fn projects_create_card(token, column_id) {
  let request = base_request(token)
  let request = operations.projects_create_card_request(request, column_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_create_card_response(response)),
  )
  t.Done(data)
}

pub fn projects_list_cards(
  token,
  column_id,
  archived_state archived_state,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.projects_list_cards_request(
      request,
      column_id,
      archived_state,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_list_cards_response(response)),
  )
  t.Done(data)
}

pub fn repos_cancel_pages_deployment(token, owner, repo, pages_deployment_id) {
  let request = base_request(token)
  let request =
    operations.repos_cancel_pages_deployment_request(
      request,
      owner,
      repo,
      pages_deployment_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_cancel_pages_deployment_response(response)),
  )
  t.Done(data)
}

pub fn issues_update_label(token, owner, repo, name, data) {
  let request = base_request(token)
  let request =
    operations.issues_update_label_request(request, owner, repo, name, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_update_label_response(response)),
  )
  t.Done(data)
}

pub fn issues_delete_label(token, owner, repo, name) {
  let request = base_request(token)
  let request =
    operations.issues_delete_label_request(request, owner, repo, name)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_delete_label_response(response)),
  )
  t.Done(data)
}

pub fn issues_get_label(token, owner, repo, name) {
  let request = base_request(token)
  let request = operations.issues_get_label_request(request, owner, repo, name)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_get_label_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_commit_activity_stats(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_get_commit_activity_stats_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_commit_activity_stats_response(response)),
  )
  t.Done(data)
}

pub fn teams_create_discussion_legacy(token, team_id, data) {
  let request = base_request(token)
  let request =
    operations.teams_create_discussion_legacy_request(request, team_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_create_discussion_legacy_response(response)),
  )
  t.Done(data)
}

pub fn teams_list_discussions_legacy(
  token,
  team_id,
  direction direction,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.teams_list_discussions_legacy_request(
      request,
      team_id,
      direction,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_list_discussions_legacy_response(response)),
  )
  t.Done(data)
}

pub fn projects_move_column(token, column_id, data) {
  let request = base_request(token)
  let request =
    operations.projects_move_column_request(request, column_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_move_column_response(response)),
  )
  t.Done(data)
}

pub fn repos_delete_admin_branch_protection(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_delete_admin_branch_protection_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_admin_branch_protection_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_set_admin_branch_protection(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_set_admin_branch_protection_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_set_admin_branch_protection_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_admin_branch_protection(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_get_admin_branch_protection_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_admin_branch_protection_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn projects_create_for_authenticated_user(token, data) {
  let request = base_request(token)
  let request =
    operations.projects_create_for_authenticated_user_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_create_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn orgs_list_public_members(token, org, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.orgs_list_public_members_request(request, org, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_public_members_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_branch_rules(
  token,
  owner,
  repo,
  branch,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_get_branch_rules_request(
      request,
      owner,
      repo,
      branch,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_branch_rules_response(response)),
  )
  t.Done(data)
}

pub fn issues_list_for_authenticated_user(
  token,
  filter filter,
  state state,
  labels labels,
  sort sort,
  direction direction,
  since since,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.issues_list_for_authenticated_user_request(
      request,
      filter,
      state,
      labels,
      sort,
      direction,
      since,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_list_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn classroom_list_classrooms(token, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.classroom_list_classrooms_request(request, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.classroom_list_classrooms_response(response)),
  )
  t.Done(data)
}

pub fn actions_create_registration_token_for_org(token, org) {
  let request = base_request(token)
  let request =
    operations.actions_create_registration_token_for_org_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_create_registration_token_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn codespaces_create_for_authenticated_user(token) {
  let request = base_request(token)
  let request =
    operations.codespaces_create_for_authenticated_user_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_create_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn codespaces_list_for_authenticated_user(
  token,
  per_page per_page,
  page page,
  repository_id repository_id,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_list_for_authenticated_user_request(
      request,
      per_page,
      page,
      repository_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_list_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn orgs_list_org_roles(token, org) {
  let request = base_request(token)
  let request = operations.orgs_list_org_roles_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_org_roles_response(response)),
  )
  t.Done(data)
}

pub fn dependabot_remove_selected_repo_from_org_secret(
  token,
  org,
  secret_name,
  repository_id,
) {
  let request = base_request(token)
  let request =
    operations.dependabot_remove_selected_repo_from_org_secret_request(
      request,
      org,
      secret_name,
      repository_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.dependabot_remove_selected_repo_from_org_secret_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn dependabot_add_selected_repo_to_org_secret(
  token,
  org,
  secret_name,
  repository_id,
) {
  let request = base_request(token)
  let request =
    operations.dependabot_add_selected_repo_to_org_secret_request(
      request,
      org,
      secret_name,
      repository_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.dependabot_add_selected_repo_to_org_secret_response(response),
    ),
  )
  t.Done(data)
}

pub fn api_insights_get_time_stats_by_user(
  token,
  org,
  user_id,
  min_timestamp min_timestamp,
  max_timestamp max_timestamp,
  timestamp_increment timestamp_increment,
) {
  let request = base_request(token)
  let request =
    operations.api_insights_get_time_stats_by_user_request(
      request,
      org,
      user_id,
      min_timestamp,
      max_timestamp,
      timestamp_increment,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_insights_get_time_stats_by_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn pulls_delete_pending_review(token, owner, repo, pull_number, review_id) {
  let request = base_request(token)
  let request =
    operations.pulls_delete_pending_review_request(
      request,
      owner,
      repo,
      pull_number,
      review_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_delete_pending_review_response(response)),
  )
  t.Done(data)
}

pub fn pulls_update_review(token, owner, repo, pull_number, review_id, data) {
  let request = base_request(token)
  let request =
    operations.pulls_update_review_request(
      request,
      owner,
      repo,
      pull_number,
      review_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_update_review_response(response)),
  )
  t.Done(data)
}

pub fn pulls_get_review(token, owner, repo, pull_number, review_id) {
  let request = base_request(token)
  let request =
    operations.pulls_get_review_request(
      request,
      owner,
      repo,
      pull_number,
      review_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_get_review_response(response)),
  )
  t.Done(data)
}

pub fn meta_root(token) {
  let request = base_request(token)
  let request = operations.meta_root_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.meta_root_response(response)))
  t.Done(data)
}

pub fn codespaces_set_selected_repos_for_org_secret(
  token,
  org,
  secret_name,
  data,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_set_selected_repos_for_org_secret_request(
      request,
      org,
      secret_name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_set_selected_repos_for_org_secret_response(response),
    ),
  )
  t.Done(data)
}

pub fn codespaces_list_selected_repos_for_org_secret(
  token,
  org,
  secret_name,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_list_selected_repos_for_org_secret_request(
      request,
      org,
      secret_name,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_list_selected_repos_for_org_secret_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn repos_get_latest_pages_build(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_get_latest_pages_build_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_latest_pages_build_response(response)),
  )
  t.Done(data)
}

pub fn actions_approve_workflow_run(token, owner, repo, run_id) {
  let request = base_request(token)
  let request =
    operations.actions_approve_workflow_run_request(
      request,
      owner,
      repo,
      run_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_approve_workflow_run_response(response)),
  )
  t.Done(data)
}

pub fn gists_unstar(token, gist_id) {
  let request = base_request(token)
  let request = operations.gists_unstar_request(request, gist_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.gists_unstar_response(response)))
  t.Done(data)
}

pub fn gists_star(token, gist_id) {
  let request = base_request(token)
  let request = operations.gists_star_request(request, gist_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.gists_star_response(response)))
  t.Done(data)
}

pub fn gists_check_is_starred(token, gist_id) {
  let request = base_request(token)
  let request = operations.gists_check_is_starred_request(request, gist_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.gists_check_is_starred_response(response)),
  )
  t.Done(data)
}

pub fn git_create_tag(token, owner, repo, data) {
  let request = base_request(token)
  let request = operations.git_create_tag_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.git_create_tag_response(response)))
  t.Done(data)
}

pub fn api_insights_get_summary_stats_by_user(
  token,
  org,
  user_id,
  min_timestamp min_timestamp,
  max_timestamp max_timestamp,
) {
  let request = base_request(token)
  let request =
    operations.api_insights_get_summary_stats_by_user_request(
      request,
      org,
      user_id,
      min_timestamp,
      max_timestamp,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_insights_get_summary_stats_by_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn orgs_create_invitation(token, org, data) {
  let request = base_request(token)
  let request = operations.orgs_create_invitation_request(request, org, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_create_invitation_response(response)),
  )
  t.Done(data)
}

pub fn orgs_list_pending_invitations(
  token,
  org,
  per_page per_page,
  page page,
  role role,
  invitation_source invitation_source,
) {
  let request = base_request(token)
  let request =
    operations.orgs_list_pending_invitations_request(
      request,
      org,
      per_page,
      page,
      role,
      invitation_source,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_pending_invitations_response(response)),
  )
  t.Done(data)
}

pub fn repos_remove_user_access_restrictions(token, owner, repo, branch, data) {
  let request = base_request(token)
  let request =
    operations.repos_remove_user_access_restrictions_request(
      request,
      owner,
      repo,
      branch,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_remove_user_access_restrictions_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_add_user_access_restrictions(token, owner, repo, branch, data) {
  let request = base_request(token)
  let request =
    operations.repos_add_user_access_restrictions_request(
      request,
      owner,
      repo,
      branch,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_add_user_access_restrictions_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_set_user_access_restrictions(token, owner, repo, branch, data) {
  let request = base_request(token)
  let request =
    operations.repos_set_user_access_restrictions_request(
      request,
      owner,
      repo,
      branch,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_set_user_access_restrictions_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_users_with_access_to_protected_branch(
  token,
  owner,
  repo,
  branch,
) {
  let request = base_request(token)
  let request =
    operations.repos_get_users_with_access_to_protected_branch_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.repos_get_users_with_access_to_protected_branch_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn activity_list_received_public_events_for_user(
  token,
  username,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.activity_list_received_public_events_for_user_request(
      request,
      username,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.activity_list_received_public_events_for_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn orgs_remove_member(token, org, username) {
  let request = base_request(token)
  let request = operations.orgs_remove_member_request(request, org, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_remove_member_response(response)),
  )
  t.Done(data)
}

pub fn orgs_check_membership_for_user(token, org, username) {
  let request = base_request(token)
  let request =
    operations.orgs_check_membership_for_user_request(request, org, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_check_membership_for_user_response(response)),
  )
  t.Done(data)
}

pub fn codes_of_conduct_get_conduct_code(token, key) {
  let request = base_request(token)
  let request =
    operations.codes_of_conduct_get_conduct_code_request(request, key)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codes_of_conduct_get_conduct_code_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn apps_list_repos_accessible_to_installation(
  token,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.apps_list_repos_accessible_to_installation_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.apps_list_repos_accessible_to_installation_response(response),
    ),
  )
  t.Done(data)
}

pub fn repos_get_top_paths(token, owner, repo) {
  let request = base_request(token)
  let request = operations.repos_get_top_paths_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_top_paths_response(response)),
  )
  t.Done(data)
}

pub fn actions_delete_workflow_run_logs(token, owner, repo, run_id) {
  let request = base_request(token)
  let request =
    operations.actions_delete_workflow_run_logs_request(
      request,
      owner,
      repo,
      run_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_delete_workflow_run_logs_response(response)),
  )
  t.Done(data)
}

pub fn actions_download_workflow_run_logs(token, owner, repo, run_id) {
  let request = base_request(token)
  let request =
    operations.actions_download_workflow_run_logs_request(
      request,
      owner,
      repo,
      run_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_download_workflow_run_logs_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn orgs_get_webhook_delivery(token, org, hook_id, delivery_id) {
  let request = base_request(token)
  let request =
    operations.orgs_get_webhook_delivery_request(
      request,
      org,
      hook_id,
      delivery_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_get_webhook_delivery_response(response)),
  )
  t.Done(data)
}

pub fn apps_list_subscriptions_for_authenticated_user_stubbed(
  token,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.apps_list_subscriptions_for_authenticated_user_stubbed_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.apps_list_subscriptions_for_authenticated_user_stubbed_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn orgs_list_org_role_users(
  token,
  org,
  role_id,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.orgs_list_org_role_users_request(
      request,
      org,
      role_id,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_org_role_users_response(response)),
  )
  t.Done(data)
}

pub fn checks_rerequest_suite(token, owner, repo, check_suite_id) {
  let request = base_request(token)
  let request =
    operations.checks_rerequest_suite_request(
      request,
      owner,
      repo,
      check_suite_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.checks_rerequest_suite_response(response)),
  )
  t.Done(data)
}

pub fn orgs_list_app_installations(token, org, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.orgs_list_app_installations_request(request, org, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_app_installations_response(response)),
  )
  t.Done(data)
}

pub fn dependabot_delete_repo_secret(token, owner, repo, secret_name) {
  let request = base_request(token)
  let request =
    operations.dependabot_delete_repo_secret_request(
      request,
      owner,
      repo,
      secret_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.dependabot_delete_repo_secret_response(response)),
  )
  t.Done(data)
}

pub fn dependabot_create_or_update_repo_secret(
  token,
  owner,
  repo,
  secret_name,
  data,
) {
  let request = base_request(token)
  let request =
    operations.dependabot_create_or_update_repo_secret_request(
      request,
      owner,
      repo,
      secret_name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.dependabot_create_or_update_repo_secret_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn dependabot_get_repo_secret(token, owner, repo, secret_name) {
  let request = base_request(token)
  let request =
    operations.dependabot_get_repo_secret_request(
      request,
      owner,
      repo,
      secret_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.dependabot_get_repo_secret_response(response)),
  )
  t.Done(data)
}

pub fn repos_delete_commit_signature_protection(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_delete_commit_signature_protection_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_commit_signature_protection_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_create_commit_signature_protection(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_create_commit_signature_protection_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_commit_signature_protection_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_commit_signature_protection(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_get_commit_signature_protection_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_commit_signature_protection_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_create_repo_variable(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.actions_create_repo_variable_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_create_repo_variable_response(response)),
  )
  t.Done(data)
}

pub fn actions_list_repo_variables(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_repo_variables_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_list_repo_variables_response(response)),
  )
  t.Done(data)
}

pub fn actions_download_workflow_run_attempt_logs(
  token,
  owner,
  repo,
  run_id,
  attempt_number,
) {
  let request = base_request(token)
  let request =
    operations.actions_download_workflow_run_attempt_logs_request(
      request,
      owner,
      repo,
      run_id,
      attempt_number,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_download_workflow_run_attempt_logs_response(response),
    ),
  )
  t.Done(data)
}

pub fn codespaces_create_with_pr_for_authenticated_user(
  token,
  owner,
  repo,
  pull_number,
  data,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_create_with_pr_for_authenticated_user_request(
      request,
      owner,
      repo,
      pull_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_create_with_pr_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn reactions_delete_for_release(token, owner, repo, release_id, reaction_id) {
  let request = base_request(token)
  let request =
    operations.reactions_delete_for_release_request(
      request,
      owner,
      repo,
      release_id,
      reaction_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.reactions_delete_for_release_response(response)),
  )
  t.Done(data)
}

pub fn teams_remove_project_in_org(token, org, team_slug, project_id) {
  let request = base_request(token)
  let request =
    operations.teams_remove_project_in_org_request(
      request,
      org,
      team_slug,
      project_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_remove_project_in_org_response(response)),
  )
  t.Done(data)
}

pub fn teams_add_or_update_project_permissions_in_org(
  token,
  org,
  team_slug,
  project_id,
  data,
) {
  let request = base_request(token)
  let request =
    operations.teams_add_or_update_project_permissions_in_org_request(
      request,
      org,
      team_slug,
      project_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.teams_add_or_update_project_permissions_in_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn teams_check_permissions_for_project_in_org(
  token,
  org,
  team_slug,
  project_id,
) {
  let request = base_request(token)
  let request =
    operations.teams_check_permissions_for_project_in_org_request(
      request,
      org,
      team_slug,
      project_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.teams_check_permissions_for_project_in_org_response(response),
    ),
  )
  t.Done(data)
}

pub fn orgs_list_members(
  token,
  org,
  filter filter,
  role role,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.orgs_list_members_request(
      request,
      org,
      filter,
      role,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_members_response(response)),
  )
  t.Done(data)
}

pub fn orgs_list_pat_grant_request_repositories(
  token,
  org,
  pat_request_id,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.orgs_list_pat_grant_request_repositories_request(
      request,
      org,
      pat_request_id,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_pat_grant_request_repositories_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn pulls_list_review_comments_for_repo(
  token,
  owner,
  repo,
  sort sort,
  direction direction,
  since since,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.pulls_list_review_comments_for_repo_request(
      request,
      owner,
      repo,
      sort,
      direction,
      since,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_list_review_comments_for_repo_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn code_scanning_list_alerts_for_repo(
  token,
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
  let request = base_request(token)
  let request =
    operations.code_scanning_list_alerts_for_repo_request(
      request,
      owner,
      repo,
      tool_name,
      tool_guid,
      page,
      per_page,
      ref,
      pr,
      direction,
      before,
      after,
      sort,
      state,
      severity,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_scanning_list_alerts_for_repo_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn security_advisories_create_repository_advisory_cve_request(
  token,
  owner,
  repo,
  ghsa_id,
) {
  let request = base_request(token)
  let request =
    operations.security_advisories_create_repository_advisory_cve_request_request(
      request,
      owner,
      repo,
      ghsa_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.security_advisories_create_repository_advisory_cve_request_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn users_delete_public_ssh_key_for_authenticated_user(token, key_id) {
  let request = base_request(token)
  let request =
    operations.users_delete_public_ssh_key_for_authenticated_user_request(
      request,
      key_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.users_delete_public_ssh_key_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn users_get_public_ssh_key_for_authenticated_user(token, key_id) {
  let request = base_request(token)
  let request =
    operations.users_get_public_ssh_key_for_authenticated_user_request(
      request,
      key_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.users_get_public_ssh_key_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn teams_list_child_in_org(
  token,
  org,
  team_slug,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.teams_list_child_in_org_request(
      request,
      org,
      team_slug,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_list_child_in_org_response(response)),
  )
  t.Done(data)
}

pub fn repos_remove_status_check_contexts(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_remove_status_check_contexts_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_remove_status_check_contexts_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_add_status_check_contexts(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_add_status_check_contexts_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_add_status_check_contexts_response(response)),
  )
  t.Done(data)
}

pub fn repos_set_status_check_contexts(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_set_status_check_contexts_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_set_status_check_contexts_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_all_status_check_contexts(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_get_all_status_check_contexts_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_all_status_check_contexts_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_update_org_variable(token, org, name, data) {
  let request = base_request(token)
  let request =
    operations.actions_update_org_variable_request(request, org, name, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_update_org_variable_response(response)),
  )
  t.Done(data)
}

pub fn actions_delete_org_variable(token, org, name) {
  let request = base_request(token)
  let request =
    operations.actions_delete_org_variable_request(request, org, name)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_delete_org_variable_response(response)),
  )
  t.Done(data)
}

pub fn actions_get_org_variable(token, org, name) {
  let request = base_request(token)
  let request = operations.actions_get_org_variable_request(request, org, name)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_org_variable_response(response)),
  )
  t.Done(data)
}

pub fn codespaces_set_codespaces_access(token, org, data) {
  let request = base_request(token)
  let request =
    operations.codespaces_set_codespaces_access_request(request, org, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_set_codespaces_access_response(response)),
  )
  t.Done(data)
}

pub fn code_security_set_configuration_as_default(
  token,
  org,
  configuration_id,
  data,
) {
  let request = base_request(token)
  let request =
    operations.code_security_set_configuration_as_default_request(
      request,
      org,
      configuration_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.code_security_set_configuration_as_default_response(response),
    ),
  )
  t.Done(data)
}

pub fn security_advisories_create_fork(token, owner, repo, ghsa_id) {
  let request = base_request(token)
  let request =
    operations.security_advisories_create_fork_request(
      request,
      owner,
      repo,
      ghsa_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.security_advisories_create_fork_response(response)),
  )
  t.Done(data)
}

pub fn oidc_update_oidc_custom_sub_template_for_org(token, org, oidc_custom_sub) {
  let request = base_request(token)
  let request =
    operations.oidc_update_oidc_custom_sub_template_for_org_request(
      request,
      org,
      oidc_custom_sub,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.oidc_update_oidc_custom_sub_template_for_org_response(response),
    ),
  )
  t.Done(data)
}

pub fn oidc_get_oidc_custom_sub_template_for_org(token, org) {
  let request = base_request(token)
  let request =
    operations.oidc_get_oidc_custom_sub_template_for_org_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.oidc_get_oidc_custom_sub_template_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn users_delete_email_for_authenticated_user(token) {
  let request = base_request(token)
  let request =
    operations.users_delete_email_for_authenticated_user_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_delete_email_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn users_add_email_for_authenticated_user(token) {
  let request = base_request(token)
  let request =
    operations.users_add_email_for_authenticated_user_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_add_email_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn users_list_emails_for_authenticated_user(
  token,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.users_list_emails_for_authenticated_user_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_list_emails_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_delete_pages_site(token, owner, repo) {
  let request = base_request(token)
  let request = operations.repos_delete_pages_site_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_pages_site_response(response)),
  )
  t.Done(data)
}

pub fn repos_create_pages_site(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.repos_create_pages_site_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_pages_site_response(response)),
  )
  t.Done(data)
}

pub fn repos_update_information_about_pages_site(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.repos_update_information_about_pages_site_request(
      request,
      owner,
      repo,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_update_information_about_pages_site_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_pages(token, owner, repo) {
  let request = base_request(token)
  let request = operations.repos_get_pages_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_pages_response(response)),
  )
  t.Done(data)
}

pub fn migrations_list_repos_for_authenticated_user(
  token,
  migration_id,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.migrations_list_repos_for_authenticated_user_request(
      request,
      migration_id,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.migrations_list_repos_for_authenticated_user_response(response),
    ),
  )
  t.Done(data)
}

pub fn activity_mark_thread_as_read(token, thread_id) {
  let request = base_request(token)
  let request =
    operations.activity_mark_thread_as_read_request(request, thread_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_mark_thread_as_read_response(response)),
  )
  t.Done(data)
}

pub fn activity_mark_thread_as_done(token, thread_id) {
  let request = base_request(token)
  let request =
    operations.activity_mark_thread_as_done_request(request, thread_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_mark_thread_as_done_response(response)),
  )
  t.Done(data)
}

pub fn activity_get_thread(token, thread_id) {
  let request = base_request(token)
  let request = operations.activity_get_thread_request(request, thread_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_get_thread_response(response)),
  )
  t.Done(data)
}

pub fn codespaces_stop_in_organization(token, org, username, codespace_name) {
  let request = base_request(token)
  let request =
    operations.codespaces_stop_in_organization_request(
      request,
      org,
      username,
      codespace_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_stop_in_organization_response(response)),
  )
  t.Done(data)
}

pub fn copilot_get_copilot_organization_details(token, org) {
  let request = base_request(token)
  let request =
    operations.copilot_get_copilot_organization_details_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.copilot_get_copilot_organization_details_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn security_advisories_create_repository_advisory(
  token,
  owner,
  repo,
  repository_advisory_create,
) {
  let request = base_request(token)
  let request =
    operations.security_advisories_create_repository_advisory_request(
      request,
      owner,
      repo,
      repository_advisory_create,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.security_advisories_create_repository_advisory_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn security_advisories_list_repository_advisories(
  token,
  owner,
  repo,
  direction direction,
  sort sort,
  before before,
  after after,
  per_page per_page,
  state state,
) {
  let request = base_request(token)
  let request =
    operations.security_advisories_list_repository_advisories_request(
      request,
      owner,
      repo,
      direction,
      sort,
      before,
      after,
      per_page,
      state,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.security_advisories_list_repository_advisories_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn dependabot_get_repo_public_key(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.dependabot_get_repo_public_key_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.dependabot_get_repo_public_key_response(response)),
  )
  t.Done(data)
}

pub fn repos_create_for_authenticated_user(token, data) {
  let request = base_request(token)
  let request =
    operations.repos_create_for_authenticated_user_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_list_for_authenticated_user(
  token,
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
  let request = base_request(token)
  let request =
    operations.repos_list_for_authenticated_user_request(
      request,
      visibility,
      affiliation,
      type_,
      sort,
      direction,
      per_page,
      page,
      since,
      before,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_remove_app_access_restrictions(token, owner, repo, branch, data) {
  let request = base_request(token)
  let request =
    operations.repos_remove_app_access_restrictions_request(
      request,
      owner,
      repo,
      branch,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_remove_app_access_restrictions_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_add_app_access_restrictions(token, owner, repo, branch, data) {
  let request = base_request(token)
  let request =
    operations.repos_add_app_access_restrictions_request(
      request,
      owner,
      repo,
      branch,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_add_app_access_restrictions_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_set_app_access_restrictions(token, owner, repo, branch, data) {
  let request = base_request(token)
  let request =
    operations.repos_set_app_access_restrictions_request(
      request,
      owner,
      repo,
      branch,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_set_app_access_restrictions_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_apps_with_access_to_protected_branch(
  token,
  owner,
  repo,
  branch,
) {
  let request = base_request(token)
  let request =
    operations.repos_get_apps_with_access_to_protected_branch_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.repos_get_apps_with_access_to_protected_branch_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn copilot_copilot_metrics_for_enterprise_team(
  token,
  enterprise,
  team_slug,
  since since,
  until until,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.copilot_copilot_metrics_for_enterprise_team_request(
      request,
      enterprise,
      team_slug,
      since,
      until,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.copilot_copilot_metrics_for_enterprise_team_response(response),
    ),
  )
  t.Done(data)
}

pub fn repos_create_deploy_key(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.repos_create_deploy_key_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_deploy_key_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_deploy_keys(token, owner, repo, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.repos_list_deploy_keys_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_deploy_keys_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_commit_comments_for_repo(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_commit_comments_for_repo_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_commit_comments_for_repo_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn migrations_unlock_repo_for_authenticated_user(
  token,
  migration_id,
  repo_name,
) {
  let request = base_request(token)
  let request =
    operations.migrations_unlock_repo_for_authenticated_user_request(
      request,
      migration_id,
      repo_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.migrations_unlock_repo_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn issues_list_assignees(token, owner, repo, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.issues_list_assignees_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_list_assignees_response(response)),
  )
  t.Done(data)
}

pub fn orgs_remove_public_membership_for_authenticated_user(
  token,
  org,
  username,
) {
  let request = base_request(token)
  let request =
    operations.orgs_remove_public_membership_for_authenticated_user_request(
      request,
      org,
      username,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.orgs_remove_public_membership_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn orgs_set_public_membership_for_authenticated_user(token, org, username) {
  let request = base_request(token)
  let request =
    operations.orgs_set_public_membership_for_authenticated_user_request(
      request,
      org,
      username,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.orgs_set_public_membership_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn orgs_check_public_membership_for_user(token, org, username) {
  let request = base_request(token)
  let request =
    operations.orgs_check_public_membership_for_user_request(
      request,
      org,
      username,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_check_public_membership_for_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn teams_create_discussion_comment_legacy(
  token,
  team_id,
  discussion_number,
  data,
) {
  let request = base_request(token)
  let request =
    operations.teams_create_discussion_comment_legacy_request(
      request,
      team_id,
      discussion_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_create_discussion_comment_legacy_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn teams_list_discussion_comments_legacy(
  token,
  team_id,
  discussion_number,
  direction direction,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.teams_list_discussion_comments_legacy_request(
      request,
      team_id,
      discussion_number,
      direction,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_list_discussion_comments_legacy_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_disable_automated_security_fixes(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_disable_automated_security_fixes_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_disable_automated_security_fixes_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_enable_automated_security_fixes(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_enable_automated_security_fixes_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_enable_automated_security_fixes_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_check_automated_security_fixes(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_check_automated_security_fixes_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_check_automated_security_fixes_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn orgs_list_attestations(
  token,
  org,
  subject_digest,
  per_page per_page,
  before before,
  after after,
) {
  let request = base_request(token)
  let request =
    operations.orgs_list_attestations_request(
      request,
      org,
      subject_digest,
      per_page,
      before,
      after,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_attestations_response(response)),
  )
  t.Done(data)
}

pub fn orgs_list_webhook_deliveries(
  token,
  org,
  hook_id,
  per_page per_page,
  cursor cursor,
) {
  let request = base_request(token)
  let request =
    operations.orgs_list_webhook_deliveries_request(
      request,
      org,
      hook_id,
      per_page,
      cursor,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_webhook_deliveries_response(response)),
  )
  t.Done(data)
}

pub fn users_delete_ssh_signing_key_for_authenticated_user(
  token,
  ssh_signing_key_id,
) {
  let request = base_request(token)
  let request =
    operations.users_delete_ssh_signing_key_for_authenticated_user_request(
      request,
      ssh_signing_key_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.users_delete_ssh_signing_key_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn users_get_ssh_signing_key_for_authenticated_user(
  token,
  ssh_signing_key_id,
) {
  let request = base_request(token)
  let request =
    operations.users_get_ssh_signing_key_for_authenticated_user_request(
      request,
      ssh_signing_key_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.users_get_ssh_signing_key_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn code_scanning_get_variant_analysis(
  token,
  owner,
  repo,
  codeql_variant_analysis_id,
) {
  let request = base_request(token)
  let request =
    operations.code_scanning_get_variant_analysis_request(
      request,
      owner,
      repo,
      codeql_variant_analysis_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_scanning_get_variant_analysis_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn copilot_get_copilot_seat_details_for_user(token, org, username) {
  let request = base_request(token)
  let request =
    operations.copilot_get_copilot_seat_details_for_user_request(
      request,
      org,
      username,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.copilot_get_copilot_seat_details_for_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn reactions_create_for_team_discussion_comment_in_org(
  token,
  org,
  team_slug,
  discussion_number,
  comment_number,
  data,
) {
  let request = base_request(token)
  let request =
    operations.reactions_create_for_team_discussion_comment_in_org_request(
      request,
      org,
      team_slug,
      discussion_number,
      comment_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.reactions_create_for_team_discussion_comment_in_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn reactions_list_for_team_discussion_comment_in_org(
  token,
  org,
  team_slug,
  discussion_number,
  comment_number,
  content content,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.reactions_list_for_team_discussion_comment_in_org_request(
      request,
      org,
      team_slug,
      discussion_number,
      comment_number,
      content,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.reactions_list_for_team_discussion_comment_in_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn teams_update_discussion_in_org(
  token,
  org,
  team_slug,
  discussion_number,
  data,
) {
  let request = base_request(token)
  let request =
    operations.teams_update_discussion_in_org_request(
      request,
      org,
      team_slug,
      discussion_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_update_discussion_in_org_response(response)),
  )
  t.Done(data)
}

pub fn teams_delete_discussion_in_org(token, org, team_slug, discussion_number) {
  let request = base_request(token)
  let request =
    operations.teams_delete_discussion_in_org_request(
      request,
      org,
      team_slug,
      discussion_number,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_delete_discussion_in_org_response(response)),
  )
  t.Done(data)
}

pub fn teams_get_discussion_in_org(token, org, team_slug, discussion_number) {
  let request = base_request(token)
  let request =
    operations.teams_get_discussion_in_org_request(
      request,
      org,
      team_slug,
      discussion_number,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_get_discussion_in_org_response(response)),
  )
  t.Done(data)
}

pub fn users_delete_gpg_key_for_authenticated_user(token, gpg_key_id) {
  let request = base_request(token)
  let request =
    operations.users_delete_gpg_key_for_authenticated_user_request(
      request,
      gpg_key_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.users_delete_gpg_key_for_authenticated_user_response(response),
    ),
  )
  t.Done(data)
}

pub fn users_get_gpg_key_for_authenticated_user(token, gpg_key_id) {
  let request = base_request(token)
  let request =
    operations.users_get_gpg_key_for_authenticated_user_request(
      request,
      gpg_key_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_get_gpg_key_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn migrations_get_status_for_authenticated_user(
  token,
  migration_id,
  exclude exclude,
) {
  let request = base_request(token)
  let request =
    operations.migrations_get_status_for_authenticated_user_request(
      request,
      migration_id,
      exclude,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.migrations_get_status_for_authenticated_user_response(response),
    ),
  )
  t.Done(data)
}

pub fn interactions_remove_restrictions_for_repo(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.interactions_remove_restrictions_for_repo_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.interactions_remove_restrictions_for_repo_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn interactions_set_restrictions_for_repo(
  token,
  owner,
  repo,
  interaction_limit,
) {
  let request = base_request(token)
  let request =
    operations.interactions_set_restrictions_for_repo_request(
      request,
      owner,
      repo,
      interaction_limit,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.interactions_set_restrictions_for_repo_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn interactions_get_restrictions_for_repo(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.interactions_get_restrictions_for_repo_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.interactions_get_restrictions_for_repo_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn users_list_social_accounts_for_user(
  token,
  username,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.users_list_social_accounts_for_user_request(
      request,
      username,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_list_social_accounts_for_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_community_profile_metrics(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_get_community_profile_metrics_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_community_profile_metrics_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn rate_limit_get(token) {
  let request = base_request(token)
  let request = operations.rate_limit_get_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.rate_limit_get_response(response)))
  t.Done(data)
}

pub fn copilot_list_copilot_seats(token, org, page page, per_page per_page) {
  let request = base_request(token)
  let request =
    operations.copilot_list_copilot_seats_request(request, org, page, per_page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.copilot_list_copilot_seats_response(response)),
  )
  t.Done(data)
}

pub fn apps_create_installation_access_token(token, installation_id, data) {
  let request = base_request(token)
  let request =
    operations.apps_create_installation_access_token_request(
      request,
      installation_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_create_installation_access_token_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn git_update_ref(token, owner, repo, ref, data) {
  let request = base_request(token)
  let request =
    operations.git_update_ref_request(request, owner, repo, ref, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.git_update_ref_response(response)))
  t.Done(data)
}

pub fn git_delete_ref(token, owner, repo, ref) {
  let request = base_request(token)
  let request = operations.git_delete_ref_request(request, owner, repo, ref)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.git_delete_ref_response(response)))
  t.Done(data)
}

pub fn repos_create_pages_deployment(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.repos_create_pages_deployment_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_pages_deployment_response(response)),
  )
  t.Done(data)
}

pub fn reactions_create_for_issue(token, owner, repo, issue_number, data) {
  let request = base_request(token)
  let request =
    operations.reactions_create_for_issue_request(
      request,
      owner,
      repo,
      issue_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.reactions_create_for_issue_response(response)),
  )
  t.Done(data)
}

pub fn reactions_list_for_issue(
  token,
  owner,
  repo,
  issue_number,
  content content,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.reactions_list_for_issue_request(
      request,
      owner,
      repo,
      issue_number,
      content,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.reactions_list_for_issue_response(response)),
  )
  t.Done(data)
}

pub fn meta_get_all_versions(token) {
  let request = base_request(token)
  let request = operations.meta_get_all_versions_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.meta_get_all_versions_response(response)),
  )
  t.Done(data)
}

pub fn issues_unlock(token, owner, repo, issue_number) {
  let request = base_request(token)
  let request =
    operations.issues_unlock_request(request, owner, repo, issue_number)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.issues_unlock_response(response)))
  t.Done(data)
}

pub fn issues_lock(token, owner, repo, issue_number, data) {
  let request = base_request(token)
  let request =
    operations.issues_lock_request(request, owner, repo, issue_number, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.issues_lock_response(response)))
  t.Done(data)
}

pub fn repos_delete_autolink(token, owner, repo, autolink_id) {
  let request = base_request(token)
  let request =
    operations.repos_delete_autolink_request(request, owner, repo, autolink_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_autolink_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_autolink(token, owner, repo, autolink_id) {
  let request = base_request(token)
  let request =
    operations.repos_get_autolink_request(request, owner, repo, autolink_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_autolink_response(response)),
  )
  t.Done(data)
}

pub fn repos_delete_deployment(token, owner, repo, deployment_id) {
  let request = base_request(token)
  let request =
    operations.repos_delete_deployment_request(
      request,
      owner,
      repo,
      deployment_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_deployment_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_deployment(token, owner, repo, deployment_id) {
  let request = base_request(token)
  let request =
    operations.repos_get_deployment_request(request, owner, repo, deployment_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_deployment_response(response)),
  )
  t.Done(data)
}

pub fn pulls_remove_requested_reviewers(token, owner, repo, pull_number, data) {
  let request = base_request(token)
  let request =
    operations.pulls_remove_requested_reviewers_request(
      request,
      owner,
      repo,
      pull_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_remove_requested_reviewers_response(response)),
  )
  t.Done(data)
}

pub fn pulls_request_reviewers(token, owner, repo, pull_number, data) {
  let request = base_request(token)
  let request =
    operations.pulls_request_reviewers_request(
      request,
      owner,
      repo,
      pull_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_request_reviewers_response(response)),
  )
  t.Done(data)
}

pub fn pulls_list_requested_reviewers(token, owner, repo, pull_number) {
  let request = base_request(token)
  let request =
    operations.pulls_list_requested_reviewers_request(
      request,
      owner,
      repo,
      pull_number,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_list_requested_reviewers_response(response)),
  )
  t.Done(data)
}

pub fn actions_disable_selected_repository_github_actions_organization(
  token,
  org,
  repository_id,
) {
  let request = base_request(token)
  let request =
    operations.actions_disable_selected_repository_github_actions_organization_request(
      request,
      org,
      repository_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_disable_selected_repository_github_actions_organization_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_enable_selected_repository_github_actions_organization(
  token,
  org,
  repository_id,
) {
  let request = base_request(token)
  let request =
    operations.actions_enable_selected_repository_github_actions_organization_request(
      request,
      org,
      repository_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_enable_selected_repository_github_actions_organization_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn codespaces_codespace_machines_for_authenticated_user(
  token,
  codespace_name,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_codespace_machines_for_authenticated_user_request(
      request,
      codespace_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_codespace_machines_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn orgs_remove_membership_for_user(token, org, username) {
  let request = base_request(token)
  let request =
    operations.orgs_remove_membership_for_user_request(request, org, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_remove_membership_for_user_response(response)),
  )
  t.Done(data)
}

pub fn orgs_set_membership_for_user(token, org, username, data) {
  let request = base_request(token)
  let request =
    operations.orgs_set_membership_for_user_request(
      request,
      org,
      username,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_set_membership_for_user_response(response)),
  )
  t.Done(data)
}

pub fn orgs_get_membership_for_user(token, org, username) {
  let request = base_request(token)
  let request =
    operations.orgs_get_membership_for_user_request(request, org, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_get_membership_for_user_response(response)),
  )
  t.Done(data)
}

pub fn apps_list_installation_repos_for_authenticated_user(
  token,
  installation_id,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.apps_list_installation_repos_for_authenticated_user_request(
      request,
      installation_id,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.apps_list_installation_repos_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn teams_create(token, org, data) {
  let request = base_request(token)
  let request = operations.teams_create_request(request, org, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.teams_create_response(response)))
  t.Done(data)
}

pub fn teams_list(token, org, per_page per_page, page page) {
  let request = base_request(token)
  let request = operations.teams_list_request(request, org, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.teams_list_response(response)))
  t.Done(data)
}

pub fn actions_remove_all_custom_labels_from_self_hosted_runner_for_org(
  token,
  org,
  runner_id,
) {
  let request = base_request(token)
  let request =
    operations.actions_remove_all_custom_labels_from_self_hosted_runner_for_org_request(
      request,
      org,
      runner_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_remove_all_custom_labels_from_self_hosted_runner_for_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_add_custom_labels_to_self_hosted_runner_for_org(
  token,
  org,
  runner_id,
  data,
) {
  let request = base_request(token)
  let request =
    operations.actions_add_custom_labels_to_self_hosted_runner_for_org_request(
      request,
      org,
      runner_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_add_custom_labels_to_self_hosted_runner_for_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_set_custom_labels_for_self_hosted_runner_for_org(
  token,
  org,
  runner_id,
  data,
) {
  let request = base_request(token)
  let request =
    operations.actions_set_custom_labels_for_self_hosted_runner_for_org_request(
      request,
      org,
      runner_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_set_custom_labels_for_self_hosted_runner_for_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_list_labels_for_self_hosted_runner_for_org(token, org, runner_id) {
  let request = base_request(token)
  let request =
    operations.actions_list_labels_for_self_hosted_runner_for_org_request(
      request,
      org,
      runner_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_list_labels_for_self_hosted_runner_for_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn users_create_gpg_key_for_authenticated_user(token, data) {
  let request = base_request(token)
  let request =
    operations.users_create_gpg_key_for_authenticated_user_request(
      request,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.users_create_gpg_key_for_authenticated_user_response(response),
    ),
  )
  t.Done(data)
}

pub fn users_list_gpg_keys_for_authenticated_user(
  token,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.users_list_gpg_keys_for_authenticated_user_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.users_list_gpg_keys_for_authenticated_user_response(response),
    ),
  )
  t.Done(data)
}

pub fn projects_update_card(token, card_id, data) {
  let request = base_request(token)
  let request = operations.projects_update_card_request(request, card_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_update_card_response(response)),
  )
  t.Done(data)
}

pub fn projects_delete_card(token, card_id) {
  let request = base_request(token)
  let request = operations.projects_delete_card_request(request, card_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_delete_card_response(response)),
  )
  t.Done(data)
}

pub fn projects_get_card(token, card_id) {
  let request = base_request(token)
  let request = operations.projects_get_card_request(request, card_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_get_card_response(response)),
  )
  t.Done(data)
}

pub fn security_advisories_update_repository_advisory(
  token,
  owner,
  repo,
  ghsa_id,
  repository_advisory_update,
) {
  let request = base_request(token)
  let request =
    operations.security_advisories_update_repository_advisory_request(
      request,
      owner,
      repo,
      ghsa_id,
      repository_advisory_update,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.security_advisories_update_repository_advisory_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn security_advisories_get_repository_advisory(token, owner, repo, ghsa_id) {
  let request = base_request(token)
  let request =
    operations.security_advisories_get_repository_advisory_request(
      request,
      owner,
      repo,
      ghsa_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.security_advisories_get_repository_advisory_response(response),
    ),
  )
  t.Done(data)
}

pub fn actions_create_environment_variable(
  token,
  owner,
  repo,
  environment_name,
  data,
) {
  let request = base_request(token)
  let request =
    operations.actions_create_environment_variable_request(
      request,
      owner,
      repo,
      environment_name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_create_environment_variable_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_list_environment_variables(
  token,
  owner,
  repo,
  environment_name,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_environment_variables_request(
      request,
      owner,
      repo,
      environment_name,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_list_environment_variables_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn activity_list_received_events_for_user(
  token,
  username,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.activity_list_received_events_for_user_request(
      request,
      username,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_list_received_events_for_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn classroom_list_accepted_assignments_for_an_assignment(
  token,
  assignment_id,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.classroom_list_accepted_assignments_for_an_assignment_request(
      request,
      assignment_id,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.classroom_list_accepted_assignments_for_an_assignment_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn orgs_review_pat_grant_request(token, org, pat_request_id, data) {
  let request = base_request(token)
  let request =
    operations.orgs_review_pat_grant_request_request(
      request,
      org,
      pat_request_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_review_pat_grant_request_response(response)),
  )
  t.Done(data)
}

pub fn users_get_by_id(token, account_id) {
  let request = base_request(token)
  let request = operations.users_get_by_id_request(request, account_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_get_by_id_response(response)),
  )
  t.Done(data)
}

pub fn users_list_attestations(
  token,
  username,
  subject_digest,
  per_page per_page,
  before before,
  after after,
) {
  let request = base_request(token)
  let request =
    operations.users_list_attestations_request(
      request,
      username,
      subject_digest,
      per_page,
      before,
      after,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_list_attestations_response(response)),
  )
  t.Done(data)
}

pub fn actions_list_repo_workflows(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_repo_workflows_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_list_repo_workflows_response(response)),
  )
  t.Done(data)
}

pub fn repos_delete_deploy_key(token, owner, repo, key_id) {
  let request = base_request(token)
  let request =
    operations.repos_delete_deploy_key_request(request, owner, repo, key_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_deploy_key_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_deploy_key(token, owner, repo, key_id) {
  let request = base_request(token)
  let request =
    operations.repos_get_deploy_key_request(request, owner, repo, key_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_deploy_key_response(response)),
  )
  t.Done(data)
}

pub fn repos_update_commit_comment(token, owner, repo, comment_id, data) {
  let request = base_request(token)
  let request =
    operations.repos_update_commit_comment_request(
      request,
      owner,
      repo,
      comment_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_update_commit_comment_response(response)),
  )
  t.Done(data)
}

pub fn repos_delete_commit_comment(token, owner, repo, comment_id) {
  let request = base_request(token)
  let request =
    operations.repos_delete_commit_comment_request(
      request,
      owner,
      repo,
      comment_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_commit_comment_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_commit_comment(token, owner, repo, comment_id) {
  let request = base_request(token)
  let request =
    operations.repos_get_commit_comment_request(
      request,
      owner,
      repo,
      comment_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_commit_comment_response(response)),
  )
  t.Done(data)
}

pub fn repos_update_webhook(token, owner, repo, hook_id, data) {
  let request = base_request(token)
  let request =
    operations.repos_update_webhook_request(request, owner, repo, hook_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_update_webhook_response(response)),
  )
  t.Done(data)
}

pub fn repos_delete_webhook(token, owner, repo, hook_id) {
  let request = base_request(token)
  let request =
    operations.repos_delete_webhook_request(request, owner, repo, hook_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_webhook_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_webhook(token, owner, repo, hook_id) {
  let request = base_request(token)
  let request =
    operations.repos_get_webhook_request(request, owner, repo, hook_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_webhook_response(response)),
  )
  t.Done(data)
}

pub fn actions_download_job_logs_for_workflow_run(token, owner, repo, job_id) {
  let request = base_request(token)
  let request =
    operations.actions_download_job_logs_for_workflow_run_request(
      request,
      owner,
      repo,
      job_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_download_job_logs_for_workflow_run_response(response),
    ),
  )
  t.Done(data)
}

pub fn actions_get_actions_cache_usage(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.actions_get_actions_cache_usage_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_actions_cache_usage_response(response)),
  )
  t.Done(data)
}

pub fn code_security_detach_configuration(token, org, data) {
  let request = base_request(token)
  let request =
    operations.code_security_detach_configuration_request(request, org, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_security_detach_configuration_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn copilot_usage_metrics_for_enterprise_team(
  token,
  enterprise,
  team_slug,
  since since,
  until until,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.copilot_usage_metrics_for_enterprise_team_request(
      request,
      enterprise,
      team_slug,
      since,
      until,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.copilot_usage_metrics_for_enterprise_team_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn orgs_remove_security_manager_team(token, org, team_slug) {
  let request = base_request(token)
  let request =
    operations.orgs_remove_security_manager_team_request(
      request,
      org,
      team_slug,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_remove_security_manager_team_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn orgs_add_security_manager_team(token, org, team_slug) {
  let request = base_request(token)
  let request =
    operations.orgs_add_security_manager_team_request(request, org, team_slug)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_add_security_manager_team_response(response)),
  )
  t.Done(data)
}

pub fn activity_list_repos_starred_by_authenticated_user(
  token,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.activity_list_repos_starred_by_authenticated_user_request(
      request,
      sort,
      direction,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.activity_list_repos_starred_by_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn codespaces_list_devcontainers_in_repository_for_authenticated_user(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_list_devcontainers_in_repository_for_authenticated_user_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_list_devcontainers_in_repository_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn billing_get_github_actions_billing_user(token, username) {
  let request = base_request(token)
  let request =
    operations.billing_get_github_actions_billing_user_request(
      request,
      username,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.billing_get_github_actions_billing_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_update_invitation(token, owner, repo, invitation_id, data) {
  let request = base_request(token)
  let request =
    operations.repos_update_invitation_request(
      request,
      owner,
      repo,
      invitation_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_update_invitation_response(response)),
  )
  t.Done(data)
}

pub fn repos_delete_invitation(token, owner, repo, invitation_id) {
  let request = base_request(token)
  let request =
    operations.repos_delete_invitation_request(
      request,
      owner,
      repo,
      invitation_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_invitation_response(response)),
  )
  t.Done(data)
}

pub fn actions_set_selected_repos_for_org_variable(token, org, name, data) {
  let request = base_request(token)
  let request =
    operations.actions_set_selected_repos_for_org_variable_request(
      request,
      org,
      name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_set_selected_repos_for_org_variable_response(response),
    ),
  )
  t.Done(data)
}

pub fn actions_list_selected_repos_for_org_variable(
  token,
  org,
  name,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_selected_repos_for_org_variable_request(
      request,
      org,
      name,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_list_selected_repos_for_org_variable_response(response),
    ),
  )
  t.Done(data)
}

pub fn actions_get_workflow_run_usage(token, owner, repo, run_id) {
  let request = base_request(token)
  let request =
    operations.actions_get_workflow_run_usage_request(
      request,
      owner,
      repo,
      run_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_workflow_run_usage_response(response)),
  )
  t.Done(data)
}

pub fn orgs_unblock_user(token, org, username) {
  let request = base_request(token)
  let request = operations.orgs_unblock_user_request(request, org, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_unblock_user_response(response)),
  )
  t.Done(data)
}

pub fn orgs_block_user(token, org, username) {
  let request = base_request(token)
  let request = operations.orgs_block_user_request(request, org, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_block_user_response(response)),
  )
  t.Done(data)
}

pub fn orgs_check_blocked_user(token, org, username) {
  let request = base_request(token)
  let request =
    operations.orgs_check_blocked_user_request(request, org, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_check_blocked_user_response(response)),
  )
  t.Done(data)
}

pub fn apps_create_from_manifest(token, code) {
  let request = base_request(token)
  let request = operations.apps_create_from_manifest_request(request, code)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_create_from_manifest_response(response)),
  )
  t.Done(data)
}

pub fn issues_list(
  token,
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
  let request = base_request(token)
  let request =
    operations.issues_list_request(
      request,
      filter,
      state,
      labels,
      sort,
      direction,
      since,
      collab,
      orgs,
      owned,
      pulls,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.issues_list_response(response)))
  t.Done(data)
}

pub fn dependabot_update_alert(token, owner, repo, alert_number, data) {
  let request = base_request(token)
  let request =
    operations.dependabot_update_alert_request(
      request,
      owner,
      repo,
      alert_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.dependabot_update_alert_response(response)),
  )
  t.Done(data)
}

pub fn dependabot_get_alert(token, owner, repo, alert_number) {
  let request = base_request(token)
  let request =
    operations.dependabot_get_alert_request(request, owner, repo, alert_number)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.dependabot_get_alert_response(response)),
  )
  t.Done(data)
}

pub fn apps_scope_token(token, client_id, data) {
  let request = base_request(token)
  let request = operations.apps_scope_token_request(request, client_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_scope_token_response(response)),
  )
  t.Done(data)
}

pub fn pulls_update_review_comment(token, owner, repo, comment_id, data) {
  let request = base_request(token)
  let request =
    operations.pulls_update_review_comment_request(
      request,
      owner,
      repo,
      comment_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_update_review_comment_response(response)),
  )
  t.Done(data)
}

pub fn pulls_delete_review_comment(token, owner, repo, comment_id) {
  let request = base_request(token)
  let request =
    operations.pulls_delete_review_comment_request(
      request,
      owner,
      repo,
      comment_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_delete_review_comment_response(response)),
  )
  t.Done(data)
}

pub fn pulls_get_review_comment(token, owner, repo, comment_id) {
  let request = base_request(token)
  let request =
    operations.pulls_get_review_comment_request(
      request,
      owner,
      repo,
      comment_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_get_review_comment_response(response)),
  )
  t.Done(data)
}

pub fn licenses_get(token, license) {
  let request = base_request(token)
  let request = operations.licenses_get_request(request, license)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.licenses_get_response(response)))
  t.Done(data)
}

pub fn apps_list_subscriptions_for_authenticated_user(
  token,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.apps_list_subscriptions_for_authenticated_user_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.apps_list_subscriptions_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn users_create_public_ssh_key_for_authenticated_user(token, data) {
  let request = base_request(token)
  let request =
    operations.users_create_public_ssh_key_for_authenticated_user_request(
      request,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.users_create_public_ssh_key_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn users_list_public_ssh_keys_for_authenticated_user(
  token,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.users_list_public_ssh_keys_for_authenticated_user_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.users_list_public_ssh_keys_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_get_actions_cache_usage_by_repo_for_org(
  token,
  org,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.actions_get_actions_cache_usage_by_repo_for_org_request(
      request,
      org,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_get_actions_cache_usage_by_repo_for_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn repos_get_punch_card_stats(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_get_punch_card_stats_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_punch_card_stats_response(response)),
  )
  t.Done(data)
}

pub fn licenses_get_for_repo(token, owner, repo, ref ref) {
  let request = base_request(token)
  let request =
    operations.licenses_get_for_repo_request(request, owner, repo, ref)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.licenses_get_for_repo_response(response)),
  )
  t.Done(data)
}

pub fn actions_generate_runner_jitconfig_for_org(token, org, data) {
  let request = base_request(token)
  let request =
    operations.actions_generate_runner_jitconfig_for_org_request(
      request,
      org,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_generate_runner_jitconfig_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn codespaces_delete_org_secret(token, org, secret_name) {
  let request = base_request(token)
  let request =
    operations.codespaces_delete_org_secret_request(request, org, secret_name)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_delete_org_secret_response(response)),
  )
  t.Done(data)
}

pub fn codespaces_create_or_update_org_secret(token, org, secret_name, data) {
  let request = base_request(token)
  let request =
    operations.codespaces_create_or_update_org_secret_request(
      request,
      org,
      secret_name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_create_or_update_org_secret_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn codespaces_get_org_secret(token, org, secret_name) {
  let request = base_request(token)
  let request =
    operations.codespaces_get_org_secret_request(request, org, secret_name)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_get_org_secret_response(response)),
  )
  t.Done(data)
}

pub fn pulls_list_commits(
  token,
  owner,
  repo,
  pull_number,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.pulls_list_commits_request(
      request,
      owner,
      repo,
      pull_number,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_list_commits_response(response)),
  )
  t.Done(data)
}

pub fn billing_get_github_actions_billing_org(token, org) {
  let request = base_request(token)
  let request =
    operations.billing_get_github_actions_billing_org_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.billing_get_github_actions_billing_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn code_security_get_default_configurations(token, org) {
  let request = base_request(token)
  let request =
    operations.code_security_get_default_configurations_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_security_get_default_configurations_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn packages_delete_package_for_user(
  token,
  username,
  package_type,
  package_name,
) {
  let request = base_request(token)
  let request =
    operations.packages_delete_package_for_user_request(
      request,
      username,
      package_type,
      package_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.packages_delete_package_for_user_response(response)),
  )
  t.Done(data)
}

pub fn packages_get_package_for_user(
  token,
  username,
  package_type,
  package_name,
) {
  let request = base_request(token)
  let request =
    operations.packages_get_package_for_user_request(
      request,
      username,
      package_type,
      package_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.packages_get_package_for_user_response(response)),
  )
  t.Done(data)
}

pub fn codespaces_repo_machines_for_authenticated_user(
  token,
  owner,
  repo,
  location location,
  client_ip client_ip,
  ref ref,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_repo_machines_for_authenticated_user_request(
      request,
      owner,
      repo,
      location,
      client_ip,
      ref,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_repo_machines_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn activity_list_repos_watched_by_user(
  token,
  username,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.activity_list_repos_watched_by_user_request(
      request,
      username,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_list_repos_watched_by_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_delete_repo_secret(token, owner, repo, secret_name) {
  let request = base_request(token)
  let request =
    operations.actions_delete_repo_secret_request(
      request,
      owner,
      repo,
      secret_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_delete_repo_secret_response(response)),
  )
  t.Done(data)
}

pub fn actions_create_or_update_repo_secret(
  token,
  owner,
  repo,
  secret_name,
  data,
) {
  let request = base_request(token)
  let request =
    operations.actions_create_or_update_repo_secret_request(
      request,
      owner,
      repo,
      secret_name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_create_or_update_repo_secret_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_get_repo_secret(token, owner, repo, secret_name) {
  let request = base_request(token)
  let request =
    operations.actions_get_repo_secret_request(
      request,
      owner,
      repo,
      secret_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_repo_secret_response(response)),
  )
  t.Done(data)
}

pub fn interactions_remove_restrictions_for_authenticated_user(token) {
  let request = base_request(token)
  let request =
    operations.interactions_remove_restrictions_for_authenticated_user_request(
      request,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.interactions_remove_restrictions_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn interactions_set_restrictions_for_authenticated_user(
  token,
  interaction_limit,
) {
  let request = base_request(token)
  let request =
    operations.interactions_set_restrictions_for_authenticated_user_request(
      request,
      interaction_limit,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.interactions_set_restrictions_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn interactions_get_restrictions_for_authenticated_user(token) {
  let request = base_request(token)
  let request =
    operations.interactions_get_restrictions_for_authenticated_user_request(
      request,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.interactions_get_restrictions_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn pulls_create_review(token, owner, repo, pull_number, data) {
  let request = base_request(token)
  let request =
    operations.pulls_create_review_request(
      request,
      owner,
      repo,
      pull_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_create_review_response(response)),
  )
  t.Done(data)
}

pub fn pulls_list_reviews(
  token,
  owner,
  repo,
  pull_number,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.pulls_list_reviews_request(
      request,
      owner,
      repo,
      pull_number,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_list_reviews_response(response)),
  )
  t.Done(data)
}

pub fn repos_request_pages_build(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_request_pages_build_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_request_pages_build_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_pages_builds(token, owner, repo, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.repos_list_pages_builds_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_pages_builds_response(response)),
  )
  t.Done(data)
}

pub fn packages_restore_package_for_user(
  token,
  username,
  package_type,
  package_name,
  token_ token_,
) {
  let request = base_request(token)
  let request =
    operations.packages_restore_package_for_user_request(
      request,
      username,
      package_type,
      package_name,
      token_,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.packages_restore_package_for_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn users_list_followers_for_user(
  token,
  username,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.users_list_followers_for_user_request(
      request,
      username,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_list_followers_for_user_response(response)),
  )
  t.Done(data)
}

pub fn code_scanning_upload_sarif(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.code_scanning_upload_sarif_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_scanning_upload_sarif_response(response)),
  )
  t.Done(data)
}

pub fn actions_set_github_actions_default_workflow_permissions_organization(
  token,
  org,
  actions_set_default_workflow_permissions,
) {
  let request = base_request(token)
  let request =
    operations.actions_set_github_actions_default_workflow_permissions_organization_request(
      request,
      org,
      actions_set_default_workflow_permissions,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_set_github_actions_default_workflow_permissions_organization_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_get_github_actions_default_workflow_permissions_organization(
  token,
  org,
) {
  let request = base_request(token)
  let request =
    operations.actions_get_github_actions_default_workflow_permissions_organization_request(
      request,
      org,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_get_github_actions_default_workflow_permissions_organization_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn activity_list_public_events(token, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.activity_list_public_events_request(request, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_list_public_events_response(response)),
  )
  t.Done(data)
}

pub fn projects_get_permission_for_user(token, project_id, username) {
  let request = base_request(token)
  let request =
    operations.projects_get_permission_for_user_request(
      request,
      project_id,
      username,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_get_permission_for_user_response(response)),
  )
  t.Done(data)
}

pub fn orgs_ping_webhook(token, org, hook_id) {
  let request = base_request(token)
  let request = operations.orgs_ping_webhook_request(request, org, hook_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_ping_webhook_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_pull_requests_associated_with_commit(
  token,
  owner,
  repo,
  commit_sha,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_pull_requests_associated_with_commit_request(
      request,
      owner,
      repo,
      commit_sha,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.repos_list_pull_requests_associated_with_commit_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn pulls_create_reply_for_review_comment(
  token,
  owner,
  repo,
  pull_number,
  comment_id,
  data,
) {
  let request = base_request(token)
  let request =
    operations.pulls_create_reply_for_review_comment_request(
      request,
      owner,
      repo,
      pull_number,
      comment_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_create_reply_for_review_comment_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_merge_upstream(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.repos_merge_upstream_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_merge_upstream_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_branches(
  token,
  owner,
  repo,
  protected protected,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_branches_request(
      request,
      owner,
      repo,
      protected,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_branches_response(response)),
  )
  t.Done(data)
}

pub fn dependabot_list_alerts_for_org(
  token,
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
  let request = base_request(token)
  let request =
    operations.dependabot_list_alerts_for_org_request(
      request,
      org,
      state,
      severity,
      ecosystem,
      package,
      scope,
      sort,
      direction,
      before,
      after,
      first,
      last,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.dependabot_list_alerts_for_org_response(response)),
  )
  t.Done(data)
}

pub fn packages_delete_package_for_org(token, org, package_type, package_name) {
  let request = base_request(token)
  let request =
    operations.packages_delete_package_for_org_request(
      request,
      org,
      package_type,
      package_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.packages_delete_package_for_org_response(response)),
  )
  t.Done(data)
}

pub fn packages_get_package_for_organization(
  token,
  org,
  package_type,
  package_name,
) {
  let request = base_request(token)
  let request =
    operations.packages_get_package_for_organization_request(
      request,
      org,
      package_type,
      package_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.packages_get_package_for_organization_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn issues_remove_label(token, owner, repo, issue_number, name) {
  let request = base_request(token)
  let request =
    operations.issues_remove_label_request(
      request,
      owner,
      repo,
      issue_number,
      name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_remove_label_response(response)),
  )
  t.Done(data)
}

pub fn actions_list_repo_organization_variables(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_repo_organization_variables_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_list_repo_organization_variables_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn projects_update(token, project_id, data) {
  let request = base_request(token)
  let request = operations.projects_update_request(request, project_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_update_response(response)),
  )
  t.Done(data)
}

pub fn projects_delete(token, project_id) {
  let request = base_request(token)
  let request = operations.projects_delete_request(request, project_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_delete_response(response)),
  )
  t.Done(data)
}

pub fn projects_get(token, project_id) {
  let request = base_request(token)
  let request = operations.projects_get_request(request, project_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.projects_get_response(response)))
  t.Done(data)
}

pub fn codespaces_get_public_key_for_authenticated_user(token) {
  let request = base_request(token)
  let request =
    operations.codespaces_get_public_key_for_authenticated_user_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_get_public_key_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn packages_restore_package_for_org(
  token,
  org,
  package_type,
  package_name,
  token_ token_,
) {
  let request = base_request(token)
  let request =
    operations.packages_restore_package_for_org_request(
      request,
      org,
      package_type,
      package_name,
      token_,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.packages_restore_package_for_org_response(response)),
  )
  t.Done(data)
}

pub fn repos_update_webhook_config_for_repo(token, owner, repo, hook_id, data) {
  let request = base_request(token)
  let request =
    operations.repos_update_webhook_config_for_repo_request(
      request,
      owner,
      repo,
      hook_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_update_webhook_config_for_repo_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_webhook_config_for_repo(token, owner, repo, hook_id) {
  let request = base_request(token)
  let request =
    operations.repos_get_webhook_config_for_repo_request(
      request,
      owner,
      repo,
      hook_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_webhook_config_for_repo_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_branch(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_get_branch_request(request, owner, repo, branch)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_branch_response(response)),
  )
  t.Done(data)
}

pub fn git_get_blob(token, owner, repo, file_sha) {
  let request = base_request(token)
  let request = operations.git_get_blob_request(request, owner, repo, file_sha)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.git_get_blob_response(response)))
  t.Done(data)
}

pub fn projects_list_for_user(
  token,
  username,
  state state,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.projects_list_for_user_request(
      request,
      username,
      state,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_list_for_user_response(response)),
  )
  t.Done(data)
}

pub fn billing_get_shared_storage_billing_org(token, org) {
  let request = base_request(token)
  let request =
    operations.billing_get_shared_storage_billing_org_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.billing_get_shared_storage_billing_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn packages_list_docker_migration_conflicting_packages_for_authenticated_user(
  token,
) {
  let request = base_request(token)
  let request =
    operations.packages_list_docker_migration_conflicting_packages_for_authenticated_user_request(
      request,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.packages_list_docker_migration_conflicting_packages_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn git_create_commit(token, owner, repo, data) {
  let request = base_request(token)
  let request = operations.git_create_commit_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.git_create_commit_response(response)),
  )
  t.Done(data)
}

pub fn actions_review_pending_deployments_for_run(
  token,
  owner,
  repo,
  run_id,
  data,
) {
  let request = base_request(token)
  let request =
    operations.actions_review_pending_deployments_for_run_request(
      request,
      owner,
      repo,
      run_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_review_pending_deployments_for_run_response(response),
    ),
  )
  t.Done(data)
}

pub fn actions_get_pending_deployments_for_run(token, owner, repo, run_id) {
  let request = base_request(token)
  let request =
    operations.actions_get_pending_deployments_for_run_request(
      request,
      owner,
      repo,
      run_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_pending_deployments_for_run_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_list_activities(
  token,
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
  let request = base_request(token)
  let request =
    operations.repos_list_activities_request(
      request,
      owner,
      repo,
      direction,
      per_page,
      before,
      after,
      ref,
      actor,
      time_period,
      activity_type,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_activities_response(response)),
  )
  t.Done(data)
}

pub fn apps_get_user_installation(token, username) {
  let request = base_request(token)
  let request = operations.apps_get_user_installation_request(request, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_get_user_installation_response(response)),
  )
  t.Done(data)
}

pub fn copilot_cancel_copilot_seat_assignment_for_users(token, org, data) {
  let request = base_request(token)
  let request =
    operations.copilot_cancel_copilot_seat_assignment_for_users_request(
      request,
      org,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.copilot_cancel_copilot_seat_assignment_for_users_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn copilot_add_copilot_seats_for_users(token, org, data) {
  let request = base_request(token)
  let request =
    operations.copilot_add_copilot_seats_for_users_request(request, org, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.copilot_add_copilot_seats_for_users_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn migrations_set_lfs_preference(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.migrations_set_lfs_preference_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.migrations_set_lfs_preference_response(response)),
  )
  t.Done(data)
}

pub fn orgs_list_security_manager_teams(token, org) {
  let request = base_request(token)
  let request =
    operations.orgs_list_security_manager_teams_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_security_manager_teams_response(response)),
  )
  t.Done(data)
}

pub fn orgs_list_outside_collaborators(
  token,
  org,
  filter filter,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.orgs_list_outside_collaborators_request(
      request,
      org,
      filter,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_outside_collaborators_response(response)),
  )
  t.Done(data)
}

pub fn codespaces_remove_selected_repo_from_org_secret(
  token,
  org,
  secret_name,
  repository_id,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_remove_selected_repo_from_org_secret_request(
      request,
      org,
      secret_name,
      repository_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_remove_selected_repo_from_org_secret_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn codespaces_add_selected_repo_to_org_secret(
  token,
  org,
  secret_name,
  repository_id,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_add_selected_repo_to_org_secret_request(
      request,
      org,
      secret_name,
      repository_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_add_selected_repo_to_org_secret_response(response),
    ),
  )
  t.Done(data)
}

pub fn gitignore_get_template(token, name) {
  let request = base_request(token)
  let request = operations.gitignore_get_template_request(request, name)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.gitignore_get_template_response(response)),
  )
  t.Done(data)
}

pub fn actions_review_custom_gates_for_run(token, owner, repo, run_id) {
  let request = base_request(token)
  let request =
    operations.actions_review_custom_gates_for_run_request(
      request,
      owner,
      repo,
      run_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_review_custom_gates_for_run_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn apps_get_by_slug(token, app_slug) {
  let request = base_request(token)
  let request = operations.apps_get_by_slug_request(request, app_slug)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_get_by_slug_response(response)),
  )
  t.Done(data)
}

pub fn code_scanning_list_codeql_databases(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.code_scanning_list_codeql_databases_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_scanning_list_codeql_databases_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_combined_status_for_ref(
  token,
  owner,
  repo,
  ref,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_get_combined_status_for_ref_request(
      request,
      owner,
      repo,
      ref,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_combined_status_for_ref_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn teams_remove_membership_for_user_in_org(token, org, team_slug, username) {
  let request = base_request(token)
  let request =
    operations.teams_remove_membership_for_user_in_org_request(
      request,
      org,
      team_slug,
      username,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_remove_membership_for_user_in_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn teams_add_or_update_membership_for_user_in_org(
  token,
  org,
  team_slug,
  username,
  data,
) {
  let request = base_request(token)
  let request =
    operations.teams_add_or_update_membership_for_user_in_org_request(
      request,
      org,
      team_slug,
      username,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.teams_add_or_update_membership_for_user_in_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn teams_get_membership_for_user_in_org(token, org, team_slug, username) {
  let request = base_request(token)
  let request =
    operations.teams_get_membership_for_user_in_org_request(
      request,
      org,
      team_slug,
      username,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_get_membership_for_user_in_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn code_scanning_list_alert_instances(
  token,
  owner,
  repo,
  alert_number,
  page page,
  per_page per_page,
  ref ref,
  pr pr,
) {
  let request = base_request(token)
  let request =
    operations.code_scanning_list_alert_instances_request(
      request,
      owner,
      repo,
      alert_number,
      page,
      per_page,
      ref,
      pr,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_scanning_list_alert_instances_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn migrations_delete_archive_for_org(token, org, migration_id) {
  let request = base_request(token)
  let request =
    operations.migrations_delete_archive_for_org_request(
      request,
      org,
      migration_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.migrations_delete_archive_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn migrations_download_archive_for_org(token, org, migration_id) {
  let request = base_request(token)
  let request =
    operations.migrations_download_archive_for_org_request(
      request,
      org,
      migration_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.migrations_download_archive_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn orgs_redeliver_webhook_delivery(token, org, hook_id, delivery_id) {
  let request = base_request(token)
  let request =
    operations.orgs_redeliver_webhook_delivery_request(
      request,
      org,
      hook_id,
      delivery_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_redeliver_webhook_delivery_response(response)),
  )
  t.Done(data)
}

pub fn pulls_create_review_comment(token, owner, repo, pull_number, data) {
  let request = base_request(token)
  let request =
    operations.pulls_create_review_comment_request(
      request,
      owner,
      repo,
      pull_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_create_review_comment_response(response)),
  )
  t.Done(data)
}

pub fn pulls_list_review_comments(
  token,
  owner,
  repo,
  pull_number,
  sort sort,
  direction direction,
  since since,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.pulls_list_review_comments_request(
      request,
      owner,
      repo,
      pull_number,
      sort,
      direction,
      since,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_list_review_comments_response(response)),
  )
  t.Done(data)
}

pub fn actions_create_remove_token_for_repo(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.actions_create_remove_token_for_repo_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_create_remove_token_for_repo_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn issues_list_for_org(
  token,
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
  let request = base_request(token)
  let request =
    operations.issues_list_for_org_request(
      request,
      org,
      filter,
      state,
      labels,
      sort,
      direction,
      since,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_list_for_org_response(response)),
  )
  t.Done(data)
}

pub fn activity_get_feeds(token) {
  let request = base_request(token)
  let request = operations.activity_get_feeds_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_get_feeds_response(response)),
  )
  t.Done(data)
}

pub fn codespaces_list_in_organization(token, org, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.codespaces_list_in_organization_request(
      request,
      org,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_list_in_organization_response(response)),
  )
  t.Done(data)
}

pub fn checks_update(token, owner, repo, check_run_id, data) {
  let request = base_request(token)
  let request =
    operations.checks_update_request(request, owner, repo, check_run_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.checks_update_response(response)))
  t.Done(data)
}

pub fn checks_get(token, owner, repo, check_run_id) {
  let request = base_request(token)
  let request =
    operations.checks_get_request(request, owner, repo, check_run_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.checks_get_response(response)))
  t.Done(data)
}

pub fn actions_set_self_hosted_runners_in_group_for_org(
  token,
  org,
  runner_group_id,
  data,
) {
  let request = base_request(token)
  let request =
    operations.actions_set_self_hosted_runners_in_group_for_org_request(
      request,
      org,
      runner_group_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_set_self_hosted_runners_in_group_for_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_list_self_hosted_runners_in_group_for_org(
  token,
  org,
  runner_group_id,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_self_hosted_runners_in_group_for_org_request(
      request,
      org,
      runner_group_id,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_list_self_hosted_runners_in_group_for_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn repos_rename_branch(token, owner, repo, branch, data) {
  let request = base_request(token)
  let request =
    operations.repos_rename_branch_request(request, owner, repo, branch, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_rename_branch_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_readme(token, owner, repo, ref ref) {
  let request = base_request(token)
  let request = operations.repos_get_readme_request(request, owner, repo, ref)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_readme_response(response)),
  )
  t.Done(data)
}

pub fn activity_list_events_for_authenticated_user(
  token,
  username,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.activity_list_events_for_authenticated_user_request(
      request,
      username,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.activity_list_events_for_authenticated_user_response(response),
    ),
  )
  t.Done(data)
}

pub fn projects_create_for_org(token, org, data) {
  let request = base_request(token)
  let request = operations.projects_create_for_org_request(request, org, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_create_for_org_response(response)),
  )
  t.Done(data)
}

pub fn projects_list_for_org(
  token,
  org,
  state state,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.projects_list_for_org_request(
      request,
      org,
      state,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_list_for_org_response(response)),
  )
  t.Done(data)
}

pub fn repos_delete_deployment_branch_policy(
  token,
  owner,
  repo,
  environment_name,
  branch_policy_id,
) {
  let request = base_request(token)
  let request =
    operations.repos_delete_deployment_branch_policy_request(
      request,
      owner,
      repo,
      environment_name,
      branch_policy_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_deployment_branch_policy_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_update_deployment_branch_policy(
  token,
  owner,
  repo,
  environment_name,
  branch_policy_id,
  deployment_branch_policy_name_pattern,
) {
  let request = base_request(token)
  let request =
    operations.repos_update_deployment_branch_policy_request(
      request,
      owner,
      repo,
      environment_name,
      branch_policy_id,
      deployment_branch_policy_name_pattern,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_update_deployment_branch_policy_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_deployment_branch_policy(
  token,
  owner,
  repo,
  environment_name,
  branch_policy_id,
) {
  let request = base_request(token)
  let request =
    operations.repos_get_deployment_branch_policy_request(
      request,
      owner,
      repo,
      environment_name,
      branch_policy_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_deployment_branch_policy_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_repo_rule_suite(token, owner, repo, rule_suite_id) {
  let request = base_request(token)
  let request =
    operations.repos_get_repo_rule_suite_request(
      request,
      owner,
      repo,
      rule_suite_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_repo_rule_suite_response(response)),
  )
  t.Done(data)
}

pub fn git_get_commit(token, owner, repo, commit_sha) {
  let request = base_request(token)
  let request =
    operations.git_get_commit_request(request, owner, repo, commit_sha)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.git_get_commit_response(response)))
  t.Done(data)
}

pub fn apps_get_org_installation(token, org) {
  let request = base_request(token)
  let request = operations.apps_get_org_installation_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_get_org_installation_response(response)),
  )
  t.Done(data)
}

pub fn teams_update_in_org(token, org, team_slug, data) {
  let request = base_request(token)
  let request =
    operations.teams_update_in_org_request(request, org, team_slug, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_update_in_org_response(response)),
  )
  t.Done(data)
}

pub fn teams_delete_in_org(token, org, team_slug) {
  let request = base_request(token)
  let request = operations.teams_delete_in_org_request(request, org, team_slug)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_delete_in_org_response(response)),
  )
  t.Done(data)
}

pub fn teams_get_by_name(token, org, team_slug) {
  let request = base_request(token)
  let request = operations.teams_get_by_name_request(request, org, team_slug)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_get_by_name_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_deployment_status(token, owner, repo, deployment_id, status_id) {
  let request = base_request(token)
  let request =
    operations.repos_get_deployment_status_request(
      request,
      owner,
      repo,
      deployment_id,
      status_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_deployment_status_response(response)),
  )
  t.Done(data)
}

pub fn repos_remove_collaborator(token, owner, repo, username) {
  let request = base_request(token)
  let request =
    operations.repos_remove_collaborator_request(request, owner, repo, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_remove_collaborator_response(response)),
  )
  t.Done(data)
}

pub fn repos_add_collaborator(token, owner, repo, username, data) {
  let request = base_request(token)
  let request =
    operations.repos_add_collaborator_request(
      request,
      owner,
      repo,
      username,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_add_collaborator_response(response)),
  )
  t.Done(data)
}

pub fn repos_check_collaborator(token, owner, repo, username) {
  let request = base_request(token)
  let request =
    operations.repos_check_collaborator_request(request, owner, repo, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_check_collaborator_response(response)),
  )
  t.Done(data)
}

pub fn codespaces_delete_codespaces_access_users(token, org, data) {
  let request = base_request(token)
  let request =
    operations.codespaces_delete_codespaces_access_users_request(
      request,
      org,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_delete_codespaces_access_users_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn codespaces_set_codespaces_access_users(token, org, data) {
  let request = base_request(token)
  let request =
    operations.codespaces_set_codespaces_access_users_request(
      request,
      org,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_set_codespaces_access_users_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn billing_get_shared_storage_billing_user(token, username) {
  let request = base_request(token)
  let request =
    operations.billing_get_shared_storage_billing_user_request(
      request,
      username,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.billing_get_shared_storage_billing_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_create_or_update_custom_properties_values(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.repos_create_or_update_custom_properties_values_request(
      request,
      owner,
      repo,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.repos_create_or_update_custom_properties_values_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn repos_get_custom_properties_values(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_get_custom_properties_values_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_custom_properties_values_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_set_github_actions_permissions_organization(token, org, data) {
  let request = base_request(token)
  let request =
    operations.actions_set_github_actions_permissions_organization_request(
      request,
      org,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_set_github_actions_permissions_organization_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_get_github_actions_permissions_organization(token, org) {
  let request = base_request(token)
  let request =
    operations.actions_get_github_actions_permissions_organization_request(
      request,
      org,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_get_github_actions_permissions_organization_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn git_get_tree(token, owner, repo, tree_sha, recursive recursive) {
  let request = base_request(token)
  let request =
    operations.git_get_tree_request(request, owner, repo, tree_sha, recursive)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.git_get_tree_response(response)))
  t.Done(data)
}

pub fn reactions_create_for_team_discussion_in_org(
  token,
  org,
  team_slug,
  discussion_number,
  data,
) {
  let request = base_request(token)
  let request =
    operations.reactions_create_for_team_discussion_in_org_request(
      request,
      org,
      team_slug,
      discussion_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.reactions_create_for_team_discussion_in_org_response(response),
    ),
  )
  t.Done(data)
}

pub fn reactions_list_for_team_discussion_in_org(
  token,
  org,
  team_slug,
  discussion_number,
  content content,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.reactions_list_for_team_discussion_in_org_request(
      request,
      org,
      team_slug,
      discussion_number,
      content,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.reactions_list_for_team_discussion_in_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn security_advisories_list_global_advisories(
  token,
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
  let request = base_request(token)
  let request =
    operations.security_advisories_list_global_advisories_request(
      request,
      ghsa_id,
      type_,
      cve_id,
      ecosystem,
      severity,
      cwes,
      is_withdrawn,
      affects,
      published,
      updated,
      modified,
      epss_percentage,
      epss_percentile,
      before,
      after,
      direction,
      per_page,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.security_advisories_list_global_advisories_response(response),
    ),
  )
  t.Done(data)
}

pub fn codespaces_list_repo_secrets(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_list_repo_secrets_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_list_repo_secrets_response(response)),
  )
  t.Done(data)
}

pub fn gists_update_comment(token, gist_id, comment_id, data) {
  let request = base_request(token)
  let request =
    operations.gists_update_comment_request(request, gist_id, comment_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.gists_update_comment_response(response)),
  )
  t.Done(data)
}

pub fn gists_delete_comment(token, gist_id, comment_id) {
  let request = base_request(token)
  let request =
    operations.gists_delete_comment_request(request, gist_id, comment_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.gists_delete_comment_response(response)),
  )
  t.Done(data)
}

pub fn gists_get_comment(token, gist_id, comment_id) {
  let request = base_request(token)
  let request =
    operations.gists_get_comment_request(request, gist_id, comment_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.gists_get_comment_response(response)),
  )
  t.Done(data)
}

pub fn dependency_graph_diff_range(token, owner, repo, basehead, name name) {
  let request = base_request(token)
  let request =
    operations.dependency_graph_diff_range_request(
      request,
      owner,
      repo,
      basehead,
      name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.dependency_graph_diff_range_response(response)),
  )
  t.Done(data)
}

pub fn repos_update_status_check_protection(token, owner, repo, branch, data) {
  let request = base_request(token)
  let request =
    operations.repos_update_status_check_protection_request(
      request,
      owner,
      repo,
      branch,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_update_status_check_protection_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_remove_status_check_protection(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_remove_status_check_protection_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_remove_status_check_protection_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_status_checks_protection(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_get_status_checks_protection_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_status_checks_protection_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_delete_environment_secret(
  token,
  owner,
  repo,
  environment_name,
  secret_name,
) {
  let request = base_request(token)
  let request =
    operations.actions_delete_environment_secret_request(
      request,
      owner,
      repo,
      environment_name,
      secret_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_delete_environment_secret_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_create_or_update_environment_secret(
  token,
  owner,
  repo,
  environment_name,
  secret_name,
  data,
) {
  let request = base_request(token)
  let request =
    operations.actions_create_or_update_environment_secret_request(
      request,
      owner,
      repo,
      environment_name,
      secret_name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_create_or_update_environment_secret_response(response),
    ),
  )
  t.Done(data)
}

pub fn actions_get_environment_secret(
  token,
  owner,
  repo,
  environment_name,
  secret_name,
) {
  let request = base_request(token)
  let request =
    operations.actions_get_environment_secret_request(
      request,
      owner,
      repo,
      environment_name,
      secret_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_environment_secret_response(response)),
  )
  t.Done(data)
}

pub fn actions_download_artifact(
  token,
  owner,
  repo,
  artifact_id,
  archive_format,
) {
  let request = base_request(token)
  let request =
    operations.actions_download_artifact_request(
      request,
      owner,
      repo,
      artifact_id,
      archive_format,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_download_artifact_response(response)),
  )
  t.Done(data)
}

pub fn issues_update_comment(token, owner, repo, comment_id, data) {
  let request = base_request(token)
  let request =
    operations.issues_update_comment_request(
      request,
      owner,
      repo,
      comment_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_update_comment_response(response)),
  )
  t.Done(data)
}

pub fn issues_delete_comment(token, owner, repo, comment_id) {
  let request = base_request(token)
  let request =
    operations.issues_delete_comment_request(request, owner, repo, comment_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_delete_comment_response(response)),
  )
  t.Done(data)
}

pub fn issues_get_comment(token, owner, repo, comment_id) {
  let request = base_request(token)
  let request =
    operations.issues_get_comment_request(request, owner, repo, comment_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_get_comment_response(response)),
  )
  t.Done(data)
}

pub fn actions_set_repo_access_to_self_hosted_runner_group_in_org(
  token,
  org,
  runner_group_id,
  data,
) {
  let request = base_request(token)
  let request =
    operations.actions_set_repo_access_to_self_hosted_runner_group_in_org_request(
      request,
      org,
      runner_group_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_set_repo_access_to_self_hosted_runner_group_in_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_list_repo_access_to_self_hosted_runner_group_in_org(
  token,
  org,
  runner_group_id,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_repo_access_to_self_hosted_runner_group_in_org_request(
      request,
      org,
      runner_group_id,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_list_repo_access_to_self_hosted_runner_group_in_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn pulls_merge(token, owner, repo, pull_number, data) {
  let request = base_request(token)
  let request =
    operations.pulls_merge_request(request, owner, repo, pull_number, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.pulls_merge_response(response)))
  t.Done(data)
}

pub fn pulls_check_if_merged(token, owner, repo, pull_number) {
  let request = base_request(token)
  let request =
    operations.pulls_check_if_merged_request(request, owner, repo, pull_number)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_check_if_merged_response(response)),
  )
  t.Done(data)
}

pub fn actions_remove_self_hosted_runner_from_group_for_org(
  token,
  org,
  runner_group_id,
  runner_id,
) {
  let request = base_request(token)
  let request =
    operations.actions_remove_self_hosted_runner_from_group_for_org_request(
      request,
      org,
      runner_group_id,
      runner_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_remove_self_hosted_runner_from_group_for_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_add_self_hosted_runner_to_group_for_org(
  token,
  org,
  runner_group_id,
  runner_id,
) {
  let request = base_request(token)
  let request =
    operations.actions_add_self_hosted_runner_to_group_for_org_request(
      request,
      org,
      runner_group_id,
      runner_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_add_self_hosted_runner_to_group_for_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn search_code(
  token,
  q q,
  sort sort,
  order order,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.search_code_request(request, q, sort, order, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.search_code_response(response)))
  t.Done(data)
}

pub fn activity_list_public_org_events(token, org, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.activity_list_public_org_events_request(
      request,
      org,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_list_public_org_events_response(response)),
  )
  t.Done(data)
}

pub fn checks_create(token, owner, repo, data) {
  let request = base_request(token)
  let request = operations.checks_create_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.checks_create_response(response)))
  t.Done(data)
}

pub fn codespaces_set_repositories_for_secret_for_authenticated_user(
  token,
  secret_name,
  data,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_set_repositories_for_secret_for_authenticated_user_request(
      request,
      secret_name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_set_repositories_for_secret_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn codespaces_list_repositories_for_secret_for_authenticated_user(
  token,
  secret_name,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_list_repositories_for_secret_for_authenticated_user_request(
      request,
      secret_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_list_repositories_for_secret_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn codespaces_delete_from_organization(token, org, username, codespace_name) {
  let request = base_request(token)
  let request =
    operations.codespaces_delete_from_organization_request(
      request,
      org,
      username,
      codespace_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_delete_from_organization_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn issues_remove_assignees(token, owner, repo, issue_number, data) {
  let request = base_request(token)
  let request =
    operations.issues_remove_assignees_request(
      request,
      owner,
      repo,
      issue_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_remove_assignees_response(response)),
  )
  t.Done(data)
}

pub fn issues_add_assignees(token, owner, repo, issue_number, data) {
  let request = base_request(token)
  let request =
    operations.issues_add_assignees_request(
      request,
      owner,
      repo,
      issue_number,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_add_assignees_response(response)),
  )
  t.Done(data)
}

pub fn reactions_create_for_commit_comment(token, owner, repo, comment_id, data) {
  let request = base_request(token)
  let request =
    operations.reactions_create_for_commit_comment_request(
      request,
      owner,
      repo,
      comment_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.reactions_create_for_commit_comment_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn reactions_list_for_commit_comment(
  token,
  owner,
  repo,
  comment_id,
  content content,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.reactions_list_for_commit_comment_request(
      request,
      owner,
      repo,
      comment_id,
      content,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.reactions_list_for_commit_comment_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_list_org_secrets(token, org, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.actions_list_org_secrets_request(request, org, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_list_org_secrets_response(response)),
  )
  t.Done(data)
}

pub fn projects_list_collaborators(
  token,
  project_id,
  affiliation affiliation,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.projects_list_collaborators_request(
      request,
      project_id,
      affiliation,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.projects_list_collaborators_response(response)),
  )
  t.Done(data)
}

pub fn repos_create_deployment_status(token, owner, repo, deployment_id, data) {
  let request = base_request(token)
  let request =
    operations.repos_create_deployment_status_request(
      request,
      owner,
      repo,
      deployment_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_deployment_status_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_deployment_statuses(
  token,
  owner,
  repo,
  deployment_id,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_deployment_statuses_request(
      request,
      owner,
      repo,
      deployment_id,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_deployment_statuses_response(response)),
  )
  t.Done(data)
}

pub fn actions_list_self_hosted_runners_for_org(
  token,
  org,
  name name,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_self_hosted_runners_for_org_request(
      request,
      org,
      name,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_list_self_hosted_runners_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_create_repo_ruleset(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.repos_create_repo_ruleset_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_repo_ruleset_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_repo_rulesets(
  token,
  owner,
  repo,
  per_page per_page,
  page page,
  includes_parents includes_parents,
  targets targets,
) {
  let request = base_request(token)
  let request =
    operations.repos_get_repo_rulesets_request(
      request,
      owner,
      repo,
      per_page,
      page,
      includes_parents,
      targets,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_repo_rulesets_response(response)),
  )
  t.Done(data)
}

pub fn teams_list_repos_legacy(token, team_id, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.teams_list_repos_legacy_request(request, team_id, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_list_repos_legacy_response(response)),
  )
  t.Done(data)
}

pub fn apps_delete_installation(token, installation_id) {
  let request = base_request(token)
  let request =
    operations.apps_delete_installation_request(request, installation_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_delete_installation_response(response)),
  )
  t.Done(data)
}

pub fn apps_get_installation(token, installation_id) {
  let request = base_request(token)
  let request =
    operations.apps_get_installation_request(request, installation_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_get_installation_response(response)),
  )
  t.Done(data)
}

pub fn actions_get_org_public_key(token, org) {
  let request = base_request(token)
  let request = operations.actions_get_org_public_key_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_org_public_key_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_commits(
  token,
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
  let request = base_request(token)
  let request =
    operations.repos_list_commits_request(
      request,
      owner,
      repo,
      sha,
      path_,
      author,
      committer,
      since,
      until,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_commits_response(response)),
  )
  t.Done(data)
}

pub fn reactions_create_for_pull_request_review_comment(
  token,
  owner,
  repo,
  comment_id,
  data,
) {
  let request = base_request(token)
  let request =
    operations.reactions_create_for_pull_request_review_comment_request(
      request,
      owner,
      repo,
      comment_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.reactions_create_for_pull_request_review_comment_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn reactions_list_for_pull_request_review_comment(
  token,
  owner,
  repo,
  comment_id,
  content content,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.reactions_list_for_pull_request_review_comment_request(
      request,
      owner,
      repo,
      comment_id,
      content,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.reactions_list_for_pull_request_review_comment_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn repos_get_views(token, owner, repo, per per) {
  let request = base_request(token)
  let request = operations.repos_get_views_request(request, owner, repo, per)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_views_response(response)),
  )
  t.Done(data)
}

pub fn teams_remove_repo_legacy(token, team_id, owner, repo) {
  let request = base_request(token)
  let request =
    operations.teams_remove_repo_legacy_request(request, team_id, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_remove_repo_legacy_response(response)),
  )
  t.Done(data)
}

pub fn teams_add_or_update_repo_permissions_legacy(
  token,
  team_id,
  owner,
  repo,
  data,
) {
  let request = base_request(token)
  let request =
    operations.teams_add_or_update_repo_permissions_legacy_request(
      request,
      team_id,
      owner,
      repo,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.teams_add_or_update_repo_permissions_legacy_response(response),
    ),
  )
  t.Done(data)
}

pub fn teams_check_permissions_for_repo_legacy(token, team_id, owner, repo) {
  let request = base_request(token)
  let request =
    operations.teams_check_permissions_for_repo_legacy_request(
      request,
      team_id,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_check_permissions_for_repo_legacy_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn codes_of_conduct_get_all_codes_of_conduct(token) {
  let request = base_request(token)
  let request =
    operations.codes_of_conduct_get_all_codes_of_conduct_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codes_of_conduct_get_all_codes_of_conduct_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn codespaces_start_for_authenticated_user(token, codespace_name) {
  let request = base_request(token)
  let request =
    operations.codespaces_start_for_authenticated_user_request(
      request,
      codespace_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_start_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn search_commits(
  token,
  q q,
  sort sort,
  order order,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.search_commits_request(request, q, sort, order, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.search_commits_response(response)))
  t.Done(data)
}

pub fn orgs_list_for_authenticated_user(token, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.orgs_list_for_authenticated_user_request(request, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_for_authenticated_user_response(response)),
  )
  t.Done(data)
}

pub fn repos_delete_org_ruleset(token, org, ruleset_id) {
  let request = base_request(token)
  let request =
    operations.repos_delete_org_ruleset_request(request, org, ruleset_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_org_ruleset_response(response)),
  )
  t.Done(data)
}

pub fn repos_update_org_ruleset(token, org, ruleset_id, data) {
  let request = base_request(token)
  let request =
    operations.repos_update_org_ruleset_request(request, org, ruleset_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_update_org_ruleset_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_org_ruleset(token, org, ruleset_id) {
  let request = base_request(token)
  let request =
    operations.repos_get_org_ruleset_request(request, org, ruleset_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_org_ruleset_response(response)),
  )
  t.Done(data)
}

pub fn codespaces_get_export_details_for_authenticated_user(
  token,
  codespace_name,
  export_id,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_get_export_details_for_authenticated_user_request(
      request,
      codespace_name,
      export_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_get_export_details_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn codespaces_get_repo_public_key(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.codespaces_get_repo_public_key_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_get_repo_public_key_response(response)),
  )
  t.Done(data)
}

pub fn dependency_graph_create_repository_snapshot(token, owner, repo, snapshot) {
  let request = base_request(token)
  let request =
    operations.dependency_graph_create_repository_snapshot_request(
      request,
      owner,
      repo,
      snapshot,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.dependency_graph_create_repository_snapshot_response(response),
    ),
  )
  t.Done(data)
}

pub fn orgs_list_failed_invitations(token, org, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.orgs_list_failed_invitations_request(
      request,
      org,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_failed_invitations_response(response)),
  )
  t.Done(data)
}

pub fn apps_get_webhook_delivery(token, delivery_id) {
  let request = base_request(token)
  let request =
    operations.apps_get_webhook_delivery_request(request, delivery_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_get_webhook_delivery_response(response)),
  )
  t.Done(data)
}

pub fn secret_scanning_list_locations_for_alert(
  token,
  owner,
  repo,
  alert_number,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.secret_scanning_list_locations_for_alert_request(
      request,
      owner,
      repo,
      alert_number,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.secret_scanning_list_locations_for_alert_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn secret_scanning_list_alerts_for_org(
  token,
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
  let request = base_request(token)
  let request =
    operations.secret_scanning_list_alerts_for_org_request(
      request,
      org,
      state,
      secret_type,
      resolution,
      sort,
      direction,
      page,
      per_page,
      before,
      after,
      validity,
      is_publicly_leaked,
      is_multi_repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.secret_scanning_list_alerts_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn users_list_following_for_user(
  token,
  username,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.users_list_following_for_user_request(
      request,
      username,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_list_following_for_user_response(response)),
  )
  t.Done(data)
}

pub fn repos_delete_tag_protection(token, owner, repo, tag_protection_id) {
  let request = base_request(token)
  let request =
    operations.repos_delete_tag_protection_request(
      request,
      owner,
      repo,
      tag_protection_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_tag_protection_response(response)),
  )
  t.Done(data)
}

pub fn actions_delete_self_hosted_runner_from_org(token, org, runner_id) {
  let request = base_request(token)
  let request =
    operations.actions_delete_self_hosted_runner_from_org_request(
      request,
      org,
      runner_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_delete_self_hosted_runner_from_org_response(response),
    ),
  )
  t.Done(data)
}

pub fn actions_get_self_hosted_runner_for_org(token, org, runner_id) {
  let request = base_request(token)
  let request =
    operations.actions_get_self_hosted_runner_for_org_request(
      request,
      org,
      runner_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_self_hosted_runner_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn pulls_list_files(
  token,
  owner,
  repo,
  pull_number,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.pulls_list_files_request(
      request,
      owner,
      repo,
      pull_number,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.pulls_list_files_response(response)),
  )
  t.Done(data)
}

pub fn orgs_create_webhook(token, org, data) {
  let request = base_request(token)
  let request = operations.orgs_create_webhook_request(request, org, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_create_webhook_response(response)),
  )
  t.Done(data)
}

pub fn orgs_list_webhooks(token, org, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.orgs_list_webhooks_request(request, org, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_webhooks_response(response)),
  )
  t.Done(data)
}

pub fn apps_list_installations_for_authenticated_user(
  token,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.apps_list_installations_for_authenticated_user_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.apps_list_installations_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn security_advisories_get_global_advisory(token, ghsa_id) {
  let request = base_request(token)
  let request =
    operations.security_advisories_get_global_advisory_request(request, ghsa_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.security_advisories_get_global_advisory_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_create_release(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.repos_create_release_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_release_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_releases(token, owner, repo, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.repos_list_releases_request(request, owner, repo, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_releases_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_languages(token, owner, repo) {
  let request = base_request(token)
  let request = operations.repos_list_languages_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_languages_response(response)),
  )
  t.Done(data)
}

pub fn codespaces_pre_flight_with_repo_for_authenticated_user(
  token,
  owner,
  repo,
  ref ref,
  client_ip client_ip,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_pre_flight_with_repo_for_authenticated_user_request(
      request,
      owner,
      repo,
      ref,
      client_ip,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_pre_flight_with_repo_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn reactions_delete_for_team_discussion_comment(
  token,
  org,
  team_slug,
  discussion_number,
  comment_number,
  reaction_id,
) {
  let request = base_request(token)
  let request =
    operations.reactions_delete_for_team_discussion_comment_request(
      request,
      org,
      team_slug,
      discussion_number,
      comment_number,
      reaction_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.reactions_delete_for_team_discussion_comment_response(response),
    ),
  )
  t.Done(data)
}

pub fn repos_transfer(token, owner, repo, data) {
  let request = base_request(token)
  let request = operations.repos_transfer_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.repos_transfer_response(response)))
  t.Done(data)
}

pub fn codespaces_list_secrets_for_authenticated_user(
  token,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.codespaces_list_secrets_for_authenticated_user_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.codespaces_list_secrets_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn gists_list_for_user(
  token,
  username,
  since since,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.gists_list_for_user_request(
      request,
      username,
      since,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.gists_list_for_user_response(response)),
  )
  t.Done(data)
}

pub fn orgs_update(token, org, data) {
  let request = base_request(token)
  let request = operations.orgs_update_request(request, org, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.orgs_update_response(response)))
  t.Done(data)
}

pub fn orgs_delete(token, org) {
  let request = base_request(token)
  let request = operations.orgs_delete_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.orgs_delete_response(response)))
  t.Done(data)
}

pub fn orgs_get(token, org) {
  let request = base_request(token)
  let request = operations.orgs_get_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.orgs_get_response(response)))
  t.Done(data)
}

pub fn teams_list_projects_in_org(
  token,
  org,
  team_slug,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.teams_list_projects_in_org_request(
      request,
      org,
      team_slug,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_list_projects_in_org_response(response)),
  )
  t.Done(data)
}

pub fn repos_update_pull_request_review_protection(
  token,
  owner,
  repo,
  branch,
  data,
) {
  let request = base_request(token)
  let request =
    operations.repos_update_pull_request_review_protection_request(
      request,
      owner,
      repo,
      branch,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.repos_update_pull_request_review_protection_response(response),
    ),
  )
  t.Done(data)
}

pub fn repos_delete_pull_request_review_protection(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_delete_pull_request_review_protection_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.repos_delete_pull_request_review_protection_response(response),
    ),
  )
  t.Done(data)
}

pub fn repos_get_pull_request_review_protection(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_get_pull_request_review_protection_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_pull_request_review_protection_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_set_selected_repos_for_org_secret(token, org, secret_name, data) {
  let request = base_request(token)
  let request =
    operations.actions_set_selected_repos_for_org_secret_request(
      request,
      org,
      secret_name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_set_selected_repos_for_org_secret_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_list_selected_repos_for_org_secret(
  token,
  org,
  secret_name,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_selected_repos_for_org_secret_request(
      request,
      org,
      secret_name,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_list_selected_repos_for_org_secret_response(response),
    ),
  )
  t.Done(data)
}

pub fn migrations_unlock_repo_for_org(token, org, migration_id, repo_name) {
  let request = base_request(token)
  let request =
    operations.migrations_unlock_repo_for_org_request(
      request,
      org,
      migration_id,
      repo_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.migrations_unlock_repo_for_org_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_custom_deployment_rule_integrations(
  token,
  owner,
  repo,
  environment_name,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_custom_deployment_rule_integrations_request(
      request,
      owner,
      repo,
      environment_name,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.repos_list_custom_deployment_rule_integrations_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_remove_selected_repo_from_org_variable(
  token,
  org,
  name,
  repository_id,
) {
  let request = base_request(token)
  let request =
    operations.actions_remove_selected_repo_from_org_variable_request(
      request,
      org,
      name,
      repository_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.actions_remove_selected_repo_from_org_variable_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_add_selected_repo_to_org_variable(
  token,
  org,
  name,
  repository_id,
) {
  let request = base_request(token)
  let request =
    operations.actions_add_selected_repo_to_org_variable_request(
      request,
      org,
      name,
      repository_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_add_selected_repo_to_org_variable_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn migrations_list_repos_for_org(
  token,
  org,
  migration_id,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.migrations_list_repos_for_org_request(
      request,
      org,
      migration_id,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.migrations_list_repos_for_org_response(response)),
  )
  t.Done(data)
}

pub fn users_delete_social_account_for_authenticated_user(token, data) {
  let request = base_request(token)
  let request =
    operations.users_delete_social_account_for_authenticated_user_request(
      request,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.users_delete_social_account_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn users_add_social_account_for_authenticated_user(token, data) {
  let request = base_request(token)
  let request =
    operations.users_add_social_account_for_authenticated_user_request(
      request,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.users_add_social_account_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn users_list_social_accounts_for_authenticated_user(
  token,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.users_list_social_accounts_for_authenticated_user_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.users_list_social_accounts_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn reactions_delete_for_issue(token, owner, repo, issue_number, reaction_id) {
  let request = base_request(token)
  let request =
    operations.reactions_delete_for_issue_request(
      request,
      owner,
      repo,
      issue_number,
      reaction_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.reactions_delete_for_issue_response(response)),
  )
  t.Done(data)
}

pub fn apps_remove_repo_from_installation_for_authenticated_user(
  token,
  installation_id,
  repository_id,
) {
  let request = base_request(token)
  let request =
    operations.apps_remove_repo_from_installation_for_authenticated_user_request(
      request,
      installation_id,
      repository_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.apps_remove_repo_from_installation_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn apps_add_repo_to_installation_for_authenticated_user(
  token,
  installation_id,
  repository_id,
) {
  let request = base_request(token)
  let request =
    operations.apps_add_repo_to_installation_for_authenticated_user_request(
      request,
      installation_id,
      repository_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.apps_add_repo_to_installation_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn users_list_gpg_keys_for_user(
  token,
  username,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.users_list_gpg_keys_for_user_request(
      request,
      username,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_list_gpg_keys_for_user_response(response)),
  )
  t.Done(data)
}

pub fn packages_list_packages_for_authenticated_user(
  token,
  package_type package_type,
  visibility visibility,
  page page,
  per_page per_page,
) {
  let request = base_request(token)
  let request =
    operations.packages_list_packages_for_authenticated_user_request(
      request,
      package_type,
      visibility,
      page,
      per_page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.packages_list_packages_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn teams_create_discussion_in_org(token, org, team_slug, data) {
  let request = base_request(token)
  let request =
    operations.teams_create_discussion_in_org_request(
      request,
      org,
      team_slug,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_create_discussion_in_org_response(response)),
  )
  t.Done(data)
}

pub fn teams_list_discussions_in_org(
  token,
  org,
  team_slug,
  direction direction,
  per_page per_page,
  page page,
  pinned pinned,
) {
  let request = base_request(token)
  let request =
    operations.teams_list_discussions_in_org_request(
      request,
      org,
      team_slug,
      direction,
      per_page,
      page,
      pinned,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_list_discussions_in_org_response(response)),
  )
  t.Done(data)
}

pub fn checks_list_for_ref(
  token,
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
  let request = base_request(token)
  let request =
    operations.checks_list_for_ref_request(
      request,
      owner,
      repo,
      ref,
      check_name,
      status,
      filter,
      per_page,
      page,
      app_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.checks_list_for_ref_response(response)),
  )
  t.Done(data)
}

pub fn repos_delete_an_environment(token, owner, repo, environment_name) {
  let request = base_request(token)
  let request =
    operations.repos_delete_an_environment_request(
      request,
      owner,
      repo,
      environment_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_an_environment_response(response)),
  )
  t.Done(data)
}

pub fn repos_create_or_update_environment(
  token,
  owner,
  repo,
  environment_name,
  data,
) {
  let request = base_request(token)
  let request =
    operations.repos_create_or_update_environment_request(
      request,
      owner,
      repo,
      environment_name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_or_update_environment_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_get_environment(token, owner, repo, environment_name) {
  let request = base_request(token)
  let request =
    operations.repos_get_environment_request(
      request,
      owner,
      repo,
      environment_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_environment_response(response)),
  )
  t.Done(data)
}

pub fn repos_download_tarball_archive(token, owner, repo, ref) {
  let request = base_request(token)
  let request =
    operations.repos_download_tarball_archive_request(request, owner, repo, ref)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_download_tarball_archive_response(response)),
  )
  t.Done(data)
}

pub fn orgs_update_pat_accesses(token, org, data) {
  let request = base_request(token)
  let request = operations.orgs_update_pat_accesses_request(request, org, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_update_pat_accesses_response(response)),
  )
  t.Done(data)
}

pub fn orgs_list_pat_grants(
  token,
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
  let request = base_request(token)
  let request =
    operations.orgs_list_pat_grants_request(
      request,
      org,
      per_page,
      page,
      sort,
      direction,
      owner,
      repository,
      permission,
      last_used_before,
      last_used_after,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_pat_grants_response(response)),
  )
  t.Done(data)
}

pub fn repos_accept_invitation_for_authenticated_user(token, invitation_id) {
  let request = base_request(token)
  let request =
    operations.repos_accept_invitation_for_authenticated_user_request(
      request,
      invitation_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.repos_accept_invitation_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn repos_decline_invitation_for_authenticated_user(token, invitation_id) {
  let request = base_request(token)
  let request =
    operations.repos_decline_invitation_for_authenticated_user_request(
      request,
      invitation_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.repos_decline_invitation_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn code_security_get_repositories_for_configuration(
  token,
  org,
  configuration_id,
  per_page per_page,
  before before,
  after after,
  status status,
) {
  let request = base_request(token)
  let request =
    operations.code_security_get_repositories_for_configuration_request(
      request,
      org,
      configuration_id,
      per_page,
      before,
      after,
      status,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.code_security_get_repositories_for_configuration_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn repos_get_repo_rule_suites(
  token,
  owner,
  repo,
  ref ref,
  time_period time_period,
  actor_name actor_name,
  rule_suite_result rule_suite_result,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_get_repo_rule_suites_request(
      request,
      owner,
      repo,
      ref,
      time_period,
      actor_name,
      rule_suite_result,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_repo_rule_suites_response(response)),
  )
  t.Done(data)
}

pub fn repos_list_invitations(token, owner, repo, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.repos_list_invitations_request(
      request,
      owner,
      repo,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_invitations_response(response)),
  )
  t.Done(data)
}

pub fn users_get_by_username(token, username) {
  let request = base_request(token)
  let request = operations.users_get_by_username_request(request, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_get_by_username_response(response)),
  )
  t.Done(data)
}

pub fn actions_list_workflow_run_artifacts(
  token,
  owner,
  repo,
  run_id,
  per_page per_page,
  page page,
  name name,
) {
  let request = base_request(token)
  let request =
    operations.actions_list_workflow_run_artifacts_request(
      request,
      owner,
      repo,
      run_id,
      per_page,
      page,
      name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_list_workflow_run_artifacts_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn packages_get_all_package_versions_for_package_owned_by_org(
  token,
  org,
  package_type,
  package_name,
  page page,
  per_page per_page,
  state state,
) {
  let request = base_request(token)
  let request =
    operations.packages_get_all_package_versions_for_package_owned_by_org_request(
      request,
      org,
      package_type,
      package_name,
      page,
      per_page,
      state,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.packages_get_all_package_versions_for_package_owned_by_org_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn repos_get_readme_in_directory(token, owner, repo, dir, ref ref) {
  let request = base_request(token)
  let request =
    operations.repos_get_readme_in_directory_request(
      request,
      owner,
      repo,
      dir,
      ref,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_readme_in_directory_response(response)),
  )
  t.Done(data)
}

pub fn teams_list_for_authenticated_user(token, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.teams_list_for_authenticated_user_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.teams_list_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn code_scanning_delete_analysis(
  token,
  owner,
  repo,
  analysis_id,
  confirm_delete confirm_delete,
) {
  let request = base_request(token)
  let request =
    operations.code_scanning_delete_analysis_request(
      request,
      owner,
      repo,
      analysis_id,
      confirm_delete,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_scanning_delete_analysis_response(response)),
  )
  t.Done(data)
}

pub fn code_scanning_get_analysis(token, owner, repo, analysis_id) {
  let request = base_request(token)
  let request =
    operations.code_scanning_get_analysis_request(
      request,
      owner,
      repo,
      analysis_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_scanning_get_analysis_response(response)),
  )
  t.Done(data)
}

pub fn git_create_blob(token, owner, repo, data) {
  let request = base_request(token)
  let request = operations.git_create_blob_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.git_create_blob_response(response)),
  )
  t.Done(data)
}

pub fn actions_get_workflow_usage(token, owner, repo, workflow_id) {
  let request = base_request(token)
  let request =
    operations.actions_get_workflow_usage_request(
      request,
      owner,
      repo,
      workflow_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_workflow_usage_response(response)),
  )
  t.Done(data)
}

pub fn apps_list_webhook_deliveries(token, per_page per_page, cursor cursor) {
  let request = base_request(token)
  let request =
    operations.apps_list_webhook_deliveries_request(request, per_page, cursor)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_list_webhook_deliveries_response(response)),
  )
  t.Done(data)
}

pub fn checks_set_suites_preferences(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.checks_set_suites_preferences_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.checks_set_suites_preferences_response(response)),
  )
  t.Done(data)
}

pub fn api_insights_get_subject_stats(
  token,
  org,
  min_timestamp min_timestamp,
  max_timestamp max_timestamp,
  page page,
  per_page per_page,
  direction direction,
  sort sort,
) {
  let request = base_request(token)
  let request =
    operations.api_insights_get_subject_stats_request(
      request,
      org,
      min_timestamp,
      max_timestamp,
      page,
      per_page,
      direction,
      sort,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.api_insights_get_subject_stats_response(response)),
  )
  t.Done(data)
}

pub fn gists_create(token, data) {
  let request = base_request(token)
  let request = operations.gists_create_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.gists_create_response(response)))
  t.Done(data)
}

pub fn gists_list(token, since since, per_page per_page, page page) {
  let request = base_request(token)
  let request = operations.gists_list_request(request, since, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.gists_list_response(response)))
  t.Done(data)
}

pub fn users_list_public_keys_for_user(
  token,
  username,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.users_list_public_keys_for_user_request(
      request,
      username,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_list_public_keys_for_user_response(response)),
  )
  t.Done(data)
}

pub fn repos_delete_branch_protection(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_delete_branch_protection_request(
      request,
      owner,
      repo,
      branch,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_delete_branch_protection_response(response)),
  )
  t.Done(data)
}

pub fn repos_update_branch_protection(token, owner, repo, branch, data) {
  let request = base_request(token)
  let request =
    operations.repos_update_branch_protection_request(
      request,
      owner,
      repo,
      branch,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_update_branch_protection_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_branch_protection(token, owner, repo, branch) {
  let request = base_request(token)
  let request =
    operations.repos_get_branch_protection_request(request, owner, repo, branch)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_branch_protection_response(response)),
  )
  t.Done(data)
}

pub fn migrations_get_large_files(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.migrations_get_large_files_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.migrations_get_large_files_response(response)),
  )
  t.Done(data)
}

pub fn activity_list_watched_repos_for_authenticated_user(
  token,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.activity_list_watched_repos_for_authenticated_user_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.activity_list_watched_repos_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn repos_create_using_template(token, template_owner, template_repo, data) {
  let request = base_request(token)
  let request =
    operations.repos_create_using_template_request(
      request,
      template_owner,
      template_repo,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_using_template_response(response)),
  )
  t.Done(data)
}

pub fn billing_get_github_packages_billing_org(token, org) {
  let request = base_request(token)
  let request =
    operations.billing_get_github_packages_billing_org_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.billing_get_github_packages_billing_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn code_scanning_list_alerts_for_org(
  token,
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
  let request = base_request(token)
  let request =
    operations.code_scanning_list_alerts_for_org_request(
      request,
      org,
      tool_name,
      tool_guid,
      before,
      after,
      page,
      per_page,
      direction,
      state,
      sort,
      severity,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.code_scanning_list_alerts_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn dependabot_delete_org_secret(token, org, secret_name) {
  let request = base_request(token)
  let request =
    operations.dependabot_delete_org_secret_request(request, org, secret_name)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.dependabot_delete_org_secret_response(response)),
  )
  t.Done(data)
}

pub fn dependabot_create_or_update_org_secret(token, org, secret_name, data) {
  let request = base_request(token)
  let request =
    operations.dependabot_create_or_update_org_secret_request(
      request,
      org,
      secret_name,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.dependabot_create_or_update_org_secret_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn dependabot_get_org_secret(token, org, secret_name) {
  let request = base_request(token)
  let request =
    operations.dependabot_get_org_secret_request(request, org, secret_name)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.dependabot_get_org_secret_response(response)),
  )
  t.Done(data)
}

pub fn licenses_get_all_commonly_used(
  token,
  featured featured,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.licenses_get_all_commonly_used_request(
      request,
      featured,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.licenses_get_all_commonly_used_response(response)),
  )
  t.Done(data)
}

pub fn codespaces_export_for_authenticated_user(token, codespace_name) {
  let request = base_request(token)
  let request =
    operations.codespaces_export_for_authenticated_user_request(
      request,
      codespace_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_export_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn apps_list_accounts_for_plan(
  token,
  plan_id,
  sort sort,
  direction direction,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.apps_list_accounts_for_plan_request(
      request,
      plan_id,
      sort,
      direction,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_list_accounts_for_plan_response(response)),
  )
  t.Done(data)
}

pub fn packages_get_all_package_versions_for_package_owned_by_user(
  token,
  username,
  package_type,
  package_name,
) {
  let request = base_request(token)
  let request =
    operations.packages_get_all_package_versions_for_package_owned_by_user_request(
      request,
      username,
      package_type,
      package_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.packages_get_all_package_versions_for_package_owned_by_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn actions_list_runner_applications_for_org(token, org) {
  let request = base_request(token)
  let request =
    operations.actions_list_runner_applications_for_org_request(request, org)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_list_runner_applications_for_org_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn activity_delete_thread_subscription(token, thread_id) {
  let request = base_request(token)
  let request =
    operations.activity_delete_thread_subscription_request(request, thread_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_delete_thread_subscription_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn activity_set_thread_subscription(token, thread_id, data) {
  let request = base_request(token)
  let request =
    operations.activity_set_thread_subscription_request(
      request,
      thread_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.activity_set_thread_subscription_response(response)),
  )
  t.Done(data)
}

pub fn activity_get_thread_subscription_for_authenticated_user(token, thread_id) {
  let request = base_request(token)
  let request =
    operations.activity_get_thread_subscription_for_authenticated_user_request(
      request,
      thread_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.activity_get_thread_subscription_for_authenticated_user_response(
        response,
      ),
    ),
  )
  t.Done(data)
}

pub fn git_create_tree(token, owner, repo, data) {
  let request = base_request(token)
  let request = operations.git_create_tree_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.git_create_tree_response(response)),
  )
  t.Done(data)
}

pub fn repos_create_dispatch_event(token, owner, repo, data) {
  let request = base_request(token)
  let request =
    operations.repos_create_dispatch_event_request(request, owner, repo, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_dispatch_event_response(response)),
  )
  t.Done(data)
}

pub fn repos_get_contributors_stats(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_get_contributors_stats_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_contributors_stats_response(response)),
  )
  t.Done(data)
}

pub fn gists_list_commits(token, gist_id, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.gists_list_commits_request(request, gist_id, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.gists_list_commits_response(response)),
  )
  t.Done(data)
}

pub fn billing_get_github_packages_billing_user(token, username) {
  let request = base_request(token)
  let request =
    operations.billing_get_github_packages_billing_user_request(
      request,
      username,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.billing_get_github_packages_billing_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn issues_list_events_for_timeline(
  token,
  owner,
  repo,
  issue_number,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.issues_list_events_for_timeline_request(
      request,
      owner,
      repo,
      issue_number,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.issues_list_events_for_timeline_response(response)),
  )
  t.Done(data)
}

pub fn users_unblock(token, username) {
  let request = base_request(token)
  let request = operations.users_unblock_request(request, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.users_unblock_response(response)))
  t.Done(data)
}

pub fn users_block(token, username) {
  let request = base_request(token)
  let request = operations.users_block_request(request, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.users_block_response(response)))
  t.Done(data)
}

pub fn users_check_blocked(token, username) {
  let request = base_request(token)
  let request = operations.users_check_blocked_request(request, username)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.users_check_blocked_response(response)),
  )
  t.Done(data)
}

pub fn search_repos(
  token,
  q q,
  sort sort,
  order order,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.search_repos_request(request, q, sort, order, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.search_repos_response(response)))
  t.Done(data)
}

pub fn orgs_review_pat_grant_requests_in_bulk(token, org, data) {
  let request = base_request(token)
  let request =
    operations.orgs_review_pat_grant_requests_in_bulk_request(
      request,
      org,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_review_pat_grant_requests_in_bulk_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn orgs_list_pat_grant_requests(
  token,
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
  let request = base_request(token)
  let request =
    operations.orgs_list_pat_grant_requests_request(
      request,
      org,
      per_page,
      page,
      sort,
      direction,
      owner,
      repository,
      permission,
      last_used_before,
      last_used_after,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.orgs_list_pat_grant_requests_response(response)),
  )
  t.Done(data)
}

pub fn checks_get_suite(token, owner, repo, check_suite_id) {
  let request = base_request(token)
  let request =
    operations.checks_get_suite_request(request, owner, repo, check_suite_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.checks_get_suite_response(response)),
  )
  t.Done(data)
}

pub fn repos_create_deployment_branch_policy(
  token,
  owner,
  repo,
  environment_name,
  deployment_branch_policy_name_pattern_with_type,
) {
  let request = base_request(token)
  let request =
    operations.repos_create_deployment_branch_policy_request(
      request,
      owner,
      repo,
      environment_name,
      deployment_branch_policy_name_pattern_with_type,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_create_deployment_branch_policy_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_list_deployment_branch_policies(
  token,
  owner,
  repo,
  environment_name,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.repos_list_deployment_branch_policies_request(
      request,
      owner,
      repo,
      environment_name,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_list_deployment_branch_policies_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn codespaces_stop_for_authenticated_user(token, codespace_name) {
  let request = base_request(token)
  let request =
    operations.codespaces_stop_for_authenticated_user_request(
      request,
      codespace_name,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.codespaces_stop_for_authenticated_user_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn reactions_create_for_issue_comment(token, owner, repo, comment_id, data) {
  let request = base_request(token)
  let request =
    operations.reactions_create_for_issue_comment_request(
      request,
      owner,
      repo,
      comment_id,
      data,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.reactions_create_for_issue_comment_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn reactions_list_for_issue_comment(
  token,
  owner,
  repo,
  comment_id,
  content content,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.reactions_list_for_issue_comment_request(
      request,
      owner,
      repo,
      comment_id,
      content,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.reactions_list_for_issue_comment_response(response)),
  )
  t.Done(data)
}

pub fn actions_set_allowed_actions_repository(
  token,
  owner,
  repo,
  selected_actions,
) {
  let request = base_request(token)
  let request =
    operations.actions_set_allowed_actions_repository_request(
      request,
      owner,
      repo,
      selected_actions,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_set_allowed_actions_repository_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn actions_get_allowed_actions_repository(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.actions_get_allowed_actions_repository_request(
      request,
      owner,
      repo,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.actions_get_allowed_actions_repository_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn apps_list_plans_stubbed(token, per_page per_page, page page) {
  let request = base_request(token)
  let request =
    operations.apps_list_plans_stubbed_request(request, per_page, page)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.apps_list_plans_stubbed_response(response)),
  )
  t.Done(data)
}

pub fn users_list_followers_for_authenticated_user(
  token,
  per_page per_page,
  page page,
) {
  let request = base_request(token)
  let request =
    operations.users_list_followers_for_authenticated_user_request(
      request,
      per_page,
      page,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.users_list_followers_for_authenticated_user_response(response),
    ),
  )
  t.Done(data)
}

pub fn repos_get_clones(token, owner, repo, per per) {
  let request = base_request(token)
  let request = operations.repos_get_clones_request(request, owner, repo, per)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_get_clones_response(response)),
  )
  t.Done(data)
}

pub fn repos_disable_vulnerability_alerts(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_disable_vulnerability_alerts_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_disable_vulnerability_alerts_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_enable_vulnerability_alerts(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_enable_vulnerability_alerts_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_enable_vulnerability_alerts_response(
      response,
    )),
  )
  t.Done(data)
}

pub fn repos_check_vulnerability_alerts(token, owner, repo) {
  let request = base_request(token)
  let request =
    operations.repos_check_vulnerability_alerts_request(request, owner, repo)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.repos_check_vulnerability_alerts_response(response)),
  )
  t.Done(data)
}
