return {
    "stevearc/oil.nvim",
    Lazy = false,
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
    config = function(_, opts)
        require('oil').setup(opts)
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
}
