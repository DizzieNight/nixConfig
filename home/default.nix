{inputs, config, lib, pkgs, ...}:
{
    imports = [
        ./apps
        ./tools
        ./hyprland
    ];

    home = {
        username = "zander";
        homeDirectory = "/home/zander";
        stateVersion = "25.05";
        sessionVariables = {
            EDITOR = "nvim";
        };
    };

    programs.home-manager.enable = true;

}
