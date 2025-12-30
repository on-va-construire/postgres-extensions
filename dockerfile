FROM postgres:17.7

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    postgresql-17-postgis-3 \
    postgresql-17-pgvector; \
    rm -rf /var/lib/apt/lists/*

COPY init-extensions.sql /docker-entrypoint-initdb.d/01-init-extensions.sql
