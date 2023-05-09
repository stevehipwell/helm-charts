# K8s Resources

The _K8s Resources_ chart is designed to deploy arbitrary Kubernetes resources to a _Kubernetes_ cluster.

## Installing the Chart

Before you can install the chart you will need to add the `stevehipwell` repo to [Helm](https://helm.sh/).

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
```

After you've installed the repo you can install the chart.

```shell
helm upgrade --install --namespace default --values ./my-values.yaml my-release stevehipwell/k8s-resources
```

## Configuration

The following table lists the configurable parameters of the _K8s Resources_ chart and their default values.

| Parameter               | Description                                                                        | Default |
| ----------------------- | ---------------------------------------------------------------------------------- | ------- |
| `resources.apiVersion`  | API version of the resource (required).                                            |         |
| `resources.kind`        | Kind of the resource (required).                                                   |         |
| `resources.name`        | Name of the resource (required).                                                   |         |
| `resources.namespace`   | Namespace for the resource (don't provide this if the resource is cluster scoped). |         |
| `resources.labels`      | Labels for the resource (optional).                                                |         |
| `resources.annotations` | Annotations for the resource (optional).                                           |         |
| `resources.content`     | Content of the resource (optional).                                                |         |
