vim.pack.add({
    "https://github.com/ibhagwan/fzf-lua",
})

local fzf = require("fzf-lua")

fzf.setup({
    winopts = {
        layout = "vertical",
        -- height is number of items minus 15 lines for the preview, with a max of 80% screen height
        height = 0.8,
        width = 0.8,
        preview = not vim.tbl_isempty(vim.lsp.get_clients({ bufnr = 0, name = "vtsls" })) and {
            layout = "vertical",
            vertical = "down:15,border-top",
            hidden = "hidden",
        } or {
            layout = "vertical",
            vertical = "down:15,border-top",
        },
    },
})

vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Grep word from opened file system" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "switch buffers" })
vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "help" })
vim.keymap.set("n", "<leader>fc", fzf.colorschemes, { desc = "change colorscheme" })
vim.keymap.set("n", "<leader>fs", fzf.lgrep_curbuf, { desc = "Find in Buffer" })

vim.ui.select = fzf.register_ui_select
