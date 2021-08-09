{{/*
Fullname
*/}}
{{- define "thanos.queryFullname" -}}
{{ include "thanos.fullname" . }}-query
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.queryLabels" -}}
{{ include "thanos.labels" . }}
app.kubernetes.io/component: query
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.querySelectorLabels" -}}
{{ include "thanos.selectorLabels" . }}
app.kubernetes.io/component: query
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.queryServiceAccountName" -}}
{{- if .Values.query.serviceAccount.create -}}
{{- default (printf "%s-query" (include "thanos.fullname" .)) .Values.query.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.query.serviceAccount.name }}
{{- end -}}
{{- end -}}
