{pkgs, lib, config, ...}:
let
  cfg = config.gamingmode;
in 
{

    options.gamingmode = {
        enable = lib.mkEnableOption "steam";
    };

    config = lib.mkIf cfg.enable {
    # Install Steam
        programs.steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            localNetworkGameTransfers.openFirewall = true;
        };

        environment.systemPackages = with pkgs; [
            bubblewrap # Needed for steam to work
            heroic # Heroic launcher
            protonup-qt # GUI Manager for proton and wine versions
            wineWowPackages.base # Wine Is Not an Emulator
        ];
    };
}
