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

| Parameter                               | Description                                                                                                                     | Default                                   |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------- |
| `image.repository`                      | Image repository.                                                                                                               | `ghcr.io/stevehipwell/fluentd-aggregator` |
| `image.tag`                             | Image tag.                                                                                                                      | `.Chart.AppVersion`                       |
| `image.pullPolicy`                      | Image pull policy.                                                                                                              | `IfNotPresent`                            |
| `imagePullSecrets`                      | Image pull secrets.                                                                                                             | `[]`                                      |
| `nameOverride`                          | Override the `name` of the chart.                                                                                               | `""`                                      |
| `fullnameOverride`                      | Override the `fullname` of the chart.                                                                                           | `""`                                      |
| `commonLabels`                          | Labels to add to all chart resources.                                                                                           | `{}`                                      |
| `serviceAccount.create`                 | If `true`, create a new service account.                                                                                        | `true`                                    |
| `serviceAccount.annotations`            | Annotations to add to the service account.                                                                                      | `{}`                                      |
| `serviceAccount.name`                   | Service account to be used. If not set and `serviceAccount.create` is `true`, a name is generated using the full name template. | `""`                                      |
| `serviceAccount.automountToken`         | If `true`, mount the ServiceAccount token.                                                                                      | `false`                                   |
| `podLabels`                             | Labels to add to the pod.                                                                                                       | `{}`                                      |
| `podAnnotations`                        | Annotations to add to the pod.                                                                                                  | `{}`                                      |
| `podSecurityContext`                    | Security context for the pod.                                                                                                   | `{fsGroup: 2000}`                         |
| `securityContext`                       | Security context for the _fluentd_ container.                                                                                   | `{}`                                      |
| `priorityClassName`                     | Priority class name to use.                                                                                                     | `""`                                      |
| `livenessProbe`                         | The liveness probe.                                                                                                             | See _values.yaml_                         |
| `readinessProbe`                        | The readiness probe.                                                                                                            | See _values.yaml_                         |
| `service.type`                          | Service type.                                                                                                                   | `ClusterIP`                               |
| `service.clusterIP`                     | Service cluster IP.                                                                                                             |                                           |
| `service.annotations`                   | Annotations to add to the service.                                                                                              | `{}`                                      |
| `serviceMonitor.enabled`                | If `true`, create a _Prometheus_ service monitor.                                                                               | `false`                                   |
| `serviceMonitor.additionalLabels`       | Additional labels to be set on the service monitor.                                                                             | `{}`                                      |
| `serviceMonitor.endpointConfig`         | Additional endpoint configuration for the ServiceMonitor.                                                                       | `{}`                                      |
| `dashboards.enabled`                    | If _Grafana_ dashboards should be installed for the sidecar to pick up and apply.                                               | `false`                                   |
| `ingress.enabled`                       | If `true`, create an ingress object.                                                                                            | `false`                                   |
| `ingress.annotations`                   | Ingress annotations.                                                                                                            | `{}`                                      |
| `ingress.ingressClassName`              | Ingress class to use.                                                                                                           | `""`                                      |
| `ingress.hosts`                         | Ingress hosts configuration.                                                                                                    | `[]`                                      |
| `ingress.tls`                           | Ingress TLS configuration                                                                                                       | `[]`                                      |
| `persistence.enabled`                   | If `true`, create a _PVC_ from a template.                                                                                      | `false`                                   |
| `persistence.legacy`                    | If `true`, use the legacy PVC logic (required when upgrading from `v2`).                                                        | `false`                                   |
| `persistence.annotations`               | Annotations to add to the _PVC_.                                                                                                | `{}`                                      |
| `persistence.existingClaim`             | Use an existing _PVC_ to persist data.                                                                                          |                                           |
| `persistence.accessMode`                | Persistence access mode.                                                                                                        | `ReadWriteOnce`                           |
| `persistence.storageClass`              | _PVC_ storage class (use `-` for default).                                                                                      | `standard`                                |
| `persistence.size`                      | Size of _PVC_ to create.                                                                                                        | `8Gi`                                     |
| `extraVolumeMounts`                     | Additional volume mounts for the _fluentd_ container.                                                                           | `[]`                                      |
| `resources`                             | Resource requests and limits for the _fluentd_ container.                                                                       | `{}`                                      |
| `replicaCount`                          | Number of replicas to create if `autoscalling.enabled` is `false`.                                                              | `1`                                       |
| `terminationGracePeriodSeconds`         | Termination grace period.                                                                                                       |                                           |
| `podDisruptionBudget.enabled`           | If `true`, create `PodDisruptionBudget` resource.                                                                               | `{}`                                      |
| `podDisruptionBudget.minAvailable`      | Set the `PodDisruptionBugdet` minimum available pods.                                                                           |                                           |
| `podDisruptionBudget.maxUnavailable`    | Set the `PodDisruptionBugdet` maximum unavailable pods.                                                                         |                                           |
| `extraVolumes`                          | Additional volumes.                                                                                                             | `[]`                                      |
| `nodeSelector`                          | Node labels for pod assignment.                                                                                                 | `{}`                                      |
| `tolerations`                           | Toleration labels for pod assignment.                                                                                           | `[]`                                      |
| `affinity`                              | Affinity settings for pod assignment.                                                                                           | `{}`                                      |
| `topologySpreadConstraints`             | Topology spread constraints for pod assignment.                                                                                 | `{}`                                      |
| `env`                                   | Environment variables for the _fluentd_ container.                                                                              | `[]`                                      |
| `configuration.system.rootDir`          | Root directory for _Fluentd_ state.                                                                                             | `/fluentd/state`                          |
| `configuration.system.additionalConfig` | Additional system configuration options (key value only).                                                                       | `{}`                                      |
| `configuration.probe.port`              | Port used to run the probe endpoint.                                                                                            | `9880`                                    |
| `configuration.metrics.enabled`         | If `true`, collect and expose _Prometheus_ metrics.                                                                             | `true`                                    |
| `configuration.metrics.port`            | Port used to run the _Prometheus_ metrics endpoint.                                                                             | `24231`                                   |
| `configuration.metrics.path`            | Prometheus metrics path.                                                                                                        | `/metrics`                                |
| `configuration.forward.port`            | Port used for the forward input plugin endpoint.                                                                                | `24224`                                   |
| `configuration.filters`                 | Global filters _Fluentd_ configuration.                                                                                         | `""`                                      |
| `configuration.routes`                  | Array of routes to send logs through.                                                                                           | See _values.yaml_                         |
| `configuration.debug`                   | if `true`, all records after the global filters have been applied are sent to stdout before they are routed.                    | `false`                                   |
