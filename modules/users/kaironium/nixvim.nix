{ pkgs, inputs, config, ... }: {
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    opts = {
      number = true;
      relativenumber = true;
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
      scrolloff = 8;
      undofile = true;
      clipboard = "unnamedplus";
      ignorecase = true;
      smartcase = true;
      wrap = false;
      # because we have autosave:
      swapfile = false;
      textwidth = 88;
      # format comments with `gq`
      formatoptions = "cqjn";
    };

    # extraPackages = with pkgs; [
    #   ruff
    #   basedpyright  # worth adding here too for the same reason
    # ];

    plugins = {
      auto-save = {
        enable = true;
      };
      # lsp = {
      #   enable = true;
      #   servers.basedpyright.enable = true;
      # };
      treesitter = {
        enable = true;
        settings = {
          indent.enable = true;
        };
      };
      # conform-nvim = {
      #   enable = true;
      #   settings.formatters_by_ft.python = [ "ruff_format" ];
      #   # format_on_save = {
      #   #   timeout_ms = 500;
      #   #   lsp_fallback = true;
      #   # };
      # };
      illuminate.enable = true;
      nvim-autopairs.enable = true;
    };
  };
}
