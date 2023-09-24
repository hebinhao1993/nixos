# README

Does not like gitea, nextcloud is just a collection of php files. It does not contain a webserver, unlike gitea. As a result `services.nextcloud.` does not has any configuration for the http port. Instead, we set `services.nginx.virtualHosts.<name>`. See more at [TLATER's answer](https://discourse.nixos.org/t/accessing-nextcloud-on-local-network/23193/2).