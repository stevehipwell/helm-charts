# Tigera Operator Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- ## [UNRELEASED]
### Added
### Changed
### Deprecated
### Removed -->

## 1.1.1 2021-09-01

### Changed

- Update _tigera-operator_ image to [v1.21.1](https://github.com/tigera/operator/releases/tag/v1.21.1).

## 1.1.0 2021-08-24

### Changed

- Updated `tigera-operator` image to [v1.21.0](https://github.com/tigera/operator/releases/tag/v1.21.0).
- Enable customisation of deployment `hostNetwork` & `dnsPolicy` for users who aren't using Calico as the CNI.

## 1.0.5 2021-08-11

### Changed

- Improve documentation.

## 1.0.4 2021-08-05

### Changed

- Fixed operator namespace support.

## 1.0.3 2021-08-04

### Removed

- Removed `tigeraWatchNamespace` value as it would be ignored.

## 1.0.2 2021-08-03

### Changed

- Use default custom resource name.

## 1.0.1 2021-08-03

### Added

- New `env` & `envFrom` values to set the environment.
- Correct metadata to installation resource.

### Changed

- Fix watch namespace to watch all namespaces by default.

## 1.0.0 2021-08-03

### Added

- Initial release based on [v1.20.0](https://github.com/tigera/operator/releases/tag/v1.20.0).
