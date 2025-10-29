# codefresh

![Version: 2.9.5](https://img.shields.io/badge/Version-2.9.5-informational?style=flat-square) ![AppVersion: 2.9.0](https://img.shields.io/badge/AppVersion-2.9.0-informational?style=flat-square)

Helm Chart for Codefresh On-Prem

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
| https://charts.bitnami.com/bitnami | consul | 11.4.32 |
| https://charts.bitnami.com/bitnami | mongodb | 15.6.26 |
| https://charts.bitnami.com/bitnami | nats | 9.0.28 |
| https://charts.bitnami.com/bitnami | postgresql | 16.7.15 |
| https://charts.bitnami.com/bitnami | rabbitmq | 15.5.3 |
| https://charts.bitnami.com/bitnami | redis | 20.13.4 |
| https://dandydeveloper.github.io/charts | redis-ha | 4.26.1 |
| https://kubernetes.github.io/ingress-nginx | ingress-nginx | 4.12.5 |
| oci://quay.io/codefresh/charts | argo-hub-platform | 0.1.27 |
| oci://quay.io/codefresh/charts | argo-platform | 1.3750.1-onprem-3c27f8e |
| oci://quay.io/codefresh/charts | builder | 2.0.0 |
| oci://quay.io/codefresh/charts | cf-broadcaster | 1.14.2-onprem-1a9194b |
| oci://quay.io/codefresh/charts | cf-common | 0.18.1 |
| oci://quay.io/codefresh/charts | cf-oidc-provider | 0.1.0 |
| oci://quay.io/codefresh/charts | cf-platform-analytics-etlstarter(cf-platform-analytics) | 0.51.2-onprem-9ebeb58 |
| oci://quay.io/codefresh/charts | cf-platform-analytics-platform(cf-platform-analytics) | 0.51.2-onprem-9ebeb58 |
| oci://quay.io/codefresh/charts | cfapi-admin(cfapi) | 21.291.20-2.9-onprem-583b039 |
| oci://quay.io/codefresh/charts | cfapi-sso-group-synchronizer(cfapi) | 21.291.20-2.9-onprem-583b039 |
| oci://quay.io/codefresh/charts | cfapi-test-reporting(cfapi) | 21.291.20-2.9-onprem-583b039 |
| oci://quay.io/codefresh/charts | cfapi-kubernetes-endpoints(cfapi) | 21.291.20-2.9-onprem-583b039 |
| oci://quay.io/codefresh/charts | cfapi(cfapi) | 21.291.20-2.9-onprem-583b039 |
| oci://quay.io/codefresh/charts | cfapi-auth(cfapi) | 21.291.20-2.9-onprem-583b039 |
| oci://quay.io/codefresh/charts | cfapi-internal(cfapi) | 21.291.20-2.9-onprem-583b039 |
| oci://quay.io/codefresh/charts | cfapi-ws(cfapi) | 21.291.20-2.9-onprem-583b039 |
| oci://quay.io/codefresh/charts | cfapi-teams(cfapi) | 21.291.20-2.9-onprem-583b039 |
| oci://quay.io/codefresh/charts | cfapi-endpoints(cfapi) | 21.291.20-2.9-onprem-583b039 |
| oci://quay.io/codefresh/charts | cfapi-terminators(cfapi) | 21.291.20-2.9-onprem-583b039 |
| oci://quay.io/codefresh/charts | cfapi-downloadlogmanager(cfapi) | 21.291.20-2.9-onprem-583b039 |
| oci://quay.io/codefresh/charts | cfapi-buildmanager(cfapi) | 21.291.20-2.9-onprem-583b039 |
| oci://quay.io/codefresh/charts | cfapi-cacheevictmanager(cfapi) | 21.291.20-2.9-onprem-583b039 |
| oci://quay.io/codefresh/charts | cfapi-eventsmanagersubscriptions(cfapi) | 21.291.20-2.9-onprem-583b039 |
| oci://quay.io/codefresh/charts | cfapi-kubernetesresourcemonitor(cfapi) | 21.291.20-2.9-onprem-583b039 |
| oci://quay.io/codefresh/charts | cfapi-environments(cfapi) | 21.291.20-2.9-onprem-583b039 |
| oci://quay.io/codefresh/charts | cfapi-gitops-resource-receiver(cfapi) | 21.291.20-2.9-onprem-583b039 |
| oci://quay.io/codefresh/charts | cfsign | 1.8.11-onprem-1aece39 |
| oci://quay.io/codefresh/charts | cfui | 14.99.39 |
| oci://quay.io/codefresh/charts | charts-manager | 1.25.2-onprem-65c64d9 |
| oci://quay.io/codefresh/charts | cluster-providers | 1.18.2-onprem-8125523 |
| oci://quay.io/codefresh/charts | context-manager | 2.36.2-onprem-f58347f |
| oci://quay.io/codefresh/charts | cronus | 0.8.13 |
| oci://quay.io/codefresh/charts | gitops-dashboard-manager | 1.15.2-onprem-ce2f390 |
| oci://quay.io/codefresh/charts | helm-repo-manager | 0.23.0 |
| oci://quay.io/codefresh/charts | hermes | 0.21.22 |
| oci://quay.io/codefresh/charts | internal-gateway | 0.11.0 |
| oci://quay.io/codefresh/charts | k8s-monitor | 4.11.17-onprem-710fd12 |
| oci://quay.io/codefresh/charts | kube-integration | 1.32.2-onprem-b539a1d |
| oci://quay.io/codefresh/charts | mailer | * |
| oci://quay.io/codefresh/charts | nomios | 0.11.12 |
| oci://quay.io/codefresh/charts | payments | * |
| oci://quay.io/codefresh/charts | pipeline-manager | 3.141.2-onprem-7c354cc |
| oci://quay.io/codefresh/charts | postgresql-ha | 12.0.4 |
| oci://quay.io/codefresh/charts | runtime-environment-manager | 3.43.6-onprem-1c37f3d |
| oci://quay.io/codefresh/charts | salesforce-reporter | * |
| oci://quay.io/codefresh/charts | segment-reporter | * |
| oci://quay.io/codefresh/charts | tasker-kubernetes | 1.27.2-onprem-48f1754 |

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
| argo-platform.api-graphql.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/argo-platform-api-graphql"}` | Image |
| argo-platform.api-graphql.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry |
| argo-platform.api-graphql.image.repository | string | `"codefresh/argo-platform-api-graphql"` | Repository |
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
| builder | object | `{"affinity":{},"container":{"image":{"registry":"quay.io","repository":"codefresh/dind","tag":"28.3.3-3.0.2"}},"enabled":true,"imagePullSecrets":[],"initContainers":{"register":{"image":{"registry":"us-docker.pkg.dev/codefresh-inc/public-gcr-io","repository":"codefresh/curl","tag":"8.14.1"}}},"nodeSelector":{},"podSecurityContext":{},"resources":{},"tolerations":[]}` | builder |
| cf-broadcaster | object | See below | broadcaster |
| cf-oidc-provider | object | See below | cf-oidc-provider |
| cf-platform-analytics-etlstarter | object | See below | etl-starter |
| cf-platform-analytics-etlstarter.redis.enabled | bool | `false` | Disable redis subchart |
| cf-platform-analytics-etlstarter.system-etl-postgres | object | `{"container":{"env":{"BLUE_GREEN_ENABLED":true}},"controller":{"cronjob":{"ttlSecondsAfterFinished":300}},"enabled":true}` | Only postgres ETL should be running in onprem |
| cf-platform-analytics-platform | object | See below | platform-analytics |
| cfapi | object | `{"affinity":{},"container":{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}},"controller":{"replicas":2},"enabled":true,"hpa":{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70},"imagePullSecrets":[],"nodeSelector":{},"pdb":{"enabled":false,"minAvailable":"50%"},"podSecurityContext":{},"resources":{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}},"secrets":{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}},"tolerations":[]}` | cf-api |
| cfapi-internal.<<.affinity | object | `{}` | Affinity configuration |
| cfapi-internal.<<.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
| cfapi-internal.<<.container.env | object | See below | Env vars |
| cfapi-internal.<<.container.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}` | Image |
| cfapi-internal.<<.container.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry prefix |
| cfapi-internal.<<.container.image.repository | string | `"codefresh/cf-api"` | Repository |
| cfapi-internal.<<.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi-internal.<<.controller.replicas | int | `2` | Replicas number |
| cfapi-internal.<<.enabled | bool | `true` | Enable cf-api |
| cfapi-internal.<<.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi-internal.<<.hpa.enabled | bool | `false` | Enable HPA |
| cfapi-internal.<<.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi-internal.<<.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi-internal.<<.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi-internal.<<.imagePullSecrets | list | `[]` | Image pull secrets |
| cfapi-internal.<<.nodeSelector | object | `{}` | Node selector configuration |
| cfapi-internal.<<.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi-internal.<<.pdb.enabled | bool | `false` | Enable PDB |
| cfapi-internal.<<.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi-internal.<<.podSecurityContext | object | `{}` | Pod security context configuration |
| cfapi-internal.<<.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfapi-internal.<<.secrets | object | `{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}}` | Secrets configuration |
| cfapi-internal.<<.tolerations | list | `[]` | Tolerations configuration |
| cfapi-internal.enabled | bool | `false` |  |
| cfapi.affinity | object | `{}` | Affinity configuration |
| cfapi.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
| cfapi.container.env | object | See below | Env vars |
| cfapi.container.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}` | Image |
| cfapi.container.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry prefix |
| cfapi.container.image.repository | string | `"codefresh/cf-api"` | Repository |
| cfapi.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi.controller.replicas | int | `2` | Replicas number |
| cfapi.enabled | bool | `true` | Enable cf-api |
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
| cfapi.secrets | object | `{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}}` | Secrets configuration |
| cfapi.tolerations | list | `[]` | Tolerations configuration |
| cfsign | object | See below | tls-sign |
| cfui | object | See below | cf-ui |
| charts-manager | object | See below | charts-manager |
| ci.enabled | bool | `false` |  |
| cluster-providers | object | See below | cluster-providers |
| consul | object | See below | consul Ref: https://github.com/bitnami/charts/blob/main/bitnami/consul/values.yaml |
| context-manager | object | See below | context-manager |
| cronus | object | See below | cronus |
| dockerconfigjson | object | `{}` | DEPRECATED - Use `.imageCredentials` instead dockerconfig (for `kcfi` tool backward compatibility) for Image Pull Secret. Obtain GCR Service Account JSON (sa.json) at support@codefresh.io ```shell GCR_SA_KEY_B64=$(cat sa.json | base64) DOCKER_CFG_VAR=$(echo -n "_json_key:$(echo ${GCR_SA_KEY_B64} | base64 -d)" | base64 | tr -d '\n') ``` E.g.: dockerconfigjson:   auths:     gcr.io:       auth: <DOCKER_CFG_VAR> |
| gencerts | object | See below | Job to generate internal runtime secrets. Required at first install. |
| gitops-dashboard-manager | object | See below | gitops-dashboard-manager |
| global | object | See below | Global parameters |
| global.affinity | object | `{}` | Global affinity constraints Apply affinity to all Codefresh subcharts. Will not be applied on Bitnami subcharts. |
| global.appProtocol | string | `"https"` | Application protocol. |
| global.appUrl | string | `"onprem.codefresh.local"` | Application root url. Will be used in Ingress objects as hostname |
| global.auditPostgresSchemaName | string | `"public"` | Set postgres schema name for audit database in plain text. |
| global.broadcasterPort | int | `80` | Default broadcaster service port. |
| global.broadcasterService | string | `"cf-broadcaster"` | Default broadcaster service name. |
| global.builderService | string | `"builder"` | Default builder service name. |
| global.cfapiEndpointsService | string | `"cfapi"` | Default API endpoints service name |
| global.cfapiInternalPort | int | `3000` | Default API service port. |
| global.cfapiService | string | `"cfapi"` | Default API service name. |
| global.cfk8smonitorService | string | `"k8s-monitor"` | Default k8s-monitor service name. |
| global.chartsManagerPort | int | `9000` | Default chart-manager service port. |
| global.chartsManagerService | string | `"charts-manager"` | Default charts-manager service name. |
| global.clusterProvidersPort | int | `9000` | Default cluster-providers service port. |
| global.clusterProvidersService | string | `"cluster-providers"` | Default cluster-providers service name. |
| global.codefresh | string | `"codefresh"` | LEGACY - Keep as is! Used for subcharts to access external secrets and configmaps. |
| global.consulHttpPort | int | `8500` | Default Consul service port. |
| global.consulService | string | `"consul-headless"` | Default Consul service name. |
| global.contextManagerPort | int | `9000` | Default context-manager service port. |
| global.contextManagerService | string | `"context-manager"` | Default context-manager service name. |
| global.disablePostgresForEventbus | string | `"true"` | Disables saving events from eventbus into postgres. When it is set to “false” all events (workflows, jobs, user etc.) from eventbus are starting saving to postgres and following services (charts-manager, cluster-providers, context-manager, cfapi, cf-platform-analytics, gitops-dashboard-manager, pipeline-manager, kube-integration, tasker-kubernetes, runtime-environment-manager) start requiring postgres connection. |
| global.dnsService | string | `"kube-dns"` | Definitions for internal-gateway nginx resolver |
| global.env | object | `{}` | Global Env vars |
| global.firebaseSecret | string | `""` | Firebase Secret in plain text |
| global.firebaseSecretSecretKeyRef | object | `{}` | Firebase Secret from existing secret |
| global.firebaseUrl | string | `"https://codefresh-on-prem.firebaseio.com/on-prem"` | Firebase URL for logs streaming in plain text |
| global.firebaseUrlSecretKeyRef | object | `{}` | Firebase URL for logs streaming from existing secret |
| global.gitopsDashboardManagerDatabase | string | `"pipeline-manager"` | Default gitops-dashboarad-manager db collection. |
| global.gitopsDashboardManagerPort | int | `9000` | Default gitops-dashboarad-manager service port. |
| global.gitopsDashboardManagerService | string | `"gitops-dashboard-manager"` | Default gitops-dashboarad-manager service name. |
| global.helmRepoManagerService | string | `"helm-repo-manager"` | Default helm-repo-manager service name. |
| global.hermesService | string | `"hermes"` | Default hermes service name. |
| global.imagePullSecrets | list | `["codefresh-registry"]` | Global Docker registry secret names as array |
| global.imageRegistry | string | `""` | Global Docker image registry |
| global.kubeIntegrationPort | int | `9000` | Default kube-integration service port. |
| global.kubeIntegrationService | string | `"kube-integration"` | Default kube-integration service name. |
| global.mongoURI | string | `""` | LEGACY (but still supported) - Use `.global.mongodbProtocol` + `.global.mongodbUser/mongodbUserSecretKeyRef` + `.global.mongodbPassword/mongodbPasswordSecretKeyRef` + `.global.mongodbHost/mongodbHostSecretKeyRef` + `.global.mongodbOptions` instead Default MongoDB URI. Will be used by ALL services to communicate with MongoDB. Ref: https://www.mongodb.com/docs/manual/reference/connection-string/ Note! `defaultauthdb` is omitted on purpose (i.e. mongodb://.../[defaultauthdb]). |
| global.mongodbDatabase | string | `"codefresh"` | Default MongoDB database name. Don't change! |
| global.mongodbHost | string | `"cf-mongodb"` | Set mongodb host in plain text |
| global.mongodbHostSecretKeyRef | object | `{}` | Set mongodb host from existing secret |
| global.mongodbOptions | string | `"retryWrites=true"` | Set mongodb connection string options Ref: https://www.mongodb.com/docs/manual/reference/connection-string/#connection-string-options |
| global.mongodbPassword | string | `"mTiXcU2wafr9"` | Set mongodb password in plain text |
| global.mongodbPasswordSecretKeyRef | object | `{}` | Set mongodb password from existing secret |
| global.mongodbProtocol | string | `"mongodb"` | Set mongodb protocol (`mongodb` / `mongodb+srv`) |
| global.mongodbRootUser | string | `""` | DEPRECATED Use `.Values.seed.mongoSeedJob` instead. |
| global.mongodbUser | string | `"cfuser"` | Set mongodb user in plain text |
| global.mongodbUserSecretKeyRef | object | `{}` | Set mongodb user from existing secret |
| global.natsPort | int | `4222` | Default nats service port. |
| global.natsService | string | `"nats"` | Default nats service name. |
| global.newrelicLicenseKey | string | `""` | New Relic Key |
| global.nodeSelector | object | `{}` | Global nodeSelector constraints Apply nodeSelector to all Codefresh subcharts. Will not be applied on Bitnami subcharts. |
| global.oidcProviderClientId | string | `nil` | Default OIDC Provider service client ID in plain text. |
| global.oidcProviderClientSecret | string | `nil` | Default OIDC Provider service client secret in plain text. |
| global.oidcProviderPort | int | `443` | Default OIDC Provider service port. |
| global.oidcProviderProtocol | string | `"https"` | Default OIDC Provider service protocol. |
| global.oidcProviderService | string | `""` | Default OIDC Provider service name (Provider URL). |
| global.oidcProviderTokenEndpoint | string | `"/token"` | Default OIDC Provider service token endpoint. |
| global.pipelineManagerPort | int | `9000` | Default pipeline-manager service port. |
| global.pipelineManagerService | string | `"pipeline-manager"` | Default pipeline-manager service name. |
| global.platformAnalyticsPort | int | `80` | Default platform-analytics service port. |
| global.platformAnalyticsService | string | `"platform-analytics"` | Default platform-analytics service name. |
| global.postgresDatabase | string | `"codefresh"` | Set postgres database name |
| global.postgresHostname | string | `""` | Set postgres service address in plain text. Takes precedence over `global.postgresService`! |
| global.postgresHostnameSecretKeyRef | object | `{}` | Set postgres service from existing secret |
| global.postgresPassword | string | `"eC9arYka4ZbH"` | Set postgres password in plain text |
| global.postgresPasswordSecretKeyRef | object | `{}` | Set postgres password from existing secret |
| global.postgresPort | int | `5432` | Set postgres port number |
| global.postgresService | string | `"postgresql"` | Default internal postgresql service address from bitnami/postgresql subchart |
| global.postgresUser | string | `"postgres"` | Set postgres user in plain text |
| global.postgresUserSecretKeyRef | object | `{}` | Set postgres user from existing secret |
| global.rabbitService | string | `"rabbitmq:5672"` | Default internal rabbitmq service address from bitnami/rabbitmq subchart. |
| global.rabbitmqHostname | string | `""` | Set rabbitmq service address in plain text. Takes precedence over `global.rabbitService`! |
| global.rabbitmqHostnameSecretKeyRef | object | `{}` | Set rabbitmq service address from existing secret. |
| global.rabbitmqPassword | string | `"cVz9ZdJKYm7u"` | Set rabbitmq password in plain text |
| global.rabbitmqPasswordSecretKeyRef | object | `{}` | Set rabbitmq password from existing secret |
| global.rabbitmqProtocol | string | `"amqp"` | Set rabbitmq protocol (`amqp/amqps`) |
| global.rabbitmqUsername | string | `"user"` | Set rabbitmq username in plain text |
| global.rabbitmqUsernameSecretKeyRef | object | `{}` | Set rabbitmq username from existing secret |
| global.redisPassword | string | `"hoC9szf7NtrU"` | Set redis password in plain text |
| global.redisPasswordSecretKeyRef | object | `{}` | Set redis password from existing secret |
| global.redisPort | int | `6379` | Set redis service port |
| global.redisService | string | `"redis-master"` | Default internal redis service address from bitnami/redis subchart |
| global.redisUrl | string | `""` | Set redis hostname in plain text. Takes precedence over `global.redisService`! |
| global.redisUrlSecretKeyRef | object | `{}` | Set redis hostname from existing secret. |
| global.runtimeEnvironmentManagerPort | int | `80` | Default runtime-environment-manager service port. |
| global.runtimeEnvironmentManagerService | string | `"runtime-environment-manager"` | Default runtime-environment-manager service name. |
| global.security | object | `{"allowInsecureImages":true}` | Bitnami |
| global.storageClass | string | `""` | Global StorageClass for Persistent Volume(s) |
| global.tlsSignPort | int | `4999` | Default tls-sign service port. |
| global.tlsSignService | string | `"cfsign"` | Default tls-sign service name. |
| global.tolerations | list | `[]` | Global tolerations constraints Apply toleratons to all Codefresh subcharts. Will not be applied on Bitnami subcharts. |
| helm-repo-manager | object | See below | helm-repo-manager |
| hermes | object | See below | hermes |
| hooks | object | See below | Pre/post-upgrade Job hooks. |
| hooks.consul | object | `{"affinity":{},"enabled":true,"image":{"registry":"us-docker.pkg.dev/codefresh-inc/public-gcr-io","repository":"codefresh/kubectl","tag":"1.34.2"},"nodeSelector":{},"podSecurityContext":{},"resources":{},"tolerations":[]}` | Recreates `consul-headless` service due to duplicated ports in Service during the upgrade. |
| hooks.mongodb | object | `{"affinity":{},"enabled":true,"image":{"registry":"us-docker.pkg.dev/codefresh-inc/public-gcr-io","repository":"codefresh/mongosh","tag":"2.5.9-cf-2"},"nodeSelector":{"kubernetes.io/arch":"amd64"},"podSecurityContext":{},"resources":{},"tolerations":[]}` | Updates images in `system/default` runtime. |
| hooks.rabbitmq | object | `{"affinity":{},"enabled":true,"image":{"registry":"us-docker.pkg.dev/codefresh-inc/public-gcr-io","repository":"codefresh/rabbitmqadmin","tag":"2.8.0"},"nodeSelector":{"kubernetes.io/arch":"amd64"},"podSecurityContext":{},"resources":{},"tolerations":[]}` | Enable stable feature flags in RabbitMQ. |
| imageCredentials | object | `{}` | Credentials for Image Pull Secret object |
| ingress | object | `{"annotations":{"nginx.ingress.kubernetes.io/service-upstream":"true","nginx.ingress.kubernetes.io/ssl-redirect":"false","nginx.org/redirect-to-https":"false"},"enabled":true,"ingressClassName":"nginx-codefresh","labels":{},"nameOverride":"","services":{"internal-gateway":["/"]},"tls":{"cert":"","enabled":false,"existingSecret":"","key":"","secretName":"star.codefresh.io"}}` | Ingress |
| ingress-nginx | object | See below | ingress-nginx Ref: https://github.com/kubernetes/ingress-nginx/blob/main/charts/ingress-nginx/values.yaml |
| ingress.annotations | object | See below | Set annotations for ingress. |
| ingress.enabled | bool | `true` | Enable the Ingress |
| ingress.ingressClassName | string | `"nginx-codefresh"` | Set the ingressClass that is used for the ingress. Default `nginx-codefresh` is created from `ingress-nginx` controller subchart |
| ingress.labels | object | `{}` | Set labels for ingress |
| ingress.nameOverride | string | `""` | Override Ingress resource name |
| ingress.services | object | See below | Default services and corresponding paths |
| ingress.tls.cert | string | `""` | Certificate (base64 encoded) |
| ingress.tls.enabled | bool | `false` | Enable TLS |
| ingress.tls.existingSecret | string | `""` | Existing `kubernetes.io/tls` type secret with TLS certificates (keys: `tls.crt`, `tls.key`) |
| ingress.tls.key | string | `""` | Private key (base64 encoded) |
| ingress.tls.secretName | string | `"star.codefresh.io"` | Default secret name to be created with provided `cert` and `key` below |
| internal-gateway | object | See below | internal-gateway |
| k8s-monitor | object | See below | k8s-monitor |
| kube-integration | object | See below | kube-integration |
| mailer.enabled | bool | `false` |  |
| mongodb | object | See below | mongodb Ref: https://github.com/bitnami/charts/blob/main/bitnami/mongodb/values.yaml |
| nats | object | See below | nats Ref: https://github.com/bitnami/charts/blob/main/bitnami/nats/values.yaml |
| nomios | object | See below | nomios |
| payments.enabled | bool | `false` |  |
| pipeline-manager | object | See below | pipeline-manager |
| postgresql | object | See below | postgresql Ref: https://github.com/bitnami/charts/blob/main/bitnami/postgresql/values.yaml |
| postgresql-ha | object | See below | postgresql Ref: https://github.com/bitnami/charts/blob/main/bitnami/postgresql-ha/values.yaml |
| postgresqlCleanJob | object | See below | Maintenance postgresql clean job. Removes a certain number of the last records in the event store table. |
| rabbitmq | object | See below | rabbitmq Ref: https://github.com/bitnami/charts/blob/main/bitnami/rabbitmq/values.yaml |
| redis | object | See below | redis Ref: https://github.com/bitnami/charts/blob/main/bitnami/redis/values.yaml |
| redis-ha | object | `{"auth":true,"enabled":false,"haproxy":{"enabled":true,"resources":{"requests":{"cpu":"100m","memory":"128Mi"}}},"persistentVolume":{"enabled":true,"size":"10Gi"},"redis":{"resources":{"requests":{"cpu":"100m","memory":"128Mi"}}},"redisPassword":"hoC9szf7NtrU"}` | redis-ha # Ref: https://github.com/DandyDeveloper/charts/blob/master/charts/redis-ha/values.yaml |
| runtime-environment-manager | object | See below | runtime-environment-manager |
| runtimeImages | object | See below | runtimeImages |
| salesforce-reporter.enabled | bool | `false` |  |
| seed | object | See below | Seed jobs |
| seed-e2e | object | `{"affinity":{},"backoffLimit":10,"enabled":false,"image":{"registry":"docker.io","repository":"mongo","tag":"latest"},"nodeSelector":{},"podSecurityContext":{},"resources":{},"tolerations":[],"ttlSecondsAfterFinished":300}` | CI |
| seed.enabled | bool | `true` | Enable all seed jobs |
| seed.mongoSeedJob | object | See below | Mongo Seed Job. Required at first install. Seeds the required data (default idp/user/account), creates cfuser and required databases. |
| seed.mongoSeedJob.env | object | `{}` | Extra env variables for seed job. |
| seed.mongoSeedJob.mongodbRootOptions | string | `""` | Extra options for connection string (e.g. `authSource=admin`). |
| seed.mongoSeedJob.mongodbRootPassword | string | `"XT9nmM8dZD"` | Root password in plain text (required ONLY for seed job!). |
| seed.mongoSeedJob.mongodbRootPasswordSecretKeyRef | object | `{}` | Root password from existing secret |
| seed.mongoSeedJob.mongodbRootUser | string | `"root"` | Root user in plain text (required ONLY for seed job!). |
| seed.mongoSeedJob.mongodbRootUserSecretKeyRef | object | `{}` | Root user from existing secret |
| seed.postgresSeedJob | object | See below | Postgres Seed Job. Required at first install. Creates required user and databases. |
| seed.postgresSeedJob.postgresPassword | optional | `""` | Password for "postgres" admin user (required ONLY for seed job!) |
| seed.postgresSeedJob.postgresPasswordSecretKeyRef | optional | `{}` | Password for "postgres" admin user from existing secret |
| seed.postgresSeedJob.postgresUser | optional | `""` | "postgres" admin user in plain text (required ONLY for seed job!) Must be a privileged user allowed to create databases and grant roles. If omitted, username and password from `.Values.global.postgresUser/postgresPassword` will be used. |
| seed.postgresSeedJob.postgresUserSecretKeyRef | optional | `{}` | "postgres" admin user from exising secret |
| segment-reporter.enabled | bool | `false` |  |
| tasker-kubernetes | object | `{"affinity":{},"container":{"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/tasker-kubernetes"}},"enabled":true,"hpa":{"enabled":false},"imagePullSecrets":[],"nodeSelector":{},"pdb":{"enabled":false},"podSecurityContext":{},"resources":{"limits":{},"requests":{"cpu":"100m","memory":"128Mi"}},"tolerations":[]}` | tasker-kubernetes |
| webTLS | object | `{"cert":"","enabled":false,"key":"","secretName":"star.codefresh.io"}` | DEPRECATED - Use `.Values.ingress.tls` instead TLS secret for Ingress |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
