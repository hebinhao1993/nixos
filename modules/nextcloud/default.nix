{ config, pkgs, lib, ... }:
{
  services.nginx.virtualHosts."nextcloud.nixvb.com" = {};

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
      adminpassFile = "/etc/nextcloud-admin-password";
      dbtype = "pgsql";
      dbname = "nextcloud";
      dbuser = "nextcloud";
      dbpassFile = "/etc/nextcloud-db-password";
    }; 
  };
}