# SonarQube Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

<!-- ## [UNRELEASED]
### Added
### Changed
### Deprecated
### Removed -->

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

## Changed

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

## Added

- New `priorityClassName` value

## [v1.0.1] - 2020-12-18

### Changed

- Fixed issues when `postgres.enabled: true`

## [v1.0.0] - 2020-12-16

### Added

- Initial release of [SonarQube](https://www.sonarqube.org/) `v8.6.0`
