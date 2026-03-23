{ pkgs, ... }:
{
  hardware.graphics.extraPackages32 = [
    pkgs.pkgsi686Linux.freetype
  ];
}
