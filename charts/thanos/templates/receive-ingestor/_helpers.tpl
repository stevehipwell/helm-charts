{{/*
Fullname
*/}}
{{- define "thanos.receive.ingestor.fullname" -}}
{{ include "thanos.fullname" . }}-receive-ingestor
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.receive.ingestor.labels" -}}
{{ include "thanos.labels" . }}
app.kubernetes.io/component: receive-ingestor
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.receive.ingestor.selectorLabels" -}}
{{ include "thanos.selectorLabels" . }}
app.kubernetes.io/component: receive-ingestor
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.receive.ingestor.serviceAccountName" -}}
{{- if .Values.receive.ingestor.serviceAccount.create -}}
{{- default (printf "%s-receive-ingestor" (include "thanos.fullname" .)) .Values.receive.ingestor.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.receive.ingestor.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Patch affinity
*/}}
{{- define "thanos.receive.ingestor.patchAffinity" -}}
{{- if (hasKey .Values.pause.affinity "podAffinity") }}
{{- include "thanos.patchPodAffinity" (merge (dict "_podAffinity" .Values.pause.affinity.podAffinity "_selectorLabelsTemplate" "thanos.receive.ingestor.selectorLabels") .) }}
{{- end }}
{{- if (hasKey .Values.pause.affinity "podAntiAffinity") }}
{{- include "thanos.patchPodAffinity" (merge (dict "_podAffinity" .Values.pause.affinity.podAntiAffinity "_selectorLabelsTemplate" "thanos.receive.ingestor.selectorLabels") .) }}
{{- end }}
{{- end }}

{{/*
Patch topology spread constraints
*/}}
{{- define "thanos.receive.ingestor.patchTopologySpreadConstraints" -}}
{{- range $constraint := .Values.pause.topologySpreadConstraints }}
{{- include "thanos.patchLabelSelector" (merge (dict "_target" $constraint "_selectorLabelsTemplate" "thanos.receive.ingestor.selectorLabels") $) }}
{{- end }}
{{- end }}

{{/*
Endpoints
*/}}
{{- define "thanos.receive.ingestor.endpoints" -}}
{{- range (until (.Values.receive.ingestor.replicas | int)) }}
{{ printf "- %s" ((printf "%s-%s.%s-headless.%s.svc.cluster.local:10901" (include "thanos.receive.ingestor.fullname" $) (toString .) (include "thanos.receive.ingestor.fullname" $) $.Release.Namespace) | quote) }}
{{- end }}
{{- end -}}
