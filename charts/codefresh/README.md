# codefresh

![Version: 0.0.0](https://img.shields.io/badge/Version-0.0.0-informational?style=flat-square) ![AppVersion: 0.0.0](https://img.shields.io/badge/AppVersion-0.0.0-informational?style=flat-square)

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
| https://kubernetes.github.io/ingress-nginx | ingress-nginx | 4.14.3 |
| oci://quay.io/codefresh/charts | argo-hub-platform | 0.1.42 |
| oci://quay.io/codefresh/charts | argo-platform | 1.4119.0-onprem-502b2fe |
| oci://quay.io/codefresh/charts | builder | 2.0.0 |
| oci://quay.io/codefresh/charts | cf-broadcaster | 1.15.11 |
| oci://quay.io/codefresh/charts | cf-common | 0.18.1 |
| oci://quay.io/codefresh/charts | cf-oidc-provider | 0.1.0 |
| oci://quay.io/codefresh/charts | cf-platform-analytics-etlstarter(cf-platform-analytics) | 0.54.9 |
| oci://quay.io/codefresh/charts | cf-platform-analytics-platform(cf-platform-analytics) | 0.54.9 |
| oci://quay.io/codefresh/charts | cfapi-gitops-resource-receiver(cfapi) | 22.8.7-onprem-13bae1c |
| oci://quay.io/codefresh/charts | cfapi-kubernetes-endpoints(cfapi) | 22.8.7-onprem-13bae1c |
| oci://quay.io/codefresh/charts | cfapi-teams(cfapi) | 22.8.7-onprem-13bae1c |
| oci://quay.io/codefresh/charts | cfapi-endpoints(cfapi) | 22.8.7-onprem-13bae1c |
| oci://quay.io/codefresh/charts | cfapi(cfapi) | 22.8.7-onprem-13bae1c |
| oci://quay.io/codefresh/charts | cfapi-auth(cfapi) | 22.8.7-onprem-13bae1c |
| oci://quay.io/codefresh/charts | cfapi-internal(cfapi) | 22.8.7-onprem-13bae1c |
| oci://quay.io/codefresh/charts | cfapi-ws(cfapi) | 22.8.7-onprem-13bae1c |
| oci://quay.io/codefresh/charts | cfapi-admin(cfapi) | 22.8.7-onprem-13bae1c |
| oci://quay.io/codefresh/charts | cfapi-test-reporting(cfapi) | 22.8.7-onprem-13bae1c |
| oci://quay.io/codefresh/charts | cfapi-terminators(cfapi) | 22.8.7-onprem-13bae1c |
| oci://quay.io/codefresh/charts | cfapi-sso-group-synchronizer(cfapi) | 22.8.7-onprem-13bae1c |
| oci://quay.io/codefresh/charts | cfapi-buildmanager(cfapi) | 22.8.7-onprem-13bae1c |
| oci://quay.io/codefresh/charts | cfapi-cacheevictmanager(cfapi) | 22.8.7-onprem-13bae1c |
| oci://quay.io/codefresh/charts | cfapi-eventsmanagersubscriptions(cfapi) | 22.8.7-onprem-13bae1c |
| oci://quay.io/codefresh/charts | cfapi-downloadlogmanager(cfapi) | 22.8.7-onprem-13bae1c |
| oci://quay.io/codefresh/charts | cfapi-environments(cfapi) | 22.8.7-onprem-13bae1c |
| oci://quay.io/codefresh/charts | cfapi-kubernetesresourcemonitor(cfapi) | 22.8.7-onprem-13bae1c |
| oci://quay.io/codefresh/charts | cfsign | 1.8.22 |
| oci://quay.io/codefresh/charts | cfui | 14.100.20-onprem-f7d5126 |
| oci://quay.io/codefresh/charts | charts-manager | 1.28.6 |
| oci://quay.io/codefresh/charts | cluster-providers | 1.20.2 |
| oci://quay.io/codefresh/charts | context-manager | 2.41.8 |
| oci://quay.io/codefresh/charts | cronus | 0.9.5 |
| oci://quay.io/codefresh/charts | gitops-dashboard-manager | 1.16.13 |
| oci://quay.io/codefresh/charts | helm-repo-manager | 0.23.7 |
| oci://quay.io/codefresh/charts | hermes | 0.22.12 |
| oci://quay.io/codefresh/charts | internal-gateway | 0.12.3 |
| oci://quay.io/codefresh/charts | k8s-monitor | 4.12.2 |
| oci://quay.io/codefresh/charts | kube-integration | 2.1.4 |
| oci://quay.io/codefresh/charts | nomios | 0.12.3 |
| oci://quay.io/codefresh/charts | pipeline-manager | 4.2.5 |
| oci://quay.io/codefresh/charts | postgresql-ha | 12.0.4 |
| oci://quay.io/codefresh/charts | runtime-environment-manager | 4.1.6 |
| oci://quay.io/codefresh/charts | tasker-kubernetes | 1.29.2 |

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
| builder | object | `{"affinity":{},"container":{"image":{"registry":"quay.io","repository":"codefresh/dind","tag":"29.6.1-3.0.19"}},"enabled":true,"imagePullSecrets":[],"initContainers":{"register":{"image":{"registry":"us-docker.pkg.dev/codefresh-inc/public-gcr-io","repository":"codefresh/curl","tag":"8.20.0"}}},"nodeSelector":{},"podSecurityContext":{},"resources":{},"tolerations":[]}` | builder |
| cf-broadcaster | object | See below | broadcaster |
| cf-oidc-provider | object | See below | cf-oidc-provider |
| cf-platform-analytics-etlstarter | object | See below | etl-starter |
| cf-platform-analytics-etlstarter.redis.enabled | bool | `false` | Disable redis subchart |
| cf-platform-analytics-etlstarter.system-etl-postgres | object | `{"container":{"env":{"BLUE_GREEN_ENABLED":true}},"controller":{"cronjob":{"ttlSecondsAfterFinished":300}},"enabled":true}` | Only postgres ETL should be running in onprem |
| cf-platform-analytics-platform | object | See below | platform-analytics |
| cfapi | object | `{"affinity":{},"container":{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}},"controller":{"replicas":2},"enabled":true,"hpa":{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70},"imagePullSecrets":[],"nodeSelector":{},"pdb":{"enabled":false,"minAvailable":"50%"},"podSecurityContext":{},"resources":{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}},"secrets":{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}},"tolerations":[]}` | cf-api |
| cfapi-admin.<<.affinity | object | `{}` | Affinity configuration |
| cfapi-admin.<<.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
| cfapi-admin.<<.container.env | object | See below | Env vars |
| cfapi-admin.<<.container.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}` | Image |
| cfapi-admin.<<.container.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry prefix |
| cfapi-admin.<<.container.image.repository | string | `"codefresh/cf-api"` | Repository |
| cfapi-admin.<<.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi-admin.<<.controller.replicas | int | `2` | Replicas number |
| cfapi-admin.<<.enabled | bool | `true` | Enable cf-api |
| cfapi-admin.<<.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi-admin.<<.hpa.enabled | bool | `false` | Enable HPA |
| cfapi-admin.<<.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi-admin.<<.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi-admin.<<.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi-admin.<<.imagePullSecrets | list | `[]` | Image pull secrets |
| cfapi-admin.<<.nodeSelector | object | `{}` | Node selector configuration |
| cfapi-admin.<<.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi-admin.<<.pdb.enabled | bool | `false` | Enable PDB |
| cfapi-admin.<<.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi-admin.<<.podSecurityContext | object | `{}` | Pod security context configuration |
| cfapi-admin.<<.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfapi-admin.<<.secrets | object | `{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}}` | Secrets configuration |
| cfapi-admin.<<.tolerations | list | `[]` | Tolerations configuration |
| cfapi-admin.enabled | bool | `false` |  |
| cfapi-auth.<<.affinity | object | `{}` | Affinity configuration |
| cfapi-auth.<<.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
| cfapi-auth.<<.container.env | object | See below | Env vars |
| cfapi-auth.<<.container.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}` | Image |
| cfapi-auth.<<.container.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry prefix |
| cfapi-auth.<<.container.image.repository | string | `"codefresh/cf-api"` | Repository |
| cfapi-auth.<<.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi-auth.<<.controller.replicas | int | `2` | Replicas number |
| cfapi-auth.<<.enabled | bool | `true` | Enable cf-api |
| cfapi-auth.<<.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi-auth.<<.hpa.enabled | bool | `false` | Enable HPA |
| cfapi-auth.<<.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi-auth.<<.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi-auth.<<.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi-auth.<<.imagePullSecrets | list | `[]` | Image pull secrets |
| cfapi-auth.<<.nodeSelector | object | `{}` | Node selector configuration |
| cfapi-auth.<<.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi-auth.<<.pdb.enabled | bool | `false` | Enable PDB |
| cfapi-auth.<<.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi-auth.<<.podSecurityContext | object | `{}` | Pod security context configuration |
| cfapi-auth.<<.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfapi-auth.<<.secrets | object | `{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}}` | Secrets configuration |
| cfapi-auth.<<.tolerations | list | `[]` | Tolerations configuration |
| cfapi-auth.enabled | bool | `false` |  |
| cfapi-buildmanager.<<.affinity | object | `{}` | Affinity configuration |
| cfapi-buildmanager.<<.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
| cfapi-buildmanager.<<.container.env | object | See below | Env vars |
| cfapi-buildmanager.<<.container.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}` | Image |
| cfapi-buildmanager.<<.container.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry prefix |
| cfapi-buildmanager.<<.container.image.repository | string | `"codefresh/cf-api"` | Repository |
| cfapi-buildmanager.<<.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi-buildmanager.<<.controller.replicas | int | `2` | Replicas number |
| cfapi-buildmanager.<<.enabled | bool | `true` | Enable cf-api |
| cfapi-buildmanager.<<.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi-buildmanager.<<.hpa.enabled | bool | `false` | Enable HPA |
| cfapi-buildmanager.<<.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi-buildmanager.<<.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi-buildmanager.<<.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi-buildmanager.<<.imagePullSecrets | list | `[]` | Image pull secrets |
| cfapi-buildmanager.<<.nodeSelector | object | `{}` | Node selector configuration |
| cfapi-buildmanager.<<.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi-buildmanager.<<.pdb.enabled | bool | `false` | Enable PDB |
| cfapi-buildmanager.<<.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi-buildmanager.<<.podSecurityContext | object | `{}` | Pod security context configuration |
| cfapi-buildmanager.<<.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfapi-buildmanager.<<.secrets | object | `{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}}` | Secrets configuration |
| cfapi-buildmanager.<<.tolerations | list | `[]` | Tolerations configuration |
| cfapi-buildmanager.enabled | bool | `false` |  |
| cfapi-cacheevictmanager.<<.affinity | object | `{}` | Affinity configuration |
| cfapi-cacheevictmanager.<<.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
| cfapi-cacheevictmanager.<<.container.env | object | See below | Env vars |
| cfapi-cacheevictmanager.<<.container.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}` | Image |
| cfapi-cacheevictmanager.<<.container.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry prefix |
| cfapi-cacheevictmanager.<<.container.image.repository | string | `"codefresh/cf-api"` | Repository |
| cfapi-cacheevictmanager.<<.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi-cacheevictmanager.<<.controller.replicas | int | `2` | Replicas number |
| cfapi-cacheevictmanager.<<.enabled | bool | `true` | Enable cf-api |
| cfapi-cacheevictmanager.<<.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi-cacheevictmanager.<<.hpa.enabled | bool | `false` | Enable HPA |
| cfapi-cacheevictmanager.<<.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi-cacheevictmanager.<<.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi-cacheevictmanager.<<.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi-cacheevictmanager.<<.imagePullSecrets | list | `[]` | Image pull secrets |
| cfapi-cacheevictmanager.<<.nodeSelector | object | `{}` | Node selector configuration |
| cfapi-cacheevictmanager.<<.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi-cacheevictmanager.<<.pdb.enabled | bool | `false` | Enable PDB |
| cfapi-cacheevictmanager.<<.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi-cacheevictmanager.<<.podSecurityContext | object | `{}` | Pod security context configuration |
| cfapi-cacheevictmanager.<<.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfapi-cacheevictmanager.<<.secrets | object | `{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}}` | Secrets configuration |
| cfapi-cacheevictmanager.<<.tolerations | list | `[]` | Tolerations configuration |
| cfapi-cacheevictmanager.enabled | bool | `false` |  |
| cfapi-downloadlogmanager.<<.affinity | object | `{}` | Affinity configuration |
| cfapi-downloadlogmanager.<<.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
| cfapi-downloadlogmanager.<<.container.env | object | See below | Env vars |
| cfapi-downloadlogmanager.<<.container.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}` | Image |
| cfapi-downloadlogmanager.<<.container.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry prefix |
| cfapi-downloadlogmanager.<<.container.image.repository | string | `"codefresh/cf-api"` | Repository |
| cfapi-downloadlogmanager.<<.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi-downloadlogmanager.<<.controller.replicas | int | `2` | Replicas number |
| cfapi-downloadlogmanager.<<.enabled | bool | `true` | Enable cf-api |
| cfapi-downloadlogmanager.<<.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi-downloadlogmanager.<<.hpa.enabled | bool | `false` | Enable HPA |
| cfapi-downloadlogmanager.<<.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi-downloadlogmanager.<<.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi-downloadlogmanager.<<.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi-downloadlogmanager.<<.imagePullSecrets | list | `[]` | Image pull secrets |
| cfapi-downloadlogmanager.<<.nodeSelector | object | `{}` | Node selector configuration |
| cfapi-downloadlogmanager.<<.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi-downloadlogmanager.<<.pdb.enabled | bool | `false` | Enable PDB |
| cfapi-downloadlogmanager.<<.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi-downloadlogmanager.<<.podSecurityContext | object | `{}` | Pod security context configuration |
| cfapi-downloadlogmanager.<<.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfapi-downloadlogmanager.<<.secrets | object | `{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}}` | Secrets configuration |
| cfapi-downloadlogmanager.<<.tolerations | list | `[]` | Tolerations configuration |
| cfapi-downloadlogmanager.enabled | bool | `false` |  |
| cfapi-endpoints.<<.affinity | object | `{}` | Affinity configuration |
| cfapi-endpoints.<<.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
| cfapi-endpoints.<<.container.env | object | See below | Env vars |
| cfapi-endpoints.<<.container.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}` | Image |
| cfapi-endpoints.<<.container.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry prefix |
| cfapi-endpoints.<<.container.image.repository | string | `"codefresh/cf-api"` | Repository |
| cfapi-endpoints.<<.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi-endpoints.<<.controller.replicas | int | `2` | Replicas number |
| cfapi-endpoints.<<.enabled | bool | `true` | Enable cf-api |
| cfapi-endpoints.<<.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi-endpoints.<<.hpa.enabled | bool | `false` | Enable HPA |
| cfapi-endpoints.<<.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi-endpoints.<<.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi-endpoints.<<.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi-endpoints.<<.imagePullSecrets | list | `[]` | Image pull secrets |
| cfapi-endpoints.<<.nodeSelector | object | `{}` | Node selector configuration |
| cfapi-endpoints.<<.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi-endpoints.<<.pdb.enabled | bool | `false` | Enable PDB |
| cfapi-endpoints.<<.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi-endpoints.<<.podSecurityContext | object | `{}` | Pod security context configuration |
| cfapi-endpoints.<<.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfapi-endpoints.<<.secrets | object | `{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}}` | Secrets configuration |
| cfapi-endpoints.<<.tolerations | list | `[]` | Tolerations configuration |
| cfapi-endpoints.enabled | bool | `false` |  |
| cfapi-environments.<<.affinity | object | `{}` | Affinity configuration |
| cfapi-environments.<<.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
| cfapi-environments.<<.container.env | object | See below | Env vars |
| cfapi-environments.<<.container.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}` | Image |
| cfapi-environments.<<.container.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry prefix |
| cfapi-environments.<<.container.image.repository | string | `"codefresh/cf-api"` | Repository |
| cfapi-environments.<<.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi-environments.<<.controller.replicas | int | `2` | Replicas number |
| cfapi-environments.<<.enabled | bool | `true` | Enable cf-api |
| cfapi-environments.<<.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi-environments.<<.hpa.enabled | bool | `false` | Enable HPA |
| cfapi-environments.<<.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi-environments.<<.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi-environments.<<.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi-environments.<<.imagePullSecrets | list | `[]` | Image pull secrets |
| cfapi-environments.<<.nodeSelector | object | `{}` | Node selector configuration |
| cfapi-environments.<<.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi-environments.<<.pdb.enabled | bool | `false` | Enable PDB |
| cfapi-environments.<<.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi-environments.<<.podSecurityContext | object | `{}` | Pod security context configuration |
| cfapi-environments.<<.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfapi-environments.<<.secrets | object | `{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}}` | Secrets configuration |
| cfapi-environments.<<.tolerations | list | `[]` | Tolerations configuration |
| cfapi-environments.enabled | bool | `false` |  |
| cfapi-eventsmanagersubscriptions.<<.affinity | object | `{}` | Affinity configuration |
| cfapi-eventsmanagersubscriptions.<<.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
| cfapi-eventsmanagersubscriptions.<<.container.env | object | See below | Env vars |
| cfapi-eventsmanagersubscriptions.<<.container.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}` | Image |
| cfapi-eventsmanagersubscriptions.<<.container.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry prefix |
| cfapi-eventsmanagersubscriptions.<<.container.image.repository | string | `"codefresh/cf-api"` | Repository |
| cfapi-eventsmanagersubscriptions.<<.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi-eventsmanagersubscriptions.<<.controller.replicas | int | `2` | Replicas number |
| cfapi-eventsmanagersubscriptions.<<.enabled | bool | `true` | Enable cf-api |
| cfapi-eventsmanagersubscriptions.<<.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi-eventsmanagersubscriptions.<<.hpa.enabled | bool | `false` | Enable HPA |
| cfapi-eventsmanagersubscriptions.<<.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi-eventsmanagersubscriptions.<<.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi-eventsmanagersubscriptions.<<.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi-eventsmanagersubscriptions.<<.imagePullSecrets | list | `[]` | Image pull secrets |
| cfapi-eventsmanagersubscriptions.<<.nodeSelector | object | `{}` | Node selector configuration |
| cfapi-eventsmanagersubscriptions.<<.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi-eventsmanagersubscriptions.<<.pdb.enabled | bool | `false` | Enable PDB |
| cfapi-eventsmanagersubscriptions.<<.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi-eventsmanagersubscriptions.<<.podSecurityContext | object | `{}` | Pod security context configuration |
| cfapi-eventsmanagersubscriptions.<<.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfapi-eventsmanagersubscriptions.<<.secrets | object | `{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}}` | Secrets configuration |
| cfapi-eventsmanagersubscriptions.<<.tolerations | list | `[]` | Tolerations configuration |
| cfapi-eventsmanagersubscriptions.enabled | bool | `false` |  |
| cfapi-gitops-resource-receiver.<<.affinity | object | `{}` | Affinity configuration |
| cfapi-gitops-resource-receiver.<<.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
| cfapi-gitops-resource-receiver.<<.container.env | object | See below | Env vars |
| cfapi-gitops-resource-receiver.<<.container.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}` | Image |
| cfapi-gitops-resource-receiver.<<.container.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry prefix |
| cfapi-gitops-resource-receiver.<<.container.image.repository | string | `"codefresh/cf-api"` | Repository |
| cfapi-gitops-resource-receiver.<<.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi-gitops-resource-receiver.<<.controller.replicas | int | `2` | Replicas number |
| cfapi-gitops-resource-receiver.<<.enabled | bool | `true` | Enable cf-api |
| cfapi-gitops-resource-receiver.<<.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi-gitops-resource-receiver.<<.hpa.enabled | bool | `false` | Enable HPA |
| cfapi-gitops-resource-receiver.<<.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi-gitops-resource-receiver.<<.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi-gitops-resource-receiver.<<.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi-gitops-resource-receiver.<<.imagePullSecrets | list | `[]` | Image pull secrets |
| cfapi-gitops-resource-receiver.<<.nodeSelector | object | `{}` | Node selector configuration |
| cfapi-gitops-resource-receiver.<<.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi-gitops-resource-receiver.<<.pdb.enabled | bool | `false` | Enable PDB |
| cfapi-gitops-resource-receiver.<<.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi-gitops-resource-receiver.<<.podSecurityContext | object | `{}` | Pod security context configuration |
| cfapi-gitops-resource-receiver.<<.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfapi-gitops-resource-receiver.<<.secrets | object | `{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}}` | Secrets configuration |
| cfapi-gitops-resource-receiver.<<.tolerations | list | `[]` | Tolerations configuration |
| cfapi-gitops-resource-receiver.enabled | bool | `false` |  |
| cfapi-internal.<<.affinity | object | `{}` | Affinity configuration |
| cfapi-internal.<<.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
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
| cfapi-kubernetes-endpoints.<<.affinity | object | `{}` | Affinity configuration |
| cfapi-kubernetes-endpoints.<<.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
| cfapi-kubernetes-endpoints.<<.container.env | object | See below | Env vars |
| cfapi-kubernetes-endpoints.<<.container.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}` | Image |
| cfapi-kubernetes-endpoints.<<.container.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry prefix |
| cfapi-kubernetes-endpoints.<<.container.image.repository | string | `"codefresh/cf-api"` | Repository |
| cfapi-kubernetes-endpoints.<<.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi-kubernetes-endpoints.<<.controller.replicas | int | `2` | Replicas number |
| cfapi-kubernetes-endpoints.<<.enabled | bool | `true` | Enable cf-api |
| cfapi-kubernetes-endpoints.<<.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi-kubernetes-endpoints.<<.hpa.enabled | bool | `false` | Enable HPA |
| cfapi-kubernetes-endpoints.<<.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi-kubernetes-endpoints.<<.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi-kubernetes-endpoints.<<.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi-kubernetes-endpoints.<<.imagePullSecrets | list | `[]` | Image pull secrets |
| cfapi-kubernetes-endpoints.<<.nodeSelector | object | `{}` | Node selector configuration |
| cfapi-kubernetes-endpoints.<<.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi-kubernetes-endpoints.<<.pdb.enabled | bool | `false` | Enable PDB |
| cfapi-kubernetes-endpoints.<<.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi-kubernetes-endpoints.<<.podSecurityContext | object | `{}` | Pod security context configuration |
| cfapi-kubernetes-endpoints.<<.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfapi-kubernetes-endpoints.<<.secrets | object | `{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}}` | Secrets configuration |
| cfapi-kubernetes-endpoints.<<.tolerations | list | `[]` | Tolerations configuration |
| cfapi-kubernetes-endpoints.enabled | bool | `false` |  |
| cfapi-kubernetesresourcemonitor.<<.affinity | object | `{}` | Affinity configuration |
| cfapi-kubernetesresourcemonitor.<<.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
| cfapi-kubernetesresourcemonitor.<<.container.env | object | See below | Env vars |
| cfapi-kubernetesresourcemonitor.<<.container.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}` | Image |
| cfapi-kubernetesresourcemonitor.<<.container.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry prefix |
| cfapi-kubernetesresourcemonitor.<<.container.image.repository | string | `"codefresh/cf-api"` | Repository |
| cfapi-kubernetesresourcemonitor.<<.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi-kubernetesresourcemonitor.<<.controller.replicas | int | `2` | Replicas number |
| cfapi-kubernetesresourcemonitor.<<.enabled | bool | `true` | Enable cf-api |
| cfapi-kubernetesresourcemonitor.<<.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi-kubernetesresourcemonitor.<<.hpa.enabled | bool | `false` | Enable HPA |
| cfapi-kubernetesresourcemonitor.<<.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi-kubernetesresourcemonitor.<<.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi-kubernetesresourcemonitor.<<.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi-kubernetesresourcemonitor.<<.imagePullSecrets | list | `[]` | Image pull secrets |
| cfapi-kubernetesresourcemonitor.<<.nodeSelector | object | `{}` | Node selector configuration |
| cfapi-kubernetesresourcemonitor.<<.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi-kubernetesresourcemonitor.<<.pdb.enabled | bool | `false` | Enable PDB |
| cfapi-kubernetesresourcemonitor.<<.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi-kubernetesresourcemonitor.<<.podSecurityContext | object | `{}` | Pod security context configuration |
| cfapi-kubernetesresourcemonitor.<<.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfapi-kubernetesresourcemonitor.<<.secrets | object | `{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}}` | Secrets configuration |
| cfapi-kubernetesresourcemonitor.<<.tolerations | list | `[]` | Tolerations configuration |
| cfapi-kubernetesresourcemonitor.enabled | bool | `false` |  |
| cfapi-sso-group-synchronizer.<<.affinity | object | `{}` | Affinity configuration |
| cfapi-sso-group-synchronizer.<<.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
| cfapi-sso-group-synchronizer.<<.container.env | object | See below | Env vars |
| cfapi-sso-group-synchronizer.<<.container.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}` | Image |
| cfapi-sso-group-synchronizer.<<.container.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry prefix |
| cfapi-sso-group-synchronizer.<<.container.image.repository | string | `"codefresh/cf-api"` | Repository |
| cfapi-sso-group-synchronizer.<<.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi-sso-group-synchronizer.<<.controller.replicas | int | `2` | Replicas number |
| cfapi-sso-group-synchronizer.<<.enabled | bool | `true` | Enable cf-api |
| cfapi-sso-group-synchronizer.<<.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi-sso-group-synchronizer.<<.hpa.enabled | bool | `false` | Enable HPA |
| cfapi-sso-group-synchronizer.<<.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi-sso-group-synchronizer.<<.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi-sso-group-synchronizer.<<.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi-sso-group-synchronizer.<<.imagePullSecrets | list | `[]` | Image pull secrets |
| cfapi-sso-group-synchronizer.<<.nodeSelector | object | `{}` | Node selector configuration |
| cfapi-sso-group-synchronizer.<<.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi-sso-group-synchronizer.<<.pdb.enabled | bool | `false` | Enable PDB |
| cfapi-sso-group-synchronizer.<<.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi-sso-group-synchronizer.<<.podSecurityContext | object | `{}` | Pod security context configuration |
| cfapi-sso-group-synchronizer.<<.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfapi-sso-group-synchronizer.<<.secrets | object | `{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}}` | Secrets configuration |
| cfapi-sso-group-synchronizer.<<.tolerations | list | `[]` | Tolerations configuration |
| cfapi-sso-group-synchronizer.enabled | bool | `false` |  |
| cfapi-teams.<<.affinity | object | `{}` | Affinity configuration |
| cfapi-teams.<<.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
| cfapi-teams.<<.container.env | object | See below | Env vars |
| cfapi-teams.<<.container.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}` | Image |
| cfapi-teams.<<.container.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry prefix |
| cfapi-teams.<<.container.image.repository | string | `"codefresh/cf-api"` | Repository |
| cfapi-teams.<<.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi-teams.<<.controller.replicas | int | `2` | Replicas number |
| cfapi-teams.<<.enabled | bool | `true` | Enable cf-api |
| cfapi-teams.<<.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi-teams.<<.hpa.enabled | bool | `false` | Enable HPA |
| cfapi-teams.<<.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi-teams.<<.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi-teams.<<.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi-teams.<<.imagePullSecrets | list | `[]` | Image pull secrets |
| cfapi-teams.<<.nodeSelector | object | `{}` | Node selector configuration |
| cfapi-teams.<<.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi-teams.<<.pdb.enabled | bool | `false` | Enable PDB |
| cfapi-teams.<<.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi-teams.<<.podSecurityContext | object | `{}` | Pod security context configuration |
| cfapi-teams.<<.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfapi-teams.<<.secrets | object | `{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}}` | Secrets configuration |
| cfapi-teams.<<.tolerations | list | `[]` | Tolerations configuration |
| cfapi-teams.enabled | bool | `false` |  |
| cfapi-terminators.<<.affinity | object | `{}` | Affinity configuration |
| cfapi-terminators.<<.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
| cfapi-terminators.<<.container.env | object | See below | Env vars |
| cfapi-terminators.<<.container.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}` | Image |
| cfapi-terminators.<<.container.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry prefix |
| cfapi-terminators.<<.container.image.repository | string | `"codefresh/cf-api"` | Repository |
| cfapi-terminators.<<.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi-terminators.<<.controller.replicas | int | `2` | Replicas number |
| cfapi-terminators.<<.enabled | bool | `true` | Enable cf-api |
| cfapi-terminators.<<.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi-terminators.<<.hpa.enabled | bool | `false` | Enable HPA |
| cfapi-terminators.<<.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi-terminators.<<.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi-terminators.<<.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi-terminators.<<.imagePullSecrets | list | `[]` | Image pull secrets |
| cfapi-terminators.<<.nodeSelector | object | `{}` | Node selector configuration |
| cfapi-terminators.<<.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi-terminators.<<.pdb.enabled | bool | `false` | Enable PDB |
| cfapi-terminators.<<.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi-terminators.<<.podSecurityContext | object | `{}` | Pod security context configuration |
| cfapi-terminators.<<.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfapi-terminators.<<.secrets | object | `{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}}` | Secrets configuration |
| cfapi-terminators.<<.tolerations | list | `[]` | Tolerations configuration |
| cfapi-terminators.enabled | bool | `false` |  |
| cfapi-test-reporting.<<.affinity | object | `{}` | Affinity configuration |
| cfapi-test-reporting.<<.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
| cfapi-test-reporting.<<.container.env | object | See below | Env vars |
| cfapi-test-reporting.<<.container.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}` | Image |
| cfapi-test-reporting.<<.container.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry prefix |
| cfapi-test-reporting.<<.container.image.repository | string | `"codefresh/cf-api"` | Repository |
| cfapi-test-reporting.<<.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi-test-reporting.<<.controller.replicas | int | `2` | Replicas number |
| cfapi-test-reporting.<<.enabled | bool | `true` | Enable cf-api |
| cfapi-test-reporting.<<.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi-test-reporting.<<.hpa.enabled | bool | `false` | Enable HPA |
| cfapi-test-reporting.<<.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi-test-reporting.<<.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi-test-reporting.<<.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi-test-reporting.<<.imagePullSecrets | list | `[]` | Image pull secrets |
| cfapi-test-reporting.<<.nodeSelector | object | `{}` | Node selector configuration |
| cfapi-test-reporting.<<.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi-test-reporting.<<.pdb.enabled | bool | `false` | Enable PDB |
| cfapi-test-reporting.<<.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi-test-reporting.<<.podSecurityContext | object | `{}` | Pod security context configuration |
| cfapi-test-reporting.<<.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfapi-test-reporting.<<.secrets | object | `{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}}` | Secrets configuration |
| cfapi-test-reporting.<<.tolerations | list | `[]` | Tolerations configuration |
| cfapi-test-reporting.enabled | bool | `false` |  |
| cfapi-ws.<<.affinity | object | `{}` | Affinity configuration |
| cfapi-ws.<<.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
| cfapi-ws.<<.container.env | object | See below | Env vars |
| cfapi-ws.<<.container.image | object | `{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}` | Image |
| cfapi-ws.<<.container.image.registry | string | `"us-docker.pkg.dev/codefresh-enterprise/gcr.io"` | Registry prefix |
| cfapi-ws.<<.container.image.repository | string | `"codefresh/cf-api"` | Repository |
| cfapi-ws.<<.controller | object | `{"replicas":2}` | Controller configuration |
| cfapi-ws.<<.controller.replicas | int | `2` | Replicas number |
| cfapi-ws.<<.enabled | bool | `true` | Enable cf-api |
| cfapi-ws.<<.hpa | object | `{"enabled":false,"maxReplicas":10,"minReplicas":2,"targetCPUUtilizationPercentage":70}` | Autoscaler configuration |
| cfapi-ws.<<.hpa.enabled | bool | `false` | Enable HPA |
| cfapi-ws.<<.hpa.maxReplicas | int | `10` | Maximum number of replicas |
| cfapi-ws.<<.hpa.minReplicas | int | `2` | Minimum number of replicas |
| cfapi-ws.<<.hpa.targetCPUUtilizationPercentage | int | `70` | Average CPU utilization percentage |
| cfapi-ws.<<.imagePullSecrets | list | `[]` | Image pull secrets |
| cfapi-ws.<<.nodeSelector | object | `{}` | Node selector configuration |
| cfapi-ws.<<.pdb | object | `{"enabled":false,"minAvailable":"50%"}` | Pod disruption budget configuration |
| cfapi-ws.<<.pdb.enabled | bool | `false` | Enable PDB |
| cfapi-ws.<<.pdb.minAvailable | string | `"50%"` | Minimum number of replicas in percentage |
| cfapi-ws.<<.podSecurityContext | object | `{}` | Pod security context configuration |
| cfapi-ws.<<.resources | object | `{"limits":{},"requests":{"cpu":"200m","memory":"256Mi"}}` | Resource requests and limits |
| cfapi-ws.<<.secrets | object | `{"secret":{"enabled":true,"stringData":{"OIDC_PROVIDER_CLIENT_ID":"{{ .Values.global.oidcProviderClientId }}","OIDC_PROVIDER_CLIENT_SECRET":"{{ .Values.global.oidcProviderClientSecret }}"},"type":"Opaque"}}` | Secrets configuration |
| cfapi-ws.<<.tolerations | list | `[]` | Tolerations configuration |
| cfapi-ws.enabled | bool | `false` |  |
| cfapi.affinity | object | `{}` | Affinity configuration |
| cfapi.container | object | `{"env":{"AUDIT_AUTO_CREATE_DB":true,"DEFAULT_SYSTEM_TYPE":"PROJECT_ONE","GITHUB_API_PATH_PREFIX":"/api/v3","LOGGER_LEVEL":"debug","OIDC_PROVIDER_PORT":"{{ .Values.global.oidcProviderPort }}","OIDC_PROVIDER_PROTOCOL":"{{ .Values.global.oidcProviderProtocol }}","OIDC_PROVIDER_TOKEN_ENDPOINT":"{{ .Values.global.oidcProviderTokenEndpoint }}","OIDC_PROVIDER_URI":"{{ .Values.global.oidcProviderService }}","ON_PREMISE":true,"RUNTIME_MONGO_DB":"codefresh","RUNTIME_REDIS_DB":0,"TRUSTED_PROXY_COUNT":"2","WEBHOOK_BASE_URL":""},"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/cf-api"}}` | Container configuration |
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
| global.env | object | `{"MONGO_ENABLE_ZSTD_NETWORK_COMPRESSION":"true","NEW_RELIC_ENABLED":"false"}` | Global Env vars |
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
| hooks.consul | object | `{"affinity":{},"enabled":true,"image":{"registry":"us-docker.pkg.dev/codefresh-inc/public-gcr-io","repository":"codefresh/kubectl","tag":"1.35.5"},"nodeSelector":{},"podSecurityContext":{},"resources":{},"tolerations":[]}` | Recreates `consul-headless` service due to duplicated ports in Service during the upgrade. |
| hooks.mongodb | object | `{"affinity":{},"enabled":true,"image":{"registry":"us-docker.pkg.dev/codefresh-inc/public-gcr-io","repository":"codefresh/mongosh","tag":"2.8.3-cf-1"},"nodeSelector":{"kubernetes.io/arch":"amd64"},"podSecurityContext":{},"resources":{},"tolerations":[]}` | Updates images in `system/default` runtime. |
| hooks.rabbitmq | object | `{"affinity":{},"enabled":true,"image":{"registry":"us-docker.pkg.dev/codefresh-inc/public-gcr-io","repository":"codefresh/rabbitmqadmin","tag":"2.8.1-cf-2"},"nodeSelector":{"kubernetes.io/arch":"amd64"},"podSecurityContext":{},"resources":{},"tolerations":[]}` | Enable stable feature flags in RabbitMQ. |
| httpRoute | object | `{"annotations":{},"enabled":false,"hostnames":["{{ .Values.global.appUrl }}"],"labels":{},"parentRefs":[],"services":{"internal-gateway":["/"]}}` | HTTPRoute |
| httpRoute.annotations | object | `{}` | Set annotations for HTTPRoute. |
| httpRoute.enabled | bool | `false` | Enable the HTTPRoute |
| httpRoute.hostnames | list | `["{{ .Values.global.appUrl }}"]` | List of hostnames to be covered by this HTTPRoute ref: https://gateway-api.sigs.k8s.io/reference/api-spec/main/spec/#hostname |
| httpRoute.labels | object | `{}` | Set labels for HTTPRoute |
| httpRoute.parentRefs | list | `[]` | Required! List of parent Gateway references this HTTPRoute should attach to ref: https://gateway-api.sigs.k8s.io/reference/api-spec/main/spec/#parentreference E.g. parentRefs:   - name: traefik-gateway     namespace: traefik |
| httpRoute.services | object | `{"internal-gateway":["/"]}` | Default services and corresponding paths |
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
| mongodb | object | See below | mongodb Ref: https://github.com/bitnami/charts/blob/main/bitnami/mongodb/values.yaml |
| nats | object | See below | nats Ref: https://github.com/bitnami/charts/blob/main/bitnami/nats/values.yaml |
| nomios | object | See below | nomios |
| pipeline-manager | object | See below | pipeline-manager |
| postgresql | object | See below | postgresql Ref: https://github.com/bitnami/charts/blob/main/bitnami/postgresql/values.yaml |
| postgresql-ha | object | See below | postgresql Ref: https://github.com/bitnami/charts/blob/main/bitnami/postgresql-ha/values.yaml |
| postgresqlCleanJob | object | See below | Maintenance postgresql clean job. Removes a certain number of the last records in the event store table. |
| rabbitmq | object | See below | rabbitmq Ref: https://github.com/bitnami/charts/blob/main/bitnami/rabbitmq/values.yaml |
| redis | object | See below | redis Ref: https://github.com/bitnami/charts/blob/main/bitnami/redis/values.yaml |
| redis-ha | object | `{"auth":true,"enabled":false,"haproxy":{"enabled":true,"resources":{"requests":{"cpu":"100m","memory":"128Mi"}}},"persistentVolume":{"enabled":true,"size":"10Gi"},"redis":{"resources":{"requests":{"cpu":"100m","memory":"128Mi"}}},"redisPassword":"hoC9szf7NtrU"}` | redis-ha |
| runtime-environment-manager | object | See below | runtime-environment-manager |
| runtimeImages | object | See below | runtimeImages |
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
| seed.postgresSeedJob.postgresPassword | string | `""` | (optional) Password for "postgres" admin user (required ONLY for seed job!) |
| seed.postgresSeedJob.postgresPasswordSecretKeyRef | object | `{}` | (optional) Password for "postgres" admin user from existing secret |
| seed.postgresSeedJob.postgresUser | string | `""` | (optional) "postgres" admin user in plain text (required ONLY for seed job!) Must be a privileged user allowed to create databases and grant roles. If omitted, username and password from `.Values.global.postgresUser/postgresPassword` will be used. |
| seed.postgresSeedJob.postgresUserSecretKeyRef | object | `{}` | (optional) "postgres" admin user from exising secret |
| tasker-kubernetes | object | `{"affinity":{},"container":{"image":{"registry":"us-docker.pkg.dev/codefresh-enterprise/gcr.io","repository":"codefresh/tasker-kubernetes"}},"enabled":true,"hpa":{"enabled":false},"imagePullSecrets":[],"nodeSelector":{},"pdb":{"enabled":false},"podSecurityContext":{},"resources":{"limits":{},"requests":{"cpu":"100m","memory":"128Mi"}},"tolerations":[]}` | tasker-kubernetes |
| webTLS | object | `{"cert":"","enabled":false,"key":"","secretName":"star.codefresh.io"}` | DEPRECATED - Use `.Values.ingress.tls` instead TLS secret for Ingress |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.9.1](https://github.com/norwoodj/helm-docs/releases/v1.9.1)
