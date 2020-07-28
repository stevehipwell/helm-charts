# Nexus3

Sonatype [Nexus3](https://www.sonatype.com/nexus-repository-oss) is a free open source repository manager. It supports a wide range of package formats and it's used by hundreds of tech companies.

## TL;DR:

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
helm install stevehipwell/nexus3 --name my-release
```

## Introduction

This chart bootstraps a [sonatype/nexus3](https://hub.docker.com/r/sonatype/nexus3/) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.14+

## Installing the Chart

To install the chart with the release name `my-release`:

```shell
helm install --name my-release stable/nexus3
```

The command deploys _Nexus3_ on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```shell
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the _Nexus3_ chart and their default values.

| Parameter                                 | Description                                                                                                                      | Default                              |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------ |
| `image.repository`                        | Image repository.                                                                                                                | `sonatype/nexus3`                    |
| `image.tag`                               | Image tag.                                                                                                                       | `3.25.0`                             |
| `image.pullPolicy`                        | Image pull policy.                                                                                                               | `IfNotPresent`                       |
| `image.pullSecrets`                       | Image pull secrets.                                                                                                              | `[]`                                 |
| `nameOverride`                            | Override the name of the chart.                                                                                                  | `nil`                                |
| `fullnameOverride`                        | Override the fullname of the chart.                                                                                              | `nil`                                |
| `serviceAccount.create`                   | If `true`, create a new service account.                                                                                         | `true`                               |
| `serviceAccount.annotations`              | Annotations to add to the service account.                                                                                       | `{}`                                 |
| `serviceAccount.name`                     | Service account to be used. If not set and `serviceAccount.create` is `true`, a name is generated using the _fullname_ template. | `nil`                                |
| `podAnnotations`                          | Annotations to add to the primary container.                                                                                     | `{}`                                 |
| `securityContext`                         | Security context for the pod.                                                                                                    | `{}`                                 |
| `podSecurityContext`                      | Security context for the primary container.                                                                                      | `{ fsGroup: 200 }`                   |
| `service.type`                            | Service type.                                                                                                                    | `ClusterIP`                          |
| `service.annotations`                     | Annotations to add to the service.                                                                                               | `{}`                                 |
| `service.port`                            | Service port.                                                                                                                    | `8881`                               |
| `service.additionalPorts`                 | Additional ports exposed by the service and used by repository connectors.                                                       | `nil`                                |
| `metrics.enabled`                         | If `true`, metrics will be enabled (with anonymous access).                                                                      | `false`                              |
| `metrics.serviceMonitor.enabled`          | If `true`, create a Prometheus service monitor.                                                                                  | `false`                              |
| `metrics.serviceMonitor.additionalLabels` | Additional labels to be set on the Prometheus ServiceMonitor.                                                                    | `{}`                                 |
| `metrics.serviceMonitor.interval`         | Prometheus scrape frequency.                                                                                                     | `nil`                                |
| `ingress.enabled`                         | If `true`, create an ingress object.                                                                                             | `false`                              |
| `ingress.annotations`                     | Ingress annotations.                                                                                                             | `{}`                                 |
| `ingress.path`                            | Ingress path.                                                                                                                    | `/`                                  |
| `ingress.hosts`                           | Ingress hosts.                                                                                                                   | `[]`                                 |
| `ingress.tls`                             | Ingress TLS configuration                                                                                                        | `[]`                                 |
| `persistence.enabled`                     | If `true`, create a PVC.                                                                                                         | `false`                              |
| `persistence.annotations`                 | Annotations to add to the PVC.                                                                                                   | `{}`                                 |
| `persistence.existingClaim`               | Use an existing PVC to persist data.                                                                                             | `nil`                                |
| `persistence.accessMode`                  | Persistence access mode.                                                                                                         | `ReadWriteOnce`                      |
| `persistence.storageClass`                | PVC storage class (use `-` for default).                                                                                         | `standard`                           |
| `persistence.size`                        | Size of PVC to create.                                                                                                           | `8Gi`                                |
| `resources`                               | Resource requests and limits for the primary container.                                                                          | `{}`                                 |
| `nodeSelector`                            | Node labels for pod assignment.                                                                                                  | `{}`                                 |
| `tolerations`                             | Toleration labels for pod assignment.                                                                                            | `[]`                                 |
| `affinity`                                | Affinity settings for pod assignment.                                                                                            | `{}`                                 |
| `caCerts.secret`                          | Name of secret containing additional CA certificates.                                                                            | `nil`                                |
| `envVars.jvmMaxRAMPercentage`             | JVM max RAM percentage.                                                                                                          | `25.0`                               |
| `envVars.jvmMaxDirectMemorySize`          | JVM direct memory size.                                                                                                          | `2G`                                 |
| `env`                                     | Environment variables for all containers in the pod.                                                                             | `nil`                                |
| `properties`                              | Additional _Nexus_ properties.                                                                                                   | `[nexus.scripts.allowCreation=true]` |
| `config.enabled`                          | If `true`, automatically configure _Nexus_.                                                                                      | `false`                              |
| `config.rootPassword.secret`              | Secret to update the root password with (must also have `config.rootPassword.key` set).                                          | `nil`                                |
| `config.rootPassword.key`                 | Key on the secret set in `config.rootPassword.secret`.                                                                           | `nil`                                |
| `config.anonymous.enabled`                | If `true`, allow anonymous access.                                                                                               | `false`                              |
| `config.realms.enabled`                   | If `true`, realms should be configured.                                                                                          | `false`                              |
| `config.realms.values`                    | Realm ids to enable, in priority order.                                                                                          | `[]`                                 |
| `config.ldap.enabled`                     | If `true`, configure LDAP.                                                                                                       | `false`                              |
| `config.cleanup`                          | Cleanup policies to be configured.                                                                                               | `[]`                                 |
| `config.repos`                            | Repos to be configured.                                                                                                          | `[]`                                 |
| `config.tasks`                            | Tasks to be configured.                                                                                                          | `[]`                                 |

## Persistence

The [sonatype/nexus3](https://hub.docker.com/r/sonatype/nexus3/) image stores the _Nexus3_ data and configurations at the `/nexus-data` path in the container.

Persistent Volume Claims are used to keep the data across deployments. This is known to work in GCE, AWS, and minikube.
See the [Configuration](#configuration) section to configure the PVC or to disable persistence.
