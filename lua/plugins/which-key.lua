return {
    "folke/which-key.nvim",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "echasnovski/mini.nvim",
    },
    config = function()
        local which_key = require("which-key")
        local mapping = {
            { "<leader>s", group = "settings", nowait = true, remap = false },
            { "<leader>ss", "<CMD>set spell!<CR>", desc = "spell checker", nowait = true, remap = false },
            -- { "<leader>vf", "<CMD>lua vim.lsp.buf.format()<CR>", desc = "code formater", nowait = true, remap = false },
            { "<leader>vp", "<CMD>Ex<CR>", desc = "open Ex", nowait = true, remap = false },
            { "<leader>w", "<CMD>w<CR>", desc = "Write file", nowait = true, remap = false },
            { "<leader>x", "<CMD>q<CR>", desc = "Exit vim", nowait = true, remap = false },
        }

        which_key.add(mapping)
    end, -- config ends here
}
