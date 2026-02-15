{ config, pkgs, ... }: {
  programs.git = {
    enable = true;
    
    settings = {
      init.defaultBranch = "main";
      user.name = "kaironium";
      user.email = "kai.svenson628@gmail.com";
    };
  };
}
