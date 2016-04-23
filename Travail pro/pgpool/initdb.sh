#!/bin/sh
psql <<EOSQL
    CREATE DATABASE docker;
    \connect docker;
    CREATE EXTENSION postgis;
EOSQL
