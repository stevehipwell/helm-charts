{{/*
Fullname
*/}}
{{- define "thanos.storeGateway.fullname" -}}
{{ include "thanos.fullname" . }}-store-gateway
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.storeGateway.labels" -}}
{{ include "thanos.labels" . }}
app.kubernetes.io/component: store-gateway
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.storeGateway.selectorLabels" -}}
{{ include "thanos.selectorLabels" . }}
app.kubernetes.io/component: store-gateway
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.storeGateway.serviceAccountName" -}}
{{- if .Values.storeGateway.serviceAccount.create -}}
{{- default (printf "%s-store-gateway" (include "thanos.fullname" .)) .Values.storeGateway.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.storeGateway.serviceAccount.name }}
{{- end -}}
{{- end -}}
