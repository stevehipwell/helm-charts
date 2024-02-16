# PlantUML Helm Chart Changelog

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

## [v3.30.0] - 2024-02-16

### Changed

- Updated the _PlantUML_ OCI image to [v1.2024.3](https://github.com/plantuml/plantuml-server/releases/tag/v1.2024.3) ([Changes](https://plantuml.com/changes)).

## [v3.29.0] - 2024-02-16

### Changed

- Updated the _PlantUML_ OCI image to [v1.2024.2](https://github.com/plantuml/plantuml-server/releases/tag/v1.2024.2) ([Changes](https://plantuml.com/changes)).

## [v3.28.0] - 2024-02-12

### Changed

- Updated the _PlantUML_ OCI image to [v1.2024.1](https://github.com/plantuml/plantuml-server/releases/tag/v1.2024.1) ([Changes](https://plantuml.com/changes)).

## [v3.27.0] - 2023-12-13

### Added

- Added `serviceAccount.labels` value.
- Added support for configuring `HorizontalPodAutoscaler` behaviour with the `autoscaling.behavior` value.
- Added `autoscaling.metrics` value to replace the deprecated `autoscaling.targetCPUUtilizationPercentage` & `autoscaling.targetMemoryUtilizationPercentage` values.
- Added `podDisruptionBudget` value to replace the deprecated `maxUnavailable` variable.

### Changed

- Updated the _PlantUML_ OCI image to [v1.2023.13](https://github.com/plantuml/plantuml-server/releases/tag/v1.2023.13) ([Changes](https://plantuml.com/changes)).
- Changed the pod security policy defaults.
- Changed the PlantUML container security policy defaults.
- Changed the CA certificates init container security policy.

### Deprecated

- Deprecated `autoscaling.targetCPUUtilizationPercentage` value.
- Deprecated `autoscaling.targetMemoryUtilizationPercentage` value.
- Deprecated `podDisruptionBudget` value.

## [v3.26.0] - 2023-10-25

### Changed

- Updated the _PlantUML_ OCI image to [v1.2023.12](https://github.com/plantuml/plantuml-server/releases/tag/v1.2023.12) ([Changes](https://plantuml.com/changes)).

## [v3.25.0] - 2023-07-20

### Changed

- Updated the _PlantUML_ OCI image to [v1.2023.10](https://github.com/plantuml/plantuml-server/releases/tag/v1.2023.10) ([Changes](https://plantuml.com/changes)).

## [v3.24.1] - 2023-07-13

### Fixed

- Fixed incorrect `PodDisruptionBudget` API version for Kubernetes v1.25+.

## [v3.24.0] - 2023-05-23

### Changed

- Updated the _PlantUML_ OCI image to [v1.2023.8](https://plantuml.com/changes) ([GH](https://github.com/plantuml/plantuml-server/releases/tag/v1.2023.7)).

## [v3.23.0] - 2023-05-16

### Changed

- Updated the _PlantUML_ OCI image to [v1.2023.7](https://plantuml.com/changes) ([GH](https://github.com/plantuml/plantuml-server/releases/tag/v1.2023.7)).

## [v3.22.0] - 2023-04-25

### Changed

- Updated the _PlantUML_ image to [v1.2023.6](https://plantuml.com/changes) ([GH](https://github.com/plantuml/plantuml-server/releases/tag/v1.2023.6)).

## [v3.21.0] - 2023-04-12

### Added

- Added support for `topologySpreadConstraints` with a default `labelSelector` for the release pods.
- Added a default `labelSelector` for the release pods to `affinity.podAffinity` & `affinity.podAntiAffinity`.

### Changed

- Updated the _PlantUML_ image to [v1.2023.5](https://plantuml.com/changes) ([GH](https://github.com/plantuml/plantuml-server/releases/tag/v1.2023.5)).

## [v3.20.0] - 2023-01-30

### Changed

- Updated the _PlantUML_ image to [v1.2023.1](https://plantuml.com/changes) ([GH](https://github.com/plantuml/plantuml-server/releases/tag/v1.2023.1)).

## [v3.19.1] - 2023-01-19

### Fixed

- Fixed a bug in the default security context implementation.

## [v3.19.0] - 2023-01-19

### Added

- Added an empty directory at `/tmp/jetty` to support using a read-only root file system.

### Changed

- Changed the default pod security context to run as non-root with a read-only root file system.

## [v3.18.0] - 2023-01-13

### Added

- Added support for `terminationGracePeriodSeconds`.

### Changed

- Updated the _PlantUML_ image to [v1.2023.0](https://plantuml.com/changes) ([GH](https://github.com/plantuml/plantuml-server/releases/tag/v1.2023.0)).

## [v3.17.0] - 2022-12-08

### Changed

- Updated the _PlantUML_ image to [v1.2022.14](https://plantuml.com/changes) ([GH](https://github.com/plantuml/plantuml-server/releases/tag/v1.2022.14)).
- Updated `HorizontalPodAutoscaler` API to use either `autoscaling/v2` or `autoscaling/v2beta2`.

## [v3.16.0] - 2022-11-21

### Changed

- Updated the _PlantUML_ image to [v1.2022.13](https://plantuml.com/changes) ([GH](https://github.com/plantuml/plantuml-server/releases/tag/v1.2022.13)).

## [v3.15.0] - 2022-11-07

### Changed

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

> [!IMPORTANT]
> This release is only compatible with _Helm_ v3.

### Added

- New `priorityClassName` value

### Changed

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

- Bumping to fix failed CI job.

## [v1.1.0] - 2020-10-09

### Added

- CA certificate support

### Changed

- Empty default ingress hosts
- No memory in default HPA

## [v1.0.0] - 2020-10-07

### Added

- Initial release of [PlantUML](https://github.com/plantuml/plantuml-server) _v1.2020.18_.

<!--
RELEASE LINKS
-->
[UNRELEASED]: https://github.com/stevehipwell/helm-charts/tree/main/charts/plantuml
[v3.30.0]: https://github.com/stevehipwell/helm-charts/releases/tag/plantuml-3.30.0
[v3.29.0]: https://github.com/stevehipwell/helm-charts/releases/tag/plantuml-3.29.0
[v3.28.0]: https://github.com/stevehipwell/helm-charts/releases/tag/plantuml-3.28.0
[v3.27.0]: https://github.com/stevehipwell/helm-charts/releases/tag/plantuml-3.27.0
[v3.26.0]: https://github.com/stevehipwell/helm-charts/releases/tag/plantuml-3.26.0
[v3.25.0]: https://github.com/stevehipwell/helm-charts/releases/tag/plantuml-3.25.0
