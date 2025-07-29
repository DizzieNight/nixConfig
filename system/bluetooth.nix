{lib, config, ...}:
{
    config = lib.mkIf laptop.enable {
        hardware.bluetooth = {
            enable = true;
            powerOnBoot = true;
        };
    };
}
