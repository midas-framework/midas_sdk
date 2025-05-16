import gleam/io
import oas/generator
import snag

pub fn main() {
  case
    generator.build("./priv/anthropic.openapi.json", ".", "anthropic_sdk", [])
  {
    Ok(_) -> Nil
    Error(reason) -> io.print(snag.pretty_print(reason))
  }
}
