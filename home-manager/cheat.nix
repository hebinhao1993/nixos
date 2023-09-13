{pkgs, ...} : 
{
  home.packages = with pkgs; [
    cheat
  ];
  home.programs = {
    # TODO
  };
}