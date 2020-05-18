{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Calculates Existing pvc name
*/}}
{{- define "builder.existingPvc" -}}
{{- $existingPvc := coalesce .Values.existingPvc .Values.existingClaim .Values.pvcName .Values.varLibDockerVolume.existingPvc | default "" -}}
{{- printf "%s" $existingPvc -}}
{{- end -}}

{{/*
Calculates storage class name
*/}}
{{- define "builder.storageClass" -}}
{{- $storageClass := coalesce .Values.storageClass .Values.StorageClass .Values.varLibDockerVolume.storageClass .Values.global.storageClass | default "" -}}
{{- printf "%s" $storageClass -}}
{{- end -}}

{{/*
Calculates storage size
*/}}
{{- define "builder.storageSize" -}}
{{- $storageSize := coalesce .Values.storageSize .Values.varLibDockerVolume.storageSize .Values.varLibDockerVolume.size -}}
{{- printf "%s" $storageSize -}}
{{- end -}}

{{/*
Make consulHost connection URL
*/}}
{{- define "makeConsulService" }}
	{{- if .Values.global.consulHost }}
	{{- printf "http://%s:%v" .Values.global.consulHost .Values.global.consulHttpPort -}}
	{{- else }}
	{{- printf "http://%s-%s.%s.svc:%v" .Release.Name .Values.global.consulService .Release.Namespace .Values.global.consulHttpPort }}
	{{- end }}
{{- end }}
