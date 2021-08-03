# Metrics Server Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- ## [UNRELEASED]
### Added
### Changed
### Deprecated
### Removed -->

## v3.3.2 - 2021-08-03

### Added

- Custom `updateStrategy` to set deployment `strategy`.

### Changed

- Use both name and instance in PDB selector.

## v3.3.1 - 2021-06-08

### Changed

- Fix container port and make configurable

## v3.3.0 - 2021-06-07

### Changed

- Upgraded _Metrics Server_ version to [v0.5.0](https://github.com/kubernetes-sigs/metrics-server/releases/tag/v0.5.0)
- Switch container port to `443`
- Set default value for `args` to include `--metric-resolution=15s`
- Revert liveness check initial delay to `0s`

## v3.2.2 - 2021-05-11

### Changed

- Support additional volumes via `extraVolumes` & `extraVolumeMounts`

## v3.2.1 - 2021-05-05

### Changed

- Fix minor config issues

## v3.2.0 - 2021-04-30

### Changed

- Upgraded _Metrics Server_ version to `v0.4.4`

## v3.1.0 - 2021-04-21

### Changed

- Upgraded _Metrics Server_ version to `v0.4.3`

## v3.0.0 - 2021-04-09

### Added

- Initial release
