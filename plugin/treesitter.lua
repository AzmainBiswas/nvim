vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  "https://github.com/nvim-treesitter/nvim-treesitter-context"
})

local nts = require("nvim-treesitter")
vim.api.nvim_create_autocmd('PackChanged', { callback = function() nts.update() end })

require("nvim-treesitter").setup({
  ensure_installed = { "vim", "vimdoc", "query" },
  auto_install = true,
  sync_install = false,
  highlight = {
    additional_vim_regex_highlighting = true,
    enable = true
  },

  indent = { enable = true },
})

vim.opt.foldcolumn = '0'
vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
