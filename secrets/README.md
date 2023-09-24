# README

Using sops-nix to manage secrets.

## how to generate new secrets

if you store your secrets into secrets/gitea/db.yaml, using:

```sh
nix-shell -p sops --run "sops secrets/example.yaml"
```

if you store your secret into `secrets/example/binary`, using:
```
nix-shell -p sops --run "sops -e some-source-file > secrets/example/binary"
```