{pkgs, user, config, lib, ...}:
let
  cfg = config.gamingmode;
in 
{
    imports = [
        ./steam.nix
    ];

    options.gamingmode = {
    };

    config = lib.mkIf cfg.enable {
       users.users.${user} = {
        packages = with pkgs; [
            heroic-unwrapped
            goverlay
            protonplus
            protonup-qt
        ];
       }; 
    };
}
