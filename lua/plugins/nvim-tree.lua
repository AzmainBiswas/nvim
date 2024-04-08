return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 35,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
        })

        vim.keymap.set("n", "<C-b>", "<CMD>NvimTreeToggle<CR>")
    end,
}
