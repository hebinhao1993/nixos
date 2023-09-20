{config, pkgs, ...} : 
{
  programs.git = {
    enable = true;
    userName = "hebinhao1993";
    userEmail = "hebinhao1993@outlook.com";
    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status";
      br = "branch";
      p = "pull";
      f = "fetch";
      lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      last = "log -1 HEAD";
    };
  };
}