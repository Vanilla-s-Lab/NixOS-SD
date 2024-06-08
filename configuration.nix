{ ... }:
{
  imports = [
    ./boot
    ./jovian
    ./networking
    ./services
    ./users
  ];

  time.timeZone = "Asia/Shanghai";
  system.stateVersion = "24.11";
}
