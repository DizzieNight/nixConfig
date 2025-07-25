{inputs, config, lib, pkgs, ...}:
{
    networking = {
        networkmanager = {
            enable = true;
            # wifi.backend = "iwd";
        };
        wireless.iwd = {
            enable = false;
            settings = {
                IPv6 = {
                    Enabled = true;
                };
                Settings = {
                    AutoConnect = true;
                };
            };
        };
    };
}
