{config, pkgs, ...} : 
{
  programs = {
    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      enableAutosuggestions = true;
      enableCompletion = true;
      # Extra commands that should be added to .zshenv
      envExtra = ''
if [ -e ''${HOME}/.nix-profile/etc/profile.d/nix.sh ]; then . ''$HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
      '';
      #  这部分脚本会在 .zshrc 最前面
      initExtraFirst = ''
      '';
      # 这部分脚本优先级低于其他的，Extra commands that should be added to .zshrc
      initExtra = ''
      '';
    };
  };
}