{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "jira-software.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "jira-software.fullname" -}}
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
{{- define "jira-software.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "jira-software.labels" -}}
helm.sh/chart: {{ include "jira-software.chart" . }}
{{ include "jira-software.selectorLabels" . }}
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
{{- define "jira-software.selectorLabels" -}}
app.kubernetes.io/name: {{ include "jira-software.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "jira-software.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "jira-software.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
The image to use
*/}}
{{- define "jira-software.image" -}}
{{- printf "%s:%s" .Values.image.repository (default (printf "%s-jdk11" .Chart.AppVersion) .Values.image.tag) }}
{{- end }}

{{/*
Create pvc name.
*/}}
{{- define "jira-software.pvcname" -}}
{{- template "jira-software.fullname" . -}}-data
{{- end -}}

{{/* Get Ingress API Version */}}
{{- define "jira-software.ingress.apiVersion" -}}
  {{- if and (.Capabilities.APIVersions.Has "networking.k8s.io/v1") (semverCompare ">= 1.19-0" .Capabilities.KubeVersion.Version) -}}
      {{- print "networking.k8s.io/v1" -}}
  {{- else if .Capabilities.APIVersions.Has "networking.k8s.io/v1beta1" -}}
    {{- print "networking.k8s.io/v1beta1" -}}
  {{- else -}}
    {{- print "extensions/v1beta1" -}}
  {{- end -}}
{{- end -}}

{{/* Check Ingress stability */}}
{{- define "jira-software.ingress.isStable" -}}
  {{- eq (include "jira-software.ingress.apiVersion" .) "networking.k8s.io/v1" -}}
{{- end -}}

{{/* Check Ingress supports pathType */}}
{{/* pathType was added to networking.k8s.io/v1beta1 in Kubernetes 1.18 */}}
{{- define "jira-software.ingress.supportsPathType" -}}
  {{- or (eq (include "jira-software.ingress.isStable" .) "true") (and (eq (include "jira-software.ingress.apiVersion" .) "networking.k8s.io/v1beta1") (semverCompare ">= 1.18-0" .Capabilities.KubeVersion.Version)) -}}
{{- end -}}

{{/*
Lookup postgresql chart service name.
*/}}
{{- define "jira-software.postgresql.serviceName" -}}
{{- $values := merge .Values.postgresql (dict "global" .Values.global) -}}
{{- $context := dict "Values" $values "Release" .Release "Chart" (dict "Name" "postgresql") "Template" .Template -}}
{{ include "postgresql.primary.fullname" $context }}
{{- end -}}

{{/*
Lookup postgresql chart service port.
*/}}
{{- define "jira-software.postgresql.servicePort" -}}
{{- $values := merge .Values.postgresql (dict "global" .Values.global) -}}
{{- $context := dict "Values" $values "Release" .Release "Chart" (dict "Name" "postgresql") "Template" .Template -}}
{{ include "postgresql.servicePort" $context }}
{{- end -}}

{{/*
Lookup postgresql chart database.
*/}}
{{- define "jira-software.postgresql.database" -}}
{{- $values := merge .Values.postgresql (dict "global" .Values.global) -}}
{{- $context := dict "Values" $values "Release" .Release "Chart" (dict "Name" "postgresql") "Template" .Template -}}
{{ include "postgresql.database" $context }}
{{- end -}}

{{/*
Lookup postgresql chart username.
*/}}
{{- define "jira-software.postgresql.username" -}}
{{- $values := merge .Values.postgresql (dict "global" .Values.global) -}}
{{- $context := dict "Values" $values "Release" .Release "Chart" (dict "Name" "postgresql") "Template" .Template -}}
{{ default "postgres" (include "postgresql.username" $context) }}
{{- end -}}

{{/*
Lookup postgresql chart password secret name.
*/}}
{{- define "jira-software.postgresql.passwordSecretName" -}}
{{- $values := merge .Values.postgresql (dict "global" .Values.global) -}}
{{- $context := dict "Values" $values "Release" .Release "Chart" (dict "Name" "postgresql") "Template" .Template -}}
{{ include "postgresql.secretName" $context }}
{{- end -}}
