{pkgs, ...} : 
{
  home.packages = with pkgs; [
    ack
  ];
  home.programs = {
    # TODO
  };
}