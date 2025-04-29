# github_sdk

Gleam client for the github API

[![Package Version](https://img.shields.io/hexpm/v/github_sdk)](https://hex.pm/packages/github_sdk)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/github_sdk/)

```sh
gleam add github_sdk@1
```
```gleam
import github_sdk

pub fn main() -> Nil {
  // TODO: An example of the project in use
}
```

Further documentation can be found at <https://hexdocs.pm/github_sdk>.

## Development

The API is generated from githubs published Open API spec.
To generate the code run
```
gleam run -m github_sdk/dev
```

```sh
gleam test  # Run the tests
```
