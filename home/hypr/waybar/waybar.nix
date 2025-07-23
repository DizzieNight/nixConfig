{pkgs, config, ...}:
{
    config = {
        programs.waybar = {
            enable = true;
        };
        xdg.confiFile."waybar/config.jsonc".source = ./config.jsonc;
        xdg.confiFile."waybar/style.css".source = ./style.css;
    };
}
