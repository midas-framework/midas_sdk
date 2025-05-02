# strava_sdk

[![Package Version](https://img.shields.io/hexpm/v/strava_sdk)](https://hex.pm/packages/strava_sdk)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/strava_sdk/)

```sh
gleam add strava_sdk@1
```
```gleam
import strava_sdk

pub fn main() -> Nil {
  // TODO: An example of the project in use
}
```

Further documentation can be found at <https://hexdocs.pm/strava_sdk>.

## Development
The API is generated from githubs published Open API spec.
To generate the code run
```
gleam run -m strava/dev
```
```sh
gleam run   # Run the project
gleam test  # Run the tests
```

"""
Hi I’m trying to generate a strava API client for gleam

I pulled the API spec from https://developers.strava.com/swagger/swagger.json
There are two errors that break the generator I am working. But that I also believe are errors in implementation.

First and not such an issue the “openapi” field is missing from the top level object.

Second several parameters do not have a schema field. (or a content field). The spec says they must be defined with at least one of these.

Is the schema open to contribution, I’m  happy to apply fixes to these if that is possible.
"""
