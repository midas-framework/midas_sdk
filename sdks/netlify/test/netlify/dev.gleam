import gleam/io
import oas/generator
import snag

pub fn main() {
  case generator.build("./priv/netlify.openapi.json", ".", "netlify", []) {
    Ok(_) -> Nil
    Error(reason) -> io.print(snag.pretty_print(reason))
  }
}
