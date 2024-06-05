{ ... }:
{
  imports = [
    ./jovian
    ./services
    ./users
  ];

  system.stateVersion = "24.11";
}
