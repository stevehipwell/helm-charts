# Kubernetes Helm Charts

[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/stevehipwell)](https://artifacthub.io/packages/search?ts_query_web=stevehipwell&sort=last_updated)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![](https://github.com/stevehipwell/helm-charts/workflows/Release/badge.svg?branch=main)](https://github.com/stevehipwell/helm-charts/actions/workflows/release.yaml)

## Usage

[Helm](https://helm.sh) must be installed to use these charts; please refer to the _Helm_ [documentation](https://helm.sh/docs/) to get started.

### OCI Repositories

The recommended way to install these charts is via OCI and the `helm search hub stevehipwell` command should list the available charts.

### Non-OCI Repository

If you don't want to use the OCI repositories you can add the `stevehipwell` repository as follows.

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
helm repo update
```

You can then run `helm search repo stevehipwell` to see the charts.

## Charts

- [confluence-server](./charts/confluence-server/README.md)
- [fluent-bit-aggregator](./charts/fluent-bit-aggregator/README.md)
- [fluent-bit-collector](./charts/fluent-bit-collector/README.md)
- [fluentd-aggregator](./charts/fluentd-aggregator/README.md)
- [istio-operator](./charts/istio-operator/README.md)
- [jira-software](./charts/jira-software/README.md)
- [k8s-resources](./charts/k8s-resources/README.md)
- [nexus3](./charts/nexus3/README.md)
- [node-config](./charts/node-config/README.md)
- [overprovisioner](./charts/overprovisioner/README.md)
- [plantuml](./charts/plantuml/README.md)
- [sonarqube](./charts/sonarqube/README.md)
- [thanos](./charts/thanos/README.md)
- [tigera-operator](./charts/tigera-operator/README.md)
- [vertical-pod-autoscaler](./charts/vertical-pod-autoscaler/README.md)

## License

[MIT License](./LICENSE).
