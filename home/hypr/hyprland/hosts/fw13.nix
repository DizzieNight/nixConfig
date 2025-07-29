{lib, osConfig, ...}:
let
  cfg = osConfig.hyprland.host;
in 
{
    config = lib.mkIf (cfg == "fw13") {
       wayland.windowManager.hyprland = {
            settings = {
                monitor = [
                    "eDP-1,preferred,0x1440, 1.566667"
                ];
            };
       }; 
    };
}
