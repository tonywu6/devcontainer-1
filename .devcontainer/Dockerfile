ARG DEVCONTAINER_IMAGE=mcr.microsoft.com/devcontainers/rust:bookworm

FROM --platform=${BUILDPLATFORM} rust:bookworm AS cross

WORKDIR /tmp

COPY .devcontainer/make/devel.sh make/devel.sh
RUN sh ./make/devel.sh

COPY .devcontainer/Makefile .

ARG BUILDPLATFORM
ARG TARGETPLATFORM

ARG ZIGBUILD_GLIBC

ENV CARGO_HOME=/root/.cargo

ENV PATH=${CARGO_HOME}/bin:${PATH}

ENV CI=true

COPY .devcontainer/make/zig make/zig
RUN make zig \
  TARGETPLATFORM=${BUILDPLATFORM}

COPY .devcontainer/make/zigbuild make/zigbuild
RUN make zigbuild \
  TARGETPLATFORM=${BUILDPLATFORM}

COPY .devcontainer/make/rustc-target make/rustc-target
RUN make rustc-target

COPY .devcontainer/make/fnm make/fnm
RUN make fnm

COPY .devcontainer/make/rye make/rye
RUN make rye

COPY .devcontainer/make/maturin make/maturin
RUN make maturin

COPY .devcontainer/make/wasm-pack make/wasm-pack
RUN make wasm-pack

FROM --platform=${TARGETPLATFORM} ${DEVCONTAINER_IMAGE} AS devcontainer

ARG TARGETPLATFORM

WORKDIR /tmp

COPY .devcontainer/make/devel.sh make/devel.sh
RUN sh ./make/devel.sh

COPY .devcontainer/Makefile .

COPY .devcontainer/make/user make/user
RUN make user

USER vscode

ENV HOME=/home/vscode

ENV CARGO_HOME=${HOME}/.cargo

ENV PATH=${CARGO_HOME}/bin:${PATH}

COPY .devcontainer/make/rustup make/rustup
RUN make rustup

COPY .devcontainer/make/zig make/zig
RUN make zig

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

COPY .devcontainer/make/deno make/deno
RUN make deno

COPY --from=cross /root/.cargo/bin/rye ${CARGO_HOME}/bin/rye

ARG DEFAULT_PYTHON_VERSION

COPY .devcontainer/make/rye-install make/rye-install
RUN make rye-install

COPY --from=cross /root/.cargo/bin/fnm ${CARGO_HOME}/bin/fnm

ARG DEFAULT_NODE_VERSION
ARG DEFAULT_PNPM_VERSION

COPY .devcontainer/make/fnm-node make/fnm-node
RUN make fnm-node

COPY --from=cross /root/.cargo/bin/maturin ${CARGO_HOME}/bin/maturin

COPY --from=cross /root/.cargo/bin/wasm-pack ${CARGO_HOME}/bin/wasm-pack

RUN sudo rm -rf /tmp/*

ENTRYPOINT [ "zsh" ]

WORKDIR /home/vscode
