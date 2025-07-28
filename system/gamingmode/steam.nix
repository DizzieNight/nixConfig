{lib, config, pkgs, ...}:
let
  cfg = config.gamingmode;
in 
{
    options.steam = {
    };
    
    config = lib.mkIf cfg.enable {
        programs = {
            steam = {
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
