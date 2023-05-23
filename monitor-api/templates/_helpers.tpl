{{/*
Expand the name of the chart.
*/}}
{{- define "orakl-monitor-api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "orakl-monitor-api.fullname" -}}
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
{{- define "orakl-monitor-api.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "orakl-monitor-api.labels" -}}
helm.sh/chart: {{ include "orakl-monitor-api.chart" . }}
{{ include "orakl-monitor-api.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "orakl-monitor-api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "orakl-monitor-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels for api
*/}}
{{- define "orakl-monitor-api.labels.monitor-api" -}}
helm.sh/chart: {{ include "orakl-monitor-api.chart" . }}
{{ include "orakl-monitor-api.selectorLabels.monitor-api" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for api
*/}}
{{- define "orakl-monitor-api.selectorLabels.monitor-api" -}}
app.kubernetes.io/name: {{ include "orakl-monitor-api.name" . }}-monitor-api
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}