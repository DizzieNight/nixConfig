{lib, config, pkgs, ...}:

{
    imports = [
        # ./librewolf.nix
        ./thunderbird.nix
        ./nextcloud.nix
    ];

    config = {
    };
}
