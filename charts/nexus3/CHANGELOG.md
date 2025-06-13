# Nexus 3 Helm Chart Changelog

<!-- markdownlint-disable-next-line MD052 -->
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

## [v5.11.0] - 2025-06-13

### Added

- Add ability to store AWS S3 credentials for blob stores in a secret. ([#1202](https://github.com/stevehipwell/helm-charts/pull/1202)) _@vstariradev_ & _@stevehipwell_

### Changed

- Update the _Nexus3_ OCI image to [v3.81.1](https://github.com/sonatype/nexus-public/releases/tag/release-3.81.1-01). ([#1202](https://github.com/stevehipwell/helm-charts/pull/1202)) _@stevehipwell_

## [v5.10.0] - 2025-05-09

### Changed

- Update the _Nexus3_ OCI image to [v3.80.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.80.0-06). ([#1186](https://github.com/stevehipwell/helm-charts/pull/1186)) _@stevehipwell_

## [v5.9.1] - 2025-04-11

### Changed

- Update the _Nexus3_ OCI image to [v3.79.1](https://github.com/sonatype/nexus-public/releases/tag/release-3.79.1-04). ([#1171](https://github.com/stevehipwell/helm-charts/pull/1171)) _@stevehipwell_

## [v5.9.0] - 2025-04-09

<!-- markdownlint-disable-next-line MD052 -->
> [!WARNING]
> Make sure to read the [release notes](https://help.sonatype.com/en/sonatype-nexus-repository-3-79-0-release-notes.html) before upgrading to this version.

### Changed

- Update the _Nexus3_ OCI image to [v3.79.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.79.0-09). ([#1166](https://github.com/stevehipwell/helm-charts/pull/1166)) _@stevehipwell_

### Fixed

- Fix incorrect existing user check that would cause creating a new user with an ID that was a substring of an existing user to fail. ([#1166](https://github.com/stevehipwell/helm-charts/pull/1166)) _@stevehipwell_

## [v5.8.3] - 2025-03-20

### Fixed

- Fix logback task configuration by inlining the appender.  ([#1152](https://github.com/stevehipwell/helm-charts/pull/1152)) _@stevehipwell_

## [v5.8.2] - 2025-03-18

### Changed

- Updated the _Nexus3_ OCI image to [v3.78.2](https://github.com/sonatype/nexus-public/releases/tag/release-3.78.2-04). ([#1150](https://github.com/stevehipwell/helm-charts/pull/1150)) _@stevehipwell_

## [v5.8.1] - 2025-03-10

### Changed

- Updated the _Nexus3_ OCI image to [v3.78.1](https://github.com/sonatype/nexus-public/releases/tag/release-3.78.1-02). ([#1143](https://github.com/stevehipwell/helm-charts/pull/1143)) _@stevehipwell_

## [v5.8.0] - 2025-03-05

### Added

- Added support for running manual maintenance by setting the `manualMaintenanceMode` values; this will run a custom command on the default container, reduce the termination grace period to 10s and remove the probes so the pod doesn't get restarted. ([#1126](https://github.com/stevehipwell/helm-charts/pull/1126)) _@stevehipwell_

### Changed

- Updated the _Nexus3_ OCI image to [v3.78.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.78.0-14). ([#1141](https://github.com/stevehipwell/helm-charts/pull/1141)) _@stevehipwell_

## [v5.7.2] - 2025-02-26

### Changed

- Updated the _Nexus3_ OCI image to [v3.77.2](https://github.com/sonatype/nexus-public/releases/tag/release-3.77.2-02). ([#1132](https://github.com/stevehipwell/helm-charts/pull/1132)) _@stevehipwell_

## [v5.7.1] - 2025-02-07

### Changed

- Updated the _Nexus3_ OCI image to [v3.77.1](https://github.com/sonatype/nexus-public/releases/tag/release-3.77.1-01). ([#1123](https://github.com/stevehipwell/helm-charts/pull/1123)) _@stevehipwell_

## [v5.7.0] - 2025-02-05

### Changed

- Updated the _Nexus3_ OCI image to [v3.77.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.77.0-08). ([#1119](https://github.com/stevehipwell/helm-charts/pull/1119)) _@stevehipwell_

## [v5.6.2] - 2025-01-24

### Changed

- Updated the _Nexus3_ OCI image to [v3.76.1](https://github.com/sonatype/nexus-public/releases/tag/release-3.76.1-01). ([#1117](https://github.com/stevehipwell/helm-charts/pull/1117)) _@stevehipwell_

## [v5.6.1] - 2025-01-21

### Fixed

- Fixed user configuration bug ([#1115](https://github.com/stevehipwell/helm-charts/issues/1115)). ([#1116](https://github.com/stevehipwell/helm-charts/pull/1116)) _@stevehipwell_

## [v5.6.0] - 2025-01-13

### Added

- Added a default value of `"default"` for users and roles where this is undefined. ([#1109](https://github.com/stevehipwell/helm-charts/pull/1109)) _@stevehipwell_

### Changed

- Updated the _Nexus3_ OCI image to [v3.76.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.76.0-03). ([#1109](https://github.com/stevehipwell/helm-charts/pull/1109)) _@stevehipwell_

## [v5.5.1] - 2024-12-06

### Changed

- Updated the _Nexus3_ OCI image to [v3.75.1](https://github.com/sonatype/nexus-public/releases/tag/release-3.75.1-01). ([#1092](https://github.com/stevehipwell/helm-charts/pull/1093)) _@stevehipwell_

## [v5.5.0] - 2024-12-05

### Changed

- Updated the _Nexus3_ OCI image to [v3.75.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.75.0-06). ([#1092](https://github.com/stevehipwell/helm-charts/pull/1092)) _@stevehipwell_

## [v5.4.1] - 2024-11-05

### Changed

- Updated the config image to use `docker.io/alpine/k8s` as the _Chainguard_ image is no longer available. ([#1082](https://github.com/stevehipwell/helm-charts/pull/1082)) _@stevehipwell_

## [v5.4.0] - 2024-11-05

### Changed

- Updated the _Nexus3_ OCI image to [v3.74.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.74.0-05). ([#1075](https://github.com/stevehipwell/helm-charts/pull/1075)) _@stevehipwell_

## [v5.3.0] - 2024-10-29

### Added

- Added support for specifying `password.secret` & `password.key` on the `config.repos` objects. ([#1070](https://github.com/stevehipwell/helm-charts/pull/1070)) _@stevehipwell_
- Added support for specifying `password.secret` & `password.key` on the `config.users` objects. ([#1070](https://github.com/stevehipwell/helm-charts/pull/1070)) _@stevehipwell_

### Changed

- Updated ingress docs to better explain hosts. ([#1070](https://github.com/stevehipwell/helm-charts/pull/1070)) _@stevehipwell_

### Deprecated

- Deprecated `.config.repoCredentials` in favour of directly specifying `password.secret` on the `config.repos` objects. ([#1070](https://github.com/stevehipwell/helm-charts/pull/1070)) _@stevehipwell_

## [v5.2.0] - 2024-10-24

> [!IMPORTANT]
> If you're upgrading to this version you will need to run `kubectl --namespace <namespace> delete statefulset <name> --cascade=orphan` before upgrading as there was a bug in previous versions of this chart that incorrectly labeled the volume claim template.

### Changed

- Changed the order of the initialization scripts to allow creating roles based on repository privileges. ([#1066](https://github.com/stevehipwell/helm-charts/pull/1066)) _@stevehipwell_ & _@mreiche_
- Improved docs for config with reference to the API documentation. ([#1066](https://github.com/stevehipwell/helm-charts/pull/1066)) _@stevehipwell_ & _@mreiche_

### Fixed

- Fixed LDAP templating incorrectly using `toJson` without passing in the data resulting in no configuration to apply. ([#1064](https://github.com/stevehipwell/helm-charts/pull/1064)) _@KuroXII_
- Fixed incorrect labeling on the volume claim template. ([#1066](https://github.com/stevehipwell/helm-charts/pull/1066)) _@stevehipwell_

## [v5.1.0] - 2024-10-14

> [!CAUTION]
> Don't use this version, there is a bug in the logic for creating the `StatefulSet` volume; please use [`5.2.0`](https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.2.0).

### Changed

- Updated the _Nexus3_ OCI image to [v3.73.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.73.0-12). _@stevehipwell_
- Updated plugin install logic to show status and fail if the plugin can't be installed. _@EugenMayer_

## [v5.0.0] - 2024-09-10

> [!CAUTION]
> Don't use this version, there is a bug in the logic for creating the `StatefulSet` volume; please use [`5.2.0`](https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.2.0).

> [!WARNING]
> The release contains multiple breaking changes including removing support for OrientDB, please pay attention to the removals section. If you were previously using OrientDB you need to make sure you follow the [upgrade guide](https://help.sonatype.com/en/upgrading-to-nexus-repository-3-71-0-and-beyond.html) before upgrading to this version.

### Added

- Added `Job` to configure _nexus3_ instead of a lifecycle script, this can be configured via the `config.job` value.
- Added sidecar pods to tail all logs, these can be configured via the `tailLogs` value.
- Added configuration for the Bash & JDK images via the `bashImage` & `jdkImage` values respectively.
- Added support for setting image digests.
- Added `install4jAddVmParams` to configure _Nexus3_ via env variables.
- Added `replicas` value.
- Added `updateStrategy`, `ordinals`, `podManagementPolicy` & `minReadySeconds` values to better configure the `StatefulSet`.
- Added `startupProbe` value.
- Added separate headless `Service`.
- Added support for creating a `PodDisruptionBudget` via the `podDisruptionBudget` value.
- Added support for `StatefulSet` volume cleanup options `retainDeleted` & `retainScaled` via the `persistence.retainDeleted` & `persistence.retainScaled` values respectively.

### Changed

- Updated the _Nexus3_ OCI image to [v3.72.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.72.0-04).
- Changed defaults for `podSecurityContext` & `securityContext`.
- Changed defaults for `livenessProbe` & `readinessProbe` to align to the use of a `startupProbe`.
- Increased the default `terminationGracePeriodSeconds` to `120`.
- Change repository config to use the REST API, this means that the configuration structure should be modified to match the API spec (for example no more nesting under `attributes`). Passwords also no longer need a `PASSWORD` placeholder.

### Removed

- Removed support for running _Nexus3_ as a `Deployment` by removing the `deployment` value.
- Removed support for beta `Ingress` versions.
- Removed `envVars` value in favour of `install4jAddVmParams`.
- Removed `highAvailability` value, Pro level features are now enabled by setting `licence.enabled` to `true`.
- Removed `image.pullSecrets` value.
- Removed `metrics.serviceMonitor.interval` value.

## [v4.45.1] - 2024-09-06

### Changed

- Updated the _Nexus3_ OCI image to `v3.70.2`.

## [v4.45.0] - 2024-07-11

### Added

- Added `service.additionalPorts.hosts` (list) for multi-hosts support.

### Changed

- Updated the _Nexus3_ OCI image to [v3.70.1](https://github.com/sonatype/nexus-public/releases/tag/release-3.70.1-02).

### Deprecated

- Deprecated `service.additionalPorts.host` in favour of `service.additionalPorts.hosts`.

## [v4.44.0] - 2024-06-10

### Changed

- Updated the _Nexus3_ OCI image to [v3.69.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.69.0-02).

## [v4.43.1] - 2024-05-30

### Changed

- Updated the _Nexus3_ OCI image to [v3.68.1](https://github.com/sonatype/nexus-public/releases/tag/release-3.68.1-02).

## [v4.43.0] - 2024-05-08

### Changed

- Updated the _Nexus3_ OCI image to [v3.68.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.68.0-04).
- Switched to using the port name for ingress.

### Fixed

- Fixed incorrect `ServiceMonitor` name via the `jobLabel` field.

## [v4.42.1] - 2024-04-11

### Changed

- Updated the _Nexus3_ OCI image to [v3.67.1](https://github.com/sonatype/nexus-public/releases/tag/release-3.67.1-01).

### Fixed

- Fixed incorrect behavior when `rootPassword.key` is set due to the deprecated `config.rootPassword.key` incorrectly having a default value.

## [v4.42.0] - 2024-04-03

### Changed

- Updated the _Nexus3_ OCI image to [v3.67.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.67.0-03).
- Changed Java version from 8 to 11.

## [v4.41.1] - 2024-03-25

### Fixed

- Fixed the LDAP password logic to support having a password containing `\` or `&`.

## [v4.41.0] - 2024-03-07

### Changed

- Updated the _Nexus3_ OCI image to [v3.66.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.66.0-02).

### Fixed

- Fixed the LDAP password logic to support having a password containing `\`.

## [v4.40.0] - 2024-02-07

### Changed

- Updated the _Nexus3_ OCI image to [v3.65.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.65.0-02).

## [v4.39.0] - 2024-01-11

### Changed

- Updated the _Nexus3_ OCI image to [v3.64.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.64.0-03).

## [v4.38.0] - 2024-01-04

### Added

- Added `license.enabled`, `license.secret` & `license.key` to configure the _Nexus3_ pro license.
- Added `highAvailability.enabled` & `highAvailability.replicas` values to enable configuring [high availability](https://help.sonatype.com/repomanager3/planning-your-implementation/resiliency-and-high-availability/high-availability-deployment-options/option-1---manual-high-availability-deployment) when running _Nexus3_ as a `StatefulSet` with a pro license.
- Added `storeProperties` value to configure a _PostgreSQl_ data store for _Nexus3_ with a pro license.

## [v4.37.0] - 2023-12-06

### Changed

- Updated the _Nexus3_ OCI image to [v3.63.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.63.0-01).
- Support embedding of env vars for JVM by permitting `INSTALL4J_ADD_VM_PARAMS` to be defined after all other env vars.
- Lifecycle script `configure.sh` prefixes log errors with `ERROR:` and echos the same string to `$TERMINATION_LOG`.

## [v4.36.0] - 2023-11-10

### Changed

- Updated the _Nexus3_ OCI image to [v3.62.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.62.0-01).

## [v4.35.0] - 2023-10-20

### Changed

- Updated the _Nexus3_ OCI image to [v3.61.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.61.0-02).

### Fixed

- Allow the use of `"` and `/` characters in the LDAP password.

## [v4.34.0] - 2023-09-08

### Changed

- Updated the _Nexus3_ OCI image to [v3.60.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.60.0-02).

## [v4.33.0] - 2023-08-16

### Changed

- Updated the _Nexus3_ OCI image to [v3.59.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.59.0-01).

## [v4.32.1] - 2023-07-24

### Changed

- Updated the _Nexus3_ OCI image to [v3.58.1](https://github.com/sonatype/nexus-public/releases/tag/release-3.58.1-01).

## [v4.32.0] - 2023-07-17

### Changed

- Updated the _Nexus3_ OCI image to [v3.58.0](https://github.com/sonatype/nexus-public/releases/tag/release-3.58.0-01).

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

- Added `metrics.serviceMonitor.endpointConfig` to allow customization of the `ServiceMonitor` endpoint.
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

- Customizable ingress path (not actually supported)

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

- Fixed regex when S3 blob store is used

## v4.0.2 - 2021-01-15

### Added

- Dynamic probe configuration

### Changed

- Fixed typo in LDAP configuration

## v4.0.1 - 2021-01-08

### Changed

- Upgraded `nexus3` image to _v3.29.2_

## v4.0.0 - 2021-01-06

> [!IMPORTANT]
> This release is only compatible with _Helm_ v3.

### Added

- New `priorityClassName` value

### Changed

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

- Use custom Logback config with customizable retention

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

<!--
RELEASE LINKS
-->

[UNRELEASED]: https://github.com/stevehipwell/helm-charts/tree/main/charts/nexus3
[v5.11.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.11.0
[v5.10.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.10.0
[v5.9.1]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.9.1
[v5.9.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.9.0
[v5.8.3]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.8.3
[v5.8.2]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.8.2
[v5.8.1]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.8.1
[v5.8.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.8.0
[v5.7.2]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.7.2
[v5.7.1]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.7.1
[v5.7.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.7.0
[v5.6.2]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.6.2
[v5.6.1]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.6.1
[v5.6.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.6.0
[v5.5.1]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.5.1
[v5.5.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.5.0
[v5.4.1]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.4.1
[v5.4.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.4.0
[v5.3.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.3.0
[v5.2.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.2.0
[v5.1.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.1.0
[v5.0.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-5.0.0
[v4.45.1]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.45.1
[v4.45.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.45.0
[v4.44.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.44.0
[v4.43.1]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.43.1
[v4.43.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.43.0
[v4.42.1]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.42.1
[v4.42.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.42.0
[v4.41.1]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.41.1
[v4.41.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.41.0
[v4.40.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.40.0
[v4.39.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.39.0
[v4.38.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.38.0
[v4.37.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.37.0
[v4.36.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.36.0
[v4.35.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.35.0
[v4.34.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.34.0
[v4.33.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.33.0
[v4.32.1]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.32.1
[v4.32.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.32.0
[v4.31.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.31.0
[v4.30.0]: https://github.com/stevehipwell/helm-charts/releases/tag/nexus3-4.30.0
