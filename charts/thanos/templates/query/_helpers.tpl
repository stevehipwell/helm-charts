{{/*
Fullname
*/}}
{{- define "thanos.query.fullname" -}}
{{ include "thanos.fullname" . }}-query
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.query.labels" -}}
{{ include "thanos.labels" . }}
app.kubernetes.io/component: query
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.query.selectorLabels" -}}
{{ include "thanos.selectorLabels" . }}
app.kubernetes.io/component: query
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.query.serviceAccountName" -}}
{{- if .Values.query.serviceAccount.create -}}
{{- default (printf "%s-query" (include "thanos.fullname" .)) .Values.query.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.query.serviceAccount.name }}
{{- end -}}
{{- end -}}
