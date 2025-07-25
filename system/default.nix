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
            zsh-powerlevel10k
            home-manager
            brightnessctl
            easyeffects
            fprintd
            iwd
            power-profiles-daemon
            pwvucontrol
            tailscale
            tealdeer
            pay-respects
            zip
            unzip
        # Programming Languages
            dart
            gcc
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

        services.xserver.enable = true;
        programs.xwayland.enable = true;

        xdg.portal = {
            enable = true;
            extraPortals = [
                pkgs.xdg-desktop-portal-hyprland
            ];
        };

        # Allow unfree packages
        nixpkgs.config.allowUnfree = true;

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
