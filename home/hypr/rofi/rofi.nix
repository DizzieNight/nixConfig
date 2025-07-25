{lib, pkgs, config, ...}:
{
    programs.rofi = {
        enable = true;
        configPath = "./config.rasi";
        theme = lib.mkForce "./style.rasi";
    };
}
