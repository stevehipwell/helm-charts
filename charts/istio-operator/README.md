# istio-operator

![Version: 2.15.3](https://img.shields.io/badge/Version-2.15.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.22.3](https://img.shields.io/badge/AppVersion-1.22.3-informational?style=flat-square)

The [Istio Operator](https://istio.io/latest/docs/setup/install/operator/) provides a declarative _Kubernetes_ native way to manage [Istio](https://istio.io/) via `IstioOperator` custom resources.

[Istio](https://istio.io/) extends Kubernetes to establish a programmable, application-aware network using the powerful _Envoy_ service proxy. Working with both _Kubernetes_ and traditional workloads, _Istio_ brings standard, universal traffic management, telemetry, and security to complex deployments.

**Homepage:** <https://istio.io/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| stevehipwell | <steve.hipwell@gmail.com> |  |

## Source Code

* <https://github.com/istio/istio/tree/master/operator>
* <https://github.com/stevehipwell/helm-charts/>

## Installing the Chart

### OCI Repository

To install the chart using the recommended OCI method you can use the following command.

```shell
helm upgrade --install istio-operator oci://ghcr.io/stevehipwell/helm-charts/istio-operator --version 2.15.3
```

#### Verification

As the OCI chart release is signed by [Cosign](https://github.com/sigstore/cosign) you can verify the chart before installing it by running the following command.

```shell
cosign verify --certificate-oidc-issuer https://token.actions.githubusercontent.com --certificate-identity-regexp 'https://github\.com/action-stars/helm-workflows/\.github/workflows/release\.yaml@.+' --certificate-github-workflow-repository stevehipwell/helm-charts --certificate-github-workflow-name Release ghcr.io/stevehipwell/helm-charts/istio-operator:2.15.3
```

### Non-OCI Repository

Alternatively you can use the legacy non-OCI method via the following commands.

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
helm upgrade --install istio-operator stevehipwell/istio-operator --version 2.15.3
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for pod scheduling. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| commonLabels | object | `{}` | Labels to add to all chart resources. |
| controlPlane.annotations | object | `{}` | Annotations to add to the `IstioOperator` CR. |
| controlPlane.install | bool | `false` | If `true`, install the _Istio_ control plane. |
| controlPlane.spec | object | `{}` | Spec for the `IstioOperator` CR. |
| dashboards.enabled | bool | `false` | If `true`, install the _Grafana_ dashboards provided by the chart. |
| fullnameOverride | string | `nil` | Override the full name of the chart. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the default container. |
| image.pullSecrets | list | `[]` | Image pull secrets (DEPRECATED). |
| image.repository | string | `"docker.io/istio/operator"` | Image repository for the default container. |
| image.tag | string | `nil` | Image tag for the default container, this will default to `.Chart.AppVersion` if not set and will be omitted if set to `-`. |
| imagePullSecrets | list | `[]` | Image pull secrets. |
| istioNamespace | string | `"istio-system"` | Namespace to install _Istio_ into. |
| nameOverride | string | `nil` | Override the name of the chart. |
| nodeSelector | object | `{}` | Node labels to match for pod scheduling. |
| podAnnotations | object | `{}` | Annotations to add to the pod. |
| podLabels | object | `{}` | Labels to add to the pod. |
| podSecurityContext | object | See _values.yaml_ | Security context for the pod. |
| priorityClassName | string | `nil` | Priority class name for the pod. |
| rbac.create | bool | `true` | If `true`, create a `ClusterRole` & `ClusterRoleBinding` with access to the Kubernetes API. |
| resources | object | `{}` | Resources for the default container. |
| revision | string | `nil` | The control plane revision, if required. |
| securityContext | object | See _values.yaml_ | Security context for the default container. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount`. |
| serviceAccount.labels | object | `{}` | Labels to add to the service account. |
| serviceAccount.name | string | `nil` | If this is set and `serviceAccount.create` is `true` this will be used for the created `ServiceAccount` name, if set and `serviceAccount.create` is `false` then this will define an existing `ServiceAccount` to use. |
| serviceMonitor.additionalLabels | object | `{}` | Additional labels for the `ServiceMonitor`. |
| serviceMonitor.enabled | bool | `false` | If `true`, create a `ServiceMonitor` resource to support the _Prometheus Operator_. |
| serviceMonitor.endpointConfig | object | `{}` | Additional endpoint configuration for the default `ServiceMonitor` endpoint. |
| serviceMonitor.interval | int | `nil` | _Prometheus_ scrape interval (DEPRECATED). |
| terminationGracePeriodSeconds | int | `nil` | Termination grace period for the pod in seconds. |
| tolerations | list | `[]` | Node taints which will be tolerated for pod scheduling. |
| topologySpreadConstraints | list | `[]` | Topology spread constraints for pod scheduling. If an explicit label selector is not provided one will be created from the pod selector labels. |
| waitForResourcesTimeout | string | `"300s"` | Period to wait for resources before timing out. |

----------------------------------------------

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs/).
