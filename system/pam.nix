{pkgs, config, lib, ...}:
{
    config = lib.mkIf config.laptop.enable {
        security.pam.services = {
            sudo = {
                enable = true;
                fprintAuth = true;
            };
            ly = {
                enable = true;
                fprintAuth = true;
            };
        };
    };
}
