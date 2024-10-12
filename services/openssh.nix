{ pkgs, ... }:
{
  services.openssh.enable = true;
  services.openssh.package = pkgs.openssh;

  services.openssh.settings.PasswordAuthentication = false;
  services.openssh.settings.KbdInteractiveAuthentication = false;
}
