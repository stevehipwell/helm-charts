### Added

- Added new default behaviour to use a `StatefulSet` instead of a `Deployment`, the legacy behaviour can be enabled by setting `deployment` to `true`.
- Added `imagePullSecrets` to replace `image.pullSecrets`.
- Added `commonLabels` to allow the addition of labels to all resources.
- Added `terminationGracePeriodSeconds`.
- Added `service.clusterIP` to enable making the `Service` headless.
- Added `serviceAccount.automountToken` to default token binding to `false`.
- Added explicit namespace declaration in templates.
- Added support for setting `JVM_RESERVED_CODE_CACHE_SIZE` via `envVars.jvmReservedCodeCacheSize`.
- Added support for setting `ATL_FORCE_CFG_UPDATE` via `envVars.forceCfgUpdate`.
- Added support for setting `SET_PERMISSIONS` via `envVars.setPermissions`.

### Changed

- Update _Jira Software_ image to [v9.0.0](https://confluence.atlassian.com/jirasoftware/jira-software-9-0-x-release-notes-1142227613.html).
- Default to setting pod `fsGroup` to `2001`.
- Changed default JVM min heap size to the [default value](https://bitbucket.org/atlassian-docker/docker-atlassian-jira/src/master/#markdown-header-memory-heap-size) of `384M`.

### Removed

- Removed `image.pullSecrets` in favour of `imagePullSecrets`.
