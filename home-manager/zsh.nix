{config, pkgs, ...} : 
{
  programs = {
    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      # Extra commands that should be added to .zshenv
      # TODO: the envExtra setting seems to be useless
      envExtra = ''
if [ -e ''${HOME}/.nix-profile/etc/profile.d/nix.sh ]; then . ''$HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
      '';
      #  这部分脚本会在 .zshrc 最前面
      initExtraFirst = ''
      '';
      # 这部分脚本优先级低于其他的，Extra commands that should be added to .zshrc
      initExtra = ''
ZIM_HOME=~/.cache/zim

# Download zimfw plugin manager if missing.
if [[ ! -e ''${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ''${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ''${ZIM_HOME}/init.zsh -nt ''${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ''${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules.
source ''${ZIM_HOME}/init.zsh
      '';
    };
  };

  home.file.".config/zsh/.zimrc" = {
    enable = true;
    source = "../dotfiles/src/.zimrc";
    target = ".config/zsh/.zimrc";
  };
}