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
