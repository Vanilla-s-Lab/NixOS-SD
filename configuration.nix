{ ... }:
{
  imports = [
    ./boot
    ./jovian
    ./networking
    ./programs
    ./services
    ./users
  ];

  time.timeZone = "Asia/Shanghai";
  system.stateVersion = "24.11";
}
