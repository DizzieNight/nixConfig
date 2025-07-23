{pkgs, config, ...}:
{
    config = {
        programs.nextcloud-client = {
            enable = true;
            starInBackground = true;
        };
    };
}
