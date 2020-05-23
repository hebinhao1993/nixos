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
                enabled = true;
            };
            efi.canTouchEfiVariable = true;
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
        openssh.enable = true;
        xserver = {
            enable = true;
            layout = "us";
            displayManager.lightdm = {
                enable = true;
                greeters.pantheon.enable = true;
            };
            desktopManager.pantheon.enable = true;
            
        };
    };

    programs.bash.enableCompletion = true;
    sound.enable = true;
    hardware.pulseaudio.enable = true;

    system.stateVersion = "20.03";
}