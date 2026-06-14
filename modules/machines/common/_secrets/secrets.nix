let
  keys = {
    warpcore = {
      system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGUO3H2aFXbXlPQdXwMp8zzR3Htn3IuLtiltbLmdg8cj";
      kaironium = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE+aeFJEuF2yYQdLYE7r9BMuG8wW8BTLYWA0EZ2W9pMu";
    };
    runabout = {
      system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAs/1HBtxa4ZMeXyXolhZA0mcm0hsHVl7OMt4Gy/IB1f";
      kaironium = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICk8rsF1/5C1UqHCIkp++NI5C4DCjkFqia8XiwUnwisd";
    };
  };
  all = builtins.concatLists (
    map
      (machine: builtins.attrValues machine)
      (builtins.attrValues keys)
  );
in
{
  "networking.age".publicKeys = all;
}
