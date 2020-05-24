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

    environment.variables = {
        TERMINAL = "termite"; # i3wm 启动终端优先启动该环境变量所指定的。见[此](https://build.i3wm.org/docs/i3-sensible-terminal.html)
    };
    environment.pathsToLink = [ "/libexec" ];

    environment.systemPackages = with pkgs; [
        firefox
        git
        vim
        wget
        termite # terminal
        clipmenu
        zathura # vim style pdf viewer
        polybar # A fast and easy to use tool for creating status bars
        sdcv # star dict under console version
        ranger # file manger
    ];
    
    fonts = {
        enableDefaultFonts = true;
        fontconfig.enable = true;
        enableFontDir = true;
        enableGhostscriptFonts = true;
        fonts = with pkgs; [
            # fira 
            fira 
            fira-code # FiraCode: font for coding, https://github.com/tonsky/FiraCode
            fira-mono
            fira-code-symbols
            # noto
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji
            # The Liberation(tm) Fonts is a font family which aims at metric compatibility with Arial, Times New Roman, and Courier New. It is sponsored by Red Hat.
            liberation_ttf
            # adobe  
            source-code-pro
            source-sans-pro
            source-han-sans-simplified-chinese
            source-han-sans-traditional-chinese
            # be5invis's font
            iosevka
            sarasa-gothic
            # others
            font-awesome
            ubuntu_font_family
            # nerdfonts # it will try to download from github, so comment it in case of bad networking.
            opensans-ttf
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