let
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAs/1HBtxa4ZMeXyXolhZA0mcm0hsHVl7OMt4Gy/IB1f";

  kaironium = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICk8rsF1/5C1UqHCIkp++NI5C4DCjkFqia8XiwUnwisd";
in
{
  "root_pw.age".publicKeys = [ system ];
  "kaironium_pw.age".publicKeys = [ system kaironium ];
}
