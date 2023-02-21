{{/*
Fullname
*/}}
{{- define "thanos.receiveRouter.fullname" -}}
{{ include "thanos.fullname" . }}-receive-router
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.receiveRouter.labels" -}}
{{ include "thanos.labels" . }}
app.kubernetes.io/component: receive-router
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.receiveRouter.selectorLabels" -}}
{{ include "thanos.selectorLabels" . }}
app.kubernetes.io/component: receive-router
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.receiveRouter.serviceAccountName" -}}
{{- if .Values.receive.router.serviceAccount.create -}}
{{- default (printf "%s-receive-router" (include "thanos.fullname" .)) .Values.receive.router.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.receive.router.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Hashrings configmap name
*/}}
{{- define "thanos.receiveRouter.hashringsConfigmapName" -}}
{{ include "thanos.receiveRouter.fullname" . }}-hashrings
{{- end -}}
