{osConfig, pkgs, ...}:
{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        initExtra = "source ~/.p10k.zsh";
        initContent = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

        shellAliases = {
            update = "sudo nixos-rebuild switch --flake /home/zander/.nixConfig/#${osConfig.networking.hostName}";
        };

        oh-my-zsh = {
            enable = true;
            plugins = [
                "git"
                "kubectl"
                "fzf-tab"
                "fzf-history"
            ];
            # theme = "powerlevel10k";
        };
    };
}
