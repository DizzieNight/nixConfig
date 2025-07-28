{config, lib, ...}:
let
  cfg = config.lutris;
in 
{
    options.lutris = {
        enable = lib.mkEnableOption "Enable Lutris";
    };

    config = lib.mkIf cfg.enable {
        
    };
}
