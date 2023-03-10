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

{{/*
Patch affinity
*/}}
{{- define "overprovisioner.pause.patchAffinity" -}}
{{- if (hasKey .Values.pause.affinity "podAffinity") }}
{{- include "overprovisioner.patchPodAffinity" (merge (dict "_podAffinity" .Values.pause.affinity.podAffinity "_selectorLabelsTemplate" "overprovisioner.pause.selectorLabels") .) }}
{{- end }}
{{- if (hasKey .Values.pause.affinity "podAntiAffinity") }}
{{- include "overprovisioner.patchPodAffinity" (merge (dict "_podAffinity" .Values.pause.affinity.podAntiAffinity "_selectorLabelsTemplate" "overprovisioner.pause.selectorLabels") .) }}
{{- end }}
{{- end }}

{{/*
Patch topology spread constraints
*/}}
{{- define "overprovisioner.pause.patchTopologySpreadConstraints" -}}
{{- range $constraint := .Values.pause.topologySpreadConstraints }}
{{- include "overprovisioner.patchLabelSelector" (merge (dict "_target" $constraint "_selectorLabelsTemplate" "overprovisioner.pause.selectorLabels") $) }}
{{- end }}
{{- end }}

