{pkgs, config, ...}:
{
    programs.hyprpaper = {
        enable = true;
        settings = {
            preload = [
                "/home/zander/Nextcloud/Pictures/Wallpapers/cyberpunk.png"
            ];
            wallpaper = [
                ", /home/zander/Nextcloud/Pictures/Wallpapers/cyberpunk.png"
            ];
        };
    };
}
