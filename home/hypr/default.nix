{inputs, pkgs, config, lib, ...}:
{
    imports = [
        ./cliphist.nix
        ./hyprland.nix
        ./waybar/waybar.nix
        ./hyprpaper.nix
        ./rofi/rofi.nix
    ];

    options = {

    };

    config = {
    };
}
