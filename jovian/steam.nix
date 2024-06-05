{ ... }:
{
  jovian.steam.enable = true;
  nixpkgs.config.allowUnfree = true;

  jovian.steam.autoStart = true;
  jovian.steam.desktopSession = "gnome";

  jovian.steam.user = "vanilla";
}
