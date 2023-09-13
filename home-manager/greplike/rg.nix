{config, pkgs, ...} : 
{
  home.packages = with pkgs; [
    ripgrep
  ];
  programs = {
    # TODO
  };
}