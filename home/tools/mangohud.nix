{pkgs, lib, config, ...}:
{
    programs.mangohud = {
        enable = true;
        package = pkgs.mangohud;
        settings = {
            
        };
        enableSessionWide = true;
    };
}
