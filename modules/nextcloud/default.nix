{ config, pkgs, lib, ... }:
{
  services.nginx.virtualHosts."nextcloud.nixvb.com" = {};

  sops.secrets= {
    "nextcloud/adminpass" = {
      format = "yaml";
      sopsFile = ../../secrets/default.yaml;
      owner = config.users.users.nextcloud.name;
    };
    "nextcloud/dbpass" = {
      format = "yaml";
      sopsFile = ../../secrets/default.yaml;
      owner = config.users.users.nextcloud.name;
    };
  };
  

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud29;
    https = false;
    webfinger = true;
    hostName = "nextcloud.nixvb.com";
    maxUploadSize = "10240M";
    database.createLocally = true;
    setttings = {
      defaultPhoneRegion = "CN";
    };
    config = {
      adminuser = "nextcloudamdin"; 
      adminpassFile = config.sops.secrets."nextcloud/adminpass".path;
      dbtype = "pgsql";
      dbname = "nextcloud";
      dbuser = "nextcloud";
      # dbpassFile = config.sops.secrets."nextcloud/dbpass".path; #  Using `services.nextcloud.database.createLocally` with database password authentication is no longer supported.
    }; 
  };
}