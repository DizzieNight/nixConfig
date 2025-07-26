{inputs, lib, pkgs, config, ...}:
{

    # Enable Ly as the display manager
    services.displayManager = {
        ly = {
            enable = true;
            package = pkgs.ly;
            x11Support = false;
            settings = {
                animation = "colormix";
                vi_mode = true;
                # session_log = "/home/zander/.logs/session_log";
            };
        };
        environment = {
            XDG_CURRENT_DESKTOP = "X-NIXOS-SYSTEMD-AWARE";
        };
    };
    # services.displayManager.sddm = {
    #     enable = true;
    #     package = pkgs.kdePackages.sddm;
    #     wayland.enable = true;
    # };
}
