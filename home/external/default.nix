{pkgs, config, ...}:
let
  nvimPath = "${config.home.homeDirectory}/.nixConfig/home/external/nvim";
in 
{
   xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink nvimPath; 
}
