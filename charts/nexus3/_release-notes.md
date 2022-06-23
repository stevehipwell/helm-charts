### Added

- Added explicit namespace declaration in templates.
- Added support for running Nexus3 as a `StatefulSet` by setting `deployment` to `false`.
- Added `terminationGracePeriodSeconds`.
- Added `service.clusterIP` to enable making the `Service` headless.
- Added `serviceAccount.automountToken` to default token binding to `false`.

### Changed

- Update _Nexus3_ image to [v3.40.0](https://help.sonatype.com/repomanager3/product-information/release-notes/2022-release-notes/nexus-repository-3.40.0-release-notes).
