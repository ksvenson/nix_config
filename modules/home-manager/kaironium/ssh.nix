{ config, pkgs, ... }: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "github.com" = {
        identityFile = "~/.ssh/kaironium_ssh";
        identitiesOnly = true;
      };
    };
  };
}
