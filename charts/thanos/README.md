# thanos

![Version: 1.16.0](https://img.shields.io/badge/Version-1.16.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.34.0](https://img.shields.io/badge/AppVersion-0.34.0-informational?style=flat-square)

Helm chart to install Thanos; a set of components that can be composed into a highly available metric system with unlimited storage capacity, which can be added seamlessly on top of existing Prometheus deployments.

**Homepage:** <https://thanos.io/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| stevehipwell | <steve.hipwell@gmail.com> |  |

## Source Code

* <https://github.com/thanos-io/thanos>
* <https://github.com/thanos-io/kube-thanos>
* <https://github.com/stevehipwell/helm-charts/>

## Installing the Chart

### OCI Repository

To install the chart using the recommended OCI method you can use the following command.

```shell
helm upgrade --install thanos oci://ghcr.io/stevehipwell/helm-charts/thanos --version 1.16.0
```

#### Verification

As the OCI chart release is signed by [Cosign](https://github.com/sigstore/cosign) you can verify the chart before installing it by running the following command.

```shell
cosign verify --certificate-oidc-issuer https://token.actions.githubusercontent.com --certificate-identity-regexp 'https://github\.com/action-stars/helm-workflows/\.github/workflows/release\.yaml@.+' --certificate-github-workflow-repository stevehipwell/helm-charts --certificate-github-workflow-name Release ghcr.io/stevehipwell/helm-charts/oci://ghcr.io/stevehipwell/helm-charts/thanos:1.16.0
```

### Non-OCI Repository

Alternatively you can use the legacy non-OCI method via the following commands.

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
helm upgrade --install thanos stevehipwell/thanos --version 1.16.0
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalEndpoints | list | `[]` | Additional endpoints external to the chart to be configured with `--endpoint`. |
| additionalReplicaLabels | list | `[]` | Additional replica labels external to the chart. |
| clusterDomain | string | `"cluster.local"` | _Kubernetes_ cluster domain. |
| commonLabels | object | `{}` | Labels to add to all chart resources. |
| compact.affinity | object | `{}` | Affinity settings for scheduling the _Compact_ pod. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| compact.deduplication.enabled | bool | `true` | If `true`, enable deduplication via the _Compact_ component. |
| compact.deduplication.func | string | `nil` | If specified override the default deduplication function. |
| compact.enabled | bool | `false` | If `true`, create the _Thanos Compact_ component. |
| compact.extraArgs | list | `[]` | Additional args for the _Compact_ pod default container. |
| compact.extraEnv | list | `[]` | Additional environment variables for the _Compact_ pod default container. |
| compact.livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the _Compact_ pod default container. |
| compact.nodeSelector | object | `{}` | Node selector labels for scheduling the _Compact_ pod. |
| compact.persistence.accessMode | string | `"ReadWriteOnce"` | Access mode for the _Compact_ pod PVC. |
| compact.persistence.annotations | object | `{}` | Annotations to add to the _Compact_ pod PVC. |
| compact.persistence.enabled | bool | `false` | If `true`, either use an existing `PersistentVolumeClaim` via `compact.persistence.existingClaim` or create a `PersistentVolumeClaim` for the _Compact_ pod data. |
| compact.persistence.existingClaim | string | `nil` | If this is set and `compact.persistence.enabled` is `true` the existing PVC defined will be used instead of a new one being created. |
| compact.persistence.retainDeleted | bool | `true` | If `true`, retain the _Compact_ PVC after the pod is deleted. |
| compact.persistence.retainScaled | bool | `true` | If `true`, retain the _Compact_ PVC after the pod is scaled down. |
| compact.persistence.size | string | `"8Gi"` | Size for the _Compact_ pod PVC. |
| compact.persistence.storageClass | string | `"standard"` | Storage class for the _Compact_ pod PVC. |
| compact.podAnnotations | object | `{}` | Annotations to add to the _Compact_ pod. |
| compact.podLabels | object | `{}` | Labels to add to the _Compact_ pod. |
| compact.podSecurityContext | object | See _values.yaml_ | Security context for the _Compact_ pod. |
| compact.priorityClassName | string | `nil` | Priority class name for the _Compact_ pod. |
| compact.readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the _Compact_ pod default container. |
| compact.replicaDeduplication | bool | `false` | If `true`, use the `penalty` deduplication function optimised for HA Prometheus replicas (**DEPRECATED**). |
| compact.resources | object | `{}` | Resources for the _Compact_ pod default container. |
| compact.securityContext | object | See _values.yaml_ | Security context for the _Compact_ pod default container. |
| compact.service.annotations | object | `{}` | Annotations to add to the _Compact_ service. |
| compact.serviceAccount.annotations | object | `{}` | Annotations to add to the _Compact_ service account. |
| compact.serviceAccount.automountToken | bool | `false` | Automount API credentials for the _Compact_ service account. |
| compact.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the _Compact_ component. |
| compact.serviceAccount.labels | object | `{}` | Labels to add to the _Compact_ service account. |
| compact.serviceAccount.name | string | `nil` | If this is set and `compact.serviceAccount.create` is `true` this will be used for the created _Compact_ component service account name, if this is set and `compact.serviceAccount.create` is `false` then this will define an existing service account to use for the _Compact_ component. |
| compact.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the _Compact_ pod; in seconds. |
| compact.tolerations | list | `[]` | Node taints the _Compact_ pod will tolerate for scheduling. |
| compact.topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling for the _Compact_ pod. If an explicit label selector is not provided one will be created from the pod selector labels. |
| compact.updateStrategy | object | `{}` | Update strategy for the _Compact_ stateful set. |
| fullnameOverride | string | `nil` | Override the full name of the chart. |
| image.digest | string | `nil` | Optional image digest for the _Thanos_ image. |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the _Thanos_ image. |
| image.repository | string | `"quay.io/thanos/thanos"` | Image repository for the _Thanos_ image. |
| image.tag | string | `nil` | Image tag for the _Thanos_ image; this will default to `printf "v%s" .Chart.AppVersion` if not set and will be omitted if set to `-`. |
| imagePullSecrets | list | `[]` | Image pull secrets. |
| logFormat | string | `"logfmt"` | Log format for _Thanos_ components. |
| logLevel | string | `"info"` | Log level for _Thanos_ components. |
| nameOverride | string | `nil` | Override the name of the chart. |
| objstoreConfig.create | bool | `true` | If `true`, create a `Secret` for the objstore store configuration. |
| objstoreConfig.key | string | `"config"` | Secret key for the objstore configuration. |
| objstoreConfig.name | string | `nil` | If this is set and `objstoreConfig.create` is `true` this will be used for the created secret name, if this is set and `objstoreConfig.create` is `false` then this will define an existing secret to use. |
| objstoreConfig.value | string | `"type: FILESYSTEM\nconfig:\n  directory: /var/thanos/store/s3"` | Objstore configuration; this can either be a string or a map. The default values are not suitable for production. |
| query.additionalStores | list | `[]` | Additional stores to configure query with (`--store`); use `additionalEndpoints` instead (**DEPRECATED**). |
| query.affinity | object | `{}` | Affinity settings for scheduling the _Query_ pod. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| query.autoscaling.enabled | bool | `false` | If `true`, create a `HorizontalPodAutoscaler` for the _Query_ deployment. |
| query.autoscaling.maxReplicas | int | `3` | Maximum number of _Query_ replicas that the HPA should create. |
| query.autoscaling.minReplicas | int | `1` | Minimum number of _Query_ replicas that the HPA should maintain. |
| query.autoscaling.targetCPUUtilizationPercentage | int | `80` | Target CPU utilisation percentage for the _Query_ pod. |
| query.autoscaling.targetMemoryUtilizationPercentage | int | `nil` | Target memory utilisation percentage for the _Query_ pod. |
| query.extraArgs | list | `[]` | Additional args for the _Query_ pod default container. |
| query.extraEnv | list | `[]` | Additional environment variables for the _Query_ pod default container. |
| query.ingress.annotations | object | `{}` | Annotations to add to the _Query_ service ingress. |
| query.ingress.enabled | bool | `false` | If `true`, create an `Ingress` for the _Query_ service. |
| query.ingress.hosts | list | See _values.yaml_ | Hosts for the _Query_ service ingress. |
| query.ingress.ingressClassName | string | `nil` | Ingress class name for the _Query_ service ingress. |
| query.ingress.path | string | `"/"` | Path for the _Query_ service ingress. |
| query.ingress.tls | list | See _values.yaml_ | TLS configuration for the _Query_ service ingress. |
| query.livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the _Query_ pod default container. |
| query.nodeSelector | object | `{}` | Node selector labels for scheduling the _Query_ pod. |
| query.podAnnotations | object | `{}` | Annotations to add to the _Query_ pod. |
| query.podDisruptionBudget.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` for the _Query_ deployment. |
| query.podDisruptionBudget.maxUnavailable | string | `nil` | Maximum number of _Query_ replicas that the PDB should allow to be unavailable. |
| query.podDisruptionBudget.minAvailable | string | `nil` | Minimum number of _Query_ replicas that the PDB should require to be available. |
| query.podLabels | object | `{}` | Labels to add to the _Query_ pod. |
| query.podSecurityContext | object | See _values.yaml_ | Security context for the _Query_ pod. |
| query.priorityClassName | string | `nil` | Priority class name for the _Query_ pod. |
| query.readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the _Query_ pod default container. |
| query.replicaLabels | list | `[]` | Labels added to metrics to show the replica recording the data (`--query.replica-label`); use `additionalReplicaLabels` instead (**DEPRECATED**). |
| query.replicas | int | `1` | Number of _Query_ replicas to create. |
| query.resources | object | `{}` | Resources for the _Query_ pod default container. |
| query.securityContext | object | See _values.yaml_ | Security context for the _Query_ pod default container. |
| query.service.annotations | object | `{}` | Annotations to add to the _Query_ service. |
| query.serviceAccount.annotations | object | `{}` | Annotations to add to the _Query_ service account. |
| query.serviceAccount.automountToken | bool | `false` | Automount API credentials for the _Query_ service account. |
| query.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the _Query_ component. |
| query.serviceAccount.labels | object | `{}` | Labels to add to the _Query_ service account. |
| query.serviceAccount.name | string | `nil` | If this is set and `compact.serviceAccount.create` is `true` this will be used for the created _Query_ component service account name, if this is set and `compact.serviceAccount.create` is `false` then this will define an existing service account to use for the _Query_ component. |
| query.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the _Query_ pod; in seconds. |
| query.tolerations | list | `[]` | Node taints the _Query_ pod will tolerate for scheduling. |
| query.topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling for the _Query_ pod. If an explicit label selector is not provided one will be created from the pod selector labels. |
| query.updateStrategy | object | `{}` | Update strategy for the _Query_ deployment. |
| queryFrontend.affinity | object | `{}` | Affinity settings for scheduling the _Query Frontend_ pod. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| queryFrontend.autoscaling.enabled | bool | `false` | If `true`, create a `HorizontalPodAutoscaler` for the _Query Frontend_ deployment. |
| queryFrontend.autoscaling.maxReplicas | int | `3` | Maximum number of _Query Frontend_ replicas that the HPA should create. |
| queryFrontend.autoscaling.minReplicas | int | `1` | Minimum number of _Query Frontend_ replicas that the HPA should maintain. |
| queryFrontend.autoscaling.targetCPUUtilizationPercentage | int | `80` | Target CPU utilisation percentage for the _Query Frontend_ pod. |
| queryFrontend.autoscaling.targetMemoryUtilizationPercentage | int | `nil` | Target memory utilisation percentage for the _Query Frontend_ pod. |
| queryFrontend.enabled | bool | `false` | If `true`, create the _Thanos Query Frontend_ component. |
| queryFrontend.extraArgs | list | `[]` | Additional args for the _Query Frontend_ pod default container. |
| queryFrontend.extraEnv | list | `[]` | Additional environment variables for the _Query Frontend_ pod default container. |
| queryFrontend.ingress.annotations | object | `{}` | Annotations to add to the _Query Frontend_ service ingress. |
| queryFrontend.ingress.enabled | bool | `false` | If `true`, create an `Ingress` for the _Query Frontend_ service. |
| queryFrontend.ingress.hosts | list | See _values.yaml_ | Hosts for the _Query Frontend_ service ingress. |
| queryFrontend.ingress.ingressClassName | string | `nil` | Ingress class name for the _Query Frontend_ service ingress. |
| queryFrontend.ingress.path | string | `"/"` | Path for the _Query Frontend_ service ingress. |
| queryFrontend.ingress.tls | list | See _values.yaml_ | TLS configuration for the _Query Frontend_ service ingress. |
| queryFrontend.livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the _Query Frontend_ pod default container. |
| queryFrontend.nodeSelector | object | `{}` | Node selector labels for scheduling the _Query Frontend_ pod. |
| queryFrontend.podAnnotations | object | `{}` | Annotations to add to the _Query Frontend_ pod. |
| queryFrontend.podDisruptionBudget.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` for the _Query Frontend_ deployment. |
| queryFrontend.podDisruptionBudget.maxUnavailable | string | `nil` | Maximum number of _Query Frontend_ replicas that the PDB should allow to be unavailable. |
| queryFrontend.podDisruptionBudget.minAvailable | string | `nil` | Minimum number of _Query Frontend_ replicas that the PDB should require to be available. |
| queryFrontend.podLabels | object | `{}` | Labels to add to the _Query Frontend_ pod. |
| queryFrontend.podSecurityContext | object | See _values.yaml_ | Security context for the _Query Frontend_ pod. |
| queryFrontend.priorityClassName | string | `nil` | Priority class name for the _Query Frontend_ pod. |
| queryFrontend.readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the _Query Frontend_ pod default container. |
| queryFrontend.replicas | int | `1` | Number of _Query Frontend_ replicas to create. |
| queryFrontend.resources | object | `{}` | Resources for the _Query Frontend_ pod default container. |
| queryFrontend.securityContext | object | See _values.yaml_ | Security context for the _Query Frontend_ pod default container. |
| queryFrontend.service.annotations | object | `{}` | Annotations to add to the _Query Frontend_ service. |
| queryFrontend.serviceAccount.annotations | object | `{}` | Annotations to add to the _Query Frontend_ service account. |
| queryFrontend.serviceAccount.automountToken | bool | `false` | Automount API credentials for the _Query Frontend_ service account. |
| queryFrontend.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the _Query Frontend_ component. |
| queryFrontend.serviceAccount.labels | object | `{}` | Labels to add to the _Query Frontend_ service account. |
| queryFrontend.serviceAccount.name | string | `nil` | If this is set and `compact.serviceAccount.create` is `true` this will be used for the created _Query Frontend_ component service account name, if this is set and `compact.serviceAccount.create` is `false` then this will define an existing service account to use for the _Query Frontend_ component. |
| queryFrontend.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the _Query Frontend_ pod; in seconds. |
| queryFrontend.tolerations | list | `[]` | Node taints the _Query Frontend_ pod will tolerate for scheduling. |
| queryFrontend.topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling for the _Query Frontend_ pod. If an explicit label selector is not provided one will be created from the pod selector labels. |
| queryFrontend.updateStrategy | object | `{}` | Update strategy for the _Query Frontend_ deployment. |
| receive.enabled | bool | `false` | If `true`, create the _Thanos Receive Ingestor_ & _Thanos Receive Router_ components. |
| receive.ingestor.affinity | object | `{}` | Affinity settings for scheduling the _Receive Ingestor_ pod. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| receive.ingestor.extraArgs | list | `[]` | Additional args for the _Receive Ingestor_ pod default container. |
| receive.ingestor.extraEnv | list | `[]` | Additional environment variables for the _Receive Ingestor_ pod default container. |
| receive.ingestor.livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the _Receive Ingestor_ pod default container. |
| receive.ingestor.nodeSelector | object | `{}` | Node selector labels for scheduling the _Receive Ingestor_ pod. |
| receive.ingestor.persistence.accessMode | string | `"ReadWriteOnce"` | Access mode for the _Receive Ingestor_ pod PVC. |
| receive.ingestor.persistence.annotations | object | `{}` | Annotations to add to the _Receive Ingestor_ pod PVC. |
| receive.ingestor.persistence.enabled | bool | `false` | If `true`, either use an existing `PersistentVolumeClaim` via `compact.persistence.existingClaim` or create a `PersistentVolumeClaim` for the _Receive Ingestor_ pod data. |
| receive.ingestor.persistence.existingClaim | string | `nil` | If this is set and `compact.persistence.enabled` is `true` the existing PVC defined will be used instead of a new one being created. |
| receive.ingestor.persistence.retainDeleted | bool | `true` | If `true`, retain the _Receive Ingestor_ PVC after the pod is deleted. |
| receive.ingestor.persistence.retainScaled | bool | `true` | If `true`, retain the _Receive Ingestor_ PVC after the pod is scaled down. |
| receive.ingestor.persistence.size | string | `"8Gi"` | Size for the _Receive Ingestor_ pod PVC. |
| receive.ingestor.persistence.storageClass | string | `"standard"` | Storage class for the _Receive Ingestor_ pod PVC. |
| receive.ingestor.podAnnotations | object | `{}` | Annotations to add to the _Receive Ingestor_ pod. |
| receive.ingestor.podDisruptionBudget.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` for the _Receive Ingestor_ stateful set. |
| receive.ingestor.podDisruptionBudget.maxUnavailable | string | `nil` | Maximum number of _Receive Ingestor_ replicas that the PDB should allow to be unavailable. |
| receive.ingestor.podDisruptionBudget.minAvailable | string | `nil` | Minimum number of _Receive Ingestor_ replicas that the PDB should require to be available. |
| receive.ingestor.podLabels | object | `{}` | Labels to add to the _Receive Ingestor_ pod. |
| receive.ingestor.podSecurityContext.fsGroup | int | `65534` |  |
| receive.ingestor.podSecurityContext.runAsUser | int | `65534` |  |
| receive.ingestor.priorityClassName | string | `nil` | Priority class name for the _Receive Ingestor_ pod. |
| receive.ingestor.readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the _Receive Ingestor_ pod default container. |
| receive.ingestor.replicas | int | `1` | Number of _Receive Ingestor_ replicas to create. |
| receive.ingestor.resources | object | `{}` | Resources for the _Receive Ingestor_ pod default container. |
| receive.ingestor.securityContext | object | See _values.yaml_ | Security context for the _Receive Ingestor_ pod default container. |
| receive.ingestor.service.annotations | object | `{}` | Annotations to add to the _Receive Ingestor_ service. |
| receive.ingestor.serviceAccount.annotations | object | `{}` | Annotations to add to the _Receive Ingestor_ service account. |
| receive.ingestor.serviceAccount.automountToken | bool | `false` | Automount API credentials for the _Receive Ingestor_ service account. |
| receive.ingestor.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the _Receive Ingestor_ component. |
| receive.ingestor.serviceAccount.labels | object | `{}` | Labels to add to the _Receive Ingestor_ service account. |
| receive.ingestor.serviceAccount.name | string | `nil` | If this is set and `compact.serviceAccount.create` is `true` this will be used for the created _Receive Ingestor_ component service account name, if this is set and `compact.serviceAccount.create` is `false` then this will define an existing service account to use for the _Receive Ingestor_ component. |
| receive.ingestor.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the _Receive Ingestor_ pod; in seconds. |
| receive.ingestor.tolerations | list | `[]` | Node taints the _Receive Ingestor_ pod will tolerate for scheduling. |
| receive.ingestor.topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling for the _Receive Ingestor_ pod. If an explicit label selector is not provided one will be created from the pod selector labels. |
| receive.ingestor.updateStrategy | object | `{}` | Update strategy for the _Receive Ingestor_ stateful set. |
| receive.replicationFactor | int | `1` | Replication factor for the _Receive_ components. |
| receive.retention | string | `"48h"` | Retention for the _Receive_ components. |
| receive.router.affinity | object | `{}` | Affinity settings for scheduling the _Receive Router_ pod. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| receive.router.autoscaling.enabled | bool | `false` | If `true`, create a `HorizontalPodAutoscaler` for the _Receive Router_ deployment. |
| receive.router.autoscaling.maxReplicas | int | `3` | Maximum number of _Receive Router_ replicas that the HPA should create. |
| receive.router.autoscaling.minReplicas | int | `1` | Minimum number of _Receive Router_ replicas that the HPA should maintain. |
| receive.router.autoscaling.targetCPUUtilizationPercentage | int | `80` | Target CPU utilisation percentage for the _Receive Router_ pod. |
| receive.router.autoscaling.targetMemoryUtilizationPercentage | int | `nil` | Target memory utilisation percentage for the _Receive Router_ pod. |
| receive.router.extraArgs | list | `[]` | Additional args for the _Receive Router_ pod default container. |
| receive.router.extraEnv | list | `[]` | Additional environment variables for the _Receive Router_ pod default container. |
| receive.router.ingress.annotations | object | `{}` | Annotations to add to the _Receive Router_ service ingress. |
| receive.router.ingress.enabled | bool | `false` | If `true`, create an `Ingress` for the _Receive Router_ service. |
| receive.router.ingress.hosts | list | See _values.yaml_ | Hosts for the _Receive Router_ service ingress. |
| receive.router.ingress.ingressClassName | string | `nil` | Ingress class name for the _Receive Router_ service ingress. |
| receive.router.ingress.path | string | `"/"` | Path for the _Receive Router_ service ingress. |
| receive.router.ingress.tls | list | See _values.yaml_ | TLS configuration for the _Receive Router_ service ingress. |
| receive.router.livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the _Receive Router_ pod default container. |
| receive.router.nodeSelector | object | `{}` | Node selector labels for scheduling the _Receive Router_ pod. |
| receive.router.podAnnotations | object | `{}` | Annotations to add to the _Receive Router_ pod. |
| receive.router.podDisruptionBudget.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` for the _Receive Router_ deployment. |
| receive.router.podDisruptionBudget.maxUnavailable | string | `nil` | Maximum number of _Receive Router_ replicas that the PDB should allow to be unavailable. |
| receive.router.podDisruptionBudget.minAvailable | string | `nil` | Minimum number of _Receive Router_ replicas that the PDB should require to be available. |
| receive.router.podLabels | object | `{}` | Labels to add to the _Receive Router_ pod. |
| receive.router.podSecurityContext | object | See _values.yaml_ | Security context for the _Receive Router_ pod. |
| receive.router.priorityClassName | string | `nil` | Priority class name for the _Receive Router_ pod. |
| receive.router.readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the _Receive Router_ pod default container. |
| receive.router.replicas | int | `1` | Number of _Receive Router_ replicas to create. |
| receive.router.resources | object | `{}` | Resources for the _Receive Router_ pod default container. |
| receive.router.securityContext | object | See _values.yaml_ | Security context for the _Receive Router_ pod default container. |
| receive.router.service.annotations | object | `{}` | Annotations to add to the _Receive Router_ service. |
| receive.router.serviceAccount.annotations | object | `{}` | Annotations to add to the _Receive Router_ service account. |
| receive.router.serviceAccount.automountToken | bool | `false` | Automount API credentials for the _Receive Router_ service account. |
| receive.router.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the _Receive Router_ component. |
| receive.router.serviceAccount.labels | object | `{}` | Labels to add to the _Receive Router_ service account. |
| receive.router.serviceAccount.name | string | `nil` | If this is set and `compact.serviceAccount.create` is `true` this will be used for the created _Receive Router_ component service account name, if this is set and `compact.serviceAccount.create` is `false` then this will define an existing service account to use for the _Receive Router_ component. |
| receive.router.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the _Receive Router_ pod; in seconds. |
| receive.router.tolerations | list | `[]` | Node taints the _Receive Router_ pod will tolerate for scheduling. |
| receive.router.topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling for the _Receive Router_ pod. If an explicit label selector is not provided one will be created from the pod selector labels. |
| receive.router.updateStrategy | object | `{}` | Update strategy for the _Receive Router_ deployment. |
| rule.affinity | object | `{}` | Affinity settings for scheduling the _Rule_ pod. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| rule.alertmanagersConfig.create | bool | `true` | If `true`, create a `Secret` for the _Rule_ component alertmanagers configuration. |
| rule.alertmanagersConfig.key | string | `"config"` | Secret key for the _Rule_ component alertmanagers configuration. |
| rule.alertmanagersConfig.name | string | `nil` | If this is set and `rule.alertmanagersConfig.create` is `true` this will be used for the created secret name, if this is set and `rule.alertmanagersConfig.create` is `false` then this will define an existing secret to use. |
| rule.alertmanagersConfig.value | string | `"alertmanagers: []"` | Alert managers configuration for the _Rule_ component. |
| rule.blockDuration | string | `"2h"` | Block duration for the _Rule_ component (`--tsdb.block-duration`). |
| rule.configReloader.enabled | bool | `true` | If `true`, create the config reloader sidecar container. |
| rule.configReloader.image.digest | string | `nil` | Image digest for the config reloader sidecar container. |
| rule.configReloader.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the config reloader sidecar container. |
| rule.configReloader.image.repository | string | `"cgr.dev/chainguard/configmap-reload"` | Image repository for the config reloader sidecar container. |
| rule.configReloader.image.tag | string | `"latest"` | Image tag for the config reloader sidecar container. |
| rule.configReloader.resources | object | `{}` |  |
| rule.enabled | bool | `false` | If `true`, create the _Thanos Rule_ component. |
| rule.evalInterval | string | `"1m"` | Rule eval interval for the _Rule_ component (`--eval-interval`). |
| rule.extraArgs | list | `[]` | Additional args for the _Rule_ pod default container. |
| rule.extraEnv | list | `[]` | Additional environment variables for the _Rule_ pod default container. |
| rule.ingress.annotations | object | `{}` | Annotations to add to the _Rule_ service ingress. |
| rule.ingress.enabled | bool | `false` | If `true`, create an `Ingress` for the _Rule_ service. |
| rule.ingress.hosts | list | See _values.yaml_ | Hosts for the _Rule_ service ingress. |
| rule.ingress.ingressClassName | string | `nil` | Ingress class name for the _Rule_ service ingress. |
| rule.ingress.path | string | `"/"` | Path for the _Rule_ service ingress. |
| rule.ingress.tls | list | See _values.yaml_ | TLS configuration for the _Rule_ service ingress. |
| rule.instanceLabel | bool | `false` | If `true`, add a `thanos_rule` label to `<NAMESPACE>/<RULE_FULLNAME>` on a `Rule` metrics. |
| rule.livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the _Rule_ pod default container. |
| rule.nodeSelector | object | `{}` | Node selector labels for scheduling the _Rule_ pod. |
| rule.persistence.accessMode | string | `"ReadWriteOnce"` | Access mode for the _Rule_ pod PVC. |
| rule.persistence.annotations | object | `{}` | Annotations to add to the _Rule_ pod PVC. |
| rule.persistence.enabled | bool | `false` | If `true`, either use an existing `PersistentVolumeClaim` via `compact.persistence.existingClaim` or create a `PersistentVolumeClaim` for the _Rule_ pod data. |
| rule.persistence.existingClaim | string | `nil` | If this is set and `compact.persistence.enabled` is `true` the existing PVC defined will be used instead of a new one being created. |
| rule.persistence.retainDeleted | bool | `true` | If `true`, retain the _Rule_ PVC after the pod is deleted. |
| rule.persistence.retainScaled | bool | `true` | If `true`, retain the _Rule_ PVC after the pod is scaled down. |
| rule.persistence.size | string | `"8Gi"` | Size for the _Rule_ pod PVC. |
| rule.persistence.storageClass | string | `"standard"` | Storage class for the _Rule_ pod PVC. |
| rule.podAnnotations | object | `{}` | Annotations to add to the _Rule_ pod. |
| rule.podDisruptionBudget.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` for the _Rule_ stateful set. |
| rule.podDisruptionBudget.maxUnavailable | string | `nil` | Maximum number of _Rule_ replicas that the PDB should allow to be unavailable. |
| rule.podDisruptionBudget.minAvailable | string | `nil` | Minimum number of _Rule_ replicas that the PDB should require to be available. |
| rule.podLabels | object | `{}` | Labels to add to the _Rule_ pod. |
| rule.podSecurityContext | object | See _values.yaml_ | Security context for the _Rule_ pod. |
| rule.priorityClassName | string | `nil` | Priority class name for the _Rule_ pod. |
| rule.readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the _Rule_ pod default container. |
| rule.replicas | int | `1` | Number of _Rule_ replicas to create. |
| rule.resources | object | `{}` | Resources for the _Rule_ pod default container. |
| rule.retention | string | `"48h"` | Local disk block retention period for the _Rule_ component (`--tsdb.retention`). |
| rule.rules.create | bool | `true` | If `true`, create a `ConfigMap` for the _Rule_ component rules. |
| rule.rules.name | string | `nil` | If this is set and `rule.rules.create` is `true` this will be used for the created config map name, if this is set and `rule.rules.create` is `false` then this will define an existing config map to use. |
| rule.rules.value | string | `""` |  |
| rule.securityContext | object | See _values.yaml_ | Security context for the _Rule_ pod default container. |
| rule.service.annotations | object | `{}` | Annotations to add to the _Rule_ service. |
| rule.serviceAccount.annotations | object | `{}` | Annotations to add to the _Rule_ service account. |
| rule.serviceAccount.automountToken | bool | `false` | Automount API credentials for the _Rule_ service account. |
| rule.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the _Rule_ component. |
| rule.serviceAccount.labels | object | `{}` | Labels to add to the _Rule_ service account. |
| rule.serviceAccount.name | string | `nil` | If this is set and `compact.serviceAccount.create` is `true` this will be used for the created _Rule_ component service account name, if this is set and `compact.serviceAccount.create` is `false` then this will define an existing service account to use for the _Rule_ component. |
| rule.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the _Rule_ pod; in seconds. |
| rule.tolerations | list | `[]` | Node taints the _Rule_ pod will tolerate for scheduling. |
| rule.topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling for the _Rule_ pod. If an explicit label selector is not provided one will be created from the pod selector labels. |
| rule.updateStrategy | object | `{}` | Update strategy for the _Rule_ stateful set. |
| serviceMonitor.additionalLabels | object | `{}` | Additional labels for the service monitor. |
| serviceMonitor.enabled | bool | `false` | If `true`, create `ServiceMonitor` resources to support collecting metrics via the _Prometheus Operator_. |
| serviceMonitor.endpointConfig | object | `{}` | Additional endpoint configuration for the service monitor endpoint. |
| serviceMonitor.interval | int | `nil` | _Prometheus_ scrape interval for the service monitor endpoint (**DEPRECATED**). |
| storeGateway.affinity | object | `{}` | Affinity settings for scheduling the _Store Gateway_ pod. If an explicit label selector is not provided for pod affinity or pod anti-affinity one will be created from the pod selector labels. |
| storeGateway.extraArgs | list | `[]` | Additional args for the _Store Gateway_ pod default container. |
| storeGateway.extraEnv | list | `[]` | Additional environment variables for the _Store Gateway_ pod default container. |
| storeGateway.livenessProbe | object | See _values.yaml_ | Liveness probe configuration for the _Store Gateway_ pod default container. |
| storeGateway.nodeSelector | object | `{}` | Node selector labels for scheduling the _Store Gateway_ pod. |
| storeGateway.persistence.accessMode | string | `"ReadWriteOnce"` | Access mode for the _Store Gateway_ pod PVC. |
| storeGateway.persistence.annotations | object | `{}` | Annotations to add to the _Store Gateway_ pod PVC. |
| storeGateway.persistence.enabled | bool | `false` | If `true`, either use an existing `PersistentVolumeClaim` via `compact.persistence.existingClaim` or create a `PersistentVolumeClaim` for the _Store Gateway_ pod data. |
| storeGateway.persistence.existingClaim | string | `nil` | If this is set and `compact.persistence.enabled` is `true` the existing PVC defined will be used instead of a new one being created. |
| storeGateway.persistence.retainDeleted | bool | `true` | If `true`, retain the _Store Gateway_ PVC after the pod is deleted. |
| storeGateway.persistence.retainScaled | bool | `true` | If `true`, retain the _Store Gateway_ PVC after the pod is scaled down. |
| storeGateway.persistence.size | string | `"8Gi"` | Size for the _Store Gateway_ pod PVC. |
| storeGateway.persistence.storageClass | string | `"standard"` | Storage class for the _Store Gateway_ pod PVC. |
| storeGateway.podAnnotations | object | `{}` | Annotations to add to the _Store Gateway_ pod. |
| storeGateway.podDisruptionBudget.enabled | bool | `false` | If `true`, create a `PodDisruptionBudget` for the _Store Gateway_ stateful set. |
| storeGateway.podDisruptionBudget.maxUnavailable | string | `nil` | Maximum number of _Store Gateway_ replicas that the PDB should allow to be unavailable. |
| storeGateway.podDisruptionBudget.minAvailable | string | `nil` | Minimum number of _Store Gateway_ replicas that the PDB should require to be available. |
| storeGateway.podLabels | object | `{}` | Labels to add to the _Store Gateway_ pod. |
| storeGateway.podSecurityContext | object | See _values.yaml_ | Security context for the _Store Gateway_ pod. |
| storeGateway.priorityClassName | string | `nil` | Priority class name for the _Store Gateway_ pod. |
| storeGateway.readinessProbe | object | See _values.yaml_ | Readiness probe configuration for the _Store Gateway_ pod default container. |
| storeGateway.replicas | int | `1` | Number of _Store Gateway_ replicas to create. |
| storeGateway.resources | object | `{}` | Resources for the _Store Gateway_ pod default container. |
| storeGateway.securityContext | object | See _values.yaml_ | Security context for the _Store Gateway_ pod default container. |
| storeGateway.service.annotations | object | `{}` | Annotations to add to the _Store Gateway_ service. |
| storeGateway.serviceAccount.annotations | object | `{}` | Annotations to add to the _Store Gateway_ service account. |
| storeGateway.serviceAccount.automountToken | bool | `false` | Automount API credentials for the _Store Gateway_ service account. |
| storeGateway.serviceAccount.create | bool | `true` | If `true`, create a new `ServiceAccount` for the _Store Gateway_ component. |
| storeGateway.serviceAccount.labels | object | `{}` | Labels to add to the _Store Gateway_ service account. |
| storeGateway.serviceAccount.name | string | `nil` | If this is set and `compact.serviceAccount.create` is `true` this will be used for the created _Store Gateway_ component service account name, if this is set and `compact.serviceAccount.create` is `false` then this will define an existing service account to use for the _Store Gateway_ component. |
| storeGateway.terminationGracePeriodSeconds | int | `nil` | Termination grace period for the _Store Gateway_ pod; in seconds. |
| storeGateway.tolerations | list | `[]` | Node taints the _Store Gateway_ pod will tolerate for scheduling. |
| storeGateway.topologySpreadConstraints | list | `[]` | Topology spread constraints for scheduling for the _Store Gateway_ pod. If an explicit label selector is not provided one will be created from the pod selector labels. |
| storeGateway.updateStrategy | object | `{}` | Update strategy for the _Store Gateway_ stateful set. |

----------------------------------------------

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs/).
