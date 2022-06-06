### Added

- Added `commonLabels` to allow the addition of labels to all resources.
- Added `serviceMonitor.endpointConfig` to allow customisation of the `ServiceMonitor` endpoint.

### Changed

- Updated the _Istio Operator_ image version to [v1.14.0](https://github.com/istio/istio/releases/tag/1.14.0).

### Deprecated

- Deprecated `serviceMonitor.interval` in favour of `serviceMonitor.endpointConfig.interval`.

### Removed

- Removed chart default for `serviceMonitor.interval`, the interval should be the _Prometheus_ default if not overridden.
