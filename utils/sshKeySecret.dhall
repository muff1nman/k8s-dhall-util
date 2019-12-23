let types =
      ../types.dhall sha256:a9d8778318985fe775afa84fd625aefaa9ece48b236d7e2c7dabe8f05ce80824

let defaults =
      ../defaults.dhall sha256:f6d1c152b61bdb5df14850a4198e7aea9038cc3d3f7051df25759225ea87ea3d

let sshKeySecret =
        λ(sshKey : types.SshKey)
      → let knownHostsData =
              Optional/fold
                Text
                sshKey.knownHosts
                (List { mapKey : Text, mapValue : Text })
                (λ(x : Text) → [ { mapKey = "known_hosts", mapValue = x } ])
                ([] : List { mapKey : Text, mapValue : Text })
        
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
