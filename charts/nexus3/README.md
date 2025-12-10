# nexus3

![Version: 5.17.1](https://img.shields.io/badge/Version-5.17.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.87.1](https://img.shields.io/badge/AppVersion-3.87.1-informational?style=flat-square)

Helm chart for Sonatype Nexus 3 OSS.

**Homepage:** <https://www.sonatype.com/products/sonatype-nexus-repository>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| stevehipwell | <steve.hipwell@gmail.com> |  |

## Source Code

* <https://github.com/sonatype/nexus-public>
* <https://github.com/sonatype/docker-nexus3>
* <https://github.com/stevehipwell/helm-charts/>

## Installing the Chart

### OCI Repository

To install the chart using the recommended OCI method you can use the following command.

```shell
helm upgrade --install nexus3 oci://ghcr.io/stevehipwell/helm-charts/nexus3 --version 5.17.1
```

#### Verification

As the OCI chart release is signed by [Cosign](https://github.com/sigstore/cosign) you can verify the chart before installing it by running the following command.

```shell
cosign verify --certificate-oidc-issuer https://token.actions.githubusercontent.com --certificate-identity-regexp 'https://github\.com/action-stars/helm-workflows/\.github/workflows/release\.yaml@.+' --certificate-github-workflow-repository stevehipwell/helm-charts --certificate-github-workflow-name Release ghcr.io/stevehipwell/helm-charts/nexus3:5.17.1
```

### Non-OCI Repository

Alternatively you can use the legacy non-OCI method via the following commands.

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
helm upgrade --install nexus3 stevehipwell/nexus3 --version 5.17.1
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for pod scheduling. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| automountServiceAccountToken | bool | `nil` | If the service account token should be mounted to the pod, this overrides `serviceAccount.automountToken`. |
| bashImage.digest | string | `nil` | Optional image digest for the bash containers. |
| bashImage.pullPolicy | string | `"IfNotPresent"` | Image pull policy for bash containers. |
| bashImage.repository | string | `"cgr.dev/chainguard/bash"` | Image repository for bash containers. |
| bashImage.tag | string | `"latest"` | Image tag for bash containers, this will be omitted if set to `-`. |
| caCerts.enabled | bool | `false` | If `true`, add the CA certificates in the provided secret to the JVM cacerts key store. |
| caCerts.secret | string | `nil` | Name of the secret containing the CA certificates. |
| chownDataDir | bool | `true` | If `true`, the _chown-data-dir_ init container will be enabled, this should not be required for most CSI drivers but is left in for backwards compatibility. For new chart installs this should be set to `false`. |
| commonLabels | object | `{}` | Labels to add to all chart resources. |
| config.anonymous.enabled | bool | `false` | If `true`, enable anonymous access. |
| config.anonymous.roles | list | `["nx-anonymous","nx-metrics"]` | Roles for anonymous access. |
| config.blobStores | list | `[]` | Blob store configuration; based on the REST API (API reference docs require an existing Nexus installation and can be found at **Administration** under _System_ → _API_). |
| config.cleanup | list | `[]` | Cleanup configuration. |
| config.enabled | bool | `false` | If `true` & `rootPassword.secret` is set, enable the configuration Job. |
| config.job.affinity | object | `{}` | Affinity settings for scheduling the config job. |
| config.job.annotations | object | `{}` | Annotations to apply to the config job. |
| config.job.image.digest | string | `nil` | Optional image digest for the config container. |
| config.job.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for config container. |
| config.job.image.repository | string | `"docker.io/alpine/k8s"` | Image repository for the config container. |
| config.job.image.tag | string | `"1.31.2"` | Image tag for config container, this will be omitted if set to `-`. |
| config.job.nodeSelector | object | `{}` | Node labels to match for scheduling the config job. |
| config.job.podLabels | object | `{}` | Labels to add to the config job pod. |
| config.job.podSecurityContext | object | `{"fsGroup":200,"runAsNonRoot":false,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the pod. |
| config.job.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":65532,"runAsNonRoot":true,"runAsUser":65532}` | Security context for non-root containers. |
| config.job.tolerations | list | `[]` | Node taints which will be tolerated for scheduling the config job. |
| config.job.ttlSecondsAfterFinished | int | `600` | The number of seconds to keep the config job after it's finished. |
| config.ldap | object | `{"authPassword":{"key":null,"secret":null},"authRealm":null,"authScheme":"simple","authUsername":null,"connectionRetryDelaySeconds":300,"connectionTimeoutSeconds":30,"enabled":false,"groupBaseDn":null,"groupIdAttribute":null,"groupMemberAttribute":null,"groupMemberFormat":null,"groupObjectClass":null,"groupSubtree":false,"groupType":"dynamic","host":null,"ldapGroupsAsRoles":false,"maxIncidentsCount":3,"name":null,"port":636,"protocol":"ldaps","searchBase":null,"useTrustStore":true,"userBaseDn":null,"userEmailAddressAttribute":"email","userIdAttribute":"sAMAccountName","userLdapFilter":null,"userMemberOfAttribute":"memberOf","userObjectClass":"user","userPasswordAttribute":null,"userRealNameAttribute":"cn","userSubtree":false}` | LDAP configuration; based on the REST API (API reference docs require an existing Nexus installation and can be found at **Administration** under _System_ → _API_). |
| config.privileges | list | `[]` | Privileges configuration; based on the REST API (API reference docs require an existing Nexus installation and can be found at **Administration** under _System_ → _API_). |
| config.realms.enabled | bool | `false` | If `true`, enable realms. |
| config.realms.values | list | `[]` | List of realms to configure; can be empty or contain any of `NexusAuthenticatingRealm`, `LdapRealm`, `DockerToken`, `NpmToken`, `NuGetApiKey` or `rutauth-realm`. |
| config.repoCredentials.enabled | bool | `false` | **DEPRECATED** - If `true`, enable repository credentials. Use inline repo password instead. |
| config.repoCredentials.secret | string | `nil` | Name of the secret containing the repository credentials. |
| config.repos | list | `[]` | Repository configuration; based on the REST API (API reference docs require an existing Nexus installation and can be found at **Administration** under _System_ → _API_) but with `format` & `type` defined in the object. |
| config.roles | list | `[]` | Roles configuration; based on the REST API (API reference docs require an existing Nexus installation and can be found at **Administration** under _System_ → _API_). |
| config.tasks | list | `[]` | Task configuration. |
| config.users | list | `[]` | Users configuration; based on the REST API (API reference docs require an existing Nexus installation and can be found at **Administration** under _System_ → _API_). |
| env | list | `[]` | Environment variables for the default container. |
| extraInitContainers | list | `[]` | Extra init container to run before the default container. |
| extraVolumeMounts | list | `[]` | Extra volume mounts for the default container. |
| extraVolumes | list | `[]` | Extra volumes for the pod. |
| fullnameOverride | string | `nil` | Override the full name of the chart. |
| image.digest | string | `nil` | Optional image digest for the default container. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the default container. |
| image.repository | string | `"docker.io/sonatype/nexus3"` | Image repository for the default container. |
| image.tag | string | `nil` | Image tag for the default container, this will default to `.Chart.AppVersion` if not set and will be omitted if set to `-`. |
| imagePullSecrets | list | `[]` | Image pull secrets. |
| ingress.annotations | object | `{}` | Ingress annotations. |
| ingress.enabled | bool | `false` | If `true`, create an `Ingress` resource. |
| ingress.hosts | list | See _values.yaml_ | Ingress hosts, do not include hosts defined in `service.additionalPorts`. |
| ingress.ingressClassName | string | `nil` | Ingress class name. |
| ingress.tls | list | See _values.yaml_ | Ingress TLS, hosts defined in both `ingress.hosts` & `service.additionalPorts[*].hosts` should be covered. |
| initNonRootSecurityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":65532,"runAsNonRoot":true,"runAsUser":65532}` | Security context for non-root init containers. |
| initRootSecurityContext | object | `{"allowPrivilegeEscalation":false,"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":0,"runAsNonRoot":false,"runAsUser":0}` | Security context for root init container. |
| install4jAddVmParams | string | `"-Xms1024m -Xmx1024m -XX:MaxDirectMemorySize=2048m"` | Env configuration for the _Nexus3_ container. |
| jdkImage.digest | string | `nil` | Optional image digest for the JDK container. |
| jdkImage.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the JDK container. |
| jdkImage.repository | string | `"docker.io/eclipse-temurin"` | Image repository for the JDK container. |
| jdkImage.tag | string | `"21-jdk"` | Image tag for the JDK container, this will be omitted if set to `-`. |
| license.enabled | bool | `false` | If `true`, use the license in the provided secret. This must be set to enable [Pro features](https://help.sonatype.com/en/repository-manager-pro-features.html). |
| license.key | string | `"nexus.license"` | Key in the secret containing the license. |
| license.secret | string | `nil` | Name of the secret containing the license. |
| livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the default container. |
| logback.maxHistory | int | `30` | Maximum history for log files. |
| manualMaintenanceMode.args | list | `["while true; do sleep 60; done"]` | The arguments to pass to the command in manual maintenance mode. |
| manualMaintenanceMode.command | list | `["/bin/bash","-c"]` | The command to run in manual maintenance mode. |
| manualMaintenanceMode.enabled | bool | `false` | If `true`, enable manual maintenance mode. This is running the default container with a custom command, reducing the termination grace period to 10s and disabling the probes. |
| metrics.enabled | bool | `false` | If `true`, enable metrics. |
| metrics.serviceMonitor.additionalLabels | object | `{}` | Additional labels for the `ServiceMonitor`. |
| metrics.serviceMonitor.enabled | bool | `false` | If `true`, create a `ServiceMonitor` resource to support the _Prometheus Operator_. |
| metrics.serviceMonitor.endpointConfig | object | `{}` | Additional endpoint configuration for the `ServiceMonitor`. |
| minReadySeconds | int | `nil` | Min ready seconds for the `StatefulSet`. |
| nameOverride | string | `nil` | Override the name of the chart. |
| nodeSelector | object | `{}` | Node labels to match for pod scheduling. |
| ordinals | object | `{}` | Ordinals configuration for the `StatefulSet`. |
| persistence.accessMode | string | `"ReadWriteOnce"` | Access mode for the `PersistentVolumeClaim`. |
| persistence.annotations | object | `{}` | Annotations for the `PersistentVolumeClaim`. |
| persistence.enabled | bool | `false` | If `true`, persistence should be enabled for the `StatefulSet`. |
| persistence.retainDeleted | bool | `true` | If `true`, keep `PersistentVolumeClaims` when the `StatefulSet` is deleted. |
| persistence.retainScaled | bool | `true` | If `true`, keep `PersistentVolumeClaim` when the `StatefulSet` is scaled down. |
| persistence.size | string | `"8Gi"` | Size of the `PersistentVolumeClaim`. |
| persistence.storageClass | string | `nil` | Storage class for the `PersistentVolumeClaim`, if not set the default will be used. |
| plugins | list | `[]` | List of plugins to install. |
| podAnnotations | object | `{}` | Annotations to add to the pod. |
| podDisruptionBudget.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` resource. |
| podDisruptionBudget.maxUnavailable | string | `nil` | Minimum number of unavailable pods, either a number or a percentage. |
| podDisruptionBudget.minAvailable | string | `nil` | Minimum number of available pods, either a number or a percentage. |
| podDisruptionBudget.unhealthyPodEvictionPolicy | string | `nil` | Unhealthy pod eviction policy for the PDB. |
| podLabels | object | `{}` | Labels to add to the pod. |
| podManagementPolicy | string | `nil` | Pod management policy for the `StatefulSet`. |
| podSecurityContext | object | `{"fsGroup":200,"runAsNonRoot":false,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the pod. |
| priorityClassName | string | `nil` | Priority class name for the pod. |
| properties | list | `[]` | _Nexus3_ properties. |
| readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the default container. |
| replicas | int | `1` | Number of replicas to create; modifying this requires the license to be configured. |
| resources | object | `{}` | Resources for the default container. |
| rootPassword.key | string | `"password"` | Key in the secret containing the root password. |
| rootPassword.secret | string | `nil` | Name of the secret containing the root password. |
| securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":200,"runAsNonRoot":true,"runAsUser":200}` | Security context for the default container. |
| service.additionalPorts | list | See _values.yaml_ | Additional ports to expose. |
| service.annotations | object | `{}` | Service annotations. |
| service.port | int | `8081` | Default port. |
| service.type | string | `"ClusterIP"` | Service type. |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| serviceAccount.automountToken | bool | `false` | If `true`, mount the `ServiceAccount` token. |
| serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount`. |
| serviceAccount.labels | object | `{}` | Labels to add to the service account. |
| serviceAccount.name | string | `nil` | If this is set and `serviceAccount.create` is `true` this will be used for the created `ServiceAccount` name, if set and `serviceAccount.create` is `false` then this will define an existing `ServiceAccount` to use. |
| startupProbe | object | See _values.yaml_ | Startup probe configuration for the default container. |
| storeProperties | list | `[]` | _Nexus3_ store properties. |
| tailLogs.resources | object | `{}` | Resources for the log tailing containers. |
| terminationGracePeriodSeconds | int | `120` | Termination grace period for the pod in seconds. |
| tolerations | list | `[]` | Node taints which will be tolerated for pod scheduling. |
| topologySpreadConstraints | list | `[]` | Topology spread constraints for pod scheduling. If an explicit label selector is not provided one will be created from the pod selector labels. |
| updateStrategy | object | `{}` | Update strategy for the `StatefulSet`. |

----------------------------------------------

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs/).
