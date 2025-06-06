#!/bin/bash

DEBUG="${DEBUG:-false}"


set -euo pipefail

if [[ $DEBUG == "true" ]]; then
    set -xeuo pipefail
    echo "Running in debug mode"
fi

POSTGRES_DATABASES=(
    "codefresh"
    "audit"
    "analytics"
    "analytics_pre_aggregations"
)
POSTGRES_PORT="${POSTGRES_PORT:-5432}"

# To create a separate non-privileged user the for Codefresh,
# which has access only to the relevant databases, it is needed to specify
# additionally the POSTGRES_SEED_USER and POSTGRES_SEED_PASSWORD vars.
# Otherwise only POSTGRES_USER and POSTGRES_PASSWORD will be used both
# during seed job execution and runtime

POSTGRES_SEED_USER="${POSTGRES_SEED_USER:-$POSTGRES_USER}"
POSTGRES_SEED_PASSWORD="${POSTGRES_SEED_PASSWORD:-$POSTGRES_PASSWORD}"

function createDB() {
    local db=$1
    psql -c "CREATE DATABASE ${1}" 2>&1 || true
}

function createUser() {
    echo "Creating a separate non-privileged user for Codefresh"
    psql -c "CREATE USER ${POSTGRES_USER} WITH PASSWORD '${POSTGRES_PASSWORD}'"
}

function grantPrivileges() {
    local db=$1
    echo "Granting privileges on $db to ${POSTGRES_USER}"
    # Database-level privileges
    psql -c "GRANT ALL ON DATABASE ${db} TO ${POSTGRES_USER}"
    # Schema and object-level privileges
    psql -d "${db}" -c "GRANT ALL ON SCHEMA public TO ${POSTGRES_USER}"
    psql -d "${db}" -c "GRANT ALL ON ALL TABLES IN SCHEMA public TO ${POSTGRES_USER}"
    psql -d "${db}" -c "GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO ${POSTGRES_USER}"
    psql -d "${db}" -c "GRANT ALL ON ALL FUNCTIONS IN SCHEMA public TO ${POSTGRES_USER}"
    # Default privileges for future objects
    psql -d "${db}" -c "ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO ${POSTGRES_USER}"
    psql -d "${db}" -c "ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO ${POSTGRES_USER}"
    psql -d "${db}" -c "ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON FUNCTIONS TO ${POSTGRES_USER}"
}

function runSeed() {

    export PGUSER=${POSTGRES_SEED_USER}
    export PGPASSWORD=${POSTGRES_SEED_PASSWORD}
    export PGHOST=${POSTGRES_HOSTNAME}
    export PGPORT=${POSTGRES_PORT}
    export PGDATABASE=postgres # Use the default postgres database

    if [[ "${POSTGRES_SEED_USER}" != "${POSTGRES_USER}" ]]; then
        createUser
    else
        echo "There is no a separate user specified for the seed job, skipping user creation"
    fi

    for POSTGRES_DATABASE in ${POSTGRES_DATABASES[@]}; do
        createDB $POSTGRES_DATABASE
        grantPrivileges $POSTGRES_DATABASE
    done
}

runSeed
