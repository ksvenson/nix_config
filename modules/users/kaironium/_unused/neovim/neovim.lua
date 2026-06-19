vim.opt.number = true              -- line numbers
vim.opt.relativenumber = true
vim.opt.tabstop = 2                -- width of a tab character
vim.opt.shiftwidth = 2             -- number of spaces to use for autoindent
vim.opt.expandtab = true           -- convert tabs to spaces
vim.opt.wrap = false               -- wrap text visually
vim.opt.scrolloff = 8              -- keep cursor away from edges when scrolling
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"  -- use ctrl+c/ctrl+v
vim.opt.ignorecase = true          -- ignore case in searches
vim.opt.smartcase = true           -- unless you type a capital letter

-- formatters
require("conform").setup({
  formatters_by_ft = {
    python = { "black" },
    nix = { "nixfmt" },
  },
  format_on_save = { timeout_ms = 500 },
})
vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"

-- highlight other instances of strings
require("illuminate").configure({
  delay = 100,
  under_cursor = true,
})

-- auto close braces
require("nvim-autopairs").setup()

-- show function headers
require("treesitter-context").setup({
  max_lines = 3,
  highlight = { enable = true },
  indent = { enable = true },
})
