{{/*
Expand the name of the chart.
*/}}
{{- define "orakl-delegator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "orakl-delegator.fullname" -}}
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
{{- define "orakl-delegator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "orakl-delegator.labels" -}}
helm.sh/chart: {{ include "orakl-delegator.chart" . }}
{{ include "orakl-delegator.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "orakl-delegator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "orakl-delegator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels for delegator
*/}}
{{- define "orakl-delegator.labels.delegator" -}}
helm.sh/chart: {{ include "orakl-delegator.chart" . }}
{{ include "orakl-delegator.selectorLabels.delegator" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for delegator
*/}}
{{- define "orakl-delegator.selectorLabels.delegator" -}}
app.kubernetes.io/name: {{ include "orakl-delegator.name" . }}-delegator
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}