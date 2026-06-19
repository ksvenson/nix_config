{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    # initLua = builtins.readFile ./neovim.lua;
    # plugins = with pkgs.vimPlugins; [
    #   conform-nvim # for formatters
    #   vim-illuminate # highlight other instances of strings
    #   nvim-autopairs # auto close braces
    #   nvim-treesitter-context # show function headers
    #   (nvim-treesitter.withPlugins (
    #     p: with p; [
    #       python
    #       nix
    #     ]
    #   ))
    # ];
    # extraPackages = with pkgs; [
    #   black # python formatter
    #   nixfmt # nix formatter
    # ];
  };
}
