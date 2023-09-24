# README

## directory `dotfiles`

the dirctory `dotfiles` is a copy of https://github.com/hebinhao1993/dotfiles.

why not use git submodule? nix flake does not support git submodule quiet well, although there exists some support. see https://github.com/NixOS/nix/issues/4357, https://github.com/NixOS/nix/pull/4435, https://github.com/NixOS/nix/issues/4423, https://discourse.nixos.org/t/get-nix-flake-to-include-git-submodule/30324, https://discourse.nixos.org/t/nixos-build-flake-cant-read-a-file-in-a-submodule/21932.

Yes, we can use `nixos-rebuild switch --flake '.?submodules=1#nixwsl'` to enable submodule features, however it is not the default behavior.
Besides, the use of submodule break the decentralization. When I import the nixos configuration repo to bitbucket, gitlab or self-hosted private git services, the submodule still point to the https://github.com/hebinhao1993/dotfiles. git-subtree is another method to handle this problem, but git-subtree itself introduce other problems. For example, `git subtree split --rejoin` will produce the same commit, which is ugly.

The content of `dotfiles` should be exactly the same as some commit of https://github.com/hebinhao1993/dotfiles when in the master/main branch of this nixos repo. The `version.txt` is an exception, which is used to track the commit id of https://github.com/hebinhao1993/dotfiles.

When in the dev branch, the content of `dotfiles` can be different.

## TODO

- VSCode