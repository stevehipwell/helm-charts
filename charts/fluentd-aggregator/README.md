# Fluentd Aggregator

[Fluentd](https://www.fluentd.org/) is an open source data collector for unified logging layer. _Fluentd_ allows you to unify data collection and consumption for a better use and understanding of data.

## Installing the Chart

Before you can install the chart you will need to add the `stevehipwell` repo to [Helm](https://helm.sh/).

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
```

After you've installed the repo you can install the chart.

```shell
helm upgrade --install --namespace default --values ./my-values.yaml my-release stevehipwell/fluentd-aggregator
```

## Configuration

The following table lists the configurable parameters of the _fluentd-aggregator_ chart and their default values.

| Parameter                                 | Description                                                                                                                      | Default                                   |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------- |
| `image.repository`                        | Image repository.                                                                                                                | `ghcr.io/stevehipwell/fluentd-aggregator` |
| `image.tag`                               | Image tag.                                                                                                                       | `.Chart.AppVersion`                       |
| `image.pullPolicy`                        | Image pull policy.                                                                                                               | `IfNotPresent`                            |
| `image.pullSecrets`                       | Image pull secrets.                                                                                                              | `[]`                                      |
| `nameOverride`                            | Override the `name` of the chart.                                                                                                | `nil`                                     |
| `fullnameOverride`                        | Override the `fullname` of the chart.                                                                                            | `nil`                                     |
| `serviceAccount.create`                   | If `true`, create a new `serviceaccount`.                                                                                        | `true`                                    |
| `serviceAccount.annotations`              | Annotations to add to the service account.                                                                                       | `{}`                                      |
| `serviceAccount.name`                     | Service account to be used. If not set and `serviceAccount.create` is `true`, a name is generated using the _fullname_ template. | `nil`                                     |
| `podAnnotations`                          | Annotations to add to the pod.                                                                                                   | `{}`                                      |
| `podSecurityContext`                      | Security context for the pod.                                                                                                    | `{}`                                      |
| `securityContext`                         | Security context for the _fluentd_ container.                                                                                    | `{}`                                      |
| `priorityClassName`                       | Priority class name to use.                                                                                                      | `""`                                      |
| `service.type`                            | Service type.                                                                                                                    | `ClusterIP`                               |
| `service.annotations`                     | Annotations to add to the service.                                                                                               | `{}`                                      |
| `service.ports`                           | Ports to expose via the service.                                                                                                 | See _values.yaml_                         |
| `metrics.enabled`                         | If `true`, metrics will be enabled.                                                                                              | `false`                                   |
| `metrics.port`                            | Port to use for metrics.                                                                                                         | `24231`                                   |
| `metrics.path`                            | Path to use for metrics.                                                                                                         | `/metrics`                                |
| `metrics.serviceMonitor.enabled`          | If `true`, create a Prometheus service monitor.                                                                                  | `false`                                   |
| `metrics.serviceMonitor.additionalLabels` | Additional labels to be set on the Prometheus ServiceMonitor.                                                                    | `{}`                                      |
| `metrics.serviceMonitor.interval`         | Prometheus scrape frequency.                                                                                                     | `1m`                                      |
| `ingress.enabled`                         | If `true`, create an ingress object.                                                                                             | `false`                                   |
| `ingress.annotations`                     | Ingress annotations.                                                                                                             | `{}`                                      |
| `ingress.hosts`                           | Ingress hosts configuration.                                                                                                     | `[]`                                      |
| `ingress.tls`                             | Ingress TLS configuration                                                                                                        | `[]`                                      |
| `persistence.enabled`                     | If `true`, create a _PVC_.                                                                                                       | `false`                                   |
| `persistence.annotations`                 | Annotations to add to the _PVC_.                                                                                                 | `{}`                                      |
| `persistence.existingClaim`               | Use an existing _PVC_ to persist data.                                                                                           | `nil`                                     |
| `persistence.accessMode`                  | Persistence access mode.                                                                                                         | `ReadWriteOnce`                           |
| `persistence.storageClass`                | _PVC_ storage class (use `-` for default).                                                                                       | `standard`                                |
| `persistence.size`                        | Size of _PVC_ to create.                                                                                                         | `8Gi`                                     |
| `resources`                               | Resource requests and limits for the primary container.                                                                          | `nil`                                     |
| `replicaCount`                            | Number of replicas to create if `autoscalling.enabled` is `false`.                                                               | `1`                                       |
| `terminationGracePeriodSeconds`           | Termination grace period.                                                                                                        | `nil`                                     |
| `nodeSelector`                            | Node labels for pod assignment.                                                                                                  | `{}`                                      |
| `tolerations`                             | Toleration labels for pod assignment.                                                                                            | `[]`                                      |
| `affinity`                                | Affinity settings for pod assignment.                                                                                            | `{}`                                      |
| `env`                                     | Environment variables for all containers.                                                                                        | `[]`                                      |
| `debug`                                   | If `true` apply debug config which by default logs to stdout.                                                                    | See _values.yaml_                         |
| `config.general`                          | The system configuration.                                                                                                        | See _values.yaml_                         |
| `config.metrics`                          | The metrics configuration to be used if `metrics.enabled` is `true`.                                                             | See _values.yaml_                         |
| `config.forward`                          | The forward configuration.                                                                                                       | See _values.yaml_                         |
| `config.debug`                            | The debug configuration to be used if `debug` is `true`.                                                                         | See _values.yaml_                         |
| `config.filter`                           | The filter configuration.                                                                                                        | See _values.yaml_                         |
| `config.output`                           | The output configuration.                                                                                                        | See _values.yaml_                         |
