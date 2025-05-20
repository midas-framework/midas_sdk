import gleam/io
import oas/generator
import snag

pub fn main() {
  case
    generator.build("./priv/github.openapi.json", ".", "github_sdk", [
      // Has inline object definition of error response
      "orgs/remove-outside-collaborator",
      "teams/add-or-update-project-permissions-in-org",
    ])
  {
    Ok(_) -> Nil
    Error(reason) -> io.print(snag.pretty_print(reason))
  }
}
