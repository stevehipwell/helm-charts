# Overprovisioner

The _Overprovisioner_ chart is designed to overprovision a _Kubernetes_ cluster and is based on the _Cluster Autoscaler_ [documentation](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#how-can-i-configure-overprovisioning-with-cluster-autoscaler) but can be used in any dynamic scaling _Kubernetes_ cluster.

## Installing the Chart

Before you can install the chart you will need to add the `stevehipwell` repo to [Helm](https://helm.sh/).

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
```

After you've installed the repo you can install the chart.

```shell
helm upgrade --install --namespace default --values ./my-values.yaml my-release stevehipwell/overprovisioner
```

## Configuration

The following table lists the configurable parameters of the _Overprovisioner_ chart and their default values.

| Parameter                             | Description                                                                                                       | Default                 |
| ------------------------------------- | ----------------------------------------------------------------------------------------------------------------- | ----------------------- |
| `nameOverride`                        | Override the `name` of the chart.                                                                                 |                         |
| `fullnameOverride`                    | Override the `fullname` of the chart.                                                                             |                         |
| `commonLabels`                        | Labels to add to all chart resources.                                                                             | `{}`                    |
| `imagePullSecrets`                    | Image pull secrets.                                                                                               | `[]`                    |
| `priorityClass.create`                | If `true`, create a new preemptible _PriorityClass_ to use for overprovisioning.                                  | `true`                  |
| `priorityClass.name`                  | Name to use for the preemptible priority class, if not set a name is generated using the chart full name.         |                         |
| `priorityClass.labels`                | Labels to add to the priority class.                                                                              | `{}`                    |
| `priorityClass.annotations`           | Annotations to add to the priority class.                                                                         | `{}`                    |
| `priorityClass.value`                 | Value of the priority class, should be less then `0`.                                                             | `-1`                    |
| `pause.serviceAccount.create`         | If `true`, create a new _ServiceAccount_ for the pause pod.                                                       | `true`                  |
| `pause.serviceAccount.name`           | Name to use for the pause pod service account, if not set a name is generated using the pause full name template. |                         |
| `pause.serviceAccount.labels`         | Labels to add to the pause service account.                                                                       | `{}`                    |
| `pause.serviceAccount.annotations`    | Annotations to add to the pause service account.                                                                  | `{}`                    |
| `pause.image.repository`              | Image repository.                                                                                                 | `registry.k8s.io/pause` |
| `pause.image.tag`                     | Image tag.                                                                                                        | `3.9`                   |
| `pause.image.pullPolicy`              | Image pull policy.                                                                                                | `IfNotPresent`          |
| `pause.podLabels`                     | Labels to add to the pause pod.                                                                                   | `{}`                    |
| `pause.podAnnotations`                | Annotations to add to the pause pod.                                                                              | `{}`                    |
| `pause.replicas`                      | Number of pause pod replicas required                                                                             | `1`                     |
| `pause.terminationGracePeriodSeconds` | Termination grace period for the pause pod in seconds.                                                            | `0`                     |
| `pause.resources`                     | Resource requests and limits for the pause pod container.                                                         | _See values_            |
| `pause.nodeSelector`                  | Node label selector for the pause pod.                                                                            | `{}`                    |
| `pause.affinity`                      | Affinity settings for the pause pod.                                                                              | `{}`                    |
| `pause.tolerations`                   | Tolerations for the pause pod.                                                                                    | `[]`                    |
| `pause.topologySpreadConstraints`     | Topology spread constraints for the pause pod.                                                                    | `{}`                    |
