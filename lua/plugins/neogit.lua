vim.pack.add({
    "https://github.com/NeogitOrg/neogit",
})

local neogit = require('neogit')

neogit.setup({
    integrations = {
        telescope = false,
    }
})

vim.keymap.set("n", "<leader>gg", function()
    neogit.open({ kind = "tab" })
end, { desc = "Open Neogit UI" })
