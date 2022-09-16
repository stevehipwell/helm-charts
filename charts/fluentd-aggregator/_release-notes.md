### Highlights

> **Info**
> This release contains a number of breaking changes, please check out the full list of changes for the values which have been removed as well as taking note that the root directory mounted to the `PersistentVolume` has changed so buffer paths will need to be changed accordingly.

This release introduces a new strongly typed configuration mode which isn't compatible with the previous `v2` versions as well as updating the Fluentd image and adding new capabilities to the chart.

#### Structured Configuration

The Fluentd configuration is now much more structured to make it much harder to break chart functionality while configuring Fluentd. This change starts with the replacement of `config` with `configuration` and is founded on the new `routes` sub-value which is used to set up message routing in a strongly typed way. This design reduces the raw Fluentd configuration inputs to the `filters` value for global filters and the nested `config` value for each route.

### All Changes

- Updated _Fluentd Aggregator_ Docker image to [v2.0.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.0.0) (_Fluentd_ [v1.15.2](https://github.com/fluent/fluentd/releases/tag/v1.15.2)).
- Added explicit namespace declaration in templates.
- Added `imagePullSecrets` value.
- Added `serviceAccount.automountToken` to default token binding to `false`.
- Added `service.clusterIP` to enable making the `Service` headless.
- Added `serviceMonitor` value to replace `metrics.serviceMonitor`.
- Added `topologySpreadConstraints` value.
- Added `persistence.legacy` value to support migrating from `v2` chart versions.
- Added `configuration` value to support a strongly typed configuration pattern.
- Changed `PersistentVolume` mount point to `/fluentd/state`; use this path for buffers.
- Removed `image.pullSecrets` as they've been replaced by `imagePullSecrets`.
- Removed `service.ports` value as the ports are now part of the `configuration` value.
- Removed `metrics` value, see `serviceMonitor` and `configuration.metrics`.
- Removed `debug` value as it's been replaced by `configuration.debug`.
- Removed `config` value as configuration is now handled via the more strongly typed `configuration` value.
