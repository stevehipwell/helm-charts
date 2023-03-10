{{/*
Expand the name of the chart.
*/}}
{{- define "plantuml.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "plantuml.fullname" -}}
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
{{- define "plantuml.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "plantuml.labels" -}}
helm.sh/chart: {{ include "plantuml.chart" . }}
{{ include "plantuml.selectorLabels" . }}
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
{{- define "plantuml.selectorLabels" -}}
app.kubernetes.io/name: {{ include "plantuml.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "plantuml.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "plantuml.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
The image to use
*/}}
{{- define "plantuml.image" -}}
{{- printf "%s:%s" .Values.image.repository (default (printf "jetty-v%s" .Chart.AppVersion) .Values.image.tag) }}
{{- end }}

{{/* Get HorizontalPodAutoscaler API Version */}}
{{- define "plantuml.hpa.apiVersion" -}}
  {{- if and (.Capabilities.APIVersions.Has "autoscaling/v2") (semverCompare ">= 1.23-0" .Capabilities.KubeVersion.Version) -}}
      {{- print "autoscaling/v2" -}}
  {{- else -}}
    {{- print "autoscaling/v2beta2" -}}
  {{- end -}}
{{- end -}}

{{/* Get Ingress API Version */}}
{{- define "plantuml.ingress.apiVersion" -}}
  {{- if and (.Capabilities.APIVersions.Has "networking.k8s.io/v1") (semverCompare ">= 1.19-0" .Capabilities.KubeVersion.Version) -}}
      {{- print "networking.k8s.io/v1" -}}
  {{- else if .Capabilities.APIVersions.Has "networking.k8s.io/v1beta1" -}}
    {{- print "networking.k8s.io/v1beta1" -}}
  {{- else -}}
    {{- print "extensions/v1beta1" -}}
  {{- end -}}
{{- end -}}

{{/* Check Ingress stability */}}
{{- define "plantuml.ingress.isStable" -}}
  {{- eq (include "plantuml.ingress.apiVersion" .) "networking.k8s.io/v1" -}}
{{- end -}}

{{/* Check Ingress supports pathType */}}
{{/* pathType was added to networking.k8s.io/v1beta1 in Kubernetes 1.18 */}}
{{- define "plantuml.ingress.supportsPathType" -}}
  {{- or (eq (include "plantuml.ingress.isStable" .) "true") (and (eq (include "plantuml.ingress.apiVersion" .) "networking.k8s.io/v1beta1") (semverCompare ">= 1.18-0" .Capabilities.KubeVersion.Version)) -}}
{{- end -}}

{{/*
Patch the label selector on an object
*/}}
{{- define "plantuml.patchLabelSelector" -}}
{{- if not (hasKey ._target "labelSelector") }}
{{- $selectorLabels := (include "plantuml.selectorLabels" .) | fromYaml }}
{{- $_ := set ._target "labelSelector" (dict "matchLabels" $selectorLabels) }}
{{- end }}
{{- end }}

{{/*
Patch pod affinity
*/}}
{{- define "plantuml.patchPodAffinity" -}}
{{- if (hasKey ._podAffinity "requiredDuringSchedulingIgnoredDuringExecution") }}
{{- range $term := ._podAffinity.requiredDuringSchedulingIgnoredDuringExecution }}
{{- include "plantuml.patchLabelSelector" (merge (dict "_target" $term) $) }}
{{- end }}
{{- end }}
{{- if (hasKey ._podAffinity "preferredDuringSchedulingIgnoredDuringExecution") }}
{{- range $weightedTerm := ._podAffinity.preferredDuringSchedulingIgnoredDuringExecution }}
{{- include "plantuml.patchLabelSelector" (merge (dict "_target" $weightedTerm.podAffinityTerm) $) }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Patch affinity
*/}}
{{- define "plantuml.patchAffinity" -}}
{{- if (hasKey .Values.affinity "podAffinity") }}
{{- include "plantuml.patchPodAffinity" (merge (dict "_podAffinity" .Values.affinity.podAffinity) .) }}
{{- end }}
{{- if (hasKey .Values.affinity "podAntiAffinity") }}
{{- include "plantuml.patchPodAffinity" (merge (dict "_podAffinity" .Values.affinity.podAntiAffinity) .) }}
{{- end }}
{{- end }}

{{/*
Patch topology spread constraints
*/}}
{{- define "plantuml.patchTopologySpreadConstraints" -}}
{{- range $constraint := .Values.topologySpreadConstraints }}
{{- include "plantuml.patchLabelSelector" (merge (dict "_target" $constraint) $) }}
{{- end }}
{{- end }}
