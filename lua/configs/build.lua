-- vim.g.compile_cmd = nil

local function smart_build()
    local cmd = vim.o.makeprg
    if vim.g.compile_cmd then
        cmd = vim.g.compile_cmd
    end

    vim.ui.input({
        prompt = "Compile command: ",
        default = cmd
    }, function(input)
        if input and input ~= "" then
            vim.g.compile_cmd = input

            vim.opt_local.makeprg = vim.g.compile_cmd
            vim.cmd('make')
            vim.cmd('cwindow')
        end
    end)
end

vim.api.nvim_create_user_command('Build', function()
    vim.cmd('silent wa')
    smart_build()
end, {})

vim.api.nvim_create_user_command('Rebuild', function()
    vim.cmd('silent wa')
    vim.cmd('make')
    vim.cmd('cwindow')
end, {})

vim.keymap.set('n', '<C-B>', function()
    vim.cmd('Build')
    -- if vim.g.compile_cmd then
    --     vim.cmd('Rebuild')
    -- else
    --     vim.cmd('Build')
    -- end
end, { desc = "Build the project" })
