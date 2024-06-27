FROM --platform=${BUILDPLATFORM} rust:bookworm as cross-compilation

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  gcc-x86-64-linux-gnu \
  gcc-aarch64-linux-gnu \
  curl \
  unzip \
  cmake \
  ninja-build

ARG TARGETPLATFORM
ARG ARCH=${TARGETPLATFORM}

WORKDIR /tmp

COPY .devcontainer/Makefile .

ENV CARGO_HOME=/root/.cargo

COPY .devcontainer/make/rust make/rust
RUN make rust

COPY .devcontainer/make/fnm make/fnm
RUN make fnm

COPY .devcontainer/make/rye make/rye
RUN make rye

COPY .devcontainer/make/maturin make/maturin
RUN make maturin

COPY .devcontainer/make/wasm-pack make/wasm-pack
RUN make wasm-pack

FROM --platform=${TARGETPLATFORM} mcr.microsoft.com/devcontainers/rust:bookworm as devcontainer

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  sudo \
  curl \
  unzip \
  bison \
  cmake \
  ninja-build \
  zsh

ARG TARGETPLATFORM
ARG ARCH=${TARGETPLATFORM}

WORKDIR /tmp

COPY .devcontainer/Makefile .

RUN chsh -s /usr/bin/zsh vscode

USER vscode

COPY .devcontainer/make/deno make/deno
RUN make deno

COPY .devcontainer/make/go make/go
RUN make go

COPY .devcontainer/make/bazelisk make/bazelisk
RUN make bazelisk

COPY .devcontainer/make/protoc make/protoc
RUN make protoc

COPY .devcontainer/make/buf make/buf
RUN make buf

COPY .devcontainer/make/micromamba make/micromamba
RUN make micromamba

COPY --from=cross-compilation /root/.cargo/bin/rye ${CARGO_HOME}/bin/rye

COPY .devcontainer/make/python make/python
RUN make python

COPY --from=cross-compilation /root/.cargo/bin/fnm ${CARGO_HOME}/bin/fnm

COPY .devcontainer/make/node make/node
RUN make node

COPY --from=cross-compilation /root/.cargo/bin/maturin ${CARGO_HOME}/bin/maturin

COPY --from=cross-compilation /root/.cargo/bin/wasm-pack ${CARGO_HOME}/bin/wasm-pack

ENTRYPOINT [ "/usr/bin/zsh" ]

WORKDIR /home/vscode/workspace
