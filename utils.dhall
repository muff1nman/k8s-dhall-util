{ healthCheckSecret =
    ./utils/healthCheckSecret.dhall sha256:327a969bf6983186a7dd207268f0e41cb223eb5190a42f6e1fd2f3742392b097
, healthCheckConfig =
    ./utils/healthCheckConfig.dhall sha256:f4292e193548e6e599c09c180f9447c06a3a4adfc94305fb5c7af690a7e1b097
, sshKeySecret =
    ./utils/sshKeySecret.dhall sha256:b717b5a7bdbf43f40ee885f62d1640af2d095d647e125cd9506586a87f412fd2
, kv =
    ( https://raw.githubusercontent.com/dhall-lang/dhall-kubernetes/59132b47b7c796eeeca576cb7ca6b96077b56be6/1.17/Prelude.dhall sha256:10db3c919c25e9046833df897a8ffe2701dc390fa0893d958c3430524be5a43e
    ).JSON.keyText
}
