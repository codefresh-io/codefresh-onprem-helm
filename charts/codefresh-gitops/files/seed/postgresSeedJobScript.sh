#!/bin/bash

set -xeuo pipefail

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
    psql -tc "SELECT 1 FROM pg_database WHERE datname = '${1}'" | grep -q 1 || psql -c "CREATE DATABASE ${1}"
}

function createUser() {
    echo "Creating a separate non-privileged user for Codefresh"
    psql -c "CREATE USER ${POSTGRES_USER} WITH PASSWORD '${POSTGRES_PASSWORD}'"
}

function grantPrivileges() {
    psql -c "GRANT ALL ON DATABASE ${1} TO ${POSTGRES_USER}"
}

function runSeed() {

    export PGUSER=${POSTGRES_SEED_USER}
    export PGPASSWORD=${POSTGRES_SEED_PASSWORD}
    export PGHOST=${POSTGRES_HOSTNAME}
    export PGPORT=${POSTGRES_PORT}

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