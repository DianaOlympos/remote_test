#!/bin/sh

echo

if [ ! -d /run/postgresql ]; then
    printf "\e[32m=> Creating /run/postgresql... for unix socket file\e[0m\n\n"
    echo "+ sudo mkdir -p /run/postgresql"
    sudo mkdir -p /run/postgresql
    echo "+ sudo chown $(whoami):$(whoami) /run/postgresql"
    sudo chown "$(whoami):$(whoami)" /run/postgresql
    echo
fi

if [ ! -f "$PGDATA/postmaster.pid" ]; then
    printf "\e[32m=> Starting PostgreSQL and waiting a few sec...\e[0m\n\n"
    echo "+ pg_ctl start -l \"$PGDATA/server.log\" -w"
    pg_ctl start -l "$PGDATA/server.log" -w
    echo
fi