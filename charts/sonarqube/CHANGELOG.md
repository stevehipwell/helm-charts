# SonarQube Helm Chart Changelog

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

## [v5.4.1] - 2024-02-26

### Changed

- Updated the _SonarQube_ OCI image to [v10.4.1](https://www.sonarsource.com/blog/sonarqube-10-4-release-announcement/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/10.4.1.88267)).

## [v5.4.0] - 2024-02-07

### Changed

- Updated the _SonarQube_ OCI image to [v10.4.0](https://www.sonarsource.com/blog/sonarqube-10-4-release-announcement/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/10.4.0.87286)).

## [v5.3.0] - 2023-11-21

### Changed

- Updated the _SonarQube_ OCI image to [v10.3.0](https://www.sonarsource.com/products/sonarqube/whats-new/sonarqube-10-3/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/10.3.0.82913)).
- Updated the embedded _PostgreSQL_ chart to [v12.12.10](https://artifacthub.io/packages/helm/bitnami/postgresql/12.12.10) (PostgreSQL v15.4.0).

## [v5.2.1] - 2023-09-25

### Changed

- Updated the _SonarQube_ OCI image to [v10.2.1](https://www.sonarsource.com/products/sonarqube/whats-new/sonarqube-10-2/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/10.2.1.78527)).
- Updated the embedded _PostgreSQL_ chart to [v12.10.2](https://artifacthub.io/packages/helm/bitnami/postgresql/12.10.2) (PostgreSQL v15.4.0).

## [v5.2.0] - 2023-09-05

### Changed

- Updated the _SonarQube_ OCI image to [v10.2.0](https://www.sonarsource.com/products/sonarqube/whats-new/sonarqube-10-2/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/10.2.0.77647)).
- Updated the embedded _PostgreSQL_ chart to [v12.10.0](https://artifacthub.io/packages/helm/bitnami/postgresql/12.10.0) (PostgreSQL v15.4.0).

## [v5.1.0] - 2023-06-19

### Changed

- Updated the _SonarQube_ OCI image to [v10.1.0](https://www.sonarsource.com/products/sonarqube/whats-new/sonarqube-10-1/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/10.1.0.73491)).

## [v5.0.0] - 2023-04-04

### Changed

- Updated the _SonarQube_ image to [v10.0.0](https://www.sonarsource.com/products/sonarqube/whats-new/sonarqube-10-0/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/10.0.0.68432)).
- Updated the embedded _PostgreSQL_ chart to [v12.2.7](https://artifacthub.io/packages/helm/bitnami/postgresql/12.2.7) (PostgreSQL v15.2.0).

## [v4.9.1] - 2023-03-13

### All Changes

- Added support for `topologySpreadConstraints` with a default `labelSelector` for the release pods.
- Added a default `labelSelector` for the release pods to `affinity.podAffinity` & `affinity.podAntiAffinity`.
- Fixed incorrect entrypoint when installing plugins due to a change in `v9.9.0`.

## [v4.9.0] - 2023-02-03

### All Changes

- Updated the _SonarQube_ image to [v9.9.0](https://www.sonarqube.org/sonarqube-9-9/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/9.9.0.65466)).

## [v4.8.0] - 2022-12-16

### All Changes

- Updated the _SonarQube_ image to [v9.8.0](https://www.sonarqube.org/sonarqube-9-8/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/9.8.0.63668)).
- Updated embedded _PostgreSQL_ chart to [v11.9.13](https://artifacthub.io/packages/helm/bitnami/postgresql/11.9.13) (PostgreSQL v14.5.0).
- Added a new `serviceAccount.labels` value to add labels to the `ServiceAccount`.

## [v4.7.1] - 2022-10-26

### All Changes

- Updated the _SonarQube_ image to [v9.7.1](https://www.sonarqube.org/sonarqube-9-7/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/9.7.1)).

## [v4.7.0] - 2022-10-17

### All Changes

- Updated the _SonarQube_ image to [v9.7.0](https://www.sonarqube.org/sonarqube-9-7/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/9.7.0.61563)).

## [v4.6.1] - 2022-08-31

### Changed

- Updated _SonarQube_ image to [v9.6.1](https://www.sonarqube.org/sonarqube-9-6/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/9.6.1.59531)).

## [v4.6.0] - 2022-08-12

### Added

- Added support for running _SonarQube_ as a `StatefulSet` by setting `deployment` to `false`.
- Added `service.clusterIP` to enable making the `Service` headless.
- Added `imagePullSecrets` to replace `image.pullSecrets`.
- Added `terminationGracePeriodSeconds` support.

### Changed

- Updated _SonarQube_ image to [v9.6.0](https://www.sonarqube.org/sonarqube-9-6/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/9.6.0.59041)).

## [v4.5.0] - 2022-06-13

### Added

- Added `serviceAccount.automountToken` to default token binding to `false`.

### Changed

- Update _SonarQube_ image to [v9.5.0](https://www.sonarqube.org/sonarqube-9-5/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/9.5.0.56709)).
- Set resource namespaces to `{{ .Release.Namespace }}` in the templates instead of waiting until apply time inference.

## [v4.4.2] - 2022-04-12

### Changed

- Fixed _PostgreSQL_ env variables.

## [v4.4.1] - 2022-04-06

### Changed

- Fixed bad formatting when using embedded _PostgreSQL_ chart.

## [v4.4.0] - 2022-04-06

### Added

- Added `commonLabels` to allow the addition of labels to all resources.

### Changed

- Update _SonarQube_ image to [v9.4.0](https://www.sonarqube.org/sonarqube-9-4/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/9.4.0.54424)).
- Update embedded _PostgreSQL_ chart to [v10.16.2](https://artifacthub.io/packages/helm/bitnami/postgresql/10.16.2) (PostgreSQL v11.14.0).

## [v4.3.1] - 2022-03-08

### Changed

- Minor docs change.

## [v4.3.0] - 2022-01-28

### Changed

- Update _SonarQube_ image to [v9.3.0](https://www.sonarqube.org/sonarqube-9-3/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/9.3.0.51899)).

## [v4.2.4] - 2021-12-21

### Changed

- Update _SonarQube_ image to [v9.2.4](https://www.sonarqube.org/sonarqube-9-2/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/9.2.4.50792)).

## [v4.2.3] - 2021-12-17

### Changed

- Update _SonarQube_ image to [v9.2.3](https://www.sonarqube.org/sonarqube-9-2/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/9.2.3.50713)).

## [v4.2.2] - 2021-12-15

### Changed

- Update _SonarQube_ image to [v9.2.2](https://www.sonarqube.org/sonarqube-9-2/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/9.2.2.50622)).

## [v4.2.1] - 2021-11-29

### Changed

- Update _SonarQube_ image to [v9.2.1](https://www.sonarqube.org/sonarqube-9-2/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/9.2.1.49989)).

## [v4.2.0] - 2021-11-24

### Changed

- Update _SonarQube_ image to [v9.2.0](https://www.sonarqube.org/sonarqube-9-2/).

## [v4.1.0] - 2021-11-24

### Changed

- Update _SonarQube_ image to [v9.1.0](https://www.sonarqube.org/sonarqube-9-1/).
- Update embedded _PostgreSQL_ chart to [v10.13.8](https://artifacthub.io/packages/helm/bitnami/postgresql/10.13.8) (PostgreSQL v11.14.0).

## [v4.0.0] - 2021-08-26

### Changed

- Update _SonarQube_ image to [v9.0.1](https://www.sonarqube.org/sonarqube-9-0/).

## [v3.2.1] - 2021-08-26

### Changed

- Update _SonarQube_ image to [v8.9.2](https://www.sonarqube.org/sonarqube-8-9-lts/).

### Removed

- Defective templating for `extraInitContainers`.

## [v3.2.0] - 2021-08-19

### Added

- Extra sidecar containers via `extraContainers`

## [v3.1.0] - 2021-08-11

### Added

- Pod labels via `podlabels`.
- Extra volumes via `extraVolumes` and mounts for the _sonarqube_ container via `extraVolumeMounts`.
- Extra init containers via `extraInitContainers`, which can be templated.

### Removed

- Init container _chmod-volume-mounts_ container as `fsGroup` should solve this issue.

## [v3.0.1] - 2021-08-06

### Changed

- Cleanup pluigns that are no longer configured

## [v3.0.0] - 2021-06-21

### Changed

- Support K8s v1.18 ingress changes

### Removed

- Customisable ingress paths (unsupported)

## [v2.0.1] - 2021-06-11

### Changed

- Upgraded _SonarQube_ image to `v8.9.1`

## [v2.0.0]

### Added

- Support for CE environment variables via `javaOptionsCE` & `javaAdditionalOptionsCE`

### Changed

- Renamed `envVars.jvmOptions` to `envVars.javaOptionsWeb`
- Renamed `envVars.jvmAdditionalOptions` to `envVars.javaAdditionalOptionsWeb`

## [v1.4.0] - 2021-05-05

### Changed

- Upgraded _SonarQube_ image to `v8.9.0`

## [v1.3.1] - 2021-04-16

### Changed

- Add custom values for chart CI

## [v1.3.0] - 2021-04-12

### Changed

- Upgraded _SonarQube_ image to `v8.8.0`
- Upgraded _PostgreSQL_ chart to `v10.3.17` (_PostgreSQL_ `v11.11.0`)

## [v1.2.2] - 2021-03-12

### Changed

- Upgraded _SonarQube_ to `v8.7.1`

## [v1.2.1] - 2021-03-04

### Changed

- Fixed rendering of `SONAR*JDBC_URL for \_PostgreSQL* sub chart

## [v1.2.0] - 2021-02-16

### Changed

- Upgraded _SonarQube_ to `v8.7.0`

## [v1.1.5] - 2021-02-05

### Changed

- Fix JVM options

## [v1.1.4] - 2021-02-05

### Changed

- Upgraded _SonarQube_ to `v8.6.1`

## [v1.1.3] - 2021-02-05

### Changed

- Fixed psql connection

## [v1.1.2] - 2021-02-05

### Changed

- Fixed ingress typo

## [v1.1.1] - 2021-01-17

### Changed

- Fixed _PostgreSQL_ port number formatting error

## [v1.1.0] - 2021-01-06

### Added

- New `priorityClassName` value

## [v1.0.1] - 2020-12-18

### Changed

- Fixed issues when `postgres.enabled: true`

## [v1.0.0] - 2020-12-16

### Added

- Initial release of [SonarQube](https://www.sonarqube.org/) `v8.6.0`

<!--
RELEASE LINKS
-->
[UNRELEASED]: https://github.com/stevehipwell/helm-charts/tree/main/charts/sonarqube
[v5.4.1]: https://github.com/stevehipwell/helm-charts/releases/tag/sonarqube-5.4.1
[v5.4.0]: https://github.com/stevehipwell/helm-charts/releases/tag/sonarqube-5.4.0
[v5.3.0]: https://github.com/stevehipwell/helm-charts/releases/tag/sonarqube-5.3.0
[v5.2.1]: https://github.com/stevehipwell/helm-charts/releases/tag/sonarqube-5.2.1
[v5.2.0]: https://github.com/stevehipwell/helm-charts/releases/tag/sonarqube-5.2.0
[v5.1.0]: https://github.com/stevehipwell/helm-charts/releases/tag/sonarqube-5.1.0
[v5.0.0]: https://github.com/stevehipwell/helm-charts/releases/tag/sonarqube-5.0.0
