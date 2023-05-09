# Node Config

The _Node Config_ chart is designed to run an init container as a DaemonSet to configure Kubernetes nodes.

## Installing the Chart

Before you can install the chart you will need to add the `stevehipwell` repo to [Helm](https://helm.sh/).

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
```

After you've installed the repo you can install the chart.

```shell
helm upgrade --install --namespace default --values ./my-values.yaml my-release stevehipwell/node-config
```

## Configuration

The following table lists the configurable parameters of the _Node Config_ chart and their default values.

| Parameter                       | Description                                                                                                                     | Default                       |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ----------------------------- |
| `nameOverride`                  | Override the `name` of the chart.                                                                                               |                               |
| `fullnameOverride`              | Override the `fullname` of the chart.                                                                                           |                               |
| `commonLabels`                  | Labels to add to all chart resources.                                                                                           | `{}`                          |
| `imagePullSecrets`              | Image pull secrets.                                                                                                             | `[]`                          |
| `serviceAccount.create`         | If `true`, create a new service account.                                                                                        | `true`                        |
| `serviceAccount.name`           | Service account to be used. If not set and `serviceAccount.create` is `true`, a name is generated using the full name template. |                               |
| `serviceAccount.labels`         | Labels to add to the service account.                                                                                           | `{}`                          |
| `serviceAccount.annotations`    | Annotations to add to the service account.                                                                                      | `{}`                          |
| `serviceAccount.automountToken` | If `true`, mount the ServiceAccount token.                                                                                      | `false`                       |
| `scripts.name`                  | Name of the script to create.                                                                                                   |                               |
| `scripts.filename`              | Filename of the script to create.                                                                                               |                               |
| `scripts.content`               | Content of the script to create.                                                                                                |                               |
| `podLabels`                     | Labels to add to the pod.                                                                                                       | `{}`                          |
| `podAnnotations`                | Annotations to add to the pod.                                                                                                  | `{}`                          |
| `podSecurityContext`            | Security context for the pod.                                                                                                   | `{}`                          |
| `priorityClassName`             | Priority class name to use.                                                                                                     |                               |
| `terminationGracePeriodSeconds` | Termination grace period of the pod in seconds.                                                                                 |                               |
| `config.image.repository`       | Image repository for the _config_ container image.                                                                              | `docker.io/alpine`            |
| `config.image.tag`              | Image tag for the _config_ container image.                                                                                     | `latest`                      |
| `config.image.pullPolicy`       | Image pull policy for the _config_ container image.                                                                             | `IfNotPresent`                |
| `config.securityContext`        | Security context for the _config_ container.                                                                                    | `{}`                          |
| `config.env`                    | Environment variables for the _config_ container.                                                                               | `[]`                          |
| `config.command`                | Command for the _config_ container.                                                                                             | _See values.yaml_             |
| `config.resources`              | Resource requests and limits for the _config_ container.                                                                        | `{}`                          |
| `pause.image.repository`        | Image repository for the _pause_ container image.                                                                               | `registry.k8s.io/pause`       |
| `pause.image.tag`               | Image tag for the _pause_ container image.                                                                                      | `3.9`                         |
| `pause.image.pullPolicy`        | Image pull policy for the _pause_ container image.                                                                              | `IfNotPresent`                |
| `pause.resources`               | Resource requests and limits for the _pause_ container.                                                                         | _See values.yaml_             |
| `nodeSelector`                  | Node labels for pod assignment.                                                                                                 | `{ kubernetes.io/os: linux }` |
| `tolerations`                   | Toleration labels for pod assignment.                                                                                           | `[]`                          |
