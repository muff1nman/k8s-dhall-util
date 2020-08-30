let types =
      ../types.dhall sha256:f5ebc695abcb3b0523153141aed12519b5b77a8af79477dc5dfe315448a95e45

let defaults =
      ../defaults.dhall sha256:f6d1c152b61bdb5df14850a4198e7aea9038cc3d3f7051df25759225ea87ea3d

let sshKeySecret =
      λ(sshKey : types.SshKey) →
        let knownHostsData =
              merge
                { None = [] : List { mapKey : Text, mapValue : Text }
                , Some =
                    λ(x : Text) → [ { mapKey = "known_hosts", mapValue = x } ]
                }
                sshKey.knownHosts

        let secret
            : types.k8s.Secret
            =   defaults.k8s.Secret
              ⫽ { metadata =
                      defaults.k8s.ObjectMeta
                    ⫽ { name = sshKey.objname
                      , annotations = sshKey.additionalAnnotations
                      }
                , type = Some "kubernetes.io/ssh-auth"
                , stringData =
                      [ { mapKey = "ssh-publickey"
                        , mapValue = sshKey.publicKey
                        }
                      , { mapKey = "ssh-privatekey"
                        , mapValue = sshKey.privateKey
                        }
                      ]
                    # knownHostsData
                }

        in  secret

in  sshKeySecret
