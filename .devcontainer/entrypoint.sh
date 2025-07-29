#!/usr/bin/env bash
# Start the Postgres service, then give you a shell
service postgresql start
exec "$@"
