{inputs, user, pkgs, ...}:
{
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
        tree
        dbus
        bridge-utils
        libsecret
    # Apps
        protonmail-bridge-gui
        putty
        obsidian
        kdePackages.gwenview
        kdePackages.kdeconnect-kde 
        lazygit
        libreoffice-fresh
        superfile
        bluetui
        # inputs.zen-browser.packages."${system}".default
    # K8s Tools
        kubectl
        kubernetes-helm
        kubectx
        kubecm
        kubent
        kubetui
        talosctl
    ];
  };
}
