{ ... }:
{
  services.openssh.enable = true;

  services.openssh.settings.PasswordAuthentication = false;
  services.openssh.settings.KbdInteractiveAuthentication = false;
}