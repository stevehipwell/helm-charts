# snapshot-controller

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 8.2.0](https://img.shields.io/badge/AppVersion-8.2.0-informational?style=flat-square)

Helm chart for the External Snapshotter Snapshot Controller. The CSI snapshotter is part of Kubernetes implementation of Container Storage Interface (CSI) and implements both the volume snapshot and the volume group snapshot feature.

**Homepage:** <https://github.com/kubernetes-csi/external-snapshotter/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| stevehipwell | <steve.hipwell@gmail.com> |  |

## Source Code

* <https://github.com/kubernetes-csi/external-snapshotter/>
* <https://github.com/stevehipwell/helm-charts/>

## Installing the Chart

### OCI Repository

To install the chart using the recommended OCI method you can use the following command.

```shell
helm upgrade --install snapshot-controller oci://ghcr.io/stevehipwell/helm-charts/snapshot-controller --version 0.1.0
```

#### Verification

As the OCI chart release is signed by [Cosign](https://github.com/sigstore/cosign) you can verify the chart before installing it by running the following command.

```shell
cosign verify --certificate-oidc-issuer https://token.actions.githubusercontent.com --certificate-identity-regexp 'https://github\.com/action-stars/helm-workflows/\.github/workflows/release\.yaml@.+' --certificate-github-workflow-repository stevehipwell/helm-charts --certificate-github-workflow-name Release ghcr.io/stevehipwell/helm-charts/snapshot-controller:0.1.0
```

### Non-OCI Repository

Alternatively you can use the legacy non-OCI method via the following commands.

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
helm upgrade --install snapshot-controller stevehipwell/snapshot-controller --version 0.1.0
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for scheduling. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| commonLabels | object | `{}` | Labels to add to all chart resources. |
| distributedSnapshotting.enabled | bool | `false` | If `true`, enable distributed snapshotting. |
| extraArgs | list | `[]` | Additional args for the default container. |
| extraEnv | list | `[]` | Additional environment variables for the default container. |
| fullnameOverride | string | `nil` | Override the full name of the chart. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the default container. |
| image.repository | string | `"registry.k8s.io/sig-storage/snapshot-controller"` | Image repository for the default container. |
| image.tag | string | `nil` | Image tag for the default container; this will default to `.Chart.AppVersion` if not set. |
| imagePullSecrets | list | `[]` | Image pull secrets. |
| livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the default container; this only works where there are multiple replicas. |
| logLevel | int | `5` | Log level. |
| nameOverride | string | `nil` | Override the name of the chart. |
| nodeSelector | object | `{}` | Node selector labels for scheduling. |
| podAnnotations | object | `{}` | Annotations to add to the pod. |
| podDisruptionBudget.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget`. |
| podDisruptionBudget.maxUnavailable | string | `nil` | Minimum number of unavailable pods; either a number or a percentage. |
| podDisruptionBudget.minAvailable | string | `nil` | Minimum number of available pods; either a number or a percentage. |
| podDisruptionBudget.unhealthyPodEvictionPolicy | string | `nil` | Unhealthy pod eviction policy PDB. |
| podLabels | object | `{}` | Labels to add to the pod. |
| podSecurityContext | object | See _values.yaml_ | Security context for the pod. |
| priorityClassName | string | `nil` | Priority class name. |
| readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the default container; this only works where there are multiple replicas. |
| replicas | int | `1` | Number of replicas to create. |
| resources | object | `{}` | Resources for the default container. |
| retryCrdIntervalMax | int | `30` | Maximum interval between retries for CRD operations; in seconds. |
| securityContext | object | See _values.yaml_ | Security context for the default container. |
| service.annotations | object | `{}` | Annotations to add to the service. |
| service.labels | object | `{}` | Labels to add to the service. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount`. |
| serviceAccount.labels | object | `{}` | Labels to add to the service account. |
| serviceAccount.name | string | `nil` | If this is set and `serviceAccount.create` is `true` this will be used for the created `ServiceAccount` name, if set and `serviceAccount.create` is `false` then this will define an existing `ServiceAccount` to use. |
| serviceMonitor.additionalLabels | object | `{}` | Additional labels for the service monitor. |
| serviceMonitor.enabled | bool | `false` | If `true`, create a `ServiceMonitor` to support collecting metrics via the _Prometheus Operator_. |
| serviceMonitor.endpointConfig | object | `{}` | Additional endpoint configuration for the service monitor endpoint. |
| terminationGracePeriodSeconds | int | `nil` | Termination grace period; in seconds. |
| tolerations | list | `[]` | Node taints the pod will be tolerate for scheduling. |
| topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling. If an explicit label selector is not provided one will be created from the pod selector labels. |
| updateStrategy | object | `{}` | Update strategy. |

----------------------------------------------

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs/).
