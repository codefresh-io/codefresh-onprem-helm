{{/*
Expand the name of the chart.
*/}}
{{- define "codefresh-gitops.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "codefresh-gitops.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "codefresh-gitops.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "codefresh-gitops.labels" -}}
helm.sh/chart: {{ include "codefresh-gitops.chart" . }}
{{ include "codefresh-gitops.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "codefresh-gitops.selectorLabels" -}}
app.kubernetes.io/name: {{ include "codefresh-gitops.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "codefresh-gitops.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "codefresh-gitops.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Return the secret containing TLS certificates for Ingress
*/}}
{{- define "codefresh-gitops.ingress.tlsSecretName" -}}
{{- $secretName := .Values.ingress.tls.existingSecret -}}
{{- if $secretName -}}
    {{- printf "%s" (include (printf "cf-common-%s.tplrender" (index .Subcharts "cf-common").Chart.Version ) ( dict "Values" $secretName "context" $) ) -}}
{{- else -}}
    {{- printf "%s-%s" (include "codefresh-gitops.fullname" .) .Values.ingress.tls.secretName -}}
{{- end -}}
{{- end -}}

{{/*
Return Image Pull Secret
*/}}
{{- define "codefresh-gitops.imagePullSecret" }}
{{- if index .Values ".dockerconfigjson" -}}
{{- printf "%s" (index .Values ".dockerconfigjson") }}
{{- else }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.imageCredentials.registry (printf "%s:%s" .Values.imageCredentials.username .Values.imageCredentials.password | b64enc) | b64enc }}
{{- end }}
{{- end }}

{{/*
Calculate Mongo Uri (for On-Prem)
Usage:
{{ include "codefresh.calculateMongoUri" (dict "dbName" .Values.path.to.the.value "mongoURI" .Values.path.to.the.value) }}
*/}}
{{- define "codefresh-gitops.calculateMongoUri" -}}
  {{- if contains "?" .mongoURI -}}
    {{- $mongoURI :=  (splitList "?" .mongoURI) -}}
    {{- printf "%s%s?%s" (first $mongoURI) .dbName (last $mongoURI) }}
  {{- else if .mongoURI -}}
    {{- printf "%s/%s" (trimSuffix "/" .mongoURI) .dbName -}}
  {{- else -}}
    {{- printf "" -}}
  {{- end -}}
{{- end -}}
