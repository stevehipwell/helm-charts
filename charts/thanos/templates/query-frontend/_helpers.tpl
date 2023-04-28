{{/*
Fullname
*/}}
{{- define "thanos.queryFrontend.fullname" -}}
{{ include "thanos.fullname" . }}-query-frontend
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.queryFrontend.labels" -}}
{{ include "thanos.labels" . }}
app.kubernetes.io/component: query-frontend
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.queryFrontend.selectorLabels" -}}
{{ include "thanos.selectorLabels" . }}
app.kubernetes.io/component: query-frontend
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.queryFrontend.serviceAccountName" -}}
{{- if .Values.queryFrontend.serviceAccount.create -}}
{{- default (printf "%s-query-frontend" (include "thanos.fullname" .)) .Values.queryFrontend.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.queryFrontend.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Patch affinity
*/}}
{{- define "thanos.queryFrontend.patchAffinity" -}}
{{- if (hasKey .Values.queryFrontend.affinity "podAffinity") }}
{{- include "thanos.patchPodAffinity" (merge (dict "_podAffinity" .Values.queryFrontend.affinity.podAffinity "_selectorLabelsTemplate" "thanos.queryFrontend.selectorLabels") .) }}
{{- end }}
{{- if (hasKey .Values.queryFrontend.affinity "podAntiAffinity") }}
{{- include "thanos.patchPodAffinity" (merge (dict "_podAffinity" .Values.queryFrontend.affinity.podAntiAffinity "_selectorLabelsTemplate" "thanos.queryFrontend.selectorLabels") .) }}
{{- end }}
{{- end }}

{{/*
Patch topology spread constraints
*/}}
{{- define "thanos.queryFrontend.patchTopologySpreadConstraints" -}}
{{- range $constraint := .Values.queryFrontend.topologySpreadConstraints }}
{{- include "thanos.patchLabelSelector" (merge (dict "_target" $constraint "_selectorLabelsTemplate" "thanos.queryFrontend.selectorLabels") $) }}
{{- end }}
{{- end }}
