#!/usr/bin/env bash

set -eou pipefail

disableMongoTelemetry() {
    mongosh --nodb --eval "disableTelemetry()"
}

DEFAULT_RE_NAMES=(
    system/default/hybrid/k8s
    system/default
)

function updateRESpec {
    if [[ -s /etc/ssl/mongodb/ca.pem ]]
    then
        mongosh "$MONGO_URI_RE_MANAGER" --tls --tlsCertificateKeyFile /etc/ssl/mongodb/ca.pem --tlsAllowInvalidHostnames --tlsAllowInvalidCertificates --eval "db.getCollection('runtime-environment').updateOne(
                {'metadata.name': '$1'},
                { \$set: {
                    \"dockerDaemonScheduler.dindImage\": \"$DIND_IMAGE\",
                    \"runtimeScheduler.image\": \"$ENGINE_IMAGE\",
                    \"runtimeScheduler.envVars.DOCKER_PUSHER_IMAGE\": \"$DOCKER_PUSHER_IMAGE\",
                    \"runtimeScheduler.envVars.DOCKER_PULLER_IMAGE\": \"$DOCKER_PULLER_IMAGE\",
                    \"runtimeScheduler.envVars.DOCKER_BUILDER_IMAGE\": \"$DOCKER_BUILDER_IMAGE\",
                    \"runtimeScheduler.envVars.CONTAINER_LOGGER_IMAGE\": \"$CONTAINER_LOGGER_IMAGE\",
                    \"runtimeScheduler.envVars.GIT_CLONE_IMAGE\": \"$GIT_CLONE_IMAGE\",
                    \"runtimeScheduler.envVars.DOCKER_TAG_PUSHER_IMAGE\": \"$DOCKER_TAG_PUSHER_IMAGE\",
                    \"runtimeScheduler.envVars.FS_OPS_IMAGE\": \"$FS_OPS_IMAGE\",
                    \"runtimeScheduler.envVars.COMPOSE_IMAGE\": \"$COMPOSE_IMAGE\",
                    \"runtimeScheduler.envVars.KUBE_DEPLOY\": \"$KUBE_DEPLOY\",
                    \"runtimeScheduler.envVars.TEMPLATE_ENGINE\": \"$TEMPLATE_ENGINE\",
                    \"runtimeScheduler.envVars.PIPELINE_DEBUGGER_IMAGE\": \"$PIPELINE_DEBUGGER_IMAGE\",
                    \"runtimeScheduler.envVars.CR_6177_FIXER\": \"$CR_6177_FIXER\",
                    \"runtimeScheduler.envVars.GC_BUILDER_IMAGE\": \"$GC_BUILDER_IMAGE\",
                    }
                }
            )"
    else
        mongosh "$MONGO_URI_RE_MANAGER" --eval "db.getCollection('runtime-environment').updateOne(
                {'metadata.name': '$1'},
                { \$set: {
                    \"dockerDaemonScheduler.dindImage\": \"$DIND_IMAGE\",
                    \"runtimeScheduler.image\": \"$ENGINE_IMAGE\",
                    \"runtimeScheduler.envVars.DOCKER_PUSHER_IMAGE\": \"$DOCKER_PUSHER_IMAGE\",
                    \"runtimeScheduler.envVars.DOCKER_PULLER_IMAGE\": \"$DOCKER_PULLER_IMAGE\",
                    \"runtimeScheduler.envVars.DOCKER_BUILDER_IMAGE\": \"$DOCKER_BUILDER_IMAGE\",
                    \"runtimeScheduler.envVars.CONTAINER_LOGGER_IMAGE\": \"$CONTAINER_LOGGER_IMAGE\",
                    \"runtimeScheduler.envVars.GIT_CLONE_IMAGE\": \"$GIT_CLONE_IMAGE\",
                    \"runtimeScheduler.envVars.DOCKER_TAG_PUSHER_IMAGE\": \"$DOCKER_TAG_PUSHER_IMAGE\",
                    \"runtimeScheduler.envVars.FS_OPS_IMAGE\": \"$FS_OPS_IMAGE\",
                    \"runtimeScheduler.envVars.COMPOSE_IMAGE\": \"$COMPOSE_IMAGE\",
                    \"runtimeScheduler.envVars.KUBE_DEPLOY\": \"$KUBE_DEPLOY\",
                    \"runtimeScheduler.envVars.TEMPLATE_ENGINE\": \"$TEMPLATE_ENGINE\",
                    \"runtimeScheduler.envVars.PIPELINE_DEBUGGER_IMAGE\": \"$PIPELINE_DEBUGGER_IMAGE\",
                    \"runtimeScheduler.envVars.CR_6177_FIXER\": \"$CR_6177_FIXER\",
                    \"runtimeScheduler.envVars.GC_BUILDER_IMAGE\": \"$GC_BUILDER_IMAGE\",
                    }
                }
            )"
    fi
}

disableMongoTelemetry

for re in ${DEFAULT_RE_NAMES[@]}; do
    echo "Updating the runtime $re"
    updateRESpec $re
done