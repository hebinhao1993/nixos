{pkgs, ...} : 
{
  home.packages = with pkgs; [
    ripgrep
  ];
  home.programs = {
    # TODO
  };
}