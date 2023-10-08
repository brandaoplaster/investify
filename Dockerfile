FROM elixir:1.14.5-otp-25-alpine AS build

RUN apk add --no-cache build-base npm git

WORKDIR /app

ARG mix_env=dev

RUN mix do local.hex --force, local.rebar --force

COPY assets/package*.json ./assets/
COPY mix.* ./
COPY config config
COPY priv priv
COPY assets/css/*.css ./assets/css/
COPY assets/*.config.js ./assets/
COPY test test
COPY lib lib
COPY .formatter.exs .credo.exs ./

RUN cd ./assets && npm install
RUN npm --prefix ./assets ci --progress=false --no-audit --loglevel=error
RUN npm --prefix ./assets run deploy

# compile dependencies
RUN  mix do deps.get, deps.compile

# compile app
RUN mix do compile --warnings-as-errors, release

# ==============================================
#
# ==============================================

FROM alpine:3.14 AS app

# setup app
WORKDIR /app
ENV MIX_ENV=prod
COPY --from=build /app/_build/$MIX_ENV/rel/investify_web ./

# start application
COPY start.sh ./
CMD ["sh", "./start.sh"]
