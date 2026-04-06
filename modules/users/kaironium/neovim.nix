{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    initLua = builtins.readFile ./neovim.lua;
  };
}
