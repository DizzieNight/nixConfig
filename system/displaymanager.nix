{inputs, lib, pkgs, config, ...}:
{

    # Enable Ly as the display manager
    services.displayManager.ly = {
        enable = true;
        package = pkgs.ly;
        x11Support = true;
        settings = {
            # animation = doom;
            vi_mode = true;
        };
    };

    services.xserver.displayManager.lightdm.enable = false;
}
