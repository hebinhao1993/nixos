{ config, pkgs, lib, ... }:
{
  services.nginx.virtualHosts."sftp.nixvb.com" = {
    locations."/".proxyPass = "http://localhost:3002/";
  };

  # TODO: add webdav
  services.sftpgo = {
    enable = true;
    settings = {
      httpd.bindings = [
        {
          port = 3002;
        }
      ];
    };
  };
}