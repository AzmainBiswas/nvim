return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-ui-select.nvim" },
        },
        config = function()
            --configuration options
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
                defaults = {
                    mappings = {
                        i = {
                            ["<C-h>"] = "which_key",
                        },
                    },
                },
                pickers = {
                    find_files = { theme = "ivy" },
                    fd = { theme = "ivy" },
                    -- buffers = { theme = "dropdown" },
                    -- current_buffer_fuzzy_find = { theme = "dropdown" },
                    live_grep = { theme = "ivy" },
                },
            })

            require("telescope").load_extension("ui-select")

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.fd, { desc = "Find Files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep word from opened file system" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "switch buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "help" })
            vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "change colorscheme" })
            vim.keymap.set(
                "n",
                "<C-f>",
                "<cmd>Telescope current_buffer_fuzzy_find<CR>",
                { desc = "Fuzzy find in the opened buffer" }
            )
            vim.keymap.set(
                "n",
                "<leader>fs",
                "<cmd>Telescope current_buffer_fuzzy_find<CR>",
                { desc = "Fuzzy find in the opened buffer" }
            )
            vim.keymap.set("n", "<C-p>", builtin.fd, { desc = "Find Files" })
        end, -- config ends here
    },
}
