FROM ghcr.io/anomalyco/opencode

ARG UID=1000
ARG PYTHON_VERSION=3.12

RUN apk add --no-cache \
	bash \
	wget \
	git \
	npm \
	build-base \
    python3-dev \
	libffi-dev \
    openssl-dev

# Create user with build-time UID
RUN adduser -D -u ${UID} user && \
    mkdir -p /home/user && \
    chown user:user /home/user

USER user
WORKDIR /home/user

ENV HOME=/home/user
ENV NVM_DIR=/home/user/.nvm
ENV PATH=/home/user/.local/bin:$PATH

# Install uv + Python
RUN wget -qO- https://astral.sh/uv/install.sh | sh && \
    export PATH="$HOME/.local/bin:$PATH" && \
    uv python install ${PYTHON_VERSION} --default

# Prevent directories from being read-only when mounting config files
RUN mkdir -p /home/user/.config/opencode && \
	mkdir -p /home/user/.local/share/opencode && \
	mkdir -p /home/user/.serena/contexts

ENTRYPOINT ["sh", "-c", "opencode \"$@\"", "--"]
