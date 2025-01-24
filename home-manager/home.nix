{ pkgs, ... }:
{
  imports = [
    ./fonts/conf.nix
    ./fonts/fontconfig.nix
  ];

  home.packages = [
    pkgs.nautilus
    pkgs.unzip
  ];

  home.stateVersion = "24.11";
}
