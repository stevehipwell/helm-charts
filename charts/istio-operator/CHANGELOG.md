# Istio Operator Helm Chart Changelog

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

## [v2.15.1] - 2024-06-10

### Changed

- Updated the _Istio Operator_ OCI image version to [v1.22.1](https://github.com/istio/istio/releases/tag/1.22.1).

## [v2.15.0] - 2024-05-14

### Changed

- Updated the _Istio Operator_ OCI image version to [v1.22.0](https://github.com/istio/istio/releases/tag/1.22.0).

## [v2.14.2] - 2024-04-23

### Changed

- Updated the _Istio Operator_ OCI image version to [v1.21.2](https://github.com/istio/istio/releases/tag/1.21.2).

### Fixed

- Fixed incorrect `ServiceMonitor` name via the `jobLabel` field.

## [v2.14.1] - 2024-04-09

### Changed

- Updated the _Istio Operator_ OCI image version to [v1.21.1](https://github.com/istio/istio/releases/tag/1.21.1).

## [v2.14.0] - 2024-03-14

### Changed

- Updated the _Istio Operator_ OCI image version to [v1.21.0](https://github.com/istio/istio/releases/tag/1.21.0).
- Updated dashboards to match upstream.

## [v2.13.3] - 2024-02-12

### Changed

- Updated the _Istio Operator_ OCI image version to [v1.20.3](https://github.com/istio/istio/releases/tag/1.20.3).

## [v2.13.2] - 2024-01-10

### Changed

- Updated the _Istio Operator_ OCI image version to [v1.20.2](https://github.com/istio/istio/releases/tag/1.20.2).

## [v2.13.1] - 2023-12-13

### Changed

- Updated the _Istio Operator_ OCI image version to [v1.20.1](https://github.com/istio/istio/releases/tag/1.20.1).

## [v2.13.0] - 2023-11-22

### Added

- Added support for adding additional labels to the `ServiceAccount` via the new `serviceAccount.labels` value.
- Added support for customising the termination grace period via the new `terminationGracePeriodSeconds` value.
- Added support for setting the _Istio_ revision via the new `revision` value.

### Changed

- Updated the _Istio Operator_ OCI image version to [v1.20.0](https://github.com/istio/istio/releases/tag/1.20.0).
- Updated the pod security context to be more secure and closer aligned to the operator container security context.

## [v2.12.3] - 2023-11-22

### Changed

- Updated the _Istio Operator_ OCI image version to [v1.19.4](https://github.com/istio/istio/releases/tag/1.19.4).

## [v2.12.2] - 2023-10-20

### Changed

- Updated the _Istio Operator_ OCI image version to [v1.19.3](https://github.com/istio/istio/releases/tag/1.19.3).

## [v2.12.1] - 2023-10-03

### Changed

- Updated the _Istio Operator_ OCI image version to [v1.19.1](https://github.com/istio/istio/releases/tag/1.19.1).

## [v2.12.0] - 2023-09-06

### Changed

- Updated the _Istio Operator_ OCI image version to [v1.19.0](https://github.com/istio/istio/releases/tag/1.19.0).

## [v2.11.2] - 2023-07-26

### Changed

- Updated the _Istio Operator_ OCI image version to [v1.18.2](https://github.com/istio/istio/releases/tag/1.18.2).

## [v2.11.1] - 2023-07-17

### Changed

- Updated the _Istio Operator_ OCI image version to [v1.18.1](https://github.com/istio/istio/releases/tag/1.18.1).

## [v2.11.0] - 2023-06-08

### Changed

- Updated the _Istio Operator_ OCI image version to [v1.18.0](https://github.com/istio/istio/releases/tag/1.18.0).

## [v2.10.1] - 2023-06-07

### Changed

- Updated the _Istio Operator_ OCI image version to [v1.17.3](https://github.com/istio/istio/releases/tag/1.17.3).

## [v2.10.0] - 2023-04-11

### Added

- Added explicit namespace declaration in templates.
- Added support for `topologySpreadConstraints` with a default `labelSelector` for the release pods.
- Added a default `labelSelector` for the release pods to `affinity.podAffinity` & `affinity.podAntiAffinity`.

### Changed

- Updated the _Istio Operator_ image version to [v1.17.2](https://github.com/istio/istio/releases/tag/1.17.2).

## [v2.9.1] - 2023-02-24

### Changed

- Updated the _Istio Operator_ image version to [v1.17.1](https://github.com/istio/istio/releases/tag/1.17.1).

## [v2.9.0] - 2023-02-15

### Changed

- Updated the _Istio Operator_ image version to [v1.17.0](https://github.com/istio/istio/releases/tag/1.17.0).

## [v2.8.2] - 2023-01-31

### Added

- Added `controlPlane.annotations` to annotate the `IstioOperator` resource.

### Changed

- Updated the _Istio Operator_ image version to [v1.16.2](https://github.com/istio/istio/releases/tag/1.16.2).

## [v2.8.1] - 2022-12-13

### Changed

- Updated the _Istio Operator_ image version to [v1.16.1](https://github.com/istio/istio/releases/tag/1.16.1).

## [v2.8.0] - 2022-11-16

### Changed

- Updated the _Istio Operator_ image version to [v1.16.0](https://github.com/istio/istio/releases/tag/1.16.0).

## [v2.7.3] - 2022-10-28

### Changed

- Updated the _Istio Operator_ image version to [v1.15.3](https://github.com/istio/istio/releases/tag/1.15.3).

## [v2.7.2] - 2022-10-12

### Changed

- Updated the _Istio Operator_ image version to [v1.15.2](https://github.com/istio/istio/releases/tag/1.15.2).

## [v2.7.1] - 2022-10-03

### Changed

- Updated the _Istio Operator_ image version to [v1.15.1](https://github.com/istio/istio/releases/tag/1.15.1).

## [v2.7.0] - 2022-08-01

### Changed

- Updated the _Istio Operator_ image version to [v1.15.0](https://github.com/istio/istio/releases/tag/1.15.0).

## [v2.6.3] - 2022-08-01

### Changed

- Updated the _Istio Operator_ image version to [v1.14.3](https://github.com/istio/istio/releases/tag/1.14.3).

## [v2.6.2] - 2022-07-26

### Changed

- Updated the _Istio Operator_ image version to [v1.14.2](https://github.com/istio/istio/releases/tag/1.14.2).

## [v2.6.1] - 2022-06-10

### Changed

- Updated the _Istio Operator_ image version to [v1.14.1](https://github.com/istio/istio/releases/tag/1.14.1).

## [v2.6.0] - 2022-06-06

### Added

- Added `commonLabels` to allow the addition of labels to all resources.
- Added `serviceMonitor.endpointConfig` to allow customisation of the `ServiceMonitor` endpoint.

### Changed

- Updated the _Istio Operator_ image version to [v1.14.0](https://github.com/istio/istio/releases/tag/1.14.0).

### Deprecated

- Deprecated `serviceMonitor.interval` in favour of `serviceMonitor.endpointConfig.interval`.

### Removed

- Removed chart default for `serviceMonitor.interval`, the interval should be the _Prometheus_ default if not overridden.

## v2.5.4 - 2022-05-23

### Changed

- Updated the _Istio Operator_ image version to [v1.13.4](https://github.com/istio/istio/releases/tag/1.13.4).

## v2.5.3 - 2022-04-19

### Changed

- Updated the _Istio Operator_ image version to [v1.13.3](https://github.com/istio/istio/releases/tag/1.13.3).

## v2.5.2 - 2022-03-10

### Changed

- Updated the _Istio Operator_ image version to [v1.13.2](https://github.com/istio/istio/releases/tag/1.13.2).

## v2.5.1 - 2022-02-23

### Changed

- Updated the _Istio Operator_ image version to [v1.13.1](https://github.com/istio/istio/releases/tag/1.13.1).

## v2.5.0 - 2022-02-14

### Added

- Added templating support to `controlPlane.spec` when passed in as a string.

### Changed

- Updated the _Istio Operator_ image version to [v1.13.0](https://github.com/istio/istio/releases/tag/1.13.0).
- Switch to use `toYaml` instead of `toJson` in `IstioOperator` CR.

### Deprecated

- Deprecated `image.pullSecrets` in favour of the idiomatic `imagePullSecrets`.

## v2.4.3 - 2022-02-11

### Changed

- Updated the _Istio Operator_ image version to [v1.12.3](https://github.com/istio/istio/releases/tag/1.12.3).

## v2.4.2 - 2022-01-19

### Changed

- Updated the _Istio Operator_ image version to [v1.12.2](https://github.com/istio/istio/releases/tag/1.12.2).

## v2.4.1 - 2021-12-11

### Changed

- Updated the _Istio Operator_ image version to [v1.12.1](https://github.com/istio/istio/releases/tag/1.12.1).

## v2.4.0 - 2021-11-19

### Changed

- Updated the _Istio Operator_ image version to `v1.12.0`.
- Updated dashboards (_Istio_ repo commit `48d133cd19deef1723ef9a0fdabf5e9b6cf3181c`).

## v2.3.5 - 2021-11-12

### Changed

- Fixed missing `pods/portfoward` permissions from the ClusterRole.

## v2.3.4 - 2021-10-18

### Changed

- Updated _Istio_ version to [v1.11.4](https://github.com/istio/istio/releases/tag/1.11.4).

## v2.3.3 - 2021-10-04

### Changed

- Updated _Istio_ version to [v1.11.3](https://github.com/istio/istio/releases/tag/1.11.3).

## v2.3.2 - 2021-09-03

### Changed

- Updated _Istio_ version to [v1.11.2](https://github.com/istio/istio/releases/tag/1.11.2).

## v2.3.1 - 2021-08-17

### Changed

- Updated _Istio_ version to `v1.11.1`.

## v2.3.0 - 2021-08-17

### Changed

- Updated _Istio_ version to `v1.11.0`.

## v2.2.3 - 2021-07-19

### Changed

- Updated _Istio_ version to [v1.10.3](https://istio.io/latest/news/releases/1.10.x/announcing-1.10.3/)

## v2.2.2 - 2021-06-25

### Changed

- Upgraded _Istio_ version to `v1.10.2`

## v2.2.1 - 2021-06-11

### Changed

- Upgraded _Istio_ version to `v1.10.1`

## v2.2.0 - 2021-05-19

### Changed

- Upgraded _Istio_ version to `v1.10.0`

## v2.1.7 - 2021-05-12

### Changed

- Upgraded _Istio_ version to `v1.9.5`

## v2.1.6 - 2021-04-28

### Changed

- Upgraded _Istio_ version to `v1.9.4`

## v2.1.5 - 2021-04-16

### Changed

- Upgraded _Istio_ version to _v1.9.3_

## v2.1.4 - 2021-03-26

### Changed

- Upgraded _Istio_ version to _v1.9.2_

## v2.1.3 - 2021-03-08

### Changed

- Upgraded _Istio_ version to _v1.9.1_

## v2.1.2 - 2021-02-11

### Changed

- Update docs

## v2.1.1 - 2021-02-11

### Changed

- Lease `istio-operator` permission update

## v2.1.0 - 2021-02-10

### Changed

- Upgraded _Istio_ version to _v1.9.0_

## v2.0.5 - 2021-02-09

### Changed

- Upgraded _Istio_ version to _v1.8.3_

## v2.0.4 - 2021-02-09

### Changed

- Add `podLabels` parameter

## v2.0.3 - 2021-01-22

### Changed

- Update _Grafana_ dashboards to dynamically set data source.

## v2.0.2 - 2021-01-19

### Changed

- Add _Grafana_ dashboards to be installed by the sidecar via `dashboards.enabled: true`.

## v2.0.1 - 2021-01-15

### Changed

- Upgraded _Istio_ version to _v1.8.2_

## v2.0.0 - 2021-01-06

> [!IMPORTANT]
> This release is only compatible with _Helm_ v3.

### Added

- New `priorityClassName` value

### Changed

- Upgraded chart API version to `v2`

## v1.2.1 - 2020-12-08

### Changed

- Upgraded _Istio_ version to _v1.8.1_

## v1.2.0 - 2020-11-20

### Changed

- Upgraded _Istio_ version to _v1.8.0_

## v1.1.6 - 2020-11-19

### Changed

- Upgraded _Istio_ version to _v1.7.5_

## v1.1.5 - 2020-11-02

### Changed

- Upgraded _Istio_ version to _v1.7.4_
- Use `.Chart.AppVersion` for default tag value

## v1.1.4 - 2020-09-30

### Changed

- Upgraded _Istio_ version to _v1.7.3_

## v1.1.3 - 2020-09-21

### Changed

- Upgraded _Istio_ version to _v1.7.2_

## v1.1.2 - 2020-09-11

### Changed

- Upgraded _Istio_ version to _v1.7.1_

## v1.1.1 - 2020-09-02

### Changed

- Fix metrics path from `/` to `/metrics`

## v1.1.0 - 2020-08-28

### Changed

- Upgraded _Istio_ version to _v1.7.0_

## v1.0.12 - 2020-08-12

### Changed

- Upgraded _Istio_ version to _v1.6.8_

## v1.0.8 - 2020-08-04

### Added

- README

## v1.0.7 - 2020-08-03

### Changed

- Upgraded _Istio_ version to _v1.6.7_.

<!--
RELEASE LINKS
-->
[UNRELEASED]: https://github.com/stevehipwell/helm-charts/tree/main/charts/istio-operator
[v2.15.1]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.15.1
[v2.15.0]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.15.0
[v2.14.2]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.14.2
[v2.14.1]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.14.1
[v2.14.0]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.14.0
[v2.13.3]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.13.3
[v2.13.2]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.13.2
[v2.13.1]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.13.1
[v2.13.0]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.13.0
[v2.12.3]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.12.3
[v2.12.2]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.12.2
[v2.12.1]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.12.1
[v2.12.0]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.12.0
[v2.11.2]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.11.2
[v2.11.1]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.11.1
[v2.11.0]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.11.0
[v2.10.1]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.10.1
[v2.10.0]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.10.0
[v2.9.1]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.9.1
[v2.9.0]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.9.0
[v2.8.2]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.8.2
[v2.8.1]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.8.1
[v2.8.0]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.8.0
[v2.7.3]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.7.3
[v2.7.2]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.7.2
[v2.7.1]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.7.1
[v2.7.0]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.7.0
[v2.6.3]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.6.3
[v2.6.2]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.6.2
[v2.6.1]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.6.1
[v2.6.0]: https://github.com/stevehipwell/helm-charts/releases/tag/istio-operator-2.6.0
