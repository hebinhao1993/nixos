{config, pkgs, ...} : 
{
  home.packages = with pkgs; [
    silver-searcher
  ];
  programs = {
    # TODO
  };
}