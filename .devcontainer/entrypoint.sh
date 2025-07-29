#!/usr/bin/env bash
# Start the Postgres service, then give you a shell
sleep 3
service postgresql start
alias psql='sudo -u postgres psql'
exec "$@"
