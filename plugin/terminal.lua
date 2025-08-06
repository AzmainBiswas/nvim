local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- disable line number and relative line number in neovim terminal
vim.api.nvim_create_autocmd("TermOpen", {
    group = augroup,
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.scrolloff = 0

        vim.api.nvim_feedkeys("i", "n", false) -- Map normal mode to insert mode
    end
})

vim.keymap.set('n', '<leader>tt', function()
    vim.cmd.vnew()
    vim.cmd.terminal()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)
end, { desc = 'terminal' })

vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>") -- escep from terminla mode
