# Jira Software

Atlassian [Jira Software](https://www.atlassian.com/software/jira) is built for every member of your software team to plan, track, and release great software.

## TL;DR:

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
helm install --name my-release stevehipwell/jira-software
```

## Introduction

This chart bootstraps a [atlassian/jira-software](https://hub.docker.com/r/atlassian/jira-software/) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.14+

## Installing the Chart

To install the chart with the release name `my-release`:

```shell
helm install --name my-release stable/jira-software
```

The command deploys _Jira Software_ on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```shell
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the _Jira Software_ chart and their default values.

| Parameter                   | Description                                                                                    | Default                                                 |
| --------------------------- | ---------------------------------------------------------------------------------------------- | ------------------------------------------------------- |
| `image.repository`          | Docker repository to use                                                                       | `atlassian/jira-software`                               |
| `image.tag`                 | Docker tag to use                                                                              | `8.10.0`                                                |
| `image.pullPolicy`          | Docker image pull policy                                                                       | `IfNotPresent`                                          |
| `nameOverride`              | String to partially override `jira-software.fullname` template (will prepend the release name) | `nil`                                                   |
| `fullnameOverride`          | String to fully override `jira-software.fullname` template                                     | `nil`                                                   |
| `service.type`              | Type of service                                                                                | `ClusterIP`                                             |
| `service.port`              | Service port                                                                                   | `8080`                                                  |
| `caCerts.secret`            | Name of the secret containing additional CA certificates                                       | `nil`                                                   |
| `psql.host`                 | External _PostgreSQL_ host to use (if this is set the additional `psql` values need to be set) | `nil`                                                   |
| `psql.port`                 | External _PostgreSQL_ port                                                                     | `nil`                                                   |
| `psql.database`             | External _PostgreSQL_ database                                                                 | `nil`                                                   |
| `psql.username`             | External _PostgreSQL_ username                                                                 | `nil`                                                   |
| `psql.password.secret`      | Name of the secret containing the external _PostgreSQL_ password                               | `nil`                                                   |
| `psql.password.key`         | Key on the secret containing the external _PostgreSQL_ password                                | `nil`                                                   |
| `envVars.jvmMinMemory`      | JVM minimum memory                                                                             | `384M`                                                  |
| `envVars.jvmMaxMemory`      | JVM maximum memory                                                                             | `768M`                                                  |
| `envVars.jvmMemoryOptions`  | JVM memory options                                                                             | `-XX:MaxMetaspaceSize=512m -XX:MaxDirectMemorySize=10m` |
| `envVars.opts`              | Additional options                                                                             | `""`                                                    |
| `env`                       | List of environmental variable to apply to the deployment                                      | `nil`                                                   |
| `persistence.enabled`       | Create a volume (PVC) for storage                                                              | `false`                                                 |
| `persistence.existingClaim` | An existing PVC to use instead of creating a new one                                           | `nil`                                                   |
| `persistence.accessMode`    | The PVC access mode                                                                            | `ReadWriteOnce`                                         |
| `persistence.storageClass`  | The PVC storage class (use `-` for default)                                                    | `standard`                                              |
| `persistence.size`          | The size of the PVC to create                                                                  | `8Gi`                                                   |
| `podAnnotations`            | Pod Annotations                                                                                | `{}`                                                    |
| `resources`                 | Resource requests and limits                                                                   | `{}`                                                    |
| `nodeSelector`              | Node labels for pod assignment                                                                 | `{}`                                                    |
| `tolerations`               | List of node taints to tolerate                                                                | `[]`                                                    |
| `affinity`                  | Map of node/pod affinities                                                                     | `{}`                                                    |
| `ingress.enabled`           | Create an ingress                                                                              | `false`                                                 |
| `ingress.annotations`       | Annotations to enhance ingress configuration                                                   | `{}`                                                    |
| `ingress.path`              | Path for ingress rules                                                                         | `/`                                                     |
| `ingress.hosts`             | List of ingress hosts                                                                          | `[]`                                                    |
| `ingress.tls`               | List of TLS configurations (`ingress.tls[n].secretName`, `ingress.tls[n].hosts[m])`            | `[]`                                                    |
| `postgresql.enabled`        | Enable _PostgreSQL_ sub chart                                                                  | `false`                                                 |

## Database

By default the [atlassian/jira-software](https://hub.docker.com/r/atlassian/jira-software/) image will create a [H2](https://www.h2database.com/html/main.html) database for evaluation purposes, this should **NOT be used in production**. You can either allow this chart to create a [PostgreSQL](https://hub.docker.com/_/postgres) instance specifically for _Jira Software_ by specifying `postgresql.enabled` as `true` or you can use an external _PostgreSQL_ instance by specifying the connection details on `psql`.

## Persistence

The [atlassian/jira-software](https://hub.docker.com/r/atlassian/jira-software/) image stores the _Jira Software_ data and configurations at the `/var/atlassian/application-data/jira` path in the container.

Persistent Volume Claims are used to keep the data across deployments. This is known to work in GCE, AWS, and minikube.
See the [Configuration](#configuration) section to configure the PVC or to disable persistence.
