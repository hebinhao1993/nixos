{config, pkgs, ...} : 
{
  home.packages = with pkgs; [
    z-lua
  ];
  programs.z-lua = {
    # TODO
    # see https://mipmip.github.io/home-manager-option-search/?query=z-lua
    # enable = true;
    # options = [];
  };
}