{pkgs, config, ...}:
{

    environment.systemPackages = with pkgs; [
        ly
    ];

    # Enable Ly as the display manager
    services.displayManager.ly = {
        enable = true;
        settings = {
            # animation = doom;
        };
    };

    service.displayManager.lightdm.enable = false;
}
