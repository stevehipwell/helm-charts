{{/*
Expand the name of the chart.
*/}}
{{- define "sonarqube.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sonarqube.fullname" -}}
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
{{- define "sonarqube.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sonarqube.labels" -}}
helm.sh/chart: {{ include "sonarqube.chart" . }}
{{ include "sonarqube.selectorLabels" . }}
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
{{- define "sonarqube.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sonarqube.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "sonarqube.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "sonarqube.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
The image to use
*/}}
{{- define "sonarqube.image" -}}
{{- printf "%s:%s" .Values.image.repository (default (printf "%s-community" .Chart.AppVersion) .Values.image.tag) }}
{{- end }}

{{/*
Create commands name.
*/}}
{{- define "sonarqube.commandsName" -}}
{{- template "sonarqube.fullname" . -}}-commands
{{- end -}}

{{/*
Create config name.
*/}}
{{- define "sonarqube.configName" -}}
{{- template "sonarqube.fullname" . -}}-config
{{- end -}}

{{/*
Create pvc name.
*/}}
{{- define "sonarqube.pvcname" -}}
{{- template "sonarqube.fullname" . -}}-data
{{- end -}}

{{/* Get Ingress API Version */}}
{{- define "sonarqube.ingress.apiVersion" -}}
  {{- if and (.Capabilities.APIVersions.Has "networking.k8s.io/v1") (semverCompare ">= 1.19-0" .Capabilities.KubeVersion.Version) -}}
      {{- print "networking.k8s.io/v1" -}}
  {{- else if .Capabilities.APIVersions.Has "networking.k8s.io/v1beta1" -}}
    {{- print "networking.k8s.io/v1beta1" -}}
  {{- else -}}
    {{- print "extensions/v1beta1" -}}
  {{- end -}}
{{- end -}}

{{/* Check Ingress stability */}}
{{- define "sonarqube.ingress.isStable" -}}
  {{- eq (include "sonarqube.ingress.apiVersion" .) "networking.k8s.io/v1" -}}
{{- end -}}

{{/* Check Ingress supports pathType */}}
{{/* pathType was added to networking.k8s.io/v1beta1 in Kubernetes 1.18 */}}
{{- define "sonarqube.ingress.supportsPathType" -}}
  {{- or (eq (include "sonarqube.ingress.isStable" .) "true") (and (eq (include "sonarqube.ingress.apiVersion" .) "networking.k8s.io/v1beta1") (semverCompare ">= 1.18-0" .Capabilities.KubeVersion.Version)) -}}
{{- end -}}

{{/*
Patch the label selector on an object
*/}}
{{- define "sonarqube.patchLabelSelector" -}}
{{- if not (hasKey ._target "labelSelector") }}
{{- $selectorLabels := (include "sonarqube.selectorLabels" .) | fromYaml }}
{{- $_ := set ._target "labelSelector" (dict "matchLabels" $selectorLabels) }}
{{- end }}
{{- end }}

{{/*
Patch pod affinity
*/}}
{{- define "sonarqube.patchPodAffinity" -}}
{{- if (hasKey ._podAffinity "requiredDuringSchedulingIgnoredDuringExecution") }}
{{- range $term := ._podAffinity.requiredDuringSchedulingIgnoredDuringExecution }}
{{- include "sonarqube.patchLabelSelector" (merge (dict "_target" $term) $) }}
{{- end }}
{{- end }}
{{- if (hasKey ._podAffinity "preferredDuringSchedulingIgnoredDuringExecution") }}
{{- range $weightedTerm := ._podAffinity.preferredDuringSchedulingIgnoredDuringExecution }}
{{- include "sonarqube.patchLabelSelector" (merge (dict "_target" $weightedTerm.podAffinityTerm) $) }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Patch affinity
*/}}
{{- define "sonarqube.patchAffinity" -}}
{{- if (hasKey .Values.affinity "podAffinity") }}
{{- include "sonarqube.patchPodAffinity" (merge (dict "_podAffinity" .Values.affinity.podAffinity) .) }}
{{- end }}
{{- if (hasKey .Values.affinity "podAntiAffinity") }}
{{- include "sonarqube.patchPodAffinity" (merge (dict "_podAffinity" .Values.affinity.podAntiAffinity) .) }}
{{- end }}
{{- end }}

{{/*
Patch topology spread constraints
*/}}
{{- define "sonarqube.patchTopologySpreadConstraints" -}}
{{- range $constraint := .Values.topologySpreadConstraints }}
{{- include "sonarqube.patchLabelSelector" (merge (dict "_target" $constraint) $) }}
{{- end }}
{{- end }}

{{/*
Lookup postgresql chart service name.
*/}}
{{- define "sonarqube.postgresql.serviceName" -}}
{{- $values := merge .Values.postgresql (dict "global" .Values.global) -}}
{{- $context := dict "Values" $values "Release" .Release "Chart" (dict "Name" "postgresql") "Template" .Template -}}
{{ include "postgresql.primary.fullname" $context }}
{{- end -}}

{{/*
Lookup postgresql chart service port.
*/}}
{{- define "sonarqube.postgresql.servicePort" -}}
{{- $values := merge .Values.postgresql (dict "global" .Values.global) -}}
{{- $context := dict "Values" $values "Release" .Release "Chart" (dict "Name" "postgresql") "Template" .Template -}}
{{ include "postgresql.servicePort" $context }}
{{- end -}}

{{/*
Lookup postgresql chart database.
*/}}
{{- define "sonarqube.postgresql.database" -}}
{{- $values := merge .Values.postgresql (dict "global" .Values.global) -}}
{{- $context := dict "Values" $values "Release" .Release "Chart" (dict "Name" "postgresql") "Template" .Template -}}
{{ include "postgresql.database" $context }}
{{- end -}}

{{/*
Lookup postgresql chart username.
*/}}
{{- define "sonarqube.postgresql.username" -}}
{{- $values := merge .Values.postgresql (dict "global" .Values.global) -}}
{{- $context := dict "Values" $values "Release" .Release "Chart" (dict "Name" "postgresql") "Template" .Template -}}
{{ default "postgres" (include "postgresql.username" $context) }}
{{- end -}}

{{/*
Lookup postgresql chart password secret name.
*/}}
{{- define "sonarqube.postgresql.passwordSecretName" -}}
{{- $values := merge .Values.postgresql (dict "global" .Values.global) -}}
{{- $context := dict "Values" $values "Release" .Release "Chart" (dict "Name" "postgresql") "Template" .Template -}}
{{ include "postgresql.secretName" $context }}
{{- end -}}
