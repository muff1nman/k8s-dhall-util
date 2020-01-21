let types =
      ../types.dhall sha256:f5ebc695abcb3b0523153141aed12519b5b77a8af79477dc5dfe315448a95e45

let defaults =
      ../defaults.dhall sha256:f6d1c152b61bdb5df14850a4198e7aea9038cc3d3f7051df25759225ea87ea3d

let Text/concatSep =
      https://prelude.dhall-lang.org/Text/concatSep sha256:e4401d69918c61b92a4c0288f7d60a6560ca99726138ed8ebc58dca2cd205e58

let healthCheckConfig =
        λ(config : types.HealthCheckConfig)
      → let tags = Text/concatSep " " config.tags
        
        let timeout = Natural/show config.timeout
        
        let grace = Natural/show config.grace
        
        let configMap
            : types.k8s.ConfigMap
            =   defaults.k8s.ConfigMap
              ⫽ { metadata = defaults.k8s.ObjectMeta ⫽ { name = config.name }
                , data =
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
