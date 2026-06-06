let
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGUO3H2aFXbXlPQdXwMp8zzR3Htn3IuLtiltbLmdg8cj";

  kaironium = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE+aeFJEuF2yYQdLYE7r9BMuG8wW8BTLYWA0EZ2W9pMu";
in
{
  "root_pw.age".publicKeys = [ system ];
  "kaironium_pw.age".publicKeys = [ system kaironium ];
}
