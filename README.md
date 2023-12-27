# devcontainer1

Dev container for Node + Python + Rust monorepos.

See [devcontainer.Dockerfile](./devcontainer.Dockerfile).

Base image is [mcr.microsoft.com/devcontainers/rust:bookworm].

[fnm] is the tool for Node, and [Rye] for Python. Both are built from scratch
through `cargo install` in a separate build stage.

Default versions of Node and Python are installed. To override, set the
`NODE_VERSION` and `PYTHON_VERSION` build args.

[mcr.microsoft.com/devcontainers/rust:bookworm]:
  https://github.com/devcontainers/images/tree/main/src/rust
[fnm]: https://github.com/Schniz/fnm
[Rye]: https://rye-up.com
