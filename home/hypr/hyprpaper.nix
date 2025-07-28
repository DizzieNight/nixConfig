{wallpaper, pkgs, config, ...}:
{
    services.hyprpaper = {
        enable = true;
        package = pkgs.hyprpaper;
        settings = {
            preload = [
               wallpaper
            ];
            wallpaper = [
                ",${wallpaper}" 
            ];
        };
    };
}
