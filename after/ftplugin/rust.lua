-- vim.opt_local.makeprg = "cargo build"
vim.cmd("compiler cargo")

vim.keymap.set('n', '<leader>r', function ()
    vim.cmd("Cargo run")
end, { desc = 'Cargo run', buffer = 0})

vim.keymap.set('n', '<leader>b', function ()
    vim.cmd("Cargo build")
end, { desc = 'Cargo Build' , buffer = 0})
