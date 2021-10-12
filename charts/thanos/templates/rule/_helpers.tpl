{{/*
Fullname
*/}}
{{- define "thanos.ruleFullname" -}}
{{ include "thanos.fullname" . }}-rule
{{- end }}

{{/*
Common labels
*/}}
{{- define "thanos.ruleLabels" -}}
{{ include "thanos.labels" . }}
app.kubernetes.io/component: rule
{{- end }}

{{/*
Selector labels
*/}}
{{- define "thanos.ruleSelectorLabels" -}}
{{ include "thanos.selectorLabels" . }}
app.kubernetes.io/component: rule
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "thanos.ruleServiceAccountName" -}}
{{- if .Values.rule.serviceAccount.create -}}
{{- default (printf "%s-rule" (include "thanos.fullname" .)) .Values.rule.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.rule.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Alertmanagers secret name
*/}}
{{- define "thanos.ruleAlertmanagersConfigSecretName" -}}
{{- if .Values.rule.alertmanagersConfig.create -}}
{{- default (printf "%s-alertmanagers-config" (include "thanos.ruleFullname" .)) .Values.rule.alertmanagersConfig.name }}
{{- else -}}
{{- .Values.rule.alertmanagersConfig.name }}
{{- end -}}
{{- end -}}

{{/*
Rules configmap name
*/}}
{{- define "thanos.ruleRulesConfigmapName" -}}
{{- if .Values.rule.rules.create -}}
{{- default (printf "%s-rules" (include "thanos.ruleFullname" .)) .Values.rule.rules.name }}
{{- else -}}
{{- .Values.rule.rules.name }}
{{- end -}}
{{- end -}}


