{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.source-han-sans
  ];

  fonts.fontconfig.defaultFonts.sansSerif = [
    "Source Han Sans SC"
    "Source Han Sans TC"
    "Source Han Sans HW"
    "Source Han Sans K"
  ];

  fonts.fontconfig.defaultFonts.monospace = [
    "Source Han Sans SC"
    "Source Han Sans TC"
    "Source Han Sans HW"
    "Source Han Sans K"
  ];
}
