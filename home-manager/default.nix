{ inputs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.vanilla = import ./home.nix;

  # https://nur.nix-community.org/documentation/
  nixpkgs.overlays = with inputs; [ nur.overlay ];
}
