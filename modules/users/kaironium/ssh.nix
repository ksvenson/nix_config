{ config, pkgs, ... }: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "github.com" = {
        # keeping this reference explicit since it's a call to an external file
        identityFile = "~/.ssh/kaironium_ssh";
        identitiesOnly = true;
      };
    };
  };
}
