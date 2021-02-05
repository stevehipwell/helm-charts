# SonarQube

[SonarQube](https://www.sonarqube.org/) empowers all developers to write cleaner and safer code.

## Installing the Chart

Before you can install the chart you will need to add the `stevehipwell` repo to [Helm](https://helm.sh/).

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
```

After you've installed the repo you can install the chart.

```shell
helm upgrade --install --namespace default --values ./my-values.yaml my-release stevehipwell/sonarqube
```

## Configuration

The following table lists the configurable parameters of the _SonarQube_ chart and their default values.

| Parameter                       | Description                                                                                                                      | Default                             |
| ------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------- |
| `image.repository`              | Image repository.                                                                                                                | `sonarqube`                         |
| `image.tag`                     | Image tag.                                                                                                                       | `{{ .Chart.AppVersion }}-community` |
| `image.pullPolicy`              | Image pull policy.                                                                                                               | `IfNotPresent`                      |
| `image.pullSecrets`             | Image pull secrets.                                                                                                              | `[]`                                |
| `nameOverride`                  | Override the name of the chart.                                                                                                  | `nil`                               |
| `fullnameOverride`              | Override the fullname of the chart.                                                                                              | `nil`                               |
| `serviceAccount.create`         | If `true`, create a new service account.                                                                                         | `true`                              |
| `serviceAccount.annotations`    | Annotations to add to the service account.                                                                                       | `{}`                                |
| `serviceAccount.name`           | Service account to be used. If not set and `serviceAccount.create` is `true`, a name is generated using the _fullname_ template. | `nil`                               |
| `podAnnotations`                | Annotations to add to the pod.                                                                                                   | `{}`                                |
| `podSecurityContext`            | Security context for the pod.                                                                                                    | `{ fsGroup: 1000 }`                 |
| `securityContext`               | Security context for the primary container.                                                                                      | `{ runAsUser: 1000 }`               |
| `priorityClassName`             | Priority class name to use.                                                                                                      | `""`                                |
| `livenessProbe`                 | The liveness probe.                                                                                                              | See _values.yaml_                   |
| `readinessProbe`                | The readiness probe.                                                                                                             | See _values.yaml_                   |
| `service.type`                  | Service type.                                                                                                                    | `ClusterIP`                         |
| `service.annotations`           | Annotations to add to the service.                                                                                               | `{}`                                |
| `service.port`                  | Service port.                                                                                                                    | `9000`                              |
| `ingress.enabled`               | If `true`, create an ingress object.                                                                                             | `false`                             |
| `ingress.annotations`           | Ingress annotations.                                                                                                             | `{}`                                |
| `ingress.hosts`                 | Ingress hosts.                                                                                                                   | See _values.yaml_                   |
| `ingress.tls`                   | Ingress TLS configuration                                                                                                        | See _values.yaml_                   |
| `persistence.enabled`           | If `true`, create a PVC.                                                                                                         | `false`                             |
| `persistence.annotations`       | Annotations to add to the PVC.                                                                                                   | `{}`                                |
| `persistence.existingClaim`     | Use an existing PVC to persist data.                                                                                             | `nil`                               |
| `persistence.accessMode`        | Persistence access mode.                                                                                                         | `ReadWriteOnce`                     |
| `persistence.storageClass`      | PVC storage class (use `-` for default).                                                                                         | `standard`                          |
| `persistence.size`              | Size of PVC to create.                                                                                                           | `8Gi`                               |
| `resources`                     | Resource requests and limits for the primary container.                                                                          | `{}`                                |
| `nodeSelector`                  | Node labels for pod assignment.                                                                                                  | `{}`                                |
| `tolerations`                   | Toleration labels for pod assignment.                                                                                            | `[]`                                |
| `affinity`                      | Affinity settings for pod assignment.                                                                                            | `{}`                                |
| `caCerts.enabled`               | If `true`, add provided CA certificates to the JVM _cacerts_ key store.                                                          | `false`                             |
| `caCerts.secret`                | Secret containing the additional CA certificates.                                                                                | `nil`                               |
| `envVars.jvmOptions`            | JVM options to pass to the container via _SONAR_WEB_JAVAOPTS_.                                                                   | `""`                                |
| `envVars.jvmAdditionalOptions`  | JVM options to pass to the container via _SONAR_WEB_JAVAADDITIONALOPTS_.                                                         | `""`                                |
| `env`                           | Environment variables for all containers in the pod.                                                                             | `[]`                                |
| `sonarProperties`               | A map of _SonarQube_ properties.                                                                                                 | `{}`                                |
| `sonarSecretProperties.enabled` | If there is a secret to provide properties to _SonarQube_.                                                                       | `false`                             |
| `sonarSecretProperties.secret`  | The secret name that contains the _SonarQube_ properties.                                                                        | `nil`                               |
| `sonarSecretProperties.key`     | The key on the secret that contains the _SonarQube_ properties.                                                                  | `nil`                               |
| `installPlugins.enabled`        | If plugins should be installed.                                                                                                  | `false`                             |
| `installPlugins.plugins`        | The plugins to install (see _values.yaml_ for structure.).                                                                       | `[]`                                |
| `psql.host`                     | External _PostgreSQL_ host to use (if this is set the additional `psql` values need to be set)                                   | `nil`                               |
| `psql.port`                     | External _PostgreSQL_ port                                                                                                       | `nil`                               |
| `psql.database`                 | External _PostgreSQL_ database                                                                                                   | `nil`                               |
| `psql.username`                 | External _PostgreSQL_ username                                                                                                   | `nil`                               |
| `psql.password.secret`          | Name of the secret containing the external _PostgreSQL_ password                                                                 | `nil`                               |
| `psql.password.key`             | Key on the secret containing the external _PostgreSQL_ password                                                                  | `nil`                               |
| `postgresql.enabled`            | Enable _PostgreSQL_ sub chart, see [chart](https://hub.helm.sh/charts/bitnami/postgresql/4.2.2) for additional values.           | `false`                             |

## Database

By default the [sonarqube](https://hub.docker.com/_/sonarqube/) image will create a [H2](https://www.h2database.com/html/main.html) database for evaluation purposes, this should **NOT be used in production**. You can either allow this chart to create a [PostgreSQL](https://hub.docker.com/_/postgres) instance specifically for _SonarQube_ by specifying `postgresql.enabled` as `true` or you can use an external _PostgreSQL_ instance by specifying the connection details on `psql`.

## Persistence

The [sonarqube](https://hub.docker.com/_/sonarqube/) image stores the _SonarQube_ data and configurations at the `/opt/sonarqube` path in the container.

Persistent Volume Claims are used to keep the data across deployments. This is known to work in GCE, AWS, and minikube.
See the [Configuration](#configuration) section to configure the PVC or to disable persistence.
