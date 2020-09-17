#!/bin/sh
# pg_ctl start -l .db/server.log -D .db -w
echo

if [ ! -d "deps" ] || [ ! "$(ls -A deps)" ]; then
    printf "\e[32m=> Fetching dependencies and building the application...\e[0m\n\n"
    echo "+ mix do deps.get, compile --verbose"
    mix "do" deps.get, compile --verbose
    echo
fi

if [ ! -d /run/postgresql ]; then
    printf "\e[32m=> Creating /run/postgresql... for unix socket file\e[0m\n\n"
    echo "+ sudo mkdir -p /run/postgresql"
    sudo mkdir -p /run/postgresql
    echo "+ sudo chown $(whoami):$(whoami) /run/postgresql"
    sudo chown "$(whoami):$(whoami)" /run/postgresql
    echo
fi

if [ ! -d "$PGDATA" ]; then
    printf "\e[32m=> Initialising the database in %s...\e[0m\n\n" "$PGDATA"
    echo "+ initdb --no-locale --encoding=UTF-8"
    initdb --no-locale --encoding=UTF-8 -U postgres
    echo
fi

if [ ! -f "$PGDATA/postmaster.pid" ]; then
    printf "\e[32m=> Starting PostgreSQL and waiting a few sec...\e[0m\n\n"
    echo "+ pg_ctl start -l \"$PGDATA/server.log\" -w"
    pg_ctl start -l "$PGDATA/server.log" -w
    echo
fi

printf "\e[32m=> Creating the postgres user if necessary...\e[0m\n\n"
echo "+ createuser postgres --createdb --echo"
createuser postgres --createdb --echo -U postgres
echo

set -e

printf "\e[32m=> Setting up the database...\e[0m\n\n"
echo "+ mix ecto.reset"
mix ecto.reset
echo

printf "\e[32m\e[1mThe project setup is complete!\e[0m\n\n"
printf "To start the application in an IEx shell, you can now run:\n\n"
printf "    iex -S mix phx.server\n\n"
