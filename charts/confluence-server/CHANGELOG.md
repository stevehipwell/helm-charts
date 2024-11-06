# Confluence Server Helm Chart Changelog

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

> [!IMPORTANT]
> If you're using a `StatefulSet` and upgrading to this version you will need to run `kubectl --namespace <namespace> delete statefulset <name> --cascade=orphan` before upgrading as there was a bug in previous versions of this chart that incorrectly labeled the volume claim template.

### Fixed

- Fixed incorrect labeling on the volume claim template. ([#1067](https://github.com/stevehipwell/helm-charts/pull/1067)) _@stevehipwell_

## [v5.7.1] - 2024-01-16

> [!CAUTION]
> _Confluence_ [v8.7](https://confluence.atlassian.com/doc/confluence-8-7-release-notes-1318391277.html) is not a LTS release and there will be no further LTS releases that support the _Confluence Server_ licence.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.7.2](https://confluence.atlassian.com/doc/confluence-8-7-release-notes-1318391277.html).

## [v5.7.0] - 2023-12-06

> [!CAUTION]
> _Confluence_ [v8.7](https://confluence.atlassian.com/doc/confluence-8-7-release-notes-1318391277.html) is not a LTS release and there will be no further LTS releases that support the _Confluence Server_ licence.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.7.1](https://confluence.atlassian.com/doc/confluence-8-7-release-notes-1318391277.html).

## [v5.6.2] - 2023-10-31

> [!CAUTION]
> _Confluence_ [v8.6](https://confluence.atlassian.com/doc/confluence-8-6-release-notes-1289421595.html) is not a LTS release and there will be no further LTS releases that support the _Confluence Server_ licence.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.6.1](https://confluence.atlassian.com/doc/confluence-8-6-release-notes-1289421595.html).

## [v5.6.1] - 2023-10-20

> [!CAUTION]
> _Confluence_ [v8.6](https://confluence.atlassian.com/doc/confluence-8-6-release-notes-1289421595.html) is not a LTS release and there will be no further LTS releases that support the _Confluence Server_ licence.

### Fixed

- Fixed incorrect _PostgreSQL_ sub chart template names.

## [v5.6.0] - 2023-10-06

> [!CAUTION]
> _Confluence_ [v8.6](https://confluence.atlassian.com/doc/confluence-8-6-release-notes-1289421595.html) is not a LTS release and there will be no further LTS releases that support the _Confluence Server_ licence.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.6.0](https://confluence.atlassian.com/doc/confluence-8-6-release-notes-1289421595.html).
- Updated the embedded _PostgreSQL_ chart to [v12.12.10](https://artifacthub.io/packages/helm/bitnami/postgresql/12.12.10) (PostgreSQL v15.4.0).

## [v5.5.16] - 2024-11-06

> [!IMPORTANT]
> _Confluence_ [v8.5](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html) is the last LTS release that supports the _Confluence Server_ licence.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.5.17](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html).

## [v5.5.15] - 2024-10-07

> [!IMPORTANT]
> _Confluence_ [v8.5](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html) is the last LTS release that supports the _Confluence Server_ licence.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.5.16](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html).

## [v5.5.14] - 2024-09-03

> [!IMPORTANT]
> _Confluence_ [v8.5](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html) is the last LTS release that supports the _Confluence Server_ licence.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.5.15](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html).

## [v5.5.13] - 2024-07-04

> [!IMPORTANT]
> _Confluence_ [v8.5](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html) is the last LTS release that supports the _Confluence Server_ licence.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.5.14](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html).

## [v5.5.12] - 2024-07-04

> [!IMPORTANT]
> _Confluence_ [v8.5](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html) is the last LTS release that supports the _Confluence Server_ licence.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.5.12](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html).

## [v5.5.11] - 2024-06-13

> [!IMPORTANT]
> _Confluence_ [v8.5](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html) is the last LTS release that supports the _Confluence Server_ licence.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.5.11](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html).

## [v5.5.10] - 2024-06-10

> [!IMPORTANT]
> _Confluence_ [v8.5](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html) is the last LTS release that supports the _Confluence Server_ licence.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.5.10](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html).

## [v5.5.9] - 2024-05-09

> [!IMPORTANT]
> _Confluence_ [v8.5](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html) is the last LTS release that supports the _Confluence Server_ licence.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.5.9](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html).
- Updated the _PostgreSQL_ dependency ot come from an OCI registry.
- Switched to using the port name for ingress.

## [v5.5.8] - 2024-04-02

> [!IMPORTANT]
> _Confluence_ [v8.5](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html) is the last LTS release that supports the _Confluence Server_ licence.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.5.8](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html).

## [v5.5.7] - 2024-03-05

> [!IMPORTANT]
> _Confluence_ [v8.5](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html) is the last LTS release that supports the _Confluence Server_ licence.

### Added

- Added a call to `/shutdown-wait.sh` from the pre-stop lifecycle hook.
- Added support for overriding the `JVM_RESERVED_CODE_CACHE_SIZE` env variable via the `envVars.jvmReservedCodeCacheSize` value.
- Added support for setting the `ATL_FORCE_CFG_UPDATE` env variable via the `envVars.forceConfigUpdate` value.
- Added support for setting the `SET_PERMISSIONS` env variable via the `envVars.setPermissions` value.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.5.7](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html).
- Changed the default image repository to [docker.io/atlassian/confluence](https://hub.docker.com/r/atlassian/confluence).
- Changed the default for `envVars.jvmAdditionalMemoryOptions` to be empty.

## [v5.5.6] - 2024-02-12

> [!IMPORTANT]
> _Confluence_ [v8.5](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html) is the last LTS release that supports the _Confluence Server_ licence.
> 
### Changed

- Updated the _Confluence Server_ OCI image to [v8.5.6](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html); this release also changes the JDK version to `v17`.

## [v5.5.5] - 2024-01-23

> [!IMPORTANT]
> _Confluence_ [v8.5](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html) is the last LTS release that supports the _Confluence Server_ licence.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.5.5](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html).

## [v5.5.4] - 2024-01-23

> [!IMPORTANT]
> _Confluence_ [v8.5](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html) is the last LTS release that supports the _Confluence Server_ licence.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.5.4](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html).

## [v5.5.3] - 2024-01-23

> [!IMPORTANT]
> _Confluence_ [v8.5](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html) is the last LTS release that supports the _Confluence Server_ licence.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.5.3](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html).
- Updated the embedded _PostgreSQL_ chart to [v12.12.10](https://artifacthub.io/packages/helm/bitnami/postgresql/12.12.10) (PostgreSQL v15.4.0).

## [v5.5.2] - 2023-10-06

> [!IMPORTANT]
> _Confluence_ [v8.5](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html) is the last LTS release that supports the _Confluence Server_ licence.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.5.2](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html).

## [v5.5.1] - 2023-09-06

> [!IMPORTANT]
> _Confluence_ [v8.5](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html) is the last LTS release that supports the _Confluence Server_ licence.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.5.1](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html).

## [v5.5.0] - 2023-08-31

> [!IMPORTANT]
> _Confluence_ [v8.5](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html) is the last LTS release that supports the _Confluence Server_ licence.

### Added

- Added support for deleting `StatefulSet` PVCs on deletion in Kubernetes v1.27 or newer via the `persistence.retainDeleted` value which defaults to `true` to match the existing behaviour.

### Changed

- Updated the _Confluence Server_ OCI image to [v8.5.0](https://confluence.atlassian.com/doc/confluence-8-5-release-notes-1252010185.html).

## [v5.4.2] - 2023-08-16

### Changed

- Updated the _Confluence Server_ OCI image to [v8.4.2](https://confluence.atlassian.com/doc/confluence-8-4-release-notes-1251411547.html).

## [v5.4.1] - 2023-08-02

### Changed

- Updated the _Confluence Server_ OCI image to [v8.4.1](https://confluence.atlassian.com/doc/confluence-8-4-release-notes-1251411547.html).

## [v5.4.0] - 2023-07-07

### Changed

- Updated the _Confluence Server_ OCI image to [v8.4.0](https://confluence.atlassian.com/doc/confluence-8-4-release-notes-1251411547.html).

## [v5.3.2] - 2023-06-21

### Changed

- Updated the _Confluence Server_ OCI image to [v8.3.2](https://confluence.atlassian.com/doc/confluence-8-3-release-notes-1236928237.html).

## [v5.3.1] - 2023-06-08

### Changed

- Updated the _Confluence Server_ OCI image to [v8.3.1](https://confluence.atlassian.com/doc/confluence-8-3-release-notes-1236928237.html).

## [v5.3.0] - 2023-05-23

### All Changes

- Updated the _Confluence Server_ OCI image to [v8.3.0](https://confluence.atlassian.com/doc/confluence-8-3-release-notes-1236928237.html).

## [v5.2.3] - 2023-05-17

### All Changes

- Updated the _Confluence Server_ image to [v8.2.3](https://confluence.atlassian.com/doc/confluence-8-2-release-notes-1216971744.html).

## [v5.2.2] - 2023-04-26

### All Changes

- Updated the _Confluence Server_ image to [v8.2.2](https://confluence.atlassian.com/doc/confluence-8-2-release-notes-1216971744.html).

## [v5.2.1] - 2023-04-14

### All Changes

- Updated the _Confluence Server_ image to [v8.2.1](https://confluence.atlassian.com/doc/confluence-8-2-release-notes-1216971744.html).

## [v5.2.0] - 2023-03-31

### All Changes

- Updated the _Confluence Server_ image to [v8.2.0](https://confluence.atlassian.com/doc/confluence-8-2-release-notes-1216971744.html).

## [v5.1.2] - 2023-03-24

### All Changes

- Updated the _Confluence Server_ image to [v8.1.3](https://confluence.atlassian.com/doc/confluence-8-1-release-notes-1206791873.html).
- Added support for `topologySpreadConstraints` with a default `labelSelector` for the release pods.
- Added a default `labelSelector` for the release pods to `affinity.podAffinity` & `affinity.podAntiAffinity`.

## [v5.1.1] - 2023-03-01

### All Changes

- Updated the _Confluence Server_ image to [v8.1.1](https://confluence.atlassian.com/doc/confluence-8-1-release-notes-1206791873.html).

## [v5.1.0] - 2023-02-13

### All Changes

- Updated the _Confluence Server_ image to [v8.1.0](https://confluence.atlassian.com/doc/confluence-8-1-release-notes-1206791873.html).

## [v5.0.4] - 2023-02-13

### All Changes

- Updated the _Confluence Server_ image to [v8.0.4](https://confluence.atlassian.com/doc/confluence-8-0-release-notes-1127254402.html).

## [v5.0.3] - 2023-01-25

### All Changes

- Updated the _Confluence Server_ image to [v8.0.3](https://confluence.atlassian.com/doc/confluence-8-0-release-notes-1127254402.html).

## [v5.0.2] - 2022-12-29

### All Changes

- Updated the _Confluence Server_ image to [v8.0.2](https://confluence.atlassian.com/doc/confluence-8-0-release-notes-1127254402.html).

## [v5.0.1] - 2022-12-14

### All Changes

- Updated the _Confluence Server_ image to [v8.0.1](https://confluence.atlassian.com/doc/confluence-8-0-release-notes-1127254402.html).

## [v5.0.0] - 2022-11-29

> [!CAUTION]
> **BREAKING CHANGE** -If you're upgrading to this version you need to set `deployment` to `true` otherwise you might lose your data.

### All Changes

- Updated the _Confluence Server_ image to [v8.0.0](https://confluence.atlassian.com/doc/confluence-8-0-release-notes-1127254402.html).
- Updated the embedded _PostgreSQL_ chart to [v11.9.13](https://artifacthub.io/packages/helm/bitnami/postgresql/11.9.13) (PostgreSQL v14.5.0).
- Changed default behaviour to use a `StatefulSet` instead of a `Deployment`, the legacy behaviour can be enabled by setting `deployment` to `true`.

## [v4.11.2] - 2022-11-16

### All Changes

- Updated the _Confluence Server_ image to [v7.20.2](https://confluence.atlassian.com/doc/confluence-7-20-release-notes-1142251039.html).

## [v4.11.1] - 2022-10-26

### All Changes

- Updated the _Confluence Server_ image to [v7.20.1](https://confluence.atlassian.com/doc/confluence-7-20-release-notes-1142251039.html).

## [v4.11.0] - 2022-10-06

### All Changes

- Updated the _Confluence Server_ image to [v7.20.0](https://confluence.atlassian.com/doc/confluence-7-20-release-notes-1142251039.html).
- Updated the embedded _PostgreSQL_ chart to [v11.9.7](https://artifacthub.io/packages/helm/bitnami/postgresql/11.9.7) (PostgreSQL v14.5.0).

## [v4.10.2] - 2022-10-03

### All Changes

- Updated the _Confluence Server_ image to [v7.19.2](https://confluence.atlassian.com/doc/confluence-7-19-release-notes-1141976784.html).

## [v4.10.1] - 2022-08-26

### Changed

- Updated _Confluence Server_ image to [v7.19.1](https://confluence.atlassian.com/doc/confluence-7-19-release-notes-1141976784.html).

## [v4.10.0] - 2022-08-02

### Added

- Added support for running _Confluence Server_ as a `StatefulSet` by setting `deployment` to `false`.
- Added `service.clusterIP` to enable making the `Service` headless.
- Added explicit namespace declaration in templates.
- Added `imagePullSecrets` to replace `image.pullSecrets`.
- Added `terminationGracePeriodSeconds`.
- Added `serviceAccount.automountToken` to default token binding to `false`.

### Changed

- Updated _Confluence Server_ image to [v7.19.0](https://confluence.atlassian.com/doc/confluence-7-19-release-notes-1141976784.html).
- Updated embedded _PostgreSQL_ chart to [v11.6.21](https://artifacthub.io/packages/helm/bitnami/postgresql/11.6.21) (PostgreSQL v14.4.0).

## [v4.9.2] - 2022-07-12

### Changed

- Update _Confluence Server_ image to [v7.18.3](https://confluence.atlassian.com/doc/confluence-7-18-release-notes-1115677302.html).

## [v4.9.1] - 2022-06-22

### Changed

- Update _Confluence Server_ image to [v7.18.2](https://confluence.atlassian.com/doc/confluence-7-18-release-notes-1115677302.html).

## [v4.9.0] - 2022-06-06

### Added

- Added `commonLabels` to allow the addition of labels to all resources.

### Changed

- Update _Confluence Server_ image to [v7.18.1](https://confluence.atlassian.com/doc/confluence-7-18-release-notes-1115677302.html).
- Update embedded _PostgreSQL_ chart to [v11.6.3](https://artifacthub.io/packages/helm/bitnami/postgresql/11.6.3) (PostgreSQL v14.3.0).

## [v4.8.3] - 2022-05-27

### Changed

- Update _Confluence Server_ image to [v7.17.3](https://confluence.atlassian.com/doc/confluence-7-17-release-notes-1108683391.html).
- Fixed BYO PostgreSQL connection string type bug.

## [v4.8.2] - 2022-05-12

### Changed

- Update _Confluence Server_ image to [v7.17.2](https://confluence.atlassian.com/doc/confluence-7-17-release-notes-1108683391.html).

## [v4.8.1] - 2022-04-07

### Changed

- Update _Confluence Server_ image to [v7.17.1](https://confluence.atlassian.com/doc/confluence-7-17-release-notes-1108683391.html).

## [v4.8.0] - 2022-03-23

### Changed

- Update _Confluence Server_ image to [v7.17.0](https://confluence.atlassian.com/doc/confluence-7-17-release-notes-1108683391.html).
- Update embedded _PostgreSQL_ chart to [v11.1.9](https://artifacthub.io/packages/helm/bitnami/postgresql/11.1.9) (PostgreSQL v14.2.0).

## [v4.7.3] - 2022-03-15

### Changed

- Update _Confluence Server_ image to [v7.16.3](https://confluence.atlassian.com/doc/confluence-7-16-release-notes-1087527591.html).

## [v4.7.2] - 2022-03-06

### Changed

- Update _Confluence Server_ image to [v7.16.2](https://confluence.atlassian.com/doc/confluence-7-16-release-notes-1087527591.html).

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

### Changed

- Update _Confluence Server_ image to [v7.12.4](https://confluence.atlassian.com/doc/confluence-7-12-release-notes-1044092467.html)

## v4.2.8 - 2021-07-07

### Changed

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

### Changed

- Upgraded _Confluence Server_ image to `v7.12.2`

## v4.2.2 - 2021-05-18

### Changed

- Upgraded _Confluence Server_ image to `v7.12.1`

## v4.2.1 - 2021-04-16

### Changed

- Use absolute reference to JDK 11 image

## v4.2.0 - 2021-04-14

### Changed

- Upgraded _Confluence Server_ image to `v7.12.0`
- Upgraded _PostgreSQL_ chart to `v10.3.17` (_PostgreSQL_ `v11.11.0`)

## v4.1.3 - 2021-03-25

### Changed

- Upgraded _Confluence Server_ image to `v7.11.2`

## v4.1.2 - 2021-03-05

### Changed

- Upgraded `Confluence Server` image to _v7.11.1_

## v4.1.1 - 2021-02-16

### Changed

- Update default JVM config

## v4.1.0 - 2021-02-03

### Changed

- Upgraded `Confluence Server` image to _v7.11.0_

## v4.0.3 - 2021-01-20

### Changed

- Upgraded `Confluence Server` image to _v7.10.2_

## v4.0.2 - 2021-01-15

### Added

- Dynamic probe configuration

## v4.0.1 - 2021-01-07

### Changed

- Upgraded `confluence-server` image to _v7.10.1_

## v4.0.0 - 2021-01-06

> [!IMPORTANT]
> This release is only compatible with _Helm_ v3.

### Added

- New `priorityClassName` value

### Changed

- Upgraded chart API version to `v2`

## v3.4.0 - 2020-12-16

### Changed

- Upgraded image to _v7.10.0_

## v3.3.2 - 2020-12-10

### Changed

- Upgraded image to _v7.9.3_

## v3.3.1 - 2020-11-25

### Changed

- Upgraded image to _v7.9.1_

## v3.3.0 - 2020-11-10

### Changed

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

<!--
RELEASE LINKS
-->
[UNRELEASED]: https://github.com/stevehipwell/helm-charts/tree/main/charts/confluence-server
[v5.7.1]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.7.1
[v5.7.0]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.7.0
[v5.6.2]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.6.2
[v5.6.1]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.6.1
[v5.6.0]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.7.0
[v5.5.16]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.5.16
[v5.5.15]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.5.15
[v5.5.14]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.5.14
[v5.5.13]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.5.13
[v5.5.12]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.5.12
[v5.5.11]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.5.11
[v5.5.10]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.5.10
[v5.5.9]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.5.9
[v5.5.8]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.5.8
[v5.5.7]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.5.7
[v5.5.6]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.5.6
[v5.5.5]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.5.5
[v5.5.4]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.5.4
[v5.5.3]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.5.3
[v5.5.2]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.5.2
[v5.5.1]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.5.1
[v5.5.0]: https://github.com/stevehipwell/helm-charts/releases/tag/confluence-server-5.5.0
