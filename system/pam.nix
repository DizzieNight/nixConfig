{pkgs, config, lib, ...}:
{
    config = {
        security.pam.services = {
            sudo = {
                enable = true;
                fprintAuth = true;
            };
        };
    };
}
