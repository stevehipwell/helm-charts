# Vertical Pod Autoscaler Helm Chart Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

<!-- ## [UNRELEASED]
### Highlights
### All Changes
- Added
- Updated
- Changed
- Fixed
- Deprecated
- Removed -->

## [UNRELEASED]

### All Changes

- Added a default `labelSelector` for the release pods to `topologySpreadConstraints`, `affinity.podAffinity` & `affinity.podAntiAffinity`.

## [v1.2.0] - 2023-02-22

### All Changes

- Updated the _Vertical Pod Autoscaler_ image version to [v0.13.0](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-0.13.0).

## [v1.1.0] - 2023-02-22

### All Changes

- Updated the _Vertical Pod Autoscaler_ image version to [v0.12.0](https://github.com/kubernetes/autoscaler/releases/tag/vertical-pod-autoscaler-0.12.0).

## [v1.0.0] - 2022-12-08

### All Changes

- Initial release.
