local set = vim.keymap.set
-- set("n", "<CR>", ":")
-- set("n", "<C-b>", "<CMD>Ex<CR>")
-- set({ "n", "i", "s" }, "<C-S>", "<ESC><CMD>wa<CR>", { desc = "save all files." })
set({ "i", "n", "s" }, "<C-x><C-s>", "<ESC><CMD>wa<ESC>", { desc = "Save File" })

set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "sorce current file." })

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("n", "Q", "gqq")
set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- next greatest remap ever : asbjornHaland
set({ "n", "v" }, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])

-- resize vim window
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

-- compile commands
set("n", "<leader>e", function()
    vim.cmd("Ex")
end, { desc = "open file exploer" })

set("n", "<leader>qo", "<ESC><CMD>copen<CR>", { desc = "open Quickfix" })
set("n", "<leader>qq", "<ESC><CMD>cclose<CR>", { desc = "close Quickfix" })
set("n", "<leader>qn", "<ESC><CMD>cnext<CR>", { desc = "next Quickfix" })
set("n", "<leader>qp", "<ESC><CMD>cprevious<CR>", { desc = "prev Quickfix" })
set("n", "<leader>qe", function() vim.diagnostic.setqflist() end, { desc = "prev Quickfix" })

-- spell checker
set("n", "<leader>ss", "<CMD>:setlocal spell! spelllang=en_us<CR>", { desc = "set spell" })

-- custome function floating terminal
set('n', '<leader>oc', function() vim.cmd("e ~/.config/nvim/") end, { desc = 'open vim config file' })

set("n", "<leader>cp", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    print("file: " .. path)
end, { desc = "Copy full file path" })

--  See `:help wincmd` for a list of all window commands
set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- very sad for this but ...
set("n", "<C-Left>", "<C-w><C-h>")
set("n", "<C-Right>", "<C-w><C-L>")
set("n", "<C-Up>", "<C-w><C-k>")
set("n", "<C-Down>", "<C-w><C-j>")

-- some kymaps
-- set("i", "[", "[]<left>")
-- set("i", "(", "()<left>")
-- set("i", "{", "{}<left>")
-- vim.cmd [[
-- inoremap " ""<left>
-- inoremap ' ''<left>
-- inoremap ( ()<left>
-- inoremap [ []<left>
-- inoremap { {}<left>
-- inoremap {<CR> {<CR>}<ESC>O
-- inoremap {;<CR> {<CR>};<ESC>O
-- ]]
