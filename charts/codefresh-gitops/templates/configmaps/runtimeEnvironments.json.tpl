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
      "internalInfra": true,
      "cluster": {
        "inCluster": true,
        "namespace": "{{ .Release.Namespace }}"
      },
      "image": "us-docker.pkg.dev/codefresh-inc/public-gcr-io/codefresh/engine:latest",
      "command": [
        "npm",
        "run",
        "start"
      ],
      "envVars": {
      },
      "volumeMounts": {},
      "volumes": {}
    },
    "isPublic": true
  }
]
{{- end -}}
