FROM mcr.microsoft.com/devcontainers/rust:bookworm

ARG FNM_VERSION=1.35.1
ARG RYE_VERSION=0.16.0

ARG NODE_VERSION=18.18
ARG PYTHON_VERSION=3.8

RUN apt-get update \
    && apt-get install -y \
    sudo

# Default non-root user
USER vscode
WORKDIR /home/vscode

# Install fnm (for Node)
RUN cargo install fnm \
    --version ${FNM_VERSION}

# Install Rye (for Python)
RUN cargo install rye \
    --git https://github.com/mitsuhiko/rye \
    --tag ${RYE_VERSION}

# Install Node
RUN fnm install ${NODE_VERSION} \
    && fnm default ${NODE_VERSION}

# Install Python
RUN rye self install --yes \
    && rye toolchain fetch ${PYTHON_VERSION}

# Install PNPM
RUN eval $(fnm env) \
    && npm install -g pnpm \
    && SHELL=bash pnpm setup \
    && echo "" >> ~/.bashrc

# Setup shell
RUN echo 'eval "$(fnm env --use-on-cd)"' >> ~/.bashrc \
    && echo 'source "$HOME/.rye/env"' >> ~/.bashrc \
    && echo 'export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"' >> ~/.bashrc
