return {
    "NTBBloodbath/doom-one.nvim",
    lazy = true,
    config = function()
        -- Add color to cursor
        vim.g.doom_one_cursor_coloring = true
        -- Set :terminal colors
        vim.g.doom_one_terminal_colors = true
        -- Enable italic comments
        vim.g.doom_one_italic_comments = true
        -- Enable TS support
        vim.g.doom_one_enable_treesitter = true
        -- Color whole diagnostic text or only underline
        vim.g.doom_one_diagnostics_text_color = true
        -- Enable transparent background
        vim.g.doom_one_transparent_background = false

        -- telescope
        vim.g.doom_one_plugin_telescope = true
    end,
}
