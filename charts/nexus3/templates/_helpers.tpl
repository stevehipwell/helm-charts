{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "nexus3.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "nexus3.fullname" -}}
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
{{- define "nexus3.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "nexus3.labels" -}}
helm.sh/chart: {{ include "nexus3.chart" . }}
{{ include "nexus3.selectorLabels" . }}
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
{{- define "nexus3.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nexus3.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: repository
{{- end }}

{{/*
Create an image
*/}}
{{- define "nexus3.image" -}}
{{- $tag := ternary (printf ":%s" .tag) "" (ne .tag "-") }}
{{- $digest := ternary (printf "@%s" .digest) "" (not (empty .digest)) }}
{{- printf "%s%s%s" .repository $tag $digest }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "nexus3.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "nexus3.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Define the Service name
*/}}
{{- define "nexus3.serviceName" -}}
{{- include "nexus3.fullname" . }}
{{- end }}

{{/*
Define the headless Service name
*/}}
{{- define "nexus3.headlessServiceName" -}}
{{- printf "%s-hl" ((include "nexus3.serviceName" .) | trunc 60 | trimSuffix "-") }}
{{- end }}

{{/*
Define the config scripts ConfigMap name
*/}}
{{- define "nexus3.configScriptsConfigMapName" -}}
{{- printf "%s-conf-scripts" ((include "nexus3.fullname" .) | trunc 50 | trimSuffix "-") }}
{{- end }}

{{/*
Define the config ConfigMap name
*/}}
{{- define "nexus3.configConfigMapName" -}}
{{- printf "%s-conf" ((include "nexus3.fullname" .) | trunc 58 | trimSuffix "-") }}
{{- end }}

{{/*
Define the Logback ConfigMap name
*/}}
{{- define "nexus3.logbackConfigMapName" -}}
{{- printf "%s-logback" ((include "nexus3.fullname" .) | trunc 55 | trimSuffix "-") }}
{{- end }}

{{/*
Define the properties ConfigMap name
*/}}
{{- define "nexus3.propertiesConfigMapName" -}}
{{- printf "%s-props" ((include "nexus3.fullname" .) | trunc 57 | trimSuffix "-") }}
{{- end }}

{{/*
Define the scripts ConfigMap name
*/}}
{{- define "nexus3.scriptsConfigMapName" -}}
{{- printf "%s-scripts" ((include "nexus3.fullname" .) | trunc 55 | trimSuffix "-") }}
{{- end }}

{{/*
Define pvc name.
*/}}
{{- define "nexus3.pvcName" -}}
{{- printf "%s-data" ((include "nexus3.fullname" .) | trunc 58 | trimSuffix "-") }}
{{- end -}}

{{/*
Patch the label selector on an object
*/}}
{{- define "nexus3.patchLabelSelector" -}}
{{- if not (hasKey ._target "labelSelector") }}
{{- $selectorLabels := (include "nexus3.selectorLabels" .) | fromYaml }}
{{- $_ := set ._target "labelSelector" (dict "matchLabels" $selectorLabels) }}
{{- end }}
{{- end }}

{{/*
Patch pod affinity
*/}}
{{- define "nexus3.patchPodAffinity" -}}
{{- if (hasKey ._podAffinity "requiredDuringSchedulingIgnoredDuringExecution") }}
{{- range $term := ._podAffinity.requiredDuringSchedulingIgnoredDuringExecution }}
{{- include "nexus3.patchLabelSelector" (merge (dict "_target" $term) $) }}
{{- end }}
{{- end }}
{{- if (hasKey ._podAffinity "preferredDuringSchedulingIgnoredDuringExecution") }}
{{- range $weightedTerm := ._podAffinity.preferredDuringSchedulingIgnoredDuringExecution }}
{{- include "nexus3.patchLabelSelector" (merge (dict "_target" $weightedTerm.podAffinityTerm) $) }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Patch affinity
*/}}
{{- define "nexus3.patchAffinity" -}}
{{- $podAffinity := dig "podAffinity" nil .Values.affinity }}
{{- $podAntiAffinity := dig "podAntiAffinity" nil .Values.affinity }}
{{- if $podAffinity }}
{{- include "nexus3.patchPodAffinity" (merge (dict "_podAffinity" $podAffinity) .) }}
{{- end }}
{{- if $podAntiAffinity }}
{{- include "nexus3.patchPodAffinity" (merge (dict "_podAffinity" $podAntiAffinity) .) }}
{{- end }}
{{- end }}

{{/*
Patch topology spread constraints
*/}}
{{- define "nexus3.patchTopologySpreadConstraints" -}}
{{- range $constraint := .Values.topologySpreadConstraints }}
{{- include "nexus3.patchLabelSelector" (merge (dict "_target" $constraint) $) }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "nexus3.configJob.labels" -}}
helm.sh/chart: {{ include "nexus3.chart" . }}
{{ include "nexus3.configJob.selectorLabels" . }}
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
{{- define "nexus3.configJob.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nexus3.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: config-job
{{- end }}

{{/*
Define config Job name.
*/}}
{{- define "nexus3.configJob.name" -}}
{{- printf "%s-config-%s" ((include "nexus3.fullname" .) | trunc 52 | trimSuffix "-") (toString .Release.Revision) }}
{{- end -}}
