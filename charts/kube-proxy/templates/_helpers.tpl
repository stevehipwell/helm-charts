{{/*
Expand the name of the chart.
*/}}
{{- define "kube-proxy.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kube-proxy.fullname" -}}
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
{{- define "kube-proxy.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "kube-proxy.labels" -}}
helm.sh/chart: {{ include "kube-proxy.chart" . }}
{{ include "kube-proxy.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- with .Values.commonLabels }}
{{ toYaml . }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "kube-proxy.selectorLabels" -}}
{{- if .Values.selectorLabelsOverride -}}
{{ toYaml .Values.selectorLabelsOverride }}
{{- else -}}
app.kubernetes.io/name: {{ include "kube-proxy.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "kube-proxy.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "kube-proxy.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
The image to use
*/}}
{{- define "kube-proxy.image" -}}
{{- $tag := ternary (printf ":%s" .Values.image.tag) "" (not (empty .Values.image.tag)) }}
{{- $digest := ternary (printf "@%s" .Values.image.digest) "" (not (empty .Values.image.digest)) }}
{{- if and (empty $tag) (empty $digest) }}
{{- fail "At least one of image.tag or image.digest must be provided" }}
{{- end }}
{{- printf "%s%s%s" .Values.image.repository $tag $digest }}
{{- end }}
