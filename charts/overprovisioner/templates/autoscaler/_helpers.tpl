{{/*
Fullname
*/}}
{{- define "overprovisioner.autoscaler.fullname" -}}
{{ include "overprovisioner.fullname" . }}-autoscaler
{{- end }}

{{/*
Common labels
*/}}
{{- define "overprovisioner.autoscaler.labels" -}}
{{ include "overprovisioner.labels" . }}
app.kubernetes.io/component: autoscaler
{{- end }}

{{/*
Selector labels
*/}}
{{- define "overprovisioner.autoscaler.selectorLabels" -}}
{{ include "overprovisioner.selectorLabels" . }}
app.kubernetes.io/component: autoscaler
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "overprovisioner.autoscaler.serviceAccountName" -}}
{{- if .Values.autoscaler.serviceAccount.create }}
{{- default (printf "%s-autoscaler" (include "overprovisioner.fullname" .)) .Values.autoscaler.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
