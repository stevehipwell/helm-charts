# overprovisioner

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.3.0](https://img.shields.io/badge/AppVersion-0.3.0-informational?style=flat-square)

Helm chart for overprovisioning Kubernetes clusters.

**Homepage:** <https://github.com/stevehipwell/helm-charts/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| stevehipwell | <steve.hipwell@gmail.com> |  |

## Source Code

* <https://github.com/stevehipwell/helm-charts/>

## Installing the Chart

### OCI Repository

To install the chart using the recommended OCI method you can use the following command.

```shell
helm upgrade --install overprovisioner oci://ghcr.io/stevehipwell/helm-charts/overprovisioner --version 0.3.0
```

#### Verification

As the OCI chart release is signed by [Cosign](https://github.com/sigstore/cosign) you can verify the chart before installing it by running the following command.

```shell
cosign verify --certificate-oidc-issuer https://token.actions.githubusercontent.com --certificate-identity-regexp 'https://github\.com/action-stars/helm-workflows/\.github/workflows/release\.yaml@.+' --certificate-github-workflow-repository stevehipwell/helm-charts --certificate-github-workflow-name Release ghcr.io/stevehipwell/helm-charts/overprovisioner:0.3.0
```

### Non-OCI Repository

Alternatively you can use the legacy non-OCI method via the following commands.

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
helm upgrade --install overprovisioner stevehipwell/overprovisioner --version 0.3.0
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| autoscaler.affinity | object | `{}` | Affinity settings for scheduling the _Autoscaler_ component. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| autoscaler.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the _Autoscaler_ component default container. |
| autoscaler.image.repository | string | `"registry.k8s.io/cpa/cluster-proportional-autoscaler"` | Image repository for the _Autoscaler_ component default container. |
| autoscaler.image.tag | string | `"v1.8.9"` | Image tag for the _Autoscaler_ component default container. |
| autoscaler.logLevel | int | `2` | Log level for the _Autoscaler_ component. |
| autoscaler.nodeSelector | object | `{}` | Node selector labels for scheduling the _Autoscaler_ component. |
| autoscaler.podAnnotations | object | `{}` | Annotations to add to the _Autoscaler_ pod. |
| autoscaler.podLabels | object | `{}` | Labels to add to the _Autoscaler_ pod. |
| autoscaler.podSecurityContext | object | See _values.yaml_ | Security context for the _Autoscaler_ pod. |
| autoscaler.priorityClassName | string | `nil` | Priority class name for the _Autoscaler_ pod. |
| autoscaler.resources | object | `{}` | Resources for the _Autoscaler_ component default container. |
| autoscaler.securityContext | object | See _values.yaml_ | Security context for the _Autoscaler_ component default container. |
| autoscaler.serviceAccount.annotations | object | `{}` | Annotations to add to the _Autoscaler_ service account. |
| autoscaler.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the _Autoscaler_ component. |
| autoscaler.serviceAccount.labels | object | `{}` | Labels to add to the _Autoscaler_ service account. |
| autoscaler.serviceAccount.name | string | `nil` | If this is set and `pause.serviceAccount.create` is `true` this will be used for the created _Autoscaler_ service account name, if this is set and `pause.serviceAccount.create` is `false` then this will define an existing service account to use. |
| autoscaler.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the _Autoscaler_ pod; in seconds. |
| autoscaler.tolerations | list | `[]` | Node taints the _Autoscaler_ component will tolerate for scheduling. |
| autoscaler.topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling for the _Autoscaler_ component. If an explicit label selector is not provided one will be created from the pod selector labels. |
| capacity.auto.coresPerReplica | int | `4` | Number of pause pod replicas to create per cluster core; if `capacity.mode` is `auto`. |
| capacity.auto.maxReplicas | int | `1` | Maximum number of pause pod replicas to create; if `capacity.mode` is `auto`. |
| capacity.auto.minReplicas | int | `1` | Minimum number of pause pod replicas to create; if `capacity.mode` is `auto`. |
| capacity.auto.nodesPerReplica | int | `1` | Number of pause pod replicas to create per cluster node; if `capacity.mode` is `auto`. |
| capacity.fixed.replicas | int | `1` | Number of pause pod replicas to create; if `capacity.mode` is `fixed`. |
| capacity.mode | string | `"fixed"` | Capacity mode to use; one of `fixed` or `auto`. If `auto` is used, a [cluster-proportional-autoscaler](https://github.com/kubernetes-sigs/cluster-proportional-autoscaler) deployment will be used to scale the pause pods |
| capacity.resources | object | `{}` | map of resources |
| commonLabels | object | `{}` | Labels to add to all chart resources. |
| fullnameOverride | string | `nil` | Override the full name of the chart. |
| imagePullSecrets | list | `[]` | Image pull secrets. |
| nameOverride | string | `nil` | Override the name of the chart. |
| pause.affinity | object | `{}` | Affinity settings for scheduling the _Pause_ component. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| pause.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the _Pause_ component default container. |
| pause.image.repository | string | `"registry.k8s.io/pause"` | Image repository for the _Pause_ component default container. |
| pause.image.tag | float | `3.9` | Image tag for the _Pause_ component default container. |
| pause.nodeSelector | object | `{}` | Node selector labels for scheduling the _Pause_ component. |
| pause.podAnnotations | object | `{}` | Annotations to add to the _Pause_ pod. |
| pause.podLabels | object | `{}` | Labels to add to the _Pause_ pod. |
| pause.serviceAccount.annotations | object | `{}` | Annotations to add to the _Pause_ service account. |
| pause.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the _Pause_ component. |
| pause.serviceAccount.labels | object | `{}` | Labels to add to the _Pause_ service account. |
| pause.serviceAccount.name | string | `nil` | If this is set and `pause.serviceAccount.create` is `true` this will be used for the created _Pause_ service account name, if this is set and `pause.serviceAccount.create` is `false` then this will define an existing service account to use. |
| pause.tolerations | list | `[]` | Node taints the _Pause_ component will tolerate for scheduling. |
| pause.topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling for the _Pause_ component. If an explicit label selector is not provided one will be created from the pod selector labels. |
| priorityClass.annotations | object | `{}` | Annotations to add to the priority class. |
| priorityClass.create | bool | `true` | If `true`, create a new preemptible `PriorityClass`. |
| priorityClass.labels | object | `{}` | Labels to add to the priority class. |
| priorityClass.name | string | `nil` | If this is set and `priorityClass.create` is `true` this will be used for the created priority class name, if set and `priorityClass.create` is `false` then this will define an existing priority class to use. |
| priorityClass.value | int | `-1` | Value for the priority class. |

----------------------------------------------

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs/).
