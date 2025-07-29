{inputs, config, lib, pkgs, ...}:
{
    options = {
        hyprland.host = lib.mkOption {
            type = lib.types.str;
            description = "Option to select the monitor config for hyprland";
        };
    };

    config = {
        programs.hyprland = {
            enable = true;
            withUWSM = true;
            xwayland.enable = true;
        };
        programs.uwsm = {
            enable = true;
        };
    };
}
