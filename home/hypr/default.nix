{inputs, pkgs, config, lib, ...}:
{
    imports = [
        ./cliphist.nix
        ./hyprland
        ./waybar/waybar.nix
        ./hyprpaper.nix
        ./hyprlock.nix
        ./hypridle.nix
        ./rofi/rofi.nix
    ];

    options = {

    };

    config = {
    };
}
