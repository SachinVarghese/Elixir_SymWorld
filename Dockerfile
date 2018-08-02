FROM elixir:1.6

LABEL maintainer="Sachin Varghese <sachin.varghese@mu-sigma.com>"

WORKDIR /symworld/

COPY / /symworld/

RUN ls

RUN MIX_ENV=prod mix deps.get

RUN MIX_ENV=prod mix local.rebar --force

RUN MIX_ENV=prod mix deps.compile

RUN MIX_ENV=prod mix compile

CMD MIX_ENV=prod mix run --no-halt