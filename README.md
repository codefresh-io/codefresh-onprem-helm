# Codefresh On-Premises

[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/codefresh-inc/on-prem%2Fonprem-ci?type=cf-2&key=eyJhbGciOiJIUzI1NiJ9.NTY3MmQ4ZGViNjcyNGI2ZTM1OWFkZjYy.AN2wExsAsq7FseTbVxxWls8muNx_bBUnQWQVS8IgDTI)]( https://g.codefresh.io/pipelines/edit/new/builds?id=5ee8d26e8d2815f4e5146d52&pipeline=onprem-ci&projects=on-prem&projectId=5ee9c5edaa339a29053f7498)

## Prerequisites

- Kubernetes 1.22+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure
- GCR Service Account JSON `sa.json` (provided by Codefresh)
- Firebase secret (provided by Codefresh)

## Get Repo Info

```console
helm repo add codefresh-onprem https://chartmuseum.codefresh.io/codefresh
helm repo update
```

## Install Chart

**Important:** only helm3 is supported

- obtain GCR Service Account JSON and Firebase secret from Codefresh:

```shell
GCR_SA_KEY_B64=$(cat sa.json | base64)
DOCKER_CFG_VAR=$(echo -n "_json_key:$(echo ${GCR_SA_KEY_B64} | base64 -d)" | base64 | tr -d '\n')
FIREBASE_SECRET="<token>"
VALUES_MAIN="cf-values.yaml"
CF_APP_HOST="onprem.example.com"
```

- Edit default `values.yaml` or create empty `cf-values.yaml`

```shell
cat <<EOF > ${VALUES_MAIN}
global:
  appProtocol: https
  appUrl: ${CF_APP_HOST}
  seedJobs: true
  certsJobs: true

firebaseSecret: ${FIREBASE_SECRET}

dockerconfigjson:
  auths:
    gcr.io:
      auth: ${DOCKER_CFG_VAR}
EOF
```

- Install Chart
```console
helm upgrade --install cf codefresh-onprem/codefresh -f cf-values.yaml --create-namespace --namespace codefresh --debug
```

The command deploys Codefresh On-Premises on the Kubernetes cluster in the default configuration.

_See [configuration](#configuration) below._

_See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation._

## Configuration


## Parameters

### Tags

| Name                 | Description                                           | Value   |
| -------------------- | ----------------------------------------------------- | ------- |
| `tags.cf-infra`      | Enable Codefresh Classic services(charts)             | `true`  |
| `tags.argo-platform` | (WIP) Enable Codefresh Argo-Platform services(charts) | `false` |


### Root

| Name             | Description                     | Value                                              |
| ---------------- | ------------------------------- | -------------------------------------------------- |
| `firebaseUrl`    | Firebase URL for logs streaming | `https://codefresh-on-prem.firebaseio.com/on-prem` |
| `firebaseSecret` | Firebase Secret                 | `placeholder`                                      |


### Global parameters

| Name                          | Description                                                                                                     | Value                                         |
| ----------------------------- | --------------------------------------------------------------------------------------------------------------- | --------------------------------------------- |
| `global.appUrl`               | Application root url                                                                                            | `onprem.codefresh.local`                      |
| `global.seedJobs`             | Instantiate databases with seed data. Used in on-prem environments. `true/false`                                | `nil`                                         |
| `global.certsJobs`            | Generate self-signed certificates for Builder/Runner. Used in on-prem environments. `true/false`                | `nil`                                         |
| `global.privateRegistry`      | When using private docker registry, enable this flag                                                            | `false`                                       |
| `global.dockerRegistry`       | Replaces/adds docker registry prefix for images when `privateRegistry` is enabled (has to be with trailing `/`) | `""`                                          |
| `global.rabbitService`        | Default Internal RabbitMQ service address                                                                       | `rabbitmq`                                    |
| `global.rabbitmqHostname`     | External RabbitMQ service address                                                                               | `nil`                                         |
| `global.rabbitmqUsername`     | Default RabbitMQ username                                                                                       | `user`                                        |
| `global.rabbitmqPassword`     | Default RabbitMQ password                                                                                       | `cVz9ZdJKYm7u`                                |
| `global.mongoURI`             | Default Internal MongoDB URI                                                                                    | `mongodb://cfuser:mTiXcU2wafr9@mongodb:27017` |
| `global.mongodbDatabase`      | Default MongoDB database name                                                                                   | `codefresh`                                   |
| `global.mongodbRootUser`      | Default MongoDB root user                                                                                       | `root`                                        |
| `global.mongodbRootPassword`  | Default MongoDB root password                                                                                   | `XT9nmM8dZD`                                  |
| `global.mongodbImage`         | Default Image used in seed-jobs                                                                                 | `bitnami/mongodb:4.2`                         |
| `global.redisService`         | Default Internal Redis service address                                                                          | `redis-master`                                |
| `global.redisPort`            | Default Redis port number                                                                                       | `6379`                                        |
| `global.redisUrl`             | Default External Redis service address                                                                          | `nil`                                         |
| `global.redisPassword`        | Default Redis password                                                                                          | `hoC9szf7NtrU`                                |
| `global.runtimeRedisHost`     | Default for OfflineLogging feature                                                                              | `cf-redis-master`                             |
| `global.runtimeRedisPassword` | Default for OfflineLogging feature                                                                              | `hoC9szf7NtrU`                                |
| `global.runtimeRedisDb`       | Default for OfflineLogging feature                                                                              | `1`                                           |
| `global.runtimeRedisPort`     | Default for OfflineLogging feature                                                                              | `6379`                                        |
| `global.runtimeMongoURI`      | Default for OfflineLogging feature                                                                              | `mongodb://cfuser:mTiXcU2wafr9@mongodb:27017` |
| `global.runtimeMongoDb`       | Default for OfflineLogging feature                                                                              | `codefresh`                                   |
| `global.postgresService`      | Default Internal Postgresql service address                                                                     | `postgresql`                                  |
| `global.postgresHostname`     | Default External Postgresql service address                                                                     | `nil`                                         |
| `global.postgresUser`         | Default Postgresql username                                                                                     | `postgres`                                    |
| `global.postgresPassword`     | Default Postgresql password                                                                                     | `eC9arYka4ZbH`                                |
| `global.postgresDatabase`     | Default Postgresql database name                                                                                | `codefresh`                                   |
| `global.postgresPort`         | Default Postgresql port number                                                                                  | `5432`                                        |


## Additional Documentation
[Codefresh On-Premises](https://codefresh.io/docs/docs/administration/codefresh-on-prem/)
