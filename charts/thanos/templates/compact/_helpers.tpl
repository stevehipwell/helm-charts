{{/*
Fullname
*/}}
{{- define "thanos.compact.fullname" -}}
{{ include "thanos.fullname" . }}-compact
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.compact.labels" -}}
{{ include "thanos.labels" . }}
app.kubernetes.io/component: compact
app.kubernetes.io/component-instance: {{ .Release.Name }}-compact
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.compact.selectorLabels" -}}
{{ include "thanos.selectorLabels" . }}
app.kubernetes.io/component: compact
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.compact.serviceAccountName" -}}
{{- if .Values.compact.serviceAccount.create -}}
{{- default (printf "%s-compact" (include "thanos.fullname" .)) .Values.compact.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.compact.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Patch affinity
*/}}
{{- define "thanos.compact.patchAffinity" -}}
{{- if (hasKey .Values.compact.affinity "podAffinity") }}
{{- include "thanos.patchPodAffinity" (merge (dict "_podAffinity" .Values.compact.affinity.podAffinity "_selectorLabelsTemplate" "thanos.compact.selectorLabels") .) }}
{{- end }}
{{- if (hasKey .Values.compact.affinity "podAntiAffinity") }}
{{- include "thanos.patchPodAffinity" (merge (dict "_podAffinity" .Values.compact.affinity.podAntiAffinity "_selectorLabelsTemplate" "thanos.compact.selectorLabels") .) }}
{{- end }}
{{- end }}

{{/*
Patch topology spread constraints
*/}}
{{- define "thanos.compact.patchTopologySpreadConstraints" -}}
{{- range $constraint := .Values.compact.topologySpreadConstraints }}
{{- include "thanos.patchLabelSelector" (merge (dict "_target" $constraint "_selectorLabelsTemplate" "thanos.compact.selectorLabels") $) }}
{{- end }}
{{- end }}

{{/*
Generate compact shards list as JSON
*/}}
{{- define "thanos.compact.shards" -}}
{{- if .Values.compact.enabled -}}
{{- $list := list -}}
{{- if .Values.compact.sharded.enabled }}
{{- range $index, $shard := .Values.compact.sharded.timePartitioning }}
{{- $x := deepCopy $shard -}}
{{- $shardName := $x.name | default (printf "%d" $index) }}
{{- $_ := set $x "name" $shardName }}
{{- $_ := set $x "fullname" (printf "%s-%s" (include "thanos.compact.fullname" $) $shardName) }}
{{- $list = append $list $x -}}
{{- end }}
{{- else -}}
{{- $defaultShard := dict "fullname" (printf "%s" (include "thanos.compact.fullname" $)) -}}
{{- $list = append $list $defaultShard -}}
{{- end -}}
{{- toJson $list -}}
{{- end -}}
{{- end -}}

