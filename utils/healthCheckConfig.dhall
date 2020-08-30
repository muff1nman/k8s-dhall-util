let types =
      ../types.dhall sha256:523d5081adfc10bb3e45e62bed8efe6cd81d231a24a73e95b822b9762a57d0ca

let defaults =
      ../defaults.dhall sha256:57474272975373d98b04275174d65ebd367e314cd792e2822752da054ee2a6c4

let Text/concatSep =
      https://prelude.dhall-lang.org/Text/concatSep sha256:e4401d69918c61b92a4c0288f7d60a6560ca99726138ed8ebc58dca2cd205e58

let healthCheckConfig =
      λ(config : types.HealthCheckConfig) →
        let tags = Text/concatSep " " config.tags

        let timeout = Natural/show config.timeout

        let grace = Natural/show config.grace

        let configMap
            : types.k8s.ConfigMap
            =   defaults.k8s.ConfigMap
              ⫽ { metadata =
                    defaults.k8s.ObjectMeta ⫽ { name = Some config.name }
                , data = Some
                  [ { mapKey = "check.json"
                    , mapValue =
                        ''
                        { "name": "${config.name}",
                          "tags": "${tags}",
                          "timeout": ${timeout},
                          "grace": ${grace},
                          "channels": "*",
                          "unique": [ "name" ]
                        }
                        ''
                    }
                  ]
                }

        in  configMap

in  healthCheckConfig
