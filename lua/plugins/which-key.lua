return {
    "folke/which-key.nvim",
    lazy = false,
    config = function()
        -- config start here
        local which_key = require("which-key")
        local setup = {
            key_labels = {
                -- override the label used to display some keys. It doesn't effect WK in any other way.
                ["<space>"] = "SPC",
                ["<CR>"] = "RET",
                ["<tab>"] = "TAB",
            },
            window = {
                border = "rounded", -- none, single, double, shadow
                position = "bottom", -- bottom, top
                margin = { 1, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]
                padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
                winblend = 0,
            },
            show_help = true,
            triggers = "auto",
        }

        local opts = {
            mode = "n", -- NORMAL mode
            prefix = "<leader>",
            buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
            silent = true, -- use `silent` when creating keymaps
            noremap = true, -- use `noremap` when creating keymaps
            nowait = true, -- use `nowait` when creating keymaps
        }
        local mappings = {
            w = { "<CMD>w<CR>", "Write file" },
            x = { "<CMD>q<CR>", "Exit vim" },
            v = {
                name = "lsp shit",
                p = { "<CMD>Ex<CR>", "open Ex" },
                d = {
                    function()
                        vim.diagnostic.open_float()
                    end,
                    "diagnostic.open_float",
                },
                ca = {
                    function()
                        vim.lsp.buf.code_action()
                    end,
                    "buf.code_action",
                },
                rr = {
                    function()
                        vim.lsp.buf.references()
                    end,
                    "buf.references",
                },
                rn = {
                    function()
                        vim.lsp.buf.rename()
                    end,
                    "rename variables",
                },
                f = { "<CMD>lua vim.lsp.buf.format()<CR>", "code formater" },
            },
            s = {
                name = "settings",
                s = { "<CMD>set spell!<CR>", "spell checker" },
            },
        }

        which_key.setup(setup)
        which_key.register(mappings, opts)
    end, -- config ends here
}
