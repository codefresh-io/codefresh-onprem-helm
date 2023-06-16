#!/bin/bash

# The script maintains a certain number of the last records in the event store table.
# Older records are deleted from the table.
# The deletion occurs gradually in chunks, to avoid a sharp load burst on the db.

set -euo pipefail

msg() { echo -e "\n\e[1m--> $1\e[m"; }
ok() { echo -e "\n\e[1;32m$1\e[m"; }

DEBUG=${DEBUG:-"0"}

EVENT_STORE_TABLE=${EVENT_STORE_TABLE:-"eventstore.events"}
EVENTS_TO_KEEP=${EVENTS_TO_KEEP:-"100000"}
DEL_CHUNK_SIZE=${DEL_CHUNK_SIZE:-"1000"}

export PGHOST=${PGHOST:-""}
export PGPORT=${PGPORT:-"5432"}
export PGDATABASE=${PGDATABASE:-""}
export PGUSER=${PGUSER:-""}
export PGPASSWORD=${PGPASSWORD:-""}

export ON_ERROR_STOP=1

function _psql() {
    set -e
    psql -q -v ON_ERROR_STOP=1 "$@"
}

function countRows() {
    local cmd="SELECT count(*) FROM ${EVENT_STORE_TABLE}"
    _psql \
        -A \
        -t \
        -c "${cmd}"
}

function vacuum() {
    msg "Requesting VACUUM on the table..."
    local cmd="VACUUM ${EVENT_STORE_TABLE}"
    _psql -c "${cmd}"
    ok "VACUUM requested successfully"
}

function delNFirstRows() {
    local rows_number=$1
    local cmd="DELETE FROM ${EVENT_STORE_TABLE} COMMIT WHERE id IN (SELECT id FROM ${EVENT_STORE_TABLE} ORDER BY id LIMIT ${rows_number})"
    _psql -c "${cmd}"

}

function adjustChunkSize() {
    local rows_to_clean=$(($ROWS_COUNT - $EVENTS_TO_KEEP))
    local adjusted_chunk

    if [[ $rows_to_clean -lt $DEL_CHUNK_SIZE ]]; then
        adjusted_chunk=$rows_to_clean
    else
        adjusted_chunk=$DEL_CHUNK_SIZE
    fi

    echo ${adjusted_chunk}
}

function cleanEventStore() {
    msg "Starting event store cleaning..."

    INITIAL_ROWS_COUNT=$(countRows)
    ROWS_COUNT=$INITIAL_ROWS_COUNT
    local chunk_size
    while [[ $ROWS_COUNT -gt $EVENTS_TO_KEEP ]]; do
        chunk_size=$(adjustChunkSize)
        delNFirstRows $chunk_size
        ROWS_COUNT=$(($ROWS_COUNT - $chunk_size))
        echo "Cleaned ${chunk_size} of old records. $(($ROWS_COUNT - $EVENTS_TO_KEEP)) records left..."
        sleep 0.5
    done

    ok "Cleaning finished successfully. $(($INITIAL_ROWS_COUNT - $ROWS_COUNT)) rows have been cleaned"

    vacuum
}

[[ $DEBUG == "1" ]] && set -x

cleanEventStore
