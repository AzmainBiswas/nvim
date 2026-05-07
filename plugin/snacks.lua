vim.pack.add({
    "https://github.com/folke/snacks.nvim"
})

require("snacks").setup({
    animate = { enabled = true },
    bigfile = {
        enabled = true
    },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    indent = { enabled = true },
    scroll = { enabled = true },
    words = { enabled = false },
})
