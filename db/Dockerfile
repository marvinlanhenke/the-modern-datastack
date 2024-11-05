FROM postgres:17.0

WORKDIR /app

COPY ./init/init.sh /docker-entrypoint-initdb.d
COPY ./init/seed.sql ./init/seed.sql
