{osConfig, pkgs, ...}:
{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        initContent = ''
            source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
            source ~/.p10k.zsh
        '';

        shellAliases = {
            update = "sudo nixos-rebuild switch --flake /home/zander/.nixConfig/";
            upgrade = "sudo nix flake update --flake /home/zander/.nixConfig/";
            n = "nvim";
        };

        oh-my-zsh = {
            enable = true;
            plugins = [
                "git"
                "kubectl"
                # "fzf-tab"
                # "fzf-history"
            ];
            # theme = "powerlevel10k";
        };
    };
    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
        historyWidgetOptions = [
            "--sort"
            "--layout=reverse --border"
        ];
    };
}
