{ ... }:
{
  imports = [
    ./fail2ban.nix
    ./gnome.nix
    ./openssh.nix
    ./xserver.nix
  ];
}
