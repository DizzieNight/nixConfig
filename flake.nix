{
  description = "Zanders Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
        url = "github:nix-community/home-manager/release-25.05";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
        url = "github:hyprwm/Hyprland";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs: 
      let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        user = "zander";
      in
      {
        nixosConfigurations = {
            fw13 = nixpkgs.lib.nixosSystem {
                specialArgs = {inherit user inputs system;};
                modules = [
                    ./hosts/fw13/configuration.nix
                    ./system
                ];
            };
        };

        # homeConfigurations.fw13 = home-manager.lib.homeManagerConfiguration {
        #     extraSpecialArgs = {inherit inputs;};
        #     inherit pkgs;
        #     modules = [
        #         ./home
        #     ];
        #     # users = {
        #     #     zander = import ./home;
        #     };
        # };
    };
  
}
