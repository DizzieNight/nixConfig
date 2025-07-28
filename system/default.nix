{inputs, config, lib, pkgs, ...}:

{
    options = {
        laptop = {
            enable = lib.mkEnableOption "Install laptop specific packages";
        };
        gamingmode = {
            enable = lib.mkEnableOption "Install gaming apps";
        };
        creativemode = {
            enable = lib.mkEnableOption "Install creative apps";
        };
    };

    imports = [
        ./audio.nix
        ./boot.nix
        ./users.nix
        ./security.nix
        ./displaymanager.nix
        ./hyprland.nix
        ./networking.nix
        ./shell.nix
        ./gamingmode
        ./creativemode
        ./laptop.nix
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

        # services.xserver.xkb = {
        #     layout = "au";
        #     variant = "";
        # };

        services.openssh.enable = true;

        # Use latest kernel.
        boot.kernelPackages = pkgs.linuxPackages_latest;

        # services.xserver.enable = false;
        programs.xwayland.enable = true;

        xdg.portal = {
            enable = true;
            extraPortals = [
                pkgs.xdg-desktop-portal-hyprland
            ];
        };

        # Allow unfree packages
        nixpkgs.config.allowUnfree = true;

        # Enable tailscale
        services.tailscale.enable = true;
    };
}
