{ pkgs, inputs, config, ... }: {
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    opts = {
      updatetime = 300;  # ms
      number = true;
      relativenumber = true;
      expandtab = true;  # spaces instead of tab
      tabstop = 2;       # width of tab
      shiftwidth = 2;    # spaces added by autoindent
      softtabstop = 2;   # spaces removed by backspace
      scrolloff = 8;
      undofile = true;
      clipboard = "unnamedplus";
      ignorecase = true;
      smartcase = true;
      wrap = false;
      swapfile = false;  # because we have autosave
      textwidth = 88;
      formatoptions = "cqjn";  # format comments with `gq`
    };
    diagnostic.settings = {
      float = {
        border = "single";
        source = "if_many";
      };
    };

    plugins = {
      auto-save = {
        enable = true;
      };
      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
          pyright.enable = true;
        };
      };
      treesitter = {
        enable = true;
        highlight.enable = true;
        indent.enable = true;
      };
      illuminate.enable = true;
      nvim-autopairs.enable = true;
    };
    autoCmd = [{
      event = "CursorHold";
      desc = "Show diagnostic under cursor";

      callback = {
        __raw = ''
          function()
            vim.diagnostic.open_float({
              scope = "cursor",
            })
          end
        '';
      };
    }];
  };
}
