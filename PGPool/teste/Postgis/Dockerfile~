FROM postgres:9.4
MAINTAINER <Groupe Amiri>
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y postgis
#################################################
ADD ./pg_hba.conf /var/lib/postgresql/data/pg_hba.conf
ADD ./init_db.sh /var/lib/postgresql/data/init_db.sh
ADD ./postgresql.conf /var/lib/postgresql/data/postgresql.conf
ADD ./PG_VERSION  /var/lib/postgresql/data/PG_VERSION
ADD ./postgresql.auto.conf /var/lib/postgresql/data/postgresql.auto.conf
######################################################################"
#ENTRYPOINT ["/docker-entrypoint-initdb.d/init_db.sh"]
RUN chmod -R 777 /var/lib/postgresql/data/init_db.sh
RUN /var/lib/postgresql/data/init_db.sh


