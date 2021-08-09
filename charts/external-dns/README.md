# ExternalDNS

[ExternalDNS](https://github.com/kubernetes-sigs/external-dns/) synchronizes exposed Kubernetes Services and Ingresses with DNS providers.

## Installing the Chart

Before you can install the chart you will need to add the `stevehipwell` repo to [Helm](https://helm.sh/).

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
```

After you've installed the repo you can install the chart.

```shell
helm upgrade --install stevehipwell/external-dns
```

## Configuration

The following table lists the configurable parameters of the _ExternalDNS_ chart and their default values.

| Parameter                         | Description                                                                                                                     | Default                                |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- |
| `image.repository`                | Image repository.                                                                                                               | `k8s.gcr.io/external-dns/external-dns` |
| `image.tag`                       | Image tag, will override the default tag derived from the chart app version.                                                    | `""`                                   |
| `image.pullPolicy`                | Image pull policy.                                                                                                              | `IfNotPresent`                         |
| `imagePullSecrets`                | Image pull secrets.                                                                                                             | `[]`                                   |
| `nameOverride`                    | Override the `name` of the chart.                                                                                               | `""`                                   |
| `fullnameOverride`                | Override the `fullname` of the chart.                                                                                           | `""`                                   |
| `serviceAccount.create`           | If `true`, create a new `serviceaccount`.                                                                                       | `true`                                 |
| `serviceAccount.annotations`      | Annotations to add to the service account.                                                                                      | `{}`                                   |
| `serviceAccount.name`             | Service account to be used. If not set and `serviceAccount.create` is `true`, a name is generated using the full name template. | `""`                                   |
| `rbac.create`                     | If `true`, create the RBAC resources.                                                                                           | `true`                                 |
| `podLabels`                       | Labels to add to the pod.                                                                                                       | `{}`                                   |
| `podAnnotations`                  | Annotations to add to the pod.                                                                                                  | `{}`                                   |
| `podSecurityContext`              | Security context for the pod.                                                                                                   | _see values.yaml_                      |
| `securityContext`                 | Security context for the _external-dns_ container.                                                                              | _see values.yaml_                      |
| `priorityClassName`               | Priority class name to use for the pod.                                                                                         | `""`                                   |
| `terminationGracePeriodSeconds`   | Termination grace period for the pod.                                                                                           | `null`                                 |
| `serviceMonitor.enabled`          | If `true`, create a _Prometheus_ service monitor.                                                                               | `false`                                |
| `serviceMonitor.additionalLabels` | Additional labels to be set on the ServiceMonitor.                                                                              | `{}`                                   |
| `serviceMonitor.interval`         | _Prometheus_ scrape frequency.                                                                                                  | `1m`                                   |
| `serviceMonitor.scrapeTimeout`    | _Prometheus_ scrape timeout.                                                                                                    | `10s`                                  |
| `env`                             | Environment variables for the _external-dns_ container.                                                                         | `[]`                                   |
| `livenessProbe`                   | Liveness probe for the _external-dns_ container.                                                                                | See _values.yaml_                      |
| `readinessProbe`                  | Readiness probe for the _external-dns_ container.                                                                               | See _values.yaml_                      |
| `service.port`                    | Port to expose via the service.                                                                                                 | `7979`                                 |
| `extraVolumes`                    | Additional volumes for the pod.                                                                                                 | `[]`                                   |
| `extraVolumeMounts`               | Additional volume mounts for the _external-dns_ container.                                                                      | `[]`                                   |
| `resources`                       | Resource requests and limits for the _external-dns_ container.                                                                  | `{}`                                   |
| `nodeSelector`                    | Node labels for pod assignment.                                                                                                 | `{}`                                   |
| `tolerations`                     | Toleration labels for pod assignment.                                                                                           | `[]`                                   |
| `affinity`                        | Affinity settings for pod assignment.                                                                                           | `{}`                                   |
| `logLevel`                        | Verbosity of the logs, available values are: `panic`, `debug`, `info`, `warn`, `error`, `fatal`.                                | `info`                                 |
| `logFormat`                       | Formats of the logs, available values are: `text`, `json`.                                                                      | `text`                                 |
| `interval`                        | The interval for DNS updates.                                                                                                   | `1m`                                   |
| `triggerLoopOnEvent`              | When enabled, triggers run loop on create/update/delete events in addition of regular interval.                                 | `false`                                |
| `sources`                         | K8s resources type to be observed for new DNS entries.                                                                          | See _values.yaml_                      |
| `policy`                          | How DNS records are synchronized between sources and providers, available values are: `sync`, `upsert-only`.                    | `upsert-only`                          |
| `registry`                        | Registry Type, available types are: `txt`, `noop`.                                                                              | `txt`                                  |
| `txtOwnerId`                      | TXT registry identifier.                                                                                                        | `""`                                   |
| `txtPrefix`                       | Prefix to create a TXT record with a name following the pattern `prefix.<CNAME record>`.                                        | `""`                                   |
| `domainFilters`                   | Limit possible target zones by domain suffixes.                                                                                 | `[]`                                   |
| `provider`                        | DNS provider where the DNS records will be created.                                                                             | `aws`                                  |
| `extraArgs`                       | Extra arguments to pass to the _external-dns_ container.                                                                        | `[]`                                   |
