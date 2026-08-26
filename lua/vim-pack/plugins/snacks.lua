vim.pack.add({
    "https://github.com/folke/snacks.nvim"
})

local Snacks = require("snacks")

Snacks.setup({
    -- bigfile = {
    --     enabled = true,
    --     size = 1.5 * 1024 * 1024, -- 1.5MB
    -- },
    blame_line = {
        enabled = true,
    },
    gitbrowse = {
        enabled = true,
    },
    picker = {
        enabled = true,
        ui_select = true,

        layout = {
            cycle = true,
            preset = "vscode",
        },

        layouts = {
            vscode = {
                hidden = { "preview" },
                layout = {
                    backdrop = false,
                    row = 2,
                    width = 0.8,
                    min_width = 100,
                    height = 0.8,
                    border = "none",
                    box = "vertical",
                    { win = "input",   height = 1,          border = true, title = "{title} {live} {flags}", title_pos = "center" },
                    { win = "list",    border = "hpad" },
                    { win = "preview", height = 0.6, title = "{preview}", border = true },
                },
            }
        },
    },
})

vim.api.nvim_create_user_command("GitBlam", function()
    Snacks.git.blame_line()
end, { desc = "Git blame for line" })


vim.api.nvim_create_user_command("GitBrowser", function()
    Snacks.gitbrowse()
end, { desc = "Git blame for line" })

local picker = Snacks.picker;

-- picker.setup({
-- })

vim.keymap.set("n", "<leader>ff", picker.files, { desc = "Find Files" })
vim.keymap.set("n", "<C-p>", picker.files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", picker.grep, { desc = "Grep word from opened file system" })
vim.keymap.set("n", "<leader>fb", picker.buffers, { desc = "switch buffers" })
vim.keymap.set("n", "<leader>fh", picker.help, { desc = "help" })
vim.keymap.set("n", "<leader>fc", picker.colorschemes, { desc = "change colorscheme" })
vim.keymap.set("n", "<leader>fs", picker.grep_buffers, { desc = "Find in Buffer" })
