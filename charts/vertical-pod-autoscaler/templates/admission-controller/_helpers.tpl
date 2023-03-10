{{/*
Fullname
*/}}
{{- define "vertical-pod-autoscaler.admissionController.fullname" -}}
{{ include "vertical-pod-autoscaler.fullname" . }}-admission-controller
{{- end }}

{{/*
Common labels
*/}}
{{- define "vertical-pod-autoscaler.admissionController.labels" -}}
{{ include "vertical-pod-autoscaler.labels" . }}
app.kubernetes.io/component: admission-controller
{{- end }}

{{/*
Selector labels
*/}}
{{- define "vertical-pod-autoscaler.admissionController.selectorLabels" -}}
{{ include "vertical-pod-autoscaler.selectorLabels" . }}
app.kubernetes.io/component: admission-controller
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "vertical-pod-autoscaler.admissionController.serviceAccountName" -}}
{{- if .Values.admissionController.serviceAccount.create -}}
{{- default (printf "%s-admission-controller" (include "vertical-pod-autoscaler.fullname" .)) .Values.admissionController.serviceAccount.name }}
{{- else -}}
{{- default "default" .Values.admissionController.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
The image to use
*/}}
{{- define "vertical-pod-autoscaler.admissionController.image" -}}
{{- printf "%s:%s" .Values.admissionController.image.repository (default .Chart.AppVersion .Values.admissionController.image.tag) }}
{{- end }}

{{/*
Create the name of the webhook cert secret
*/}}
{{- define "vertical-pod-autoscaler.admissionController.webhookCertSecret" -}}
{{ include "vertical-pod-autoscaler.admissionController.fullname" . }}-cert
{{- end -}}

{{/*
Generate certificate for webhook
*/}}
{{- define "vertical-pod-autoscaler.admissionController.webhookCert" -}}
{{- $serviceName := (include "vertical-pod-autoscaler.admissionController.fullname" .) -}}
{{- $secretName := (include "vertical-pod-autoscaler.admissionController.webhookCertSecret" .) -}}
{{- $secret := lookup "v1" "Secret" .Release.Namespace $secretName -}}
{{- if $secret -}}
caCert: {{ index $secret.data "ca.crt" }}
clientCert: {{ index $secret.data "tls.crt" }}
clientKey: {{ index $secret.data "tls.key" }}
{{- else -}}
{{- $altNames := list (printf "%s.%s" $serviceName .Release.Namespace) (printf "%s.%s.svc" $serviceName .Release.Namespace) (printf "%s.%s.svc.cluster.local" $serviceName .Release.Namespace) -}}
{{- $ca := genCA (printf "%s-ca" (include "vertical-pod-autoscaler.admissionController.fullname" .)) 3650 -}}
{{- $cert := genSignedCert (include "vertical-pod-autoscaler.admissionController.fullname" .) nil $altNames 3650 $ca -}}
caCert: {{ $ca.Cert | b64enc }}
clientCert: {{ $cert.Cert | b64enc }}
clientKey: {{ $cert.Key | b64enc }}
{{- end -}}
{{- end -}}

{{/*
CertManager issuer kind
*/}}
{{- define "vertical-pod-autoscaler.admissionController.webhookCertIssuerKind" -}}
{{- if not .Values.admissionController.certManager.issuerName -}}
{{- print "Issuer" }}
{{- else -}}
{{- print .Values.admissionController.certManager.issuerKind }}
{{- end -}}
{{- end -}}

{{/*
CertManager issuer name
*/}}
{{- define "vertical-pod-autoscaler.admissionController.webhookCertIssuerName" -}}
{{- if not .Values.admissionController.certManager.issuerName -}}
{{ include "vertical-pod-autoscaler.admissionController.fullname" . }}-cert
{{- else -}}
{{- print .Values.admissionController.certManager.issuerName }}
{{- end -}}
{{- end -}}

{{/*
Patch affinity
*/}}
{{- define "vertical-pod-autoscaler.admissionController.patchAffinity" -}}
{{- if (hasKey .Values.pause.affinity "podAffinity") }}
{{- include "vertical-pod-autoscaler.patchPodAffinity" (merge (dict "_podAffinity" .Values.pause.affinity.podAffinity "_selectorLabelsTemplate" "vertical-pod-autoscaler.admissionController.selectorLabels") .) }}
{{- end }}
{{- if (hasKey .Values.pause.affinity "podAntiAffinity") }}
{{- include "vertical-pod-autoscaler.patchPodAffinity" (merge (dict "_podAffinity" .Values.pause.affinity.podAntiAffinity "_selectorLabelsTemplate" "vertical-pod-autoscaler.admissionController.selectorLabels") .) }}
{{- end }}
{{- end }}

{{/*
Patch topology spread constraints
*/}}
{{- define "vertical-pod-autoscaler.admissionController.patchTopologySpreadConstraints" -}}
{{- range $constraint := .Values.pause.topologySpreadConstraints }}
{{- include "vertical-pod-autoscaler.patchLabelSelector" (merge (dict "_target" $constraint "_selectorLabelsTemplate" "vertical-pod-autoscaler.admissionController.selectorLabels") $) }}
{{- end }}
{{- end }}
