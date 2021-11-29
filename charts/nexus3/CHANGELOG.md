# Nexus 3 Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

<!-- ## [UNRELEASED]
### Added
### Changed
### Deprecated
### Removed -->

## [v4.10.0] - 2021-11-29

### Changed

- Update `Nexus3` image to [v3.37.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2021-release-notes/nexus-repository-3.37.0-release-notes).

## [v4.9.0] - 2021-10-29

### Changed

- Update `Nexus3` image to [v3.36.0](https://help.sonatype.com/repomanager3/release-notes/2021-release-notes/nexus-repository-3.36.0-release-notes).

## [v4.8.0] - 2021-10-13

### Changed

- Update `Nexus3` image to [v3.35.0](https://help.sonatype.com/repomanager3/release-notes/2021-release-notes/nexus-repository-3.35.0-release-notes).

## [v4.7.1] - 2021-10-04

### Changed

- Update `Nexus3` image to [v3.34.1](https://help.sonatype.com/repomanager3/release-notes/2021-release-notes/nexus-repository-3.34.0---3.34.1-release-notes).
- Improve configuration logging output.

## [v4.7.0] - 2021-09-01

### Changed

- Update `Nexus3` image to [v3.34.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.34.0-01).

## [v4.6.2] - 2021-08-26

### Removed

- Defective templating for `extraInitContainers`.

## v4.6.1 - 2021-08-19

### Changed

- Updated `Nexus3` image to [v3.33.1](https://help.sonatype.com/repomanager3/release-notes#ReleaseNotes-NexusRepositoryManager3.33.1).

## v4.6.0 - 2021-08-11

### Added

- Extra init containers via `extraInitContainers`, which can be templated.

## v4.5.0 - 2021-08-05

### Changed

- Updated `Nexus3` image to [v3.33.0](https://help.sonatype.com/repomanager3/release-notes#ReleaseNotes-NexusRepositoryManager3.33.0)

## v4.4.0 - 2021-07-09

### Changed

- Updated `Nexus3` image to [v3.32.0](https://help.sonatype.com/repomanager3/release-notes#ReleaseNotes-NexusRepositoryManager3.32.0)

## v4.3.1 - 2021-06-23

### Changed

- Upgraded `Nexus3` image to `v3.31.1`

## v4.3.0 - 2021-06-21

### Changed

- Upgraded `Nexus3` image to `v3.31.0`
- Support K8s v1.18 ingress changes

### Removed

- Customisable ingress path (not actually supported)

## v4.2.1 - 2021-04-23

### Changed

- Upgraded `Nexus3` image to _v3.30.1_

## v4.2.0 - 2021-03-05

### Added

- Support `podLabels` configuration for _Azure AD Identity_

## v4.1.0 - 2021-03-05

### Changed

- Upgraded `Nexus3` image to _v3.30.0_

## v4.0.3 - 2021-02-05

### Changed

- Fixed regex when S3 blobstore is used

## v4.0.2 - 2021-01-15

### Added

- Dynamic probe configuration

### Changed

- Fixed typo in LDAP configuration

## v4.0.1 - 2021-01-08

### Changed

- Upgraded `nexus3` image to _v3.29.2_

## v4.0.0 - 2021-01-06

> **IMPORTANT** - This release is only compatible with _Helm_ v3.

## Added

- New `priorityClassName` value

## Changed

- Upgraded chart API version to `v2`

## v3.4.2 - 2021-01-04

### Changed

- Upgraded image to _v3.29.1_

## v3.4.1 - 2020-12-14

### Changed

- Re-ordered configure.sh so that metrics are configured after roles

## v3.4.0 - 2020-12-07

### Changed

- Upgraded image to _v3.29.0_

## v3.3.6 - 2020-12-02

### Changed

- Re-ordered configure.sh so that roles are configured after repos
- Removed background execution from configure.sh
- Replaced container command and args with a lifecycle postStart hook

## v3.3.5 - 2020-12-01

### Changed

- Re-ordered config so that roles are configured after repos
- Updated documentation for `repoCredentials`

## v3.3.4 - 2020-11-30

### Changed

- Updated config script to not require jq

## v3.3.3 - 2020-11-28

### Changed

- Fixed bug in repo credential support

## v3.3.2 - 2020-11-23

### Added

- Added support for repo credentials

## v3.3.1 - 2020-10-20

### Changed

- Upgraded image to _v3.28.1_
- Use `.Chart.AppVersion` for default tag value

## v3.3.0 - 2020-10-02

### Changed

- Upgraded image to _v3.28.0_

## v3.2.2- 2020-10-01

### Changed

- Use custom logback config with customizable retention

## v3.2.2- 2020-09-30

### Changed

- Fixed configure script when on non-first runs

## v3.2.1 - 2020-09-21

### Changed

- Allow boolean attributes to be set for tasks

## v3.2.0 - 2020-09-04

### Changed

- Upgraded image to _v3.27.0_

## v3.1.3 - 2020-09-02

### Changed

- n/a

## v3.1.2 - 2020-08-17

### Changed

- Upgraded image to _v3.26.1_

## v3.1.1 - 2020-08-11

### Added

- New `envVars.jvmAdditionalOptions` value

### Changed

- Replaced `envVars.jvmMaxDirectMemorySize` with `envVars.jvmAdditionalMemoryOptions`

## v3.1.0 - 2020-08-11

### Changed

- Upgraded image to _v3.26.0_

## v3.0.0 - 2020-08-05

### Added

- Image pull secret support
- Service account creation or selection
- Service account annotations
- Service annotations
- PVC annotations
- Role configuration supported

### Changed

- Upgraded image to _v3.25.1_
- Better documentation of values
- Changed default service port to `8081` which matches the container port
- Changed the way the JVM heap is configured to align with the [Nexus 3 docs](https://help.sonatype.com/repomanager3/installation/system-requirements#SystemRequirements-Memory), use `env.jvmMinHeapSize` & `env.jvmMaxHeapSize`
- Renamed `securityContext` to `podSecurityContext` (`securityContext` now refers to the security context of the main container)
- Require `caCerts.enabled` to be set to `true` to use provided certs
- Configuration updated to use REST API where possible
- LDAP config values have changed
- Cleanup script has been updated to work correctly on _Nexus v3.25.0_
- Repo script has been updated to work correctly on _Nexus v3.25.0_

### Removed

- Support of RAM percentage in the JVM configuration (see changed section above)
