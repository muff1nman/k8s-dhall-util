let types =
      ../types.dhall sha256:f5ebc695abcb3b0523153141aed12519b5b77a8af79477dc5dfe315448a95e45

let defaults =
      ../defaults.dhall sha256:f6d1c152b61bdb5df14850a4198e7aea9038cc3d3f7051df25759225ea87ea3d

let healthCheckEndpoint =
        λ(endpoint : types.HealthCheckEndpoint)
      → let secret
            : types.k8s.Secret
            =   defaults.k8s.Secret
              ⫽ { metadata = defaults.k8s.ObjectMeta ⫽ { name = "health-check" }
                , stringData =
                    [ { mapKey = "hostname", mapValue = endpoint.hostname }
                    , { mapKey = "apikey", mapValue = endpoint.apikey }
                    ]
                }
        
        in  secret

in  healthCheckEndpoint
