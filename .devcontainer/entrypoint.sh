#!/usr/bin/env bash
# Start the Postgres service, then give you a shell
sleep 3
service postgresql start
echo -e "\nalias psql='sudo -u postgres psql'" >> /root/.bashrc
echo -e "\nalias psql='sudo -u postgres psql'" >> /home/node/.bashrc
chown -R root:root /workspace/
exec "$@"
