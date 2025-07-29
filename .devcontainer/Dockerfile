# Use the universal base so you get the vscode user, extensions, etc.
FROM mcr.microsoft.com/devcontainers/universal:2

# 1. Install Postgres server + client
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql postgresql-client \
 && rm -rf /var/lib/apt/lists/*  # clean up :contentReference[oaicite:3]{index=3}

# 2. Copy scripts and make them executable
COPY setup-postgres.sh /usr/local/bin/setup-postgres.sh
COPY entrypoint.sh     /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/setup-postgres.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# 3. Run the script at build time to patch pg_hba.conf
RUN bash /usr/local/bin/setup-postgres.sh || true

# 4. Use an entrypoint to start Postgres on container start-up
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]  # starts Postgres then drops to shell
CMD ["sleep", "infinity"]

# Metadata label so downstream ‘image’ configs can pick up ports, settings, etc.
LABEL org.opencontainers.image.source="https://github.com/npict-dott/devcontainer-postgres-base"