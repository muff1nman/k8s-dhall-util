let types =
      ../types.dhall sha256:523d5081adfc10bb3e45e62bed8efe6cd81d231a24a73e95b822b9762a57d0ca

let defaults =
      ../defaults.dhall sha256:57474272975373d98b04275174d65ebd367e314cd792e2822752da054ee2a6c4

let healthCheckEndpoint =
      λ(endpoint : types.HealthCheckEndpoint) →
        let secret
            : types.k8s.Secret
            =   defaults.k8s.Secret
              ⫽ { metadata =
                    defaults.k8s.ObjectMeta ⫽ { name = Some "health-check" }
                , stringData = Some
                  [ { mapKey = "hostname", mapValue = endpoint.hostname }
                  , { mapKey = "apikey", mapValue = endpoint.apikey }
                  ]
                }

        in  secret

in  healthCheckEndpoint
