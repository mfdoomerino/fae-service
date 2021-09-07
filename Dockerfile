FROM elixir:1.12.2-alpine

ARG USER_ID
ARG GROUP_ID
ARG GITHUB_API_TOKEN

RUN addgroup --gid ${GROUP_ID} user && \
    adduser --disabled-password --ingroup user --uid ${USER_ID} user

RUN apk update && apk upgrade && \
    apk --no-cache add curl && \
    apk add build-base && \
    apk add --no-cache inotify-tools imagemagick git && \
    mkdir -p /home/user/app

USER user

WORKDIR /home/user/app

RUN mix do local.rebar --force, local.hex --force
