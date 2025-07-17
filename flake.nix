{
  inputs = {
    deploy-rs.url = "github:serokell/deploy-rs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    Jovian-NixOS.url = "github:Jovian-Experiments/Jovian-NixOS";
    nixos-generators.url = "github:nix-community/nixos-generators";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { home-manager, nixpkgs, ... }@inputs: rec {
    deploy.nodes."NixOS-SD" = {

      fastConnection = true;
      hostname = "NixOS-SD.lan";
      magicRollback = false;

      profiles.system = {
        path = with inputs;
          deploy-rs.lib.x86_64-linux.activate.nixos
            self.nixosConfigurations."NixOS-SD";

        sshUser = "root";
      };
    };

    nixosConfigurations."NixOS-SD" = nixpkgs.lib.nixosSystem {
      modules = with inputs; [
        ./configuration.nix
        ./home-manager

        home-manager.nixosModules.home-manager
        Jovian-NixOS.nixosModules.default
        nixos-generators.nixosModules.raw-efi
      ];

      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
    };

    packages.x86_64-linux.default =
      nixosConfigurations."NixOS-SD".config.system.build.raw;
  };
}
