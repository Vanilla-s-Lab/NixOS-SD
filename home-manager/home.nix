{ pkgs, ... }:
{
  imports = [
    ./fonts/fontconfig.nix
  ];

  home.packages = [
    pkgs.gnome-terminal
    pkgs.nautilus
    pkgs.unzip
    pkgs.winetricks
    pkgs.wineWowPackages.stable
  ];

  home.stateVersion = "24.11";
}
