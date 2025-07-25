{pkgs, config, ...}:
{
    programs.rofi = {
        enable = true;
        configPath = "./config.rasi";
        theme = "./style.rasi";
    };
}
