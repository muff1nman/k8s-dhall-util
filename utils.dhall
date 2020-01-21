{ healthCheckSecret =
    ./utils/healthCheckSecret.dhall sha256:497484c74c6fe4f5ad8631542e5a41352e919acca6f16cb694c73edf3b6fcd33
, healthCheckConfig =
    ./utils/healthCheckConfig.dhall sha256:7bd22e6cf4462d3ed38ad905d9a12c5f7c474a157308e4fea4b2208935eda026
, sshKeySecret =
    ./utils/sshKeySecret.dhall sha256:7851a415d49bf49196c9643c9caab8f2fe91938e0aac4df9e717cd563b7a7553
, kv =
    ( https://raw.githubusercontent.com/dhall-lang/dhall-kubernetes/dea2c92017c8e4a9213023d9a5a1d0ad8afedb3b/Prelude.dhall sha256:771c7131fc87e13eb18f770a27c59f9418879f7e230ba2a50e46f4461f43ec69
    ).JSON.keyText
}
