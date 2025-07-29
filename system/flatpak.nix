{pkgs, config, ...}:
{
    config = {
        services.flatpak = {
            enable = true;
            package = pkgs.flatpak;
        };
    };
}
