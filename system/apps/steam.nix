{lib, config, pkgs, ...}:
{
    options = {
        
    };
    
    config = {
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
