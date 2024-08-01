# kube-proxy

![Version: 0.0.4](https://img.shields.io/badge/Version-0.0.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.30.3](https://img.shields.io/badge/AppVersion-1.30.3-informational?style=flat-square)

Helm chart for managing kube-proxy.

**Homepage:** <https://kubernetes.io/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| stevehipwell | <steve.hipwell@gmail.com> |  |

## Source Code

* <https://github.com/kubernetes/kubernetes/>
* <https://github.com/stevehipwell/helm-charts/>

## Installing the Chart

### OCI Repository

To install the chart using the recommended OCI method you can use the following command.

```shell
helm upgrade --install kube-proxy oci://ghcr.io/stevehipwell/helm-charts/kube-proxy --version 0.0.4
```

#### Verification

As the OCI chart release is signed by [Cosign](https://github.com/sigstore/cosign) you can verify the chart before installing it by running the following command.

```shell
cosign verify --certificate-oidc-issuer https://token.actions.githubusercontent.com --certificate-identity-regexp 'https://github\.com/action-stars/helm-workflows/\.github/workflows/release\.yaml@.+' --certificate-github-workflow-repository stevehipwell/helm-charts --certificate-github-workflow-name Release ghcr.io/stevehipwell/helm-charts/kube-proxy:0.0.4
```

### Non-OCI Repository

Alternatively you can use the legacy non-OCI method via the following commands.

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
helm upgrade --install kube-proxy stevehipwell/kube-proxy --version 0.0.4
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for pod scheduling. |
| apiServer.endpoint | string | `nil` | API server endpoint for kube-proxy to communicate with. |
| args | list | `[]` | Extra args for the default container. |
| commonLabels | object | `{}` | Labels to add to all chart resources. |
| config | object | `{"apiVersion":"kubeproxy.config.k8s.io/v1alpha1","bindAddress":"0.0.0.0","clientConnection":{"acceptContentTypes":"","burst":10,"contentType":"application/vnd.kubernetes.protobuf","kubeconfig":"/var/lib/kube-proxy/kubeconfig","qps":5},"clusterCIDR":"","configSyncPeriod":"15m0s","conntrack":{"maxPerCore":32768,"min":131072,"tcpCloseWaitTimeout":"1h0m0s","tcpEstablishedTimeout":"24h0m0s"},"enableProfiling":false,"healthzBindAddress":"0.0.0.0:10256","hostnameOverride":"","iptables":{"masqueradeAll":false,"masqueradeBit":14,"minSyncPeriod":"0s","syncPeriod":"30s"},"ipvs":{"excludeCIDRs":null,"minSyncPeriod":"0s","scheduler":"","syncPeriod":"30s"},"kind":"KubeProxyConfiguration","metricsBindAddress":"0.0.0.0:10249","mode":"iptables","nodePortAddresses":null,"oomScoreAdj":-999,"portRange":""}` | Configuration for kube-proxy. |
| fullnameOverride | string | `nil` | Override the full name of the chart. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the default container. |
| image.repository | string | `"registry.k8s.io/kube-proxy"` | Image repository for the default container. |
| image.tag | string | `nil` | Image tag for the default container, this will default to `.Chart.AppVersion` if not set. |
| imagePullSecrets | list | `[]` | Image pull secrets. |
| init.enabled | bool | `true` | If `true`, create an init container so the default container can be unprivileged. |
| init.securityContext | object | `{"allowPrivilegeEscalation":true,"privileged":true,"readOnlyRootFilesystem":true,"runAsNonRoot":false}` | Security context for the init container. |
| livenessProbe | object | `{"httpGet":{"path":"/livez","port":"http-health"}}` | Liveness probe configuration for the default container. |
| logLevel | int | `2` | Log level for kube-proxy. |
| minReadySeconds | int | `nil` | Min ready seconds for the `DaemonSet`. |
| nameOverride | string | `nil` | Override the name of the chart. |
| nodeSelector | object | `{"kubernetes.io/os":"linux"}` | Node labels to match for pod scheduling. |
| podAnnotations | object | `{}` | Annotations to add to the pod. |
| podLabels | object | `{}` | Labels to add to the pod. |
| podSecurityContext | object | `{"runAsNonRoot":false}` | Security context for the pod. |
| priorityClassName | string | `"system-node-critical"` | Priority class name for the pod. |
| rbac.create | bool | `true` | If `true`, create a `ClusterRole` & `ClusterRoleBinding` with access to the Kubernetes API. |
| readinessProbe | object | `{"httpGet":{"path":"/healthz","port":"http-health"}}` | Readiness probe configuration for the default container. |
| resources | object | `{}` | Resources for the default container. |
| securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"add":["NET_ADMIN","SYS_RESOURCE"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsNonRoot":false}` | Security context for the default container; if init is disabled then this needs to be modified to make the default container privileged. |
| selectorLabelsOverride | object | `{}` | If configured replace the default selector labels with these. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount`. |
| serviceAccount.labels | object | `{}` | Labels to add to the service account. |
| serviceAccount.name | string | `nil` | If this is set and `serviceAccount.create` is `true` this will be used for the created `ServiceAccount` name, if set and `serviceAccount.create` is `false` then this will define an existing `ServiceAccount` to use. |
| serviceMonitor.additionalLabels | object | `{}` | Additional labels for the `ServiceMonitor`. |
| serviceMonitor.enabled | bool | `false` | If `true`, create a `ServiceMonitor` resource to support the _Prometheus Operator_. |
| serviceMonitor.endpointConfig | object | `{"bearerTokenFile":"/var/run/secrets/kubernetes.io/serviceaccount/token"}` | Additional endpoint configuration for the default `ServiceMonitor` endpoint. |
| serviceMonitor.jobLabel | string | `"app.kubernetes.io/instance"` | Label used to define the scrape job name. |
| terminationGracePeriodSeconds | int | `30` | Termination grace period for the pod in seconds. |
| tolerations | list | `[{"effect":"NoSchedule","operator":"Exists"},{"effect":"NoExecute","operator":"Exists"}]` | Node taints which will be tolerated for pod scheduling. |
| updateStrategy | object | `{"rollingUpdate":{"maxSurge":0,"maxUnavailable":"10%"},"type":"RollingUpdate"}` | Update strategy for the `DaemonSet`. |

----------------------------------------------

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs/).
