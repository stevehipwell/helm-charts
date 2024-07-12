The [Tigera Operator](https://www.tigera.io/) is a Kubernetes operator which manages the lifecycle of a [Calico](https://www.tigera.io/project-calico/) or [Calico Enterprise](https://www.tigera.io/tigera-products/calico-enterprise/) installation on Kubernetes. Its goal is to make installation, upgrades, and ongoing lifecycle management of _Calico_ and _Calico Enterprise_ as simple and reliable as possible.

It is possible to use the _Tigera Operator_ for other use-cases by installing additional CRDs and adding custom RBAC rules via `rbac.customRules`.
