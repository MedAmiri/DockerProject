FROM nginx
MAINTAINER Amiri
ENV work /usr/share/ngnix/html
ADD ./v3.14.2/ /usr/share/nginx/html/
WORKDIR ${work}
ADD ./index.html /usr/share/nginx/html/index.html
ADD ./check.txt /usr/share/nginx/html/check.txt





echo "Configuring postgis and creating a geodatabase: spatialdb"
docker run --link postgis:db -ti -v /vagrant:/vagrant jamesbrink/postgresql sh -c 'exec psql -h "$DB_PORT_5432_TCP_ADDR" -p "$DB_PORT_5432_TCP_PORT" -U postgres -f /vagrant/spatialdb.sql'
docker run --link postgis:db -ti -v /vagrant:/vagrant jamesbrink/postgresql sh -c 'exec shp2pgsql -W "LATIN1" -I -s 2154 /vagrant/shapefile/75-.shp public.spatialdb | psql -h "$DB_PORT_5432_TCP_ADDR" -p "$DB_PORT_5432_TCP_PORT" -U postgres -d spatialdb'

echo "Pulling the geoserver image"
