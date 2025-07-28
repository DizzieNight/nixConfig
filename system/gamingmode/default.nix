{config, lib, ...}:
let
  cfg = config.gamingmode;
in 
{
    imports = [
        ./steam.nix
    ];

    options.gamingmode = {
        enable = lib.mkEnableOption "Enable Gamingmode";
    };

    config = lib.mkIf cfg.enable {
       users.users.${user} = {
        packages = with pkgs; [
            heroic-unwrapped
            goverlay
        ];
       }; 
    };
}
