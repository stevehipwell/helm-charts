{{/*
Fullname
*/}}
{{- define "thanos.rule.fullname" -}}
{{ include "thanos.fullname" . }}-rule
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.rule.labels" -}}
{{ include "thanos.labels" . }}
app.kubernetes.io/component: rule
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.rule.selectorLabels" -}}
{{ include "thanos.selectorLabels" . }}
app.kubernetes.io/component: rule
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.rule.serviceAccountName" -}}
{{- if .Values.rule.serviceAccount.create -}}
{{- default (printf "%s-rule" (include "thanos.fullname" .)) .Values.rule.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.rule.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Alertmanagers secret name
*/}}
{{- define "thanos.rule.alertmanagersConfigSecretName" -}}
{{- if .Values.rule.alertmanagersConfig.create -}}
{{- default (printf "%s-alertmanagers-config" (include "thanos.rule.fullname" .)) .Values.rule.alertmanagersConfig.name }}
{{- else -}}
{{- .Values.rule.alertmanagersConfig.name }}
{{- end -}}
{{- end -}}

{{/*
Rules configmap name
*/}}
{{- define "thanos.rule.rulesConfigmapName" -}}
{{- if .Values.rule.rules.create -}}
{{- default (printf "%s-rules" (include "thanos.rule.fullname" .)) .Values.rule.rules.name }}
{{- else -}}
{{- .Values.rule.rules.name }}
{{- end -}}
{{- end -}}

{{/*
Patch affinity
*/}}
{{- define "thanos.rule.patchAffinity" -}}
{{- if (hasKey .Values.rule.affinity "podAffinity") }}
{{- include "thanos.patchPodAffinity" (merge (dict "_podAffinity" .Values.rule.affinity.podAffinity "_selectorLabelsTemplate" "thanos.rule.selectorLabels") .) }}
{{- end }}
{{- if (hasKey .Values.rule.affinity "podAntiAffinity") }}
{{- include "thanos.patchPodAffinity" (merge (dict "_podAffinity" .Values.rule.affinity.podAntiAffinity "_selectorLabelsTemplate" "thanos.rule.selectorLabels") .) }}
{{- end }}
{{- end }}

{{/*
Patch topology spread constraints
*/}}
{{- define "thanos.rule.patchTopologySpreadConstraints" -}}
{{- range $constraint := .Values.rule.topologySpreadConstraints }}
{{- include "thanos.patchLabelSelector" (merge (dict "_target" $constraint "_selectorLabelsTemplate" "thanos.rule.selectorLabels") $) }}
{{- end }}
{{- end }}


