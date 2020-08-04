# [DEPRECATED] Descheduler for Kubernetes

[Descheduler](https://github.com/kubernetes-sigs/descheduler/) is used to rebalance clusters by evicting pods that can potentially be scheduled on better nodes. In the current implementation, _Descheduler_ does not schedule replacement of evicted pods but relies on the default scheduler for that.

## Installing the Chart

Before you can install the chart you will need to add the `stevehipwell` repo to [Helm](https://helm.sh/).

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
```

After you've installed the repo you can install the chart.

```shell
helm upgrade --install --namespace default --values ./my-values.yaml my-release stevehipwell/descheduler
```

## Configuration

The following table lists the configurable parameters of the _descheduler_ chart and their default values.

| Parameter                      | Description                                                                                                           | Default                    |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------------- | -------------------------- |
| `image.repository`             | Docker repository to use                                                                                              | `aveshagarwal/descheduler` |
| `image.tag`                    | Docker tag to use                                                                                                     | `0.9.0`                    |
| `image.pullPolicy`             | Docker image pull policy                                                                                              | `IfNotPresent`             |
| `nameOverride`                 | String to partially override `descheduler.fullname` template (will prepend the release name)                          | `""`                       |
| `fullnameOverride`             | String to fully override `descheduler.fullname` template                                                              | `""`                       |
| `schedule`                     | The cron schedule to run the _descheduler_ job on                                                                     | `"*/2 * * * *"`            |
| `cmdOptions`                   | The options to pass to the _descheduler_ command                                                                      | _see values.yaml_          |
| `deschedulerPolicy.strategies` | The _descheduler_ strategies to apply                                                                                 | _see values.yaml_          |
| `priorityClassName`            | The name of the priority class to add to pods                                                                         | `system-cluster-critical`  |
| `rbac.create`                  | If `true`, create & use RBAC resources                                                                                | `true`                     |
| `serviceAccount.create`        | If `true`, create a service account for the cron job                                                                  | `true`                     |
| `serviceAccount.name`          | The name of the service account to use, if not set and create is true a name is generated using the fullname template | `nil`                      |
