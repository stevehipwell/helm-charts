{{/*
Fullname
*/}}
{{- define "thanos.query.fullname" -}}
{{ include "thanos.fullname" . }}-query
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.query.labels" -}}
{{ include "thanos.labels" . }}
app.kubernetes.io/component: query
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.query.selectorLabels" -}}
{{ include "thanos.selectorLabels" . }}
app.kubernetes.io/component: query
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.query.serviceAccountName" -}}
{{- if .Values.query.serviceAccount.create -}}
{{- default (printf "%s-query" (include "thanos.fullname" .)) .Values.query.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.query.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Patch affinity
*/}}
{{- define "thanos.query.patchAffinity" -}}
{{- if (hasKey .Values.pause.affinity "podAffinity") }}
{{- include "thanos.patchPodAffinity" (merge (dict "_podAffinity" .Values.pause.affinity.podAffinity "_selectorLabelsTemplate" "thanos.query.selectorLabels") .) }}
{{- end }}
{{- if (hasKey .Values.pause.affinity "podAntiAffinity") }}
{{- include "thanos.patchPodAffinity" (merge (dict "_podAffinity" .Values.pause.affinity.podAntiAffinity "_selectorLabelsTemplate" "thanos.query.selectorLabels") .) }}
{{- end }}
{{- end }}

{{/*
Patch topology spread constraints
*/}}
{{- define "thanos.query.patchTopologySpreadConstraints" -}}
{{- range $constraint := .Values.pause.topologySpreadConstraints }}
{{- include "thanos.patchLabelSelector" (merge (dict "_target" $constraint "_selectorLabelsTemplate" "thanos.query.selectorLabels") $) }}
{{- end }}
{{- end }}
