# Fluent Bit Aggregator Helm Chart Changelog

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

### Changed

- Update `jimmidyson/configmap-reload` OCI image from `0.14.0` to [`0.15.0`](https://github.com/jimmidyson/configmap-reload/releases/tag/v0.15.0). ([#1168](https://github.com/stevehipwell/helm-charts/pull/1168)) _@stevehipwell_

## [v0.16.10] - 2025-03-26

### Changed

- Update _Fluent Bit_ OCI image to [v3.2.10](https://github.com/fluent/fluent-bit/releases/tag/v3.2.10). ([#1157](https://github.com/stevehipwell/helm-charts/pull/1157)) _@stevehipwell_
- Change the OCI image repository to `ghcr.io/fluent/fluent-bit`. ([#1157](https://github.com/stevehipwell/helm-charts/pull/1157)) _@stevehipwell_

## [v0.16.9] - 2025-03-18

### Changed

- Updated _Fluent Bit_ OCI image to [v3.2.9](https://github.com/fluent/fluent-bit/releases/tag/v3.2.9). ([#1148](https://github.com/stevehipwell/helm-charts/pull/1148)) _@stevehipwell_

## [v0.16.8] - 2025-03-04

### Changed

- Updated _Fluent Bit_ OCI image to [v3.2.8](https://github.com/fluent/fluent-bit/releases/tag/v3.2.8). ([#1139](https://github.com/stevehipwell/helm-charts/pull/1139)) _@stevehipwell_

## [v0.16.7] - 2025-02-26

### Changed

- Updated _Fluent Bit_ OCI image to [v3.2.7](https://github.com/fluent/fluent-bit/releases/tag/v3.2.7). ([#1131](https://github.com/stevehipwell/helm-charts/pull/1131)) _@stevehipwell_

## [v0.16.6] - 2025-02-12

### Changed

- Updated _Fluent Bit_ OCI image to [v3.2.6](https://github.com/fluent/fluent-bit/releases/tag/v3.2.6). ([#1127](https://github.com/stevehipwell/helm-charts/pull/1127)) _@stevehipwell_

## [v0.16.5] - 2025-02-05

### Changed

- Updated _Fluent Bit_ OCI image to [v3.2.5](https://github.com/fluent/fluent-bit/releases/tag/v3.2.5). ([#1118](https://github.com/stevehipwell/helm-charts/pull/1118)) _@stevehipwell_

## [v0.16.4] - 2025-01-02

### Changed

- Updated _Fluent Bit_ OCI image to [v3.2.4](https://github.com/fluent/fluent-bit/releases/tag/v3.2.4). ([#1102](https://github.com/stevehipwell/helm-charts/pull/1102)) _@stevehipwell_

## [v0.16.3] - 2025-01-02

### Changed

- Updated _Fluent Bit_ OCI image to [v3.2.3](https://github.com/fluent/fluent-bit/releases/tag/v3.2.3). ([#1101](https://github.com/stevehipwell/helm-charts/pull/1101)) _@stevehipwell_

## [v0.16.2] - 2024-11-29

### Changed

- Updated _Fluent Bit_ OCI image to [v3.2.2](https://github.com/fluent/fluent-bit/releases/tag/v3.2.2). ([#1089](https://github.com/stevehipwell/helm-charts/pull/1089)) _@stevehipwell_

## [v0.16.1] - 2024-11-22

### Changed

- Updated hot-reload image to use `ghcr.io/jimmidyson/configmap-reload` as the _Chainguard_ image is no longer available. ([#1082](https://github.com/stevehipwell/helm-charts/pull/1082)) _@stevehipwell_

## [v0.16.0] - 2024-11-20

### Changed

- Updated _Fluent Bit_ OCI image to [v3.2.1](https://github.com/fluent/fluent-bit/releases/tag/v3.2.1). ([#1078](https://github.com/stevehipwell/helm-charts/pull/1078)) _@stevehipwell_

## [v0.15.10] - 2024-11-05

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.10](https://github.com/fluent/fluent-bit/releases/tag/v3.1.10). ([#1074](https://github.com/stevehipwell/helm-charts/pull/1074)) _@stevehipwell_

## [v0.15.9] - 2024-10-03

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.9](https://github.com/fluent/fluent-bit/releases/tag/v3.1.9).

## [v0.15.8] - 2024-10-03

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.8](https://github.com/fluent/fluent-bit/releases/tag/v3.1.8).

## [v0.15.7] - 2024-09-03

### Added

- Added deterministic _Grafana_ dashboard `uid` based on the chart namespace and fullname.

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.7](https://github.com/fluent/fluent-bit/releases/tag/v3.1.7).

## [v0.15.6] - 2024-08-15

### Added

- Added support for setting the `unhealthyPodEvictionPolicy` value for the `PodDisruptionBudget` via the `podDisruptionBudget.unhealthyPodEvictionPolicy` value on _Kubernetes_ `1.27` or higher clusters.
- Added support for setting the `trafficDistribution` value for the `Services` via the `service.trafficDistribution` value on _Kubernetes_ `1.31` or higher clusters.

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.6](https://github.com/fluent/fluent-bit/releases/tag/v3.1.6).

## [v0.15.5] - 2024-08-12

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.5](https://github.com/fluent/fluent-bit/releases/tag/v3.1.5).

## [v0.15.4] - 2024-07-26

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.4](https://github.com/fluent/fluent-bit/releases/tag/v3.1.4).

## [v0.15.3] - 2024-07-19

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.3](https://github.com/fluent/fluent-bit/releases/tag/v3.1.3).

## [v0.15.2] - 2024-07-12

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.2](https://github.com/fluent/fluent-bit/releases/tag/v3.1.2).

## [v0.15.1] - 2024-07-11

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.1](https://github.com/fluent/fluent-bit/releases/tag/v3.1.1).

## [v0.15.0] - 2024-07-09

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.0](https://github.com/fluent/fluent-bit/releases/tag/v3.1.0).

## [v0.14.7] - 2024-06-13

### Changed

- Updated _Fluent Bit_ OCI image to [v3.0.7](https://github.com/fluent/fluent-bit/releases/tag/v3.0.7).

## [v0.14.6] - 2024-05-30

### Changed

- Updated _Fluent Bit_ OCI image to [v3.0.6](https://github.com/fluent/fluent-bit/releases/tag/v3.0.6).

## [v0.14.5] - 2024-05-30

### Changed

- Updated _Fluent Bit_ OCI image to [v3.0.5](https://github.com/fluent/fluent-bit/releases/tag/v3.0.5).

## [v0.14.4] - 2024-05-23

### Changed

- Updated _Fluent Bit_ OCI image to [v3.0.4](https://github.com/fluent/fluent-bit/releases/tag/v3.0.4).

## [v0.14.3] - 2024-04-29

### Added

- Added support for setting the `servicePort` for ingress to the port name.

### Changed

- Updated _Fluent Bit_ OCI image to [v3.0.3](https://github.com/fluent/fluent-bit/releases/tag/v3.0.3).

## [v0.14.2] - 2024-04-12

### Changed

- Updated _Fluent Bit_ OCI image to [v3.0.2](https://github.com/fluent/fluent-bit/releases/tag/v3.0.2).

## [v0.14.1] - 2024-04-06

### Changed

- Updated _Fluent Bit_ OCI image to [v3.0.1](https://github.com/fluent/fluent-bit/releases/tag/v3.0.1).

## [v0.14.0] - 2024-04-02

### Changed

- Updated _Fluent Bit_ OCI image to [v3.0.0](https://github.com/fluent/fluent-bit/releases/tag/v3.0.0).

## [v0.13.0] - 2024-01-18

### Changed

- Updated _Fluent Bit_ OCI image to [v2.2.2](https://github.com/fluent/fluent-bit/releases/tag/v2.2.2).

## [v0.12.0] - 2024-01-05

### Changed

- Updated _Fluent Bit_ OCI image to [v2.2.1](https://github.com/fluent/fluent-bit/releases/tag/v2.2.1).
- Changed the `ServiceMonitor` to use [v2 metrics](https://docs.fluentbit.io/manual/administration/monitoring#for-v2-metrics).

## [v0.11.0] - 2023-11-13

### Changed

- Updated _Fluent Bit_ OCI image to [v2.2.0](https://github.com/fluent/fluent-bit/releases/tag/v2.2.0).
- Changed the default `configmap-reload` image variant to `cgr.dev/chainguard/configmap-reload:latest`.

### Fixed

- Fixed _Grafana_ dashboard data source logic.

## [v0.10.0] - 2023-10-03

### Changed

- Updated _Fluent Bit_ OCI image to [v2.1.10](https://github.com/fluent/fluent-bit/releases/tag/v2.1.10).

## [v0.9.0] - 2023-09-06

> [!WARNING]
> This release contains breaking changes, please make sure you read through the changes before upgrading.

### Added

- Added missing RBAC `ClusterRole` & `ClusterRoleBinding` to allow the _Kubernetes_ filter to work, these are off by default and controlled by `rbac.create` and made available by setting `serviceAccount.automountToken` to `true`.
- Added ability to add custom RBAC rules via `rbac.additionalRules`.
- Added restrictive security context to the `reloader` container.

### Changed

- Updated _Fluent Bit_ OCI image to [v2.1.9](https://github.com/fluent/fluent-bit/releases/tag/v2.1.9).
- Changed `config.storage` to `config.storage.enabled`.
- Changed storage metrics logic to use `config.storage.metrics`.

### Fixed

- Fixed _Fluent Bit_ not starting if storage was disabled.
- Fixed setting the image pull policy for the `reloader` container.

## [v0.8.0] - 2023-07-26

### Changed

- Updated _Fluent Bit_ OCI image to [v2.1.8](https://github.com/fluent/fluent-bit/releases/tag/v2.1.8).

## [v0.7.1] - 2023-07-14

### Added

- Added explicit command argument for the default container.

## [v0.7.0] - 2023-07-13

### Changed

- Updated _Fluent Bit_ OCI image to [v2.1.7](https://github.com/fluent/fluent-bit/releases/tag/v2.1.7).

## [v0.6.0] - 2023-06-23

### Changed

- Updated _Fluent Bit_ OCI image to [v2.1.6](https://github.com/fluent/fluent-bit/releases/tag/v2.1.6).

## [v0.5.1] - 2023-06-22

### Fixed

- Fixed dashboard.

## [v0.5.0] - 2023-06-20

### Changed

- Updated _Fluent Bit_ OCI image to [v2.1.5](https://github.com/fluent/fluent-bit/releases/tag/v2.1.5).

## [v0.4.0] - 2023-06-20

### Added

- Added Grafana dashboard.

### Removed

- Removed ability to customise `ServiceMonitor` job label.

### Fixed

- Fixed hot-reload not working correctly when scripts are enabled/disabled.

## [v0.3.5] - 2023-06-19

### Fixed

- Fixed script config for hot-reload.

## [v0.3.4] - 2023-06-16

### Fixed

- Fixed config.

## [v0.3.3] - 2023-06-16

### Fixed

- Fixed config mount to support hot-reload.

## [v0.3.2] - 2023-06-15

### Fixed

- Fixed hot-reload volume mounts.

## [v0.3.1] - 2023-06-15

### Fixed

- Fixed args when hot-reload is enabled.

## [v0.3.0] - 2023-06-13

### Added

- Added [hot-reload](https://docs.fluentbit.io/manual/administration/hot-reload) support.

## [v0.2.1] - 2023-06-05

### Fixed

- Fixed volume mount typo.
- Fixed missing fsGroup from pod security context.

## [v0.2.0] - 2023-06-05

### Added

- Added support for HPA behaviour.

## [v0.1.0] - 2023-05-30

### Added

- Added initial release.

<!--
RELEASE LINKS
-->
[UNRELEASED]: https://github.com/stevehipwell/helm-charts/tree/main/charts/fluent-bit-aggregator
[v0.16.10]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.16.10
[v0.16.9]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.16.9
[v0.16.8]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.16.8
[v0.16.7]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.16.7
[v0.16.6]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.16.6
[v0.16.5]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.16.5
[v0.16.4]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.16.4
[v0.16.3]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.16.3
[v0.16.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.16.2
[v0.16.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.16.1
[v0.16.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.16.0
[v0.15.10]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.15.10
[v0.15.9]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.15.9
[v0.15.8]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.15.8
[v0.15.7]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.15.7
[v0.15.6]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.15.6
[v0.15.5]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.15.5
[v0.15.4]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.15.4
[v0.15.3]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.15.3
[v0.15.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.15.2
[v0.15.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.15.1
[v0.15.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.15.0
[v0.14.7]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.14.7
[v0.14.6]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.14.6
[v0.14.5]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.14.5
[v0.14.4]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.14.4
[v0.14.3]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.14.3
[v0.14.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.14.2
[v0.14.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.14.1
[v0.14.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.14.0
[v0.13.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.13.0
[v0.12.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.12.0
[v0.11.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.11.0
[v0.10.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.10.0
[v0.9.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.9.0
[v0.8.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.8.0
[v0.7.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.7.1
[v0.7.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.7.0
[v0.6.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.6.0
[v0.5.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.5.1
[v0.5.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.5.0
[v0.4.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.4.0
[v0.3.5]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.3.5
[v0.3.4]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.3.4
[v0.3.3]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.3.3
[v0.3.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.3.2
[v0.3.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.3.1
[v0.3.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.3.0
[v0.2.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.2.1
[v0.2.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.2.0
[v0.1.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-aggregator-0.1.0
