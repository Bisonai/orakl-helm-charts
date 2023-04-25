{{/*
Expand the name of the chart.
*/}}
{{- define "klaytn.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "klaytn.fullname" -}}
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
{{- define "klaytn.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "klaytn.labels" -}}
helm.sh/chart: {{ include "klaytn.chart" . }}
{{ include "klaytn.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "klaytn.selectorLabels" -}}
app.kubernetes.io/name: {{ include "klaytn.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "klaytn.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "klaytn.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "klaytn.network" -}}
{{- .Values.node.network }}
{{- end }}

{{- define "klaytn.rpc.enable" -}}
{{- .Values.node.rpc.enable }}
{{- end }}

{{- define "klaytn.rpc.port" -}}
{{- default 8551 .Values.node.rpc.port }}
{{- end }}

{{- define "klaytn.ws.enable" -}}
{{- .Values.node.ws.enable }}
{{- end }}

{{- define "klaytn.ws.port" -}}
{{- default 8552 .Values.node.ws.port }}
{{- end }}

{{- define "klaytn.cloud" -}}
{{- default "aws" .Values.cloud }}
{{- end }}

{{- define "klaytn.chain" -}}
{{- default "klaytn" .Values.chain }}
{{- end }}