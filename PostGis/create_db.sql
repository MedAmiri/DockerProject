CREATE DATABASE spatialdb;
\c spatialdb
CREATE EXTENSION postgis



postgres=# CREATE DATABASE my_spatial_db TEMPLATE=template_postgis


CREATE DATABASE spatialdb;
\c spatialdb;
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;

/etc/postgresql/9.3/main/postgresql.conf

ADD ./create_db.sql /../../
RUN sh -c 'exec psql -h "$DB_PORT_5432_TCP_ADDR" -p "$DB_PORT_5432_TCP_PORT" -U postgres -f /vagrant/spatialdb.sql'
RUN 'exec shp2pgsql -W "LATIN1" -I -s 2154 /vagrant/shapefile/75-.shp public.spatialdb | psql -h "$DB_PORT_5432_TCP_ADDR" -p "$DB_PORT_5432_TCP_PORT" -U postgres -d spatialdb'
