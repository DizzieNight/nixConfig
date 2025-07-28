{config, lib, ...}:
let
  cfg = config.gamingmode;
in 
{
    imports = [
        ./steam.nix
        ./heroic.nix
    ];

    options.gamingmode = {
        enable = lib.mkEnableOption "Enable Gamingmode";
    };

    config = {
    };
}
