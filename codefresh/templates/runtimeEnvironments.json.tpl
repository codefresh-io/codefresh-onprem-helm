{{- define "runtime-environment-config" -}}
[
  {
    "metadata": {
      "name": "system/default"
    },
    "description": "System default template for plan",
    "environmentCertPath": "/etc/ssl/cf/",
    "dockerDaemonScheduler": {
      "type": "ConsulNodes",
      "cluster": {
        "name": "codefresh",
        "type": "builder",
        "returnRunnerIfNoBuilder": true
      },
      "notCheckServerCa": true,
      "clientCertPath": "/etc/ssl/cf/"
    },
    "runtimeScheduler": {
      "type": "KubernetesPod",
      "workflowLimits": {
        "MAXIMUM_ALLOWED_WORKFLOW_AGE_BEFORE_TERMINATION": "86400"
      },
      {{- if .Values.global.privateRegistry }}
      "imagePullSecrets": "{{ .Release.Name }}-{{ .Values.global.codefresh }}-registry",
      {{- end }}
      "internalInfra": true,
      "cluster": {
        "inCluster": true,
        "namespace": "{{ .Release.Namespace }}"
      },
      "image": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.ENGINE_IMAGE) }}",
      "command": [
        "yarn",
        "run",
        "start"
      ],
      "envVars": {
        {{- if .Values.global.env }}
        {{- range $key, $value := .Values.global.env }}
        {{ $key | quote }}: {{ $value | quote }},
        {{- end}}
        {{- end}}
        "RESOURCE_LIMITATIONS_JSON": "/etc/admin/resource-limitations.json",
        {{- if .Values.global.exposeRegistry }}
        "RUNTIME_INTERNAL_REGISTRY_JSON": "",
        "CF_REGISTRY_DOMAIN": "{{ .Values.global.appUrl }}",
        "CF_REGISTRY_USER": "onprem",
        "CF_REGISTRY_TOKEN": "onprem",
        {{- else }}
        "RUNTIME_INTERNAL_REGISTRY_JSON": "/etc/admin/internal-registry.json",
        {{- end }}
        "RUNTIME_ADDITIONAL_INTERNAL_REGISTRIES_JSON": "/etc/admin/additional-internal-registries.json",
        "LOGGER_LEVEL": "debug",
        "NODE_ENV": "kubernetes",
        "DOCKER_PUSHER_IMAGE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.DOCKER_PUSHER_IMAGE) }}",
        "DOCKER_PULLER_IMAGE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.DOCKER_PULLER_IMAGE) }}",
        "DOCKER_BUILDER_IMAGE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.DOCKER_BUILDER_IMAGE) }}",
        "CONTAINER_LOGGER_IMAGE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.CONTAINER_LOGGER_IMAGE) }}",
        "GIT_CLONE_IMAGE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.GIT_CLONE_IMAGE) }}",
        "DOCKER_TAG_PUSHER_IMAGE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.DOCKER_TAG_PUSHER_IMAGE) }}",
        "FS_OPS_IMAGE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.FS_OPS_IMAGE) }}",
        "COMPOSE_IMAGE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.COMPOSE_IMAGE) }}",
        "KUBE_DEPLOY": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.KUBE_DEPLOY) }}",
        "TEMPLATE_ENGINE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.TEMPLATE_ENGINE) }}",
        "PIPELINE_DEBUGGER_IMAGE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.PIPELINE_DEBUGGER_IMAGE) }}",
        "NODE_TLS_REJECT_UNAUTHORIZED": "0"
      },
      "volumeMounts": {
        "internal-registry": {
          "name": "internal-registry",
          "mountPath": "/etc/admin/internal-registry.json",
          "subPath": "internal-registry.json",
          "readOnly": true
        },
        "additional-internal-registries": {
          "name": "additional-internal-registries",
          "mountPath": "/etc/admin/additional-internal-registries.json",
          "subPath": "additional-internal-registries.json",
          "readOnly": true
        },
        "resource-limitations": {
          "name": "resource-limitations",
          "mountPath": "/etc/admin/resource-limitations.json",
          "subPath": "resource-limitations.json",
          "readOnly": true
        },
        "cf-certs": {
          "name": "cf-certs",
          "mountPath": "/etc/ssl/cf",
          "readOnly": true
        }
      },
      "volumes": {
        "internal-registry": {
          "name": "internal-registry",
          "configMap": {
            "name": "cf-codefresh-registry"
          }
        },
        "additional-internal-registries": {
          "name": "additional-internal-registries",
          "configMap": {
            "name": "cf-codefresh-registry"
          }
        },
        "resource-limitations": {
          "name": "resource-limitations",
          "configMap": {
            "name": "cf-codefresh-resource-limitations"
          }
        },
        "cf-certs": {
          "name": "cf-certs",
          "secret": {
            "secretName": "cf-codefresh-certs-client"
          }
        }
      }
    },
    "isPublic": true
  },
  {
      "metadata": {
          "name": "system/default/hybrid/k8s",
          "agent": false
      },
      "description": "System hybrid runtime environment for kubernetes",
      "runtimeScheduler": {
          "image": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.ENGINE_IMAGE) }}",
          "command": [
              "npm",
              "run",
              "start"
          ],
          "envVars": {
              "CONTAINER_LOGGER_SHOW_PROGRESS": "true",
              "CONTAINER_LOGGER_EXEC_TIMEOUT": "1800000",
              "LOGGER_LEVEL": "debug",
              "NODE_ENV": "kubernetes",
              "METRICS_CODEFRESH_ENABLED": "true",
              "DOCKER_PUSHER_IMAGE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.DOCKER_PUSHER_IMAGE) }}",
              "DOCKER_PULLER_IMAGE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.DOCKER_PULLER_IMAGE) }}",
              "DOCKER_BUILDER_IMAGE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.DOCKER_BUILDER_IMAGE) }}",
              "CONTAINER_LOGGER_IMAGE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.CONTAINER_LOGGER_IMAGE) }}",
              "GIT_CLONE_IMAGE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.GIT_CLONE_IMAGE) }}",
              "DOCKER_TAG_PUSHER_IMAGE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.DOCKER_TAG_PUSHER_IMAGE) }}",
              "FS_OPS_IMAGE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.FS_OPS_IMAGE) }}",
              "COMPOSE_IMAGE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.COMPOSE_IMAGE) }}",
              "KUBE_DEPLOY": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.KUBE_DEPLOY) }}",
              "TEMPLATE_ENGINE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.TEMPLATE_ENGINE) }}",
              "PIPELINE_DEBUGGER_IMAGE": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.PIPELINE_DEBUGGER_IMAGE) }}",
              "NO_EXT_MONITOR": "true",
              "DISABLE_WORKSPACE_CACHE": "true",
              "NODE_TLS_REJECT_UNAUTHORIZED": "0",
              "RETRY_HTTP_COUNT": "15"
          },
          "workflowLimits": {
              "MAXIMUM_ALLOWED_WORKFLOW_AGE_BEFORE_TERMINATION": 86400,
              "SHOULD_CLEAN_PVCS": false,
              "SHOULD_KEEP_PVC_FOR_PENDING_APPROVAL": false,
              "TIME_INACTIVE_UNTIL_TERMINATION": 2700,
              "MAXIMUM_ELECTED_STATE_AGE_ALLOWED": 900
          },
          "type": "KubernetesPod",
          "cluster": {
              "namespace": "{{ .Release.Namespace }}"
          },
          "resources": {
              "requests": {
                  "cpu": "100m",
                  "memory": "100Mi"
              },
              "limits": {
                  "cpu": "1000m",
                  "memory": "2048Mi"
              }
          },
          "volumeMounts": {},
          "volumes": {}
      },
      "dockerDaemonScheduler": {
          "internalInfra": false,
          "userAccess": true,
          "type": "DindKubernetesPod",
          "cluster": {
              "namespace": "{{ .Release.Namespace }}"
          },
          "dindImage": "{{ include "buildImageName" (dict "registry" .Values.global.dockerRegistry "imageFullName" .Values.DIND_IMAGE) }}",
          "defaultDindResources": {
              "requests": {
                  "cpu": "390m",
                  "memory": "255Mi"
              },
              "limits": {
                  "cpu": "2500m",
                  "memory": "4096Mi"
              }
          },
          "envVars": {
              "CLEAN_DOCKER": "true",
              "CLEAN_PERIOD_BUILDS": "5",
              "IMAGE_RETAIN_PERIOD": "14400",
              "VOLUMES_RETAIN_PERIOD": "14400"
          },
          "terminationGracePeriodSeconds": 300,
          "volumeMounts": {
              "codefresh-certs-server": {
                  "name": "codefresh-certs-server",
                  "mountPath": "/etc/ssl/cf",
                  "readOnly": true
              },
              "dind-config": {
                  "name": "dind-config",
                  "mountPath": "/etc/docker/daemon.json",
                  "subPath": "daemon.json",
                  "readOnly": true
              }
          },
          "volumes": {
              "codefresh-certs-server": {
                  "name": "codefresh-certs-server",
                  "secret": {
                      "secretName": "codefresh-certs-server"
                  }
              },
              "dind-config": {
                  "name": "dind-config",
                  "configMap": {
                      "name": "codefresh-dind-config"
                  }
              }
          },
          "pvcs": {
              "dind": {
                  "name": "dind",
                  "volumeSize": "15Gi",
                  "reuseVolumeSelector": "codefresh-app,io.codefresh.accountName",
                  "storageClassName": ""
              }
          },
          "tolerations": {
              "dind": {
                  "key": "codefresh/dind",
                  "operator": "Exists",
                  "effect": "NoSchedule"
              }
          }
      },
      "isPublic": true,
      "nonComplete": true
  },
  {
      "metadata": {
          "name": "system/default/hybrid/k8s_low_limits",
          "agent": false
      },
      "description": "Runtime that has lower dind values for newly created runtimes",
      "extends": [
          "system/default/hybrid/k8s"
      ],
      "dockerDaemonScheduler": {
          "defaultDindResources": {
              "requests": {
                  "cpu": "400m",
                  "memory": "800Mi"
              },
              "limits": {
                  "cpu": "400m",
                  "memory": "800Mi"
              }
          }
      },
      "isPublic": true,
      "nonComplete": false
  }
]
{{- end -}}
