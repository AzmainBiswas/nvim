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
        }
    })

vim.api.nvim_create_user_command("GitBlam", function() 
    Snacks.git.blame_line()
end, { desc = "Git blame for line" })


vim.api.nvim_create_user_command("GitBrowser", function() 
    Snacks.gitbrowse() 
end, { desc = "Git blame for line" })
