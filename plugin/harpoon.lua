vim.pack.add({
    "https://github.com/ThePrimeagen/harpoon"
})

vim.api.nvim_create_user_command("Hm", function() require("harpoon.mark").add_file() end, { desc = "harpoon mark" })
vim.api.nvim_create_user_command("Ht", function() require("harpoon.ui").toggle_quick_menu() end,
    { desc = "harpoon toggel menu" })
vim.api.nvim_create_user_command("Hn", function() require("harpoon.ui").nav_next() end, { desc = "harpoon next" })
vim.api.nvim_create_user_command("Hp", function() require("harpoon.ui").nav_prev() end, { desc = "harpoon prev" })
vim.api.nvim_create_user_command("Hc", function() require("harpoon.term").gotoTerminal(1)  end, { desc = "harpoon prev" })
vim.api.nvim_create_user_command("H1", function() require("harpoon.ui").nav_file(1)  end, { desc = "harpoon nav" })
vim.api.nvim_create_user_command("H2", function() require("harpoon.ui").nav_file(2)  end, { desc = "harpoon nav" })
vim.api.nvim_create_user_command("H3", function() require("harpoon.ui").nav_file(3)  end, { desc = "harpoon nav" })
vim.api.nvim_create_user_command("H4", function() require("harpoon.ui").nav_file(4)  end, { desc = "harpoon nav" })
vim.api.nvim_create_user_command("H5", function() require("harpoon.ui").nav_file(5)  end, { desc = "harpoon nav" })
vim.api.nvim_create_user_command("H6", function() require("harpoon.ui").nav_file(6)  end, { desc = "harpoon nav" })

vim.keymap.set("n", "<leader>hm" , function() require("harpoon.mark").add_file() end, { desc = "harpoon mark" })
vim.keymap.set("n", "<leader>ht", function() require("harpoon.ui").toggle_quick_menu() end,
    { desc = "harpoon toggel menu" })
vim.keymap.set("n", "<leader>hn", function() require("harpoon.ui").nav_next() end, { desc = "harpoon next" })
vim.keymap.set("n", "<leader>hp", function() require("harpoon.ui").nav_prev() end, { desc = "harpoon prev" })
vim.keymap.set("n", "<leader>hc", function() require("harpoon.term").gotoTerminal(1)  end, { desc = "harpoon prev" })
vim.keymap.set("n", "<leader>h1", function() require("harpoon.ui").nav_file(1)  end, { desc = "harpoon nav" })
vim.keymap.set("n", "<leader>h2", function() require("harpoon.ui").nav_file(2)  end, { desc = "harpoon nav" })
vim.keymap.set("n", "<leader>h3", function() require("harpoon.ui").nav_file(3)  end, { desc = "harpoon nav" })
vim.keymap.set("n", "<leader>h4", function() require("harpoon.ui").nav_file(4)  end, { desc = "harpoon nav" })
vim.keymap.set("n", "<leader>h5", function() require("harpoon.ui").nav_file(5)  end, { desc = "harpoon nav" })
vim.keymap.set("n", "<leader>h6", function() require("harpoon.ui").nav_file(6)  end, { desc = "harpoon nav" })
