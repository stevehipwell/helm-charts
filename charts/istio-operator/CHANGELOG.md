# Istio Operator Helm Chart Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

<!-- ## [vX.Y.Z] - UNRELEASED
### Added
### Changed
### Deprecated
### Removed -->

## [v2.5.4] - 2022-05-23

### Changed

- Updated the _Istio Operator_ image version to [v1.13.4](https://github.com/istio/istio/releases/tag/1.13.4).

## [v2.5.3] - 2022-04-19

### Changed

- Updated the _Istio Operator_ image version to [v1.13.3](https://github.com/istio/istio/releases/tag/1.13.3).

## [v2.5.2] - 2022-03-10

### Changed

- Updated the _Istio Operator_ image version to [v1.13.2](https://github.com/istio/istio/releases/tag/1.13.2).

## [v2.5.1] - 2022-02-23

### Changed

- Updated the _Istio Operator_ image version to [v1.13.1](https://github.com/istio/istio/releases/tag/1.13.1).

## [v2.5.0] - 2022-02-14

### Added

- Added templating support to `controlPlane.spec` when passed in as a string.

### Changed

- Updated the _Istio Operator_ image version to [v1.13.0](https://github.com/istio/istio/releases/tag/1.13.0).
- Switch to use `toYaml` instead of `toJson` in `IstioOperator` CR.

### Deprecated

- Deprecated `image.pullSecrets` in favour of the idiomatic `imagePullSecrets`.

## [v2.4.3] - 2022-02-11

### Changed

- Updated the _Istio Operator_ image version to [v1.12.3](https://github.com/istio/istio/releases/tag/1.12.3).

## [v2.4.2] - 2022-01-19

### Changed

- Updated the _Istio Operator_ image version to [v1.12.2](https://github.com/istio/istio/releases/tag/1.12.2).

## [v2.4.1] - 2021-12-11

### Changed

- Updated the _Istio Operator_ image version to [v1.12.1](https://github.com/istio/istio/releases/tag/1.12.1).

## [v2.4.0] - 2021-11-19

### Changed

- Updated the _Istio Operator_ image version to `v1.12.0`.
- Updated dashboards (_Istio_ repo commit `48d133cd19deef1723ef9a0fdabf5e9b6cf3181c`).

## [v2.3.5] - 2021-11-12

### Changed

- Fixed missing `pods/portfoward` permissions from the ClusterRole.

## [v2.3.4] - 2021-10-18

### Changed

- Updated _Istio_ version to [v1.11.4](https://github.com/istio/istio/releases/tag/1.11.4).

## [v2.3.3] - 2021-10-04

### Changed

- Updated _Istio_ version to [v1.11.3](https://github.com/istio/istio/releases/tag/1.11.3).

## [v2.3.2] - 2021-09-03

### Changed

- Updated _Istio_ version to [v1.11.2](https://github.com/istio/istio/releases/tag/1.11.2).

## [v2.3.1] - 2021-08-17

### Changed

- Updated _Istio_ version to `v1.11.1`.

## [v2.3.0] - 2021-08-17

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

## Changed

- Lease `istio-operator` permission update

## v2.1.0 - 2021-02-10

## Changed

- Upgraded _Istio_ version to _v1.9.0_

## v2.0.5 - 2021-02-09

## Changed

- Upgraded _Istio_ version to _v1.8.3_

## v2.0.4 - 2021-02-09

## Changed

- Add `podLabels` parameter

## v2.0.3 - 2021-01-22

## Changed

- Update _Grafana_ dashboards to dynamically set datasource.

## v2.0.2 - 2021-01-19

## Changed

- Add _Grafana_ dashboards to be installed by the sidecar via `dashboards.enabled: true`.

## v2.0.1 - 2021-01-15

## Changed

- Upgraded _Istio_ version to _v1.8.2_

## v2.0.0 - 2021-01-06

> **IMPORTANT** - This release is only compatible with _Helm_ v3.

## Added

- New `priorityClassName` value

## Changed

- Upgraded chart API version to `v2`

## 1.2.1 - 2020-12-08

### Changed

- Upgraded _Istio_ version to _v1.8.1_

## 1.2.0 - 2020-11-20

### Changed

- Upgraded _Istio_ version to _v1.8.0_

## 1.1.6 - 2020-11-19

### Changed

- Upgraded _Istio_ version to _v1.7.5_

## 1.1.5 - 2020-11-02

### Changed

- Upgraded _Istio_ version to _v1.7.4_
- Use `.Chart.AppVersion` for default tag value

## 1.1.4 - 2020-09-30

### Changed

- Upgraded _Istio_ version to _v1.7.3_

## 1.1.3 - 2020-09-21

### Changed

- Upgraded _Istio_ version to _v1.7.2_

## 1.1.2 - 2020-09-11

### Changed

- Upgraded _Istio_ version to _v1.7.1_

## 1.1.1 - 2020-09-02

### Changed

- Fix metrics path from `/` to `/metrics`

## 1.1.0 - 2020-08-28

### Changed

- Upgraded _Istio_ version to _v1.7.0_

## 1.0.12 - 2020-08-12

### Changed

- Upgraded _Istio_ version to _v1.6.8_

## v1.0.8 - 2020-08-04

### Added

- README

## 1.0.7 - 2020-08-03

### Changed

- Upgraded _Istio_ version to _v1.6.7_
