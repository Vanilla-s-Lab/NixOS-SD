{ ... }:
{
  boot.kernelParams = [ "console=tty0" ];
  boot.loader.timeout = 5;
}
