#!/bin/sh

# Create the 'template_postgis' template db
psql -h localhost -p 9999 -U postgres<< EOSQL
	CREATE DATABASE docker;
	\connect docker;
	CREATE EXTENSION postgis;
EOSQL


