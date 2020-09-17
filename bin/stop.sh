#!/bin/sh

echo

if [ -f "$PGDATA/postmaster.pid" ]; then
    printf "\e[32m=> Stopping PostgreSQL...\e[0m\n\n"
    echo "+ pg_ctl -l \"$PGDATA/server.log\" stop"
    pg_ctl -l "$PGDATA/server.log" stop
    echo
fi