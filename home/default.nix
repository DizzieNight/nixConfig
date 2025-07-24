{inputs, config, lib, pkgs, ...}:
{
    imports = [
        ./apps
        ./tools
        ./hypr
        ./shell.nix
    ];

    home = {
        username = "zander";
        homeDirectory = "/home/zander";
        stateVersion = "25.05";
        sessionVariables = {
            EDITOR = "nvim";
        };
        enableNixpkgsReleaseCheck = false;
    };

    programs.home-manager.enable = true;

}
