{{/*
Expand the name of the chart.
*/}}
{{- define "snapshot-controller.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "snapshot-controller.fullname" -}}
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
{{- define "snapshot-controller.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "snapshot-controller.labels" -}}
helm.sh/chart: {{ include "snapshot-controller.chart" . }}
{{ include "snapshot-controller.selectorLabels" . }}
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
{{- define "snapshot-controller.selectorLabels" -}}
app.kubernetes.io/name: {{ include "snapshot-controller.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "snapshot-controller.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "snapshot-controller.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Define the service name
*/}}
{{- define "snapshot-controller.serviceName" -}}
{{- include "snapshot-controller.fullname" . }}
{{- end }}

{{/*
The image to use
*/}}
{{- define "snapshot-controller.image" -}}
{{- $tag := ternary (printf ":%s" (default (printf "v%s" .Chart.AppVersion) .Values.image.tag)) "" (ne .Values.image.tag "-") }}
{{- $digest := ternary (printf "@%s" .Values.image.digest) "" (not (empty .Values.image.digest)) }}
{{- printf "%s%s%s" .Values.image.repository $tag $digest }}
{{- end }}



{{/*
Patch the label selector on an object
*/}}
{{- define "snapshot-controller.patchLabelSelector" -}}
{{- if not (hasKey ._target "labelSelector") }}
{{- $selectorLabels := (include "snapshot-controller.selectorLabels" .) | fromYaml }}
{{- $_ := set ._target "labelSelector" (dict "matchLabels" $selectorLabels) }}
{{- end }}
{{- end }}

{{/*
Patch pod affinity
*/}}
{{- define "snapshot-controller.patchPodAffinity" -}}
{{- if (hasKey ._podAffinity "requiredDuringSchedulingIgnoredDuringExecution") }}
{{- range $term := ._podAffinity.requiredDuringSchedulingIgnoredDuringExecution }}
{{- include "snapshot-controller.patchLabelSelector" (merge (dict "_target" $term) $) }}
{{- end }}
{{- end }}
{{- if (hasKey ._podAffinity "preferredDuringSchedulingIgnoredDuringExecution") }}
{{- range $weightedTerm := ._podAffinity.preferredDuringSchedulingIgnoredDuringExecution }}
{{- include "snapshot-controller.patchLabelSelector" (merge (dict "_target" $weightedTerm.podAffinityTerm) $) }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Patch affinity
*/}}
{{- define "snapshot-controller.patchAffinity" -}}
{{- if (hasKey .Values.affinity "podAffinity") }}
{{- include "snapshot-controller.patchPodAffinity" (merge (dict "_podAffinity" .Values.affinity.podAffinity) .) }}
{{- end }}
{{- if (hasKey .Values.affinity "podAntiAffinity") }}
{{- include "snapshot-controller.patchPodAffinity" (merge (dict "_podAffinity" .Values.affinity.podAntiAffinity) .) }}
{{- end }}
{{- end }}

{{/*
Patch topology spread constraints
*/}}
{{- define "snapshot-controller.patchTopologySpreadConstraints" -}}
{{- range $constraint := .Values.topologySpreadConstraints }}
{{- include "snapshot-controller.patchLabelSelector" (merge (dict "_target" $constraint) $) }}
{{- end }}
{{- end }}
