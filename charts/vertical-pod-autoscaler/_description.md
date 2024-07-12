The [Vertical Pod Autoscaler](https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscaler/) (VPA) frees the users from necessity of setting up-to-date resource limits and requests for the containers in their pods. When configured, it will set the requests automatically based on usage and thus allow proper scheduling onto nodes so that appropriate resource amount is available for each pod. It will also maintain ratios between limits and requests that were specified in initial containers configuration.

It can both down-scale pods that are over-requesting resources, and also up-scale pods that are under-requesting resources based on their usage over time.

Autoscaling is configured with a `CustomResourceDefinition` object called `VerticalPodAutoscaler`. It allows to specify which pods should be vertically autoscaled as well as if/how the resource recommendations are applied.

This chart manages the `MutatingWebhookConfiguration` outside of the workload so there is no need to run additional logic to clean-up after VPA is uninstalled, webhook certificates can also be managed by [Cert Manager](https://cert-manager.io/docs/). The chart handles the parameters for logging levels and ports but all other parameters need to be passed in to the components.

- [Recommender parameters](https://github.com/kubernetes/autoscaler/blob/master/vertical-pod-autoscaler/FAQ.md#what-are-the-parameters-to-vpa-recommender)
- [Updater parameters](https://github.com/kubernetes/autoscaler/blob/master/vertical-pod-autoscaler/FAQ.md#what-are-the-parameters-to-vpa-updater)
