{lib, pkgs, config, ...}:
let
  rofiPath = ./rofiConfig;
in 
{
    # programs.rofi = {
    #     enable = true;
    #     modes = [
    #         "window"
    #         "drun"
    #         "run"
    #         "ssh"
    #     ];
    #     pass = {
    #         enable = true;
    #         stores = [
    #             "${config.home.homeDirectory}/.password-store"
    #         ];
    #     };
    #     plugins = [
    #         pkgs.rofi-calc
    #     ];
    #     location = "center";
    #     font = "Jetbrains Mono";
    #     cycle = true;
    #     # extraConfig = [
    #     #     "show-icons: true"
    #     #     "display-drun: "Apps""
    #     #     timeout = {
    #     #         action= "kb-cancel";
    #     #         delay=  0;
    #     #     };
    #     #     filebrowser = {
    #     #         directories-first= true;
    #     #         sorting-method=    "name";
    #     #     };
    #     # ];
    #     # theme = lib.mkForce "${config.home.homeDirectory}/.config/rofi/style.rasi";
    # };
    xdg.configFile."rofi".source = config.lib.file.mkOutOfStoreSymlink rofiPath; 
}
