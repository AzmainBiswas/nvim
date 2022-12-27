--leader map--
vim.g.mapleader = ' '
--general--
vim.keymap.set("n", "<C-X>", "<CMD>q<CR>")
vim.keymap.set("i", "<C-S>", "<esc><CMD>w<CR>")
vim.keymap.set("n", "<C-S>", "<esc><CMD>w<CR>")

--NvimTree---
--vim.keymap.set("n", "<C-h>", "<CMD>NvimTreeToggle<CR>")
--vim.keymap.set("n", "<C-f>", "<CMD>NvimTreeFocus<CR>")
vim.keymap.set("n", "<C-h>","<CMD>Ex<CR>")
--Vimtex--
vim.keymap.set("n", "<leader>ll", "<CMD>VimtexCompile<CR>")
vim.keymap.set("n", "<leader>lc", "<CMD>VimtexClean<CR>")
vim.keymap.set("n", "<leader>lv", "<CMD>VimtexView<CR>")
vim.keymap.set("n", "<leader>le", "<CMD>VimtexErrors<CR>")
vim.keymap.set("n", "<leader>lq", "<CMD>VimtexTocToggle<CR>")

--Telescope--
vim.keymap.set("n", "<C-p>", "<CMD>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fb", "<CMD>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fk", "<CMD>Telescope keymaps<CR>")
vim.keymap.set("n", "<leader>fh", "<CMD>Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>fd", "<CMD>Telescope file_browser<CR>")

--spell checking--
-- z+= to open spelling suggestion
vim.keymap.set("n", "<leader>ss", ":setlocal spell!<CR>")
vim.keymap.set("n", "<leader>c", "<CMD>SpellCheck<CR>")

--bufferline--
--vim.keymap.set("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>")
--vim.keymap.set("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>")

--move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-c>", "<ESC>")






