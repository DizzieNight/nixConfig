{user, config, lib, pkgs, ...}:
let
  cfg = config.creativemode;
in 
{
    config = lib.mkIf cfg.enable {
        users.users.${user} = {
            packages = with pkgs; [
                blender
                inkscape
                godot
                goxel
                gimp3
            ];
        };
    };
}
