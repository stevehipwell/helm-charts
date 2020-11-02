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

## Configuration

The following table lists the configurable parameters of the _Istio Operator_ chart and their default values.

| Parameter                         | Description                                                                                                                      | Default                    |
| --------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | -------------------------- |
| `image.repository`                | Image repository.                                                                                                                | `docker.io/istio/operator` |
| `image.tag`                       | Image tag.                                                                                                                       | `.Chart.AppVersion`        |
| `image.pullPolPcy`                | Image pull policy.                                                                                                               | `IfNotPresent`             |
| `image.pullSecrets`               | Image pull secrets.                                                                                                              | `[]`                       |
| `nameOverride`                    | Override the `name` of the chart.                                                                                                | `nil`                      |
| `fullnameOverride`                | Override the `fullname` of the chart.                                                                                            | `nil`                      |
| `serviceAccount.create`           | If `true`, create a new `serviceaccount`.                                                                                        | `true`                     |
| `serviceAccount.annotations`      | Annotations to add to the service account.                                                                                       | `{}`                       |
| `serviceAccount.name`             | Service account to be used. If not set and `serviceAccount.create` is `true`, a name is generated using the _fullname_ template. | `nil`                      |
| `rbac.create`                     | If `true`, create a `clusterrole` and a `clusterolebinding`.                                                                     | `true`                     |
| `podAnnotations`                  | Annotations to add to the primary container.                                                                                     | `{}`                       |
| `securityContext`                 | Security context for the pod.                                                                                                    | `{}`                       |
| `podSecurityContext`              | Security context for the primary container.                                                                                      | `{}`                       |
| `serviceMonitor.enabled`          | If `true`, create a Prometheus service monitor.                                                                                  | `false`                    |
| `serviceMonitor.additionalLabels` | Additional labels to be set on the Prometheus ServiceMonitor.                                                                    | `{}`                       |
| `serviceMonitor.interval`         | Prometheus scrape frequency.                                                                                                     | `1m`                       |
| `resources`                       | Resource requests and limits for the primary container.                                                                          | `nil`                      |
| `nodeSelector`                    | Node labels for pod assignment.                                                                                                  | `{}`                       |
| `tolerations`                     | Toleration labels for pod assignment.                                                                                            | `[]`                       |
| `affinity`                        | Affinity settings for pod assignment.                                                                                            | `{}`                       |
| `istioNamespace`                  | Namespace to install _Istio_ into.                                                                                               | `istio-system`             |
| `controlPlane.install`            | If `true`, install _Istio_.                                                                                                      | `false`                    |
| `controlPlane.spec`               | The _Istio_ install specification.                                                                                               | `{}`                       |
