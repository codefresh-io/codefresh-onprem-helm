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
{{- define "mongodb.existingPvc" -}}
{{- $existingPvc := coalesce .Values.existingPvc .Values.existingClaim .Values.pvcName .Values.persistence.existingClaim | default "" -}}
{{- printf "%s" $existingPvc -}}
{{- end -}}

{{/*
Calculates pvcName
*/}}
{{- define "mongodb.pvcName" -}}
{{- $pvcName := include "mongodb.existingPvc" .  | default (include "fullname" . ) -}}
{{- printf "%s" $pvcName -}}
{{- end -}}

{{/*
Calculates storage class name
*/}}
{{- define "mongodb.storageClass" -}}
{{- $storageClass := coalesce .Values.storageClass .Values.StorageClass .Values.persistence.storageClass .Values.global.storageClass | default "" -}}
{{- printf "%s" $storageClass -}}
{{- end -}}

{{/*
Calculates storage size
*/}}

{{- define "mongodb.storageSize" -}}
{{- $storageSize := coalesce .Values.storageSize .Values.persistence.size -}}
{{- printf "%s" $storageSize -}}
{{- end -}}

