#!/usr/bin/env bash
major_version_number=$(psql --version | cut -d' ' -f3 | cut -d'.' -f1)
PGHBA_CONF="/etc/postgresql/${major_version_number}/main/pg_hba.conf"
cp $PGHBA_CONF ${PGHBA_CONF}.bak
cat <<EOF > $PGHBA_CONF
local   all             all                                     trust
host    all             all             127.0.0.1/32            trust
host    all             all             ::1/128                 trust
local   replication     all                                     trust
host    replication     all             127.0.0.1/32            trust
host    replication     all             ::1/128                 trust
EOF
