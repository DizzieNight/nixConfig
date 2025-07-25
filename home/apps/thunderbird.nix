{user, lib, osConfig, pkgs, ...}:
{
    programs.thunderbird = {
        enable = true;
        package = pkgs.thunderbird;
    };
}
