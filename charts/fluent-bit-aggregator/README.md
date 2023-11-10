# fluent-bit-aggregator

![Version: 0.10.0](https://img.shields.io/badge/Version-0.10.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.1.10](https://img.shields.io/badge/AppVersion-2.1.10-informational?style=flat-square)

Helm chart for Fluent Bit running as an aggregation stateful set.

**Homepage:** <https://fluentbit.io/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| stevehipwell | <steve.hipwell@gmail.com> | <https://github.com/stevehipwell> |

## Source Code

* <https://github.com/fluent/fluent-bit/>
* <https://github.com/stevehipwell/helm-charts/>

## Installing the Chart

To install the chart using the recommended OCI method you can use the following command.

```shell
helm upgrade --install fluent-bit-aggregator oci://ghcr.io/stevehipwell/helm-charts/fluent-bit-aggregator --version 0.10.0
```

Alternativly you can use the legacy non-OCI method via the following commands.

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
helm upgrade --install fluent-bit-aggregator stevehipwell/fluent-bit-aggregator --version 0.10.0
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for pod scheduling. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| args | list | `[]` | Extra args for the default container; `--workdir`, `--config` & `--enable-hot-reload` are managed by the chart. |
| autoscaling.behavior | object | `{}` | Behaviour configuration for the `HorizontalPodAutoscaler`. |
| autoscaling.enabled | bool | `false` | If `true`, create a `HorizontalPodAutoscaler` to scale the `StatefulSet`. |
| autoscaling.maxReplicas | int | `3` | Maximum number of replicas for the `HorizontalPodAutoscaler`. |
| autoscaling.metrics | list | `[]` | Metrics configuration for the `HorizontalPodAutoscaler`. |
| autoscaling.minReplicas | int | `1` | Minimum number of replicas for the `HorizontalPodAutoscaler`. |
| command | list | `["/fluent-bit/bin/fluent-bit"]` | Command for the default container |
| commonLabels | object | `{}` | Labels to add to all chart resources. |
| config.customParsers | string | `nil` | Custom parsers to configure. |
| config.extraFiles | object | `{}` | Extra files to mount to /fluent-bit/etc |
| config.luaScripts | object | `{}` | Lua scripts to configure, these will be created at /fluent-bit/scripts and need to be referenced by an absolute path. |
| config.pipeline | string | See _values.yaml_ | Fluent Bit pipeline configuration. |
| config.service | object | See _values.yaml_ | Fluent Bit service configuration. |
| config.storage.enabled | bool | `true` | If `true`, writeable host filesystem storage will be enabled. |
| config.storage.metrics | bool | `true` | If `true`, storage metrics will be enabled if storage is enabled. |
| dashboards.enabled | bool | `false` | If `true`, install the _Grafana_ dashboards provided by the chart. |
| env | list | `[]` | Environment variables for the default container. |
| extraVolumeMounts | list | `[]` | Extra volume mounts for the default container. |
| extraVolumes | list | `[]` | Extra volumes for the pod. |
| fullnameOverride | string | `nil` | Override the full name of the chart. |
| hotReload.enabled | bool | `false` | If `true`, enable [hot-reload](https://docs.fluentbit.io/manual/administration/hot-reload) via a sidecar container. |
| hotReload.image.digest | string | `nil` | Optional image digest for the hot-reload sidecar container. |
| hotReload.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the hot-reload sidecar container. |
| hotReload.image.repository | string | `"cgr.dev/chainguard/configmap-reload"` | Image repository for the hot-reload sidecar container. |
| hotReload.image.tag | string | `"latest"` | Image tag for the hot-reload sidecar container. |
| hotReload.resources | object | `{}` | Resources for the hot-reload sidecar container. |
| image.digest | string | `nil` | Optional image digest for the default container. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the default container. |
| image.repository | string | `"cr.fluentbit.io/fluent/fluent-bit"` | Image repository for the default container. |
| image.tag | string | `nil` | Image tag for the default container, this will default to `.Chart.AppVersion` if not set and will be omitted if set to `-`. |
| imagePullSecrets | list | `[]` | Image pull secrets. |
| ingresses | list | `[]` | Ingresses, each input plugin will need it's own. |
| livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the default container. |
| minReadySeconds | string | `nil` | Min ready seconds for the `StatefulSet`. |
| nameOverride | string | `nil` | Override the name of the chart. |
| nodeSelector | object | `{}` | Node labels to match for pod scheduling. |
| ordinals | object | `{}` | Ordinals configuration for the `StatefulSet`. |
| persistence.accessMode | string | `"ReadWriteOnce"` | Access mode for the `PersistentVolumeClaim`. |
| persistence.annotations | object | `{}` | Annotations for the `PersistentVolumeClaim`. |
| persistence.enabled | bool | `false` | If `true`, persistence should be enabled for the `StatefulSet`. |
| persistence.retainDeleted | bool | `true` | If `true`, keep `PersistentVolumeClaims` when the `StatefulSet` is deleted. |
| persistence.retainScaled | bool | `true` | If `true`, keep `PersistentVolumeClaim` when the `StatefulSet` is scaled down. |
| persistence.size | string | `"8Gi"` | Size of the `PersistentVolumeClaim`. |
| persistence.storageClass | string | `nil` | Storage class for the `PersistentVolumeClaim`, if not set the default will be used. |
| podAnnotations | object | `{}` | Annotations to add to the pod. |
| podDisruptionBudget.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` resource. |
| podDisruptionBudget.maxUnavailable | string | `nil` | Minimum number of unavailable pods, either a number or a percentage. |
| podDisruptionBudget.minAvailable | string | `nil` | Minimum number of available pods, either a number or a percentage. |
| podLabels | object | `{}` | Labels to add to the pod. |
| podManagementPolicy | string | `nil` | Pod management policy for the `StatefulSet`. |
| podSecurityContext | object | See _values.yaml_ | Security context for the pod. |
| priorityClassName | string | `nil` | Priority class name for the pod. |
| rbac.additionalRules | list | `[]` | Additional rules to add to the `ClusterRole`. |
| rbac.create | bool | `false` | If `true`, create a `ClusterRole` & `ClusterRoleBinding` with access to the Kubernetes API. |
| readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the default container. |
| replicas | int | `1` | Number of replicas to create if `autoscalling.enabled` is `false`. |
| resources | object | `{}` | Resources for the default container. |
| securityContext | object | See _values.yaml_ | Security context for the default container. |
| service.additionalPorts | list | See _values.yaml_ | Additional ports to expose. |
| service.annotations | object | `{}` | Service annotations. |
| service.httpPort | int | `2020` | Fluent Bit HTTP port used for status and metrics. |
| service.type | string | `"ClusterIP"` | Service type. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| serviceAccount.automountToken | bool | `false` | If `true`, mount the `ServiceAccount` token. |
| serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount`. |
| serviceAccount.labels | object | `{}` | Labels to add to the service account. |
| serviceAccount.name | string | `nil` | If this is set and `serviceAccount.create` is `true` this will be used for the created `ServiceAccount` name, if set and `serviceAccount.create` is `false` then this will define an existing `ServiceAccount` to use. |
| serviceMonitor.additionalEndpoints | list | `[]` | Additional `ServiceMonitor`endpoints, these are needed for metrics output plugins. |
| serviceMonitor.additionalLabels | object | `{}` | Additional labels for the `ServiceMonitor`. |
| serviceMonitor.enabled | bool | `false` | If `true`, create a `ServiceMonitor` resource to support the _Prometheus Operator_. |
| serviceMonitor.endpointConfig | object | `{}` | Additional endpoint configuration for the default `ServiceMonitor` endpoint. |
| terminationGracePeriodSeconds | string | `nil` | Termination grace period for the pod in seconds. |
| tolerations | list | `[]` | Node taints which will be tolerated for pod scheduling. |
| topologySpreadConstraints | list | `[]` | Topology spread constraints for pod scheduling. If an explicit label selector is not provided one will be created from the pod selector labels. |
| updateStrategy | object | `{}` | Update strategy for the `StatefulSet`. |

----------------------------------------------

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs/).
