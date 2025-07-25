{inputs, lib, pkgs, config, ...}:
{

    # Enable Ly as the display manager
    services.displayManager.ly = {
        enable = true;
        package = pkgs.ly;
        x11Support = true;
        settings = {
            animation = "colormix";
            vi_mode = true;
            # session_log = "/home/zander/.logs/session_log";
        };
    };

    services.xserver.displayManager.lightdm.enable = false;
}
