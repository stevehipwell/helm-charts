# tigera-operator

![Version: 2.12.5](https://img.shields.io/badge/Version-2.12.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.38.6](https://img.shields.io/badge/AppVersion-1.38.6-informational?style=flat-square)

The [Tigera Operator](https://www.tigera.io/) is a Kubernetes operator which manages the lifecycle of a [Calico](https://www.tigera.io/project-calico/) or [Calico Enterprise](https://www.tigera.io/tigera-products/calico-enterprise/) installation on Kubernetes. Its goal is to make installation, upgrades, and ongoing lifecycle management of _Calico_ and _Calico Enterprise_ as simple and reliable as possible.

It is possible to use the _Tigera Operator_ for other use-cases by installing additional CRDs and adding custom RBAC rules via `rbac.customRules`.

**Homepage:** <https://www.tigera.io/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| stevehipwell | <steve.hipwell@gmail.com> |  |

## Source Code

* <https://github.com/tigera/operator>
* <https://github.com/projectcalico/calico>
* <https://github.com/stevehipwell/helm-charts/>

## Installing the Chart

### OCI Repository

To install the chart using the recommended OCI method you can use the following command.

```shell
helm upgrade --install tigera-operator oci://ghcr.io/stevehipwell/helm-charts/tigera-operator --version 2.12.5
```

#### Verification

As the OCI chart release is signed by [Cosign](https://github.com/sigstore/cosign) you can verify the chart before installing it by running the following command.

```shell
cosign verify --certificate-oidc-issuer https://token.actions.githubusercontent.com --certificate-identity-regexp 'https://github\.com/action-stars/helm-workflows/\.github/workflows/release\.yaml@.+' --certificate-github-workflow-repository stevehipwell/helm-charts --certificate-github-workflow-name Release ghcr.io/stevehipwell/helm-charts/tigera-operator:2.12.5
```

### Non-OCI Repository

Alternatively you can use the legacy non-OCI method via the following commands.

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
helm upgrade --install tigera-operator stevehipwell/tigera-operator --version 2.12.5
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for scheduling. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| apiServer.enabled | bool | `false` | If `true`, install an `APIServer` control plane according to the `apiServer.spec`. |
| apiServer.spec | object | `{}` | [APIServer Spec](https://projectcalico.docs.tigera.io/maintenance/install-apiserver) to enable kubectl to manage _Calico_ APIs. |
| args | list | `[]` | Extra args for the default container. |
| commonLabels | object | `{}` | Labels to add to all chart resources. |
| dnsPolicy | string | `"ClusterFirstWithHostNet"` | Pod DNS policy. |
| env | list | `[]` | Environment variables for the default container. |
| envFrom | list | `[]` | **DEPRECATED** - Environment variables from a config map or secret for the default container. |
| fullnameOverride | string | `nil` | Override the full name of the chart. |
| goldmane.enabled | bool | `false` | If `true`, install a `Goldmane` flow aggregator according to the `goldmane.spec`. |
| goldmane.spec | object | `{}` | [Goldmane Spec](https://docs.tigera.io/calico/latest/observability/enable-whisker#enable-the-flow-logs-api) to enable flow aggregation. |
| hostNetwork | bool | `true` | If `true`, the pod will use the host network namespace. This can be set to `false` if _Calico_ is not the CNI. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the default container. |
| image.repository | string | `"quay.io/tigera/operator"` | Image repository for the default container. |
| image.tag | string | `nil` | Image tag for the default container, this will default to `printf "v%s" .Chart.AppVersion` if not set. |
| imagePullSecrets | list | `[]` | Image pull secrets. |
| installation.enabled | bool | `false` | If `true`, install a _Calico_ control plane according to the `installation.spec` value. |
| installation.spec | object | `{"registry":"quay.io/","variant":"Calico"}` | [Tigera Operator Spec](https://docs.projectcalico.org/reference/installation/api#operator.tigera.io/v1.Installation) to deploy _Calico_ with. |
| manageCRDs | bool | `false` | If `true`, allow _Tigera Operator_ to manage CRDs. |
| nameOverride | string | `nil` | Override the name of the chart. |
| nodeSelector | object | `{"kubernetes.io/os":"linux"}` | Node selector labels for scheduling. |
| podAnnotations | object | `{}` | Annotations to add to the pod. |
| podLabels | object | `{}` | Labels to add to the pod. |
| podSecurityContext | object | See _values.yaml_ | Security context for the pod. |
| priorityClassName | string | `nil` | Priority class name for the pod. |
| rbac.create | bool | `true` | If `true`, create a `ClusterRole` & `ClusterRoleBinding` with access to the Kubernetes API. |
| rbac.customRules | string | `nil` | Additional rules to add to the `ClusterRole`. |
| resources | object | `{}` | Resources for the default container. |
| securityContext | object | See _values.yaml_ | Security context for the default container. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount`. |
| serviceAccount.labels | object | `{}` | Labels to add to the service account. |
| serviceAccount.name | string | `nil` | If this is set and `serviceAccount.create` is `true` this will be used for the created service account name, if set and `serviceAccount.create` is `false` then this will define an existing service account to use. |
| serviceMonitor.additionalLabels | object | `{}` | Additional labels for the service monitor. |
| serviceMonitor.enabled | bool | `false` | If `true`, create a `ServiceMonitor` resource to support collecting metrics via the _Prometheus Operator_. |
| serviceMonitor.endpointConfig | object | `{}` | Additional endpoint configuration for the service monitor endpoint. |
| serviceMonitor.interval | int | `nil` | **DEPRECATED** - _Prometheus_ scrape interval for the service monitor endpoint. |
| terminationGracePeriodSeconds | int | `nil` | Termination grace period for the pod in seconds. |
| tolerations | list | `[]` | Node taints that will be tolerated for scheduling. |
| topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling. If an explicit label selector is not provided one will be created from the pod selector labels. |
| uninstall.enabled | bool | `true` | If `true`, run a `Job` as a pre-delete _Helm_ hook to make sure that _Tigera Operator_ can be uninstalled. |
| whisker.enabled | bool | `false` | If `true`, install a `Whisker` observability UI according to the `whisker.spec`. |
| whisker.spec | object | `{}` | [Whisker Spec](https://docs.tigera.io/calico/latest/observability/enable-whisker#enable-the-calico-whisker-web-console) to enable the observability UI. |

----------------------------------------------

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs/).
