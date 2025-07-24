{inputs, pkgs, config, lib, ...}:
{

    options = {

    };

    config = {
      wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
        xwayland.enable = true;
        systemd.enable = true;

        settings = 
        let
          terminal = "ghostty";
          fileManager = "ghostty -e spf";
          menu = "rofi -show drun";
        in {
            exec-once = [
                "waybar"
                "hyprpaper"
                "wl-paste --type text --watch cliphist store"
                "wl-paste --type image --watch cliphist sore"
            ];

            monitor = [
                "eDP-1,preferred,0x1440, 1.566667"
            ];

            general = {
                "$mod" = "SUPER";
                layout = "dwindle";
                gaps_in = 5;
                gaps_out = 12;
                border_size = 2;
                "col.active_border" = "rgb(FFFFFF)";
                "col.inactive_border" = "rgb(000000)";
            };

            env = [
                "HYPRCURSOR_SIZE,20"
                "HYPRCURSOR_THEME,Bibata-Modern-Classic"
            ];

            dwindle = {
                force_split = 2;
                special_scale_factor = 1.0;
                split_width_multiplier = 1.0;
                use_active_for_splits = true;
                pseudotile = "yes";
                preserve_split = "yes";
            };

            bind = [
                "$mod, return, exec, ${terminal}"
                "$mod, C, killactive,"
                "$mod, escape, exit,"
                "$mod, F11, fullscreen "
                "$mod, F, exec, ${fileManager}"
                "$mod, B, togglefloating,"
                "$mod, space, exec, ${menu}"
                "$mod, O, pseudo, # dwindle"
                "$mod, S, togglesplit, # dwindle"
                "$mod, T, exec, ${terminal} btop"

                # Move focus with mod + arrow keys
                "$mod, h, movefocus, l"
                "$mod, l, movefocus, r"
                "$mod, k, movefocus, u"
                "$mod, j, movefocus, d"

                # Switch workspaces with mod + [0-9]
                "$mod, 1, workspace, 1"
                "$mod, 2, workspace, 2"
                "$mod, 3, workspace, 3"
                "$mod, 4, workspace, 4"
                "$mod, 5, workspace, 5"
                "$mod, 6, workspace, 6"
                "$mod, 7, workspace, 7"
                "$mod, 8, workspace, 8"
                "$mod, 9, workspace, 9"
                "$mod, 0, workspace, 10"

                # Move active window to a workspace with mod + SHIFT + [0-9]
                "$mod SHIFT, 1, movetoworkspace, 1"
                "$mod SHIFT, 2, movetoworkspace, 2"
                "$mod SHIFT, 3, movetoworkspace, 3"
                "$mod SHIFT, 4, movetoworkspace, 4"
                "$mod SHIFT, 5, movetoworkspace, 5"
                "$mod SHIFT, 6, movetoworkspace, 6"
                "$mod SHIFT, 7, movetoworkspace, 7"
                "$mod SHIFT, 8, movetoworkspace, 8"
                "$mod SHIFT, 9, movetoworkspace, 9"
                "$mod SHIFT, 0, movetoworkspace, 10"

                # Example special workspace (scratchpad)
                "$mod, Q, togglespecialworkspace, magic"
                "$mod SHIFT, Q, movetoworkspace, special:magic"

                # Scroll through existing workspaces with mod + scroll
                "$mod, mouse_down, workspace, e+1"
                "$mod, mouse_up, workspace, e-1"
                "$mod, page_down, workspace, e-1"
                "$mod, page_up, workspace, e+1"

                # Move/resize windows with mod + LMB/RMB and dragging
                "$mod, mouse:272, movewindow"
                "$mod, mouse:273, resizeactive"

                # Hyprshot keybinds
                "$mod, PebooksRINT, exec, hyprshot -m window # Screenshot a window"
                ", PRINT, exec, hyprshot -m output # Screenshot a monitor"
                "$shiftMod, PRINT, exec, hyprshot -m region # Screenshot a region"

                # cliphist bind
                "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"

                # Hyprlock
                "$mod, P, exec, pactl set-sink-mute @DEFAULT_SINK@ 1 && hyprlock"

                # Laptop multimedia keys for volume and LCD brightness
                ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
                ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
                ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
                ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
                ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"

                # Requires playerctl
                ", XF86AudioNext, exec, playerctl next"
                ", XF86AudioPause, exec, playerctl play-pause"
                ", XF86AudioPlay, exec, playerctl play-pause"
                ", XF86AudioPrev, exec, playerctl previous"
            ];

            misc = {
                force_default_wallpaper = 1; 
                disable_hyprland_logo = true;
            };

            input = {
                kb_layout = "us";
                # kb_variant =;
                # kb_model =;
                # kb_options =;
                # kb_rules =;

                follow_mouse = 1;

                sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
                touchpad = {
                    natural_scroll = true;
                    clickfinger_behavior = true;
                };
            };

            gestures = {
                workspace_swipe = true;
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
            animations = {
                enabled = "yes, please :)";

                # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

                bezier = [
                    "easeOutQuint,0.23,1,0.32,1"
                    "easeInOutCubic,0.65,0.05,0.36,1"
                    "linear,0,0,1,1"
                    "almostLinear,0.5,0.5,0.75,1.0"
                    "quick,0.15,0,0.1,1"
                ];

                animation = [
                    "global, 1, 10, default"
                    "border, 1, 5.39, easeOutQuint"
                    "windows, 1, 4.79, easeOutQuint"
                    "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
                    "windowsOut, 1, 1.49, linear, popin 87%"
                    "fadeIn, 1, 1.73, almostLinear"
                    "fadeOut, 1, 1.46, almostLinear"
                    "fade, 1, 3.03, quick"
                    "layers, 1, 3.81, easeOutQuint"
                    "layersIn, 1, 4, easeOutQuint, fade"
                    "layersOut, 1, 1.5, linear, fade"
                    "fadeLayersIn, 1, 1.79, almostLinear"
                    "fadeLayersOut, 1, 1.39, almostLinear"
                    "workspaces, 1, 1.94, almostLinear, fade"
                    "workspacesIn, 1, 1.21, almostLinear, fade"
                    "workspacesOut, 1, 1.94, almostLinear, fade"
                ];
            };

            windowrule = [
                "suppressevent maximize, class:.*"
                # Fix some dragging issues with XWayland
               "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
            ];

            windowrulev2 = [
               "float,class:com.saivert.pwvucontrol, title:Pipewire Volume Control"
            ];

            layerrule = [
                "blur,waybar"
                "blur,rofi"
            ];
        };
      };
    };
}
