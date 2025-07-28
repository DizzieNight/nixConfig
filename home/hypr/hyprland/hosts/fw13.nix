{lib, config, ...}:
let
  cfg = config.host.fw13;
in 
{
    config = lib.mkIf cfg.enable {
       wayland.windowManager.hyprland = {
            settings = {
                monitor = [
                    "eDP-1,preferred,0x1440, 1.566667"
                ];
            };
       }; 
    };
}
