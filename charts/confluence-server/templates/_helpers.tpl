{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "confluence-server.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "confluence-server.fullname" -}}
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
{{- define "confluence-server.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "confluence-server.labels" -}}
helm.sh/chart: {{ include "confluence-server.chart" . }}
{{ include "confluence-server.selectorLabels" . }}
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
{{- define "confluence-server.selectorLabels" -}}
app.kubernetes.io/name: {{ include "confluence-server.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "confluence-server.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "confluence-server.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
The image to use
*/}}
{{- define "confluence-server.image" -}}
{{- printf "%s:%s" .Values.image.repository (default (printf "%s-jdk17" .Chart.AppVersion) .Values.image.tag) }}
{{- end }}


{{/*
Create pvc name.
*/}}
{{- define "confluence-server.pvcname" -}}
{{- template "confluence-server.fullname" . -}}-data
{{- end -}}

{{/* Get Ingress API Version */}}
{{- define "confluence-server.ingress.apiVersion" -}}
  {{- if and (.Capabilities.APIVersions.Has "networking.k8s.io/v1") (semverCompare ">= 1.19-0" .Capabilities.KubeVersion.Version) -}}
      {{- print "networking.k8s.io/v1" -}}
  {{- else if .Capabilities.APIVersions.Has "networking.k8s.io/v1beta1" -}}
    {{- print "networking.k8s.io/v1beta1" -}}
  {{- else -}}
    {{- print "extensions/v1beta1" -}}
  {{- end -}}
{{- end -}}

{{/* Check Ingress stability */}}
{{- define "confluence-server.ingress.isStable" -}}
  {{- eq (include "confluence-server.ingress.apiVersion" .) "networking.k8s.io/v1" -}}
{{- end -}}

{{/* Check Ingress supports pathType */}}
{{/* pathType was added to networking.k8s.io/v1beta1 in Kubernetes 1.18 */}}
{{- define "confluence-server.ingress.supportsPathType" -}}
  {{- or (eq (include "confluence-server.ingress.isStable" .) "true") (and (eq (include "confluence-server.ingress.apiVersion" .) "networking.k8s.io/v1beta1") (semverCompare ">= 1.18-0" .Capabilities.KubeVersion.Version)) -}}
{{- end -}}

{{/*
Patch the label selector on an object
*/}}
{{- define "confluence-server.patchLabelSelector" -}}
{{- if not (hasKey ._target "labelSelector") }}
{{- $selectorLabels := (include "confluence-server.selectorLabels" .) | fromYaml }}
{{- $_ := set ._target "labelSelector" (dict "matchLabels" $selectorLabels) }}
{{- end }}
{{- end }}

{{/*
Patch pod affinity
*/}}
{{- define "confluence-server.patchPodAffinity" -}}
{{- if (hasKey ._podAffinity "requiredDuringSchedulingIgnoredDuringExecution") }}
{{- range $term := ._podAffinity.requiredDuringSchedulingIgnoredDuringExecution }}
{{- include "confluence-server.patchLabelSelector" (merge (dict "_target" $term) $) }}
{{- end }}
{{- end }}
{{- if (hasKey ._podAffinity "preferredDuringSchedulingIgnoredDuringExecution") }}
{{- range $weightedTerm := ._podAffinity.preferredDuringSchedulingIgnoredDuringExecution }}
{{- include "confluence-server.patchLabelSelector" (merge (dict "_target" $weightedTerm.podAffinityTerm) $) }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Patch affinity
*/}}
{{- define "confluence-server.patchAffinity" -}}
{{- if (hasKey .Values.affinity "podAffinity") }}
{{- include "confluence-server.patchPodAffinity" (merge (dict "_podAffinity" .Values.affinity.podAffinity) .) }}
{{- end }}
{{- if (hasKey .Values.affinity "podAntiAffinity") }}
{{- include "confluence-server.patchPodAffinity" (merge (dict "_podAffinity" .Values.affinity.podAntiAffinity) .) }}
{{- end }}
{{- end }}

{{/*
Patch topology spread constraints
*/}}
{{- define "confluence-server.patchTopologySpreadConstraints" -}}
{{- range $constraint := .Values.topologySpreadConstraints }}
{{- include "confluence-server.patchLabelSelector" (merge (dict "_target" $constraint) $) }}
{{- end }}
{{- end }}

{{/*
Lookup postgresql chart service name.
*/}}
{{- define "confluence-server.postgresql.serviceName" -}}
{{- $values := merge .Values.postgresql (dict "global" .Values.global) -}}
{{- $context := dict "Values" $values "Release" .Release "Chart" (dict "Name" "postgresql") "Template" .Template -}}
{{ include "postgresql.v1.primary.fullname" $context }}
{{- end -}}

{{/*
Lookup postgresql chart service port.
*/}}
{{- define "confluence-server.postgresql.servicePort" -}}
{{- $values := merge .Values.postgresql (dict "global" .Values.global) -}}
{{- $context := dict "Values" $values "Release" .Release "Chart" (dict "Name" "postgresql") "Template" .Template -}}
{{ include "postgresql.v1.service.port" $context }}
{{- end -}}

{{/*
Lookup postgresql chart database.
*/}}
{{- define "confluence-server.postgresql.database" -}}
{{- $values := merge .Values.postgresql (dict "global" .Values.global) -}}
{{- $context := dict "Values" $values "Release" .Release "Chart" (dict "Name" "postgresql") "Template" .Template -}}
{{ include "postgresql.v1.database" $context }}
{{- end -}}

{{/*
Lookup postgresql chart username.
*/}}
{{- define "confluence-server.postgresql.username" -}}
{{- $values := merge .Values.postgresql (dict "global" .Values.global) -}}
{{- $context := dict "Values" $values "Release" .Release "Chart" (dict "Name" "postgresql") "Template" .Template -}}
{{ default "postgres" (include "postgresql.v1.username" $context) }}
{{- end -}}

{{/*
Lookup postgresql chart password secret name.
*/}}
{{- define "confluence-server.postgresql.passwordSecretName" -}}
{{- $values := merge .Values.postgresql (dict "global" .Values.global) -}}
{{- $context := dict "Values" $values "Release" .Release "Chart" (dict "Name" "postgresql") "Template" .Template -}}
{{ include "postgresql.v1.secretName" $context }}
{{- end -}}
