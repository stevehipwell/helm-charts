# Fluent Bit Collector Helm Chart Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

<!--
## [UNRELEASED]

### Added - For new features.
### Changed - For changes in existing functionality.
### Deprecated - For soon-to-be removed features.
### Removed - For now removed features.
### Fixed - For any bug fixes.
### Security - In case of vulnerabilities.
-->

## [UNRELEASED]

### Changed

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
