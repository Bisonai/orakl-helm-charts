{{/*
Expand the name of the chart.
*/}}

{{- define "orakl-request-response.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "orakl-request-response.fullname" -}}
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
{{- define "orakl-request-response.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "orakl-request-response.labels" -}}
helm.sh/chart: {{ include "orakl-request-response.chart" . }}
{{ include "orakl-request-response.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "orakl-request-response.selectorLabels" -}}
app.kubernetes.io/name: {{ include "orakl-request-response.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels for core
*/}}
{{- define "orakl-request-response.labels.core" -}}
helm.sh/chart: {{ include "orakl-request-response.chart" . }}
{{ include "orakl-request-response.selectorLabels.core" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for core
*/}}
{{- define "orakl-request-response.selectorLabels.core" -}}
app.kubernetes.io/name: {{ include "orakl-request-response.name" . }}-core
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}