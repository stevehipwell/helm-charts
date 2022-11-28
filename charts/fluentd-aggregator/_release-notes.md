### All Changes

- Updated _Fluentd Aggregator_ OCI image to [v2.4.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v2.4.0) (_Fluentd_ [v1.15.3](https://github.com/fluent/fluentd/releases/tag/v1.15.3)).
- Fixed missing use of `configuration.system.rootDir` to set the mount path; this means that the buffer paths can be kept as `/fluentd/buffers` when migrating from `v2`.
- Fixed bug in creating dashboards.
- Fixed missing service annotations in template.
