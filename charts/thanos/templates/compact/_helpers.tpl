{{/*
Fullname
*/}}
{{- define "thanos.compactFullname" -}}
{{ include "thanos.fullname" . }}-compact
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.compactLabels" -}}
{{ include "thanos.labels" . }}
app.kubernetes.io/component: compact
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.compactSelectorLabels" -}}
{{ include "thanos.selectorLabels" . }}
app.kubernetes.io/component: compact
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.compactServiceAccountName" -}}
{{- if .Values.compact.serviceAccount.create -}}
{{- default (printf "%s-compact" (include "thanos.fullname" .)) .Values.compact.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.compact.serviceAccount.name }}
{{- end -}}
{{- end -}}
