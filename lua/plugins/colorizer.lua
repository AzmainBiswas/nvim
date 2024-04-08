return {
    {
        "norcalli/nvim-colorizer.lua",
        event = "BufEnter",
        config = function()
            -- config goes here
            require("colorizer").setup({
                "css",
                "javascript",
                html = { mode = "background" },
            }, { mode = "background" })

            vim.keymap.set("n", "<leader>cc", function()
                vim.cmd.ColorizerToggle()
            end, { desc = "Enable Hex Color" })
        end, -- config end here
    },
}
