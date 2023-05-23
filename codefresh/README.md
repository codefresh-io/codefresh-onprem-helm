## Codefresh On-Premises

![Version: 2.0.0-alpha.16](https://img.shields.io/badge/Version-2.0.0--alpha.16-informational?style=flat-square) ![AppVersion: 2.0.0](https://img.shields.io/badge/AppVersion-2.0.0-informational?style=flat-square)

## Table of Content

- [Prerequisites](#prerequisites)
- [Get Repo Info and Pull Chart](#get-repo-info-and-pull-chart)
- [Install Chart](#install-chart)
- [Helm Chart Configuration](#helm-chart-configuration)
  - [Configuring external services](#configuring-external-services)
    - [External MongoDB](#external-mongodb)
    - [External MongoDB with MTLS](#external-mongodb-with-mtls)
    - [External PostgresSQL](#external-postgressql)
    - [External Redis](#external-redis)
    - [External Redis with MTLS](#external-redis-with-mtls)
    - [External RabbitMQ](#external-rabbitmq)
  - [Configuring Ingress-NGINX](#configuring-ingress-nginx)
    - [ELB with SSL Termination (Classic Load Balancer)](#elb-with-ssl-termination-classic-load-balancer)
    - [NLB (Network Load Balancer)](#nlb-network-load-balancer)
  - [Configuration with ALB (Application Load Balancer)](#configuration-with-alb-application-load-balancer)
  - [Configuration with Private Registry](#configuration-with-private-registry)
  - [Configuration with multi-role CF-API](#configuration-with-multi-role-cf-api)
  - [High Availability](#high-availability)
- [Upgrading](#upgrading)
  - [To 2.0.0](#to-200)
- [Values](#values)

## Prerequisites

- Kubernetes **1.22+**
- Helm **3.8.0+**
- PV provisioner support in the underlying infrastructure
- GCR Service Account JSON `sa.json` (provided by Codefresh, contact support@codefresh.io)
- Firebase url and secret
- Valid TLS certificates for Ingress
- When [external](#external-postgressql) PostgreSQL is used, `pg_cron` and `pg_partman` extensions **must be enabled** for [analytics](https://codefresh.io/docs/docs/dashboards/pipeline-analytics/#content) to work (see [AWS RDS example](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/PostgreSQL_pg_cron.html#PostgreSQL_pg_cron.enable))

## Get Repo Info and Pull Chart

```console
helm repo add codefresh http://chartmuseum.codefresh.io/codefresh
helm repo update
```

## Install Chart

**Important:** only helm 3.8.0+ is supported

Edit default `values.yaml` or create empty `cf-values.yaml`

- Pass `sa.json` (as a single line) to `.Values.imageCredentials.password`

```yaml
# -- Credentials for Image Pull Secret object
imageCredentials:
  registry: gcr.io
  username: _json_key
  password: '{ "type": "service_account", "project_id": "codefresh-enterprise", "private_key_id": ... }'
```

- Specify `.Values.global.appUrl`, `.Values.global.firebaseUrl` and `.Values.global.firebaseSecret`

```yaml
global:
  # -- Application root url. Will be used in Ingress as hostname
  appUrl: onprem.mydomain.com

  # -- Firebase URL for logs streaming.
  firebaseUrl: <>
  # -- Firebase Secret.
  firebaseSecret: <>
```

- Specify `.Values.ingress.tls.cert` and `.Values.ingress.tls.key` OR `.Values.ingress.tls.existingSecret`

```yaml
ingress:
  # -- Enable the Ingress
  enabled: true
  # -- Set the ingressClass that is used for the ingress.
  # Default `nginx-codefresh` is created from `ingress-nginx` controller subchart
  ingressClassName: nginx-codefresh
  tls:
    # -- Enable TLS
    enabled: true
    # -- Default secret name to be created with provided `cert` and `key` below
    secretName: "star.codefresh.io"
    # -- Certificate (base64 encoded)
    cert: ""
    # -- Private key (base64 encoded)
    key: ""
    # -- Existing `kubernetes.io/tls` type secret with TLS certificates (keys: `tls.crt`, `tls.key`)
    existingSecret: ""
```

**Important:** use `cf` as Release Name at the moment

- Install the chart

```console
helm upgrade --install cf codefresh/codefresh \
    -f cf-values.yaml \
    --namespace codefresh \
    --create-namespace \
    --debug \
    --wait \
    --timeout 15m
```

## Helm Chart Configuration

See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing). To see all configurable options with detailed comments, visit the chart's [values.yaml](./values.yaml), or run these configuration commands:

```console
helm show values codefresh/codefresh
```

### Configuring external services

The chart contains required dependencies for the corresponding services
- [bitnami/mongodb](https://github.com/bitnami/charts/tree/main/bitnami/mongodb)
- [bitnami/postgresql](https://github.com/bitnami/charts/tree/main/bitnami/postgresql)
- [bitnami/redis](https://github.com/bitnami/charts/tree/main/bitnami/redis)
- [bitnami/rabbitmq](https://github.com/bitnami/charts/tree/main/bitnami/rabbitmq)

However, you might need to use external services like [MongoDB Atlas Database](https://www.mongodb.com/atlas/database) or [Amazon RDS for PostgreSQL](https://aws.amazon.com/rds/postgresql/). In order to use them, adjust the values accordingly:

#### External MongoDB

**Important:** Recommended version of Mongo is 4.4.x

```yaml
seed:
  mongoSeedJob:
    # -- Enable mongo seed job. Seeds the required data (default idp/user/account), creates cfuser and required databases.
    enabled: true
    # -- Root user (required ONLY for seed job!)
    mongodbRootUser: root
    # -- Root password (required ONLY for seed job!).
    mongodbRootPassword: password

global:
  # -- MongoDB connection string. Will be used by ALL services to communicate with MongoDB.
  # Ref: https://www.mongodb.com/docs/manual/reference/connection-string/
  # Note! `defaultauthdb` is omitted here on purpose (i.e. mongodb://.../[defaultauthdb]).
  # Mongo seed job will create and add `cfuser` (username and password are taken from `.Values.global.mongoURI`) with "ReadWrite" permissions to all of the required databases
  mongoURI: mongodb://cfuser:password@my-mongodb.prod.svc.cluster.local/
  # -- Should be the same as mongoURI above
  runtimeMongoURI: mongodb://cfuser:password@my-mongodb.prod.svc.cluster.local/

mongodb:
  # -- Disable mongodb subchart installation
  enabled: false
```

#### External MongoDB with MTLS

In order to use MTLS (Mutual TLS) for MongoDB, you need:

* Create a K8S secret that contains the certificate (certificate file and private key).
  The K8S secret should have one `ca.pem` key.
```console
cat cert.crt > ca.pem
cat cert.key >> ca.pem
kubectl create secret generic my-mongodb-tls --from-file=ca.pem
```

  Or you can create certificate using templates provided in Codefresh Helm chart.
  Add `.Values.secrets` into `values.yaml` as follows.
```yaml
secrets:
  mongodb-tls:
    enabled: true
    data:
      ca.pem: <base64 encoded sting>
```

*  Add `.Values.global.volumes` and `.Values.global.volumeMounts` to mount the secret into all the services.
```yaml
global:
  volumes:
    mongodb-tls:
      enabled: true
      type: secret
      # Existing secret with TLS certificates (key: `ca.pem`)
      # existingName: my-mongodb-tls
      optional: true

  volumeMounts:
    mongodb-tls:
      path:
      - mountPath: /etc/ssl/mongodb/ca.pem
        subPath: ca.pem

  env:
    MTLS_CERT_PATH: /etc/ssl/mongodb/ca.pem
    RUNTIME_MTLS_CERT_PATH: /etc/ssl/mongodb/ca.pem
    RUNTIME_MONGO_TLS: "true"
    # Set these env vars to 'false' if self-signed certificate is used to avoid x509 errors
    RUNTIME_MONGO_TLS_VALIDATE: "false"
    MONGO_MTLS_VALIDATE: "false"
```

#### External PostgresSQL

**Important:** Recommended version of Postgres is 13.x

```yaml
seed:
  postgresSeedJob:
    # -- Enable postgres seed job. Creates required user and databases.
    enabled: true
    # -- (optional) "postgres" admin user (required ONLY for seed job!)
    # Must be a privileged user allowed to create databases and grant roles.
    # If omitted, username and password from `.Values.global.postgresUser/postgresPassword` will be taken.
    postgresUser: postgres
    # -- (optional) Password for "postgres" admin user (required ONLY for seed job!)
    postgresPassword: password

global:
  # -- Postgresql hostname
  postgresHostname: my-postgres.domain.us-east-1.rds.amazonaws.com
  # -- Postgresql user
  postgresUser: cf_user
  # -- Postgresql password
  postgresPassword: password
  # -- (optional) Postgresql server port
  postgresPort: 5432

postgresql:
  # -- Disable postgresql subchart installation
  enabled: false
```

#### External Redis

**Important:** Recommended version of Redis is 7.x

```yaml
global:
  # -- Redis hostname
  redisUrl: my-redis.namespace.svc.cluster.local
  # -- Redis password
  redisPassword: password
  # -- (optional) Redis port
  redisPort: 6379

  # Should be the same as above.
  # Required for OfflineLogging feature is turned on. (i.e. when `.Values.global.firebaseSecret` is not provided)
  runtimeRedisHost: my-redis.namespace.svc.cluster.local
  runtimeRedisPassword: password
  runtimeRedisPort: 6379
  runtimeRedisDb: 2

redis:
  # -- Disable redis subchart installation
  enabled: false

```

#### External Redis with MTLS

In order to use [MTLS (Mutual TLS) for Redis](https://redis.io/docs/management/security/encryption/), you need:

* Create a K8S secret that contains the certificate (ca, certificate and private key).
```console
cat ca.crt tls.crt > tls.crt
kubectl create secret tls my-redis-tls --cert=tls.crt --key=tls.key --dry-run=client -o yaml | kubectl apply -f -
```

  Or you can create certificate using templates provided in Codefresh Helm chart.
  Add `.Values.secrets` into `values.yaml` as follows.
```yaml
secrets:
  redis-tls:
    enabled: true
    data:
      ca.crt: <base64 encoded string>
      tls.crt: <base64 encoded string>
      tls.key: <base64 encoded string>
```

*  Add `.Values.global.volumes` and `.Values.global.volumeMounts` to mount the secret into all the services.
```yaml
global:
  volumes:
    redis-tls:
      enabled: true
      type: secret
      # Existing secret with TLS certificates (keys: `ca.crt` , `tls.crt`, `tls.key`)
      # existingName: my-redis-tls
      optional: true

  volumeMounts:
    redis-tls:
      path:
      - mountPath: /etc/ssl/redis

  env:
    REDIS_TLS: true
    REDIS_CA_PATH: /etc/ssl/redis/ca.crt
    REDIS_CLIENT_CERT_PATH : /etc/ssl/redis/tls.crt
    REDIS_CLIENT_KEY_PATH: /etc/ssl/redis/tls.key
    # Set these env vars like that if self-signed certificate is used to avoid x509 errors
    REDIS_REJECT_UNAUTHORIZED: false
    REDIS_TLS_SKIP_VERIFY: true
```

#### External RabbitMQ

**Important:** Recommended version of RabbitMQ is 3.x

```yaml
global:
  # -- RabbitMQ hostname
  rabbitmqHostname: my-rabbitmq.namespace.svc.cluster.local
  # -- RabbitMQ user
  rabbitmqUsername: user
  # -- RabbitMQ password
  rabbitmqPassword: password

rabbitmq:
  # -- Disable rabbitmq subchart installation
  enabled: false
```

### Configuring Ingress-NGINX

The chart deploys the [ingress-nginx](https://github.com/kubernetes/ingress-nginx/tree/main) and exposes controller behind a Service of `Type=LoadBalancer`

All installation options for `ingress-nginx` are described at [Configuration](https://github.com/kubernetes/ingress-nginx/tree/main/charts/ingress-nginx#configuration)

Relevant examples for Codefesh are below:

#### ELB with SSL Termination (Classic Load Balancer)

*certificate provided from ACM*

```yaml
ingress-nginx:
  controller:
    service:
      annotations:
        service.beta.kubernetes.io/aws-load-balancer-backend-protocol: "tcp"
        service.beta.kubernetes.io/aws-load-balancer-ssl-ports: "443"
        service.beta.kubernetes.io/aws-load-balancer-connection-idle-timeout: '3600'
        service.beta.kubernetes.io/aws-load-balancer-ssl-cert: < CERTIFICATE ARN >
      targetPorts:
        http: http
        https: http

# -- Ingress
ingress:
  tls:
    # -- Disable TLS
    enabled: false
```

#### NLB (Network Load Balancer)

*certificate provided as base64 string or as exisiting k8s secret*

```yaml
ingress-nginx:
  controller:
    service:
      annotations:
        service.beta.kubernetes.io/aws-load-balancer-type: nlb
        service.beta.kubernetes.io/aws-load-balancer-backend-protocol: tcp
        service.beta.kubernetes.io/aws-load-balancer-connection-idle-timeout: '3600'
        service.beta.kubernetes.io/aws-load-balancer-cross-zone-load-balancing-enabled: 'true'

# -- Ingress
ingress:
  tls:
    # -- Enable TLS
    enabled: true
    # -- Default secret name to be created with provided `cert` and `key` below
    secretName: "star.codefresh.io"
    # -- Certificate (base64 encoded)
    cert: "LS0tLS1CRUdJTiBDRVJ...."
    # -- Private key (base64 encoded)
    key: "LS0tLS1CRUdJTiBSU0E..."
    # -- Existing `kubernetes.io/tls` type secret with TLS certificates (keys: `tls.crt`, `tls.key`)
    existingSecret: ""
```

### Configuration with ALB (Application Load Balancer)

*[Application Load Balancer](https://github.com/kubernetes-sigs/aws-load-balancer-controller/tree/main/helm/aws-load-balancer-controller) should be deployed to the cluster*

```yaml
ingress-nginx:
  # -- Disable ingress-nginx subchart installation
  enabled: false

ingress:
  # -- ALB contoller ingress class
  ingressClassName: alb
  annotations:
    alb.ingress.kubernetes.io/actions.ssl-redirect: '{"Type": "redirect", "RedirectConfig":{ "Protocol": "HTTPS", "Port": "443", "StatusCode": "HTTP_301"}}'
    alb.ingress.kubernetes.io/backend-protocol: HTTP
    alb.ingress.kubernetes.io/certificate-arn: <ARN>
    alb.ingress.kubernetes.io/listen-ports: '[{"HTTP": 80}, {"HTTPS":443}]'
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/success-codes: 200,404
    alb.ingress.kubernetes.io/target-type: ip
  services:
    # For ALB /* asterisk is required in path
    cfapi:
      - /api/*
      - /ws/*
```

### Configuration with Private Registry

If you install/upgrade Codefresh on an air-gapped environment without access to public registries (i.e. `quay.io`/`docker.io`) or Codefresh Enterprise registry at `gcr.io`, you will have to mirror the images to your organization’s container registry.

- Obtain [image list](https://github.com/codefresh-io/onprem-images/tree/master/releases) for specific release

- [Push images](https://github.com/codefresh-io/onprem-images/blob/master/push-to-registry.sh) to private docker registry

- Specify image registry in values

```yaml
global:
  imageRegistry: myregistry.domain.com

```

There are 3 types of images, with the values above in rendered manifests images will be converted as follows:

**non-Codefresh** like:

```yaml
bitnami/mongo:4.2
registry.k8s.io/ingress-nginx/controller:v1.4.0
postgres:13
```
converted to:
```yaml
myregistry.domain.com/bitnami/mongodb:4.2
myregistry.domain.com/ingress-nginx/controller:v1.2.0
myregistry.domain.com/postgres:13
```

Codefresh **public** images like:
```yaml
quay.io/codefresh/dind:20.10.13-1.25.2
quay.io/codefresh/engine:1.147.8
quay.io/codefresh/cf-docker-builder:1.1.14
```
converted to:
```yaml
myregistry.domain.com/codefresh/dind:20.10.13-1.25.2
myregistry.domain.com/codefresh/engine:1.147.8
myregistry.domain.com/codefresh/cf-docker-builder:1.1.14
```

Codefresh **private** images like:
```yaml
gcr.io/codefresh-enterprise/codefresh/cf-api:21.153.6
gcr.io/codefresh-enterprise/codefresh/cf-ui:14.69.38
gcr.io/codefresh-enterprise/codefresh/pipeline-manager:3.121.7
```
converted to:

```yaml
myregistry.domain.com/codefresh/cf-api:21.153.6
myregistry.domain.com/codefresh/cf-ui:14.69.38
myregistry.domain.com/codefresh/pipeline-manager:3.121.7
```

Use the example below to override repository for all templates:

```yaml

ingress-nginx:
  controller:
    image:
      registry: myregistry.domain.com
      image: codefresh/controller

mongodb:
  image:
    repository: codefresh/mongodb

postgresql:
  image:
    repository: codefresh/postgresql

consul:
  image:
    repository: codefresh/consul

redis:
  image:
    repository: codefresh/redis

rabbitmq:
  image:
    repository: codefresh/rabbitmq

nats:
  image:
    repository: codefresh/nats

builder:
  container:
    image:
      repository: codefresh/docker

runner:
  container:
    image:
      repository: codefresh/docker

internal-gateway:
  container:
    image:
      repository: codefresh/nginx-unprivileged

helm-repo-manager:
  chartmuseum:
    image:
      repository: codefresh/chartmuseum

cf-platform-analytics-platform:
  redis:
    image:
      repository: codefresh/redis
```

### Configuration with multi-role CF-API

The chart installs cf-api as a single deployment. Though, at a larger scale, we do recommend to split cf-api to multiple roles (one deployment per role) as follows:

```yaml

global:
  # -- Change internal cfapi service address
  cfapiService: cfapi-internal
  # -- Change endpoints cfapi service address
  cfapiEndpointsService: cfapi-endpoints

cfapi: &cf-api
  # -- Disable default cfapi deployment
  enabled: false
  # -- (optional) Enable the autoscaler
  # The value will be merged into each cfapi role. So you can specify it once.
  hpa:
    enabled: true
# Enable cf-api roles
cfapi-internal:
  !!merge <<: *cf-api
  enabled: true
cfapi-ws:
  !!merge <<: *cf-api
  enabled: true
cfapi-admin:
  !!merge <<: *cf-api
  enabled: true
cfapi-endpoints:
  !!merge <<: *cf-api
  enabled: true
cfapi-terminators:
  !!merge <<: *cf-api
  enabled: true
cfapi-sso-group-synchronizer:
  !!merge <<: *cf-api
  enabled: true
cfapi-buildmanager:
  !!merge <<: *cf-api
  enabled: true
cfapi-cacheevictmanager:
  !!merge <<: *cf-api
  enabled: true
cfapi-eventsmanagersubscriptions:
  !!merge <<: *cf-api
  enabled: true
cfapi-kubernetesresourcemonitor:
  !!merge <<: *cf-api
  enabled: true
cfapi-environments:
  !!merge <<: *cf-api
  enabled: true
cfapi-gitops-resource-receiver:
  !!merge <<: *cf-api
  enabled: true
cfapi-downloadlogmanager:
  !!merge <<: *cf-api
  enabled: true
cfapi-teams:
  !!merge <<: *cf-api
  enabled: true
cfapi-kubernetes-endpoints:
  !!merge <<: *cf-api
  enabled: true
cfapi-test-reporting:
  !!merge <<: *cf-api
  enabled: true

# Change ingress paths
ingress:
  services:
    cfapi: null # Set default cfapi path to null!
    cfapi-endpoints:
      - /api/
    cfapi-downloadlogmanager:
      - /api/progress/download
      - /api/public/progress/download
    cfapi-admin:
      - /api/admin/
    cfapi-ws:
      - /ws
    cfapi-teams:
      - /api/team
    cfapi-kubernetes-endpoints:
      - /api/kubernetes
    cfapi-test-reporting:
      - /api/testReporting
    cfapi-kubernetesresourcemonitor:
      - /api/k8s-monitor/
    cfapi-environments:
      - /api/environments-v2/argo/events
    cfapi-gitops-resource-receiver:
      - /api/gitops/resources
      - /api/gitops/rollout
```

### High Availability

The chart installs the non-HA version of Codefresh by default. If you want to run Codefresh in HA mode, use the example values below.

```yaml
cfapi:
  hpa:
    enabed: true
    # These are the defaults for all Codefresh subcharts
    # minReplicas: 2
    # maxReplicas: 10
    # targetCPUUtilizationPercentage: 70

argo-platform:
  abac:
    hpa:
      enabled: true

  analytics-reporter:
    hpa:
      enabled: true

  api-events:
    hpa:
      enabled: true

  api-graphql:
    hpa:
      enabled: true

  audit:
    hpa:
      enabled: true

  cron-executor:
    hpa:
      enabled: true

  event-handler:
    hpa:
      enabled: true

  ui:
    hpa:
      enabled: true

cfui:
  hpa:
    enabled: true

internal-gateway:
  hpa:
    enabled: true

charts-manager:
  hpa:
    enabled: true

cluster-providers:
  hpa:
    enabled: true

context-manager:
  hpa:
    enabled: true

gitops-dashboard-manager:
  hpa:
    enabled: true

helm-repo-manager:
  hpa:
    enabled: true

k8s-monitor:
  hpa:
    enabled: true

kube-integration:
  hpa:
    enabled: true

pipeline-manager:
  hpa:
    enabled: true

runtime-environment-manager:
  hpa:
    enabled: true

tasker-kubernetes:
  hpa:
    enabled: true

```

## Upgrading

### To 2.0.0

This major chart version change (v1.4.X -> v2.0.0) contains some **incompatible breaking change needing manual actions**.

**Before applying the upgrade, read through this section!**

#### ⚠️ New MongoDB Indexes

Starting from version 2.0.0, two new MongoDB indexes have been added that are vital for optimizing database queries and enhancing overall system performance. It is crucial to create these indexes before performing the upgrade to avoid any potential performance degradation.

- `account_1_annotations.key_1_annotations.value_1` (db: `codefresh`; collection: `annotations`)
```json
{
    "account" : 1,
    "annotations.key" : 1,
    "annotations.value" : 1
}
```

- `accountId_1_entityType_1_entityId_1` (db: `codefresh`; collection: `workflowprocesses`)

```json
{
    "accountId" : 1,
    "entityType" : 1,
    "entityId" : 1
}
```

To prevent potential performance degradation during the upgrade, it is important to schedule a maintenance window during a period of low activity or minimal user impact and create the indexes mentioned above before initiating the upgrade process. By proactively creating these indexes, you can avoid the application automatically creating them during the upgrade and ensure a smooth transition with optimized performance.

**Index Creation**

If you're hosting MongoDB on [Atlas](https://www.mongodb.com/atlas/database), use the following [Create, View, Drop, and Hide Indexes](https://www.mongodb.com/docs/atlas/atlas-ui/indexes/) guide to create indexes mentioned above. It's important to create them in a rolling fashion (i.e. **Build index via rolling process** checkbox enabled) in produciton environment.

For self-hosted MongoDB, see the following instruction:

- Connect to the MongoDB server using the [mongosh](https://www.mongodb.com/docs/mongodb-shell/install/) shell. Open your terminal or command prompt and run the following command, replacing <connection_string> with the appropriate MongoDB connection string for your server:
```console
mongosh "<connection_string>"
```

- Once connected, switch to the `codefresh` database where the index will be located using the `use` command.
```console
use codefresh
```

- To create the indexes, use the createIndex() method. The createIndex() method should be executed on the db object.
```console
db.workflowprocesses.createIndex({ account: 1, 'annotations.key': 1, 'annotations.value': 1 }, { name: 'account_1_annotations.key_1_annotations.value_1', sparse: true, background: true })
```

```console
db.annotations.createIndex({ accountId: 1, entityType: 1, entityId: 1 }, { name: 'accountId_1_entityType_1_entityId_1', background: true })
```
After executing the createIndex() command, you should see a result indicating the successful creation of the index.

#### ⚠️ [Kcfi](https://github.com/codefresh-io/kcfi) Deprecation

This major release deprecates [kcfi](https://github.com/codefresh-io/kcfi) installer. The recommended way to install Codefresh On-Prem is **Helm**.
Due to that, Kcfi `config.yaml` will not be compatible for Helm-based installation.
You still can reuse the same `config.yaml` for the Helm chart, but you need to remove (or update) the following sections.

* `.Values.metadata` is deprecated. Remove it from `config.yaml`

*1.4.x `config.yaml`*
```yaml
metadata:
  kind: codefresh
  installer:
    type: helm
    helm:
      chart: codefresh
      repoUrl: http://chartmuseum.codefresh.io/codefresh
      version: 1.4.x
```

* `.Values.kubernetes` is deprecated. Remove it from `config.yaml`

*1.4.x `config.yaml`*
```yaml
kubernetes:
  namespace: codefresh
  context: context-name
```

* `.Values.tls` (`.Values.webTLS`) is moved under `.Values.ingress.tls`. Remove `.Values.tls` from `config.yaml` afterwards.

  See full [values.yaml](./values.yaml#L92).

*1.4.x `config.yaml`*
```yaml
tls:
  selfSigned: false
  cert: certs/certificate.crt
  key: certs/private.key
```

*2.0.0 `config.yaml`*
```yaml
# -- Ingress
ingress:
  # -- Enable the Ingress
  enabled: true
  # -- Set the ingressClass that is used for the ingress.
  ingressClassName: nginx-codefresh
  tls:
    # -- Enable TLS
    enabled: true
    # -- Default secret name to be created with provided `cert` and `key` below
    secretName: "star.codefresh.io"
    # -- Certificate (base64 encoded)
    cert: "LS0tLS1CRUdJTiBDRVJ...."
    # -- Private key (base64 encoded)
    key: "LS0tLS1CRUdJTiBSU0E..."
    # -- Existing `kubernetes.io/tls` type secret with TLS certificates (keys: `tls.crt`, `tls.key`)
    existingSecret: ""
```

* `.Values.images` is deprecated.  Remove `.Values.images` from `config.yaml`.

  - `.Values.images.codefreshRegistrySa` is changed to `.Values.imageCredentials`

  - `.Values.privateRegistry.address` is changed to `.Values.global.imageRegistry` (no trailing slash `/` at the end)

  See full `values.yaml` [here](./values.yaml#L2) and [here](./values.yaml#L143).

*1.4.x `config.yaml`*
```yaml
images:
  codefreshRegistrySa: sa.json
  usePrivateRegistry: true
  privateRegistry:
    address: myprivateregistry.domain
    username: username
    password: password
```

*2.0.0 `config.yaml`*
```yaml
# -- Credentials for Image Pull Secret object
imageCredentials: {}
# Pass sa.json (as a single line). Obtain GCR Service Account JSON (sa.json) at support@codefresh.io
# E.g.:
# imageCredentials:
#   registry: gcr.io
#   username: _json_key
#   password: '{ "type": "service_account", "project_id": "codefresh-enterprise", "private_key_id": ... }'
```

*2.0.0 `config.yaml`*
```yaml
global:
  # -- Global Docker image registry
  imageRegistry: "myprivateregistry.domain"
```

* `.Values.dbinfra` is deprecated. Remove it from `config.yaml`

*1.4.x `config.yaml`*
```yaml
dbinfra:
  enabled: false
```

* `.Values.firebaseUrl` and `.Values.firebaseSecret` is moved under `.Values.global`

*1.4.x `config.yaml`*
```yaml
firebaseUrl: <url>
firebaseSecret: <secret>
newrelicLicenseKey: <key>
```

*2.0.0 `config.yaml`*
```yaml
global:
  # -- Firebase URL for logs streaming.
  firebaseUrl: ""
  # -- Firebase Secret.
  firebaseSecret: ""
  # -- New Relic Key
  newrelicLicenseKey: ""
```

* `.Values.global.certsJobs` and `.Values.global.seedJobs` is deprecated. Use `.Values.seed.mongoSeedJob` and `.Values.seed.postgresSeedJob`.

  See full [values.yaml](./values.yaml#L42).

*1.4.x `config.yaml`*
```yaml
global:
  certsJobs: true
  seedJobs: true
```

*2.0.0 `config.yaml`*
```yaml
seed:
  # -- Enable all seed jobs
  enabled: true
  # -- Mongo Seed Job. Required at first install. Seeds the required data (default idp/user/account), creates cfuser and required databases.
  # @default -- See below
  mongoSeedJob:
    enabled: true
  # -- Postgres Seed Job. Required at first install. Creates required user and databases.
  # @default -- See below
  postgresSeedJob:
    enabled: true
```

#### ⚠️ Migration to [Library Charts](https://helm.sh/docs/topics/library_charts/)

All Codefresh subcharts templates (i.e. `cfapi`, `cfui`, `pipeline-manager`, `context-manager`, etc) has been migrated to use helm [library charts](https://helm.sh/docs/topics/library_charts/).
That allows to unify values structure across all Codefresh owned charts. However, there are some **immutable** fields in the old charts which cannot be upgraded during a regular `helm upgrade`, thus additional manual actions are required.

Run the following commands before appying the upgrade.

* Delete `cf-runner` and `cf-builder` stateful sets.

```console
kubectl delete sts cf-runner --namespace $NAMESPACE
kubectl delete sts cf-builder --namespace $NAMESPACE
```

* Delete all jobs

```console
kubectl delete job --namespace $NAMESPACE -l release=cf
```

* In `values.yaml`/`config.yaml` remove `.Values.nomios.ingress` section if you have it

```yaml
nomios:
  # Remove ingress section
  ingress:
    ...
```

#### ⚠️ New Services

Codefesh 2.0.0 chart includes additional dependent microservices(charts):
- `argo-platform`: Main Codefresh GitOps module.
- `internal-gateway`: NGINX that proxies requests to the correct components (api-graphql, api-events, ui).
- `argo-hub-platform`: Service for Argo Workflow templates.
- `platform-analytics` and `etl-starter`: Service for [Pipelines dasboard](https://codefresh.io/docs/docs/dashboards/home-dashboard/#pipelines-dashboard)

These services require two additional databases in MongoDB (`audit` and `read-models`) and in Postgresql (`analytics` and `analytics_pre_aggregations`)
The helm chart is configured to re-run seed jobs to create necessary databases and users during the upgrade.

```yaml
seed:
  # -- Enable all seed jobs
  enabled: true
```

The bare minimal workload footprint for the new services (without HPA or PDB) is `~4vCPU` and `~8Gi RAM`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| argo-hub-platform | object | See below | argo-hub-platform |
| argo-platform | object | See below | argo-platform |
| argo-platform.abac | object | See below | abac |
| argo-platform.analytics-reporter | object | See below | analytics-reporter |
| argo-platform.api-events | object | See below | api-events |
| argo-platform.api-graphql | object | See below | api-graphql All other services under `.Values.argo-platform` follows the same values structure. |
| argo-platform.api-graphql.affinity | object | `{}` | Set pod's affinity |
| argo-platform.api-graphql.env | object | See below | Env vars |
| argo-platform.api-graphql.hpa | object | `{"enabled":false}` | HPA |
| argo-platform.api-graphql.hpa.enabled | bool | `false` | Enable autoscaler |
| argo-platform.api-graphql.image | object | `{"repository":"gcr.io/codefresh-enterprise/codefresh-io/argo-platform-api-graphql"}` | Image |
| argo-platform.api-graphql.image.repository | string | `"gcr.io/codefresh-enterprise/codefresh-io/argo-platform-api-graphql"` | Image repository |
| argo-platform.api-graphql.kind | string | `"Deployment"` | Controller kind. Currently, only `Deployment` is supported |
| argo-platform.api-graphql.pdb | object | `{"enabled":false}` | PDB |
| argo-platform.api-graphql.pdb.enabled | bool | `false` | Enable pod disruption budget |
| argo-platform.api-graphql.resources | object | See below | Resource limits and requests |
| argo-platform.api-graphql.secrets | object | See below | Secrets |
| argo-platform.api-graphql.tolerations | list | `[]` | Set pod's tolerations |
| argo-platform.argocd-hooks | object | See below | argocd-hooks Don't enable! Not used in onprem! |
| argo-platform.audit | object | See below | audit |
| argo-platform.cron-executor | object | See below | cron-executor |
| argo-platform.env | object | See below | Env anchors |
| argo-platform.event-handler | object | See below | event-handler |
| argo-platform.runtime-manager | object | See below | runtime-manager Don't enable! Not used in onprem! |
| argo-platform.runtime-monitor | object | See below | runtime-monitor Don't enable! Not used in onprem! |
| argo-platform.secrets | object | See below | Secrets anchors |
| argo-platform.ui | object | See below | ui |
| argo-platform.useExternalSecret | bool | `false` | Use regular k8s secret object. Keep `false`! |
| builder | object | `{"enabled":true}` | builder |
| cf-broadcaster | object | See below | broadcaster |
| cf-platform-analytics-etlstarter | object | See below | etl-starter |
| cf-platform-analytics-etlstarter.redis.enabled | bool | `false` | Disable redis subchart |
| cf-platform-analytics-etlstarter.system-etl-postgres | object | `{"enabled":true}` | Only postgres ETL should be running in onprem~ |
| cf-platform-analytics-platform | object | See below | platform-analytics |
| cfapi | object | `{"affinity":{},"container":{"env":{"AUDIT_AUTO_CREATE_DB":true,"GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh"},"image":{"registry":"gcr.io/codefresh-enterprise"}},"controller":{"replicas":2},"enabled":true,"hpa":{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70},"nodeSelector":{},"pdb":{"enabled":false,"minAvailable":"50%"},"podSecurityContext":{},"resources":{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}},"tolerations":[]}` | cf-api |
| cfapi.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh"},"image":{"registry":"gcr.io/codefresh-enterprise"}}` | Container configuration |
| cfapi.container.env | object | See below | Env vars |
| cfapi.container.image | object | `{"registry":"gcr.io/codefresh-enterprise"}` | Image |
| cfapi.container.image.registry | string | `"gcr.io/codefresh-enterprise"` | Registry prefix |
| cfapi.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi.controller.replicas | int | `2` | Replicas number |
| cfapi.enabled | bool | `true` | Enable cf-api |
| cfapi.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi.hpa.enabled | bool | `false` | Enable HPA |
| cfapi.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi.pdb.enabled | bool | `false` | Enable PDB |
| cfapi.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfsign | object | See below | tls-sign |
| cfui | object | See below | cf-ui |
| charts-manager | object | See below | charts-manager |
| cluster-providers | object | See below | cluster-providers |
| codefresh-tunnel-server | object | See below | codefresh-tunnel-server Don't enable! Not supported at the moment. |
| consul | object | See below | consul Ref: https://github.com/bitnami/charts/blob/main/bitnami/consul/values.yaml |
| context-manager | object | See below | context-manager |
| cronus | object | See below | cronus |
| dockerconfigjson | object | `{}` | DEPRECATED - Use `.imageCredentials` instead dockerconfig (for `kcfi` tool backward compatibility) for Image Pull Secret. Obtain GCR Service Account JSON (sa.json) at support@codefresh.io ```shell GCR_SA_KEY_B64=$(cat sa.json | base64) DOCKER_CFG_VAR=$(echo -n "_json_key:$(echo ${GCR_SA_KEY_B64} | base64 -d)" | base64 | tr -d '\n') ``` E.g.: dockerconfigjson:   auths:     gcr.io:       auth: <DOCKER_CFG_VAR> |
| gencerts | object | See below | Job to generate internal runtime secrets. Required at first install. |
| gitops-dashboard-manager | object | See below | gitops-dashboard-manager |
| global | object | See below | Global parameters |
| global.appProtocol | string | `"https"` | Application protocol. |
| global.appUrl | string | `"onprem.codefresh.local"` | Application root url. Will be used in Ingress objects as hostname |
| global.broadcasterPort | int | `80` | Default broadcaster service port. |
| global.broadcasterService | string | `"cf-broadcaster"` | Default broadcaster service name. |
| global.builderService | string | `"builder"` | Default builder service name. |
| global.certsJobs | bool | `false` | DEPRECATED - Use `.Values.gencerts` Generate self-signed certificates for internal runtime. Used in on-prem environments. |
| global.cfapiEndpointsService | string | `"cfapi"` | Default API endpoints service name |
| global.cfapiInternalPort | int | `3000` | Default API service port. |
| global.cfapiService | string | `"cfapi"` | Default API service name. |
| global.cfk8smonitorService | string | `"k8s-monitor"` | Default k8s-monitor service name. |
| global.chartsManagerPort | int | `9000` | Default chart-manager service port. |
| global.chartsManagerService | string | `"charts-manager"` | Default charts-manager service name. |
| global.clusterProvidersPort | int | `9000` | Default cluster-providers service port. |
| global.clusterProvidersService | string | `"cluster-providers"` | Default cluster-providers service name. |
| global.codefresh | string | `"codefresh"` | Keep `codefresh` as default! Global codefresh chart name. All subcharts use this name to access secrets and configmaps. |
| global.consulHttpPort | int | `8500` | Default Consul service port. |
| global.consulService | string | `"consul-headless"` | Default Consul service name. |
| global.contextManagerPort | int | `9000` | Default context-manager service port. |
| global.contextManagerService | string | `"context-manager"` | Default context-manager service name. |
| global.dnsService | string | `"kube-dns"` | Definitions to set up internal-gateway nginx resolver |
| global.env | object | `{}` | Global Env vars |
| global.firebaseSecret | string | `""` | Firebase Secret. |
| global.firebaseUrl | string | `"https://codefresh-on-prem.firebaseio.com/on-prem"` | Firebase URL for logs streaming. |
| global.gitopsDashboardManagerDatabase | string | `"pipeline-manager"` | Default gitops-dashboarad-manager db collection. |
| global.gitopsDashboardManagerPort | int | `9000` | Default gitops-dashboarad-manager service port. |
| global.gitopsDashboardManagerService | string | `"gitops-dashboard-manager"` | Default gitops-dashboarad-manager service name. |
| global.helmRepoManagerService | string | `"helm-repo-manager"` | Default helm-repo-manager service name. |
| global.hermesService | string | `"hermes"` | Default hermes service name. |
| global.imagePullSecrets | list | `[]` | Global Docker registry secret names as array |
| global.imageRegistry | string | `""` | Global Docker image registry |
| global.kubeIntegrationPort | int | `9000` | Default kube-integration service port. |
| global.kubeIntegrationService | string | `"kube-integration"` | Default kube-integration service name. |
| global.mongoURI | string | `"mongodb://cfuser:mTiXcU2wafr9@cf-mongodb:27017"` | Default Internal MongoDB URI (from bitnami/mongodb subchart).. Change if you use external MongoDB. See "External MongoDB" example below. Will be used by ALL services to communicate with MongoDB. Ref: https://www.mongodb.com/docs/manual/reference/connection-string/ Note! `defaultauthdb` is omitted here on purpose (i.e. mongodb://.../[defaultauthdb]). Mongo seed job will create and add `cfuser` (username and password are taken from `.Values.global.mongoURI`) with "ReadWrite" permissions to all of the required databases |
| global.mongodbDatabase | string | `"codefresh"` | Default MongoDB database name. Don't change! |
| global.mongodbRootPassword | string | `""` | DEPRECATED - Use `.Values.seed.mongoSeedJob` instead. |
| global.mongodbRootUser | string | `""` | DEPRECATED - Use `.Values.seed.mongoSeedJob` instead. |
| global.natsPort | int | `4222` | Default nats service port. |
| global.natsService | string | `"nats"` | Default nats service name. |
| global.newrelicLicenseKey | string | `""` | New Relic Key |
| global.onprem | bool | `true` | Keep `true` as default! |
| global.pipelineManagerPort | int | `9000` | Default pipeline-manager service port. |
| global.pipelineManagerService | string | `"pipeline-manager"` | Default pipeline-manager service name. |
| global.platformAnalyticsPort | int | `80` | Default platform-analytics service port. |
| global.platformAnalyticsService | string | `"platform-analytics"` | Default platform-analytics service name. |
| global.postgresDatabase | string | `"codefresh"` | Default Postgresql database name (from bitnami/postgresql subchart). Change if you use external PostreSQL. See "External Postgresql" example below. |
| global.postgresHostname | string | `""` | Set External Postgresql service address. Takes precedence over `global.postgresService`. See "External Postgresql" example below. |
| global.postgresPassword | string | `"eC9arYka4ZbH"` | Default Postgresql password (from bitnami/postgresql subchart). Change if you use external PostreSQL. See "External Postgresql" example below. |
| global.postgresPort | int | `5432` | Default Postgresql port number (from bitnami/postgresql subchart). Change if you use external PostreSQL. See "External Postgresql" example below. |
| global.postgresSeedJob | object | `{}` | DEPRECATED - Use `.Values.seed.postgresSeedJob` instead. |
| global.postgresService | string | `"postgresql"` | Default Internal Postgresql service address (from bitnami/postgresql subchart). Change if you use external PostreSQL. See "External Postgresql" example below. |
| global.postgresUser | string | `"postgres"` | Default Postgresql username (from bitnami/postgresql subchart). Change if you use external PostreSQL. See "External Postgresql" example below. |
| global.privateRegistry | bool | `false` | DEPRECATED - Use `.Values.global.imageRegistry` instead |
| global.rabbitService | string | `"rabbitmq"` | Default Internal RabbitMQ service address (from bitnami/rabbitmq subchart). |
| global.rabbitmqHostname | string | `""` | Set External RabbitMQ service address. Takes precedence over `global.rabbitService`. See "External RabbitMQ" example below. |
| global.rabbitmqPassword | string | `"cVz9ZdJKYm7u"` | Default RabbitMQ password (from bitnami/rabbitmq subchart). Change if you use external RabbitMQ. See "External RabbitMQ" example below. |
| global.rabbitmqUsername | string | `"user"` | Default RabbitMQ username (from bitnami/rabbitmq subchart). Change if you use external RabbitMQ. See "External RabbitMQ" example below. |
| global.redisPassword | string | `"hoC9szf7NtrU"` | Default Redis password (from bitnami/redis subchart). Change if you use external Redis. See "External Redis" example below. |
| global.redisPort | int | `6379` | Default Internal Redis service port (from bitnami/redis subchart). Change if you use external Redis. See "External Redis" example below. |
| global.redisService | string | `"redis-master"` | Default Internal Redis service address (from bitnami/redis subchart). |
| global.redisUrl | string | `""` | Set External Redis service address. Takes precedence over `global.redisService` |
| global.runnerService | string | `"runner"` | Default runner service name. |
| global.runtimeEnvironmentManagerPort | int | `80` | Default runtime-environment-manager service port. |
| global.runtimeEnvironmentManagerService | string | `"runtime-environment-manager"` | Default runtime-environment-manager service name. |
| global.runtimeMongoDb | string | `"codefresh"` | Default Internal MongoDB database name |
| global.runtimeMongoURI | string | `"mongodb://cfuser:mTiXcU2wafr9@cf-mongodb:27017"` | Default Internal MongoDB URI |
| global.runtimeRedisDb | string | `"1"` | Default Redis keyspace number. |
| global.runtimeRedisHost | string | `""` | Set External Redis service address. Keep empty in built-in redis chart is used (i.e. `.Values.redis.enabled=true`) |
| global.runtimeRedisPassword | string | `"hoC9szf7NtrU"` | Default Redis password. |
| global.runtimeRedisPort | string | `"6379"` | Default Redis port number. |
| global.seedJobs | bool | `false` | DEPRECATED - Use `.Values.seed.mongoSeedJob` and `.Values.seed.postgresSeedJob` and instead Instantiate databases with seed data. Used in on-prem environments. |
| global.storageClass | string | `""` | Global StorageClass for Persistent Volume(s) |
| global.tlsSignPort | int | `4999` | Default tls-sign service port. |
| global.tlsSignService | string | `"cfsign"` | Default tls-sign service name. |
| helm-repo-manager | object | See below | helm-repo-manager |
| hermes | object | See below | hermes |
| hooks | object | See below | Pre/post-upgrade Job hooks. Updates images in `system/default` runtime. |
| imageCredentials | object | `{}` | Credentials for Image Pull Secret object |
| ingress | object | `{"annotations":{"nginx.ingress.kubernetes.io/configuration-snippet":"more_set_headers \"X-Request-ID: $request_id\";\nproxy_set_header X-Request-ID $request_id;\n","nginx.ingress.kubernetes.io/service-upstream":"true","nginx.ingress.kubernetes.io/ssl-redirect":"false","nginx.org/redirect-to-https":"false"},"enabled":true,"ingressClassName":"nginx-codefresh","services":{"cfapi":["/api/","/ws"],"cfui":["/"],"nomios":["/nomios/"]},"tls":{"cert":"","enabled":false,"existingSecret":"","key":"","secretName":"star.codefresh.io"}}` | Ingress |
| ingress-nginx | object | See below | ingress-nginx Ref: https://github.com/kubernetes/ingress-nginx/blob/main/charts/ingress-nginx/values.yaml |
| ingress.annotations | object | See below | Set annotations for ingress. |
| ingress.enabled | bool | `true` | Enable the Ingress |
| ingress.ingressClassName | string | `"nginx-codefresh"` | Set the ingressClass that is used for the ingress. Default `nginx-codefresh` is created from `ingress-nginx` controller subchart |
| ingress.services | object | See below | Default services and corresponding paths |
| ingress.tls.cert | string | `""` | Certificate (base64 encoded) |
| ingress.tls.enabled | bool | `false` | Enable TLS |
| ingress.tls.existingSecret | string | `""` | Existing `kubernetes.io/tls` type secret with TLS certificates (keys: `tls.crt`, `tls.key`) |
| ingress.tls.key | string | `""` | Private key (base64 encoded) |
| ingress.tls.secretName | string | `"star.codefresh.io"` | Default secret name to be created with provided `cert` and `key` below |
| internal-gateway | object | See below | internal-gateway |
| internal-gateway.controller | object | `{"replicas":2}` | Controller configuration |
| internal-gateway.controller.replicas | int | `2` | Replicas number |
| internal-gateway.ingress | object | `{"main":{"enabled":true,"hosts":[{"host":"{{ .Values.global.appUrl }}","paths":[{"path":"/2.0/api","pathType":"ImplementationSpecific","service":{"name":"{{ .Release.Name }}-internal-gateway","port":"{{ .Values.service.main.ports.http.port }}"}},{"path":"/2.0","pathType":"ImplementationSpecific","service":{"name":"{{ .Release.Name }}-internal-gateway","port":"{{ .Values.service.main.ports.http.port }}"}},{"path":"/argo/hub","pathType":"ImplementationSpecific","service":{"name":"argo-hub-platform","port":"80"}}]}],"ingressClassName":"nginx-codefresh","tls":[]}}` | Internal-gateway Ingress |
| internal-gateway.ingress.main.hosts | list | See below | Internal gateway hosts |
| internal-gateway.ingress.main.ingressClassName | string | `"nginx-codefresh"` | Internal-gateway ingress class No need to change it here. Value will be pushed from root context `.Values.ingress.ingressClassName` |
| internal-gateway.ingress.main.tls | list | `[]` | Enable Internal-gateway Ingress TLS Keep as empty list. Value will be pushed from root context `.Values.ingress.tls` |
| internal-gateway.libraryMode | bool | `true` | Do not change this value! Breaks chart logic |
| k8s-monitor | object | See below | k8s-monitor |
| kube-integration | object | See below | kube-integration |
| mongodb | object | See below | mongodb Ref: https://github.com/bitnami/charts/blob/main/bitnami/mongodb/values.yaml |
| nats | object | See below | nats Ref: https://github.com/bitnami/charts/blob/main/bitnami/nats/values.yaml |
| nomios | object | See below | nomios |
| pipeline-manager | object | See below | pipeline-manager |
| postgresql | object | See below | postgresql Ref: https://github.com/bitnami/charts/blob/main/bitnami/postgresql/values.yaml |
| rabbitmq | object | See below | rabbitmq Ref: https://github.com/bitnami/charts/blob/main/bitnami/rabbitmq/values.yaml |
| redis | object | See below | redis Ref: https://github.com/bitnami/charts/blob/main/bitnami/redis/values.yaml |
| runner | object | See below | runner |
| runtime-environment-manager | object | See below | runtime-environment-manager |
| runtimeImages | object | See below | runtimeImages |
| seed | object | See below | Seed jobs |
| seed.enabled | bool | `true` | Enable all seed jobs |
| seed.mongoSeedJob | object | See below | Mongo Seed Job. Required at first install. Seeds the required data (default idp/user/account), creates cfuser and required databases. |
| seed.mongoSeedJob.mongodbRootPassword | string | `"XT9nmM8dZD"` | Root password (required ONLY for seed job!). |
| seed.mongoSeedJob.mongodbRootUser | string | `"root"` | Root user (required ONLY for seed job!). |
| seed.postgresSeedJob | object | See below | Postgres Seed Job. Required at first install. Creates required user and databases. |
| seed.postgresSeedJob.postgresPassword | optional | `""` | Password for "postgres" admin user (required ONLY for seed job!) |
| seed.postgresSeedJob.postgresUser | optional | `""` | "postgres" admin user (required ONLY for seed job!) Must be a privileged user allowed to create databases and grant roles. If omitted, username and password from `.Values.global.postgresUser/postgresPassword` will be taken. |
| tasker-kubernetes | object | `{"affinity":{},"container":{"image":{"registry":"gcr.io/codefresh-enterprise"}},"enabled":true,"hpa":{"enabled":false},"nodeSelector":{},"pdb":{"enabled":false},"podSecurityContext":{},"resources":{"limits":{},"requests":{"cpu":"100m","memory":"128Mi"}},"tolerations":[]}` | tasker-kubernetes |
| webTLS | object | `{"cert":"","enabled":false,"key":"","secretName":"star.codefresh.io"}` | DEPRECATED - Use `.Values.ingress.tls` instead TLS secret for Ingress |