{lib, pkgs, config, ...}:
{
    programs.btop = {
        enable = true;
        package = pkgs.btop;
        settings = {
            vim_keys = true;
            graph_symbol = "block";
            proc_tree = true;
        };
    };
}
