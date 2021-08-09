{{/*
Fullname
*/}}
{{- define "thanos.queryFrontendFullname" -}}
{{ include "thanos.fullname" . }}-query-frontend
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.queryFrontendLabels" -}}
{{ include "thanos.labels" . }}
app.kubernetes.io/component: query-frontend
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.queryFrontendSelectorLabels" -}}
{{ include "thanos.selectorLabels" . }}
app.kubernetes.io/component: query-frontend
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.queryFrontendServiceAccountName" -}}
{{- if .Values.queryFrontend.serviceAccount.create -}}
{{- default (printf "%s-query-frontend" (include "thanos.fullname" .)) .Values.queryFrontend.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.queryFrontend.serviceAccount.name }}
{{- end -}}
{{- end -}}
