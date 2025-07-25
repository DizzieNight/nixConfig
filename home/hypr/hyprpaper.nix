{pkgs, config, ...}:
{
    services.hyprpaper = {
        enable = true;
        package = pkgs.hyprpaper;
        settings = {
            preload = [
                "/home/zander/Nextcloud/Pictures/Wallpapers/cyberpunk.png"
            ];
            wallpaper = [
                ",/home/zander/Nextcloud/Pictures/Wallpapers/cyberpunk.png"
            ];
        };
    };
}
