{config, pkgs, ...} : 
{
  home.packages = with pkgs; [
    tldr
  ];
  programs = {
    # TODO
  };
}