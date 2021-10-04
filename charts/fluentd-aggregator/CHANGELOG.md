# Fluentd Aggregator Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- ## [UNRELEASED]
### Added
### Changed
### Deprecated
### Removed -->

## v2.6.1 - 2021-10-04

### Changed

- Update _Fluentd Aggregator_ Docker image to [v1.14.1](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v1.14.1) (_Fluentd_ `v1.14.1`).

## v2.6.0 - 2021-08-31

### Changed

- Update _Fluentd Aggregator_ Docker image to [v1.14.0](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v1.14.0) (_Fluentd_ `v1.14.0`).
- Use the `policy/v1` API for `PodDisruptionBudget` if the K8s version supports it.

## v2.5.3 - 2021-08-11

### Changed

- Improved documentation.

## v2.5.2 - 2021-07-27

### Changed

- Update _Fluentd Aggregator_ Docker image to [v1.13.3](https://github.com/stevehipwell/fluentd-aggregator/releases/tag/v1.13.3) (_Fluentd_ `v1.13.3`)

## v2.5.1 - 2021-07-13

### Changed

- Update _Fluentd Aggregator_ Docker image to `v1.13.2` (_Fluentd_ `v1.13.2`)

## v2.5.0 - 2021-06-24

### Changed

- Update _Fluentd Aggregator_ Docker image to `v1.13.1` (_Fluentd_ `v1.13.1`)
- Add _PodDisruptionBudget_ support

## v2.4.0 - 2021-06-24

### Changed

- Update _Fluentd Aggregator_ Docker image to `v1.13.0` (_Fluentd_ `v1.13.0`)

## v2.3.1 - 2021-06-17

### Changed

- Fix notes if ingress is enabled

## v2.3.0 - 2021-06-16

### Changed

- Update _Fluentd_ Docker image to `v1.12.5` (_Fluentd_ `v1.12.4`)
- Modify how ports are defined
- Support K8s v1.18 ingress changes

## v2.2.0 - 2021-05-19

### Changed

- Upgrade _Fluentd_ Docker image to `v1.12.4` (_Fluentd_ `v1.12.3`)

## v2.1.1 - 2021-05-11

### Changed

- Upgrade _Fluentd_ Docker image to `v1.12.3` (_Fluentd_ `v1.12.2`)

## v2.1.1 - 2021-04-23

### Changed

- Fixed default routing implementation

## v2.1.0 - 2021-04-22

### Changed

- Added separate route config via `config.route`

## v2.0.0 - 2021-04-06

### Changed

- Upgraded to _Fluentd_ `v1.12.2`
- Removed `@mainstream` label from default input

## v1.2.1 - 2021-04-06

### Added

- Support `podLabels` configuration value

## v1.2.0 - 2021-04-06

### Added

- _Grafana_ dashboard
- _Prometheus_ input metrics

### Changed

- Hide metrics and health check logs

## v1.1.3 - 2021-03-31

### Changed

- Update default config

## v1.1.2 - 2021-03-31

### Changed

- Update default config

## v1.1.1 - 2021-03-31

### Changed

- Update default config

## v1.1.0 - 2021-03-30

### Changed

- Upgraded _Fluentd Aggregator_ image to `v1.11.5`

## v1.0.5 - 2021-02-16

### Changed

- Fix host label for metrics

## v1.0.4 - 2021-01-27

### Changed

- Updated default config

## v1.0.3 - 2021-01-20

### Changed

- Fix metrics port in conf

## v1.0.2 - 2021-01-15

### Added

- Dynamic probe configuration

## v1.0.1 - 2021-01-07

### Changed

- Use `fsGroup: 2000`

## v1.0.0 - 2021-01-06

### Added

- Initial release
