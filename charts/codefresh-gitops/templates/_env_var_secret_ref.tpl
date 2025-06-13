{{- /*
MONGODB_HOST env var value
*/}}
{{- define "codefresh-gitops.mongodb-host-env-var-value" }}
  {{- if .Values.global.mongodbHostSecretKeyRef }}
valueFrom:
  secretKeyRef:
    {{- .Values.global.mongodbHostSecretKeyRef | toYaml | nindent 4 }}
  {{- else if .Values.global.mongodbHost }}
valueFrom:
  secretKeyRef:
    name: {{ include "codefresh-gitops.fullname" . }}
    key: MONGODB_HOST
    optional: true
  {{- end }}
{{- end }}

{{- /*
MONGODB_USER env var value
*/}}
{{- define "codefresh-gitops.mongodb-user-env-var-value" }}
  {{- if .Values.global.mongodbUserSecretKeyRef }}
valueFrom:
  secretKeyRef:
    {{- .Values.global.mongodbUserSecretKeyRef | toYaml | nindent 4 }}
  {{- else if .Values.global.mongodbUser }}
valueFrom:
  secretKeyRef:
    name: {{ include "codefresh-gitops.fullname" . }}
    key: MONGODB_USER
    optional: true
  {{- end }}
{{- end }}

{{- /*
MONGODB_PASSWORD env var value
*/}}
{{- define "codefresh-gitops.mongodb-password-env-var-value" }}
  {{- if .Values.global.mongodbPasswordSecretKeyRef }}
valueFrom:
  secretKeyRef:
    {{- .Values.global.mongodbPasswordSecretKeyRef | toYaml | nindent 4 }}
  {{- else if .Values.global.mongodbPassword }}
valueFrom:
  secretKeyRef:
    name: {{ include "codefresh-gitops.fullname" . }}
    key: MONGODB_PASSWORD
    optional: true
  {{- end }}
{{- end }}

{{- /*
MONGO_URI env var value
*/}}
{{- define "codefresh-gitops.mongo-uri-env-var-value" }}
{{- /*
Check for legacy global.mongoURI
*/}}
  {{- if .Values.global.mongoURI }}
value: "$(MONGO_URI)"
{{- /*
New secret implementation
*/}}
  {{- else }}
value: "$(MONGODB_PROTOCOL)://$(MONGODB_USER):$(MONGODB_PASSWORD)@$(MONGODB_HOST)/$(MONGODB_DATABASE)?$(MONGODB_OPTIONS)"
  {{- end }}
{{- end }}

{{- /*
MONGO_SEED_URI env var value
*/}}
{{- define "codefresh-gitops.mongo-seed-uri-env-var-value" }}
{{- /*
Check for legacy global.mongoURI
*/}}
  {{- if .Values.global.mongoURI }}
value: "$(MONGO_URI)"
{{- /*
New secret implementation
*/}}
  {{- else }}
value: "$(MONGODB_PROTOCOL)://$(MONGODB_USER):$(MONGODB_PASSWORD)@$(MONGODB_HOST)/?$(MONGODB_OPTIONS)"
  {{- end }}
{{- end }}

{{- /*
MONGODB_ROOT_USER env var value
*/}}
{{- define "codefresh-gitops.mongodb-root-user-env-var-value" }}
  {{- if or .Values.seed.mongoSeedJob.mongodbRootUserSecretKeyRef .Values.global.mongodbRootUserSecretKeyRef }}
valueFrom:
  secretKeyRef:
    {{- coalesce .Values.seed.mongoSeedJob.mongodbRootUserSecretKeyRef .Values.global.mongodbRootUserSecretKeyRef | toYaml | nindent 4 }}
  {{- else if or .Values.global.mongodbRootUser .Values.seed.mongoSeedJob.mongodbRootUser }}
valueFrom:
  secretKeyRef:
    name: {{ include "codefresh-gitops.fullname" . }}
    key: MONGODB_ROOT_USER
    optional: true
  {{- end }}
{{- end }}

{{- /*
MONGODB_ROOT_PASSWORD env var value
*/}}
{{- define "codefresh-gitops.mongodb-root-password-env-var-value" }}
  {{- if or .Values.seed.mongoSeedJob.mongodbRootPasswordSecretKeyRef .Values.global.mongodbRootPasswordSecretKeyRef }}
valueFrom:
  secretKeyRef:
    {{- coalesce .Values.seed.mongoSeedJob.mongodbRootPasswordSecretKeyRef .Values.global.mongodbRootPasswordSecretKeyRef | toYaml | nindent 4 }}
  {{- else if or .Values.global.mongodbRootPassword .Values.seed.mongoSeedJob.mongodbRootPassword }}
valueFrom:
  secretKeyRef:
    name: {{ include "codefresh-gitops.fullname" . }}
    key: MONGODB_ROOT_PASSWORD
    optional: true
  {{- end }}
{{- end }}

{{- /*
MONGO_URI_RE_MANAGER env var value
*/}}
{{- define "codefresh-gitops.mongo-uri-re-manager-env-var-value" }}
{{- /*
Check for legacy global.mongoURI
*/}}
  {{- if .Values.global.mongoURI }}
value: "$(MONGO_URI_RE_MANAGER)"
{{- /*
New secret implementation
*/}}
  {{- else }}
value: "$(MONGODB_PROTOCOL)://$(MONGODB_USER):$(MONGODB_PASSWORD)@$(MONGODB_HOST)/$(MONGODB_RE_DATABASE)?$(MONGODB_OPTIONS)"
  {{- end }}
{{- end }}

{{- /*
POSTGRES_USER env var value
*/}}
{{- define "codefresh-gitops.postgres-user-env-var-value" }}
  {{- if .Values.global.postgresUserSecretKeyRef }}
valueFrom:
  secretKeyRef:
    {{- .Values.global.postgresUserSecretKeyRef | toYaml | nindent 4 }}
  {{- else if .Values.global.postgresUser }}
valueFrom:
  secretKeyRef:
    name: {{ include "codefresh-gitops.fullname" . }}
    key: POSTGRES_USER
    optional: true
  {{- end }}
{{- end }}

{{- /*
POSTGRES_PASSWORD env var value
*/}}
{{- define "codefresh-gitops.postgres-password-env-var-value" }}
  {{- if .Values.global.postgresPasswordSecretKeyRef }}
valueFrom:
  secretKeyRef:
    {{- .Values.global.postgresPasswordSecretKeyRef | toYaml | nindent 4 }}
  {{- else if .Values.global.postgresPassword }}
valueFrom:
  secretKeyRef:
    name: {{ include "codefresh-gitops.fullname" . }}
    key: POSTGRES_PASSWORD
    optional: true
  {{- end }}
{{- end }}

{{- /*
POSTGRES_HOSTNAME env var value
*/}}
{{- define "codefresh-gitops.postgres-host-env-var-value" }}
  {{- if .Values.global.postgresHostnameSecretKeyRef }}
valueFrom:
  secretKeyRef:
    {{- .Values.global.postgresHostnameSecretKeyRef | toYaml | nindent 4 }}
  {{- else if .Values.global.postgresPassword }}
valueFrom:
  secretKeyRef:
    name: {{ include "codefresh-gitops.fullname" . }}
    key: POSTGRES_HOSTNAME
    optional: true
  {{- end }}
{{- end }}

{{- /*
POSTGRES_SEED_USER env var value
*/}}
{{- define "codefresh-gitops.postgres-seed-user-env-var-value" }}
  {{- if and .Values.seed.postgresSeedJob.postgresUserSecretKeyRef  }}
valueFrom:
  secretKeyRef:
    {{- .Values.seed.postgresSeedJob.postgresUserSecretKeyRef | toYaml | nindent 4 }}
  {{- else if or .Values.seed.postgresSeedJob.postgresUser .Values.global.postgresUser }}
valueFrom:
  secretKeyRef:
    name: {{ include "codefresh-gitops.fullname" . }}
    key: POSTGRES_SEED_USER
    optional: true
  {{- end }}
{{- end }}

{{- /*
POSTGRES_SEED_PASSWORD env var value
*/}}
{{- define "codefresh-gitops.postgres-seed-password-env-var-value" }}
  {{- if and .Values.seed.postgresSeedJob.postgresPasswordSecretKeyRef }}
valueFrom:
  secretKeyRef:
    {{- coalesce .Values.seed.postgresSeedJob.postgresPasswordSecretKeyRef | toYaml | nindent 4 }}
  {{- else if or .Values.seed.postgresSeedJob.postgresPassword .Values.global.postgresPassword }}
valueFrom:
  secretKeyRef:
    name: {{ include "codefresh-gitops.fullname" . }}
    key: POSTGRES_SEED_PASSWORD
    optional: true
  {{- end }}
{{- end }}
