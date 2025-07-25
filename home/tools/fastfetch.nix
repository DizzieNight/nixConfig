{lib, config, pkgs, ...}:
{
    programs.fastfetch = {
        enable = true;
        package = pkgs.fastfetch;
    };
}
