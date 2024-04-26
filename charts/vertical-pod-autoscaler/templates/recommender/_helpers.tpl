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
app.kubernetes.io/component-instance: {{ .Release.Name }}-recommender
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

{{/*
Patch affinity
*/}}
{{- define "vertical-pod-autoscaler.recommender.patchAffinity" -}}
{{- if (hasKey .Values.recommender.affinity "podAffinity") }}
{{- include "vertical-pod-autoscaler.patchPodAffinity" (merge (dict "_podAffinity" (dig "podAffinity" nil .Values.recommender.affinity) "_selectorLabelsTemplate" "vertical-pod-autoscaler.recommender.selectorLabels") .) }}
{{- end }}
{{- if (hasKey .Values.recommender.affinity "podAntiAffinity") }}
{{- include "vertical-pod-autoscaler.patchPodAffinity" (merge (dict "_podAffinity" (dig "podAntiAffinity" nil .Values.recommender.affinity) "_selectorLabelsTemplate" "vertical-pod-autoscaler.recommender.selectorLabels") .) }}
{{- end }}
{{- end }}

{{/*
Patch topology spread constraints
*/}}
{{- define "vertical-pod-autoscaler.recommender.patchTopologySpreadConstraints" -}}
{{- range $constraint := .Values.recommender.topologySpreadConstraints }}
{{- include "vertical-pod-autoscaler.patchLabelSelector" (merge (dict "_target" $constraint "_selectorLabelsTemplate" "vertical-pod-autoscaler.recommender.selectorLabels") $) }}
{{- end }}
{{- end }}
