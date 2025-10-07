# Vertical Pod Autoscaler Helm Chart Changelog

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

## [v1.10.1] - 2025-10-07

### Changed

- Update the _Vertical Pod Autoscaler_ OCI image version to [`v1.5.1`](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-1.5.1). ([#1270](https://github.com/stevehipwell/helm-charts/pull/1270)) _@stevehipwell_

## [v1.10.0] - 2025-09-23

### Changed

- Update the _Vertical Pod Autoscaler_ OCI image version to [`v1.5.0`](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-1.5.0). ([#1260](https://github.com/stevehipwell/helm-charts/pull/1260)) _@stevehipwell_

## [v1.9.3] - 2025-09-04

### Changed

- Update the _Vertical Pod Autoscaler_ OCI image version to [`v1.4.2`](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-1.4.2). ([#1245](https://github.com/stevehipwell/helm-charts/pull/1245)) _@stevehipwell_

## [v1.9.2] - 2025-07-10

### Fixed

- Fix incorrect `verticalpodautoscalers.autoscaling.k8s.io` CRD where the `InPlaceOrRecreate` option  was added to `v1beta2` instead of `v1`. ([#1207](https://github.com/stevehipwell/helm-charts/pull/1207)) _@stevehipwell_

## [v1.9.1] - 2025-06-11

### Changed

- Update the _Vertical Pod Autoscaler_ OCI image version to [`v1.4.1`](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-1.4.1). ([#1201](https://github.com/stevehipwell/helm-charts/pull/1201)) _@stevehipwell_

## [v1.9.0] - 2025-05-28

### Changed

- Update the _Vertical Pod Autoscaler_ OCI image version to [`v1.4.0`](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-1.4.0). ([#1194](https://github.com/stevehipwell/helm-charts/pull/1194)) _@stevehipwell_

## [v1.8.2] - 2025-05-02

### Changed

- Update the _Vertical Pod Autoscaler_ OCI image version to [`v1.3.1`](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-1.3.1). ([#1184](https://github.com/stevehipwell/helm-charts/pull/1184)) _@stevehipwell_

## [v1.8.1] - 2025-03-10

### Fixed

- Fixed the name of the secret mounted for TLS certificates when using a custom Issuer with cert-manager. ([#1140](https://github.com/stevehipwell/helm-charts/issues/1140)) _@ahamlinman_

## [v1.8.0] - 2025-02-14

### Added

- Added support for changing the name of the leader election resource for the _Recommender_ & _Updater_ components via the `recommender.leaderElect.name` & `updater.leaderElect.name` values. If you're running VPA on GKE you will need to set `recommender.leaderElect.name` to an alternative value due to conflicts it creates with the built-in HPA/VPA deployment in GKE. ([#1128](https://github.com/stevehipwell/helm-charts/pull/1128)) _@stevehipwell_

### Changed

- Updated the _Vertical Pod Autoscaler_ OCI image version to [`v1.3.0`](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-1.3.0). ([#1128](https://github.com/stevehipwell/helm-charts/pull/1128)) _@stevehipwell_

## [v1.7.3] - 2025-01-17

### Changed

- Updated the _Vertical Pod Autoscaler_ OCI image version to [v1.2.2](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-1.2.2). ([#1112](https://github.com/stevehipwell/helm-charts/pull/1112)) _@stevehipwell_

## [v1.7.2] - 2025-01-14

### Fixed

- Fixed incorrect cert-manager ca-injection target in mutatingwebhookconfiguration. ([#1106](https://github.com/stevehipwell/helm-charts/pull/1106)) _@PaulFarver_

## [v1.7.1] - 2024-08-22

### Added

- Added support for setting the `unhealthyPodEvictionPolicy` value for the `PodDisruptionBudget` via the `<component>.podDisruptionBudget.unhealthyPodEvictionPolicy` value on _Kubernetes_ `1.27` or higher clusters.

### Changed

- Updated the _Vertical Pod Autoscaler_ OCI image version to [v1.2.1](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-1.2.1).

## [v1.7.0] - 2024-08-12

### Added

- Added behavior to use leader election when multiple recommender or updater replicas are created.

### Changed

- Updated the _Vertical Pod Autoscaler_ OCI image version to [v1.2.0](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-1.2.0).

## [v1.6.2] - 2024-05-17

### Changed

- Updated the _Vertical Pod Autoscaler_ OCI image version to [v1.1.2](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-1.1.2).

## [v1.6.1] - 2024-04-26

### Changed

- Updated the _Vertical Pod Autoscaler_ OCI image version to [v1.1.1](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-1.1.1).

### Fixed

- Fixed incorrect `ServiceMonitor` name via the `jobLabel` field.

## [v1.6.0] - 2024-04-11

### Changed

- Updated the _Vertical Pod Autoscaler_ OCI image version to [v1.1.0](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-1.1.0).

## [v1.5.0] - 2024-02-12

### Added

- Added `recommenderOnly` value to allow for deployment of only the [VPA Recommender](https://github.com/kubernetes/autoscaler/blob/master/vertical-pod-autoscaler/pkg/recommender/README.md).

### Changed

- Changed the default `podSecurityContext` & `securityContext` values for all components.

## [v1.4.0] - 2023-10-31

### Changed

- Updated the _Vertical Pod Autoscaler_ OCI image version to [v1.0.0](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-1.0.0).

## [v1.3.0] - 2023-06-29

### Added

- Added a default `labelSelector` for the release pods to `topologySpreadConstraints`, `affinity.podAffinity` & `affinity.podAntiAffinity`.

### Changed

- Updated the _Vertical Pod Autoscaler_ OCI image version to [v0.14.0](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-0.14.0).

## [v1.2.0] - 2023-02-22

### Changed

- Updated the _Vertical Pod Autoscaler_ image version to [v0.13.0](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-0.13.0).

## [v1.1.0] - 2023-02-22

### Changed

- Updated the _Vertical Pod Autoscaler_ image version to [v0.12.0](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-0.12.0).

## [v1.0.0] - 2022-12-08

### Added

- Initial release.

<!--
RELEASE LINKS
-->
[UNRELEASED]: https://github.com/stevehipwell/helm-charts/tree/main/charts/vertical-pod-autoscaler
[v1.10.1]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.10.1
[v1.10.0]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.10.0
[v1.9.3]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.9.3
[v1.9.2]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.9.2
[v1.9.1]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.9.1
[v1.9.0]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.9.0
[v1.8.2]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.8.2
[v1.8.1]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.8.1
[v1.8.0]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.8.0
[v1.7.3]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.7.3
[v1.7.2]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.7.2
[v1.7.1]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.7.1
[v1.7.0]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.7.0
[v1.6.2]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.6.2
[v1.6.1]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.6.1
[v1.6.0]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.6.0
[v1.5.0]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.5.0
[v1.4.0]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.4.0
[v1.3.0]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.3.0
[v1.2.0]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.2.0
[v1.1.0]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.1.0
[v1.0.0]: https://github.com/stevehipwell/helm-charts/releases/tag/vertical-pod-autoscaler-1.0.0
