# Vertical Pod Autoscaler Helm Chart Changelog

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

## [v1.4.0] - 2023-10-31

### Changed

- Updated the _Vertical Pod Autoscaler_ OCI image version to [v1.0.0](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-1.0.0).

## [v1.3.0] - 2023-06-29

### Added

- Added a default `labelSelector` for the release pods to `topologySpreadConstraints`, `affinity.podAffinity` & `affinity.podAntiAffinity`.

### Changed

- Updated the _Vertical Pod Autoscaler_ OCI image version to [v0.14.0](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-0.14.0).

## [v1.2.0] - 2023-02-22

### All Changes

- Updated the _Vertical Pod Autoscaler_ image version to [v0.13.0](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-0.13.0).

## [v1.1.0] - 2023-02-22

### All Changes

- Updated the _Vertical Pod Autoscaler_ image version to [v0.12.0](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-0.12.0).

## [v1.0.0] - 2022-12-08

### All Changes

- Initial release.
