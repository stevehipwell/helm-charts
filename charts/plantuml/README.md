# PlantUML

[PlantUML](https://plantuml.com/) is an open-source tool allowing users to create diagrams from a plain text language.

## Installing the Chart

Before you can install the chart you will need to add the `stevehipwell` repo to [Helm](https://helm.sh/).

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
```

After you've installed the repo you can install the chart.

```shell
helm upgrade --install --namespace default --values ./my-values.yaml my-release stevehipwell/plantuml
```

## Configuration

The following table lists the configurable parameters of the _PlantUML_ chart and their default values.

| Parameter                                       | Description                                                                                                                      | Default                          |
| ----------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | -------------------------------- |
| `image.repository`                              | Image repository.                                                                                                                | `plantuml/plantuml-server`       |
| `image.tag`                                     | Image tag.                                                                                                                       | `jetty-v{{ .Chart.AppVersion }}` |
| `image.pullPolicy`                              | Image pull policy.                                                                                                               | `IfNotPresent`                   |
| `image.pullSecrets`                             | Image pull secrets.                                                                                                              | `[]`                             |
| `nameOverride`                                  | Override the `name` of the chart.                                                                                                | `nil`                            |
| `fullnameOverride`                              | Override the `fullname` of the chart.                                                                                            | `nil`                            |
| `serviceAccount.create`                         | If `true`, create a new `serviceaccount`.                                                                                        | `true`                           |
| `serviceAccount.annotations`                    | Annotations to add to the service account.                                                                                       | `{}`                             |
| `serviceAccount.name`                           | Service account to be used. If not set and `serviceAccount.create` is `true`, a name is generated using the _fullname_ template. | `nil`                            |
| `podAnnotations`                                | Annotations to add to the pod.                                                                                                   | `{}`                             |
| `podLabels`                                     | Labels to add to the pod.                                                                                                        | `{}`                             |
| `podSecurityContext`                            | Security context for the pod.                                                                                                    | `{}`                             |
| `securityContext`                               | Security context for the _plantuml_ container\_.                                                                                 | `{}`                             |
| `priorityClassName`                             | Priority class name to use.                                                                                                      | `""`                             |
| `livenessProbe`                                 | The liveness probe.                                                                                                              | See _values.yaml_                |
| `readinessProbe`                                | The readiness probe.                                                                                                             | See _values.yaml_                |
| `service.type`                                  | Service type.                                                                                                                    | `ClusterIP`                      |
| `service.annotations`                           | Annotations to add to the service.                                                                                               | `{}`                             |
| `service.port`                                  | Service port.                                                                                                                    | `80`                             |
| `ingress.enabled`                               | If `true`, create an ingress object.                                                                                             | `false`                          |
| `ingress.annotations`                           | Ingress annotations.                                                                                                             | `{}`                             |
| `ingress.ingressClassName`                      | Ingress class to use.                                                                                                            | `""`                             |
| `ingress.hosts`                                 | Ingress hosts configuration.                                                                                                     | `[]`                             |
| `ingress.tls`                                   | Ingress TLS configuration                                                                                                        | `[]`                             |
| `resources`                                     | Resource requests and limits for the primary container.                                                                          | `nil`                            |
| `replicaCount`                                  | Number of replicas to create if `autoscalling.enabled` is `false`.                                                               | `1`                              |
| `maxUnavailable`                                | Max unavailable pods for the pdb.                                                                                                | `0`                              |
| `autoscaling.enabled`                           | If `true`, create a _HPA_.                                                                                                       | `true`                           |
| `autoscaling.minReplicas`                       | Min number of replicas, controlled by the _HPA_.                                                                                 | `1`                              |
| `autoscaling.maxReplicas`                       | Max number of replicas, controlled by the _HPA_.                                                                                 | `3`                              |
| `autoscaling.targetCPUUtilizationPercentage`    | The target CPU utilization to trigger a scaling event.                                                                           | `80`                             |
| `autoscaling.targetMemoryUtilizationPercentage` | The target memory utilization to trigger a scaling event.                                                                        | `80`                             |
| `nodeSelector`                                  | Node labels for pod assignment.                                                                                                  | `{}`                             |
| `tolerations`                                   | Toleration labels for pod assignment.                                                                                            | `[]`                             |
| `affinity`                                      | Affinity settings for pod assignment.                                                                                            | `{}`                             |
| `caCerts.enabled`                               | If `true`, add provided CA certificates to the JVM cacerts key store.                                                            | `false`                          |
| `caCerts.secret`                                | Secret containing the additional CA certificates.                                                                                | `nil`                            |
| `env`                                           | Environment variables for all containers in the pod.                                                                             | `nil`                            |
