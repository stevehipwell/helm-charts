# Fluentd Aggregator Helm Chart Changelog

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

## [v5.5.0] - 2026-02-10

### Changed

- Update _Fluentd Aggregator_ OCI image to [v3.5.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v3.5.0) (_Fluentd_ [v1.19.1](https://github.com/fluent/fluentd/releases/tag/v1.19.1)). ([#1330](https://github.com/stevehipwell/helm-charts/pull/1330)) _@stevehipwell_

## [v5.4.0] - 2026-02-09

### Added

- Add support to explicitly set the `automountServiceAccountToken` field on the pod via the `automountServiceAccountToken` value.([#1296](https://github.com/stevehipwell/helm-charts/pull/1296)) _@stevehipwell_

### Changed

- Update _Fluentd Aggregator_ OCI image to [v3.4.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v3.4.0) (_Fluentd_ [v1.19.1](https://github.com/fluent/fluentd/releases/tag/v1.19.1)). ([#1326](https://github.com/stevehipwell/helm-charts/pull/1326)) _@stevehipwell_

## [v5.3.0] - 2025-11-28

### Added

- Add init container to fix permissions on tmp directory. ([#1279](https://github.com/stevehipwell/helm-charts/pull/1279)) _@stevehipwell_

### Changed

- Update _Fluentd Aggregator_ OCI image to [v3.3.1](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v3.3.1) (_Fluentd_ [v1.19.1](https://github.com/fluent/fluentd/releases/tag/v1.19.1)). ([#1279](https://github.com/stevehipwell/helm-charts/pull/1279)) _@stevehipwell_

## [v5.2.0] - 2025-08-05

### Changed

- Update _Fluentd Aggregator_ OCI image to [v3.2.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v3.2.0) (_Fluentd_ [v1.19.0](https://github.com/fluent/fluentd/releases/tag/v1.19.0)). ([#1225](https://github.com/stevehipwell/helm-charts/pull/1225)) _@stevehipwell_

## [v5.1.1] - 2025-07-15

### Changed

- Update _Fluentd Aggregator_ OCI image to [v3.1.1](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v3.1.1) (_Fluentd_ [v1.18.0](https://github.com/fluent/fluentd/releases/tag/v1.18.0)). ([#1217](https://github.com/stevehipwell/helm-charts/pull/1217)) _@stevehipwell_

## [v5.1.0] - 2025-06-16

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v3.1.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v3.1.0) (_Fluentd_ [v1.18.0](https://github.com/fluent/fluentd/releases/tag/v1.18.0)). ([#1203](https://github.com/stevehipwell/helm-charts/pull/1203)) _@stevehipwell_

## [v5.0.1] - 2025-05-12

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v3.0.1](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v3.0.1) (_Fluentd_ [v1.18.0](https://github.com/fluent/fluentd/releases/tag/v1.18.0)). ([#1188](https://github.com/stevehipwell/helm-charts/pull/1188)) _@stevehipwell_

## [v5.0.0] - 2025-04-17

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v3.0.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v3.0.0) (_Fluentd_ [v1.18.0](https://github.com/fluent/fluentd/releases/tag/v1.18.0)). ([#1176](https://github.com/stevehipwell/helm-charts/pull/1176)) _@stevehipwell_

### Removed

- Remove `image.tagPrefix` as it's no longer needed with the image now only being built on Debian. ([#1176](https://github.com/stevehipwell/helm-charts/pull/1176)) _@stevehipwell_

## [v4.11.0] - 2025-03-12

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.20.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.20.0) (_Fluentd_ [v1.18.0](https://github.com/fluent/fluentd/releases/tag/v1.18.0)). ([#1144](https://github.com/stevehipwell/helm-charts/pull/1144)) _@stevehipwell_

## [v4.10.0] - 2025-02-27

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.19.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.19.0) (_Fluentd_ [v1.18.0](https://github.com/fluent/fluentd/releases/tag/v1.18.0)). ([#1134](https://github.com/stevehipwell/helm-charts/pull/1134)) _@stevehipwell_

## [v4.9.0] - 2025-01-02

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.18.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.18.0) (_Fluentd_ [v1.18.0](https://github.com/fluent/fluentd/releases/tag/v1.18.0)). ([#1100](https://github.com/stevehipwell/helm-charts/pull/1100)) _@stevehipwell_

## [v4.8.4] - 2024-11-04

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.17.4](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.17.4) (_Fluentd_ [v1.17.1](https://github.com/fluent/fluentd/releases/tag/v1.17.1)). ([#1073](https://github.com/stevehipwell/helm-charts/pull/1073)) _@stevehipwell_

## [v4.8.3] - 2024-09-10

### Added

- Added deterministic _Grafana_ dashboard `uid` based on the chart namespace and fullname.

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.17.3](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.17.3) (_Fluentd_ [v1.17.1](https://github.com/fluent/fluentd/releases/tag/v1.17.1)).

## [v4.8.2] - 2024-08-29

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.17.2](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.17.2) (_Fluentd_ [v1.17.1](https://github.com/fluent/fluentd/releases/tag/v1.17.1)).

## [v4.8.1] - 2024-08-20

### Added

- Added support for setting the `unhealthyPodEvictionPolicy` value for the `PodDisruptionBudget` via the `podDisruptionBudget.unhealthyPodEvictionPolicy` value on _Kubernetes_ `1.27` or higher clusters.
- Added support for setting the `trafficDistribution` value for the `Services` via the `service.trafficDistribution` value on _Kubernetes_ `1.31` or higher clusters.

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.17.1](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.17.1) (_Fluentd_ [v1.17.1](https://github.com/fluent/fluentd/releases/tag/v1.17.1)).

## [v4.8.0] - 2024-06-14

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.17.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.17.0) (_Fluentd_ [v1.17.0](https://github.com/fluent/fluentd/releases/tag/v1.17.0)).

## [v4.7.0] - 2024-06-10

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.16.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.16.0) (_Fluentd_ [v1.17.0](https://github.com/fluent/fluentd/releases/tag/v1.17.0)).

## [v4.6.0] - 2024-04-30

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.15.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.15.0) (_Fluentd_ [v1.17.0](https://github.com/fluent/fluentd/releases/tag/v1.17.0)).

## [v4.5.0] - 2024-04-29

### Added

- Added support for setting the `servicePort` for ingress to the port name.

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.14.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.14.0) (_Fluentd_ [v1.16.5](https://github.com/fluent/fluentd/releases/tag/v1.16.5)).

## [v4.4.0] - 2024-04-02

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.13.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.13.0) (_Fluentd_ [v1.16.5](https://github.com/fluent/fluentd/releases/tag/v1.16.5)).

## [v4.3.0] - 2024-03-14

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.12.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.12.0) (_Fluentd_ [v1.16.4](https://github.com/fluent/fluentd/releases/tag/v1.16.4)).

## [v4.2.1] - 2024-02-13

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.11.1](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.11.1) (_Fluentd_ [v1.16.3](https://github.com/fluent/fluentd/releases/tag/v1.16.3)).

## [v4.2.0] - 2024-01-19

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.11.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.11.0) (_Fluentd_ [v1.16.3](https://github.com/fluent/fluentd/releases/tag/v1.16.3)).

## [v4.1.3] - 2023-12-13

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.10.2](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.10.2) (_Fluentd_ [v1.16.3](https://github.com/fluent/fluentd/releases/tag/v1.16.3)).

## [v4.1.2] - 2023-12-11

### Fixed

- Fixed legacy migration by fixing the changes when the `service.legacy` value is set.

## [v4.1.1] - 2023-12-07

> [!WARNING]
> Do not use this version with `service.legacy` as the implementation was incorrect.

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.10.1](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.10.1) (_Fluentd_ [v1.16.3](https://github.com/fluent/fluentd/releases/tag/v1.16.3)).

### Fixed

- Fixed legacy migration by adding `service.legacy` value to support keeping the legacy headless service name.
- Fixed incorrect truncation of names when full name is longer than `53` characters.

## [v4.1.0] - 2023-11-23

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.10.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.10.0) (_Fluentd_ [v1.16.3](https://github.com/fluent/fluentd/releases/tag/v1.16.3)).

## [v4.0.0] - 2023-06-23

> [!WARNING]
> This release has major breaking changes and you will need to check the values before upgrading.
>
> If you're upgrading from an older chart version and have persistence enabled you will need to set `persistence.legacy=true` and either `persistence.legacyName=buffer` or `persistence.legacyName=state` depending on the name of your volume claim template.

### Added

- Added support for autoscaling via the `autoscaling` value.
- Added separate headless `Service` for the `StatefulSet`.
- Added support for deleting PVCs in Kubernetes v1.27 or newer via the `persistence.retainDeleted` & `persistence.retainScaled` values which are `true` by default.
- Added `minReadySeconds`, `ordinals`, `podManagementPolicy` & `updateStrategy` values to better configure the `StatefulSet`.
- Added support for custom args via the `args` value.
- Added `replicas` value to replace `replicaCount`.
- Added `ingresses` value to replace `ingress` as the chart now supports multiple ingresses.
- Added `config` value to replace `configuration`.

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.9.3](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.9.2) (_Fluentd_ [v1.16.1](https://github.com/fluent/fluentd/releases/tag/v1.16.1)).
- Changed the way ports are configured to be via `service.httpPort`, `service.metricsPort` or `service.additionalPorts`.
- As part of the change to `config` all of the raw Fluentd config values can be templated.
- The default `podSecurityContext` & `securityContext` are now locked down.
- Changed the default readiness probe to fail before the liveness probe.
- Improved dashboard which is now tightly scoped to the chart release.

### Removed

- Removed the `replicaCount` value as it's been replaced by `replicas`.
- Removed the `ingress` value as it's been replaced by `ingresses`.
- Removed the `configuration` value as it's been replaced by `config`.

## [v3.10.0] - 2023-06-08

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.9.2](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.9.2) (_Fluentd_ [v1.16.1](https://github.com/fluent/fluentd/releases/tag/v1.16.1)).
- Simplified routing logic.

### Removed

- Removed `host` & `tag` labels form metrics to reduce cardinality.

## [v3.9.1] - 2023-06-08

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.9.1](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.9.1) (_Fluentd_ [v1.16.1](https://github.com/fluent/fluentd/releases/tag/v1.16.1)).

## [v3.9.0] - 2023-06-08

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.9.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.9.0) (_Fluentd_ [v1.16.1](https://github.com/fluent/fluentd/releases/tag/v1.16.1)).

## [v3.8.0] - 2023-03-29

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.8.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.8.0) (_Fluentd_ [v1.16.0](https://github.com/fluent/fluentd/releases/tag/v1.16.0)).

## [v3.7.0] - 2023-03-16

### Added

- Added support for alternative image variants using `image.tagPrefix` and a fixed digest using `image.digest`.
- Added a default `labelSelector` for the release pods to `topologySpreadConstraints`, `affinity.podAffinity` & `affinity.podAntiAffinity`.

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.7.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.7.0) (_Fluentd_ [v1.15.3](https://github.com/fluent/fluentd/releases/tag/v1.15.3)).

## [v3.6.2] - 2023-02-15

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.6.2](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.6.2) (_Fluentd_ [v1.15.3](https://github.com/fluent/fluentd/releases/tag/v1.15.3)).

## [v3.6.1] - 2023-02-06

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.6.1](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.6.1) (_Fluentd_ [v1.15.3](https://github.com/fluent/fluentd/releases/tag/v1.15.3)).

## [v3.6.0] - 2023-01-10

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.6.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.6.0) (_Fluentd_ [v1.15.3](https://github.com/fluent/fluentd/releases/tag/v1.15.3)).
- Changed liveness probe to start later and be less sensitive.
- Changed readiness probe to start later and be less sensitive.

## [v3.5.0] - 2022-12-06

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.5.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.5.0) (_Fluentd_ [v1.15.3](https://github.com/fluent/fluentd/releases/tag/v1.15.3)).

## [v3.4.2] - 2022-11-28

### Changed

- Moved debug filter to above global filters.

### Fixed

- Fixed internal labelling pattern to work correctly.
- Fixed `ServiceMonitor` port.

## [v3.4.1] - 2022-11-28

### Fixed

- Fixed route copy bug.

## [v3.4.0] - 2022-11-28

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.4.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.4.0) (_Fluentd_ [v1.15.3](https://github.com/fluent/fluentd/releases/tag/v1.15.3)).

### Fixed

- Fixed missing use of `configuration.system.rootDir` to set the mount path; this means that the buffer paths can be kept as `/fluentd/buffers` when migrating from `v2`.
- Fixed bug in creating dashboards.
- Fixed missing service annotations in template.

## [v3.3.0] - 2022-11-15

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.3.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.3.0) (_Fluentd_ [v1.15.3](https://github.com/fluent/fluentd/releases/tag/v1.15.3)).

## [v3.2.0] - 2022-11-02

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.2.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.2.0) (_Fluentd_ [v1.15.3](https://github.com/fluent/fluentd/releases/tag/v1.15.3)).

## [v3.1.0] - 2022-11-02

### Changed

- Updated _Fluentd Aggregator_ OCI image to [v2.1.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.1.0) (_Fluentd_ [v1.15.2](https://github.com/fluent/fluentd/releases/tag/v1.15.2)).

## [v3.0.2] - 2022-10-12

### Added

- Added a new `serviceAccount.labels` value to add labels to the `ServiceAccount`.

## [v3.0.1] - 2022-10-12

### Added

- Added support for setting an IPv6 bind address.

## [v3.0.0] - 2022-10-06

### Highlights

> [!CAUTION]
> This release contains a number of breaking changes, please check out the full list of changes for the values which have been removed as well as taking note that the root directory mounted to the `PersistentVolume` has changed so buffer paths will need to be changed accordingly.

This release introduces a new strongly typed configuration mode which isn't compatible with the previous `v2` versions as well as updating the Fluentd image and adding new capabilities to the chart.

#### Structured Configuration

The Fluentd configuration is now much more structured to make it much harder to break chart functionality while configuring Fluentd. This change starts with the replacement of `config` with `configuration` and is founded on the new `routes` sub-value which is used to set up message routing in a strongly typed way. This design reduces the raw Fluentd configuration inputs to the `filters` value for global filters and the nested `config` value for each route.

### Added

- Added explicit namespace declaration in templates.
- Added `imagePullSecrets` value.
- Added `serviceAccount.automountToken` to default token binding to `false`.
- Added `service.clusterIP` to enable making the `Service` headless.
- Added `serviceMonitor` value to replace `metrics.serviceMonitor`.
- Added `topologySpreadConstraints` value.
- Added `persistence.legacy` value to support migrating from `v2` chart versions.
- Added `configuration` value to support a strongly typed configuration pattern.

### Changed

- Updated _Fluentd Aggregator_ Docker image to [v2.0.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.0.0) (_Fluentd_ [v1.15.2](https://github.com/fluent/fluentd/releases/tag/v1.15.2)).
- Changed `PersistentVolume` mount point to `/fluentd/state`; use this path for buffers.

### Removed

- Removed `image.pullSecrets` as they've been replaced by `imagePullSecrets`.
- Removed `service.ports` value as the ports are now part of the `configuration` value.
- Removed `metrics` value, see `serviceMonitor` and `configuration.metrics`.
- Removed `debug` value as it's been replaced by `configuration.debug`.
- Removed `config` value as configuration is now handled via the more strongly typed `configuration` value.

## [v2.7.1] - 2022-05-03

### Changed

- Update _Fluentd Aggregator_ Docker image to [v1.14.10](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v1.14.10) (_Fluentd_ [v1.14.6](https://github.com/fluent/fluentd/releases/tag/v1.14.6)).

## [v2.7.0] - 2022-04-01

### Added

- Added `commonLabels` to allow the addition of labels to all resources.
- Added `metrics.serviceMonitor.endpointConfig` to allow customisation of the `ServiceMonitor` endpoint.
- Added `extraVolumes` and `extraVolumeMounts`.

### Changed

- Update _Fluentd Aggregator_ Docker image to [v1.14.9](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v1.14.9) (_Fluentd_ [v1.14.6](https://github.com/fluent/fluentd/releases/tag/v1.14.6)).

### Deprecated

- Deprecated `metrics.serviceMonitor.interval` in favour of `metrics.serviceMonitor.endpointConfig.interval`.

### Removed

- Removed chart default for `metrics.serviceMonitor.interval`, the interval should be the _Prometheus_ default if not overridden.

## [v2.6.9] - 2022-02-10

### Added

- Added `arm64` support as the `stevehipwell/fluentd-aggregator` image is now multi-arch.

### Changed

- Update _Fluentd Aggregator_ Docker image to [v1.14.8](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v1.14.8) (_Fluentd_ [v1.14.5](https://github.com/fluent/fluentd/releases/tag/v1.14.5)).

## [v2.6.8] - 2022-01-21

### Changed

- Update _Fluentd Aggregator_ Docker image to [v1.14.6](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v1.14.6) (_Fluentd_ `v1.14.4`).

## [v2.6.7] - 2022-01-07

### Changed

- Update _Fluentd Aggregator_ Docker image to [v1.14.5](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v1.14.5) (_Fluentd_ `v1.14.4`).

## [v2.6.6] - 2021-11-29

### Changed

- Update _Fluentd Aggregator_ Docker image to [v1.14.4](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v1.14.4) (_Fluentd_ `v1.14.3`).

## [v2.6.5] - 2021-11-11

### Changed

- Move debug config after filters config so filters can be debugged.

## [v2.6.4] - 2021-10-29

### Changed

- Update _Fluentd Aggregator_ Docker image to [v1.14.3](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v1.14.3) (_Fluentd_ `v1.14.2`).

## [v2.6.3] - 2021-10-28

### Changed

- Update _Fluentd Aggregator_ Docker image to [v1.14.2](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v1.14.2) (_Fluentd_ `v1.14.1`) to support _OpenSearch_.

## [v2.6.2] - 2021-10-04

### Changed

- Bump version.

## [v2.6.1] - 2021-10-04

### Changed

- Update _Fluentd Aggregator_ Docker image to [v1.14.1](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v1.14.1) (_Fluentd_ `v1.14.1`).

## [v2.6.0] - 2021-08-31

### Changed

- Update _Fluentd Aggregator_ Docker image to [v1.14.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v1.14.0) (_Fluentd_ `v1.14.0`).
- Use the `policy/v1` API for `PodDisruptionBudget` if the K8s version supports it.

## [v2.5.3] - 2021-08-11

### Changed

- Improved documentation.

## [v2.5.2] - 2021-07-27

### Changed

- Update _Fluentd Aggregator_ Docker image to [v1.13.3](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v1.13.3) (_Fluentd_ `v1.13.3`)

## [v2.5.1] - 2021-07-13

### Changed

- Update _Fluentd Aggregator_ Docker image to `v1.13.2` (_Fluentd_ `v1.13.2`)

## [v2.5.0] - 2021-06-24

### Changed

- Update _Fluentd Aggregator_ Docker image to `v1.13.1` (_Fluentd_ `v1.13.1`)
- Add _PodDisruptionBudget_ support

## [v2.4.0] - 2021-06-24

### Changed

- Update _Fluentd Aggregator_ Docker image to `v1.13.0` (_Fluentd_ `v1.13.0`)

## [v2.3.1] - 2021-06-17

### Changed

- Fix notes if ingress is enabled

## [v2.3.0] - 2021-06-16

### Changed

- Update _Fluentd_ Docker image to `v1.12.5` (_Fluentd_ `v1.12.4`)
- Modify how ports are defined
- Support K8s v1.18 ingress changes

## [v2.2.0] - 2021-05-19

### Changed

- Upgrade _Fluentd_ Docker image to `v1.12.4` (_Fluentd_ `v1.12.3`)

## [v2.1.2] - 2021-05-11

### Changed

- Upgrade _Fluentd_ Docker image to `v1.12.3` (_Fluentd_ `v1.12.2`)

## [v2.1.1] - 2021-04-23

### Changed

- Fixed default routing implementation

## [v2.1.0] - 2021-04-22

### Changed

- Added separate route config via `config.route`

## [v2.0.0] - 2021-04-06

### Changed

- Upgraded to _Fluentd_ `v1.12.2`
- Removed `@mainstream` label from default input

## [v1.2.1] - 2021-04-06

### Added

- Support `podLabels` configuration value

## [v1.2.0] - 2021-04-06

### Added

- _Grafana_ dashboard
- _Prometheus_ input metrics

### Changed

- Hide metrics and health check logs

## [v1.1.3] - 2021-03-31

### Changed

- Update default config

## [v1.1.2] - 2021-03-31

### Changed

- Update default config

## [v1.1.1] - 2021-03-31

### Changed

- Update default config

## [v1.1.0] - 2021-03-30

### Changed

- Upgraded _Fluentd Aggregator_ image to `v1.11.5`

## [v1.0.5] - 2021-02-16

### Changed

- Fix host label for metrics

## [v1.0.4] - 2021-01-27

### Changed

- Updated default config

## [v1.0.3] - 2021-01-20

### Changed

- Fix metrics port in config

## [v1.0.2] - 2021-01-15

### Added

- Dynamic probe configuration

## [v1.0.1] - 2021-01-07

### Changed

- Use `fsGroup: 2000`

## [v1.0.0] - 2021-01-06

### Added

- Initial release

<!--
RELEASE LINKS
-->
[UNRELEASED]: https://github.com/stevehipwell/helm-charts/tree/main/charts/fluentd-aggregator
[v5.5.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-5.5.0
[v5.4.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-5.4.0
[v5.3.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-5.3.0
[v5.2.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-5.2.0
[v5.1.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-5.1.1
[v5.1.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-5.1.0
[v5.0.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-5.0.1
[v5.0.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-5.0.0
[v4.11.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.11.0
[v4.10.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.10.0
[v4.9.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.9.0
[v4.8.4]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.8.4
[v4.8.3]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.8.3
[v4.8.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.8.2
[v4.8.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.8.1
[v4.8.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.8.0
[v4.7.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.7.0
[v4.6.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.6.0
[v4.5.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.5.0
[v4.4.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.4.0
[v4.3.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.3.0
[v4.2.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.2.1
[v4.2.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.2.0
[v4.1.3]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.1.3
[v4.1.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.1.2
[v4.1.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.1.1
[v4.1.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.1.0
[v4.0.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-4.0.0
[v3.10.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-3.10.0
[v3.9.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-3.9.1
[v3.9.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-3.9.0
[v3.8.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-3.8.0
[v3.7.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-3.7.0
[v3.6.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-3.6.2
[v3.6.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-3.6.1
[v3.6.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-3.6.0
[v3.5.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-3.5.0
[v3.4.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-3.4.2
[v3.4.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-3.4.1
[v3.4.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-3.4.0
[v3.3.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-3.3.0
[v3.2.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-3.2.0
[v3.1.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-3.1.0
[v3.0.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-3.0.2
[v3.0.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-3.0.1
[v3.0.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-3.0.0
[v2.7.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.7.1
[v2.7.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.7.0
[v2.6.9]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.6.9
[v2.6.8]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.6.8
[v2.6.7]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.6.7
[v2.6.6]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.6.6
[v2.6.5]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.6.5
[v2.6.4]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.6.4
[v2.6.3]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.6.3
[v2.6.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.6.2
[v2.6.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.6.1
[v2.6.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.6.0
[v2.5.3]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.5.3
[v2.5.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.5.2
[v2.5.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.5.1
[v2.5.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.5.0
[v2.4.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.4.0
[v2.3.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.3.1
[v2.3.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.3.0
[v2.2.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.2.0
[v2.1.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.1.2
[v2.1.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.1.1
[v2.1.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.1.0
[v2.0.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-2.0.0
[v1.2.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-1.2.1
[v1.2.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-1.2.0
[v1.1.3]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-1.1.3
[v1.1.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-1.1.2
[v1.1.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-1.1.1
[v1.1.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-1.1.0
[v1.0.5]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-1.0.5
[v1.0.4]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-1.0.4
[v1.0.3]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-1.0.3
[v1.0.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-1.0.2
[v1.0.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-1.0.1
[v1.0.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluentd-aggregator-1.0.0
