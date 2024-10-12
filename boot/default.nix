{ ... }:
{
  # https://wiki.nixos.org/wiki/NixOS_on_ARM
  boot.kernelParams = [ "console=tty0" ];
}
