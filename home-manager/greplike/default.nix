{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./ack.nix
    ./ag.nix
    ./rg.nix
  ];
}
