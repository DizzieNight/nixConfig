{user, lib, pkgs, ...}:
{
    programs.thunderbird = {
        enable = true;
        package = pkgs.thunderbird;
        profiles.${user}.name = "personal";
    };
}
