{
  flake.machines = [
    {
      hostName = "emperor";
      description = "tower";
      system = "x86_64-linux";
      owner = flake.users.kaironium;
    }
  ];
}
