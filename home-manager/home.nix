{ pkgs, ... }:
{
  imports = [
    ./fonts/fontconfig.nix
  ];

  home.packages = [
    pkgs.gnome-terminal
    pkgs.protontricks
  ];

  home.stateVersion = "25.11";
}
