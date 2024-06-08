{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    Jovian-NixOS.url = "github:Jovian-Experiments/Jovian-NixOS";
    nixos-generators.url = "github:nix-community/nixos-generators";
    deploy-rs.url = "github:serokell/deploy-rs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: rec {
    nixosConfigurations."NixOS-SD" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        inputs.Jovian-NixOS.nixosModules.default
        inputs.nixos-generators.nixosModules.raw-efi

        ./configuration.nix
        home-manager.nixosModules.home-manager
        ./home-manager
      ];
    };

    packages.x86_64-linux.default =
      nixosConfigurations."NixOS-SD".config.system.build.raw;

    deploy.nodes."NixOS-SD" = {
      hostname = "NixOS-SD.lan";
      fastConnection = true;

      profiles.system = {
        sshUser = "root";

        path = inputs.deploy-rs.lib.x86_64-linux.activate.nixos
          inputs.self.nixosConfigurations."NixOS-SD";
      };
    };
  };
}
