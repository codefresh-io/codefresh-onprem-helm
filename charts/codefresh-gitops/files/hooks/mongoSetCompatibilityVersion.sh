#!/usr/bin/env bash

# Set https://docs.mongodb.com/manual/reference/command/setFeatureCompatibilityVersion/#dbcmd.setFeatureCompatibilityVersion

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

parseMongoURI $MONGO_URI

waitForMongoDB

mongosh ${MONGODB_ROOT_URI} --eval "db.adminCommand( { setFeatureCompatibilityVersion: \"$MONGODB_COMPAT_VERSION\" } )"
