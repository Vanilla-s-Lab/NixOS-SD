{ pkgs, ... }:
{
  jovian.decky-loader.enable = true;
  jovian.decky-loader.package = pkgs.decky-loader;
}
