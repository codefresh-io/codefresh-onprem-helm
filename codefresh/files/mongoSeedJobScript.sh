#!/usr/bin/env bash

<<COMMENT
Script is used to seed the inital data for onprem instance:

export ASSETS_PATH=./assets/
export MONGO_URI=...
export MONGODB_ROOT_USER=...
export MONGODB_ROOT_PASSWORD=...

./mongoSeedJobScript.sh

COMMENT

# set -eou pipefail

ASSETS_PATH=${ASSETS_PATH:-/usr/share/extras/}

MONGODB_DATABASES=(
    "archive"
    "audit"
    "charts-manager"
    "cluster-providers"
    "codefresh"
    "context-manager"
    "gitops-dashboard-manager"
    "k8s-monitor"
    "pipeline-manager"
    "platform-analytics-postgres"
    "read-models"
    "runtime-environment-manager"
)

disableMongoTelemetry() {
    mongosh --nodb --eval "disableTelemetry()"
}

waitForMongoDB() {
    while true; do
        status=$(mongosh ${MONGODB_ROOT_URI} --eval "db.adminCommand('ping')" 2>&1)

        echo -e "MongoDB status:\n$status"
        if $(echo $status | grep 'ok: 1' -q); then
            break
        fi

        echo "Sleeping 3 seconds ..."
        sleep 3
    done
}

parseMongoURI() {
    local proto="$(echo $1 | grep :// | sed -e's,^\(.*://\).*,\1,g')"
    local parameters="$(echo $1 | grep '?' | cut -d '?' -f2)"; if [[ -n $parameters ]]; then parameters="?${parameters}"; fi
    local url="$(echo ${1/$proto/})"
    local userpass="$(echo $url | grep @ | cut -d@ -f1)"
    local hostport="$(echo $url | sed s/$userpass// | sed "s/\/\?$parameters//" | sed -re "s/\/\?|@//g" | sed 's/\/$//')"

    MONGODB_PASSWORD="$(echo $userpass | grep : | cut -d: -f2)"
    MONGODB_USER="$(echo $userpass | grep : | cut -d: -f1)"
    MONGO_URI="$proto$userpass@$hostport/${MONGODB_DATABASE}$parameters"
    MONGODB_ROOT_URI="$proto${MONGODB_ROOT_USER}:${MONGODB_ROOT_PASSWORD}@$hostport/admin$parameters"
}

getMongoVersion() {
    MONOGDB_VERSION=$(mongosh ${MONGODB_ROOT_URI} --eval "db.version()" 2>&1 | tail -n1)
}

parseMongoURI $MONGO_URI

disableMongoTelemetry

waitForMongoDB

getMongoVersion

for MONGODB_DATABASE in ${MONGODB_DATABASES[@]}; do
    mongosh ${MONGODB_ROOT_URI} --eval "db.getSiblingDB(\"${MONGODB_DATABASE}\").createUser({user: \"${MONGODB_USER}\", pwd: \"${MONGODB_PASSWORD}\", roles: [\"readWrite\"]})" || true
    mongosh ${MONGODB_ROOT_URI} --eval "db.getSiblingDB(\"${MONGODB_DATABASE}\").changeUserPassword(\"${MONGODB_USER}\",\"${MONGODB_PASSWORD}\")" || true
done

mongosh ${MONGODB_ROOT_URI} --eval "db.getSiblingDB(\"codefresh\").grantRolesToUser( \"${MONGODB_USER}\", [ { role: \"readWrite\", db: \"pipeline-manager\" } ] )" || true
mongosh ${MONGODB_ROOT_URI} --eval "db.getSiblingDB(\"codefresh\").grantRolesToUser( \"${MONGODB_USER}\", [ { role: \"readWrite\", db: \"platform-analytics-postgres\" } ] )" || true
mongosh ${MONGODB_ROOT_URI} --eval "db.getSiblingDB(\"codefresh\").changeUserPassword(\"${MONGODB_USER}\",\"${MONGODB_PASSWORD}\")" || true

mongoimport --uri ${MONGO_URI} --collection idps --type json --legacy --file ${ASSETS_PATH}idps.json
mongoimport --uri ${MONGO_URI} --collection accounts --type json --legacy --file ${ASSETS_PATH}accounts.json
mongoimport --uri ${MONGO_URI} --collection users --type json --legacy --file ${ASSETS_PATH}users.json
