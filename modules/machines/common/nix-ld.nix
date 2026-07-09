{ pkgs, config, ... }: {
  # needed for python projects managed by uv
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      libxcrypt-legacy  # for older versions of python
    ];
  };
}
