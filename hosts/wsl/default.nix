{ pkgs, ... }:
{
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

  # Enable nix flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  environment.systemPackages = with pkgs; [
    tree
    file
    wsl-open
    git
    vim
  ];

  system.stateVersion = "23.05";
}