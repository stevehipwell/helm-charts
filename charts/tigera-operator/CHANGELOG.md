# Tigera Operator Helm Chart Changelog

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

## [v2.12.5] - 2025-09-01

### Changed

- Update the _Tigera Operator_ OCI image to [v1.38.6](https://github.com/tigera/operator/releases/tag/v1.38.6) (_Calico_ [v3.30.3](https://github.com/projectcalico/calico/releases/tag/v3.30.3 )). ([#1242](https://github.com/stevehipwell/helm-charts/pull/1242)) _@stevehipwell_

## [v2.12.4] - 2025-08-11

### Changed

- Update the _Tigera Operator_ OCI image to [v1.38.5](https://github.com/tigera/operator/releases/tag/v1.38.5) (_Calico_ [v3.30.2](https://github.com/projectcalico/calico/releases/tag/v3.30.2)). ([#1228](https://github.com/stevehipwell/helm-charts/pull/1228)) _@stevehipwell_

## [v2.12.3] - 2025-07-16

### Changed

- Update the _Tigera Operator_ OCI image to [v1.38.4](https://github.com/tigera/operator/releases/tag/v1.38.4) (_Calico_ [v3.30.2](https://github.com/projectcalico/calico/releases/tag/v3.30.2)). ([#1218](https://github.com/stevehipwell/helm-charts/pull/1218)) _@stevehipwell_

## [v2.12.2] - 2025-07-15

### Added

- Add support for managing CRDs via the `manageCRDs` value. ([#1212](https://github.com/stevehipwell/helm-charts/pull/1212)) _@stevehipwell_

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.38.3](https://github.com/tigera/operator/releases/tag/v1.38.3) (_Calico_ [v3.30.2](https://github.com/projectcalico/calico/releases/tag/v3.30.2)). ([#1212](https://github.com/stevehipwell/helm-charts/pull/1212)) _@stevehipwell_

## [v2.12.1] - 2025-06-10

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.38.1](https://github.com/tigera/operator/releases/tag/v1.38.1) (_Calico_ [v3.30.1](https://github.com/projectcalico/calico/releases/tag/v3.30.1)). ([#1200](https://github.com/stevehipwell/helm-charts/pull/1200)) _@stevehipwell_

### Fixed

- Fixed `ClusterRole` so CRs can be deleted by the operator. ([#1200](https://github.com/stevehipwell/helm-charts/pull/1200)) _@stevehipwell_

## [v2.12.0] - 2025-05-07

### Added

- Add support for configuring [flow logs](https://docs.tigera.io/calico/latest/observability/view-flow-logs#about-flow-logs-in-calico-open-source) using Goldmane & Whisker via the `goldmane.enable=true` & `whisker.enable=true` values. ([#1185](https://github.com/stevehipwell/helm-charts/pull/1185)) _@stevehipwell_

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.38.0](https://github.com/tigera/operator/releases/tag/v1.38.0) (_Calico_ [v3.30.0](https://github.com/projectcalico/calico/releases/tag/v3.30.0)). ([#1185](https://github.com/stevehipwell/helm-charts/pull/1185)) _@stevehipwell_

## [v2.11.6] - 2025-03-27

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.36.7](https://github.com/tigera/operator/releases/tag/v1.36.7) (_Calico_ [v3.29.3](https://github.com/projectcalico/calico/releases/tag/v3.29.3)). ([#1159](https://github.com/stevehipwell/helm-charts/pull/1159)) _@stevehipwell_

## [v2.11.5] - 2025-02-07

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.36.5](https://github.com/tigera/operator/releases/tag/v1.36.5) (_Calico_ [v3.29.2](https://github.com/projectcalico/calico/releases/tag/v3.29.2)). ([#1124](https://github.com/stevehipwell/helm-charts/pull/1124)) _@stevehipwell_

## [v2.11.4] - 2025-02-05

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.36.4](https://github.com/tigera/operator/releases/tag/v1.36.4) (_Calico_ [v3.29.1](https://github.com/projectcalico/calico/releases/tag/v3.29.1)). ([#1120](https://github.com/stevehipwell/helm-charts/pull/1120)) _@stevehipwell_

## [v2.11.3] - 2024-11-27

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.36.3](https://github.com/tigera/operator/releases/tag/v1.36.3) (_Calico_ [v3.29.1](https://github.com/projectcalico/calico/releases/tag/v3.29.1)). ([#1088](https://github.com/stevehipwell/helm-charts/pull/1088)) _@stevehipwell_

## [v2.11.2] - 2024-11-21

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.36.2](https://github.com/tigera/operator/releases/tag/v1.36.2) (_Calico_ [v3.29.1](https://github.com/projectcalico/calico/releases/tag/v3.29.1)). _@stevehipwell_

## [v2.11.1] - 2024-11-06

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.36.1](https://github.com/tigera/operator/releases/tag/v1.36.1) (_Calico_ [v3.29.0](https://github.com/projectcalico/calico/releases/tag/v3.29.0)). _@stevehipwell_

## [v2.11.0] - 2024-10-29

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.36.0](https://github.com/tigera/operator/releases/tag/v1.36.0) (_Calico_ [v3.29.0](https://github.com/projectcalico/calico/releases/tag/v3.29.0)). _@stevehipwell_

## [v2.10.6] - 2024-10-04

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.34.5](https://github.com/tigera/operator/releases/tag/v1.34.5) (_Calico_ [v3.28.2](https://github.com/projectcalico/calico/releases/tag/v3.28.2)). _@stevehipwell_

## [v2.10.5] - 2024-09-05

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.34.4](https://github.com/tigera/operator/releases/tag/v1.34.4) (_Calico_ [v3.28.1](https://github.com/projectcalico/calico/releases/tag/v3.28.1)).

## [v2.10.4] - 2024-08-01

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.34.3](https://github.com/tigera/operator/releases/tag/v1.34.3) (_Calico_ [v3.28.1](https://github.com/projectcalico/calico/releases/tag/v3.28.1)).

## [v2.10.3] - 2024-07-26

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.34.2](https://github.com/tigera/operator/releases/tag/v1.34.2) (_Calico_ [v3.28.0](https://github.com/projectcalico/calico/releases/tag/v3.28.0)).

## [v2.10.2] - 2024-06-24

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.34.1](https://github.com/tigera/operator/releases/tag/v1.34.1) (_Calico_ [v3.28.0](https://github.com/projectcalico/calico/releases/tag/v3.28.0)).

## [v2.10.1] - 2024-06-07

### Fixed

- Fixed missing rules for `ippools` in the `crd.projectcalico.org` API group.

## [v2.10.0] - 2024-05-13

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.34.0](https://github.com/tigera/operator/releases/tag/v1.34.0) (_Calico_ [v3.28.0](https://github.com/projectcalico/calico/releases/tag/v3.28.0)).

### Removed

- Removed unnecessary permissions for removed PSP resources.

### Fixed

- Fixed incorrect `ServiceMonitor` name via the `jobLabel` field.

## [v2.9.3] - 2024-03-02

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.32.7](https://github.com/tigera/operator/releases/tag/v1.32.7) (_Calico_ [v3.27.3](https://github.com/projectcalico/calico/releases/tag/v3.27.3)).

## [v2.9.2] - 2024-02-20

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.32.5](https://github.com/tigera/operator/releases/tag/v1.32.5) (_Calico_ [v3.27.2](https://github.com/projectcalico/calico/releases/tag/v3.27.2)).

## [v2.9.1] - 2024-01-19

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.32.4](https://github.com/tigera/operator/releases/tag/v1.32.4) (_Calico_ [v3.27.0](https://github.com/projectcalico/calico/releases/tag/v3.27.0)).

## [v2.9.0] - 2024-01-05

### Added

- Added an uninstall job to make sure that _Tigera Operator_ can be uninstalled. This is on by default but can be disabled by setting `uninstall.enabled` to `true`.

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.32.3](https://github.com/tigera/operator/releases/tag/v1.32.3) (_Calico_ [v3.27.0](https://github.com/projectcalico/calico/releases/tag/v3.27.0)).

## [v2.8.1] - 2023-11-21

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.30.9](https://github.com/tigera/operator/releases/tag/v1.30.9) (_Calico_ [v3.26.4](https://github.com/projectcalico/calico/releases/tag/v3.26.4)).

## [v2.8.0] - 2023-10-20

> [!IMPORTANT]
> This release upgrades the _Tigera Operator_ version to the recommended newer but lower versioned `v1.30` release.

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.30.7](https://github.com/tigera/operator/releases/tag/v1.30.7) (_Calico_ [v3.26.3](https://github.com/projectcalico/calico/releases/tag/v3.26.3)).

## [v2.7.1] - 2023-09-04

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.31.1](https://github.com/tigera/operator/releases/tag/v1.31.1) (_Calico_ [v3.26.1](https://github.com/projectcalico/calico/releases/tag/v3.26.1)).

## [v2.7.0] - 2023-09-01

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.31.0](https://github.com/tigera/operator/releases/tag/v1.31.0) (_Calico_ [v3.26.1](https://github.com/projectcalico/calico/releases/tag/v3.26.1)).

## [v2.6.5] - 2023-08-07

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.30.5](https://github.com/tigera/operator/releases/tag/v1.30.5) (_Calico_ [v3.26.1](https://github.com/projectcalico/calico/releases/tag/v3.26.1)).

## [v2.6.4] - 2023-07-25

### Fixed

- Fixed incorrect formatting of `bgpconfigurations.crd.projectcalico.org` CRD.

## [v2.6.3] - 2023-06-20

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.30.4](https://github.com/tigera/operator/releases/tag/v1.30.4) (_Calico_ [v3.26.1](https://github.com/projectcalico/calico/releases/tag/v3.26.1)).

## [v2.6.2] - 2023-06-15

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.30.3](https://github.com/tigera/operator/releases/tag/v1.30.3) (_Calico_ [v3.26.0](https://github.com/projectcalico/calico/releases/tag/v3.26.0)).

## [v2.6.1] - 2023-06-06

### Added

- Added support for custom args via the `args` value.

## [v2.6.0] - 2023-05-30

### Changed

- Updated the _Tigera Operator_ OCI image to [v1.30.2](https://github.com/tigera/operator/releases/tag/v1.30.2) (_Calico_ [v3.26.0](https://github.com/projectcalico/calico/releases/tag/v3.26.0)).

## [v2.5.1] - 2023-04-11

### All Changes

- Updated the _Tigera Operator_ image to [v1.29.4](https://github.com/tigera/operator/releases/tag/v1.29.4) (_Calico_ [v3.25.1](https://github.com/projectcalico/calico/releases/tag/v3.25.1)).

## [v2.5.0] - 2023-03-31

### All Changes

- Updated the _Tigera Operator_ image to [v1.29.3](https://github.com/tigera/operator/releases/tag/v1.29.3) (_Calico_ [v3.25.1](https://github.com/projectcalico/calico/releases/tag/v3.25.1)).
- Added explicit namespace declaration in templates.
- Added support for `topologySpreadConstraints` with a default `labelSelector` for the release pods.
- Added a default `labelSelector` for the release pods to `affinity.podAffinity` & `affinity.podAntiAffinity`.

## [v2.4.1] - 2023-02-15

### All Changes

- Updated the _Tigera Operator_ image to [v1.29.1](https://github.com/tigera/operator/releases/tag/v1.29.1) (_Calico_ [v3.25.0](https://github.com/projectcalico/calico/releases/tag/v3.25.0)).

## [v2.4.0] - 2023-01-13

### All Changes

- Updated the _Tigera Operator_ image to [v1.29.0](https://github.com/tigera/operator/releases/tag/v1.29.0) (_Calico_ [v3.25.0](https://github.com/projectcalico/calico/releases/tag/v3.25.0)).

## [v2.3.7] - 2023-01-10

### All Changes

- Updated the _Tigera Operator_ image to [v1.28.8](https://github.com/tigera/operator/releases/tag/v1.28.8) (_Calico_ [v3.24.5](https://github.com/projectcalico/calico/releases/tag/v3.24.5)).

## [v2.3.6] - 2022-12-01

### All Changes

- Updated the _Tigera Operator_ image to [v1.28.7](https://github.com/tigera/operator/releases/tag/v1.28.7) (_Calico_ [v3.24.5](https://github.com/projectcalico/calico/releases/tag/v3.24.5)).

## [v2.3.5] - 2022-11-25

### All Changes

- Updated the _Tigera Operator_ image to [v1.28.6](https://github.com/tigera/operator/releases/tag/v1.28.6) (_Calico_ [v3.24.5](https://github.com/projectcalico/calico/releases/tag/v3.24.5)).

## [v2.3.4] - 2022-11-08

### All Changes

- Updated the _Tigera Operator_ image to [v1.28.5](https://github.com/tigera/operator/releases/tag/v1.28.5) (_Calico_ [v3.24.5](https://github.com/projectcalico/calico/releases/tag/v3.24.5)).

## [v2.3.3] - 2022-11-03

### All Changes

- Updated the _Tigera Operator_ image to [v1.28.4](https://github.com/tigera/operator/releases/tag/v1.28.4) (_Calico_ [v3.24.4](https://github.com/projectcalico/calico/releases/tag/v3.24.4)).

## [v2.3.2] - 2022-10-24

### All Changes

- Updated the _Tigera Operator_ image to [v1.28.3](https://github.com/tigera/operator/releases/tag/v1.28.3) (_Calico_ [v3.24.3](https://github.com/projectcalico/calico/releases/tag/v3.24.3)).
- Added a new `serviceAccount.labels` value to add labels to the `ServiceAccount`.

## [v2.3.1] - 2022-08-31

### Changed

- Update _Tigera Operator_ image to [v1.28.1](https://github.com/tigera/operator/releases/tag/v1.28.1) (_Calico_ [v3.24.1](https://github.com/projectcalico/calico/releases/tag/v3.24.1)).

## [v2.3.0] - 2022-08-22

### Changed

- Update _Tigera Operator_ image to [v1.28.0](https://github.com/tigera/operator/releases/tag/v1.28.0) (_Calico_ [v3.24.0](https://github.com/projectcalico/calico/releases/tag/v3.24.0)).
- Explicitly set node selector to `kubernetes.io/os: linux`.

## [v2.2.8] - 2022-07-20

### Changed

- Update _Tigera Operator_ image to [v1.27.12](https://github.com/tigera/operator/releases/tag/v1.27.12) (_Calico_ [v3.23.2](https://github.com/projectcalico/calico/releases/tag/v3.23.3)).

## [v2.2.7] - 2022-07-07

### Changed

- Update _Tigera Operator_ image to [v1.27.11](https://github.com/tigera/operator/releases/tag/v1.27.11) (_Calico_ [v3.23.2](https://github.com/projectcalico/calico/releases/tag/v3.23.2)).

## [v2.2.6] - 2022-07-04

### Changed

- Update _Tigera Operator_ image to [v1.27.10](https://github.com/tigera/operator/releases/tag/v1.27.10) (_Calico_ [v3.23.2](https://github.com/projectcalico/calico/releases/tag/v3.23.2)).

## [v2.2.5] - 2022-06-27

### Changed

- Update _Tigera Operator_ image to [v1.27.7](https://github.com/tigera/operator/releases/tag/v1.27.7) (_Calico_ [v3.23.2](https://github.com/projectcalico/calico/releases/tag/v3.23.2)).

## [v2.2.4] - 2022-06-20

### Changed

- Update _Tigera Operator_ image to [v1.27.5](https://github.com/tigera/operator/releases/tag/v1.27.5) (_Calico_ [v3.23.1](https://github.com/projectcalico/calico/releases/tag/v3.23.1)).

## [v2.2.3] - 2022-06-06

### Changed

- Update _Tigera Operator_ image to [v1.27.3](https://github.com/tigera/operator/releases/tag/v1.27.3) (_Calico_ [v3.23.1](https://github.com/projectcalico/calico/releases/tag/v3.23.1)).

## [v2.2.2] - 2022-06-06

### Changed

- Update _Tigera Operator_ image to [v1.27.2](https://github.com/tigera/operator/releases/tag/v1.27.2) (_Calico_ [v3.23.1](https://github.com/projectcalico/calico/releases/tag/v3.23.1)).

## [v2.2.1] - 2022-05-23

### Changed

- Update _Tigera Operator_ image to [v1.27.1](https://github.com/tigera/operator/releases/tag/v1.27.1) (_Calico_ [v3.23.1](https://github.com/projectcalico/calico/releases/tag/v3.23.1)).

## [v2.2.0] - 2022-05-12

### Added

- Added `commonLabels` to allow the addition of labels to all resources.
- Added `serviceMonitor.endpointConfig` to allow customisation of the `ServiceMonitor` endpoint.

### Changed

- Update _Tigera Operator_ image to [v1.27.0](https://github.com/tigera/operator/releases/tag/v1.27.0) (_Calico_ [v3.23.0](https://github.com/projectcalico/calico/releases/tag/v3.23.0)).

### Deprecated

- Deprecated `serviceMonitor.interval` in favour of `serviceMonitor.endpointConfig.interval`.

### Removed

- Removed chart default for `serviceMonitor.interval`, the interval should be the _Prometheus_ default if not overridden.

## [v2.1.8] - 2022-05-03

### Changed

- Update _Tigera Operator_ image to [v1.25.8](https://github.com/tigera/operator/releases/tag/v1.25.8) (_Calico_ [v3.22.2](https://github.com/projectcalico/calico/releases/tag/v3.22.2)).

## [v2.1.7] - 2022-04-19

### Changed

- Update _Tigera Operator_ image to [v1.25.7](https://github.com/tigera/operator/releases/tag/v1.25.7) (_Calico_ [v3.22.2](https://github.com/projectcalico/calico/releases/tag/v3.22.2)).

## [v2.1.6] - 2022-04-13

### Changed

- Update _Tigera Operator_ image to [v1.25.6](https://github.com/tigera/operator/releases/tag/v1.25.6).

## [v2.1.5] - 2022-04-11

### Changed

- Update _Tigera Operator_ image to [v1.25.4](https://github.com/tigera/operator/releases/tag/v1.25.4).

## [v2.1.4] - 2022-03-08

### Changed

- Update _Tigera Operator_ image to [v1.25.3](https://github.com/tigera/operator/releases/tag/v1.25.3).

## [v2.1.3] - 2022-03-06

### Changed

- Update _Tigera Operator_ image to [v1.25.2](https://github.com/tigera/operator/releases/tag/v1.25.2).

## [v2.1.2] - 2022-02-17

### Changed

- Update _Tigera Operator_ image to [v1.25.1](https://github.com/tigera/operator/releases/tag/v1.25.1).

## [v2.1.1] - 2022-02-07

### Changed

- Fixed RBAC by re-adding the PodSecurityPolicy rule removed in `v2.1.0`.

## [v2.1.0] - 2022-01-31

### Added

- Add support for [kubectl to manage Calico APIs](https://projectcalico.docs.tigera.io/maintenance/install-apiserver) with `apiServer.enabled`.

### Changed

- Update _Tigera Operator_ image to [v1.25.0](https://github.com/tigera/operator/releases/tag/v1.25.0).
- Update _Calico_ version (implicitly via the _Tigera Operator_) to [v3.22.0](https://projectcalico.docs.tigera.io/archive/v3.22/release-notes/).

### Removed

- Removed the unused `PodSecurityPolicy` RBAC rules.

## [v2.0.1] - 2022-01-19

### Changed

- Update _Tigera Operator_ image to [v1.23.5](https://github.com/tigera/operator/releases/tag/v1.23.5).

## [v2.0.0] - 2022-01-13

### Changed

- Update _Tigera Operator_ image to [v1.23.4](https://github.com/tigera/operator/releases/tag/v1.23.4), this is a one time downgrade to align to the version used by [projectcalico/calico](https://github.com/projectcalico/calico).

### Removed

- All CRDs not required to deploy _Calico_ have been removed.

## [v1.5.1] - 2021-12-11

### Changed

- Update _Tigera Operator_ image to [v1.24.1](https://github.com/tigera/operator/releases/tag/v1.24.1).

## [v1.5.0] - 2021-11-25

### Changed

- Update _Tigera Operator_ image to [v1.24.0](https://github.com/tigera/operator/releases/tag/v1.24.0).

## [v1.4.3] - 2021-11-25

### Added

- Support for adding custom rules to the `ClusterRole` via `rbac.customRules`.

### Changed

- Update _Tigera Operator_ image to [v1.23.2](https://github.com/tigera/operator/releases/tag/v1.23.2).

## [v1.4.2] - 2021-11-12

### Changed

- Update `ClusterRole`.

## [v1.4.1] - 2021-11-10

### Changed

- Update _Tigera Operator_ image to [v1.23.1](https://github.com/tigera/operator/releases/tag/v1.23.1).

## [v1.4.0] - 2021-11-09

### Changed

- Update _Tigera Operator_ image to [v1.23.0](https://github.com/tigera/operator/releases/tag/v1.23.0).

## [v1.3.4] - 2021-10-20

### Changed

- Update _Tigera Operator_ image to [v1.22.4](https://github.com/tigera/operator/releases/tag/v1.22.4).

## [v1.3.3] - 2021-10-20

### Changed

- Update _Tigera Operator_ image to [v1.22.3](https://github.com/tigera/operator/releases/tag/v1.22.3).

## [v1.3.2] - 2021-10-13

### Changed

- Update _Tigera Operator_ image to [v1.22.2](https://github.com/tigera/operator/releases/tag/v1.22.2).

## [v1.3.1] - 2021-10-07

### Changed

- Update _Tigera Operator_ image to [v1.22.1](https://github.com/tigera/operator/releases/tag/v1.22.1).

## [v1.3.0] - 2021-10-04

### Added

- Remaining _Tigera Operator_ CRDs.

### Changed

- Update _Tigera Operator_ image to [v1.22.0](https://github.com/tigera/operator/releases/tag/v1.22.0).

## [v1.2.3] - 2021-10-04

### Changed

- Update _Tigera Operator_ image to [v1.21.3](https://github.com/tigera/operator/releases/tag/v1.21.3).

## [v1.2.2] - 2021-10-04

### Changed

- Update _Tigera Operator_ image to [v1.21.2](https://github.com/tigera/operator/releases/tag/v1.21.2).

## [v1.2.1] - 2021-09-02

### Changed

- Use metadata to get operator namespace in env.

## [v1.2.0] - 2021-09-02

### Added

- Locking secret `tigera-operator-lock` in the `kube-system` namespace to stop the chart being deployed more than once.
- Support for the `installation.spec` to be provided as a templatable string as an alternative to structured configuration.

## [v1.1.2] - 2021-09-01

### Changed

- Fix cluster role.

## [v1.1.1] - 2021-09-01

### Changed

- Update _Tigera Operator_ image to [v1.21.1](https://github.com/tigera/operator/releases/tag/v1.21.1).

## [v1.1.0] - 2021-08-24

### Changed

- Updated _Tigera Operator_ image to [v1.21.0](https://github.com/tigera/operator/releases/tag/v1.21.0).
- Enable customisation of deployment `hostNetwork` & `dnsPolicy` for users who aren't using Calico as the CNI.

## [v1.0.5] - 2021-08-11

### Changed

- Improve documentation.

## [v1.0.4] - 2021-08-05

### Changed

- Fixed _Tigera Operator_ namespace support.

## [v1.0.3] - 2021-08-04

### Removed

- Removed `tigeraWatchNamespace` value as it would be ignored.

## [v1.0.2] - 2021-08-03

### Changed

- Use default custom resource name.

## [v1.0.1] - 2021-08-03

### Added

- New `env` & `envFrom` values to set the environment.
- Correct metadata to installation resource.

### Changed

- Fix watch namespace to watch all namespaces by default.

## [v1.0.0] - 2021-08-03

### Added

- Initial release based on _Tigera Operator_ [v1.20.0](https://github.com/tigera/operator/releases/tag/v1.20.0).

<!--
RELEASE LINKS
-->
[UNRELEASED]: https://github.com/stevehipwell/helm-charts/tree/main/charts/tigera-operator
[v2.12.5]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.12.5
[v2.12.4]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.12.4
[v2.12.3]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.12.3
[v2.12.2]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.12.2
[v2.12.1]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.12.1
[v2.12.0]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.12.0
[v2.11.6]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.11.6
[v2.11.5]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.11.5
[v2.11.4]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.11.4
[v2.11.3]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.11.3
[v2.11.2]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.11.2
[v2.11.1]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.11.1
[v2.11.0]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.11.0
[v2.10.6]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.10.6
[v2.10.5]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.10.5
[v2.10.4]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.10.4
[v2.10.3]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.10.3
[v2.10.2]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.10.2
[v2.10.1]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.10.1
[v2.10.0]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.10.0
[v2.9.3]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.9.3
[v2.9.2]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.9.2
[v2.9.1]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.9.1
[v2.9.0]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.9.0
[v2.8.1]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.8.1
[v2.8.0]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.8.0
[v2.7.1]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.7.1
[v2.7.0]: https://github.com/stevehipwell/helm-charts/releases/tag/tigera-operator-2.7.0
