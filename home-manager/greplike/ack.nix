{config, pkgs, ...} : 
{
  home.packages = with pkgs; [
    ack
  ];
  programs = {
    # TODO
  };
}