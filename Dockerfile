FROM elixir:1.15

RUN mix local.hex --force && mix local.rebar --force

RUN apt-get update && apt-get install -y \
  curl \
  git \
  vim \
  tree \
  && rm -rf /var/lib/apt/lists/*

ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME
