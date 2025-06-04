# fluent-bit-collector

![Version: 0.17.3](https://img.shields.io/badge/Version-0.17.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.0.3](https://img.shields.io/badge/AppVersion-4.0.3-informational?style=flat-square)

Helm chart for Fluent Bit running as a collector DaemonSet.

**Homepage:** <https://fluentbit.io/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| stevehipwell | <steve.hipwell@gmail.com> | <https://github.com/stevehipwell> |

## Source Code

* <https://github.com/fluent/fluent-bit/>
* <https://github.com/stevehipwell/helm-charts/>

## Installing the Chart

### OCI Repository

To install the chart using the recommended OCI method you can use the following command.

```shell
helm upgrade --install fluent-bit-collector oci://ghcr.io/stevehipwell/helm-charts/fluent-bit-collector --version 0.17.3
```

#### Verification

As the OCI chart release is signed by [Cosign](https://github.com/sigstore/cosign) you can verify the chart before installing it by running the following command.

```shell
cosign verify --certificate-oidc-issuer https://token.actions.githubusercontent.com --certificate-identity-regexp 'https://github\.com/action-stars/helm-workflows/\.github/workflows/release\.yaml@.+' --certificate-github-workflow-repository stevehipwell/helm-charts --certificate-github-workflow-name Release ghcr.io/stevehipwell/helm-charts/fluent-bit-collector:0.17.3
```

### Non-OCI Repository

Alternatively you can use the legacy non-OCI method via the following commands.

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
helm upgrade --install fluent-bit-collector stevehipwell/fluent-bit-collector --version 0.17.3
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for pod scheduling. |
| args | list | `[]` | Extra args for the default container; `--workdir`, `--config` & `--enable-hot-reload` are managed by the chart. |
| command | list | `["/fluent-bit/bin/fluent-bit"]` | Command for the default container |
| commonLabels | object | `{}` | Labels to add to all chart resources. |
| config.customParsers | string | See _values.yaml_ | Custom parsers to configure. |
| config.extraFiles | object | `{}` | Extra files to mount to the path defined by the CONFIG_PATH environment variable. |
| config.hostVolumes | list | See _values.yaml_ | Host volumes to read-only mount to the default container. |
| config.kubeletEndpoint.enabled | bool | `false` | If `true`, the _Kubernetes_ filter will use _Kubelet_ as the API endpoint (**EXPERIMENTAL**). |
| config.kubeletEndpoint.insecure | bool | `false` | If `true`, the TLS connection will not be verified. |
| config.luaScripts | object | `{}` | Lua scripts to configure, these will be created at the path defined by the SCRIPTS_PATH environment variable. |
| config.pipeline | string | See _values.yaml_ | Fluent Bit pipeline configuration; this should depend on config values and changing it incorrectly may break support for some of the config options. |
| config.service | object | See _values.yaml_ | Fluent Bit service configuration. |
| config.storage.enabled | bool | `false` | If `true`, writeable host filesystem storage will be enabled. |
| config.storage.hostPath | string | `"/var/fluent-bit/data"` |  |
| config.storage.metrics | bool | `true` | If `true`, storage metrics will be enabled if storage is enabled. |
| dashboards.enabled | bool | `false` | If `true`, install the _Grafana_ dashboards provided by the chart. |
| env | list | `[]` | Environment variables for the default container. |
| extraVolumeMounts | list | `[]` | Extra volume mounts for the default container. |
| extraVolumes | list | `[]` | Extra volumes for the pod. |
| fullnameOverride | string | `nil` | Override the full name of the chart. |
| hotReload.enabled | bool | `false` | If `true`, enable [hot-reload](https://docs.fluentbit.io/manual/administration/hot-reload) via a sidecar container. |
| hotReload.extraWatchVolumes | list | `[]` | Extra volumes for the hot-reload sidecar container to watch. |
| hotReload.image.digest | string | `nil` | Optional image digest for the hot-reload sidecar container. |
| hotReload.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the hot-reload sidecar container. |
| hotReload.image.repository | string | `"ghcr.io/jimmidyson/configmap-reload"` | Image repository for the hot-reload sidecar container. |
| hotReload.image.tag | string | `"v0.15.0"` | Image tag for the hot-reload sidecar container. |
| hotReload.resources | object | `{}` | Resources for the hot-reload sidecar container. |
| image.digest | string | `nil` | Optional image digest for the default container. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the default container. |
| image.repository | string | `"ghcr.io/fluent/fluent-bit"` | Image repository for the default container. |
| image.tag | string | `nil` | Image tag for the default container, this will default to `.Chart.AppVersion` if not set and will be omitted if set to `-`. |
| imagePullSecrets | list | `[]` | Image pull secrets. |
| livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the default container. |
| minReadySeconds | int | `nil` | Min ready seconds for the `DaemonSet`. |
| nameOverride | string | `nil` | Override the name of the chart. |
| nodeSelector | object | `{}` | Node labels to match for pod scheduling. |
| podAnnotations | object | `{}` | Annotations to add to the pod. |
| podLabels | object | `{}` | Labels to add to the pod. |
| podSecurityContext | object | See _values.yaml_ | Security context for the pod. |
| priorityClassName | string | `nil` | Priority class name for the pod. |
| rbac.additionalRules | list | `[]` | Additional rules to add to the `ClusterRole`. |
| rbac.create | bool | `true` | If `true`, create a `ClusterRole` & `ClusterRoleBinding` with access to the Kubernetes API. |
| readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the default container. |
| resources | object | `{}` | Resources for the default container. |
| securityContext | object | See _values.yaml_ | Security context for the default container. |
| service.additionalPorts | string | See _values.yaml_ | Additional ports to expose. |
| service.annotations | object | `{}` | Service annotations. |
| service.enabled | bool | `false` | If `true`, create an internal local traffic service. |
| service.httpPort | int | `2020` | Fluent Bit HTTP port used for status and metrics. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| serviceAccount.automountToken | bool | `true` | If `true`, mount the `ServiceAccount` token. |
| serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount`. |
| serviceAccount.labels | object | `{}` | Labels to add to the service account. |
| serviceAccount.name | string | `nil` | If this is set and `serviceAccount.create` is `true` this will be used for the created `ServiceAccount` name, if set and `serviceAccount.create` is `false` then this will define an existing `ServiceAccount` to use. |
| serviceMonitor.additionalEndpoints | list | `[]` | Additional `ServiceMonitor`endpoints, these are needed for metrics output plugins. |
| serviceMonitor.additionalLabels | object | `{}` | Additional labels for the `ServiceMonitor`. |
| serviceMonitor.enabled | bool | `false` | If `true`, create a `ServiceMonitor` (or `PodMonitor` if the Service isn't enabled) resource to support the _Prometheus Operator_. |
| serviceMonitor.endpointConfig | object | `{}` | Additional endpoint configuration for the default `ServiceMonitor` endpoint. |
| terminationGracePeriodSeconds | int | `nil` | Termination grace period for the pod in seconds. |
| tolerations | list | `[]` | Node taints which will be tolerated for pod scheduling. |
| updateStrategy | object | `{}` | Update strategy for the `DaemonSet`. |

----------------------------------------------

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs/).
