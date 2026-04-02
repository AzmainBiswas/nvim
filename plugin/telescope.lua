vim.pack.add({
    { src = "https://github.com/nvim-telescope/telescope.nvim", version = vim.version.range("*") },
    "https://github.com/nvim-lua/plenary.nvim",
})


--configuration options
require("telescope").setup({
  defaults = {
    preview = {
      treesitter = false,
    },
  },
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.fd, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep word from opened file system" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "switch buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "help" })
vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "change colorscheme" })
vim.keymap.set(
    "n",
    "<leader>fs",
    "<cmd>Telescope current_buffer_fuzzy_find<CR>",
    { desc = "Fuzzy find in the opened buffer" }
)
