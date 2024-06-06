{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    Jovian-NixOS.url = "github:Jovian-Experiments/Jovian-NixOS";
    nixos-generators.url = "github:nix-community/nixos-generators";
  };

  outputs = { self, nixpkgs, Jovian-NixOS, nixos-generators }: rec {
    nixosConfigurations."NixOS-SD" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        Jovian-NixOS.nixosModules.default
        nixos-generators.nixosModules.raw-efi
      ] ++ [ ./configuration.nix ];
    };

    packages.x86_64-linux.default =
      nixosConfigurations."NixOS-SD".config.system.build.raw;
  };
}
