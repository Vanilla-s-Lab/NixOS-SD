{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs.nur; [
    repos.vanilla.Win10_LTSC_2021_fonts

    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts-cjk-serif
  ];
}
