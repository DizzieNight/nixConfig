# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{user, inputs, config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  home-manager = {
    extraSpecialArgs = {inherit user inputs;};
    users = {
        ${user} = import ../../home;
    };
  };

  # Define Hostname
  networking.hostName = "fw13";

  system.stateVersion = "25.05"; # Did you read the comment?

  system.laptop = true; 

}

