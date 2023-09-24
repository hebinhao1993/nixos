{ config, pkgs, lib, ... }:
{
  services.nginx.virtualHosts."nextcloud.nixvb.com" = {};

  sops.secrets= {
    "nextcloud-admin_pass" = {
      sopsFile = ../../secrets/nextcloud/admin.pass; # bring your own password file
      owner = config.users.users.nextcloud.name;
    };
    "nextcloud-db_pass" = {
      sopsFile = ../../secrets/nextcloud/db.pass; # bring your own password file
      owner = config.users.users.nextcloud.name;
    };
  };
  

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud27;
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
      dbpassFile = config.sops.secrets."nextcloud-db_pass".path;
    }; 
  };
}