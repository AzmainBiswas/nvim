vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    { src = "https://github.com/nvim-mini/mini.icons",      version = 'stable' },
    "https://github.com/folke/which-key.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/danymat/neogen",
    "https://github.com/brenoprata10/nvim-highlight-colors",
})

require("mini.icons").setup()

require("which-key").add({
    { "<leader>s", group = "setting" },
    { "<leader>g", group = "lsp" },
    { "<leader>q", group = "quickfix" }
})

require("gitsigns").setup()
-- require("mini.statusline").setup()
require('neogen').setup({ snippet_engine = "luasnip" })
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)

require('nvim-highlight-colors').setup({})
