apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: adminnetworkpolicies.policy.networking.k8s.io
  annotations:
    api-approved.kubernetes.io: https://github.com/kubernetes-sigs/network-policy-api/pull/30
    policy.networking.k8s.io/bundle-version: v0.1.1
    policy.networking.k8s.io/channel: experimental
spec:
  group: policy.networking.k8s.io
  names:
    kind: AdminNetworkPolicy
    listKind: AdminNetworkPolicyList
    plural: adminnetworkpolicies
    shortNames:
      - anp
    singular: adminnetworkpolicy
  scope: Cluster
  versions:
    - additionalPrinterColumns:
        - jsonPath: .spec.priority
          name: Priority
          type: string
        - jsonPath: .metadata.creationTimestamp
          name: Age
          type: date
      name: v1alpha1
      schema:
        openAPIV3Schema:
          description: |-
            AdminNetworkPolicy is  a cluster level resource that is part of the
            AdminNetworkPolicy API.
          properties:
            apiVersion:
              description: |-
                APIVersion defines the versioned schema of this representation of an object.
                Servers should convert recognized schemas to the latest internal value, and
                may reject unrecognized values.
                More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
              type: string
            kind:
              description: |-
                Kind is a string value representing the REST resource this object represents.
                Servers may infer this from the endpoint the client submits requests to.
                Cannot be updated.
                In CamelCase.
                More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
              type: string
            metadata:
              type: object
            spec:
              description: Specification of the desired behavior of AdminNetworkPolicy.
              properties:
                egress:
                  description: |-
                    Egress is the list of Egress rules to be applied to the selected pods.
                    A total of 100 rules will be allowed in each ANP instance.
                    The relative precedence of egress rules within a single ANP object (all of
                    which share the priority) will be determined by the order in which the rule
                    is written. Thus, a rule that appears at the top of the egress rules
                    would take the highest precedence.
                    ANPs with no egress rules do not affect egress traffic.


                    Support: Core
                  items:
                    description: |-
                      AdminNetworkPolicyEgressRule describes an action to take on a particular
                      set of traffic originating from pods selected by a AdminNetworkPolicy's
                      Subject field.
                      <network-policy-api:experimental:validation>
                    properties:
                      action:
                        description: |-
                          Action specifies the effect this rule will have on matching traffic.
                          Currently the following actions are supported:
                          Allow: allows the selected traffic (even if it would otherwise have been denied by NetworkPolicy)
                          Deny: denies the selected traffic
                          Pass: instructs the selected traffic to skip any remaining ANP rules, and
                          then pass execution to any NetworkPolicies that select the pod.
                          If the pod is not selected by any NetworkPolicies then execution
                          is passed to any BaselineAdminNetworkPolicies that select the pod.


                          Support: Core
                        enum:
                          - Allow
                          - Deny
                          - Pass
                        type: string
                      name:
                        description: |-
                          Name is an identifier for this rule, that may be no more than 100 characters
                          in length. This field should be used by the implementation to help
                          improve observability, readability and error-reporting for any applied
                          AdminNetworkPolicies.


                          Support: Core
                        maxLength: 100
                        type: string
                      ports:
                        description: |-
                          Ports allows for matching traffic based on port and protocols.
                          This field is a list of destination ports for the outgoing egress traffic.
                          If Ports is not set then the rule does not filter traffic via port.


                          Support: Core
                        items:
                          description: |-
                            AdminNetworkPolicyPort describes how to select network ports on pod(s).
                            Exactly one field must be set.
                          maxProperties: 1
                          minProperties: 1
                          properties:
                            namedPort:
                              description: |-
                                NamedPort selects a port on a pod(s) based on name.


                                Support: Extended


                                <network-policy-api:experimental>
                              type: string
                            portNumber:
                              description: |-
                                Port selects a port on a pod(s) based on number.


                                Support: Core
                              properties:
                                port:
                                  description: |-
                                    Number defines a network port value.


                                    Support: Core
                                  format: int32
                                  maximum: 65535
                                  minimum: 1
                                  type: integer
                                protocol:
                                  default: TCP
                                  description: |-
                                    Protocol is the network protocol (TCP, UDP, or SCTP) which traffic must
                                    match. If not specified, this field defaults to TCP.


                                    Support: Core
                                  type: string
                              required:
                                - port
                                - protocol
                              type: object
                            portRange:
                              description: |-
                                PortRange selects a port range on a pod(s) based on provided start and end
                                values.


                                Support: Core
                              properties:
                                end:
                                  description: |-
                                    End defines a network port that is the end of a port range, the End value
                                    must be greater than Start.


                                    Support: Core
                                  format: int32
                                  maximum: 65535
                                  minimum: 1
                                  type: integer
                                protocol:
                                  default: TCP
                                  description: |-
                                    Protocol is the network protocol (TCP, UDP, or SCTP) which traffic must
                                    match. If not specified, this field defaults to TCP.


                                    Support: Core
                                  type: string
                                start:
                                  description: |-
                                    Start defines a network port that is the start of a port range, the Start
                                    value must be less than End.


                                    Support: Core
                                  format: int32
                                  maximum: 65535
                                  minimum: 1
                                  type: integer
                              required:
                                - end
                                - start
                              type: object
                          type: object
                        maxItems: 100
                        type: array
                      to:
                        description: |-
                          To is the List of destinations whose traffic this rule applies to.
                          If any AdminNetworkPolicyEgressPeer matches the destination of outgoing
                          traffic then the specified action is applied.
                          This field must be defined and contain at least one item.


                          Support: Core
                        items:
                          description: |-
                            AdminNetworkPolicyEgressPeer defines a peer to allow traffic to.
                            Exactly one of the selector pointers must be set for a given peer. If a
                            consumer observes none of its fields are set, they must assume an unknown
                            option has been specified and fail closed.
                          maxProperties: 1
                          minProperties: 1
                          properties:
                            namespaces:
                              description: |-
                                Namespaces defines a way to select all pods within a set of Namespaces.
                                Note that host-networked pods are not included in this type of peer.


                                Support: Core
                              properties:
                                matchExpressions:
                                  description:
                                    matchExpressions is a list of label selector
                                    requirements. The requirements are ANDed.
                                  items:
                                    description: |-
                                      A label selector requirement is a selector that contains values, a key, and an operator that
                                      relates the key and values.
                                    properties:
                                      key:
                                        description:
                                          key is the label key that the selector
                                          applies to.
                                        type: string
                                      operator:
                                        description: |-
                                          operator represents a key's relationship to a set of values.
                                          Valid operators are In, NotIn, Exists and DoesNotExist.
                                        type: string
                                      values:
                                        description: |-
                                          values is an array of string values. If the operator is In or NotIn,
                                          the values array must be non-empty. If the operator is Exists or DoesNotExist,
                                          the values array must be empty. This array is replaced during a strategic
                                          merge patch.
                                        items:
                                          type: string
                                        type: array
                                    required:
                                      - key
                                      - operator
                                    type: object
                                  type: array
                                matchLabels:
                                  additionalProperties:
                                    type: string
                                  description: |-
                                    matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
                                    map is equivalent to an element of matchExpressions, whose key field is "key", the
                                    operator is "In", and the values array contains only "value". The requirements are ANDed.
                                  type: object
                              type: object
                              x-kubernetes-map-type: atomic
                            networks:
                              description: |-
                                Networks defines a way to select peers via CIDR blocks.
                                This is intended for representing entities that live outside the cluster,
                                which can't be selected by pods, namespaces and nodes peers, but note
                                that cluster-internal traffic will be checked against the rule as
                                well. So if you Allow or Deny traffic to `"0.0.0.0/0"`, that will allow
                                or deny all IPv4 pod-to-pod traffic as well. If you don't want that,
                                add a rule that Passes all pod traffic before the Networks rule.


                                Each item in Networks should be provided in the CIDR format and should be
                                IPv4 or IPv6, for example "10.0.0.0/8" or "fd00::/8".


                                Networks can have upto 25 CIDRs specified.


                                Support: Extended


                                <network-policy-api:experimental>
                              items:
                                description: |-
                                  CIDR is an IP address range in CIDR notation (for example, "10.0.0.0/8" or "fd00::/8").
                                  This string must be validated by implementations using net.ParseCIDR
                                  TODO: Introduce CEL CIDR validation regex isCIDR() in Kube 1.31 when it is available.
                                maxLength: 43
                                type: string
                                x-kubernetes-validations:
                                  - message:
                                      CIDR must be either an IPv4 or IPv6 address.
                                      IPv4 address embedded in IPv6 addresses are not
                                      supported
                                    rule: self.contains(':') != self.contains('.')
                              maxItems: 25
                              minItems: 1
                              type: array
                              x-kubernetes-list-type: set
                            nodes:
                              description: |-
                                Nodes defines a way to select a set of nodes in
                                the cluster. This field follows standard label selector
                                semantics; if present but empty, it selects all Nodes.


                                Support: Extended


                                <network-policy-api:experimental>
                              properties:
                                matchExpressions:
                                  description:
                                    matchExpressions is a list of label selector
                                    requirements. The requirements are ANDed.
                                  items:
                                    description: |-
                                      A label selector requirement is a selector that contains values, a key, and an operator that
                                      relates the key and values.
                                    properties:
                                      key:
                                        description:
                                          key is the label key that the selector
                                          applies to.
                                        type: string
                                      operator:
                                        description: |-
                                          operator represents a key's relationship to a set of values.
                                          Valid operators are In, NotIn, Exists and DoesNotExist.
                                        type: string
                                      values:
                                        description: |-
                                          values is an array of string values. If the operator is In or NotIn,
                                          the values array must be non-empty. If the operator is Exists or DoesNotExist,
                                          the values array must be empty. This array is replaced during a strategic
                                          merge patch.
                                        items:
                                          type: string
                                        type: array
                                    required:
                                      - key
                                      - operator
                                    type: object
                                  type: array
                                matchLabels:
                                  additionalProperties:
                                    type: string
                                  description: |-
                                    matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
                                    map is equivalent to an element of matchExpressions, whose key field is "key", the
                                    operator is "In", and the values array contains only "value". The requirements are ANDed.
                                  type: object
                              type: object
                              x-kubernetes-map-type: atomic
                            pods:
                              description: |-
                                Pods defines a way to select a set of pods in
                                a set of namespaces. Note that host-networked pods
                                are not included in this type of peer.


                                Support: Core
                              properties:
                                namespaceSelector:
                                  description: |-
                                    NamespaceSelector follows standard label selector semantics; if empty,
                                    it selects all Namespaces.
                                  properties:
                                    matchExpressions:
                                      description:
                                        matchExpressions is a list of label
                                        selector requirements. The requirements are
                                        ANDed.
                                      items:
                                        description: |-
                                          A label selector requirement is a selector that contains values, a key, and an operator that
                                          relates the key and values.
                                        properties:
                                          key:
                                            description:
                                              key is the label key that the
                                              selector applies to.
                                            type: string
                                          operator:
                                            description: |-
                                              operator represents a key's relationship to a set of values.
                                              Valid operators are In, NotIn, Exists and DoesNotExist.
                                            type: string
                                          values:
                                            description: |-
                                              values is an array of string values. If the operator is In or NotIn,
                                              the values array must be non-empty. If the operator is Exists or DoesNotExist,
                                              the values array must be empty. This array is replaced during a strategic
                                              merge patch.
                                            items:
                                              type: string
                                            type: array
                                        required:
                                          - key
                                          - operator
                                        type: object
                                      type: array
                                    matchLabels:
                                      additionalProperties:
                                        type: string
                                      description: |-
                                        matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
                                        map is equivalent to an element of matchExpressions, whose key field is "key", the
                                        operator is "In", and the values array contains only "value". The requirements are ANDed.
                                      type: object
                                  type: object
                                  x-kubernetes-map-type: atomic
                                podSelector:
                                  description: |-
                                    PodSelector is used to explicitly select pods within a namespace; if empty,
                                    it selects all Pods.
                                  properties:
                                    matchExpressions:
                                      description:
                                        matchExpressions is a list of label
                                        selector requirements. The requirements are
                                        ANDed.
                                      items:
                                        description: |-
                                          A label selector requirement is a selector that contains values, a key, and an operator that
                                          relates the key and values.
                                        properties:
                                          key:
                                            description:
                                              key is the label key that the
                                              selector applies to.
                                            type: string
                                          operator:
                                            description: |-
                                              operator represents a key's relationship to a set of values.
                                              Valid operators are In, NotIn, Exists and DoesNotExist.
                                            type: string
                                          values:
                                            description: |-
                                              values is an array of string values. If the operator is In or NotIn,
                                              the values array must be non-empty. If the operator is Exists or DoesNotExist,
                                              the values array must be empty. This array is replaced during a strategic
                                              merge patch.
                                            items:
                                              type: string
                                            type: array
                                        required:
                                          - key
                                          - operator
                                        type: object
                                      type: array
                                    matchLabels:
                                      additionalProperties:
                                        type: string
                                      description: |-
                                        matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
                                        map is equivalent to an element of matchExpressions, whose key field is "key", the
                                        operator is "In", and the values array contains only "value". The requirements are ANDed.
                                      type: object
                                  type: object
                                  x-kubernetes-map-type: atomic
                              required:
                                - namespaceSelector
                                - podSelector
                              type: object
                          type: object
                        maxItems: 100
                        minItems: 1
                        type: array
                    required:
                      - action
                      - to
                    type: object
                    x-kubernetes-validations:
                      - message:
                          networks/nodes peer cannot be set with namedPorts since
                          there are no namedPorts for networks/nodes
                        rule:
                          "!(self.to.exists(peer, has(peer.networks) || has(peer.nodes))
                          && has(self.ports) && self.ports.exists(port, has(port.namedPort)))"
                  maxItems: 100
                  type: array
                ingress:
                  description: |-
                    Ingress is the list of Ingress rules to be applied to the selected pods.
                    A total of 100 rules will be allowed in each ANP instance.
                    The relative precedence of ingress rules within a single ANP object (all of
                    which share the priority) will be determined by the order in which the rule
                    is written. Thus, a rule that appears at the top of the ingress rules
                    would take the highest precedence.
                    ANPs with no ingress rules do not affect ingress traffic.


                    Support: Core
                  items:
                    description: |-
                      AdminNetworkPolicyIngressRule describes an action to take on a particular
                      set of traffic destined for pods selected by an AdminNetworkPolicy's
                      Subject field.
                    properties:
                      action:
                        description: |-
                          Action specifies the effect this rule will have on matching traffic.
                          Currently the following actions are supported:
                          Allow: allows the selected traffic (even if it would otherwise have been denied by NetworkPolicy)
                          Deny: denies the selected traffic
                          Pass: instructs the selected traffic to skip any remaining ANP rules, and
                          then pass execution to any NetworkPolicies that select the pod.
                          If the pod is not selected by any NetworkPolicies then execution
                          is passed to any BaselineAdminNetworkPolicies that select the pod.


                          Support: Core
                        enum:
                          - Allow
                          - Deny
                          - Pass
                        type: string
                      from:
                        description: |-
                          From is the list of sources whose traffic this rule applies to.
                          If any AdminNetworkPolicyIngressPeer matches the source of incoming
                          traffic then the specified action is applied.
                          This field must be defined and contain at least one item.


                          Support: Core
                        items:
                          description: |-
                            AdminNetworkPolicyIngressPeer defines an in-cluster peer to allow traffic from.
                            Exactly one of the selector pointers must be set for a given peer. If a
                            consumer observes none of its fields are set, they must assume an unknown
                            option has been specified and fail closed.
                          maxProperties: 1
                          minProperties: 1
                          properties:
                            namespaces:
                              description: |-
                                Namespaces defines a way to select all pods within a set of Namespaces.
                                Note that host-networked pods are not included in this type of peer.


                                Support: Core
                              properties:
                                matchExpressions:
                                  description:
                                    matchExpressions is a list of label selector
                                    requirements. The requirements are ANDed.
                                  items:
                                    description: |-
                                      A label selector requirement is a selector that contains values, a key, and an operator that
                                      relates the key and values.
                                    properties:
                                      key:
                                        description:
                                          key is the label key that the selector
                                          applies to.
                                        type: string
                                      operator:
                                        description: |-
                                          operator represents a key's relationship to a set of values.
                                          Valid operators are In, NotIn, Exists and DoesNotExist.
                                        type: string
                                      values:
                                        description: |-
                                          values is an array of string values. If the operator is In or NotIn,
                                          the values array must be non-empty. If the operator is Exists or DoesNotExist,
                                          the values array must be empty. This array is replaced during a strategic
                                          merge patch.
                                        items:
                                          type: string
                                        type: array
                                    required:
                                      - key
                                      - operator
                                    type: object
                                  type: array
                                matchLabels:
                                  additionalProperties:
                                    type: string
                                  description: |-
                                    matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
                                    map is equivalent to an element of matchExpressions, whose key field is "key", the
                                    operator is "In", and the values array contains only "value". The requirements are ANDed.
                                  type: object
                              type: object
                              x-kubernetes-map-type: atomic
                            pods:
                              description: |-
                                Pods defines a way to select a set of pods in
                                a set of namespaces. Note that host-networked pods
                                are not included in this type of peer.


                                Support: Core
                              properties:
                                namespaceSelector:
                                  description: |-
                                    NamespaceSelector follows standard label selector semantics; if empty,
                                    it selects all Namespaces.
                                  properties:
                                    matchExpressions:
                                      description:
                                        matchExpressions is a list of label
                                        selector requirements. The requirements are
                                        ANDed.
                                      items:
                                        description: |-
                                          A label selector requirement is a selector that contains values, a key, and an operator that
                                          relates the key and values.
                                        properties:
                                          key:
                                            description:
                                              key is the label key that the
                                              selector applies to.
                                            type: string
                                          operator:
                                            description: |-
                                              operator represents a key's relationship to a set of values.
                                              Valid operators are In, NotIn, Exists and DoesNotExist.
                                            type: string
                                          values:
                                            description: |-
                                              values is an array of string values. If the operator is In or NotIn,
                                              the values array must be non-empty. If the operator is Exists or DoesNotExist,
                                              the values array must be empty. This array is replaced during a strategic
                                              merge patch.
                                            items:
                                              type: string
                                            type: array
                                        required:
                                          - key
                                          - operator
                                        type: object
                                      type: array
                                    matchLabels:
                                      additionalProperties:
                                        type: string
                                      description: |-
                                        matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
                                        map is equivalent to an element of matchExpressions, whose key field is "key", the
                                        operator is "In", and the values array contains only "value". The requirements are ANDed.
                                      type: object
                                  type: object
                                  x-kubernetes-map-type: atomic
                                podSelector:
                                  description: |-
                                    PodSelector is used to explicitly select pods within a namespace; if empty,
                                    it selects all Pods.
                                  properties:
                                    matchExpressions:
                                      description:
                                        matchExpressions is a list of label
                                        selector requirements. The requirements are
                                        ANDed.
                                      items:
                                        description: |-
                                          A label selector requirement is a selector that contains values, a key, and an operator that
                                          relates the key and values.
                                        properties:
                                          key:
                                            description:
                                              key is the label key that the
                                              selector applies to.
                                            type: string
                                          operator:
                                            description: |-
                                              operator represents a key's relationship to a set of values.
                                              Valid operators are In, NotIn, Exists and DoesNotExist.
                                            type: string
                                          values:
                                            description: |-
                                              values is an array of string values. If the operator is In or NotIn,
                                              the values array must be non-empty. If the operator is Exists or DoesNotExist,
                                              the values array must be empty. This array is replaced during a strategic
                                              merge patch.
                                            items:
                                              type: string
                                            type: array
                                        required:
                                          - key
                                          - operator
                                        type: object
                                      type: array
                                    matchLabels:
                                      additionalProperties:
                                        type: string
                                      description: |-
                                        matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
                                        map is equivalent to an element of matchExpressions, whose key field is "key", the
                                        operator is "In", and the values array contains only "value". The requirements are ANDed.
                                      type: object
                                  type: object
                                  x-kubernetes-map-type: atomic
                              required:
                                - namespaceSelector
                                - podSelector
                              type: object
                          type: object
                        maxItems: 100
                        minItems: 1
                        type: array
                      name:
                        description: |-
                          Name is an identifier for this rule, that may be no more than 100 characters
                          in length. This field should be used by the implementation to help
                          improve observability, readability and error-reporting for any applied
                          AdminNetworkPolicies.


                          Support: Core
                        maxLength: 100
                        type: string
                      ports:
                        description: |-
                          Ports allows for matching traffic based on port and protocols.
                          This field is a list of ports which should be matched on
                          the pods selected for this policy i.e the subject of the policy.
                          So it matches on the destination port for the ingress traffic.
                          If Ports is not set then the rule does not filter traffic via port.


                          Support: Core
                        items:
                          description: |-
                            AdminNetworkPolicyPort describes how to select network ports on pod(s).
                            Exactly one field must be set.
                          maxProperties: 1
                          minProperties: 1
                          properties:
                            namedPort:
                              description: |-
                                NamedPort selects a port on a pod(s) based on name.


                                Support: Extended


                                <network-policy-api:experimental>
                              type: string
                            portNumber:
                              description: |-
                                Port selects a port on a pod(s) based on number.


                                Support: Core
                              properties:
                                port:
                                  description: |-
                                    Number defines a network port value.


                                    Support: Core
                                  format: int32
                                  maximum: 65535
                                  minimum: 1
                                  type: integer
                                protocol:
                                  default: TCP
                                  description: |-
                                    Protocol is the network protocol (TCP, UDP, or SCTP) which traffic must
                                    match. If not specified, this field defaults to TCP.


                                    Support: Core
                                  type: string
                              required:
                                - port
                                - protocol
                              type: object
                            portRange:
                              description: |-
                                PortRange selects a port range on a pod(s) based on provided start and end
                                values.


                                Support: Core
                              properties:
                                end:
                                  description: |-
                                    End defines a network port that is the end of a port range, the End value
                                    must be greater than Start.


                                    Support: Core
                                  format: int32
                                  maximum: 65535
                                  minimum: 1
                                  type: integer
                                protocol:
                                  default: TCP
                                  description: |-
                                    Protocol is the network protocol (TCP, UDP, or SCTP) which traffic must
                                    match. If not specified, this field defaults to TCP.


                                    Support: Core
                                  type: string
                                start:
                                  description: |-
                                    Start defines a network port that is the start of a port range, the Start
                                    value must be less than End.


                                    Support: Core
                                  format: int32
                                  maximum: 65535
                                  minimum: 1
                                  type: integer
                              required:
                                - end
                                - start
                              type: object
                          type: object
                        maxItems: 100
                        type: array
                    required:
                      - action
                      - from
                    type: object
                  maxItems: 100
                  type: array
                priority:
                  description: |-
                    Priority is a value from 0 to 1000. Rules with lower priority values have
                    higher precedence, and are checked before rules with higher priority values.
                    All AdminNetworkPolicy rules have higher precedence than NetworkPolicy or
                    BaselineAdminNetworkPolicy rules
                    The behavior is undefined if two ANP objects have same priority.


                    Support: Core
                  format: int32
                  maximum: 1000
                  minimum: 0
                  type: integer
                subject:
                  description: |-
                    Subject defines the pods to which this AdminNetworkPolicy applies.
                    Note that host-networked pods are not included in subject selection.


                    Support: Core
                  maxProperties: 1
                  minProperties: 1
                  properties:
                    namespaces:
                      description: Namespaces is used to select pods via namespace selectors.
                      properties:
                        matchExpressions:
                          description:
                            matchExpressions is a list of label selector
                            requirements. The requirements are ANDed.
                          items:
                            description: |-
                              A label selector requirement is a selector that contains values, a key, and an operator that
                              relates the key and values.
                            properties:
                              key:
                                description:
                                  key is the label key that the selector
                                  applies to.
                                type: string
                              operator:
                                description: |-
                                  operator represents a key's relationship to a set of values.
                                  Valid operators are In, NotIn, Exists and DoesNotExist.
                                type: string
                              values:
                                description: |-
                                  values is an array of string values. If the operator is In or NotIn,
                                  the values array must be non-empty. If the operator is Exists or DoesNotExist,
                                  the values array must be empty. This array is replaced during a strategic
                                  merge patch.
                                items:
                                  type: string
                                type: array
                            required:
                              - key
                              - operator
                            type: object
                          type: array
                        matchLabels:
                          additionalProperties:
                            type: string
                          description: |-
                            matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
                            map is equivalent to an element of matchExpressions, whose key field is "key", the
                            operator is "In", and the values array contains only "value". The requirements are ANDed.
                          type: object
                      type: object
                      x-kubernetes-map-type: atomic
                    pods:
                      description:
                        Pods is used to select pods via namespace AND pod
                        selectors.
                      properties:
                        namespaceSelector:
                          description: |-
                            NamespaceSelector follows standard label selector semantics; if empty,
                            it selects all Namespaces.
                          properties:
                            matchExpressions:
                              description:
                                matchExpressions is a list of label selector
                                requirements. The requirements are ANDed.
                              items:
                                description: |-
                                  A label selector requirement is a selector that contains values, a key, and an operator that
                                  relates the key and values.
                                properties:
                                  key:
                                    description:
                                      key is the label key that the selector
                                      applies to.
                                    type: string
                                  operator:
                                    description: |-
                                      operator represents a key's relationship to a set of values.
                                      Valid operators are In, NotIn, Exists and DoesNotExist.
                                    type: string
                                  values:
                                    description: |-
                                      values is an array of string values. If the operator is In or NotIn,
                                      the values array must be non-empty. If the operator is Exists or DoesNotExist,
                                      the values array must be empty. This array is replaced during a strategic
                                      merge patch.
                                    items:
                                      type: string
                                    type: array
                                required:
                                  - key
                                  - operator
                                type: object
                              type: array
                            matchLabels:
                              additionalProperties:
                                type: string
                              description: |-
                                matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
                                map is equivalent to an element of matchExpressions, whose key field is "key", the
                                operator is "In", and the values array contains only "value". The requirements are ANDed.
                              type: object
                          type: object
                          x-kubernetes-map-type: atomic
                        podSelector:
                          description: |-
                            PodSelector is used to explicitly select pods within a namespace; if empty,
                            it selects all Pods.
                          properties:
                            matchExpressions:
                              description:
                                matchExpressions is a list of label selector
                                requirements. The requirements are ANDed.
                              items:
                                description: |-
                                  A label selector requirement is a selector that contains values, a key, and an operator that
                                  relates the key and values.
                                properties:
                                  key:
                                    description:
                                      key is the label key that the selector
                                      applies to.
                                    type: string
                                  operator:
                                    description: |-
                                      operator represents a key's relationship to a set of values.
                                      Valid operators are In, NotIn, Exists and DoesNotExist.
                                    type: string
                                  values:
                                    description: |-
                                      values is an array of string values. If the operator is In or NotIn,
                                      the values array must be non-empty. If the operator is Exists or DoesNotExist,
                                      the values array must be empty. This array is replaced during a strategic
                                      merge patch.
                                    items:
                                      type: string
                                    type: array
                                required:
                                  - key
                                  - operator
                                type: object
                              type: array
                            matchLabels:
                              additionalProperties:
                                type: string
                              description: |-
                                matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels
                                map is equivalent to an element of matchExpressions, whose key field is "key", the
                                operator is "In", and the values array contains only "value". The requirements are ANDed.
                              type: object
                          type: object
                          x-kubernetes-map-type: atomic
                      required:
                        - namespaceSelector
                        - podSelector
                      type: object
                  type: object
              required:
                - priority
                - subject
              type: object
            status:
              description: Status is the status to be reported by the implementation.
              properties:
                conditions:
                  items:
                    description:
                      "Condition contains details for one aspect of the current
                      state of this API Resource.\n---\nThis struct is intended for
                      direct use as an array at the field path .status.conditions.  For
                      example,\n\n\n\ttype FooStatus struct{\n\t    // Represents the
                      observations of a foo's current state.\n\t    // Known .status.conditions.type
                      are: \"Available\", \"Progressing\", and \"Degraded\"\n\t    //
                      +patchMergeKey=type\n\t    // +patchStrategy=merge\n\t    // +listType=map\n\t
                      \   // +listMapKey=type\n\t    Conditions []metav1.Condition `json:\"conditions,omitempty\"
                      patchStrategy:\"merge\" patchMergeKey:\"type\" protobuf:\"bytes,1,rep,name=conditions\"`\n\n\n\t
                      \   // other fields\n\t}"
                    properties:
                      lastTransitionTime:
                        description: |-
                          lastTransitionTime is the last time the condition transitioned from one status to another.
                          This should be when the underlying condition changed.  If that is not known, then using the time when the API field changed is acceptable.
                        format: date-time
                        type: string
                      message:
                        description: |-
                          message is a human readable message indicating details about the transition.
                          This may be an empty string.
                        maxLength: 32768
                        type: string
                      observedGeneration:
                        description: |-
                          observedGeneration represents the .metadata.generation that the condition was set based upon.
                          For instance, if .metadata.generation is currently 12, but the .status.conditions[x].observedGeneration is 9, the condition is out of date
                          with respect to the current state of the instance.
                        format: int64
                        minimum: 0
                        type: integer
                      reason:
                        description: |-
                          reason contains a programmatic identifier indicating the reason for the condition's last transition.
                          Producers of specific condition types may define expected values and meanings for this field,
                          and whether the values are considered a guaranteed API.
                          The value should be a CamelCase string.
                          This field may not be empty.
                        maxLength: 1024
                        minLength: 1
                        pattern: ^[A-Za-z]([A-Za-z0-9_,:]*[A-Za-z0-9_])?$
                        type: string
                      status:
                        description: status of the condition, one of True, False, Unknown.
                        enum:
                          - "True"
                          - "False"
                          - Unknown
                        type: string
                      type:
                        description: |-
                          type of condition in CamelCase or in foo.example.com/CamelCase.
                          ---
                          Many .condition.type values are consistent across resources like Available, but because arbitrary conditions can be
                          useful (see .node.status.conditions), the ability to deconflict is important.
                          The regex it matches is (dns1123SubdomainFmt/)?(qualifiedNameFmt)
                        maxLength: 316
                        pattern: ^([a-z0-9]([-a-z0-9]*[a-z0-9])?(\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*/)?(([A-Za-z0-9][-A-Za-z0-9_.]*)?[A-Za-z0-9])$
                        type: string
                    required:
                      - lastTransitionTime
                      - message
                      - reason
                      - status
                      - type
                    type: object
                  type: array
                  x-kubernetes-list-map-keys:
                    - type
                  x-kubernetes-list-type: map
              required:
                - conditions
              type: object
          required:
            - metadata
            - spec
          type: object
      served: true
      storage: true
      subresources:
        status: {}