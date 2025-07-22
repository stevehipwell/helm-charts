# Thanos Helm Chart Changelog

> [!NOTE]
> All notable changes to this project will be documented in this file; the format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!--
### Added - For new features.
### Changed - For changes in existing functionality.
### Deprecated - For soon-to-be removed features.
### Removed - For now removed features.
### Fixed - For any bug fixes.
### Security - In case of vulnerabilities.
-->

## [UNRELEASED]

## [v1.21.1] - 2025-07-22

### Changed

- Update the _Thanos_ OCI image to [v0.39.2](https://github.com/thanos-io/thanos/releases/tag/v0.39.2). ([#1219](https://github.com/stevehipwell/helm-charts/pull/1219)) _@stevehipwell_

## [v1.21.0] - 2025-07-15

### Added

- Add support for disabling the _Thanos Store Gateway_ component by setting the `storeGateway.enabled` chart value to `false` (it defaults to `true`). This allows users to choose if they need the _Thanos Store Gateway_ component and its associated resources. ([#1209](https://github.com/stevehipwell/helm-charts/pull/1209)) _@MeNsaaH_

### Changed

- Update `ghcr.io/jimmidyson/configmap-reload` OCI image from `0.14.0` to [`0.15.0`](https://github.com/jimmidyson/configmap-reload/releases/tag/v0.15.0). ([#1168](https://github.com/stevehipwell/helm-charts/pull/1168)) _@stevehipwell_
- Update the _Thanos_ OCI image to [v0.39.1](https://github.com/thanos-io/thanos/releases/tag/v0.39.1). ([#1215](https://github.com/stevehipwell/helm-charts/pull/1215)) _@stevehipwell_

## [v1.20.0] - 2025-04-09

### Changed

- Updated the _Thanos_ OCI image to [v0.38.0](https://github.com/thanos-io/thanos/releases/tag/v0.38.0). ([#1167](https://github.com/stevehipwell/helm-charts/pull/1167)) _@stevehipwell_

## [v1.19.2] - 2024-12-11

### Changed

- Updated the _Thanos_ OCI image to [v0.37.2](https://github.com/thanos-io/thanos/releases/tag/v0.37.2). ([#1096](https://github.com/stevehipwell/helm-charts/pull/1096)) _@stevehipwell_

## [v1.19.1] - 2024-12-04

### Changed

- Updated the _Thanos_ OCI image to [v0.37.1](https://github.com/thanos-io/thanos/releases/tag/v0.37.1). ([#1092](https://github.com/stevehipwell/helm-charts/pull/1092)) _@stevehipwell_

## [v1.19.0] - 2024-11-25

### Changed

- Updated the _Thanos_ OCI image to [v0.37.0](https://github.com/thanos-io/thanos/releases/tag/v0.37.0). ([#1084](https://github.com/stevehipwell/helm-charts/pull/1084)) _@stevehipwell_

## [v1.18.2] - 2024-11-22

### Changed

- Updated configmap reload image to use `ghcr.io/jimmidyson/configmap-reload` as the _Chainguard_ image is no longer available. ([#1082](https://github.com/stevehipwell/helm-charts/pull/1082)) _@stevehipwell_

## [v1.18.1] - 2024-08-13

### Added

- Added support for setting the `unhealthyPodEvictionPolicy` value for the `PodDisruptionBudget` via the `<component>.podDisruptionBudget.unhealthyPodEvictionPolicy` value on _Kubernetes_ `1.27` or higher clusters.
- Added support for setting the `trafficDistribution` value for the _Query_ `Service` via the `query.service.trafficDistribution` value on _Kubernetes_ `1.31` or higher clusters.
- Added support for setting the `trafficDistribution` value for the _Query Frontend_ `Service` via the `queryFrontend.service.trafficDistribution` value on _Kubernetes_ `1.31` or higher clusters.
- Added support for setting the `trafficDistribution` value for the _Store Gateway_ `Service` via the `storeGateway.service.trafficDistribution` value on _Kubernetes_ `1.31` or higher clusters.

### Changed

- Updated the _Thanos_ OCI image to [v0.36.1](https://github.com/thanos-io/thanos/releases/tag/v0.36.1).

## [v1.18.0] - 2024-08-01

### Changed

- Updated the _Thanos_ OCI image to [v0.36.0](https://github.com/thanos-io/thanos/releases/tag/v0.36.0).

## [v1.17.2] - 2024-05-30

### Changed

- Updated the _Thanos_ OCI image to [v0.35.1](https://github.com/thanos-io/thanos/releases/tag/v0.35.1).

## [v1.17.1] - 2024-05-15

### Changed

- Changed the defaults for `podSecurityContext` and `securityContext` for all services to be less permissive by default.

## [v1.17.0] - 2024-05-02

### Added

- Added built in support for automatically setting the `GOMEMLIMIT` env variable on all Thanos components via the `autoGomemlimit.enabled` & `autoGomemlimit.ratio` values.
- Added experimental support for configuring query to access store pods as a group via the `storeEndpointGroup` value, this switches to round-robin instead of fan-out.
- Added experimental support for external endpoint groups via the `additionalEndpointGroups` value.

### Changed

- Updated the _Thanos_ OCI image to [v0.35.0](https://github.com/thanos-io/thanos/releases/tag/v0.35.0).

## [v1.16.5] - 2024-04-23

### Fixed

- Fixed `ServiceMonitor` job name.

## [v1.16.4] - 2024-04-22

### Added

- Added the remote write port to the _Thanos Receive_ ingress.

### Changed

- Switched to using the port name for ingress.

### Fixed

- Fixed incorrect `ServiceMonitor` name via the `jobLabel` field.

## [v1.16.3] - 2024-04-04

### Fixed

- Fixed bug introduced as part of adding extra volume support.

## [v1.16.2] - 2024-04-04

### Added

- Added support for setting `extraVolumes` & `extraVolumeMounts` for each component.

## [v1.16.1] - 2024-02-20

### Changed

- Updated the _Thanos_ OCI image to [v0.34.1](https://github.com/thanos-io/thanos/releases/tag/v0.34.1).

## [v1.16.0] - 2024-02-12

### Changed

- Updated the _Thanos_ OCI image to [v0.34.0](https://github.com/thanos-io/thanos/releases/tag/v0.34.0).

## [v1.15.0] - 2024-01-05

### Added

- Added `compact.deduplication.enabled` value to disable compact deduplication.
- Added `compact.deduplication.func` value to set the compact deduplication function.
- Added `rule.instanceLabel` to set the label `thanos_rule` to `<NAMESPACE>/<RULE_FULLNAME>`.
- Added support for specifying custom Kubernetes cluster domain.

### Changed

- Updated the _Thanos_ OCI image to [v0.33.0](https://github.com/thanos-io/thanos/releases/tag/v0.33.0).
- Changed the default `configmap-reload` image variant to `cgr.dev/chainguard/configmap-reload:latest`.

### Deprecated

- Deprecated the `compact.replicaDeduplication` value in favour of setting `compact.deduplication.func=penalty`.

## [v1.14.5] - 2023-10-20

### Changed

- Updated the _Thanos_ OCI image to [v0.32.5](https://github.com/thanos-io/thanos/releases/tag/v0.32.5).

## [v1.14.4] - 2023-10-03

### Changed

- Updated the _Thanos_ OCI image to [v0.32.4](https://github.com/thanos-io/thanos/releases/tag/v0.32.4).

## [v1.14.3] - 2023-09-25

### Fixed

- Fixed _Thanos_ chart icon.

## [v1.14.2] - 2023-09-25

### Changed

- Updated the _Thanos_ OCI image to [v0.32.3](https://github.com/thanos-io/thanos/releases/tag/v0.32.3).

## [v1.14.1] - 2023-08-31

### Changed

- Updated the _Thanos_ OCI image from `v0.32.1` to [v0.32.2](https://github.com/thanos-io/thanos/releases/tag/v0.32.2).

## [v1.14.0] - 2023-08-29

### Added

- Added support for deleting PVCs in Kubernetes v1.27 or newer via the `persistence.retainDeleted` & `persistence.retainScaled` values under `compact`, `receive.ingestor`, `rule` & `storeGateway`; these default to `true`.

### Changed

- Updated the _Thanos_ OCI image from `v0.31.0` to [v0.32.1](https://github.com/thanos-io/thanos/releases/tag/v0.32.1).

## [v1.13.2] - 2023-07-28

### Fixed

- Fixed incorrect template name in compact for patching affinity.
- Fixed typo in receive HPA label template.

## [v1.13.1] - 2023-07-20

### Fixed

- Fixed typo in the compact deduplication argument.

## [v1.13.0] - 2023-07-04

### Added

- Added support for not providing a tag as part of the image by setting the value to `"-"`.
- Added support for using a digest as part of the image.
- Added support for customizing the config reloader image.
- Added support for compact to deduplicate HA Prometheus replica metrics by setting `compact.replicaDeduplication` which will use the `penalty` deduplication function.

### Changed

- Changed the config reloader default image.

### Fixed

- Fixed missing `--deduplication.replica-label` from compact.

## [v1.12.4] - 2023-05-02

### Fixed

- Fixed missing Thanos rule service when ingress is enabled.

## [v1.12.3] - 2023-04-28

### Fixed

- Fixed incorrect affinity and topology spread logic.

## [v1.12.2] - 2023-04-28

### Fixed

- Fixed incorrect affinity and topology spread logic.

## [v1.12.1] - 2023-03-29

### Fixed

- Fixed missing Receive Router `receive_replica` label.
- Fixed Receive Router hashring mount path.
- Fixed Receive hashring config when there are multiple Receive Ingestor replicas.

## [v1.12.0] - 2023-03-28

### Added

- Added support for specifying `objstoreConfig.value` as an object.

### Changed

- Updated the _Thanos_ image to [v0.31.0](https://github.com/thanos-io/thanos/releases/tag/v0.31.0).

### Fixed

- Fixed missing key in Rule config map.

## [v1.11.1] - 2023-03-09

### Added

- Added a default `labelSelector` for the release pods to `topologySpreadConstraints`, `affinity.podAffinity` & `affinity.podAntiAffinity`.

### Fixed

- Fixed receive remote write pod name being too long.

## [v1.11.0] - 2023-02-22

### Added

- Added support for [Thanos Receive](https://thanos.io/tip/components/receive.md/).
- Added top level `additionalEndpoints` value to replace `query.additionalStores`.
- Added top level `additionalReplicaLabels` value to replace `query.replicaLabels`.
- Added support for `topologySpreadConstraints`.

### Changed

- Changed implementation to use `--endpoint` instead of store `--store`.

### Fixed

- Fixed missing Query replica label arguments.
- Fixed missing Rule replica label drop arguments.

### Deprecated

- Deprecated `query.additionalStores`.
- Deprecated `query.replicaLabels`.

### Removed

- Removed non-headless services where there is a headless service present.

## [v1.10.2] - 2023-02-01

### Changed

- Updated the _Thanos_ image to [v0.30.2](https://github.com/thanos-io/thanos/releases/tag/v0.30.2).

## [v1.10.1] - 2023-01-05

### Changed

- Updated the _Thanos_ image to [v0.30.1](https://github.com/thanos-io/thanos/releases/tag/v0.30.1).

## [v1.10.0] - 2023-01-03

### Changed

- Updated the _Thanos_ image to [v0.30.0](https://github.com/thanos-io/thanos/releases/tag/v0.30.0).

## [v1.9.1] - 2022-12-18

### Fixed

- Fixed incorrect `HorizontalPodAutoscaler` API version for K8s versions lower than `v1.23`.
- Fixed incorrect `PodDisruptionBudget` API version for K8s versions lower than `v1.21`.

## [v1.9.0] - 2022-12-02

### Changed

- Changed `HorizontalPodAutoscaler` API version to `autoscaling/v2beta2` for K8s versions lower than `v1.23`.

### Fixed

- Fixed incorrect `HorizontalPodAutoscaler` implementation for `autoscaling/v2` API version.

## [v1.8.0] - 2022-12-02

### Added

- Added support for annotating the services.

### Fixed

- Fixed incorrect `HorizontalPodAutoscaler` API version; this will now be `autoscaling/v2` from K8s `v1.23` upwards.

## [v1.7.0] - 2022-11-03

### Changed

- Updated the _Thanos_ image to [v0.29.0](https://github.com/thanos-io/thanos/releases/tag/v0.29.0).

## [v1.6.2] - 2022-10-24

### Added

- Added new `compact.serviceAccount.labels`, `query.serviceAccount.labels`, `queryFrontend.serviceAccount.labels`, `rule.serviceAccount.labels` & `storeGateway.serviceAccount.labels` values to add labels to the `ServiceAccount` resources.

## [v1.6.1] - 2022-10-07

### Changed

- Updated the _Thanos_ image to [v0.28.1](https://github.com/thanos-io/thanos/releases/tag/v0.28.1).

## [v1.6.0] - 2022-08-31

### Changed

- Updated _Thanos_ image to [v0.28.0](https://github.com/thanos-io/thanos/releases/tag/v0.28.0).

## [v1.5.0] - 2022-06-07

### Added

- Added `serviceAccount.automountToken` to all components to default token binding to `false`.
- Added explicit namespace declaration in templates.

### Changed

- Update _Thanos_ image to [v0.27.0](https://github.com/thanos-io/thanos/releases/tag/v0.27.0).

## [v1.4.0] - 2022-05-09

### Added

- Added `commonLabels` to allow the addition of labels to all resources.

### Changed

- Update _Thanos_ image to [v0.26.0](https://github.com/thanos-io/thanos/releases/tag/v0.26.0).

## [v1.3.2] - 2022-03-24

### Changed

- Update _Thanos_ image to [v0.25.2](https://github.com/thanos-io/thanos/releases/tag/v0.25.2).

## [v1.3.1] - 2022-03-10

### Changed

- Update _Thanos_ image to [v0.25.1](https://github.com/thanos-io/thanos/releases/tag/v0.25.1).

## [v1.3.0] - 2022-03-07

### Added

- Added `serviceMonitor.endpointConfig` to allow customization of the `ServiceMonitor` endpoint.

### Changed

- Update _Thanos_ image to [v0.25.0](https://github.com/thanos-io/thanos/releases/tag/v0.25.0).

### Deprecated

- Deprecated `serviceMonitor.interval` in favour of `serviceMonitor.endpointConfig.interval`.

### Removed

- Removed chart default for `serviceMonitor.interval`, the interval should be the _Prometheus_ default if not overridden.

## [v1.2.0] - 2022-01-04

### Changed

- Update _Thanos_ image to [v0.24.0](https://github.com/thanos-io/thanos/releases/tag/v0.24.0).

## [v1.1.2] - 2021-12-27

### Changed

- Update _Thanos_ image to [v0.23.2](https://github.com/thanos-io/thanos/releases/tag/v0.23.2).

## [v1.1.1] - 2021-12-17

### Changed

- Revert change to _Rule_ to use _Query Frontend_.

## [v1.1.0] - 2021-12-17

### Changed

- Use _Query Frontend_ service for _Rule_ if it's enabled.

## [v1.0.3] - 2021-10-21

### Changed

- Fix _HorizontalPodAutoscaler_ defaults.

## [v1.0.2] - 2021-10-12

### Changed

- Fix _Rule_ component service account.

## [v1.0.1] - 2021-10-05

### Changed

- Update _Thanos_ image to [v0.23.1](https://github.com/thanos-io/thanos/releases/tag/v0.23.1).

## [v1.0.0] - 2021-10-04

### Changed

- Update _Thanos_ image to [v0.23.0](https://github.com/thanos-io/thanos/releases/tag/v0.23.0).

## [v0.10.2] - 2021-09-17

### Changed

- Fix volume mounts.

## [v0.10.1] - 2021-09-17

### Changed

- Fix rule rules ConfigMap support.

## [v0.10.0] - 2021-09-17

### Added

- Query ingress support to rule.

## [v0.9.0] - 2021-09-01

### Changed

- Fix ingress.

## [v0.8.0] - 2021-08-31

### Added

- Ingress support to the Query, Query Frontend & Rule components.

### Changed

- Use the `policy/v1` API for `PodDisruptionBudget` if the K8s version supports it.

## [v0.7.0] - 2021-08-24

### Added

- [Rule](https://thanos.io/v0.22/components/rule.md/) component.
- Value `query.additionalStores` to enable custom Thanos stores to be configured for the query service.

### Changed

- Fixed compact service StatefulSet service name.

### Removed

- Values `query.sidecarService` & `query.rulerServcie`, use `query.additionalStores` instead.

## [v0.6.0] - 2021-08-11

### Changed

- Fix volume claim labels.

## [v0.5.0] - 2021-08-11

### Changed

- Fix query arguments.

## [v0.4.0] - 2021-08-10

### Changed

- Fix service monitors.

## [v0.3.0] - 2021-08-10

### Changed

- Fix compact.

## [v0.2.0] - 2021-08-10

### Changed

- Change query config values.

## [v0.1.0] - 2021-08-09

### Added

- Initial release based on [v0.22.0](https://github.com/thanos-io/thanos/releases/tag/v0.22.0).

<!--
RELEASE LINKS
-->
[UNRELEASED]: https://github.com/stevehipwell/helm-charts/tree/main/charts/thanos
[v1.21.1]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.21.1
[v1.21.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.21.0
[v1.20.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.20.0
[v1.19.2]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.19.2
[v1.19.1]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.19.1
[v1.19.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.19.0
[v1.18.2]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.18.2
[v1.18.1]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.18.1
[v1.18.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.18.0
[v1.17.2]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.17.2
[v1.17.1]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.17.1
[v1.17.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.17.0
[v1.16.5]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.16.5
[v1.16.4]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.16.4
[v1.16.3]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.16.3
[v1.16.2]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.16.2
[v1.16.1]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.16.1
[v1.16.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.16.0
[v1.15.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.15.0
[v1.14.5]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.14.5
[v1.14.4]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.14.4
[v1.14.3]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.14.3
[v1.14.2]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.14.2
[v1.14.1]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.14.1
[v1.14.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.14.0
[v1.13.2]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.13.2
[v1.13.1]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.13.1
[v1.13.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.13.0
[v1.12.4]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.12.4
[v1.12.3]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.12.3
[v1.12.2]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.12.2
[v1.12.1]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.12.1
[v1.12.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.12.0
[v1.11.1]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.11.1
[v1.11.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.11.0
[v1.10.2]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.10.2
[v1.10.1]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.10.1
[v1.10.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.10.0
[v1.9.1]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.9.1
[v1.9.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.9.0
[v1.8.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.8.0
[v1.7.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.7.0
[v1.6.2]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.6.2
[v1.6.1]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.6.1
[v1.6.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.6.0
[v1.5.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.5.0
[v1.4.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.4.0
[v1.3.2]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.3.2
[v1.3.1]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.3.1
[v1.3.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.3.0
[v1.2.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.2.0
[v1.1.2]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.1.2
[v1.1.1]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.1.1
[v1.1.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.1.0
[v1.0.3]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.0.3
[v1.0.2]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.0.2
[v1.0.1]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.0.1
[v1.0.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-1.0.0
[v0.10.2]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-0.10.2
[v0.10.1]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-0.10.1
[v0.10.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-0.10.0
[v0.9.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-0.9.0
[v0.8.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-0.8.0
[v0.7.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-0.7.0
[v0.6.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-0.6.0
[v0.5.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-0.5.0
[v0.4.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-0.4.0
[v0.3.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-0.3.0
[v0.2.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-0.2.0
[v0.1.0]: https://github.com/stevehipwell/helm-charts/releases/tag/thanos-0.1.0
