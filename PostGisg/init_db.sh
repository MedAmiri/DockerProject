#!/bin/bash

USERNAME="docker"
PASSWORD="docker"
DB="dockerdb"
echo "CREATE EXTENSION postgis_topology;"
echo "******Creation de la base de données******"
echo "------------------------------------------"

export PGUSER=postgres
sleep 30
psql postgres postgres<<- EOSQL
    CREATE USER $USERNAME WITH PASSWORD '$PASSORD';
    CREATE DATABASE $DB;
    CREATE EXTENSION postgis;
    GRANT ALL PRIVILEGES ON DATABASE $DB TO $USERNAME;
EOSQL

echo "******Creation de la base de données fini******"

