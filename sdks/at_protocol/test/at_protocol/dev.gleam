import gleam/io
import oas/generator
import snag

pub fn main() {
  case
    generator.build("./priv/at_protocol.openapi.json", ".", "at_protocol", [])
  {
    Ok(_) -> Nil
    Error(reason) -> io.print(snag.pretty_print(reason))
  }
}
