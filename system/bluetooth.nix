{lib, config, ...}:
let
  cfg = config.laptop;
in 
{
    config = lib.mkIf cfg.enable {
        hardware.bluetooth = {
            enable = true;
            powerOnBoot = true;
        };
    };
}
