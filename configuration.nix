{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
    ];

    nix.binaryCaches = [ 
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    ];

    boot = {
        loader = {
            systemd-boot = {
                enable = true;
            };
            efi.canTouchEfiVariables = true;
        };
    };

    networking = {
        hostName = "vbox-nixos-7561";
        useDHCP = false;
        interfaces = {
            enp0s3.useDHCP = true;
        };
    };

    i18n = {
        defaultLocale = "zh_CN.UTF-8";
        supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
    };

    time.timeZone = "Asia/Shanghai";

    nixpkgs.config.allowUnfree = true;

    environment.pathsToLink = [ "/libexec" ];

    environment.systemPackages = with pkgs; [
        firefox
        git
        vim
        wget
    ];
    
    fonts = {
        enableDefaultFonts = true;
        fontconfig.enable = true;
        enableFontDir = true;
        enableGhostscriptFonts = true;
        fonts = with pkgs; [
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji
            wqy_microhei
            wqy_zenhei
        ];
    };
   
    
    services = {
        xserver = {
            enable = true;
            layout = "us";
            desktopManager = {
                xterm.enable = false;
            };
            displayManager = {
                defaultSession = "none+i3";
                lightdm = {
                    enable = true;
                    autoLogin = {
                        enable = true;
                        user = "hbh";
                    };
                };
            };
            windowManager = {
                i3 = {
                    enable = true;
                    extraPackages = with pkgs; [
                        rofi
                        i3status
                        i3lock
                        i3blocks
                    ];
                };
            };
        };
    };

    programs.bash.enableCompletion = true;
    sound.enable = true;
    hardware.pulseaudio.enable = true;

    users.users.hbh = {
        isNormalUser = true;
        home = "/home/hbh";
        description = "hebinhao";
        extraGroups = [ "wheel" ];
    };

    system.stateVersion = "20.03";
}