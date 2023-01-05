{{/*
Fullname
*/}}
{{- define "thanos.receiveFullname" -}}
{{ include "thanos.fullname" . }}-receive
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.receiveLabels" -}}
{{ include "thanos.labels" . }}
app.kubernetes.io/component: receive
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.receiveSelectorLabels" -}}
{{ include "thanos.selectorLabels" . }}
app.kubernetes.io/component: receive
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.receiveServiceAccountName" -}}
{{- if .Values.receive.serviceAccount.create -}}
{{- default (printf "%s-receive" (include "thanos.fullname" .)) .Values.receive.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.receive.serviceAccount.name }}
{{- end -}}
{{- end -}}
