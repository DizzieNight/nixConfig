{lib, config, pkgs, ...}:
let
  cfg = config.steam;
in 
{
    options.steam = {
        enable = lib.mkEnableOption "Enable Steam";
    };
    
    config = {
        programs = {
            steam = lib.mkIf cfg.enable {
                enable = true;
                package = pkgs.steam.override {
                    extraEnv = {
                        MANGOHUD = true;
                    };
                };
            };
        };
    };
}
