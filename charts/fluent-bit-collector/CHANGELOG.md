# Fluent Bit Collector Helm Chart Changelog

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

## [v0.17.3] - 2025-06-04

### Changed

- Update _Fluent Bit_ OCI image to [v4.0.3](https://github.com/fluent/fluent-bit/releases/tag/v4.0.3). ([#1197](https://github.com/stevehipwell/helm-charts/pull/1197)) _@stevehipwell_

## [v0.17.2] - 2025-05-15

### Added

- Add `CONFIG_PATH` & `SCRIPTS_PATH` env variables. ([#1183](https://github.com/stevehipwell/helm-charts/pull/1183)) _@stevehipwell_

### Changed

- Update _Fluent Bit_ OCI image to [v4.0.2](https://github.com/fluent/fluent-bit/releases/tag/v4.0.2). ([#1190](https://github.com/stevehipwell/helm-charts/pull/1190)) _@stevehipwell_

### Fixed

- Fix Grafana dashboard to use the correct default container name. ([#1182](https://github.com/stevehipwell/helm-charts/pull/1182)) _@stevehipwell_

## [v0.17.1] - 2025-04-30

### Changed

- Update _Fluent Bit_ OCI image to [v4.0.1](https://github.com/fluent/fluent-bit/releases/tag/v4.0.1). ([#1181](https://github.com/stevehipwell/helm-charts/pull/1181)) _@stevehipwell_

## [v0.17.0] - 2025-04-15

### Added

- Add additional port environment variables in the form `ADDITIONAL_PORT_<NAME>` (where the name has been made uppercase and `-` has been replace by `_`). ([#1175](https://github.com/stevehipwell/helm-charts/pull/1175)) _@stevehipwell_

### Fixed

- Fix `STORAGE_PATH` env variable to only be set when storage is enabled. ([#1175](https://github.com/stevehipwell/helm-charts/pull/1175)) _@stevehipwell_

## [v0.16.0] - 2025-04-15

### Added

- Add `STORAGE_PATH` env variable. ([#1174](https://github.com/stevehipwell/helm-charts/pull/1174)) _@stevehipwell_

## [v0.15.0] - 2025-04-15

### Added

- Add `config.storage.hostPath` value for configuring the storage path on the host. ([#1173](https://github.com/stevehipwell/helm-charts/pull/1173)) _@stevehipwell_

### Changed

- Change default `fsGroup` to `0` to match host volume ownership. ([#1173](https://github.com/stevehipwell/helm-charts/pull/1173)) _@stevehipwell_

### Removed

- Simplify example configuration by removing OTel & Systemd defaults. ([#1173](https://github.com/stevehipwell/helm-charts/pull/1173)) _@stevehipwell_

### Fixed

- Fix incorrect DB path in example configuration. ([#1173](https://github.com/stevehipwell/helm-charts/pull/1173)) _@stevehipwell_
- Fix incorrect check for storage being enabled. ([#1173](https://github.com/stevehipwell/helm-charts/pull/1173)) _@stevehipwell_
- Fix missing host mount types. ([#1173](https://github.com/stevehipwell/helm-charts/pull/1173)) _@stevehipwell_

## [v0.14.0] - 2025-04-10

### Added

- Add support for extra hot reload watch paths via the new `hotReload.extraWatchVolumes` value. ([#1169](https://github.com/stevehipwell/helm-charts/pull/1169)) _@stevehipwell_

### Changed

- Update _Fluent Bit_ OCI image to [v4.0.0](https://github.com/fluent/fluent-bit/releases/tag/v4.0.0). ([#1169](https://github.com/stevehipwell/helm-charts/pull/1169)) _@stevehipwell_
- Update `jimmidyson/configmap-reload` OCI image from `0.14.0` to [`0.15.0`](https://github.com/jimmidyson/configmap-reload/releases/tag/v0.15.0). ([#1168](https://github.com/stevehipwell/helm-charts/pull/1168)) _@stevehipwell_

## [v0.13.10] - 2025-03-26

### Changed

- Update _Fluent Bit_ OCI image to [v3.2.10](https://github.com/fluent/fluent-bit/releases/tag/v3.2.10). ([#1157](https://github.com/stevehipwell/helm-charts/pull/1157)) _@stevehipwell_
- Change the OCI image repository to `ghcr.io/fluent/fluent-bit`. ([#1157](https://github.com/stevehipwell/helm-charts/pull/1157)) _@stevehipwell_

## [v0.13.9] - 2025-03-18

### Changed

- Updated _Fluent Bit_ OCI image to [v3.2.9](https://github.com/fluent/fluent-bit/releases/tag/v3.2.9). ([#1148](https://github.com/stevehipwell/helm-charts/pull/1148)) _@stevehipwell_

## [v0.13.8] - 2025-03-04

### Changed

- Updated _Fluent Bit_ OCI image to [v3.2.8](https://github.com/fluent/fluent-bit/releases/tag/v3.2.8). ([#1139](https://github.com/stevehipwell/helm-charts/pull/1139)) _@stevehipwell_

## [v0.13.7] - 2025-02-26

### Changed

- Updated _Fluent Bit_ OCI image to [v3.2.7](https://github.com/fluent/fluent-bit/releases/tag/v3.2.7). ([#1131](https://github.com/stevehipwell/helm-charts/pull/1131)) _@stevehipwell_

## [v0.13.6] - 2025-02-12

### Changed

- Updated _Fluent Bit_ OCI image to [v3.2.6](https://github.com/fluent/fluent-bit/releases/tag/v3.2.6). ([#1127](https://github.com/stevehipwell/helm-charts/pull/1127)) _@stevehipwell_

## [v0.13.5] - 2025-02-05

### Changed

- Updated _Fluent Bit_ OCI image to [v3.2.5](https://github.com/fluent/fluent-bit/releases/tag/v3.2.5). ([#1118](https://github.com/stevehipwell/helm-charts/pull/1118)) _@stevehipwell_

## [v0.13.4] - 2025-01-02

### Changed

- Updated _Fluent Bit_ OCI image to [v3.2.4](https://github.com/fluent/fluent-bit/releases/tag/v3.2.4). ([#1102](https://github.com/stevehipwell/helm-charts/pull/1102)) _@stevehipwell_

## [v0.13.3] - 2025-01-02

### Changed

- Updated _Fluent Bit_ OCI image to [v3.2.3](https://github.com/fluent/fluent-bit/releases/tag/v3.2.3). ([#1101](https://github.com/stevehipwell/helm-charts/pull/1101)) _@stevehipwell_

## [v0.13.2] - 2024-11-29

### Changed

- Updated _Fluent Bit_ OCI image to [v3.2.2](https://github.com/fluent/fluent-bit/releases/tag/v3.2.2). ([#1089](https://github.com/stevehipwell/helm-charts/pull/1089)) _@stevehipwell_

## [v0.13.1] - 2024-11-22

### Changed

- Updated hot-reload image to use `ghcr.io/jimmidyson/configmap-reload` as the _Chainguard_ image is no longer available. ([#1082](https://github.com/stevehipwell/helm-charts/pull/1082)) _@stevehipwell_

## [v0.13.0] - 2024-11-20

### Changed

- Updated _Fluent Bit_ OCI image to [v3.2.1](https://github.com/fluent/fluent-bit/releases/tag/v3.2.1). ([#1078](https://github.com/stevehipwell/helm-charts/pull/1078)) _@stevehipwell_

## [v0.12.10] - 2024-11-05

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.10](https://github.com/fluent/fluent-bit/releases/tag/v3.1.10). ([#1074](https://github.com/stevehipwell/helm-charts/pull/1074)) _@stevehipwell_

## [v0.12.9] - 2024-10-03

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.9](https://github.com/fluent/fluent-bit/releases/tag/v3.1.9).

## [v0.12.8] - 2024-10-03

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.8](https://github.com/fluent/fluent-bit/releases/tag/v3.1.8).

## [v0.12.7] - 2024-09-03

### Added

- Added deterministic _Grafana_ dashboard `uid` based on the chart namespace and fullname.

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.7](https://github.com/fluent/fluent-bit/releases/tag/v3.1.7).

## [v0.12.6] - 2024-08-15

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.6](https://github.com/fluent/fluent-bit/releases/tag/v3.1.6).

## [v0.12.5] - 2024-08-12

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.5](https://github.com/fluent/fluent-bit/releases/tag/v3.1.5).

## [v0.12.4] - 2024-07-26

### Added

- Added access to `nodes/metrics` when `config.kubeletEndpoint.enabled` is set to true.

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.4](https://github.com/fluent/fluent-bit/releases/tag/v3.1.4).

## [v0.12.3] - 2024-07-19

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.3](https://github.com/fluent/fluent-bit/releases/tag/v3.1.3).

## [v0.12.2] - 2024-07-12

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.2](https://github.com/fluent/fluent-bit/releases/tag/v3.1.2).

## [v0.12.1] - 2024-07-11

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.1](https://github.com/fluent/fluent-bit/releases/tag/v3.1.1).

## [v0.12.0] - 2024-07-09

### Changed

- Updated _Fluent Bit_ OCI image to [v3.1.0](https://github.com/fluent/fluent-bit/releases/tag/v3.1.0).

## [v0.11.7] - 2024-06-13

### Changed

- Updated _Fluent Bit_ OCI image to [v3.0.7](https://github.com/fluent/fluent-bit/releases/tag/v3.0.7).

## [v0.11.6] - 2024-05-30

### Changed

- Updated _Fluent Bit_ OCI image to [v3.0.6](https://github.com/fluent/fluent-bit/releases/tag/v3.0.6).

## [v0.11.5] - 2024-05-30

### Changed

- Updated _Fluent Bit_ OCI image to [v3.0.5](https://github.com/fluent/fluent-bit/releases/tag/v3.0.5).

## [v0.11.4] - 2024-05-23

### Changed

- Updated _Fluent Bit_ OCI image to [v3.0.4](https://github.com/fluent/fluent-bit/releases/tag/v3.0.4).

## [v0.11.3] - 2024-04-29

### Changed

- Updated _Fluent Bit_ OCI image to [v3.0.3](https://github.com/fluent/fluent-bit/releases/tag/v3.0.3).

## [v0.11.2] - 2024-04-12

### Changed

- Updated _Fluent Bit_ OCI image to [v3.0.2](https://github.com/fluent/fluent-bit/releases/tag/v3.0.2).

## [v0.11.1] - 2024-04-05

### Changed

- Updated _Fluent Bit_ OCI image to [v3.0.1](https://github.com/fluent/fluent-bit/releases/tag/v3.0.1).

## [v0.11.0] - 2024-04-02

### Changed

- Updated _Fluent Bit_ OCI image to [v3.0.0](https://github.com/fluent/fluent-bit/releases/tag/v3.0.0).

## [v0.10.0] - 2024-01-18

### Changed

- Updated _Fluent Bit_ OCI image to [v2.2.2](https://github.com/fluent/fluent-bit/releases/tag/v2.2.2).

## [v0.9.0] - 2024-01-05

### Changed

- Updated _Fluent Bit_ OCI image to [v2.2.1](https://github.com/fluent/fluent-bit/releases/tag/v2.2.1).
- Changed the `ServiceMonitor` to use [v2 metrics](https://docs.fluentbit.io/manual/administration/monitoring#for-v2-metrics).

## [v0.8.0] - 2023-11-13

### Changed

- Updated _Fluent Bit_ OCI image to [v2.2.0](https://github.com/fluent/fluent-bit/releases/tag/v2.2.0).
- Changed the default `configmap-reload` image variant to `cgr.dev/chainguard/configmap-reload:latest`.

### Fixed

- Fixed _Grafana_ dashboard data source logic.

## [v0.7.0] - 2023-10-03

### Changed

- Updated _Fluent Bit_ OCI image to [v2.1.10](https://github.com/fluent/fluent-bit/releases/tag/v2.1.10).

## [v0.6.0] - 2023-09-06

### Added

- Added missing RBAC `ClusterRole` & `ClusterRoleBinding` to allow the _Kubernetes_ filter to work, these are on by default and controlled by `rbac.create`.
- Added ability to add custom RBAC rules via `rbac.additionalRules`.
- Added `NODE_IP` env variable to the `collector` container.
- Added restrictive security context to the `reloader` container.
- Added experimental support for using the _Kubelet_ endpoint for the Kubernetes filter via `config.kubeletEndpoint.enabled`.

### Changed

- Updated _Fluent Bit_ OCI image to [v2.1.9](https://github.com/fluent/fluent-bit/releases/tag/v2.1.9).
- Changed `config.storage` to `config.storage.enabled`.
- Changed storage metrics logic to use `config.storage.metrics`.

### Fixed

- Fixed incorrect security policy which would block accessing the host filesystem; the container must be run as root for this to work.
- Fixed host logs mount to work with the standard pattern of symlinked files; mounting all of `/var/log`.
- Fixed _Fluent Bit_ not starting if storage was disabled.
- Fixed setting the image pull policy for the `reloader` container.

## [v0.5.0] - 2023-07-26

### Changed

- Updated _Fluent Bit_ OCI image to [v2.1.8](https://github.com/fluent/fluent-bit/releases/tag/v2.1.8).

## [v0.4.2] - 2023-07-14

### Added

- Added explicit command argument for the default container.

### Fixed

- Fixed incorrect implementation in previous version.

## [v0.4.1] - 2023-07-14

### Added

- Added explicit command argument for the default container.

## [v0.4.0] - 2023-07-13

### Changed

- Updated _Fluent Bit_ OCI image to [v2.1.7](https://github.com/fluent/fluent-bit/releases/tag/v2.1.7).

## [v0.3.0] - 2023-06-23

### Changed

- Updated _Fluent Bit_ OCI image to [v2.1.6](https://github.com/fluent/fluent-bit/releases/tag/v2.1.6).

## [v0.2.0] - 2023-06-20

### Changed

- Updated _Fluent Bit_ OCI image to [v2.1.5](https://github.com/fluent/fluent-bit/releases/tag/v2.1.5).

## [v0.1.0] - 2023-06-20

### Added

- Added initial release.

<!--
RELEASE LINKS
-->
[UNRELEASED]: https://github.com/stevehipwell/helm-charts/tree/main/charts/fluent-bit-collector
[v0.17.3]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.17.3
[v0.17.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.17.2
[v0.17.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.17.1
[v0.17.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.17.0
[v0.16.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.16.0
[v0.15.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.15.0
[v0.14.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.14.0
[v0.13.10]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.13.10
[v0.13.9]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.13.9
[v0.13.8]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.13.8
[v0.13.7]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.13.7
[v0.13.6]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.13.6
[v0.13.5]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.13.5
[v0.13.4]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.13.4
[v0.13.3]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.13.3
[v0.13.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.13.2
[v0.13.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.13.1
[v0.13.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.13.0
[v0.12.10]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.12.10
[v0.12.9]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.12.9
[v0.12.8]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.12.8
[v0.12.7]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.12.7
[v0.12.6]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.12.6
[v0.12.5]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.12.5
[v0.12.4]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.12.4
[v0.12.3]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.12.3
[v0.12.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.12.2
[v0.12.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.12.1
[v0.12.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.12.0
[v0.11.7]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.11.7
[v0.11.6]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.11.6
[v0.11.5]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.11.5
[v0.11.4]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.11.4
[v0.11.3]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.11.3
[v0.11.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.11.2
[v0.11.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.11.1
[v0.11.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.11.0
[v0.10.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.10.0
[v0.9.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.9.0
[v0.8.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.8.0
[v0.7.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.7.0
[v0.6.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.6.0
[v0.5.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.5.0
[v0.4.2]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.4.2
[v0.4.1]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.4.1
[v0.4.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.4.0
[v0.3.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.3.0
[v0.2.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.2.0
[v0.1.0]: https://github.com/stevehipwell/helm-charts/releases/tag/fluent-bit-collector-0.1.0
