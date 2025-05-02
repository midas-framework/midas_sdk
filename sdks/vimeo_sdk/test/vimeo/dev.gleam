import gleam/io
import oas/generator
import snag

pub fn main() {
  case
    generator.build("./priv/vimeo.openapi.json", ".", "vimeo_sdk", [
      // invalid path
      "get_text_tracks_alt1",
      // multiple definition
      "get_folder_items", "get_team_information",
    ])
  {
    Ok(_) -> Nil
    Error(reason) -> io.print(snag.pretty_print(reason))
  }
}
