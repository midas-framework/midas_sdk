import gleam/io
import oas/generator
import snag

pub fn main() {
  case generator.build("./priv/ldbws.openapi.json", ".", "ldbws", []) {
    Ok(_) -> Nil
    Error(reason) -> io.print(snag.pretty_print(reason))
  }
}
