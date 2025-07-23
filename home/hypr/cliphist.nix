{lib, pkgs, config, ...}:
{
    home.packages = with pkgs; [
        cliphist
    ];
    services.cliphist.enable = true;
}
