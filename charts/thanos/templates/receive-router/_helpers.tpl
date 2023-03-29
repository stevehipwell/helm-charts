{{/*
Fullname
*/}}
{{- define "thanos.receive.router.fullname" -}}
{{ include "thanos.fullname" . }}-receive-router
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.receive.router.labels" -}}
{{ include "thanos.labels" . }}
app.kubernetes.io/component: receive-router
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.receive.router.selectorLabels" -}}
{{ include "thanos.selectorLabels" . }}
app.kubernetes.io/component: receive-router
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.receive.router.serviceAccountName" -}}
{{- if .Values.receive.router.serviceAccount.create -}}
{{- default (printf "%s-receive-router" (include "thanos.fullname" .)) .Values.receive.router.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.receive.router.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Hashrings configmap name
*/}}
{{- define "thanos.receive.router.hashringsConfigmapName" -}}
{{ include "thanos.receive.router.fullname" . }}-hashrings
{{- end -}}

{{/*
Patch affinity
*/}}
{{- define "thanos.receive.router.patchAffinity" -}}
{{- if (hasKey .Values.pause.affinity "podAffinity") }}
{{- include "thanos.patchPodAffinity" (merge (dict "_podAffinity" .Values.pause.affinity.podAffinity "_selectorLabelsTemplate" "thanos.receive.router.selectorLabels") .) }}
{{- end }}
{{- if (hasKey .Values.pause.affinity "podAntiAffinity") }}
{{- include "thanos.patchPodAffinity" (merge (dict "_podAffinity" .Values.pause.affinity.podAntiAffinity "_selectorLabelsTemplate" "thanos.receive.router.selectorLabels") .) }}
{{- end }}
{{- end }}

{{/*
Patch topology spread constraints
*/}}
{{- define "thanos.receive.router.patchTopologySpreadConstraints" -}}
{{- range $constraint := .Values.pause.topologySpreadConstraints }}
{{- include "thanos.patchLabelSelector" (merge (dict "_target" $constraint "_selectorLabelsTemplate" "thanos.receive.router.selectorLabels") $) }}
{{- end }}
{{- end }}

{{/*
Hashring default config
*/}}
{{- define "thanos.receive.router.hashringDefaultConfig" -}}
hashring: default
tenants: []
endpoints:
  {{- include "thanos.receive.ingestor.endpoints" . | nindent 2 }}
{{- end }}
