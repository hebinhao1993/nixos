{config, pkgs, ...} : 
{
  home.packages = with pkgs; [
    cheat
  ];
  programs = {
    # TODO
  };
}