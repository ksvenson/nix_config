let
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFfSqWMbZ4oL1Of2v5/plM7y/A7bTiek3kc4kSY5/mQ5";

  kaironium = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBJpKE0uy4DjYDc0EsvaH11jTBnc+lnK8nADCxOgkZeI";
in
{
  "root_pw.age".publicKeys = [ system ];
  "kaironium_pw.age".publicKeys = [ system kaironium ];
}
