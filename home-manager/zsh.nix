{pkg, ...} : 
{
  home.programs = {
    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "vi-mode"
          "jump"
        ]
      };
      envExtra = ''
if [ -e ''${HOME}/.nix-profile/etc/profile.d/nix.sh ]; then . ''$HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
      '';
      #  这部分脚本会在 .zshrc 最前面, 先于 oh-my-zsh 和其他脚本
      initExtraFirst = ''
      '';
      # 这部分脚本优先级低于其他的
      initExtra = ''
      '';
      };
  };
}