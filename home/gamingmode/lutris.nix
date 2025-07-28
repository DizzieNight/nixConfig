{osConfig, lib, pkgs, ...}:
let
  cfg = osConfig.gamingmode;
in 
{
    # options.lutris = {
    #     # enable = lib.mkEnableOption "Enable Lutris";
    # };

    config = lib.mkIf cfg.enable {
        programs.lutris = {
            enable = true;
            package = pkgs.lutris;
        }; 
    };
}
