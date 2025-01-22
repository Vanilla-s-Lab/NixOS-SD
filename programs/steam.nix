{ pkgs, ... }:
{
  programs.steam.enable = true;
  programs.steam.package = pkgs.steam;

  programs.steam.extraCompatPackages =
    [ pkgs.proton-ge-bin ];
}
