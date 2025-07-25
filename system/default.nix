{inputs, config, lib, pkgs, ...}:

{
    options.system = {
        laptop = lib.mkEnableOption "laptop";
    };

    imports = [
        ./audio.nix
        ./boot.nix
        ./users.nix
        ./gamingmode.nix
        ./security.nix
        ./displaymanager.nix
        ./hyprland.nix
        ./networking.nix
        ./shell.nix
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
            fzf
            fzf-zsh
            zsh-fzf-tab
            zsh-fzf-history-search
            zsh-powerlevel10k
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
            superfile
            # ghostty
            bluetui
        # Programming Languages
            dart
            gcc
        # K8s Tools
            kubectl
            kubectx
            kubecm
            kubent
            kubetui
            talosctl
        ];

        fonts.packages = with pkgs; [
            font-awesome
            noto-fonts-color-emoji
            nerd-fonts.jetbrains-mono
            nerd-fonts.bigblue-terminal
        ];

        time.timeZone = "Australia/Melbourne";

	i18n.defaultLocale = "en_AU.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_AU.UTF-8";
		LC_IDENTIFICATION = "en_AU.UTF-8";
		LC_MEASUREMENT = "en_AU.UTF-8";
		LC_MONETARY = "en_AU.UTF-8";
		LC_NAME = "en_AU.UTF-8";
		LC_NUMERIC = "en_AU.UTF-8";
		LC_PAPER = "en_AU.UTF-8";
		LC_TELEPHONE = "en_AU.UTF-8";
		LC_TIME = "en_AU.UTF-8";
	};

	services.xserver.xkb = {
		layout = "au";
		variant = "";
	};
        services.openssh.enable = true;

        # Use latest kernel.
        boot.kernelPackages = pkgs.linuxPackages_latest;

        # services.xserver.enable = true;

        xdg.portal = {
            enable = true;
            extraPortals = [
                pkgs.xdg-desktop-portal-hyprland
            ];
        };

        # Enable touchpad support (enabled default in most desktopManager).
        services.libinput = lib.mkIf config.system.laptop {
            enable = true;
        };

        # Enable tailscale
        services.tailscale.enable = true;

        # Custom Modules
        # hyprland.enable = lib.mkDefault true;
        gamingmode.enable = lib.mkDefault true;
    };
}
