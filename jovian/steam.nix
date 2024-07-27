{ pkgs, ... }:
{
  jovian.steam.enable = true;
  nixpkgs.config.allowUnfree = true;

  jovian.steam.autoStart = true;
  jovian.steam.desktopSession = "gnome";

  jovian.steam.user = "vanilla";

  jovian.steam.environment = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "${pkgs.proton-ge-bin.steamcompattool}";
  };
}
