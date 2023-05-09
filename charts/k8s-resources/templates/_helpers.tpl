{{/*
Expand the name of the chart.
*/}}
{{- define "k8s-resources.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "k8s-resources.labels" -}}
app.kubernetes.io/name: {{ include "k8s-resources.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
