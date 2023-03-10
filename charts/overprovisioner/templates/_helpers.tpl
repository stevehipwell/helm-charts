{{/*
Expand the name of the chart.
*/}}
{{- define "overprovisioner.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "overprovisioner.fullname" -}}
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
{{- define "overprovisioner.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "overprovisioner.labels" -}}
helm.sh/chart: {{ include "overprovisioner.chart" . }}
{{ include "overprovisioner.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "overprovisioner.selectorLabels" -}}
app.kubernetes.io/name: {{ include "overprovisioner.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the priority class to use
*/}}
{{- define "overprovisioner.priorityClassName" -}}
{{- if .Values.priorityClass.create }}
{{- default (printf "%s-preemptible" (include "overprovisioner.fullname" .)) .Values.priorityClass.name }}
{{- else }}
{{- .Values.priorityClass.name }}
{{- end }}
{{- end }}

{{/*
Patch the label selector on an object
*/}}
{{- define "overprovisioner.patchLabelSelector" -}}
{{- if not (hasKey ._target "labelSelector") }}
{{- $selectorLabels := (include ._selectorLabelsTemplate .) | fromYaml }}
{{- $_ := set ._target "labelSelector" (dict "matchLabels" $selectorLabels) }}
{{- end }}
{{- end }}

{{/*
Patch pod affinity
*/}}
{{- define "overprovisioner.patchPodAffinity" -}}
{{- if (hasKey ._podAffinity "requiredDuringSchedulingIgnoredDuringExecution") }}
{{- range $term := ._podAffinity.requiredDuringSchedulingIgnoredDuringExecution }}
{{- include "overprovisioner.patchLabelSelector" (merge (dict "_target" $term) $) }}
{{- end }}
{{- end }}
{{- if (hasKey ._podAffinity "preferredDuringSchedulingIgnoredDuringExecution") }}
{{- range $weightedTerm := ._podAffinity.preferredDuringSchedulingIgnoredDuringExecution }}
{{- include "overprovisioner.patchLabelSelector" (merge (dict "_target" $weightedTerm.podAffinityTerm) $) }}
{{- end }}
{{- end }}
{{- end }}
