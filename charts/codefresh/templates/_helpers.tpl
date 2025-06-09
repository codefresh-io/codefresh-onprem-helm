{{/*
Expand the name of the chart.
*/}}
{{- define "codefresh.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "codefresh.fullname" -}}
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
{{- define "codefresh.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "codefresh.labels" -}}
helm.sh/chart: {{ include "codefresh.chart" . }}
{{ include "codefresh.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "codefresh.selectorLabels" -}}
app.kubernetes.io/name: {{ include "codefresh.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Return runtime image (classic runtime) with private registry prefix
*/}}
{{- define "codefresh.buildImageName" -}}
  {{- if .registry -}}
    {{- $imageName :=  (trimPrefix "quay.io/" .imageFullName) -}}
    {{- printf "%s/%s" .registry $imageName -}}
  {{- else -}}
    {{- printf "%s" .imageFullName -}}
  {{- end -}}
{{- end -}}

{{/*
Return Image Pull Secret
*/}}
{{- define "codefresh.imagePullSecret" }}
{{- if index .Values ".dockerconfigjson" -}}
{{- printf "%s" (index .Values ".dockerconfigjson") }}
{{- else }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.imageCredentials.registry (printf "%s:%s" .Values.imageCredentials.username .Values.imageCredentials.password | b64enc) | b64enc }}
{{- end }}
{{- end }}

{{/*
Return the secret containing TLS certificates for Ingress
*/}}
{{- define "codefresh.ingress.tlsSecretName" -}}
{{- $secretName := .Values.ingress.tls.existingSecret -}}
{{- if $secretName -}}
    {{- printf "%s" (include (printf "cf-common-%s.tplrender" (index .Subcharts "cf-common").Chart.Version ) ( dict "Values" $secretName "context" $) ) -}}
{{- else -}}
    {{- printf "%s-%s" (include "codefresh.fullname" .) .Values.ingress.tls.secretName -}}
{{- end -}}
{{- end -}}

{{/*
Calculate Mongo Uri (for On-Prem)
Usage:
{{ include "codefresh.calculateMongoUri" (dict "dbName" .Values.path.to.the.value "mongoURI" .Values.path.to.the.value) }}
*/}}
{{- define "codefresh.calculateMongoUri" -}}
  {{- if contains "?" .mongoURI -}}
    {{- $mongoURI :=  (splitList "?" .mongoURI) -}}
    {{- printf "%s%s?%s" (first $mongoURI) .dbName (last $mongoURI) }}
  {{- else if .mongoURI -}}
    {{- printf "%s/%s" (trimSuffix "/" .mongoURI) .dbName -}}
  {{- else -}}
    {{- printf "" -}}
  {{- end -}}
{{- end -}}
