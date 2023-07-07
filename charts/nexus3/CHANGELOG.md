# Nexus 3 Helm Chart Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

<!--
## [UNRELEASED]

### Added - For new features.
### Changed - For changes in existing functionality.
### Deprecated - For soon-to-be removed features.
### Removed - For now removed features.
### Fixed - For any bug fixes.
### Security - In case of vulnerabilities.
-->

## [v4.31.0] - 2023-07-07

### Changed

- Updated the _Nexus3_ OCI image to [v3.57.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2023-release-notes/sonatype-nexus-repository-3.57.0-release-notes) ([GH release](https://github.com/sonatype/nexus-public/releases/tag/release-3.57.0-01)).

## [v4.30.0] - 2023-06-20

### Changed

- Updated the _Nexus3_ OCI image to [v3.56.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2023-release-notes/sonatype-nexus-repository-3.56.0-release-notes) ([GH release](https://github.com/sonatype/nexus-public/releases/tag/release-3.56.0-01)).

## [v4.29.0] - 2023-06-06

### All Changes

- Updated the _Nexus3_ OCI image to [v3.55.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2023-release-notes/sonatype-nexus-repository-3.55.0-release-notes) ([GH release](https://github.com/sonatype/nexus-public/releases/tag/release-3.55.0-01)).

## [v4.28.0] - 2023-05-24

### All Changes

- Updated the _Nexus3_ OCI image to [v3.54.1](https://help.sonatype.com/repomanager3/product-information/release-notes/2023-release-notes/sonatype-nexus-repository-3.54.0---3.54.1-release-notes) ([GH release](https://github.com/sonatype/nexus-public/releases/tag/release-3.54.1-01)).

## [v4.27.1] - 2023-05-16

### All Changes

- Updated the _Nexus3_ image to [v3.53.1](https://help.sonatype.com/repomanager3/product-information/release-notes/2023-release-notes/sonatype-nexus-repository-3.53.0---3.53.1-release-notes) ([GH release](https://github.com/sonatype/nexus-public/releases/tag/release-3.53.1-02)).

## [v4.27.0] - 2023-05-03

### All Changes

- Updated the _Nexus3_ image to [v3.53.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2023-release-notes/sonatype-nexus-repository-3.53.0-release-notes) ([GH release](https://github.com/sonatype/nexus-public/releases/tag/release-3.53.0-01)).

## [v4.26.0] - 2023-04-25

### All Changes

- Updated the _Nexus3_ image to [v3.52.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2023-release-notes/sonatype-nexus-repository-3.52.0-release-notes) ([GH release](https://github.com/sonatype/nexus-public/releases/tag/release-3.52.0-01)).

## [v4.25.0] - 2023-04-12

### All Changes

- Updated the _Nexus3_ image to [v3.51.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2023-release-notes/sonatype-nexus-repository-3.51.0-release-notes) ([GH release](https://github.com/sonatype/nexus-public/releases/tag/release-3.51.0-01)).

## [v4.24.0] - 2023-03-27

### All Changes

- Updated the _Nexus3_ image to [v3.50.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2023-release-notes/sonatype-nexus-repository-3.50.0-release-notes) ([GH release](https://github.com/sonatype/nexus-public/releases/tag/release-3.50.0-01)).
- Added support for `topologySpreadConstraints` with a default `labelSelector` for the release pods.
- Added a default `labelSelector` for the release pods to `affinity.podAffinity` & `affinity.podAntiAffinity`.

## [v4.23.0] - 2023-03-07

### All Changes

- Updated the _Nexus3_ image to [v3.49.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2023-release-notes/sonatype-nexus-repository-3.49.0-release-notes) ([GH release](https://github.com/sonatype/nexus-public/releases/tag/release-3.49.0-02)).

## [v4.22.0] - 2023-02-28

### All Changes

- Updated the _Nexus3_ image to [v3.48.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2023-release-notes/sonatype-nexus-repository-3.48.0-release-notes) ([GH release](https://github.com/sonatype/nexus-public/releases/tag/release-3.48.0-01)).

## [v4.21.1] - 2023-02-13

### All Changes

- Updated the _Nexus3_ image to [v3.47.1](https://help.sonatype.com/repomanager3/product-information/release-notes/2023-release-notes/nexus-repository-3.47.0---3.47.1-release-notes) ([GH release](https://github.com/sonatype/nexus-public/releases/tag/release-3.47.1-01)).

## [v4.21.0] - 2023-02-08

### All Changes

- Updated the _Nexus3_ image to [v3.47.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2023-release-notes/nexus-repository-3.47.0-release-notes) ([GH release](https://github.com/sonatype/nexus-public/releases/tag/release-3.47.0-01)).

## [v4.20.0] - 2023-01-31

### All Changes

- Updated the _Nexus3_ image to [v3.46.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2023-release-notes/nexus-repository-3.46.0-release-notes) ([GH release](https://github.com/sonatype/nexus-public/releases/tag/release-3.46.0-01)).
- Added `testResources` value to enable automated chart testing.

## [v4.19.0] - 2023-01-18

### All Changes

- Changed root password implementation to use `NEXUS_SECURITY_INITIAL_PASSWORD` instead of scripting.
- Added `rootPassword.secret` & `rootPassword.key` to replace `config.rootPassword.secret` & `config.rootPassword.key` as these can be used without needing the configuration script.
- Deprecated `config.rootPassword.secret` & `config.rootPassword.key`.
- Removed accidentally included `nexus-repository-composer` plugin.

## [v4.18.1] - 2023-01-18

### All Changes

- Updated the _Nexus3_ image to [v3.45.1](https://help.sonatype.com/repomanager3/product-information/release-notes/2022-release-notes/nexus-repository-3.45.0---3.45.1-release-notes) ([GH release](https://github.com/sonatype/nexus-public/releases/tag/release-3.45.1-SNAPSHOT)).

## [v4.18.0] - 2022-12-29

### All Changes

- Updated the _Nexus3_ image to [v3.45.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2022-release-notes/nexus-repository-3.45.0-release-notes) ([GH release](https://github.com/sonatype/nexus-public/releases/tag/release-3.45.0-01)).

## [v4.17.0] - 2022-12-16

### All Changes

- Updated the _Nexus3_ image to [v3.44.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2022-release-notes/nexus-repository-3.44.0-release-notes) ([GH release](https://github.com/sonatype/nexus-public/releases/tag/release-3.44.0-01)).
- Added a new `serviceAccount.labels` value to add labels to the `ServiceAccount`.

## [v4.16.0] - 2022-11-09

### All Changes

- Updated the _Nexus3_ image to [v3.43.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2022-release-notes/nexus-repository-3.43.0-release-notes) ([GH release](https://github.com/sonatype/nexus-public/releases/tag/release-3.43.0-01)).

## [v4.15.0] - 2022-10-03

### All Changes

- Updated _Nexus3_ image to [v3.42.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2022-release-notes/nexus-repository-3.42.0-release-notes).
- Fixed missing volumes when using the `StatefulSet` mode.

## [v4.14.1] - 2022-08-22

### Changed

- Updated _Nexus3_ image to [v3.41.1](https://help.sonatype.com/repomanager3/product-information/release-notes/2022-release-notes/nexus-repository-3.41.0---3.41.1-release-notes).

## [v4.14.0] - 2022-08-01

### Changed

- Update _Nexus3_ image to [v3.41.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2022-release-notes/nexus-repository-3.41.0-release-notes).

## [v4.13.1] - 2022-06-28

### Changed

- Update _Nexus3_ image to [v3.40.1](https://help.sonatype.com/repomanager3/product-information/release-notes/2022-release-notes/nexus-repository-3.40.0---3.40.1-release-notes).

## [v4.13.0] - 2022-06-23

### Added

- Added explicit namespace declaration in templates.
- Added support for running Nexus3 as a `StatefulSet` by setting `deployment` to `false`.
- Added `terminationGracePeriodSeconds`.
- Added `service.clusterIP` to enable making the `Service` headless.
- Added `serviceAccount.automountToken` to default token binding to `false`.

### Changed

- Update _Nexus3_ image to [v3.40.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2022-release-notes/nexus-repository-3.40.0-release-notes).

## [v4.12.2] - 2022-06-06

### Changed

- Allow opting out of the `chown` init container by setting `chownDataDir` to `false`.

## [v4.12.1] - 2022-05-24

### Changed

- Fix blob store type lookup when S3 soft quota is specified.

## [v4.12.0] - 2022-05-23

### Added

- Added `commonLabels` to allow the addition of labels to all resources.

### Changed

- Update _Nexus3_ image to [v3.39.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2022-release-notes/nexus-repository-3.39.0-release-notes).

## [v4.11.1] - 2022-03-29

### Changed

- Update _Nexus3_ image to [v3.38.1](https://help.sonatype.com/repomanager3/product-information/release-notes/2022-release-notes/nexus-repository-3.38.0---3.38.1-release-notes#NexusRepository3.38.03.38.1ReleaseNotes-3381).
- Fix users configuration.

## [v4.11.0] - 2022-03-07

### Added

- Added `metrics.serviceMonitor.endpointConfig` to allow customisation of the `ServiceMonitor` endpoint.
- Added `config.anonymous.roles` to allow the anonymous user's roles to be configured.
- Added `config.users` to enable users to be configured, new users will get a random password.
- Added `imagePullSecrets` to replace `image.pullSecrets`.
- **EXPERIMENTAL** support for installing Nexus3 plugins via the `plugins` value.

### Changed

- Update _Nexus3_ image to [v3.38.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2022-release-notes/nexus-repository-3.38.0-release-notes).
- Configure script now explicitly uses `/bin/bash`.
- All `beta` APIs use in the configuration have been updated to `v1`.
- Make it clearer that the `rootPassword` config is required if config is enabled.

### Deprecated

- Deprecated `metrics.serviceMonitor.interval` in favour of `metrics.serviceMonitor.endpointConfig.interval`.
- Deprecated `image.pullSecrets` in favour of the idiomatic `imagePullSecrets`.

### Removed

- Removed chart default for `metrics.serviceMonitor.interval`, the interval should be the _Prometheus_ default if not overridden.
- Removed using the image pull policy for init containers.

## [v4.10.2] - 2022-01-04

### Changed

- Update `Nexus3` image to [v3.37.3](https://help.sonatype.com/repomanager3/product-information/release-notes/2021-release-notes/nexus-repository-3.37.0---3.37.3-release-notes).

## [v4.10.1] - 2021-12-21

### Changed

- Update `Nexus3` image to [v3.37.1](https://help.sonatype.com/repomanager3/product-information/release-notes/2021-release-notes/nexus-repository-3.37.0-release-notes).

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
