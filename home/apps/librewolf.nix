{pkgs, lib, config, ...}:
{
    programs.librewolf = {
        enable = true;
        package = pkgs.librewolf;
        settings = {
            "identity.fxaccounts.enabled" = true;
        };
    };
}
