{{/*
Fullname
*/}}
{{- define "vertical-pod-autoscaler.recommender.fullname" -}}
{{ include "vertical-pod-autoscaler.fullname" . }}-recommender
{{- end }}

{{/*
Common labels
*/}}
{{- define "vertical-pod-autoscaler.recommender.labels" -}}
{{ include "vertical-pod-autoscaler.labels" . }}
app.kubernetes.io/component: recommender
{{- end }}

{{/*
Selector labels
*/}}
{{- define "vertical-pod-autoscaler.recommender.selectorLabels" -}}
{{ include "vertical-pod-autoscaler.selectorLabels" . }}
app.kubernetes.io/component: recommender
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "vertical-pod-autoscaler.recommender.serviceAccountName" -}}
{{- if .Values.recommender.serviceAccount.create -}}
{{- default (printf "%s-recommender" (include "vertical-pod-autoscaler.fullname" .)) .Values.recommender.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.recommender.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
The image to use
*/}}
{{- define "vertical-pod-autoscaler.recommender.image" -}}
{{- printf "%s:%s" .Values.recommender.image.repository (default .Chart.AppVersion .Values.recommender.image.tag) }}
{{- end }}
