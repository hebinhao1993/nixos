{ lib, pkgs, config, modulesPath, ... }:
{
  imports = [
    "${modulesPath}/profiles/minimal.nix"
  ];
  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    defaultUser = "hbh";
    startMenuLaunchers = true;

    # Enable native Docker support
    # docker-native.enable = true;

    # Enable integration with Docker Desktop (needs to be installed)
    # docker-desktop.enable = true;

  };
  networking.hostName = "nixwsl";

  # zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  
  # Enable nix flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    wget
  ];

  system.stateVersion = "24.05";
}