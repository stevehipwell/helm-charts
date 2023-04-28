{{/*
Fullname
*/}}
{{- define "thanos.storeGateway.fullname" -}}
{{ include "thanos.fullname" . }}-store-gateway
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.storeGateway.labels" -}}
{{ include "thanos.labels" . }}
app.kubernetes.io/component: store-gateway
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.storeGateway.selectorLabels" -}}
{{ include "thanos.selectorLabels" . }}
app.kubernetes.io/component: store-gateway
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.storeGateway.serviceAccountName" -}}
{{- if .Values.storeGateway.serviceAccount.create -}}
{{- default (printf "%s-store-gateway" (include "thanos.fullname" .)) .Values.storeGateway.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.storeGateway.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Patch affinity
*/}}
{{- define "thanos.storeGateway.patchAffinity" -}}
{{- if (hasKey .Values.storeGateway.affinity "podAffinity") }}
{{- include "thanos.patchPodAffinity" (merge (dict "_podAffinity" .Values.storeGateway.affinity.podAffinity "_selectorLabelsTemplate" "thanos.storeGateway.selectorLabels") .) }}
{{- end }}
{{- if (hasKey .Values.storeGateway.affinity "podAntiAffinity") }}
{{- include "thanos.patchPodAffinity" (merge (dict "_podAffinity" .Values.storeGateway.affinity.podAntiAffinity "_selectorLabelsTemplate" "thanos.storeGateway.selectorLabels") .) }}
{{- end }}
{{- end }}

{{/*
Patch topology spread constraints
*/}}
{{- define "thanos.storeGateway.patchTopologySpreadConstraints" -}}
{{- range $constraint := .Values.storeGateway.topologySpreadConstraints }}
{{- include "thanos.patchLabelSelector" (merge (dict "_target" $constraint "_selectorLabelsTemplate" "thanos.storeGateway.selectorLabels") $) }}
{{- end }}
{{- end }}
