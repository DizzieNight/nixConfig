{lib, pkgs, config, ...}:
{
    programs.btop = {
        enable = true;
        package = pkgs.btop;
        settings = {
            color_theme = "gruvbox_material_dark";
            vim_keys = true;
            graph_symbol = "block";
            proc_tree = true;
        };
    };
}
