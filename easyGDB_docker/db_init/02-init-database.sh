#!/bin/bash

# Set the password for the user
psql -v ON_ERROR_STOP=1 --username postgres <<-EOSQL
    ALTER USER web_usr WITH PASSWORD '${POSTGRES_USERPW}';
EOSQL
