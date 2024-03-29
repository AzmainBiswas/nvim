vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<CR>", ":")
-- vim.keymap.set("n", "<C-b>", "<CMD>Ex<CR>")
vim.keymap.set({ "n", "i", "s" }, "<C-S>", "<ESC><CMD>w<CR>")
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Q", "gqq")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("i", "<C-c>", "<Esc>")
-- vim.keymap.set("n", "<leader>cc", vim.cmd.ColorToggle)

-- spell checker
vim.keymap.set("n", "<leader>ss", "<CMD>set spell!<CR>", { desc = "set spell" })

-- for c and c++
vim.keymap.set("n", "<leader>cp", function()
	vim.cmd([[set tabstop=2 shiftwidth=2]])
end, { desc = "set tab 2 space" })

-- some keymaps
-- vim.keymap.set("i", "[", "[]<left>")
-- vim.keymap.set("i", "(", "()<left>")
-- vim.keymap.set("i", "{", "{}<left>")
