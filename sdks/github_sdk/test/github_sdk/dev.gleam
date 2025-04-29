import gleam/io
import midas/gen
import snag

pub fn main() {
  case gen.build("./priv/github.openapi.json", ".", "github_sdk") {
    Ok(_) -> Nil
    Error(reason) -> io.print(snag.pretty_print(reason))
  }
}
