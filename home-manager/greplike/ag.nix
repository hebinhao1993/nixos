{pkgs, ...} : 
{
  home.packages = with pkgs; [
    silver-searcher
  ];
  home.programs = {
    # TODO
  };
}