# Tigera Operator for Calico

The [Tigera Operator](https://www.tigera.io/) is a Kubernetes operator which manages the lifecycle of a [Calico](https://www.tigera.io/project-calico/) or [Calico Enterprise](https://www.tigera.io/tigera-products/calico-enterprise/) installation on Kubernetes. Its goal is to make installation, upgrades, and ongoing lifecycle management of _Calico_ and _Calico Enterprise_ as simple and reliable as possible.

## Installing the Chart

Before you can install the chart you will need to add the `stevehipwell` repo to [Helm](https://helm.sh/).

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
```

After you've installed the repo you can install the chart.

```shell
helm upgrade --install --namespace default --values ./my-values.yaml my-release stevehipwell/tigera-operator
```

## Configuration

The following table lists the configurable parameters of the _Tigera Operator_ chart and their default values.

| Parameter                         | Description                                                                                                                                       | Default                   |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| `image.repository`                | Image repository.                                                                                                                                 | `quay.io/tigera/operator` |
| `image.tag`                       | Image tag.                                                                                                                                        | `.Chart.AppVersion`       |
| `image.pullPolicy`                | Image pull policy.                                                                                                                                | `IfNotPresent`            |
| `imagePullSecrets`                | Image pull secrets.                                                                                                                               | `[]`                      |
| `nameOverride`                    | Override the `name` of the chart.                                                                                                                 | `nil`                     |
| `fullnameOverride`                | Override the `fullname` of the chart.                                                                                                             | `nil`                     |
| `serviceAccount.create`           | If `true`, create a new `serviceaccount`.                                                                                                         | `true`                    |
| `serviceAccount.annotations`      | Annotations to add to the service account.                                                                                                        | `{}`                      |
| `serviceAccount.name`             | Service account to be used. If not set and `serviceAccount.create` is `true`, a name is generated using the _fullname_ template.                  | `nil`                     |
| `rbac.create`                     | If `true`, create a `clusterrole` and a `clusterolebinding`.                                                                                      | `true`                    |
| `podAnnotations`                  | Annotations to add to the pod.                                                                                                                    | `{}`                      |
| `podSecurityContext`              | Security context for the pod.                                                                                                                     | `{}`                      |
| `securityContext`                 | Security context for the _tigera-operator_ container.                                                                                             | `{}`                      |
| `priorityClassName`               | Priority class name to use.                                                                                                                       | `""`                      |
| `serviceMonitor.enabled`          | If `true`, create a Prometheus service monitor.                                                                                                   | `false`                   |
| `serviceMonitor.additionalLabels` | Additional labels to be set on the Prometheus ServiceMonitor.                                                                                     | `{}`                      |
| `serviceMonitor.interval`         | Prometheus scrape frequency.                                                                                                                      | `1m`                      |
| `resources`                       | Resource requests and limits for the primary container.                                                                                           | `nil`                     |
| `nodeSelector`                    | Node labels for pod assignment.                                                                                                                   | `{}`                      |
| `tolerations`                     | Toleration labels for pod assignment.                                                                                                             | `[]`                      |
| `affinity`                        | Affinity settings for pod assignment.                                                                                                             | `{}`                      |
| `installation.enabled`            | If `true`, install _Calico_ control plane according to the `installation.spec`.                                                                   | `false`                   |
| `installation.spec`               | The [Tigera Operator Spec](https://docs.projectcalico.org/reference/installation/api#operator.tigera.io/v1.Installation) to deploy _Calico_ with. | `{}`                      |
