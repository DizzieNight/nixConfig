{libe, config, ...}:
{
    imports = [
        ./hyprland.nix
        ./hosts/fw13.nix
    ];

    options = {
        host = {
            fw13 = {
                enable = lib.mkEnableOption "Use fw13 host specific config, eg. monitor config";
            };
        };
    };

    config = {
       host.fw13.enable = true; 
    };
}
