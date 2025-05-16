# anthropic_sdk

[![Package Version](https://img.shields.io/hexpm/v/anthropic_sdk)](https://hex.pm/packages/anthropic_sdk)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/anthropic_sdk/)

```sh
gleam add anthropic_sdk@1
```
```gleam
import anthropic_sdk

```

Further documentation can be found at <https://hexdocs.pm/anthropic_sdk>.

## Development

The API is generated from githubs published Open API spec.

The spec is pulled from list [link](https://storage.googleapis.com/stainless-sdk-openapi-specs/anthropic-bda1c6bb3a8f16d4b0a936aa3a7b1618f23d38570547e7ef047a9c95265e6613.yml). found in this [commit](https://github.com/anthropics/anthropic-sdk-go/commit/db71b42f905ef3d21facc69e0cb0a591c2508a2b)

To generate the code run

```sh
gleam run -m anthropic/dev
```

```sh
gleam run   # Run the project
gleam test  # Run the tests
```

## Notes

- The spec uses "4xx" for responses which is invalid, this has been changed to default
- Models where described by an enum of constants this was replaced with a string type.