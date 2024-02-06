# plantuml

![Version: 3.27.0](https://img.shields.io/badge/Version-3.27.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.2023.13](https://img.shields.io/badge/AppVersion-1.2023.13-informational?style=flat-square)

Helm chart for PlantUML Server, a web application to generate UML diagrams on-the-fly.

**Homepage:** <https://plantuml.com/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| stevehipwell | <steve.hipwell@gmail.com> |  |

## Source Code

* <https://github.com/plantuml/plantuml-server/>
* <https://github.com/stevehipwell/helm-charts/>

## Installing the Chart

### OCI Repository

To install the chart using the recommended OCI method you can use the following command.

```shell
helm upgrade --install plantuml oci://ghcr.io/stevehipwell/helm-charts/plantuml --version 3.27.0
```

#### Verification

As the OCI chart release is signed by [Cosign](https://github.com/sigstore/cosign) you can verify the chart before installing it by running the following command.

```shell
cosign verify --certificate-oidc-issuer https://token.actions.githubusercontent.com --certificate-identity-regexp 'https://github\.com/action-stars/helm-workflows/\.github/workflows/release\.yaml@.+' --certificate-github-workflow-repository stevehipwell/helm-charts --certificate-github-workflow-name Release ghcr.io/stevehipwell/helm-charts/oci://ghcr.io/stevehipwell/helm-charts/plantuml:3.27.0
```

### Non-OCI Repository

Alternatively you can use the legacy non-OCI method via the following commands.

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
helm upgrade --install plantuml stevehipwell/plantuml --version 3.27.0
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for pod scheduling. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| args | list | `[]` | Args for the default container. |
| autoscaling.behavior | object | `{}` | Behaviour configuration for the `HorizontalPodAutoscaler`. |
| autoscaling.enabled | bool | `false` | If `true`, create a `HorizontalPodAutoscaler` to scale the `StatefulSet`. |
| autoscaling.maxReplicas | int | `3` | Maximum number of replicas for the `HorizontalPodAutoscaler`. |
| autoscaling.metrics | list | See _values.yaml_ | Metrics configuration for the `HorizontalPodAutoscaler`. |
| autoscaling.minReplicas | int | `1` | Minimum number of replicas for the `HorizontalPodAutoscaler`. |
| autoscaling.targetCPUUtilizationPercentage | int | `80` | Target average CPU utilization percentage (**DEPRECATED**). |
| autoscaling.targetMemoryUtilizationPercentage | int | `nil` | Target average memory utilization percentage (**DEPRECATED**). |
| caCerts.enabled | bool | `false` | If `true`, configure the JVM CA certificates from the provided secret. |
| caCerts.secret | string | `nil` | Name of the secret containing the CA certificates. |
| commonLabels | object | `{}` | Labels to add to all chart resources. |
| env | list | `[]` | Environment variables for the default container. |
| fullnameOverride | string | `nil` | Override the full name of the chart. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the default container. |
| image.pullSecrets | list | `[]` | Image pull secrets (**DEPRECATED**). |
| image.repository | string | `"plantuml/plantuml-server"` | Image repository for the default container. |
| image.tag | string | `nil` | Image tag for the default container, this will default to `jetty-v{{ .Chart.AppVersion }}` if not set. |
| imagePullSecrets | list | `[]` | Image pull secrets. |
| ingress.annotations | object | `{}` | Ingress annotations. |
| ingress.enabled | bool | `false` | If `true`, create an `Ingress` resource. |
| ingress.hosts | list | See _values.yaml_ | Ingress hosts. |
| ingress.ingressClassName | string | `nil` | Ingress class name. |
| ingress.tls | list | See _values.yaml_ | Ingress TLS. |
| livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the default container. |
| maxUnavailable | int | `0` | If set greater than `0` and `podDisruptionBudget.enabled` is `false`, create a `PodDisruptionBudget` resource (**DEPRECATED**). |
| nameOverride | string | `nil` | Override the name of the chart. |
| nodeSelector | object | `{}` | Node labels to match for pod scheduling. |
| podAnnotations | object | `{}` | Annotations to add to the pod. |
| podDisruptionBudget.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` resource. |
| podDisruptionBudget.maxUnavailable | string | `nil` | Minimum number of unavailable pods, either a number or a percentage. |
| podDisruptionBudget.minAvailable | string | `nil` | Minimum number of available pods, either a number or a percentage. |
| podLabels | object | `{}` | Labels to add to the pod. |
| podSecurityContext | object | See _values.yaml_ | Security context for the pod. |
| priorityClassName | string | `nil` | Priority class name for the pod. |
| readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the default container. |
| replicaCount | int | `1` | Number of replicas to create if `autoscaling.enabled` is `false`. |
| resources | object | `{}` | Resources for the default container. |
| securityContext | object | See _values.yaml_ | Security context for the default container. |
| service.annotations | object | `{}` | Service annotations. |
| service.port | int | `80` | Service HTTP port. |
| service.type | string | `"ClusterIP"` | Service type. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| serviceAccount.automountToken | bool | `false` | If `true`, mount the `ServiceAccount` token. |
| serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount`. |
| serviceAccount.labels | object | `{}` | Labels to add to the service account. |
| serviceAccount.name | string | `nil` | If this is set and `serviceAccount.create` is `true` this will be used for the created `ServiceAccount` name, if set and `serviceAccount.create` is `false` then this will define an existing `ServiceAccount` to use. |
| terminationGracePeriodSeconds | int | `nil` | Termination grace period for the pod in seconds. |
| tolerations | list | `[]` | Node taints which will be tolerated for pod scheduling. |
| topologySpreadConstraints | list | `[]` | Topology spread constraints for pod scheduling. If an explicit label selector is not provided one will be created from the pod selector labels. |

----------------------------------------------

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs/).
