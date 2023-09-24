{ config, pkgs, lib, ... }:
{
  services.nginx.virtualHosts."nextcloud.nixvb.com" = {};

  sops.secrets= {
    "nextcloud/adminpass" = {
      format = "binary";
      sopsFile = ../../secrets/default.yaml;
      owner = config.users.users.nextcloud.name;
    };
    "nextcloud/dbpass" = {
      format = "binary";
      sopsFile = ../../secrets/deafult.yaml;
      owner = config.users.users.nextcloud.name;
    };
  };
  

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud26;
    https = false;
    webfinger = true;
    hostName = "nextcloud.nixvb.com";
    maxUploadSize = "10240M";
    database.createLocally = true;
    config = {
      defaultPhoneRegion = "CN";
      adminuser = "nextcloudamdin"; 
      adminpassFile = config.sops.secrets."nextcloud-admin_pass".path;
      dbtype = "pgsql";
      dbname = "nextcloud";
      dbuser = "nextcloud";
      # dbpassFile = config.sops.secrets."nextcloud-db_pass".path; #  Using `services.nextcloud.database.createLocally` with database password authentication is no longer supported.
    }; 
  };
}