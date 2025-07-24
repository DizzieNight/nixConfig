{pkgs, config, ...}:
{
    users.defaultUserShell = pkgs.zsh;
    environment.shells = with pkgs; [ zsh ];

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
                # "thefuck"
                "git"
                "kubectl"
                "fzf-tab"
            ];
            theme = "robbyrussell";
        };
    };
}
