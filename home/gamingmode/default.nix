{config, lib, ...}:
let
  cfg = config.gamingmode;
in 
{
    imports = [
        ./lutris.nix
    ];

    options.gamingmode = {
        enable = lib.mkEnableOption "Enable Gamingmode";
    };

    config = lib.mkIf cfg.enable {
        lutris.enable = true;
    };
}
