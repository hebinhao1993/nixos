{config, pkgs, ...} : 
{
  home.packages = with pkgs; [
    tmux
  ];
  home.file.".config/tmux/tmux.conf" = {
    enable = true;
    source = builtins.path { path = ../dotfiles/src/.tmux.conf; name = "tmuxconf"; };
    target = ".config/tmux/tmux.conf";
  };
}