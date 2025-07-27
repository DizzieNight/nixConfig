{user, pkgs, ...}:
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
        gimp3
        godot
        goverlay
        obsidian
        goxel
        kdePackages.gwenview
        kdePackages.kdeconnect-kde 
        lazygit
        libreoffice-fresh
        kubernetes-helm
        impala
        inkscape
        superfile
        bluetui
        heoric-unwrapped
    # K8s Tools
        kubectl
        kubectx
        kubecm
        kubent
        kubetui
        talosctl
    ];
  };
}
