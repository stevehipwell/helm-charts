# Node Config Helm Chart Changelog

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

## [v0.7.0] - 2025-10-07

### Changed

- Update the _registry.k8s.io/pause_ OCI image version to `3.10.1`. ([#1226](https://github.com/stevehipwell/helm-charts/pull/1226)) _@stevehipwell_
- Explicitly set non-root run as user and group for pause container. ([#1268](https://github.com/stevehipwell/helm-charts/pull/1268)) _@stevehipwell_

## [v0.6.0] - 2024-06-24

### Added

- Added `rbac.create` & `rbac.rules` to configure a `ClusterRole` for the `ServiceAccount`.

### Changed

- Updated the `registry.k8s.io/pause` image to `3.10`.

## [v0.5.0] - 2023-05-22

### Added

- Added `affinity.nodeAffinity`.

## [v0.4.1] - 2023-05-15

### Fixed

- Fixed volume bug.

## [v0.4.0] - 2023-05-12

### Added

- Added support for host PID.

## [v0.3.0] - 2023-05-12

### Added

- Added a checksum for the script content.

## [v0.2.1] - 2023-05-12

### Fixed

- Fixed script mount logic.

## [v0.2.0] - 2023-05-11

### Added

- Added support for attaching additional volumes to the config container via `extraVolumes` & `config.extraVolumeMounts`.

## [v0.1.0] - 2023-05-09

### Added

- Initial release.

<!--
RELEASE LINKS
-->
[UNRELEASED]: https://github.com/stevehipwell/helm-charts/tree/main/charts/node-config
[v0.7.0]: https://github.com/stevehipwell/helm-charts/releases/tag/node-config-0.7.0
[v0.6.0]: https://github.com/stevehipwell/helm-charts/releases/tag/node-config-0.6.0
[v0.5.0]: https://github.com/stevehipwell/helm-charts/releases/tag/node-config-0.5.0
[v0.4.1]: https://github.com/stevehipwell/helm-charts/releases/tag/node-config-0.4.1
[v0.4.0]: https://github.com/stevehipwell/helm-charts/releases/tag/node-config-0.4.0
[v0.3.0]: https://github.com/stevehipwell/helm-charts/releases/tag/node-config-0.3.0
[v0.2.1]: https://github.com/stevehipwell/helm-charts/releases/tag/node-config-0.2.1
[v0.2.0]: https://github.com/stevehipwell/helm-charts/releases/tag/node-config-0.2.0
[v0.1.0]: https://github.com/stevehipwell/helm-charts/releases/tag/node-config-0.1.0
