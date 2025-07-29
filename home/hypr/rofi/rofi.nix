{lib, pkgs, config, ...}:
let
  rofiPath = "${config.home.homeDirectory}/.nixConfig/home/hypr/rofi/rofiConfig";
  inherit (config.lib.formats.rasi) mkLiteral;
in 
{
    programs.rofi = {
        enable = true;
        modes = [
            "window"
            "drun"
            "run"
            "ssh"
        ];
        pass = {
            enable = true;
            stores = [
                "${config.home.homeDirectory}/.password-store"
            ];
        };
        plugins = [
            pkgs.rofi-calc
        ];
        location = "center";
        font = "Jetbrains Mono";
        cycle = true;
        extraConfig = {
            show-icons = true;
            display-drun = "Apps";
        #     timeout = {
        #         action= "kb-cancel";
        #         delay=  0;
        #     };
        #     filebrowser = {
        #         directories-first= true;
        #         sorting-method=    "name";
        #     };
        };
        theme = {
            "*" = {
              bg = mkLiteral "#0d0b07";
              bg-alt = mkLiteral "#3D8D73";

              fg = mkLiteral "#FFFFFF";
              fg-alt = mkLiteral "#5E6969";

              background-color = mkLiteral "@bg";

              border = 0;
              margin = 0;
              padding = 0;
              spacing = 0;
            };
            "window" = {
                width = mkLiteral "30%";
                border-radius = mkLiteral "10px";
            };
            "element" = {
                padding = 12;
                text-color = mkLiteral "@fg-alt";
            };
            "element selected" = {
                text-color = mkLiteral "@fg";
            };
            "element-text" = {
                background-color = mkLiteral "inherit";
                text-color = mkLiteral "inherit";
                vertical-align = mkLiteral "0.5";
            };
            "element-icon" = {
                size = 30;
            };
            "entry" = {
                background-color = mkLiteral "@bg";
                padding = 12;
                text-color = mkLiteral "@fg";
            };
            "inputbar" = {
                children = map mkLiteral [ "prompt" "entry" ];
            };
            "listview" = {
                background-color = mkLiteral "@bg";
                columns = 1;
                lines = 8;
            };
            "mainbox" = {
                background-color = mkLiteral "@bg";
                children = map mkLiteral [ "inputbar" "listview" ];
            };
            "prompt" = {
                background-color = mkLiteral "@bg";
                enable = true;
                padding = mkLiteral "12 0 0 12";
                text-color = mkLiteral "@fg-alt";
            };
        };
    };
}
