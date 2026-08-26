return {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
    -- bigfile = {
    --     enabled = true,
    --     size = 1.5 * 1024 * 1024, -- 1.5MB
    -- },
    blame_line = { enabled = true, },
    gitbrowse = { enabled = true, },
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
    },
    config = function()
        local Snacks = require("snacks")
        vim.api.nvim_create_user_command("GitBlam", function()
            Snacks.git.blame_line()
        end, { desc = "Git blame for line" })


        vim.api.nvim_create_user_command("GitBrowser", function()
            Snacks.gitbrowse()
        end, { desc = "Git blame for line" })

        local picker = Snacks.picker;
        vim.keymap.set("n", "<leader>ff", function() picker.files({hidden = true}) end, { desc = "Find Files" })
        vim.keymap.set("n", "<C-p>",function() picker.files({hidden = true}) end, { desc = "Find Files" })
        vim.keymap.set("n", "<leader>fg", function() picker.grep() end, { desc = "Grep word from opened file system" })
        vim.keymap.set("n", "<leader>fb", function() picker.buffers() end, { desc = "switch buffers" })
        vim.keymap.set("n", "<leader>fh", function() picker.help() end, { desc = "help" })
        vim.keymap.set("n", "<leader>fc", function() picker.colorschemes() end, { desc = "change colorscheme" })
        vim.keymap.set("n", "<leader>fs", function() picker.grep_buffers() end, { desc = "Find in Buffer" })
    end
}
