{inputs, pkgs, config, lib, ...}:
{
    imports = [
        ./cliphist.nix
        ./hyprland.nix
        ./waybar/waybar.nix
        ./hyprpaper.nix
    ];

    options = {

    };

    config = {
    };
}
