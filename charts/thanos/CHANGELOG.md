# Thanos Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- ## [UNRELEASED]
### Added
### Changed
### Deprecated
### Removed -->

## 0.10.0 2021-09-17

### Added

- Query ingress support to rule.

## 0.9.0 2021-09-01

### Changed

- Fix ingress.

## 0.8.0 2021-08-31

### Added

- Ingress support to the Query, Query Frontend & Rule components.

### Changed

- Use the `policy/v1` API for `PodDisruptionBudget` if the K8s version supports it.

## 0.7.0 2021-08-24

### Added

- [Rule](https://thanos.io/v0.22/components/rule.md/) component.
- Value `query.additionalStores` to enable custom Thanos stores to be configured for the query service.

### Changed

- Fixed compact service statefulset service name.

### Removed

- Values `query.sidecarService` & `query.rulerServcie`, use `query.additionalStores` instead.

## 0.6.0 2021-08-11

### Changed

- Fix volume claim labels.

## 0.5.0 2021-08-11

### Changed

- Fix query arguments.

## 0.4.0 2021-08-10

### Changed

- Fix service monitors.

## 0.3.0 2021-08-10

### Changed

- Fix compact.

## 0.2.0 2021-08-10

### Changed

- Change query config values.

## 0.1.0 2021-08-09

### Added

- Initial release based on [v0.22.0](https://github.com/thanos-io/thanos/releases/tag/v0.22.0).
