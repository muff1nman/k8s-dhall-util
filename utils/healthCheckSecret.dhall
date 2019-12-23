let types =
      ../types.dhall sha256:a9d8778318985fe775afa84fd625aefaa9ece48b236d7e2c7dabe8f05ce80824

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
