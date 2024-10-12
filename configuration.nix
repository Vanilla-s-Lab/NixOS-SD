{ ... }:
{
  imports = [
    ./boot/default.nix
    ./boot/loader.nix

    ./jovian/devices.nix
    ./jovian/steam.nix

    ./networking/default.nix
    ./nixpkgs/config.nix

    ./services/fail2ban.nix
    ./services/gnome.nix
    ./services/openssh.nix
    ./services/xserver.nix

    ./users/default.nix
    ./users/root.nix
    ./users/vanilla.nix
  ];

  time.timeZone = "Asia/Shanghai";
  system.stateVersion = "24.11";
}
