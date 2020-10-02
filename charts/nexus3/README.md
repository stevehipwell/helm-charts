# Nexus 3

[Sonatype Nexus 3](https://www.sonatype.com/nexus-repository-oss) is The free artefact repository with universal format support.

## Installing the Chart

Before you can install the chart you will need to add the `stevehipwell` repo to [Helm](https://helm.sh/).

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
```

After you've installed the repo you can install the chart.

```shell
helm upgrade --install --namespace default --values ./my-values.yaml my-release stevehipwell/nexus3
```

## Configuration

The following table lists the configurable parameters of the _Nexus 3_ chart and their default values.

| Parameter                                 | Description                                                                                                                      | Default                              |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------ |
| `image.repository`                        | Image repository.                                                                                                                | `sonatype/nexus3`                    |
| `image.tag`                               | Image tag.                                                                                                                       | `3.28.0`                             |
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
| `metrics.enabled`                         | If `true`, metrics will be enabled (with anonymous access configured).                                                           | `false`                              |
| `metrics.serviceMonitor.enabled`          | If `true`, create a Prometheus service monitor.                                                                                  | `false`                              |
| `metrics.serviceMonitor.additionalLabels` | Additional labels to be set on the Prometheus ServiceMonitor.                                                                    | `{}`                                 |
| `metrics.serviceMonitor.interval`         | Prometheus scrape frequency.                                                                                                     | `1m`                                 |
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
| `extraVolumes`                            | Additional volumes.                                                                                                              | `[]`                                 |
| `extraVolumeMounts`                       | Additional mounts.                                                                                                               | `[]`                                 |
| `resources`                               | Resource requests and limits for the primary container.                                                                          | `{}`                                 |
| `nodeSelector`                            | Node labels for pod assignment.                                                                                                  | `{}`                                 |
| `tolerations`                             | Toleration labels for pod assignment.                                                                                            | `[]`                                 |
| `affinity`                                | Affinity settings for pod assignment.                                                                                            | `{}`                                 |
| `caCerts.enabled`                         | If `true`, add provided CA certificates to the JVM cacerts key store.                                                            | `false`                              |
| `caCerts.secret`                          | Secret containing the additional CA certificates.                                                                                | `nil`                                |
| `envVars.jvmMinHeapSize`                  | JVM min heap size (should match `jvmMaxHeapSize`).                                                                               | `1024m`                              |
| `envVars.jvmMaxHeapSize`                  | JVM max heap size (should match `jvmMinHeapSize`).                                                                               | `1024m`                              |
| `envVars.jvmAdditionalMemoryOptions`      | Additional JVM memory options.                                                                                                   | `-XX:MaxDirectMemorySize=2048m`      |
| `envVars.jvmAdditionalOptions`            | Additional JVM options.                                                                                                          | `""`                                 |
| `env`                                     | Environment variables for all containers in the pod.                                                                             | `nil`                                |
| `logback.maxHistory`                      | Logback retention period in days.                                                                                                | `30`                                 |
| `properties`                              | Additional _Nexus_ properties.                                                                                                   | `[nexus.scripts.allowCreation=true]` |
| `config.enabled`                          | If `true`, automatically configure _Nexus_.                                                                                      | `false`                              |
| `config.rootPassword.secret`              | Secret to update the root password with (must also have `config.rootPassword.key` set).                                          | `nil`                                |
| `config.rootPassword.key`                 | Key on the secret set in `config.rootPassword.secret`.                                                                           | `nil`                                |
| `config.anonymous.enabled`                | If `true`, allow anonymous access.                                                                                               | `false`                              |
| `config.realms.enabled`                   | If `true`, realms should be configured.                                                                                          | `false`                              |
| `config.realms.values`                    | Realm ids to enable, in priority order (see `values.yaml` for available realms).                                                 | `[]`                                 |
| `config.ldap.enabled`                     | If `true`, configure LDAP.                                                                                                       | `false`                              |
| `config.ldap.name`                        | Unique name for the LDAP configuration.                                                                                          | `nil`                                |
| `config.ldap.protocol`                    | LDAP protocol, either `ldaps` or `ldap`.                                                                                         | `ldaps`                              |
| `config.ldap.useTrustStore`               | Use _Nexus_ trust store for certificate validation.                                                                              | `true`                               |
| `config.ldap.connectionTimeoutSeconds`    | LDAP connection timeout.                                                                                                         | `30`                                 |
| `config.ldap.connectionRetryDelaySeconds` | LDAP connection retry delay.                                                                                                     | `300`                                |
| `config.ldap.maxIncidentsCount`           | LDAP connection max incidents.                                                                                                   | `3`                                  |
| `config.ldap.host`                        | LDAP host.                                                                                                                       | `nil`                                |
| `config.ldap.port`                        | LDAP port.                                                                                                                       | `636`                                |
| `config.ldap.authScheme`                  | LDAP authentication schema.                                                                                                      | `simple`                             |
| `config.ldap.authUsername`                | Username or DN (Distinguished Name) of an LDAP user, used to connect to the LDAP server.                                         | `nil`                                |
| `config.ldap.authPassword.secret`         | Secret containing the password to connect to the LDAP server.                                                                    | `nil`                                |
| `config.ldap.authPassword.key`            | The key on the secret containing the password to connect to the LDAP server.                                                     | `nil`                                |
| `config.ldap.authRealm`                   | LDAP authentication realm.                                                                                                       | `nil`                                |
| `config.ldap.searchBase`                  | LDAP search base.                                                                                                                | `nil`                                |
| `config.ldap.userBaseDn`                  | LDAP user base, relative to the search base.                                                                                     | `nil`                                |
| `config.ldap.userSubtree`                 | If `true`, LDAP users in trees below the user base are valid.                                                                    | `false`                              |
| `config.ldap.userObjectClass`             | LDAP object class for users.                                                                                                     | `user`                               |
| `config.ldap.userLdapFilter`              | LDAP user filter.                                                                                                                | `nil`                                |
| `config.ldap.userIdAttribute`             | LDAP user id attribute.                                                                                                          | `sAMAccountName`                     |
| `config.ldap.userRealNameAttribute`       | LDAP user real name attribute.                                                                                                   | `cn`                                 |
| `config.ldap.userEmailAddressAttribute`   | LDAP user email address attribute.                                                                                               | `email`                              |
| `config.ldap.userPasswordAttribute`       | LDAP user password attribute.                                                                                                    | `nil`                                |
| `config.ldap.ldapGroupsAsRoles`           | If `true`, LDAP user groups will be treated as a _Nexus_ role.                                                                   | `false`                              |
| `config.ldap.groupType`                   | LDAP group type, either `dynamic` or `static`.                                                                                   | `dynamic`                            |
| `config.ldap.userMemberOfAttribute`       | LDAP user member of attribute, required if `groupType` is `dynamic`.                                                             | `memberOf`                           |
| `config.ldap.groupBaseDn`                 | LDAP group base, required if `groupType` is `static`.                                                                            | `nil`                                |
| `config.ldap.groupSubtree`                | If `true`, LDAP groups in trees below the group base are valid (only used if `groupType` is `static`).                           | `false`                              |
| `config.ldap.groupObjectClass`            | LDAP group object class, required if `groupType` is `static`.                                                                    | `nil`                                |
| `config.ldap.groupIdAttribute`            | LDAP group id attribute, required if `groupType` is `static`.                                                                    | `nil`                                |
| `config.ldap.groupMemberAttribute`        | LDAP group member attribute, required if `groupType` is `static`.                                                                | `nil`                                |
| `config.ldap.groupMemberFormat`           | LDAP group member format, required if `groupType` is `static`.                                                                   | `nil`                                |
| `config.blobStores`                       | Blob stores to be configured (see `values.yaml` for structure).                                                                  | `[]`                                 |
| `config.roles`                            | Roles to be configured (see `values.yaml` for structure).                                                                        | `[]`                                 |
| `config.cleanup`                          | Cleanup policies to be configured (see `values.yaml` for structure).                                                             | `[]`                                 |
| `config.repos`                            | Repos to be configured (see `values.yaml` for structure).                                                                        | `[]`                                 |
| `config.tasks`                            | Tasks to be configured (see `values.yaml` for structure).                                                                        | `[]`                                 |
