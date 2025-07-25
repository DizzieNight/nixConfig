{lib, pkgs, config, ...}:
{
    programs.ghostty = {
        enable = true;
        package = pkgs.ghostty;
        enableZshIntegration = true;
        settings = {
            confirm-close-surface = false;
        }
    }
}
