{lib, ...}:
let
  cfg = config.gamingmode;
in 
{
    imports = [
        ./steam.nix
    ];

    options.gamingmode = {
        enable = lib.mkEnableOption "Enable Gamingmod";
    };

    config = lib.mkIf cfg.enable {
        steam.enable = true;
    };
}
