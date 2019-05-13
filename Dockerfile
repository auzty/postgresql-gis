FROM postgres:11

LABEL Maintainer=Garasilabs
LABEL PGVERSION=11.2
LABEL POSTGIS=2.3
LABEL TIMESCALE=1.3
LABEL PGBouncer=1.9

RUN apt update && apt install apt-transport-https wget -y && rm -rf /var/lib/apt/lists/*

RUN echo 'deb https://packagecloud.io/timescale/timescaledb/debian/ stretch main' > /etc/apt/sources.list.d/timescaledb.list

RUN wget --quiet -O timescaledb.key https://packagecloud.io/timescale/timescaledb/gpgkey && apt-key add timescaledb.key

RUN apt update && apt install -y postgresql-11-postgis-2.5 timescaledb-postgresql-11 libevent-dev supervisor && rm -rf /var/lib/apt/lists/*

ADD docker-entrypoint.sh /docker-entrypoint.sh

ADD supervisord.conf /supervisord.conf

ADD pgbouncer/pgbouncer /usr/local/bin/pgbouncer

ADD pgbouncer/pgbouncer.ini /tmp/pgbouncer/pgbouncer.ini

RUN chown postgres:postgres /usr/local/bin/pgbouncer
