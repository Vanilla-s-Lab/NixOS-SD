{ ... }:
{
  imports = [
    ./root.nix
    ./vanilla.nix
  ];

  users.mutableUsers = false;
}
