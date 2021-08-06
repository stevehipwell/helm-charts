{{/*
Fullname
*/}}
{{- define "thanos.storeGatewayFullname" -}}
{{ include "thanos.fullname" . }}-store-gateway
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.storeGatewayLabels" -}}
{{ include "thanos.labels" . }}
app.kubernetes.io/component: store-gateway
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.storeGatewaySelectorLabels" -}}
{{ include "thanos.selectorLabels" . }}
app.kubernetes.io/component: store-gateway
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.storeGatewayServiceAccountName" -}}
{{- if .Values.storeGateway.serviceAccount.create -}}
{{- default (printf "%s-store-gateway" (include "thanos.fullname" .)) .Values.storeGateway.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.storeGateway.serviceAccount.name }}
{{- end -}}
{{- end -}}
