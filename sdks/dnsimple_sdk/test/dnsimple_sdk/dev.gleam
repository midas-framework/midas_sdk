import gleam/io
import oas/generator
import snag

pub fn main() {
  case
    generator.build("./priv/dnsimple.openapi.json", ".", "dnsimple_sdk", [])
  {
    Ok(_) -> Nil
    Error(reason) -> io.print(snag.pretty_print(reason))
  }
}
