import gleam/io
import oas/generator
import snag

pub fn main() {
  case generator.build("./priv/strava.openapi.json", ".", "strava_sdk") {
    Ok(_) -> Nil
    Error(reason) -> io.print(snag.pretty_print(reason))
  }
}
