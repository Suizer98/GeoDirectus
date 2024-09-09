#!/usr/bin/env bash
set -e

psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER --dbname $POSTGRES_DB <<-EOSQL
    CREATE USER $GEOSERVER_PSQL_USER WITH LOGIN PASSWORD '$GEOSERVER_PSQL_PASSWORD';
    
    CREATE DATABASE "$GEOSERVER_SHAPEFILES_PSQL_DB" WITH OWNER $GEOSERVER_PSQL_USER;
    \c "$GEOSERVER_SHAPEFILES_PSQL_DB"
    CREATE EXTENSION postgis;
    GRANT ALL PRIVILEGES ON DATABASE "$GEOSERVER_SHAPEFILES_PSQL_DB" TO $GEOSERVER_PSQL_USER;

    CREATE USER $PSQL_USER WITH LOGIN PASSWORD '$PSQL_PASSWORD';
    ALTER USER $PSQL_USER CREATEDB;
    CREATE DATABASE "$PSQL_DB" WITH OWNER $PSQL_USER;
    CREATE DATABASE "$API_PSQL_DB" WITH OWNER $PSQL_USER;

    ALTER SYSTEM SET log_destination = 'csvlog';
    ALTER SYSTEM SET logging_collector = 'on';
    ALTER SYSTEM SET log_truncate_on_rotation = 'on';
    ALTER SYSTEM SET log_connections = 'on';
    ALTER SYSTEM SET log_disconnections = 'on';
    ALTER SYSTEM SET log_replication_commands = 'on';
EOSQL
