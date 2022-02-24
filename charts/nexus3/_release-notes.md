### Added

- Added `metrics.serviceMonitor.endpointConfig` to allow customisation of the `ServiceMonitor` endpoint.
- Added `config.anonymous.roles` to allow the anonymous user's roles to be configured.
- Added `config.users` to enable users to be configured, new users will get a random password.

### Changed

- Configure script now explicitly uses `/bin/bash`.
- All `beta` APIs use in the configuration have been updated to `v1`.

### Deprecated

- Deprecated `metrics.serviceMonitor.interval` in favour of `metrics.serviceMonitor.endpointConfig.interval`.

### Removed

- Removed chart default for `metrics.serviceMonitor.interval`, the interval should be the _Prometheus_ default if not overridden.
