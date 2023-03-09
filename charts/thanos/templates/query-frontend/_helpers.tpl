{{/*
Fullname
*/}}
{{- define "thanos.queryFrontend.fullname" -}}
{{ include "thanos.fullname" . }}-query-frontend
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.queryFrontend.labels" -}}
{{ include "thanos.labels" . }}
app.kubernetes.io/component: query-frontend
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.queryFrontend.selectorLabels" -}}
{{ include "thanos.selectorLabels" . }}
app.kubernetes.io/component: query-frontend
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.queryFrontend.serviceAccountName" -}}
{{- if .Values.queryFrontend.serviceAccount.create -}}
{{- default (printf "%s-query-frontend" (include "thanos.fullname" .)) .Values.queryFrontend.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.queryFrontend.serviceAccount.name }}
{{- end -}}
{{- end -}}
