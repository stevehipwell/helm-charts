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

{{/*
Patch affinity
*/}}
{{- define "overprovisioner.autoscaler.patchAffinity" -}}
{{- if (hasKey .Values.autoscaler.affinity "podAffinity") }}
{{- include "overprovisioner.patchPodAffinity" (merge (dict "_podAffinity" .Values.autoscaler.affinity.podAffinity "_selectorLabelsTemplate" "overprovisioner.autoscaler.selectorLabels") .) }}
{{- end }}
{{- if (hasKey ._affinity "podAntiAffinity") }}
{{- include "overprovisioner.patchPodAffinity" (merge (dict "_podAffinity" .Values.autoscaler.affinity.podAntiAffinity "_selectorLabelsTemplate" "overprovisioner.autoscaler.selectorLabels") .) }}
{{- end }}
{{- end }}

{{/*
Patch topology spread constraints
*/}}
{{- define "overprovisioner.autoscaler.patchTopologySpreadConstraints" -}}
{{- range $constraint := .Values.autoscaler.topologySpreadConstraints }}
{{- include "overprovisioner.patchLabelSelector" (merge (dict "_target" $constraint "_selectorLabelsTemplate" "overprovisioner.autoscaler.selectorLabels") $) }}
{{- end }}
{{- end }}
