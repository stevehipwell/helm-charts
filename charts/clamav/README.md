# ClamAV

[ClamAV](https://www.clamav.net/) is an open source antivirus engine for detecting trojans, viruses, malware & other malicious threats.

## Installing the Chart

Before you can install the chart you will need to add the `stevehipwell` repo to [Helm](https://helm.sh/).

```shell
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
```

After you've installed the repo you can install the chart.

```shell
helm upgrade --install --namespace default --values ./my-values.yaml my-release stevehipwell/clamav
```

## Configuration

The following table lists the configurable parameters of the _clamav_ chart and their default values.
