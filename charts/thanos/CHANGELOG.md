# Thanos Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- ## [UNRELEASED]
### Added
### Changed
### Deprecated
### Removed -->

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

- Fix rule rules configmap support.

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

- Fixed compact service statefulset service name.

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
