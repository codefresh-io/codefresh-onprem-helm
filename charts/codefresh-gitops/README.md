# codefresh-gitops

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

Helm Chart for Codefresh GitOps On-Prem

**Homepage:** <https://codefresh.io/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| codefresh |  | <https://codefresh-io.github.io/> |

## Source Code

* <https://github.com/codefresh-io/codefresh-onprem-helm>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mongodb | 15.6.26 |
| https://charts.bitnami.com/bitnami | postgresql | 16.7.4 |
| https://charts.bitnami.com/bitnami | rabbitmq | 15.5.3 |
| https://charts.bitnami.com/bitnami | redis | 20.13.4 |
| oci://quay.io/codefresh/charts | argo-hub-platform | * |
| oci://quay.io/codefresh/charts | argo-platform | * |
| oci://quay.io/codefresh/charts | cf-common | 0.27.0 |
| oci://quay.io/codefresh/charts | cf-platform-analytics-platform(cf-platform-analytics) | * |
| oci://quay.io/codefresh/charts | cf-platform-analytics-etlstarter(cf-platform-analytics) | * |
| oci://quay.io/codefresh/charts | cfapi(cfapi) | * |
| oci://quay.io/codefresh/charts | cfui | * |
| oci://quay.io/codefresh/charts | internal-gateway | 0.10.4 |
| oci://quay.io/codefresh/charts | runtime-environment-manager | * |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| argo-hub-platform | object | See below | argo-hub-platform |
| argo-platform | object | See below | argo-platform |
| argo-platform.abac | object | See below | abac |
| argo-platform.analytics-reporter | object | See below | analytics-reporter |
| argo-platform.anchors | object | See below | Anchors |
| argo-platform.api-events | object | See below | api-events |
| argo-platform.api-graphql | object | See below | api-graphql All other services under `.Values.argo-platform` follows the same values structure. |
| argo-platform.api-graphql.affinity | object | `{}` | Set pod's affinity |
| argo-platform.api-graphql.env | object | See below | Env vars |
| argo-platform.api-graphql.hpa | object | `{"enabled":false}` | HPA |
| argo-platform.api-graphql.hpa.enabled | bool | `false` | Enable autoscaler |
| argo-platform.api-graphql.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh-io/argo-platform-api-graphql"}` | Image |
| argo-platform.api-graphql.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry |
| argo-platform.api-graphql.image.repository | string | `"codefresh-io/argo-platform-api-graphql"` | Repository |
| argo-platform.api-graphql.kind | string | `"Deployment"` | Controller kind. Currently, only `Deployment` is supported |
| argo-platform.api-graphql.pdb | object | `{"enabled":false}` | PDB |
| argo-platform.api-graphql.pdb.enabled | bool | `false` | Enable pod disruption budget |
| argo-platform.api-graphql.podAnnotations | object | `{"checksum/secret":"{{ include (print $.Template.BasePath \"/api-graphql/secret.yaml\") . | sha256sum }}"}` | Set pod's annotations |
| argo-platform.api-graphql.resources | object | See below | Resource limits and requests |
| argo-platform.api-graphql.secrets | object | See below | Secrets |
| argo-platform.api-graphql.tolerations | list | `[]` | Set pod's tolerations |
| argo-platform.argocd-hooks | object | See below | argocd-hooks Don't enable! Not used in onprem! |
| argo-platform.audit | object | See below | audit |
| argo-platform.broadcaster | object | See below | broadcaster |
| argo-platform.cron-executor | object | See below | cron-executor |
| argo-platform.event-handler | object | See below | event-handler |
| argo-platform.promotion-orchestrator | object | See below | promotion-orchestrator |
| argo-platform.runtime-manager | object | See below | runtime-manager Don't enable! Not used in onprem! |
| argo-platform.runtime-monitor | object | See below | runtime-monitor Don't enable! Not used in onprem! |
| argo-platform.ui | object | See below | ui |
| argo-platform.useExternalSecret | bool | `false` | Use regular k8s secret object. Keep `false`! |
| cf-platform-analytics-etlstarter | object | See below | etl-starter |
| cf-platform-analytics-etlstarter.redis.enabled | bool | `false` | Disable redis subchart |
| cf-platform-analytics-etlstarter.system-etl-postgres | object | `{"container":{"env":{"BLUE_GREEN_ENABLED":true}},"controller":{"cronjob":{"ttlSecondsAfterFinished":300}},"enabled":true,"fullnameOverride":"system-etl-postgres"}` | Only postgres ETL should be running in onprem |
| cf-platform-analytics-platform | object | See below | platform-analytics |
| cfapi | object | `{"affinity":{},"container":{"env":{"API_URI":"cfapi","AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"GITOPS","LOGGER_LEVEL":"debug","ON_PREMISE":true,"PIPELINE_MANAGER_URI":"pipeline-manager","PLATFORM_ANALYTICS_URI":"platform-analytics","RUNTIME_ENVIRONMENT_MANAGER_URI":"runtime-environment-manager"},"image":{"digest":"","registry":"us-docker.pkg.dev/codefresh-inc/gcr.io","repository":"codefresh/dev/cf-api","tag":"21.283.0-test-gitops-system-type"}},"controller":{"replicas":2},"enabled":true,"fullnameOverride":"cfapi","hpa":{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70},"imagePullSecrets":[],"nodeSelector":{},"pdb":{"enabled":false,"minAvailable":"50%"},"podSecurityContext":{},"resources":{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}},"tolerations":[]}` | cf-api |
| cfapi.affinity | object | `{}` | Affinity configuration |
| cfapi.container | object | `{"env":{"API_URI":"cfapi","AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"GITOPS","LOGGER_LEVEL":"debug","ON_PREMISE":true,"PIPELINE_MANAGER_URI":"pipeline-manager","PLATFORM_ANALYTICS_URI":"platform-analytics","RUNTIME_ENVIRONMENT_MANAGER_URI":"runtime-environment-manager"},"image":{"digest":"","registry":"us-docker.pkg.dev/codefresh-inc/gcr.io","repository":"codefresh/dev/cf-api","tag":"21.283.0-test-gitops-system-type"}}` | Container configuration |
| cfapi.container.env | object | See below | Env vars |
| cfapi.container.image | object | `{"digest":"","registry":"us-docker.pkg.dev/codefresh-inc/gcr.io","repository":"codefresh/dev/cf-api","tag":"21.283.0-test-gitops-system-type"}` | Image |
| cfapi.container.image.digest | string | `""` | Digest |
| cfapi.container.image.registry | string | `"us-docker.pkg.dev/codefresh-inc/gcr.io"` | Registry prefix |
| cfapi.container.image.repository | string | `"codefresh/dev/cf-api"` | Repository |
| cfapi.container.image.tag | string | `"21.283.0-test-gitops-system-type"` | Tag |
| cfapi.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi.controller.replicas | int | `2` | Replicas number |
| cfapi.enabled | bool | `true` | Enable cf-api |
| cfapi.fullnameOverride | string | `"cfapi"` | Override name |
| cfapi.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi.hpa.enabled | bool | `false` | Enable HPA |
| cfapi.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi.imagePullSecrets | list | `[]` | Image pull secrets |
| cfapi.nodeSelector | object | `{}` | Node selector configuration |
| cfapi.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi.pdb.enabled | bool | `false` | Enable PDB |
| cfapi.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi.podSecurityContext | object | `{}` | Pod security context configuration |
| cfapi.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfapi.tolerations | list | `[]` | Tolerations configuration |
| cfui | object | See below | cf-ui |
| global | object | See below | Global parameters |
| global.affinity | object | `{}` | Global affinity constraints Apply affinity to all Codefresh subcharts. Will not be applied on Bitnami subcharts. |
| global.appProtocol | string | `"https"` | Application protocol. |
| global.appUrl | string | `"onprem.codefresh.local"` | Application root url. Will be used in Ingress objects as hostname |
| global.cfapiEndpointsService | string | `"cfapi"` | Default API endpoints service name |
| global.cfapiInternalPort | int | `3000` | Default API service port. |
| global.cfapiService | string | `"cfapi"` | Default API service name. |
| global.dnsService | string | `"kube-dns"` | Definitions for internal-gateway nginx resolver |
| global.env | object | `{}` | Global Env vars |
| global.imagePullSecrets | list | `["codefresh-registry"]` | Global Docker registry secret names as array |
| global.imageRegistry | string | `""` | Global Docker image registry |
| global.mongoURI | string | `""` | Legacy MongoDB connection string. Keep empty! |
| global.mongodbDatabase | string | `"codefresh"` | Default MongoDB database name. Don't change! |
| global.mongodbHost | string | `"mongodb"` | Set mongodb host in plain text |
| global.mongodbHostSecretKeyRef | object | `{}` | Set mongodb host from existing secret |
| global.mongodbOptions | string | `"retryWrites=true"` | Set mongodb connection string options Ref: https://www.mongodb.com/docs/manual/reference/connection-string/#connection-string-options |
| global.mongodbPassword | string | `"password"` | Set mongodb password in plain text |
| global.mongodbPasswordSecretKeyRef | object | `{}` | Set mongodb password from existing secret |
| global.mongodbProtocol | string | `"mongodb"` | Set mongodb protocol (`mongodb` / `mongodb+srv`) |
| global.mongodbUser | string | `"user"` | Set mongodb user in plain text |
| global.mongodbUserSecretKeyRef | object | `{}` | Set mongodb user from existing secret |
| global.newrelicLicenseKey | string | `""` | New Relic Key |
| global.nodeSelector | object | `{}` | Global nodeSelector constraints Apply nodeSelector to all Codefresh subcharts. Will not be applied on Bitnami subcharts. |
| global.platformAnalyticsPort | int | `80` | Default platform-analytics service port. |
| global.platformAnalyticsService | string | `"platform-analytics"` | Default platform-analytics service name. |
| global.postgresDatabase | string | `"codefresh"` | Set postgres database name |
| global.postgresHostname | string | `"postgresql"` | Set postgres service address in plain text. Takes precedence over `global.postgresService`! |
| global.postgresHostnameSecretKeyRef | object | `{}` | Set postgres service from existing secret |
| global.postgresPassword | string | `"postgres"` | Set postgres password in plain text |
| global.postgresPasswordSecretKeyRef | object | `{}` | Set postgres password from existing secret |
| global.postgresPort | int | `5432` | Set postgres port number |
| global.postgresService | string | `"postgresql"` | Default internal postgresql service address from bitnami/postgresql subchart |
| global.postgresUser | string | `"postgres"` | Set postgres user in plain text |
| global.postgresUserSecretKeyRef | object | `{}` | Set postgres user from existing secret |
| global.rabbitService | string | `"rabbitmq:5672"` | Default internal rabbitmq service address from bitnami/rabbitmq subchart. |
| global.rabbitmqHostname | string | `"rabbitmq:5672"` | Set rabbitmq service address in plain text. Takes precedence over `global.rabbitService`! |
| global.rabbitmqHostnameSecretKeyRef | object | `{}` | Set rabbitmq service address from existing secret. |
| global.rabbitmqPassword | string | `"rabbitmq"` | Set rabbitmq password in plain text |
| global.rabbitmqPasswordSecretKeyRef | object | `{}` | Set rabbitmq password from existing secret |
| global.rabbitmqProtocol | string | `"amqp"` | Set rabbitmq protocol (`amqp/amqps`) |
| global.rabbitmqUsername | string | `"user"` | Set rabbitmq username in plain text |
| global.rabbitmqUsernameSecretKeyRef | object | `{}` | Set rabbitmq username from existing secret |
| global.redisPassword | string | `"redis"` | Set redis password in plain text |
| global.redisPasswordSecretKeyRef | object | `{}` | Set redis password from existing secret |
| global.redisPort | int | `6379` | Set redis service port |
| global.redisService | string | `"redis-master"` | Default internal redis service address from bitnami/redis subchart |
| global.redisUrl | string | `"redis-master"` | Set redis hostname in plain text. Takes precedence over `global.redisService`! |
| global.redisUrlSecretKeyRef | object | `{}` | Set redis hostname from existing secret. |
| global.security | object | `{"allowInsecureImages":true}` | Bitnami |
| global.storageClass | string | `""` | Global StorageClass for Persistent Volume(s) |
| global.tolerations | list | `[]` | Global tolerations constraints Apply toleratons to all Codefresh subcharts. Will not be applied on Bitnami subcharts. |
| hooks | object | See below | Pre/post-upgrade Job hooks. |
| hooks.mongodb | object | `{"affinity":{},"enabled":true,"image":{"registry":"us-docker.pkg.dev/codefresh-inc/public-gcr-io","repository":"codefresh/mongosh","tag":"2.5.0"},"nodeSelector":{},"podSecurityContext":{},"resources":{},"tolerations":[]}` | Sets feature compatibility version |
| imageCredentials | object | `{}` | Credentials for Image Pull Secret object |
| ingress | object | `{"annotations":{"nginx.ingress.kubernetes.io/service-upstream":"true","nginx.ingress.kubernetes.io/ssl-redirect":"false","nginx.org/redirect-to-https":"false"},"enabled":true,"ingressClassName":"","labels":{},"nameOverride":"","services":{"internal-gateway":["/"]},"tls":{"cert":"","enabled":false,"existingSecret":"","key":"","secretName":"star.codefresh.io"}}` | Ingress |
| ingress.annotations | object | See below | Set annotations for ingress. |
| ingress.enabled | bool | `true` | Enable the Ingress |
| ingress.ingressClassName | string | `""` | Set the ingressClass that is used for the ingress. Default `nginx-codefresh` is created from `ingress-nginx` controller subchart |
| ingress.labels | object | `{}` | Set labels for ingress |
| ingress.nameOverride | string | `""` | Override Ingress resource name |
| ingress.services | object | See below | Default services and corresponding paths |
| ingress.tls.cert | string | `""` | Certificate (base64 encoded) |
| ingress.tls.enabled | bool | `false` | Enable TLS |
| ingress.tls.existingSecret | string | `""` | Existing `kubernetes.io/tls` type secret with TLS certificates (keys: `tls.crt`, `tls.key`) |
| ingress.tls.key | string | `""` | Private key (base64 encoded) |
| ingress.tls.secretName | string | `"star.codefresh.io"` | Default secret name to be created with provided `cert` and `key` below |
| internal-gateway | object | See below | internal-gateway |
| mongodb | object | See below | mongodb Ref: https://github.com/bitnami/charts/blob/main/bitnami/mongodb/values.yaml |
| postgresql | object | See below | postgresql Ref: https://github.com/bitnami/charts/blob/main/bitnami/postgresql/values.yaml |
| rabbitmq | object | See below | rabbitmq Ref: https://github.com/bitnami/charts/blob/main/bitnami/rabbitmq/values.yaml |
| redis | object | See below | redis Ref: https://github.com/bitnami/charts/blob/main/bitnami/redis/values.yaml |
| runtime-environment-manager | object | See below | runtime-environment-manager |
| seed | object | See below | Seed jobs |
| seed.enabled | bool | `true` | Enable all seed jobs |
| seed.mongoSeedJob | object | See below | Mongo Seed Job. Required at first install. Seeds the required data (default idp/user/account), creates cfuser and required databases. |
| seed.mongoSeedJob.mongodbRootPassword | string | `"password"` | Root password in plain text (required ONLY for seed job!). |
| seed.mongoSeedJob.mongodbRootPasswordSecretKeyRef | object | `{}` | Root password from existing secret |
| seed.mongoSeedJob.mongodbRootUser | string | `"root"` | Root user in plain text (required ONLY for seed job!). |
| seed.mongoSeedJob.mongodbRootUserSecretKeyRef | object | `{}` | Root user from existing secret |
| seed.postgresSeedJob | object | See below | Postgres Seed Job. Required at first install. Creates required user and databases. |
| seed.postgresSeedJob.postgresPassword | optional | `""` | Password for "postgres" admin user (required ONLY for seed job!) |
| seed.postgresSeedJob.postgresPasswordSecretKeyRef | optional | `{}` | Password for "postgres" admin user from existing secret |
| seed.postgresSeedJob.postgresUser | optional | `""` | "postgres" admin user in plain text (required ONLY for seed job!) Must be a privileged user allowed to create databases and grant roles. If omitted, username and password from `.Values.global.postgresUser/postgresPassword` will be used. |
| seed.postgresSeedJob.postgresUserSecretKeyRef | optional | `{}` | "postgres" admin user from exising secret |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
