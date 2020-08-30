{ healthCheckSecret =
    ./utils/healthCheckSecret.dhall sha256:497484c74c6fe4f5ad8631542e5a41352e919acca6f16cb694c73edf3b6fcd33
, healthCheckConfig =
    ./utils/healthCheckConfig.dhall sha256:7bd22e6cf4462d3ed38ad905d9a12c5f7c474a157308e4fea4b2208935eda026
, sshKeySecret =
    ./utils/sshKeySecret.dhall sha256:d0d6e6d11be6e7fe8efb049cdd90a12f0d43254ba6a29c39fcfb0d24fad74516
, kv =
    ( https://raw.githubusercontent.com/dhall-lang/dhall-kubernetes/59132b47b7c796eeeca576cb7ca6b96077b56be6/1.17/Prelude.dhall sha256:10db3c919c25e9046833df897a8ffe2701dc390fa0893d958c3430524be5a43e
    ).JSON.keyText
}
