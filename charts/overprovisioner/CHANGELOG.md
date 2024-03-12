# Overprovisioner Helm Chart Changelog

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

- Updating `spec.template.spec.containers.resources` to be object map to support multiple resource types.


## [v0.3.0] - 2024-01-17

### Changed

- Updated the _cluster-proportional-autoscaler_ OCI image version to [v1.8.9](https://github.com/kubernetes-sigs/cluster-proportional-autoscaler/releases/tag/v1.8.9).
- Changed the default `podSecurityContext` & `securityContext` values for all components.

## [v0.2.0] - 2023-03-09

### Added

- Added support for automatic scaling using the cluster proportional autoscaler.

### Changed

- Changed how the pause pod capacity works; use the new `capacity` values.

## [v0.1.1] - 2023-01-19

### Fixed

- Fixed security context configuration.

## [v0.1.0] - 2023-01-17

### Added

- Initial release.

<!--
RELEASE LINKS
-->
[UNRELEASED]: https://github.com/stevehipwell/helm-charts/tree/main/charts/overprovisioner
[v0.3.0]: https://github.com/stevehipwell/helm-charts/releases/tag/overprovisioner-0.3.0
[v0.2.0]: https://github.com/stevehipwell/helm-charts/releases/tag/overprovisioner-0.2.0
[v0.1.1]: https://github.com/stevehipwell/helm-charts/releases/tag/overprovisioner-0.1.1
[v0.1.0]: https://github.com/stevehipwell/helm-charts/releases/tag/overprovisioner-0.1.0
