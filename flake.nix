{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    Jovian-NixOS.url = "github:Jovian-Experiments/Jovian-NixOS";
    nixos-generators.url = "github:nix-community/nixos-generators";
    deploy-rs.url = "github:serokell/deploy-rs";
  };

  outputs = { self, nixpkgs, Jovian-NixOS, nixos-generators, deploy-rs }: rec {
    nixosConfigurations."NixOS-SD" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        Jovian-NixOS.nixosModules.default
        nixos-generators.nixosModules.raw-efi
      ] ++ [ ./configuration.nix ];
    };

    packages.x86_64-linux.default =
      nixosConfigurations."NixOS-SD".config.system.build.raw;

    deploy.nodes."NixOS-SD" = {
      hostname = "NixOS-SD.lan";
      fastConnection = true;

      profiles.system = {
        sshUser = "root";

        path = deploy-rs.lib.x86_64-linux.activate.nixos
          self.nixosConfigurations."NixOS-SD";
      };
    };
  };
}
