vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.keymap.set("n", "<CR>", ":")
vim.keymap.set("n", "<C-b>", "<CMD>Ex<CR>")
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>") -- escep from terminla mode
vim.keymap.set({ "n", "i", "s" }, "<C-S>", "<ESC><CMD>wa<CR>", { desc = "save all files." })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "sorce current file." })

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

-- compile commands
vim.keymap.set({ "i", "n" }, "<C-c>", function()
    vim.cmd("write")
    vim.cmd("make")
    vim.cmd("cwindow")
end, { desc = "Compile and Open Quickfix" })

vim.keymap.set({ "n", "i" }, "<F5>", function()
    vim.cmd("write")
    vim.cmd("make")
    vim.cmd("cwindow")
end, { desc = "Compile and Open Quickfix" })

vim.keymap.set("n", "<leader>co", "<ESC><CMD>copen<CR>", { desc = "open Quickfix" })
vim.keymap.set("n", "<leader>cq", "<ESC><CMD>cclose<CR>", { desc = "open Quickfix" })

-- spell checker
vim.keymap.set("n", "<leader>ss", "<CMD>set spell!<CR>", { desc = "set spell" })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- very sad for this but ...
vim.keymap.set("n", "<C-Left>", "<C-w><C-h>")
vim.keymap.set("n", "<C-Right>", "<C-w><C-L>")
vim.keymap.set("n", "<C-Up>", "<C-w><C-k>")
vim.keymap.set("n", "<C-Down>", "<C-w><C-j>")

-- some kymaps
-- vim.keymap.set("i", "[", "[]<left>")
-- vim.keymap.set("i", "(", "()<left>")
-- vim.keymap.set("i", "{", "{}<left>")
vim.cmd [[
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
]]
