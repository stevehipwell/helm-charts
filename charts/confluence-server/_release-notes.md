> **BREAKING CHANGE:**
> If you're upgrading to this version you need to set `deployment` to `true` otherwise you might lose your data.

### All Changes

- Updated the _Confluence Server_ image to [v8.0.0](https://confluence.atlassian.com/doc/confluence-8-0-release-notes-1127254402.html).
- Updated the embedded _PostgreSQL_ chart to [v11.9.13](https://artifacthub.io/packages/helm/bitnami/postgresql/11.9.13) (PostgreSQL v14.5.0).
- Changed default behaviour to use a `StatefulSet` instead of a `Deployment`, the legacy behaviour can be enabled by setting `deployment` to `true`.
