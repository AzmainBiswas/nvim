vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope-ui-select.nvim",
    { src = "https://github.com/nvim-telescope/telescope.nvim", version = vim.version.range("*") },
})


--configuration options
require("telescope").setup({
    defaults = {
        sorting_strategy = "ascending",         -- Try adding this
        layout_config = {
            prompt_position = "top",
        },
        preview = {
            treesitter = false,
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
        },
    },
})

require("telescope").load_extension("ui-select")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep word from opened file system" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "switch buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "help" })
vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "change colorscheme" })
vim.keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, { desc = "Find in Buffer" })
vim.keymap.set(
    "n",
    "<leader>fs",
    "<cmd>Telescope current_buffer_fuzzy_find<CR>",
    { desc = "Fuzzy find in the opened buffer" }
)
