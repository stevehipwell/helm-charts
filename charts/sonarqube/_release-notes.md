### Added

- Added `serviceAccount.automountToken` to default token binding to `false`.

### Changed

- Update _SonarQube_ image to [v9.5.0](https://www.sonarqube.org/sonarqube-9-5/) ([GH release](https://github.com/SonarSource/sonarqube/releases/tag/9.5.0.56709)).
- Set resource namespaces to `{{ .Release.Namespace }}` in the templates instead of waiting until apply time inference.
