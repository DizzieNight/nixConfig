{lib, pkgs, config, ...}:
{
    programs.btop = {
        enable = true;
        package = pkgs.btop;
        # themes = 
    }
}
