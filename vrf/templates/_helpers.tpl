{{/*
Expand the name of the chart.
*/}}
{{- define "orakl-vrf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "orakl-vrf.fullname" -}}
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
{{- define "orakl-vrf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "orakl-vrf.labels" -}}
helm.sh/chart: {{ include "orakl-vrf.chart" . }}
{{ include "orakl-vrf.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "orakl-vrf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "orakl-vrf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels for listener
*/}}
{{- define "orakl-vrf.labels.listener" -}}
helm.sh/chart: {{ include "orakl-vrf.chart" . }}
{{ include "orakl-vrf.selectorLabels.listener" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for listener
*/}}
{{- define "orakl-vrf.selectorLabels.listener" -}}
app.kubernetes.io/name: {{ include "orakl-vrf.name" . }}-listener
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels for worker
*/}}
{{- define "orakl-vrf.labels.worker" -}}
helm.sh/chart: {{ include "orakl-vrf.chart" . }}
{{ include "orakl-vrf.selectorLabels.worker" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for worker
*/}}
{{- define "orakl-vrf.selectorLabels.worker" -}}
app.kubernetes.io/name: {{ include "orakl-vrf.name" . }}-worker
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels for reporter
*/}}
{{- define "orakl-vrf.labels.reporter" -}}
helm.sh/chart: {{ include "orakl-vrf.chart" . }}
{{ include "orakl-vrf.selectorLabels.reporter" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for reporter
*/}}
{{- define "orakl-vrf.selectorLabels.reporter" -}}
app.kubernetes.io/name: {{ include "orakl-vrf.name" . }}-reporter
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}