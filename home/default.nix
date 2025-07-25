{inputs, config, lib, pkgs, ...}:
{
    imports = [
        ./apps
        ./tools
        ./hypr
        ./external
    ];

    home = {
        username = "zander";
        homeDirectory = "/home/zander";
        stateVersion = "25.05";
        sessionVariables = {
            EDITOR = "nvim";
        };
        enableNixpkgsReleaseCheck = false;
        pointerCursor = {
            package = pkgs.bibata-cursors;
            name = "Bibata-Modern-Classic";
            size = 20;
        };
    };

    programs.home-manager.enable = true;

}
