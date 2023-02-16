{{/*
Fullname
*/}}
{{- define "overprovisioner.pause.fullname" -}}
{{ include "overprovisioner.fullname" . }}-pause
{{- end }}

{{/*
Common labels
*/}}
{{- define "overprovisioner.pause.labels" -}}
{{ include "overprovisioner.labels" . }}
app.kubernetes.io/component: pause
{{- end }}

{{/*
Selector labels
*/}}
{{- define "overprovisioner.pause.selectorLabels" -}}
{{ include "overprovisioner.selectorLabels" . }}
app.kubernetes.io/component: pause
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "overprovisioner.pause.serviceAccountName" -}}
{{- if .Values.pause.serviceAccount.create }}
{{- default (printf "%s-pause" (include "overprovisioner.fullname" .)) .Values.pause.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
