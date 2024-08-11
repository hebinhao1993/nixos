# README

Using sops-nix to manage secrets.

## how to generate new secrets

if you store your secrets into secrets/example.yaml, using:

```sh
nix-shell -p sops --run "sops secrets/example.yaml"
```

this command will open editor to create a new encrypted file or to decrypt an existing file to modify.

if you store your secret into `secrets/example/binary`, using:
```
nix-shell -p sops --run "sops -e some-source-file > secrets/example/binary"
```

**Note**: you should meet the requirement of creation_rules defined in .sops.yaml. If not, you can not create encrypted files.
When using binary format， the source file should satisfy the requirement.

## the name requirements

when you use `sops.secrets.<name> = {...}`， the name should be the corresponding key.

For example, in `module/gitea/default.nix`， I use:

```
sops.secrets."gitea/dbpass" = {
      sopsFile = ../../secrets/default.yaml; # bring your own password file
      owner = config.users.users.gitea.name;
  };
```

the name `gitea/dbpass` means you select the value from the yaml file with key `gitea/dbpass`. It cannot be an arbitray name.

sops-nix will generate a file for every entry in the yaml file.