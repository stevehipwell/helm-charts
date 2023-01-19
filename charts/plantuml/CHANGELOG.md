# PlantUML Helm Chart Changelog

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

## [v3.19.0] - 2023-01-19

### All Changes

- Changed the default pod security context to run as non-root with a read-only root file system.
- Added an empty directory at `/tmp/jetty` to support using a read-only root file system.

## [v3.18.0] - 2023-01-13

### All Changes

- Updated the _PlantUML_ image to [v1.2023.0](https://plantuml.com/changes) ([GH](https://github.com/plantuml/plantuml-server/releases/tag/v1.2023.0)).
- Added support for `terminationGracePeriodSeconds`.

## [v3.17.0] - 2022-12-08

### All Changes

- Updated the _PlantUML_ image to [v1.2022.14](https://plantuml.com/changes) ([GH](https://github.com/plantuml/plantuml-server/releases/tag/v1.2022.14)).
- Updated `HorizontalPodAutoscaler` API to use either `autoscaling/v2` or `autoscaling/v2beta2`.

## [v3.16.0] - 2022-11-21

### All Changes

- Updated the _PlantUML_ image to [v1.2022.13](https://plantuml.com/changes) ([GH](https://github.com/plantuml/plantuml-server/releases/tag/v1.2022.13)).

## [v3.15.0] - 2022-11-07

### All Changes

- Updated the _PlantUML_ image to [v1.2022.12](https://plantuml.com/changes) ([GH](https://github.com/plantuml/plantuml-server/releases/tag/v1.2022.12)).

## [v3.14.0] - 2022-08-26

### Changed

- Updated _PlantUML_ image to [v1.2022.7](https://plantuml.com/changes).

## [v3.13.0] - 2022-06-22

### Added

- Added explicit namespace declaration in templates.
- Added `imagePullSecrets` to replace the deprecated `image.pullSecrets`.
- Added `serviceAccount.automountToken` to default token binding to `false`.

### Changed

- Updated _PlantUML_ image to [v1.2022.6](https://plantuml.com/changes).

### Deprecated

- Deprecated `image.pullSecrets` in favour of `imagePullSecrets`.

## [v3.12.0] - 2022-05-26

### Changed

- Updated _PlantUML_ image to [v1.2022.5](https://plantuml.com/changes).

## [v3.11.0] - 2022-04-11

### Changed

- Updated _PlantUML_ image to [v1.2022.4](https://plantuml.com/changes).

## [v3.10.0] - 2022-03-31

### Added

- Added `commonLabels` to allow the addition of labels to all resources.

### Changed

- Updated _PlantUML_ image to [v1.2022.3](https://plantuml.com/changes).

## [v3.9.0] - 2022-03-16

### Added

- Added the ability to pass in extra arguments to the PlantUML process via the `args` value.

## [v3.8.0] - 2022-03-08

### Changed

- Updated _PlantUML_ image to [v1.2022.2](https://plantuml.com/changes).

## [v3.7.0] - 2022-01-13

### Changed

- Updated _PlantUML_ image to [v1.2022.0](https://plantuml.com/changes).

## [v3.6.0] - 2021-12-27

### Changed

- Updated _PlantUML_ image to [v1.2021.17](https://plantuml.com/changes).

## [v3.5.0] - 2021-12-11

### Changed

- Updated _PlantUML_ image to [v1.2021.16](https://plantuml.com/changes).

## [v3.4.0] - 2021-12-01

### Changed

- Updated _PlantUML_ image to [v1.2021.15](https://plantuml.com/changes).

## [v3.3.0] - 2021-11-15

### Changed

- Updated _PlantUML_ image to [v1.2021.14](https://plantuml.com/changes).

## [v3.2.0] - 2021-10-06

### Changed

- Updated _PlantUML_ image to [v1.2021.12](https://plantuml.com/changes).

## [v3.1.0] - 2021-09-17

### Changed

- Updated _PlantUML_ image to [v1.2021.10](https://plantuml.com/changes).

## [v3.0.0] - 2021-06-17

### Changed

- Support K8s v1.18 ingress changes

### Removed

- Customisable ingress paths per-host as using anything except `/` would break the PlantUML service

## [v2.8.0] - 2021-05-25

### Changed

- Upgraded _PlantUML_ image to `v1.2021.7`

## [v2.7.0] - 2021-05-17

### Changed

- Upgraded _PlantUML_ image to `v1.2021.6`

## [v2.6.0] - 2021-04-26

### Changed

- Upgraded _PlantUML_ image to _v1.2021.5_

## [v2.5.0] - 2021-04-06

### Changed

- Upgraded _PlantUML_ image to _v1.2021.4_
- Support `podLabels` configuration value

## [v2.4.0] - 2021-03-23

### Changed

- Upgraded _PlantUML_ image to _v1.2021.3_

## [v2.3.0] - 2021-03-07

### Changed

- Upgraded _PlantUML_ image to _v1.2021.2_

## [v2.2.1] - 2021-02-05

### Changed

- Fix PDB creation logic

## [v2.2.0] - 2021-02-02

### Changed

- Upgraded _PlantUML_ image to _v1.2021.1_

## [v2.1.1] - 2021-01-15

### Added

- Dynamic probe configuration

## [v2.1.0] - 2021-01-11

### Changed

- Upgraded _PlantUML_ image to _v1.2021.0_

## [v2.0.0] - 2021-01-06

> **IMPORTANT** - This release is only compatible with _Helm_ v3.

## Added

- New `priorityClassName` value

## Changed

- Upgraded chart API version to `v2`

## [v1.6.0] - 2021-01-04

### Changed

- Upgraded _PlantUML_ image to _v1.2020.26_

## [v1.5.0] - 2020-12-15

### Changed

- Upgraded _PlantUML_ image to _v1.2020.23_

## [v1.4.0] - 2020-12-02

### Changed

- Upgraded _PlantUML_ image to _v1.2020.21_

## [v1.3.0] - 2020-11-23

### Changed

- Upgraded _PlantUML_ image to _v1.2020.20_

## [v1.2.0] - 2020-10-13

### Changed

- Upgraded _PlantUML_ image to _v1.2020.19_
- Use `.Chart.AppVersion` for default tag value

## [v1.1.2] - 2020-10-09

### Changed

- Fixed cacerts path

## [v1.1.1] - 2020-10-09

### Changed

- n/a (bumping to fix failed CI job)

## [v1.1.0] - 2020-10-09

### Added

- CA certificate support

### Changed

- Empty default ingress hosts
- No memory in default HPA

## [v1.0.0] - 2020-10-07

### Added

- Initial release of [PlantUML](https://github.com/plantuml/plantuml-server) _v1.2020.18_
