{{/*
Fullname
*/}}
{{- define "thanos.receiveIngestor.fullname" -}}
{{ include "thanos.fullname" . }}-receive-ingestor
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.receiveIngestor.labels" -}}
{{ include "thanos.labels" . }}
app.kubernetes.io/component: receive-ingestor
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.receiveIngestor.selectorLabels" -}}
{{ include "thanos.selectorLabels" . }}
app.kubernetes.io/component: receive-ingestor
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.receiveIngestor.serviceAccountName" -}}
{{- if .Values.receive.ingestor.serviceAccount.create -}}
{{- default (printf "%s-receive-ingestor" (include "thanos.fullname" .)) .Values.receive.ingestor.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.receive.ingestor.serviceAccount.name }}
{{- end -}}
{{- end -}}
