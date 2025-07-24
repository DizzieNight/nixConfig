{pkgs, config, ...}:
{
    programs.zsh = {
        enable = true;
        # enableCompletions = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;
        promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

        shellAliases = {
            update = "sudo nixos-rebuild switch --flake /home/zander/.nixConfig/#${config.networking.hostName}";
        };

        oh-my-zsh = {
            enable = true;
            plugins = [
                # "thefuck"
                "git"
                "kubectl"
                "fzf-tab"
                "fzf-history"
            ];
            # theme = "powerlevel10k";
        };
    };
}
