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
                text = ''
                    # Account management.
                    account required ${pkgs.pam}/lib/security/pam_unix.so # unix (order 10900)

                    # Authentication management.
                    auth sufficient ${pkgs.pam}/lib/security/pam_unix.so likeauth try_first_pass # unix (order 11600)
                    auth sufficient ${pkgs.fprintd-tod}/lib/security/pam_fprintd.so # fprintd (order 11400)
                    auth required ${pkgs.pam}/lib/security/pam_deny.so # deny (order 12400)

                    # Password management.
                    password sufficient ${pkgs.pam}/lib/security/pam_unix.so nullok yescrypt # unix (order 10200)

                    # Session management.
                    session required ${pkgs.pam}/lib/security/pam_env.so conffile=/etc/pam/environment readenv=0 # env (order 10100)
                    session required ${pkgs.pam}/lib/security/pam_unix.so # unix (order 10200)
                    session required ${pkgs.pam}/lib/security/pam_loginuid.so # loginuid (order 10300)
                    session optional ${pkgs.systemd}/lib/security/pam_systemd.so # systemd (order 12000)
                    session required ${pkgs.pam}/lib/security/pam_limits.so conf=/nix/store/xgx14safanbgag5f2szsfp3hibmi2vk8-limits.conf # limits (order 12200)
                '';
            };
        };
    };
}
