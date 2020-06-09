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

| Parameter                                 | Description                                                                             | Default           |
| ----------------------------------------- | --------------------------------------------------------------------------------------- | ----------------- |
| `image.repository`                        | Docker repository to use                                                                | `sonatype/nexus3` |
| `image.tag`                               | Docker tag to use                                                                       | `3.24.0`          |
| `image.pullPolicy`                        | Docker image pull policy                                                                | `IfNotPresent`    |
| `nameOverride`                            | String to partially override `nexus3.fullname` template (will prepend the release name) | `nil`             |
| `fullnameOverride`                        | String to fully override `nexus3.fullname` template                                     | `nil`             |
| `securityContext.fsGroup`                 | File system group ownership                                                             | `200`             |
| `service.type`                            | Type of service                                                                         | `ClusterIP`       |
| `service.port`                            | Service port                                                                            | `8881`            |
| `service.additionalPorts`                 | Additional ports exposed by the service and used by repository connectors               | `nil`             |
| `caCerts.secret`                          | Name of the secret containing additional CA certificates                                | `nil`             |
| `metrics.enabled`                         | Metrics enabled for anonymous access                                                    | `false`           |
| `metrics.serviceMonitor.enabled`          | Prometheus service monitor created                                                      | `false`           |
| `metrics.serviceMonitor.additionalLabels` | Additional labels to be set on the ServiceMonitor                                       | `{}`              |
| `envVars.jvmMaxRAMPercentage`             | JVM max RAM percentage                                                                  | `25.0`            |
| `envVars.jvmMaxDirectMemorySize`          | JVM direct memory size                                                                  | `2G`              |
| `env`                                     | List of environmental variable to apply to the deployment                               | `nil`             |
| `persistence.enabled`                     | Create a volume (PVC) for storage                                                       | `false`           |
| `persistence.existingClaim`               | An existing PVC to use instead of creating a new one                                    | `nil`             |
| `persistence.accessMode`                  | The PVC access mode                                                                     | `ReadWriteOnce`   |
| `persistence.storageClass`                | The PVC storage class (use `-` for default)                                             | `standard`        |
| `persistence.size`                        | The size of the PVC to create                                                           | `8Gi`             |
| `podAnnotations`                          | Pod Annotations                                                                         | `{}`              |
| `resources`                               | Resource requests and limits                                                            | `{}`              |
| `nodeSelector`                            | Node labels for pod assignment                                                          | `{}`              |
| `tolerations`                             | List of node taints to tolerate                                                         | `[]`              |
| `affinity`                                | Map of node/pod affinities                                                              | `{}`              |
| `ingress.enabled`                         | Create an ingress                                                                       | `false`           |
| `ingress.annotations`                     | Annotations to enhance ingress configuration                                            | `{}`              |
| `ingress.path`                            | Path for ingress rules                                                                  | `/`               |
| `ingress.hosts`                           | List of ingress hosts                                                                   | `[]`              |
| `ingress.tls`                             | List of TLS configurations (`ingress.tls[n].secretName`, `ingress.tls[n].hosts[m])`     | `[]`              |
| `properties.enabled`                      | Support passing _Nexus3_ properties.                                                    | `false`           |
| `properties.values`                       | The properties to pass to _Nexus3_.                                                     | `nil`             |
| `config.enabled`                          | Automatically configure _Nexus3_                                                        | `false`           |

## Persistence

The [sonatype/nexus3](https://hub.docker.com/r/sonatype/nexus3/) image stores the _Nexus3_ data and configurations at the `/nexus-data` path in the container.

Persistent Volume Claims are used to keep the data across deployments. This is known to work in GCE, AWS, and minikube.
See the [Configuration](#configuration) section to configure the PVC or to disable persistence.
