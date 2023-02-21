# Thanos Helm Chart Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

<!-- ## [vX.Y.Z] - UNRELEASED
### Highlights
### All Changes
- Added
- Updated
- Changed
- Fixed
- Deprecated
- Removed -->

## [v1.11.0] - 2023-02-22

### All Changes

- Added support for [Thanos Receive](https://thanos.io/tip/components/receive.md/).
- Added top level `additionalEndpoints` value to replace `query.additionalStores`.
- Added top level `additionalReplicaLabels` value to replace `query.replicaLabels`.
- Added support for `topologySpreadConstraints`.
- Changed implementation to use `--endpoint` instead of store `--store`.
- Fixed missing Query replica label arguments.
- Fixed missing Rule replica label drop arguments.
- Deprecated `query.additionalStores`.
- Deprecated `query.replicaLabels`.
- Removed non-headless services where there is a headless service present.

## [v1.10.2] - 2023-02-01

### All Changes

- Updated the _Thanos_ image to [v0.30.2](https://github.com/thanos-io/thanos/releases/tag/v0.30.2).

## [v1.10.1] - 2023-01-05

### All Changes

- Updated the _Thanos_ image to [v0.30.1](https://github.com/thanos-io/thanos/releases/tag/v0.30.1).

## [v1.10.0] - 2023-01-03

### All Changes

- Updated the _Thanos_ image to [v0.30.0](https://github.com/thanos-io/thanos/releases/tag/v0.30.0).

## [v1.9.1] - 2022-12-18

### All Changes

- Fixed incorrect `HorizontalPodAutoscaler` API version for K8s versions lower than `v1.23`.
- Fixed incorrect `PodDisruptionBudget` API version for K8s versions lower than `v1.21`.

## [v1.9.0] - 2022-12-02

### All Changes

- Changed `HorizontalPodAutoscaler` API version to `autoscaling/v2beta2` for K8s versions lower than `v1.23`.
- Fixed incorrect `HorizontalPodAutoscaler` implementation for `autoscaling/v2` API version.

## [v1.8.0] - 2022-12-02

### All Changes

- Added support for annotating the services.
- Fixed incorrect `HorizontalPodAutoscaler` API version; this will now be `autoscaling/v2` from K8s `v1.23` upwards.

## [v1.7.0] - 2022-11-03

### All Changes

- Updated the _Thanos_ image to [v0.29.0](https://github.com/thanos-io/thanos/releases/tag/v0.29.0).

## [v1.6.2] - 2022-10-24

### All Changes

- Added new `compact.serviceAccount.labels`, `query.serviceAccount.labels`, `queryFrontend.serviceAccount.labels`, `rule.serviceAccount.labels` & `storeGateway.serviceAccount.labels` values to add labels to the `ServiceAccount` resources.

## [v1.6.1] - 2022-10-07

### All Changes

- Updated the _Thanos_ image to [v0.28.1](https://github.com/thanos-io/thanos/releases/tag/v0.28.1).

## [v1.6.0] - 2022-08-31

### Changed

- Updated _Thanos_ image to [v0.28.0](https://github.com/thanos-io/thanos/releases/tag/v0.28.0).

## [v1.5.0] - 2022-06-07

### Added

- Added `serviceAccount.automountToken` to all components to default token binding to `false`.
- Added explicit namespace declaration in templates.

### Changed

- Update _Thanos_ image to [v0.27.0](https://github.com/thanos-io/thanos/releases/tag/v0.27.0).

## [v1.4.0] - 2022-05-09

### Added

- Added `commonLabels` to allow the addition of labels to all resources.

### Changed

- Update _Thanos_ image to [v0.26.0](https://github.com/thanos-io/thanos/releases/tag/v0.26.0).

## [v1.3.2] - 2022-03-24

### Changed

- Update _Thanos_ image to [v0.25.2](https://github.com/thanos-io/thanos/releases/tag/v0.25.2).

## [v1.3.1] - 2022-03-10

### Changed

- Update _Thanos_ image to [v0.25.1](https://github.com/thanos-io/thanos/releases/tag/v0.25.1).

## [v1.3.0] - 2022-03-07

### Added

- Added `serviceMonitor.endpointConfig` to allow customisation of the `ServiceMonitor` endpoint.

### Changed

- Update _Thanos_ image to [v0.25.0](https://github.com/thanos-io/thanos/releases/tag/v0.25.0).

### Deprecated

- Deprecated `serviceMonitor.interval` in favour of `serviceMonitor.endpointConfig.interval`.

### Removed

- Removed chart default for `serviceMonitor.interval`, the interval should be the _Prometheus_ default if not overridden.

## [v1.2.0] - 2022-01-04

### Changed

- Update _Thanos_ image to [v0.24.0](https://github.com/thanos-io/thanos/releases/tag/v0.24.0).

## [v1.1.2] - 2021-12-27

### Changed

- Update _Thanos_ image to [v0.23.2](https://github.com/thanos-io/thanos/releases/tag/v0.23.2).

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
