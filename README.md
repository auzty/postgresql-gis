# Postgresql Postgis Timescale

A Postgresql database with Postgis and Timescale extension enabled

this image based on official postgresql 11

https://hub.docker.com/_/postgres

**notes**
Please add this library manually after first run and restart the
postgresql

```
shared_preload_libraries = 'timescaledb'
```

# HowTo Run


1. Normal Without pgbouncer (or bootstraping)

```bash
docker run --name pg11 -p 5432:5432 -d -v /somedir:/var/lib/postgresql/data -e POSTGRES_PASSWORD=sample \
-e POSTGRES_USER=postgres -e PGDATA=/var/lib/postgresql/data/pgdata postgresimg:latest
```


2. With PGBouncer

```bash
docker run --rm -v /tmp/testpg:/var/lib/postgresql/data --entrypoint /usr/bin/supervisord \
-e POSTGRES_PASSWORD=sample -e POSTGRES_USER=postgres -e PGDATA=/var/lib/postgresql/data/pgdata \
postgresimg:latest -c /supervisord.conf
```
