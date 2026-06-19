{ config, ... }: {
  # needed for python projects managed by uv
  programs.nix-ld.enable = true;
}
