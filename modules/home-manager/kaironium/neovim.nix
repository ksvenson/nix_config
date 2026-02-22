{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    extraLuaConfig = builtins.readFile ./neovim.lua;
  };
}
