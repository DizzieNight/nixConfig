{pkgs, config, ...}:
{
    users.defaultUserShell = pkgs.zsh;

    programs.zsh = {
        enable = true;
        # enableCompletions = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            update = "sudo nixos-rebuild switch --flake /home/zander/.nixConfig/#${config.networking.hostName}";
        };

        ohMyZsh = {
            enable = true;
            plugins = [
                "thefuck"
                "git"
                "kubectl"
                "fzf-zsh-plugin"
            ];
            theme = "robbyrussell";
        };
    };
}
