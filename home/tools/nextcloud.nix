{pkgs, config, ...}:
{
    config = {
        services.nextcloud-client = {
            enable = true;
            starInBackground = true;
        };
    };
}
