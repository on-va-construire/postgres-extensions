FROM postgres:18.1

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    postgresql-18-postgis-3 \
    postgresql-18-pgvector; \
    rm -rf /var/lib/apt/lists/*

COPY init-extensions.sql /docker-entrypoint-initdb.d/01-init-extensions.sql
