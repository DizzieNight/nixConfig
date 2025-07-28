{pkgs, config, lib, ...}:
{
    config = {
       programs.hyprlock = {
            enable = true;
            package = pkgs.hyprlock;
            settings = 
            let
              font = "JetBrains Mono";
              fontBold = "JetBrains Mono Extrabold";
              source = "/home/zander/.cache/wal/colors-kitty.conf";
            in 
            {
                 # sample hyprlock.conf
                # for more configuration options, refer https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock
                #
                # rendered text in all widgets supports pango markup (e.g. <b> or <i> tags)
                # ref. https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/#general-remarks
                #
                # shortcuts to clear password buffer: ESC, Ctrl+U, Ctrl+Backspace
                #
                # you can get started by copying this config to ~/.config/hypr/hyprlock.conf
                #

                general = {
                    hide_cursor = false
                };

                # uncomment to enable fingerprint authentication
                auth = {
                    pam = {
                        enabled = true
                        module = hyprlock
                    };
                    fingerprint = {
                        enabled = true
                        ready_message = Scan fingerprint to unlock
                        present_message = Scanning...
                        retry_delay = 250 # in milliseconds
                    };
                };

                animations = {
                    enabled = true
                    bezier = linear, 1, 1, 0, 0
                    animation = [
                        "fadeIn, 1, 5, linear"
                        "fadeOut, 1, 5, linear"
                        "inputFieldDots, 1, 2, linear"
                    ];
                };

                background = {
                    monitor =
                    path = "/home/zander/Nextcloud/Pictures/Wallpapers/jojos.jpg"
                    blur_passes = 2
                };

                input-field = {
                    monitor =
                    size = 15%, 3%
                    outline_thickness = 2
                    dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
                    dots_spacing = 0.35 # Scale of dots' absolute size, 0.0 - 1.0
                    dots_center = true
                    outer_color = rgba(0,0,0,0)
                    inner_color = rgba(0, 0, 0, 0.2) # no fill
                    check_color = rgba(00ff99ee)
                    fail_color = rgba(ff6633ee)

                    font_color = rgba(3d8d73ee)
                    fade_on_empty = false
                    rounding = -1

                    font_family = $font
                    placeholder_text = <i><span foreground="##cdd6f4">Input Password...</span></i>
                    fail_text = $PAMFAIL

                    # uncomment to use a letter instead of a dot to indicate the typed password
                    # dots_text_format = *
                    # dots_size = 0.4
                    dots_spacing = 0.3

                    # uncomment to use an input indicator that does not show the password length (similar to swaylock's input indicator)
                    # hide_input = true

                    position = 0, -20
                    halign = center
                    valign = center
                };

                # TIME
                label = {
                    monitor =
                    text = $TIME # ref. https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/#variable-substitution
                    font_size = 90
                    font_family = $fontBold

                    position = 0, 300
                    halign = center
                    valign = center
                };

                # DATE
                label = {
                    monitor =
                    text = cmd[update:60000] date +"%A, %d %B %Y" # update every 60 seconds
                    font_size = 25
                    font_family = $font

                    position = 0, 200
                    halign = center
                    valign = center
                };

                # label {
                #     monitor =
                #     text = $LAYOUT[en,ru]
                #     font_size = 24
                #     onclick = hyprctl switchxkblayout all next
                #
                #     position = 250, -20
                #     halign = center
                #     valign = center
                # }               
            };
       };
    };
}
