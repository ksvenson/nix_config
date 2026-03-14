{ config, pkgs, user, ... }: {
  programs.git = {
    enable = true;
    
    settings = {
      init.defaultBranch = "main";
      user = { inherit (user) name email; };
    };
  };
}
