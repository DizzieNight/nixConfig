{pkgs, config, ...}:
{
    # programs.keychain = {
    #     enable = true;
    #     package = pkgs.keychain;
    # };
    services.pass-secret-service = {
        enable = true;
        package = pkgs.pass;
        storePath = "${config.home.homeDirectory}./password-store";
    };
    programs.password-store = {
        enable = true;
        package = pkgs.pass;
        settings = {
            PASSWORD_STORE_DIR = "${config.home.homeDirectory}/.password-store";
            # PASSWORD_STORE_KEY = "Ere8ewh7AR=7WdMv";
            PASSWORD_STORE_CLIP_TIME = "60";
        };
    };
    programs.gpg = {
        enable = true;
        package = pkgs.gnupg;
        homedir = "${config.home.homeDirectory}/.gnupg";
    };
    services.gpg-agent = {
        enable = true;
        pinentry.package = pkgs.pinentry-all;
    };
}
