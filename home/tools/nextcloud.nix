{pkgs, config, ...}:
{
    config = {
        services.nextcloud-client = {
            enable = true;
            startInBackground = true;
        };
    };
}
