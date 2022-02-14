# Istio Operator

[Istio](https://istio.io/) is a service mesh that lets you connect, secure, control, and observe services. At a high level, _Istio_ helps reduce the complexity of these deployments, and eases the strain on your development teams. It is a completely open source service mesh that layers transparently onto existing distributed applications. It is also a platform, including APIs that let it integrate into any logging platform, or telemetry or policy system. _Istio's_ diverse feature set lets you successfully, and efficiently, run a distributed microservice architecture, and provides a uniform way to secure, connect, and monitor microservices.

## Installing the Chart

Before you can install the chart you will need to add the `stevehipwell` repo to [Helm](https://helm.sh/).

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
```

After you've installed the repo you can install the chart.

```shell
helm upgrade --install --namespace default --values ./my-values.yaml my-release stevehipwell/istio-operator
```

### Production Usage

#### CRDs

For production usage it's generally suggested that you use the _Helm_ `--skip-crds` argument and manage the CRDs separately so they can be updated (_Helm_ doesn't update CRDs once it's installed them). However while _Istio_ only provides an un-validated CRD for `IstioOperator` there is no need to do this (it's still worth doing IMHO).

#### Image Registry

_Istio_ provides multiple image registries which can be used to work around [rate limiting](https://istio.io/latest/blog/2020/docker-rate-limit/) or other concerns. To use this you need to override the `image.repository` for the operator and the `controlPlane.spec.hub` for the control plane components.

- [docker.io/istio](https://hub.docker.com/u/istio)
- [gcr.io/istio-release](https://console.cloud.google.com/gcr/images/istio-release/GLOBAL)

#### Image Hardening

Production workloads should run hardened container images where possible, Istio provide a [hardened image](https://istio.io/latest/docs/ops/configuration/security/harden-docker-images/) based on the _Google_ [distroless](https://github.com/GoogleContainerTools/distroless/) images. To use this you need to override the `image.tag` for the operator and the `controlPlane.spec.tag` for the control plane components.

## Configuration

The following table lists the configurable parameters of the _Istio Operator_ chart and their default values.

| Parameter                         | Description                                                                                                                                                                                                  | Default                    |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------- |
| `image.repository`                | Image repository.                                                                                                                                                                                            | `docker.io/istio/operator` |
| `image.tag`                       | Image tag, will override the default tag derived from the chart app version.                                                                                                                                 | `""`                       |
| `image.pullPolicy`                | Image pull policy.                                                                                                                                                                                           | `IfNotPresent`             |
| `image.pullSecrets`               | Image pull secrets, deprecated in favour of `imagePullSecrets`.                                                                                                                                              | `[]`                       |
| `imagePullSecrets`                | Image pull secrets, will override `image.pullSecrets`.                                                                                                                                                       | `[]`                       |
| `nameOverride`                    | Override the `name` of the chart.                                                                                                                                                                            | `nil`                      |
| `fullnameOverride`                | Override the `fullname` of the chart.                                                                                                                                                                        | `nil`                      |
| `serviceAccount.create`           | If `true`, create a new service account.                                                                                                                                                                     | `true`                     |
| `serviceAccount.annotations`      | Annotations to add to the service account.                                                                                                                                                                   | `{}`                       |
| `serviceAccount.name`             | Service account to be used. If not set and `serviceAccount.create` is `true`, a name is generated using the full name template.                                                                              | `nil`                      |
| `rbac.create`                     | If `true`, create a cluster role and a cluster role binding.                                                                                                                                                 | `true`                     |
| `podLabels`                       | Labels to add to the pod.                                                                                                                                                                                    | `{}`                       |
| `podAnnotations`                  | Annotations to add to the pod.                                                                                                                                                                               | `{}`                       |
| `podSecurityContext`              | Security context for the pod.                                                                                                                                                                                | `{}`                       |
| `securityContext`                 | Security context for the _istio-operator_ container.                                                                                                                                                         | `{}`                       |
| `priorityClassName`               | Priority class name to use.                                                                                                                                                                                  | `""`                       |
| `serviceMonitor.enabled`          | If `true`, create a _Prometheus_ service monitor.                                                                                                                                                            | `false`                    |
| `serviceMonitor.additionalLabels` | Additional labels to be set on the service monitor.                                                                                                                                                          | `{}`                       |
| `serviceMonitor.interval`         | _Prometheus_ scrape frequency.                                                                                                                                                                               | `1m`                       |
| `dashboards.enabled`              | If _Grafana_ dashboards should be installed for the sidecar to pick up and apply.                                                                                                                            | `false`                    |
| `resources`                       | Resource requests and limits for the _istio-operator_ container.                                                                                                                                             | `nil`                      |
| `nodeSelector`                    | Node labels for pod assignment.                                                                                                                                                                              | `{}`                       |
| `tolerations`                     | Tolerations for pod assignment.                                                                                                                                                                              | `[]`                       |
| `affinity`                        | Affinity for pod assignment.                                                                                                                                                                                 | `{}`                       |
| `istioNamespace`                  | Namespace to install _Istio_ into.                                                                                                                                                                           | `istio-system`             |
| `controlPlane.install`            | If `true`, install the _Istio_ control plane accoring to the `controlPlane.spec`.                                                                                                                            | `false`                    |
| `controlPlane.spec`               | The [Istio Operator Spec](https://istio.io/latest/docs/reference/config/istio.operator.v1alpha1/#IstioOperatorSpec) to deploy the control plane; this can either be structured YAML or a templatable string. | `{}`                       |
