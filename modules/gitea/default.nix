{ inputs, lib, config, pkgs, ... }: 
{
  sops.age.keyFile = "/var/lib/sops-nix/keys.txt";
  sops.secrets."gitea/db_pass" = {
      sopsFile = ../../secrets/gitea/db.yaml; # bring your own password file
      owner = config.users.users.gitea.name;
  };

  services.gitea = {
    enable = true; # Enable Gitea
    appName = "nixvb: Gitea Service"; # Give the site a name
    database = {
      type = "postgres"; # Database type
      passwordFile = config.sops.secrets."gitea/db_pass".path;
    };
    settings.server = {
      ROOT_URL = "http://gitea.nixvb.com/"; # Root web URL
      HTTP_PORT = 3001; # Provided unique port
      DOMAIN = "gitea.nixvb.com"; # Domain name
    };  
  };

  services.postgresql = {
    enable = true;
    authentication = ''
      local gitea all ident map=gitea-users
    '';
    identMap =                    # Map the gitea user to postgresql
      ''
        gitea-users gitea gitea
      '';
  };

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts."gitea.nixvb.com" = {                  # Gitea hostname
      locations."/".proxyPass = "http://localhost:3001/";   # Proxy Gitea
    };
  };
}