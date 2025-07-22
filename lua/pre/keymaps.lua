vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.keymap.set("n", "<CR>", ":")
-- vim.keymap.set("n", "<C-b>", "<CMD>Ex<CR>")
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>") -- escep from terminla mode
-- vim.keymap.set({ "n", "i", "s" }, "<C-S>", "<ESC><CMD>wa<CR>", { desc = "save all files." })

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
vim.keymap.set("n", "<leader>e", function()
    vim.cmd("Ex")
end, { desc = "open file exploer" })

vim.keymap.set({ "n", "i" }, "<F5>", function()
    vim.cmd("write")
    vim.cmd("make")
    vim.cmd("cwindow")
end, { desc = "Compile and Open Quickfix" })

vim.keymap.set("n", "<leader>qo", "<ESC><CMD>copen<CR>", { desc = "open Quickfix" })
vim.keymap.set("n", "<leader>qq", "<ESC><CMD>cclose<CR>", { desc = "close Quickfix" })
vim.keymap.set("n", "<leader>qn", "<ESC><CMD>cnext<CR>", { desc = "next Quickfix" })
vim.keymap.set("n", "<leader>qp", "<ESC><CMD>cprevious<CR>", { desc = "prev Quickfix" })

-- spell checker
vim.keymap.set("n", "<leader>ss", "<CMD>:setlocal spell! spelllang=en_us<CR>", { desc = "set spell" })

-- custome function floating terminal
vim.keymap.set('n', '<leader>t', function() vim.cmd("FloTerm") end, { desc = 'floating terminal' })
vim.keymap.set('n', '<leader>oc', function() vim.cmd("e ~/.config/nvim/") end, { desc = 'open vim config file' })

vim.keymap.set("n", "<leader>cp", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    print("file: " .. path)
end, { desc = "Copy full file path" })

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

-- lsp maps
vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
end, { desc = "go to difinition", silent = true, remap = false })

vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end,
    { desc = "Find References", silent = true, remap = false })

vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end,
    { desc = "Find References", silent = true, remap = false })

vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
end, { desc = "Peck difinition", silent = true, remap = false })

vim.keymap.set("n", "<leader>vws", function()
    vim.lsp.buf.workspace_symbol()
end, { desc = "workspace_symbol", silent = true, remap = false })

vim.keymap.set("n", "<leader>vd", function()
    vim.diagnostic.open_float()
end, { desc = "open_float", silent = true, remap = false })

vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_next()
end, { desc = "goto next", silent = true, remap = false })

vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_prev()
end, { desc = "goto previous", silent = true, remap = false })

vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
    { desc = "Code Action", silent = true, remap = false })
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
    { desc = "Rename", silent = true, remap = false })
vim.keymap.set("n", "cd", function() vim.lsp.buf.rename() end,
    { desc = "Rename", silent = true, remap = false })
vim.keymap.set("i", "<C-h>", function()
    vim.lsp.buf.signature_help()
end, { desc = "signature_help", silent = true, remap = false })

-- some kymaps
-- vim.keymap.set("i", "[", "[]<left>")
-- vim.keymap.set("i", "(", "()<left>")
-- vim.keymap.set("i", "{", "{}<left>")
-- vim.cmd [[
-- inoremap " ""<left>
-- inoremap ' ''<left>
-- inoremap ( ()<left>
-- inoremap [ []<left>
-- inoremap { {}<left>
-- inoremap {<CR> {<CR>}<ESC>O
-- inoremap {;<CR> {<CR>};<ESC>O
-- ]]
