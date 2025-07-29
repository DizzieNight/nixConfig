{lib, osConfig, ...}:
let
  cfg = osConfig.hyprland.host;
in 
{
    config = lib.mkIf (cfg == "agnar") {
       wayland.windowManager.hyprland = {
            settings = {
                monitor = [
                    # "monitor=desc:Samsung Electric Company LS27CG51x H9JY100831,2560x1440@165,0x0,1,bitdepth,10,cm,hdr,sdrbrightness,1.2,sdrsaturation,0.8"
                    "monitor=desc:Samsung Electric Company LS27CG51x H9JY100831,2560x1440@165,0x0,1"
                    "monitor=desc:BNQ ZOWIE RL LCD F7G04782SL0,preferred,auto-left,1,transform,3" 
                ];
            };
       }; 
    };
}
