{pkgs, user, config, ...}:
let
  cfg = config.gamingmode;
in 
{
    config = lib.mkIf cfg.enable {
       users.users.${user} = {
        packages = with pkgs [
            heroic-unwrapped
        ];
       }; 
    };
}
