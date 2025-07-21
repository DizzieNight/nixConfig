{inputs, config, lib, pkgs, ...}:

{
    options.system = {
        laptop = lib.mkEnableOption "laptop";
    };

    imports = [
        ./audio.nix
        ./boot.nix
        ./users.nix
        ./hyprland.nix
        ./gamingmode.nix
        ./security.nix
    ];

    config = {

    # Default set of packages to have on a bare system
        environment.systemPackages = with pkgs; [
        # System Tools
            wget
            git
            neovim
            dysk
            sudo
            zsh
            ly
            home-manager
            brightnessctl
            easyeffects
            fastfetch
            fprintd
            iwd
            power-profiles-daemon
            pwvucontrol
            tailscale
            tealdeer
            pay-respects
            zip
            unzip
        # Apps
            librewolf
            thunderbird
            protonmail-bridge-gui
            putty
            gimp3
            godot
            goverlay
            mangohud
            nextcloud-client
            obsidian
            goxel
            kdePackages.gwenview
            kdePackages.kdeconnect-kde 
            lazygit
            libreoffice-fresh
            kubernetes-helm
            impala
            inkscape
            kitty
            btop
            superfile
            ghostty
            bluetui
        # Programming Languages
            dart
            libgcc
        # K8s Tools
            kubectl
            kubectx
            kubecm
            kubent
            kubetui
            talosctl
        # Fonts
            font-awesome
            noto-fonts-color-emoji
            nerd-fonts.jetbrains-mono
        ];

        time.timeZone = "Australia/Melbourne";
        
        services.openssh.enable = true;

        # Use latest kernel.
        boot.kernelPackages = pkgs.linuxPackages_latest;

        networking.networkmanager.enable = true;
        
        services.xserver.enable = true;

        xdg.portal = {
            enable = true;
            extraPortals = [
                pkgs.xdg-desktop-portal-hyprland
            ];
        };

        # Enable Ly as the display manager
        services.displayManager.ly.enable = true;

        # Enable touchpad support (enabled default in most desktopManager).
        services.libinput = lib.mkIf config.system.laptop {
            enable = true;
        };

        # Custom Modules
        # hyprland.enable = lib.mkDefault true;
        gamingmode.enable = lib.mkDefault true;
    };
}
