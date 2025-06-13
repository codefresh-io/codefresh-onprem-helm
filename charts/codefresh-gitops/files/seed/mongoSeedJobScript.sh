#!/usr/bin/env bash

<<COMMENT
Script is used to seed the inital data for onprem instance:

export ASSETS_PATH=./assets/
export MONGO_URI=...
export MONGODB_ROOT_USER=...
export MONGODB_ROOT_PASSWORD=...

./mongoSeedJobScript.sh

COMMENT

if [[ -n $DEBUG ]]; then
    set -o xtrace
fi

ASSETS_PATH=${ASSETS_PATH:-/usr/share/extras/}
MTLS_CERT_PATH=${MTLS_CERT_PATH:-/etc/ssl/mongodb/ca.pem}

MONGODB_DATABASES=(
    "archive"
    "audit"
    "codefresh"
    "platform-analytics-postgres"
    "read-models"
    "runtime-environment-manager"
)

disableMongoTelemetry() {
    mongosh --nodb --eval "disableTelemetry()" || true
}

waitForMongoDB() {
    while true; do
        status=$(mongosh ${MONGODB_ROOT_URI} ${MONGO_URI_EXTRA_PARAMS} --eval "db.adminCommand('ping')" 2>&1)

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
    if [[ -z $userpass ]]; then
        local hostport="$(echo $url | sed "s/\/\?$parameters//" | sed -re "s/\/\?|@//g" | sed 's/\/$//')"
        MONGO_URI="$proto$hostport/${MONGODB_DATABASE}$parameters"
    else
        local hostport="$(echo $url | sed s/$userpass// | sed "s/\/\?$parameters//" | sed -re "s/\/\?|@//g" | sed 's/\/$//')"
        MONGODB_PASSWORD="$(echo $userpass | grep : | cut -d: -f2)"
        MONGODB_USER="$(echo $userpass | grep : | cut -d: -f1)"
        MONGO_URI="$proto$userpass@$hostport/${MONGODB_DATABASE}$parameters"
    fi


    if [[ -z $MONGODB_ROOT_OPTIONS ]]; then
        MONGODB_ROOT_URI="$proto${MONGODB_ROOT_USER}:${MONGODB_ROOT_PASSWORD}@$hostport/admin$parameters"
    else
        MONGODB_ROOT_URI="$proto${MONGODB_ROOT_USER}:${MONGODB_ROOT_PASSWORD}@$hostport/admin?${MONGODB_ROOT_OPTIONS}"
    fi

}

getMongoVersion() {
    MONOGDB_VERSION=$(mongosh ${MONGODB_ROOT_URI} --eval "db.version()" 2>&1 | tail -n1)
}

setSystemAdmin() {
    mongosh $MONGO_URI --eval "db.users.update({}, {\$set: {roles: ['User', 'Admin', 'Account Admin']}}, {multi: true})"
}

setPacks() {
    PACKS=$(cat ${ASSETS_PATH}packs.json)
    mongosh $MONGO_URI --eval "db.accounts.update({}, {\$set: {'build.packs': ${PACKS} }}, {multi: true})"

    PAYMENTS_MONGO_URI=${MONGO_URI/\/codefresh/\/payments}
    mongosh $PAYMENTS_MONGO_URI --eval "db.accounts.update({}, {\$set: {'plan.packs': ${PACKS} }}, {multi: true})"
}

parseMongoURI $MONGO_URI

if [[ -s ${MTLS_CERT_PATH} ]]; then
    MONGO_URI_EXTRA_PARAMS="--tls --tlsCertificateKeyFile ${MTLS_CERT_PATH} --tlsAllowInvalidHostnames --tlsAllowInvalidCertificates"
    MONGOIMPORT_EXTRA_PARAMS="--ssl --sslPEMKeyFile ${MTLS_CERT_PATH} --sslAllowInvalidHostnames --sslAllowInvalidCertificates"
else
    MONGO_URI_EXTRA_PARAMS=""
    MONGOIMPORT_EXTRA_PARAMS=""
fi

disableMongoTelemetry

waitForMongoDB

getMongoVersion

for MONGODB_DATABASE in ${MONGODB_DATABASES[@]}; do
    waitForMongoDB
    mongosh ${MONGODB_ROOT_URI} ${MONGO_URI_EXTRA_PARAMS} --eval "db.getSiblingDB(\"${MONGODB_DATABASE}\").createUser({user: \"${MONGODB_USER}\", pwd: \"${MONGODB_PASSWORD}\", roles: [\"readWrite\"]})" 2>&1 || true
    waitForMongoDB
    mongosh ${MONGODB_ROOT_URI} ${MONGO_URI_EXTRA_PARAMS} --eval "db.getSiblingDB(\"${MONGODB_DATABASE}\").changeUserPassword(\"${MONGODB_USER}\",\"${MONGODB_PASSWORD}\")" 2>&1 || true

    # MongoDB Atlas
    mongosh ${MONGODB_ROOT_URI} ${MONGO_URI_EXTRA_PARAMS} --eval "db = db.getSiblingDB(\"${MONGODB_DATABASE}\"); db[\"${MONGODB_DATABASE}\"].insertOne({ name: \"init\", value: true })" 2>&1 || true
done

mongosh ${MONGODB_ROOT_URI} ${MONGO_URI_EXTRA_PARAMS} --eval "db.getSiblingDB(\"codefresh\").grantRolesToUser( \"${MONGODB_USER}\", [ { role: \"readWrite\", db: \"pipeline-manager\" } ] )" 2>&1 || true
mongosh ${MONGODB_ROOT_URI} ${MONGO_URI_EXTRA_PARAMS} --eval "db.getSiblingDB(\"codefresh\").grantRolesToUser( \"${MONGODB_USER}\", [ { role: \"readWrite\", db: \"platform-analytics-postgres\" } ] )" 2>&1 || true
mongosh ${MONGODB_ROOT_URI} ${MONGO_URI_EXTRA_PARAMS} --eval "db.getSiblingDB(\"codefresh\").changeUserPassword(\"${MONGODB_USER}\",\"${MONGODB_PASSWORD}\")" 2>&1 || true

if [[ $DEVELOPMENT_CHART == "true" ]]; then
    setSystemAdmin
    setPacks
fi

mongoimport --uri ${MONGO_URI} ${MONGOIMPORT_EXTRA_PARAMS} --collection idps --type json --legacy --file ${ASSETS_PATH}idps.json
mongoimport --uri ${MONGO_URI} ${MONGOIMPORT_EXTRA_PARAMS} --collection accounts --type json --legacy --file ${ASSETS_PATH}accounts.json
mongoimport --uri ${MONGO_URI} ${MONGOIMPORT_EXTRA_PARAMS} --collection users --type json --legacy --file ${ASSETS_PATH}users.json
