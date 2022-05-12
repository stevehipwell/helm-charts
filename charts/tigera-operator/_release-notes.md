### Added

- Added `commonLabels` to allow the addition of labels to all resources.
- Added `serviceMonitor.endpointConfig` to allow customisation of the `ServiceMonitor` endpoint.

### Changed

- Update _Tigera Operator_ image to [v1.27.0](https://github.com/tigera/operator/releases/tag/v1.27.0) (_Calico_ [v3.23.0](https://github.com/projectcalico/calico/releases/tag/v3.23.0)).

### Deprecated

- Deprecated `serviceMonitor.interval` in favour of `serviceMonitor.endpointConfig.interval`.

### Removed

- Removed chart default for `serviceMonitor.interval`, the interval should be the _Prometheus_ default if not overridden.
