{ k8s =
    https://raw.githubusercontent.com/dhall-lang/dhall-kubernetes/4ad58156b7fdbbb6da0543d8b314df899feca077/types.dhall sha256:e48e21b807dad217a6c3e631fcaf3e950062310bfb4a8bbcecc330eb7b2f60ed
, k8sUnion =
    https://raw.githubusercontent.com/dhall-lang/dhall-kubernetes/4ad58156b7fdbbb6da0543d8b314df899feca077/typesUnion.dhall sha256:8e8db456b218b93f8241d497e54d07214b132523fe84263e6c03496c141a8b18
, HealthCheckEndpoint =
    ./types/healthCheckEndpoint.dhall sha256:0a5fbddb1348c6aa66c39d4688e7bf72ffe185bee514b4f37439d2fa4b4ca12b
, SshKey =
    ./types/sshKey.dhall sha256:4d8f56be35b395d0e84d9c22316517054b49b58980f97ad69edc486cf9d054bb
}
