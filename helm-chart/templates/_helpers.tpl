{{/*
Expand the name of the chart.
*/}}
{{- define "prometheus-cups-exporter.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "prometheus-cups-exporter.fullname" -}}prometheus-cups-exporter{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "prometheus-cups-exporter.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "prometheus-cups-exporter.labels" -}}
helm.sh/chart: {{ include "prometheus-cups-exporter.chart" . }}
{{ include "prometheus-cups-exporter.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "prometheus-cups-exporter.selectorLabels" -}}
app.kubernetes.io/name: {{ include "prometheus-cups-exporter.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "prometheus-cups-exporter.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "prometheus-cups-exporter.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
