# Confluence Server Helm Chart Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

<!-- ## [vX.Y.Z] - UNRELEASED
### Added
### Changed
### Deprecated
### Removed -->

## [v4.7.1] - 2022-02-17

### Changed

- Update _Confluence Server_ image to [v7.16.1](https://confluence.atlassian.com/doc/confluence-7-16-release-notes-1087527591.html).

## [v4.7.0] - 2022-01-31

### Changed

- Update _Confluence Server_ image to [v7.16.0](https://confluence.atlassian.com/doc/confluence-7-16-release-notes-1087527591.html).

## [v4.6.1] - 2022-01-19

### Changed

- Update _Confluence Server_ image to [v7.15.1](https://confluence.atlassian.com/doc/confluence-7-15-release-notes-1082524339.html).

## [v4.6.0] - 2021-11-24

### Changed

- Update _Confluence Server_ image to [v7.15.0](https://confluence.atlassian.com/doc/confluence-7-15-release-notes-1082524339.html).

## [v4.5.2] - 2021-11-18

### Changed

- Update _Confluence Server_ image to [v7.14.2](https://confluence.atlassian.com/doc/confluence-7-14-release-notes-1063176411.html).

## [v4.5.1] - 2021-11-01

### Changed

- Update _Confluence Server_ image to [v7.14.1](https://confluence.atlassian.com/doc/confluence-7-14-release-notes-1063176411.html).

## [v4.5.0] - 2021-10-12

### Changed

- Update _Confluence Server_ image to [v7.14.0](https://confluence.atlassian.com/doc/confluence-7-14-release-notes-1063176411.html).
- Update embedded _PostgreSQL_ chart to [v10.12.3](https://artifacthub.io/packages/helm/bitnami/postgresql/10.12.3) (PostgreSQL v11.13.0).

## v4.4.1 - 2021-10-04

### Changed

- Update _Confluence Server_ image to [v7.13.1](https://confluence.atlassian.com/doc/confluence-7-13-release-notes-1044114085.html).

## v4.4.0 - 2021-08-23

### Changed

- Update _Confluence Server_ image to [v7.13.0](https://confluence.atlassian.com/doc/confluence-7-13-release-notes-1044114085.html).

### Removed

- Defective templating for `extraInitContainers`.

## v4.3.0 - 2021-08-11

### Added

- Pod labels via `podlabels`.
- Extra volumes via `extraVolumes` and mounts for the _confluence_ container via `extraVolumeMounts`.
- Extra init containers via `extraInitContainers`, which can be templated.

## v4.2.9 - 2021-08-03

## Changed

- Update _Confluence Server_ image to [v7.12.4](https://confluence.atlassian.com/doc/confluence-7-12-release-notes-1044092467.html)

## v4.2.8 - 2021-07-07

## Changed

- Update _Confluence Server_ image to [v7.12.3](https://confluence.atlassian.com/doc/confluence-7-12-release-notes-1044092467.html)

## v4.2.7 - 2021-07-02

### Changed

- Bump version

## v4.2.6 - 2021-07-02

### Changed

- Bump version

## v4.2.5 - 2021-06-28

### Changed

- Modify liveness probe to use TCP socket

## v4.2.4 - 2021-06-21

### Changed

- Support K8s v1.18 ingress changes
- Fixed _PostgreSQL_ support

### Removed

- Customisable ingress path (not actually supported)

## v4.2.3 - 2021-06-08

## Changed

- Upgraded _Confluence Server_ image to `v7.12.2`

## v4.2.2 - 2021-05-18

## Changed

- Upgraded _Confluence Server_ image to `v7.12.1`

## v4.2.1 - 2021-04-16

## Changed

- Use absolute reference to JDK 11 image

## v4.2.0 - 2021-04-14

## Changed

- Upgraded _Confluence Server_ image to `v7.12.0`
- Upgraded _PostgreSQL_ chart to `v10.3.17` (_PostgreSQL_ `v11.11.0`)

## v4.1.3 - 2021-03-25

## Changed

- Upgraded _Confluence Server_ image to `v7.11.2`

## v4.1.2 - 2021-03-05

## Changed

- Upgraded `Confluence Server` image to _v7.11.1_

## v4.1.1 - 2021-02-16

## Changed

- Update default JVM config

## v4.1.0 - 2021-02-03

## Changed

- Upgraded `Confluence Server` image to _v7.11.0_

## v4.0.3 - 2021-01-20

## Changed

- Upgraded `Confluence Server` image to _v7.10.2_

## v4.0.2 - 2021-01-15

### Added

- Dynamic probe configuration

## v4.0.1 - 2021-01-07

## Changed

- Upgraded `confluence-server` image to _v7.10.1_

## v4.0.0 - 2021-01-06

> **IMPORTANT** - This release is only compatible with _Helm_ v3.

## Added

- New `priorityClassName` value

## Changed

- Upgraded chart API version to `v2`

## v3.4.0 - 2020-12-16

## Changed

- Upgraded image to _v7.10.0_

## v3.3.2 - 2020-12-10

## Changed

- Upgraded image to _v7.9.3_

## v3.3.1 - 2020-11-25

## Changed

- Upgraded image to _v7.9.1_

## v3.3.0 - 2020-11-10

## Changed

- Upgraded to new minor version _v7.9_ ([release notes](https://confluence.atlassian.com/doc/confluence-7-9-release-notes-1026537698.html))
- Upgraded image to _v7.9.0_

## v3.2.2 - 2020-11-03

### Changed

- Upgraded image to _v7.8.3_

## v3.2.1 - 2020-10-13

### Changed

- Upgraded image to _v7.8.1_
- Use `.Chart.AppVersion` for default tag value

## v3.2.0 - 2020-09-29

### Changed

- Upgrade image to _v7.8.0_

## v3.1.2 - 2020-09-22

### Changed

- Upgrade image to _v7.7.4_

## v3.1.1 - 2020-09-01

### Changed

- Upgrade image to _v7.7.3_

## v3.1.0 - 2020-08-19

### Changed

- Upgrade image to _v7.7.2_

## v3.0.0 - 2020-08-05

### Changed

- Refactor chart
- Upgrade image to _v7.6.2_
