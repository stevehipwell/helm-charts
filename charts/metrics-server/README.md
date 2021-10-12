# Kubernetes Metrics Server

[Metrics Server](https://github.com/kubernetes-sigs/metrics-server/) is a scalable, efficient source of container resource metrics for Kubernetes built-in autoscaling pipelines.

> **IMPORTANT** - This chart has been deprecated in favour of the [Official Metrics Server chart](https://artifacthub.io/packages/helm/metrics-server/metrics-server), which can up adopted an an in-place upgrade.

## Installing the Chart

Before you can install the chart you will need to add the `stevehipwell` repo to [Helm](https://helm.sh/).

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
```

After you've installed the repo you can install the chart.

```shell
helm upgrade --install stevehipwell/metrics-server
```

## Configuration

The following table lists the configurable parameters of the _Metrics Server_ chart and their default values.

| Parameter                            | Description                                                                                                                                                                                                                                                      | Default                                    |
| ------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| `image.repository`                   | Image repository.                                                                                                                                                                                                                                                | `k8s.gcr.io/metrics-server/metrics-server` |
| `image.tag`                          | Image tag, will override the default tag derived from the chart app version.                                                                                                                                                                                     | `""`                                       |
| `image.pullPolicy`                   | Image pull policy.                                                                                                                                                                                                                                               | `IfNotPresent`                             |
| `imagePullSecrets`                   | Image pull secrets.                                                                                                                                                                                                                                              | `[]`                                       |
| `nameOverride`                       | Override the `name` of the chart.                                                                                                                                                                                                                                | `nil`                                      |
| `fullnameOverride`                   | Override the `fullname` of the chart.                                                                                                                                                                                                                            | `nil`                                      |
| `serviceAccount.create`              | If `true`, create a new service account.                                                                                                                                                                                                                         | `true`                                     |
| `serviceAccount.annotations`         | Annotations to add to the service account.                                                                                                                                                                                                                       | `{}`                                       |
| `serviceAccount.name`                | Service account to be used. If not set and `serviceAccount.create` is `true`, a name is generated using the full name template.                                                                                                                                  | `nil`                                      |
| `rbac.create`                        | If `true`, create the RBAC resources.                                                                                                                                                                                                                            | `true`                                     |
| `rbac.pspEnabled`                    | If `true`, create a pod security policy resource.                                                                                                                                                                                                                | `false`                                    |
| `apiService.create`                  | If `true`, create the `v1beta1.metrics.k8s.io` API service. You typically want this enabled! If you disable API service creation you have to manage it outside of this chart for e.g horizontal pod autoscaling to work with this release.                       | `true`                                     |
| `podLabels`                          | Labels to add to the pod.                                                                                                                                                                                                                                        | `{}`                                       |
| `podAnnotations`                     | Annotations to add to the pod.                                                                                                                                                                                                                                   | `{}`                                       |
| `podSecurityContext`                 | Security context for the pod.                                                                                                                                                                                                                                    | `{}`                                       |
| `securityContext`                    | Security context for the _metrics-server_ container.                                                                                                                                                                                                             | _See values.yaml_                          |
| `priorityClassName`                  | Priority class name to use.                                                                                                                                                                                                                                      | `system-cluster-critical`                  |
| `containerPort`                      | port for the _metrics-server_ container.                                                                                                                                                                                                                         | `4443`                                     |
| `hostNetwork.enabled`                | If `true`, start _metric-server_ in hostNetwork mode. You would require this enabled if you use alternate overlay networking for pods and API server unable to communicate with metrics-server. As an example, this is required if you use Weave network on EKS. | `false`                                    |
| `replicas`                           | Number of replicas to run.                                                                                                                                                                                                                                       | `1`                                        |
| `updateStrategy`                     | Customise the default update strategy.                                                                                                                                                                                                                           | `{}`                                       |
| `podDisruptionBudget.enabled`        | If `true`, create `PodDisruptionBudget` resource.                                                                                                                                                                                                                | `{}`                                       |
| `podDisruptionBudget.minAvailable`   | Set the `PodDisruptionBugdet` minimum available pods.                                                                                                                                                                                                            | `nil`                                      |
| `podDisruptionBudget.maxUnavailable` | Set the `PodDisruptionBugdet` maximum unavailable pods.                                                                                                                                                                                                          | `nil`                                      |
| `args`                               | Additional arguments to pass to the _metrics-server_ command.                                                                                                                                                                                                    | `[]`                                       |
| `livenessProbe`                      | Liveness probe.                                                                                                                                                                                                                                                  | See _values.yaml_                          |
| `readinessProbe`                     | Readiness probe.                                                                                                                                                                                                                                                 | See _values.yaml_                          |
| `service.type`                       | Service type.                                                                                                                                                                                                                                                    | `ClusterIP`                                |
| `service.port`                       | Service port.                                                                                                                                                                                                                                                    | `443`                                      |
| `service.annotations`                | Annotations to add to the service.                                                                                                                                                                                                                               | `{}`                                       |
| `service.labels`                     | Labels to add to the service.                                                                                                                                                                                                                                    | `{}`                                       |
| `resources`                          | Resource requests and limits for the _metrics-server_ container.                                                                                                                                                                                                 | `{}`                                       |
| `extraVolumeMounts`                  | Additional volume mounts for the _metrics-server_ container.                                                                                                                                                                                                     | `[]`                                       |
| `extraVolumes`                       | Additional volumes for the pod.                                                                                                                                                                                                                                  | `[]`                                       |
| `nodeSelector`                       | Node labels for pod assignment.                                                                                                                                                                                                                                  | `{}`                                       |
| `tolerations`                        | Tolerations for pod assignment.                                                                                                                                                                                                                                  | `[]`                                       |
| `affinity`                           | Affinity for pod assignment.                                                                                                                                                                                                                                     | `{}`                                       |