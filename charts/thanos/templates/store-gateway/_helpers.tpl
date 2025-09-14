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
app.kubernetes.io/component-instance: {{ .Release.Name }}-store-gateway
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

{{/*
Generate store gateway shards list as JSON
*/}}
{{- define "thanos.storeGateway.shards" -}}
{{- if .Values.storeGateway.enabled -}}
{{- $list := list -}}
{{- if .Values.storeGateway.sharded.enabled }}
{{- range $index, $shard := .Values.storeGateway.sharded.timePartitioning }}
{{- $x := deepCopy $shard -}}
{{- $shardName := $x.name | default (printf "%d" $index) }}
{{- $_ := set $x "name" $shardName }}
{{- $_ := set $x "fullname" (printf "%s-%s" (include "thanos.storeGateway.fullname" $) $shardName) }}
{{- $list = append $list $x -}}
{{- end }}
{{- else -}}
{{- $defaultShard := dict "fullname" (printf "%s" (include "thanos.storeGateway.fullname" $)) -}}
{{- $list = append $list $defaultShard -}}
{{- end -}}
{{- toJson $list -}}
{{- end -}}
{{- end -}}

