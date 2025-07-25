{pkgs, config, ...}:
{
    programs.keychain = {
        enable = true;
        package = pkgs.keychain;
    };
}
