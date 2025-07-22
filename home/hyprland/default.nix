{inputs, pkgs, config, lib, ...}:
{
    imports = [
        ./cliphist.nix
    ];

    options = {

    };

    config = {
      wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
        xwayland.enable = true;
        systemd.enable = true;

        settings = {
            exec-once = [
                "wl-paste --type text --watch cliphist store"
                "wl-paste --type image --watch cliphist sore"
            ];

            general = {
                "$modMod" = "SUPER";
                layout = "dwindle";
                gaps_in = 5;
                gaps_out = 12;
                border_size = 2;
                "col.active_border" = "rgb(FFFFFF)";
                "col.inactive_border" = "rgb(000000)";
            };

            dwindle = {
                force_split = 2;
                special_scale_factor = 1.0;
                split_width_multiplier = 1.0;
                use_active_for_splits = true;
                pseudotile = "yes";
                preserve_split = "yes";
            };

            bind = [
                "$mod, Q, exec, kitty"
            ];

            input = {
                touchpad = {
                    natural_scroll = true;
                };
            };

            decoration = {
                rounding = 3;
                rounding_power = 2;

                active_opacity = 1.0;
                inactive_opacity = 1.0;

                shadow = {
                    enabled = true;
                    range = 4;
                    render_power = 3;
                    color = "rgba(1a1a1aee)";
                };

                blur = {
                    enabled = true;
                    size = 3;
                    passes = 1;

                    vibrancy = 0.1696;
                };
            };
        };
      };
    };
}
