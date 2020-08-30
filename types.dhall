{ k8s =
    https://raw.githubusercontent.com/dhall-lang/dhall-kubernetes/59132b47b7c796eeeca576cb7ca6b96077b56be6/1.17/types.dhall sha256:e16b14585f9e7f1ff02e35e5469d93e31caaa74b94373b7795f72e7799a17dd8
, k8sUnion =
    https://raw.githubusercontent.com/dhall-lang/dhall-kubernetes/59132b47b7c796eeeca576cb7ca6b96077b56be6/1.17/typesUnion.dhall sha256:7cfce6d27d8cbf87986ed23a48a755deb18f092218806bfbdd73a8f36845e708
, HealthCheckEndpoint =
    ./types/healthCheckEndpoint.dhall sha256:0a5fbddb1348c6aa66c39d4688e7bf72ffe185bee514b4f37439d2fa4b4ca12b
, HealthCheckConfig =
    ./types/healthCheckConfig.dhall sha256:e423c507a71e5c9b8f8fb27cb757f71c5be14cacf9009e17983b87bdb664fd30
, SshKey =
    ./types/sshKey.dhall sha256:4d8f56be35b395d0e84d9c22316517054b49b58980f97ad69edc486cf9d054bb
}
