# Jira Software Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- ## [UNRELEASED]
### Added
### Changed
### Deprecated
### Removed -->

## [v4.11.0] - UNRELEASED

### Added

- Added `commonLabels` to allow the addition of labels to all resources.

### Changed

- Update _Jira Software_ image to [v8.23.0](https://confluence.atlassian.com/jirasoftware/jira-software-8-23-x-release-notes-1115656979.html).

## [v4.10.3] - 2022-05-26

### Changed

- Update _Jira Software_ image to [v8.22.3](https://confluence.atlassian.com/jirasoftware/jira-software-8-22-x-release-notes-1115656979.html).

## [v4.10.2] - 2022-04-21

### Changed

- Update _Jira Software_ image to [v8.22.2](https://confluence.atlassian.com/jirasoftware/jira-software-8-22-x-release-notes-1115656979.html).

## [v4.10.1] - 2022-03-17

### Changed

- Update _Jira Software_ image to [v8.22.1](https://confluence.atlassian.com/jirasoftware/jira-software-8-22-x-release-notes-1115656979.html).

## [v4.10.0] - 2022-02-17

### Changed

- Update _Jira Software_ image to [v8.22.0](https://confluence.atlassian.com/jirasoftware/jira-software-8-22-x-release-notes-1115656979.html).
- Update embedded _PostgreSQL_ chart to [v10.16.2](https://artifacthub.io/packages/helm/bitnami/postgresql/10.16.2) (PostgreSQL v11.14.0).

## [v4.9.1] - 2022-01-31

### Changed

- Update _Jira Software_ image to [v8.21.1](https://confluence.atlassian.com/jirasoftware/jira-software-8-21-x-release-notes-1095249705.html).

## [v4.9.0] - 2021-12-11

### Changed

- Update _Jira Software_ image to [v8.21.0](https://confluence.atlassian.com/jirasoftware/jira-software-8-21-x-release-notes-1095249705.html).

## [v4.8.2] - 2021-11-18

### Changed

- Update _Jira Software_ image to [v8.20.2](https://confluence.atlassian.com/jirasoftware/jira-software-8-20-x-release-notes-1086411771.html).

## [v4.8.1] - 2021-11-01

### Changed

- Update _Jira Software_ image to [v8.20.1](https://confluence.atlassian.com/jirasoftware/jira-software-8-20-x-release-notes-1086411771.html).

## [v4.8.0] - 2021-10-21

### Changed

- Update _Jira Software_ image to [v8.20.0](https://confluence.atlassian.com/jirasoftware/jira-software-8-20-x-release-notes-1086411771.html).
- Update embedded _PostgreSQL_ chart to [v10.12.6](https://artifacthub.io/packages/helm/bitnami/postgresql/10.12.6) (PostgreSQL v11.13.0).

## [4.7.1] - 2021-09-16

## Changed

- Update _Jira Software_ image to [v8.19.1](https://confluence.atlassian.com/jirasoftware/jira-software-8-19-x-release-notes-1082526044.html).
- Update embedded _PostgreSQL_ chart to [v10.9.6](https://artifacthub.io/packages/helm/bitnami/postgresql/10.9.6) (PostgreSQL v11.13.0).

## [4.7.0] - 2021-08-27

### Changed

- Update _Jira Software_ image to [v8.19.0](https://confluence.atlassian.com/jirasoftware/jira-software-8-19-x-release-notes-1082526044.html).
- Update embedded _PostgreSQL_ chart to [v10.9.4](https://artifacthub.io/packages/helm/bitnami/postgresql/10.9.4) (PostgreSQL v11.13.0).

## [4.6.2] - 2021-08-26

### Removed

- Defective templating for `extraInitContainers`.

## v4.6.1 - 2021-08-19

### Changed

- Update _Jira Software_ image to [v8.18.2](https://confluence.atlassian.com/jirasoftware/jira-software-8-18-x-release-notes-1064094444.html).

## v4.6.0 - 2021-08-11

### Added

- Pod labels via `podlabels`.
- Extra volumes via `extraVolumes` and mounts for the _jira_ container via `extraVolumeMounts`.
- Extra init containers via `extraInitContainers`, which can be templated.

## v4.5.2 - 2021-07-23

### Changed

- Update _Jira Software_ image to [v8.18.1](https://confluence.atlassian.com/jirasoftware/jira-software-8-18-x-release-notes-1064094444.html)

## v4.5.1 - 2021-07-02

> **NOTE** - Republished chart.

### Changed

- Update _Jira Software_ image to [v8.18.0](https://confluence.atlassian.com/jirasoftware/jira-software-8-18-x-release-notes-1064094444.html)

## v4.5.0 - 2021-07-02

### Changed

- Update _Jira Software_ image to [v8.18.0](https://confluence.atlassian.com/jirasoftware/jira-software-8-18-x-release-notes-1064094444.html)

## v4.4.4 - 2021-06-28

### Changed

- Modify liveness probe to use TCP socket

## v4.4.3 - 2021-06-23

### Changed

- Fix ingress template

## v4.4.2 - 2021-06-21

### Changed

- Support K8s v1.18 ingress changes
- Fixed _PostgreSQL_ support

### Removed

- Customisable ingress path (not actually supported)

## v4.4.1 - 2021-06-16

### Changed

- Upgraded _Jira_ image to `v8.17.1`

## v4.4.0 - 2021-05-19

### Changed

- Upgraded _Jira_ image to `v8.17.0`

## v4.3.1 - 2021-04-20

### Changed

- Upgraded _Jira_ image to _v8.16.1_

## v4.3.0 - 2021-04-16

### Changed

- Default to JDK 11 image
- Upgraded _PostgreSQL_ chart to `v10.3.17` (_PostgreSQL_ `v11.11.0`)

## v4.2.0 - 2021-03-24

### Changed

- Upgraded _Jira_ image to _v8.16.0_

## v4.1.1 - 2021-02-16

### Changed

- Update default JVM config

## v4.1.0 - 2021-02-02

### Changed

- Upgraded _Jira_ image to _v8.15.0_

## v4.0.2 - 2021-01-15

### Added

- Dynamic probe configuration

## v4.0.1 - 2021-01-15

### Changed

- Upgraded _Jira_ image to _v8.14.1_

## v4.0.0 - 2021-01-06

> **IMPORTANT** - This release is only compatible with _Helm_ v3.

## Added

- New `priorityClassName` value

### Changed

- Upgraded chart API version to `v2`

## v3.3.0 - 2020-11-19

### Changed

- Upgrade image to _v8.14.0_

## v3.2.0 - 2020-11-03

### Changed

- Upgrade image to _v8.13.1_
- Use `.Chart.AppVersion` for default tag value

## v3.2.0 - 2020-10-08

### Changed

- Upgrade image to _v8.13.0_

## v3.1.3 - 2020-10-07

### Changed

- Upgrade image to _v8.12.3_

## v3.1.2 - 2020-09-22

### Changed

- Upgrade image to _v8.12.2_

## v3.1.1 - 2020-09-08

### Changed

- Upgrade image to _v8.12.1_

## v3.1.0 - 2020-08-28

### Changed

- Upgrade image to _v8.12.0_

## v3.0.1 - 2020-08-19

### Changed

- Upgrade image to _v8.11.1_

## v3.0.0 - 2020-08-05

### Changed

- Refactor chart
- Upgrade image to _v8.11.0_
