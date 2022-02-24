### Added

- Added `metrics.serviceMonitor.endpointConfig` to allow customisation of the `ServiceMonitor` endpoint.
- Added `config.anonymous.roles` to allow the anonymous user's roles to be configured.
- Added `config.users` to enable users to be configured, new users will get a random password.
- Added `imagePullSecrets` to replace `image.pullSecrets`.
- **EXPERIMENTAL** support for installing Nexus3 plugins via the `plugins` value.

### Changed

- Update `Nexus3` image to [v3.38.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2022-release-notes/nexus-repository-3.38.0-release-notes).
- Configure script now explicitly uses `/bin/bash`.
- All `beta` APIs use in the configuration have been updated to `v1`.
- Make it clearer that the `rootPassword` config is required if config is enabled.

### Deprecated

- Deprecated `metrics.serviceMonitor.interval` in favour of `metrics.serviceMonitor.endpointConfig.interval`.
- Deprecated `image.pullSecrets` in favour of the idiomatic `imagePullSecrets`.

### Removed

- Removed chart default for `metrics.serviceMonitor.interval`, the interval should be the _Prometheus_ default if not overridden.
- Removed using the image pull policy for init containers.
