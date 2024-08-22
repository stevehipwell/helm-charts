# vertical-pod-autoscaler

![Version: 1.7.1](https://img.shields.io/badge/Version-1.7.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.2.1](https://img.shields.io/badge/AppVersion-1.2.1-informational?style=flat-square)

The [Vertical Pod Autoscaler](https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscaler/) (VPA) frees the users from necessity of setting up-to-date resource limits and requests for the containers in their pods. When configured, it will set the requests automatically based on usage and thus allow proper scheduling onto nodes so that appropriate resource amount is available for each pod. It will also maintain ratios between limits and requests that were specified in initial containers configuration.

It can both down-scale pods that are over-requesting resources, and also up-scale pods that are under-requesting resources based on their usage over time.

Autoscaling is configured with a `CustomResourceDefinition` object called `VerticalPodAutoscaler`. It allows to specify which pods should be vertically autoscaled as well as if/how the resource recommendations are applied.

This chart manages the `MutatingWebhookConfiguration` outside of the workload so there is no need to run additional logic to clean-up after VPA is uninstalled, webhook certificates can also be managed by [Cert Manager](https://cert-manager.io/docs/). The chart handles the parameters for logging levels and ports but all other parameters need to be passed in to the components.

- [Recommender parameters](https://github.com/kubernetes/autoscaler/blob/master/vertical-pod-autoscaler/FAQ.md#what-are-the-parameters-to-vpa-recommender)
- [Updater parameters](https://github.com/kubernetes/autoscaler/blob/master/vertical-pod-autoscaler/FAQ.md#what-are-the-parameters-to-vpa-updater)

**Homepage:** <https://github.com/kubernetes/autoscaler/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| stevehipwell | <steve.hipwell@gmail.com> |  |

## Source Code

* <https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscaler/>
* <https://github.com/stevehipwell/helm-charts/>

## Installing the Chart

### OCI Repository

To install the chart using the recommended OCI method you can use the following command.

```shell
helm upgrade --install vertical-pod-autoscaler oci://ghcr.io/stevehipwell/helm-charts/vertical-pod-autoscaler --version 1.7.1
```

#### Verification

As the OCI chart release is signed by [Cosign](https://github.com/sigstore/cosign) you can verify the chart before installing it by running the following command.

```shell
cosign verify --certificate-oidc-issuer https://token.actions.githubusercontent.com --certificate-identity-regexp 'https://github\.com/action-stars/helm-workflows/\.github/workflows/release\.yaml@.+' --certificate-github-workflow-repository stevehipwell/helm-charts --certificate-github-workflow-name Release ghcr.io/stevehipwell/helm-charts/vertical-pod-autoscaler:1.7.1
```

### Non-OCI Repository

Alternatively you can use the legacy non-OCI method via the following commands.

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
helm upgrade --install vertical-pod-autoscaler stevehipwell/vertical-pod-autoscaler --version 1.7.1
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| admissionController.affinity | object | `{}` | Affinity settings for scheduling the _Admission Controller_ component. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| admissionController.certManager.enabled | bool | `false` | If `true`, create a `Certificate` resource for the _Admission Controller_ webhook. |
| admissionController.certManager.issuerKind | string | `"Issuer"` | `Issuer` kind for the _Admission Controller_ webhook certificate. |
| admissionController.certManager.issuerName | string | `nil` | `Issuer` name for the _Admission Controller_ webhook certificate; if not provided an `Issuer` will be created. |
| admissionController.extraArgs | list | `[]` | Additional args for the _Admission Controller_ default container. |
| admissionController.extraEnv | list | `[]` | Additional environment variables for the _Admission Controller_ default container. |
| admissionController.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the _Admission Controller_ default container. |
| admissionController.image.repository | string | `"registry.k8s.io/autoscaling/vpa-admission-controller"` | Image repository for the _Admission Controller_ default container. |
| admissionController.image.tag | string | `nil` | Image tag for the _Admission Controller_ default container; this will default to `.Chart.AppVersion` if not set. |
| admissionController.livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the _Admission Controller_ default container. |
| admissionController.nodeSelector | object | `{}` | Node selector labels for scheduling the _Admission Controller_. |
| admissionController.podAnnotations | object | `{}` | Annotations to add to the _Admission Controller_ pod. |
| admissionController.podDisruptionBudget.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` for the _Admission Controller_. |
| admissionController.podDisruptionBudget.maxUnavailable | string | `nil` | Minimum number of unavailable pods for the _Admission Controller_; either a number or a percentage. |
| admissionController.podDisruptionBudget.minAvailable | string | `nil` | Minimum number of available pods for the _Admission Controller_; either a number or a percentage. |
| admissionController.podDisruptionBudget.unhealthyPodEvictionPolicy | string | `nil` | Unhealthy pod eviction policy for the _Admission Controller_ PDB. |
| admissionController.podLabels | object | `{}` | Labels to add to the _Admission Controller_ pod. |
| admissionController.podSecurityContext | object | See _values.yaml_ | Security context for the _Admission Controller_ pod. |
| admissionController.priorityClassName | string | `nil` | Priority class name for the _Admission Controller_. |
| admissionController.readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the _Admission Controller_ default container. |
| admissionController.replicas | int | `1` | Number of _Admission Controller_ replicas to create. |
| admissionController.resources | object | `{}` | Resources for the _Admission Controller_ default container. |
| admissionController.securityContext | object | See _values.yaml_ | Security context for the _Admission Controller_ default container. |
| admissionController.service.annotations | object | `{}` | Annotations to add to the _Admission Controller_ service. |
| admissionController.serviceAccount.annotations | object | `{}` | Annotations to add to the _Admission Controller_ service account. |
| admissionController.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the _Admission Controller_. |
| admissionController.serviceAccount.labels | object | `{}` | Labels to add to the _Admission Controller_ service account. |
| admissionController.serviceAccount.name | string | `nil` | If this is set and `admissionController.serviceAccount.create` is `true` this will be used for the created _Admission Controller_ service account name, if this is set and `admissionController.serviceAccount.create` is `false` then this will define an existing service account to use. |
| admissionController.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the _Admission Controller_; in seconds. |
| admissionController.tolerations | list | `[]` | Node taints the _Admission Controller_ will be tolerate for scheduling. |
| admissionController.topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling for the _Admission Controller_ component. If an explicit label selector is not provided one will be created from the pod selector labels. |
| admissionController.updateStrategy | object | `{}` | Update strategy for the _Admission Controller_. |
| admissionController.webhook.name | string | `"vpa-webhook-config"` | Name of the _Admission Controller_ webhook to create. |
| commonLabels | object | `{}` | Labels to add to all chart resources. |
| fullnameOverride | string | `nil` | Override the full name of the chart. |
| imagePullSecrets | list | `[]` | Image pull secrets. |
| logLevel | int | `4` | Log level for all components. |
| nameOverride | string | `nil` | Override the name of the chart. |
| rbac.create | bool | `true` | If `true`, create `ClusterRole` & `ClusterRoleBinding` resources to enable access to the Kubernetes API. |
| recommender.affinity | object | `{}` | Affinity settings for scheduling the _Recommender_ component. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| recommender.extraArgs | list | `[]` | Additional args for the _Recommender_ default container. |
| recommender.extraEnv | list | `[]` | Additional environment variables for the _Recommender_ default container. |
| recommender.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the _Recommender_ default container. |
| recommender.image.repository | string | `"registry.k8s.io/autoscaling/vpa-recommender"` | Image repository for the _Recommender_ default container. |
| recommender.image.tag | string | `nil` | Image tag for the _Recommender_ default container; this will default to `.Chart.AppVersion` if not set. |
| recommender.livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the _Recommender_ default container. |
| recommender.nodeSelector | object | `{}` | Node selector labels for scheduling the _Recommender_. |
| recommender.podAnnotations | object | `{}` | Annotations to add to the _Recommender_ pod. |
| recommender.podDisruptionBudget.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` for the _Recommender_. |
| recommender.podDisruptionBudget.maxUnavailable | string | `nil` | Minimum number of unavailable pods for the _Recommender_; either a number or a percentage. |
| recommender.podDisruptionBudget.minAvailable | string | `nil` | Minimum number of available pods for the _Recommender_; either a number or a percentage. |
| recommender.podDisruptionBudget.unhealthyPodEvictionPolicy | string | `nil` | Unhealthy pod eviction policy for the _Recommender_ PDB. |
| recommender.podLabels | object | `{}` | Labels to add to the _Recommender_ pod. |
| recommender.podSecurityContext | object | See _values.yaml_ | Security context for the _Recommender_ pod. |
| recommender.priorityClassName | string | `nil` | Priority class name for the _Recommender_. |
| recommender.readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the _Recommender_ default container. |
| recommender.replicas | int | `1` | Number of _Recommender_ replicas to create. |
| recommender.resources | object | `{}` | Resources for the _Recommender_ default container. |
| recommender.securityContext | object | See _values.yaml_ | Security context for the _Recommender_ default container. |
| recommender.service.annotations | object | `{}` | Annotations to add to the _Recommender_ service. |
| recommender.serviceAccount.annotations | object | `{}` | Annotations to add to the _Recommender_ service account. |
| recommender.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the _Recommender_. |
| recommender.serviceAccount.labels | object | `{}` | Labels to add to the _Recommender_ service account. |
| recommender.serviceAccount.name | string | `nil` | If this is set and `admissionController.serviceAccount.create` is `true` this will be used for the created _Recommender_ service account name, if this is set and `admissionController.serviceAccount.create` is `false` then this will define an existing service account to use. |
| recommender.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the _Recommender_; in seconds. |
| recommender.tolerations | list | `[]` | Node taints the _Recommender_ will be tolerate for scheduling. |
| recommender.topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling for the _Recommender_ component. If an explicit label selector is not provided one will be created from the pod selector labels. |
| recommender.updateStrategy | object | `{}` | Update strategy for the _Recommender_. |
| recommenderOnly | bool | `false` | If `true`, only deploy the _Recommender_ component. |
| serviceMonitor.additionalLabels | object | `{}` | Additional labels for the service monitor. |
| serviceMonitor.enabled | bool | `false` | If `true`, create a `ServiceMonitor` to support collecting metrics via the _Prometheus Operator_. |
| serviceMonitor.endpointConfig | object | `{}` | Additional endpoint configuration for the service monitor endpoint. |
| updater.affinity | object | `{}` | Affinity settings for scheduling the _Updater_ component. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| updater.extraArgs | list | `[]` | Additional args for the _Updater_ default container. |
| updater.extraEnv | list | `[]` | Additional environment variables for the _Updater_ default container. |
| updater.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the _Updater_ default container. |
| updater.image.repository | string | `"registry.k8s.io/autoscaling/vpa-updater"` | Image repository for the _Updater_ default container. |
| updater.image.tag | string | `nil` | Image tag for the _Updater_ default container; this will default to `.Chart.AppVersion` if not set. |
| updater.livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the _Updater_ default container. |
| updater.nodeSelector | object | `{}` | Node selector labels for scheduling the _Updater_. |
| updater.podAnnotations | object | `{}` | Annotations to add to the _Updater_ pod. |
| updater.podDisruptionBudget.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` for the _Updater_. |
| updater.podDisruptionBudget.maxUnavailable | string | `nil` | Minimum number of unavailable pods for the _Updater_; either a number or a percentage. |
| updater.podDisruptionBudget.minAvailable | string | `nil` | Minimum number of available pods for the _Updater_; either a number or a percentage. |
| updater.podDisruptionBudget.unhealthyPodEvictionPolicy | string | `nil` | Unhealthy pod eviction policy for the _Updater_ PDB. |
| updater.podLabels | object | `{}` | Labels to add to the _Updater_ pod. |
| updater.podSecurityContext | object | See _values.yaml_ | Security context for the _Updater_ pod. |
| updater.priorityClassName | string | `nil` | Priority class name for the _Updater_. |
| updater.readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the _Updater_ default container. |
| updater.replicas | int | `1` | Number of _Updater_ replicas to create. |
| updater.resources | object | `{}` | Resources for the _Updater_ default container. |
| updater.securityContext | object | See _values.yaml_ | Security context for the _Updater_ default container. |
| updater.service.annotations | object | `{}` | Annotations to add to the _Updater_ service. |
| updater.serviceAccount.annotations | object | `{}` | Annotations to add to the _Updater_ service account. |
| updater.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the _Updater_. |
| updater.serviceAccount.labels | object | `{}` | Labels to add to the _Updater_ service account. |
| updater.serviceAccount.name | string | `nil` | If this is set and `admissionController.serviceAccount.create` is `true` this will be used for the created _Updater_ service account name, if this is set and `admissionController.serviceAccount.create` is `false` then this will define an existing service account to use. |
| updater.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the _Updater_; in seconds. |
| updater.tolerations | list | `[]` | Node taints the _Updater_ will be tolerate for scheduling. |
| updater.topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling for the _Updater_ component. If an explicit label selector is not provided one will be created from the pod selector labels. |
| updater.updateStrategy | object | `{}` | Update strategy for the _Updater_. |

----------------------------------------------

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs/).
