return {
    "stevearc/oil.nvim",
    --@module 'oil'
    --@type oil.SetupOpts
    opts = {
        columns = {
            "icon",
            -- "permissions",
            -- "size",
            -- "mtime",
        },
        view_options = {
            show_hidden = true
        },
    },
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
    config = function(_, opts)
        require('oil').setup(opts)
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
}
