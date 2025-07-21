# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
        zander = import ../../home;
    };
  };

  # Define Hostname
  networking.hostName = "fw13";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment?

  # Enable Nix Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Allow unfree licensed programs
  nixpkgs.config.allowUnfree = true;

  # Enable flatpak
  services.flatpak.enable = true;

  system.laptop = true; 

}

