{lib, config, ...}:
{
    imports = [
        ./hyprland.nix
        ./hosts/fw13.nix
    ];

    # options = {
    #     hyprland.host = lib.mkOption {
    #         type = lib.types.str;
    #         description = "Option to select the monitor config for hyprland";
    #     };
    # };

    config = {
    };
}
