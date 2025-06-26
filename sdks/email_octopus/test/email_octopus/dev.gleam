import gleam/io
import oas/generator
import snag

pub fn main() {
  case
    generator.build(
      "./priv/email_octopus.openapi.json",
      ".",
      "email_octopus",
      [],
    )
  {
    Ok(_) -> Nil
    Error(reason) -> io.print(snag.pretty_print(reason))
  }
}
