FROM --platform=$BUILDPLATFORM rust:bookworm as tools

ARG FNM_VERSION=1.35.1
ARG RYE_VERSION=0.16.0
ARG RUST_TARGET=x86_64-unknown-linux-gnu

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    gcc-x86-64-linux-gnu \
    gcc-aarch64-linux-gnu

ENV HOST_CC=gcc
ENV CC_x86_64_unknown_linux_gnu=x86_64-linux-gnu-gcc
ENV CC_aarch64_unknown_linux_gnu=aarch64-linux-gnu-gcc
ENV CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=x86_64-linux-gnu-gcc
ENV CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER=aarch64-linux-gnu-gcc

RUN rustup target add ${RUST_TARGET}

RUN cargo install --root /root/.cargo fnm \
    --version ${FNM_VERSION} \
    --target ${RUST_TARGET}

RUN cargo install --root /root/.cargo rye \
    --git https://github.com/mitsuhiko/rye \
    --tag ${RYE_VERSION} \
    --target ${RUST_TARGET}

FROM mcr.microsoft.com/devcontainers/rust:bookworm

ARG NODE_VERSION=18.18
ARG PYTHON_VERSION=3.8

RUN apt-get update \
    && apt-get install -y \
    sudo \
    curl \
    zsh

RUN chsh -s /usr/bin/zsh vscode

COPY --from=tools /root/.cargo/bin/fnm /usr/local/bin/fnm
COPY --from=tools /root/.cargo/bin/rye /usr/local/bin/rye

# Default non-root user
USER vscode
WORKDIR /home/vscode

# Install default Node
RUN fnm install ${NODE_VERSION} \
    && fnm default ${NODE_VERSION}

# Install default Python
RUN rye self install --yes \
    && rye toolchain fetch ${PYTHON_VERSION}

# Install pnpm and Nx
RUN eval $(fnm env) \
    && npm install -g pnpm nx

# Setup shell
RUN echo "" >> $HOME/.zshrc \
    && echo 'eval "$(fnm env)"' >> $HOME/.zshrc \
    && echo 'source "$HOME/.rye/env"' >> $HOME/.zshrc \
    && echo 'export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"' >> $HOME/.zshrc \
    && eval $(fnm env) \
    && SHELL=zsh pnpm setup \
    && echo "" >> $HOME/.zshrc

ENTRYPOINT [ "/usr/bin/zsh" ]

LABEL org.opencontainers.image.description "Dev container image for Node + Python + Rust monorepos"
