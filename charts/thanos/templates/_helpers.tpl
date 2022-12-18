{{/*
Expand the name of the chart.
*/}}
{{- define "thanos.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "thanos.fullname" -}}
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
{{- define "thanos.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.labels" -}}
helm.sh/chart: {{ include "thanos.chart" . }}
{{ include "thanos.selectorLabels" . }}
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
{{- define "thanos.selectorLabels" -}}
app.kubernetes.io/name: {{ include "thanos.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Objstore secret name
*/}}
{{- define "thanos.objstoreConfigSecretName" -}}
{{- if .Values.objstoreConfig.create -}}
{{- default (printf "%s-objstore-config" (include "thanos.fullname" .)) .Values.objstoreConfig.name }}
{{- else -}}
{{- .Values.objstoreConfig.name }}
{{- end -}}
{{- end -}}

{{/*
The Thanos image to use
*/}}
{{- define "thanos.image" -}}
{{- printf "%s:%s" .Values.image.repository (default (printf "v%s" .Chart.AppVersion) .Values.image.tag) }}
{{- end }}

{{/* Get Ingress API Version */}}
{{- define "thanos.ingress.apiVersion" -}}
  {{- if and (.Capabilities.APIVersions.Has "networking.k8s.io/v1") (semverCompare ">= 1.19-0" .Capabilities.KubeVersion.Version) -}}
      {{- print "networking.k8s.io/v1" -}}
  {{- else -}}
    {{- print "extensions/v1beta1" -}}
  {{- end -}}
{{- end -}}

{{/* Check Ingress stability */}}
{{- define "thanos.ingress.isStable" -}}
  {{- eq (include "thanos.ingress.apiVersion" .) "networking.k8s.io/v1" -}}
{{- end -}}

{{/* Check Ingress supports pathType */}}
{{/* pathType was added to networking.k8s.io/v1beta1 in Kubernetes 1.18 */}}
{{- define "thanos.ingress.supportsPathType" -}}
  {{- or (eq (include "thanos.ingress.isStable" .) "true") (and (eq (include "thanos.ingress.apiVersion" .) "networking.k8s.io/v1beta1") (semverCompare ">= 1.18-0" .Capabilities.KubeVersion.Version)) -}}
{{- end -}}

{{/* Get HorizontalPodAutoscaler API Version */}}
{{- define "thanos.hpa.apiVersion" -}}
  {{- if and (.Capabilities.APIVersions.Has "autoscaling/v2") (semverCompare ">= 1.23-0" .Capabilities.KubeVersion.Version) -}}
      {{- print "autoscaling/v2" -}}
  {{- else -}}
    {{- print "autoscaling/v2beta2" -}}
  {{- end -}}
{{- end -}}

{{/* Get PodDisruptionBudget API Version */}}
{{- define "thanos.pdb.apiVersion" -}}
  {{- if and (.Capabilities.APIVersions.Has "policy/v1") (semverCompare ">= 1.21-0" .Capabilities.KubeVersion.Version) -}}
      {{- print "policy/v1" -}}
  {{- else -}}
    {{- print "policy/v1beta1" -}}
  {{- end -}}
{{- end -}}

{{/* Check if we have query ingress */}}
{{- define "thanos.queryIngress.enabled" -}}
  {{- or (and .Values.queryFrontend.enabled .Values.queryFrontend.ingress.enabled) .Values.query.ingress.enabled -}}
{{- end -}}

{{/* Get the query ingress url */}}
{{- define "thanos.queryIngress.url" -}}
  {{- if and .Values.queryFrontend.enabled .Values.queryFrontend.ingress.enabled -}}
    {{- if .Values.queryFrontend.ingress.tls -}}
      {{- printf "https://%s%s" (first (first .Values.queryFrontend.ingress.tls).hosts) .Values.queryFrontend.ingress.path -}}
    {{- else -}}
      {{- printf "http://%s%s" (first .Values.queryFrontend.ingress.hosts) .Values.queryFrontend.ingress.path -}}
    {{- end -}}
  {{- else if .Values.query.ingress.enabled -}}
    {{- if .Values.query.ingress.tls -}}
      {{- printf "https://%s%s" (first (first .Values.query.ingress.tls).hosts) .Values.query.ingress.path -}}
    {{- else -}}
      {{- printf "http://%s%s" (first .Values.query.ingress.hosts) .Values.query.ingress.path -}}
    {{- end -}}
  {{- else -}}
    {{- print "" -}}
  {{- end -}}
{{- end -}}
