local compile_cmd = nil

local function smart_build()
    local cmd = vim.o.makeprg
    if compile_cmd then
        cmd = compile_cmd
    end

    local input = vim.fn.input({
        prompt       = "⚒  Compile command: ",
        default      = cmd,
        completion   = "shellcmdline",
        cancelreturn = "",
    })

    if input == "" then
        return
    end

    compile_cmd = input

    vim.opt_local.makeprg = compile_cmd
    vim.cmd('silent wa')
    vim.cmd('make')
    vim.cmd('cwindow')
end

vim.api.nvim_create_user_command('Build', function()
    smart_build()
end, {})

vim.api.nvim_create_user_command('Rebuild', function()
    if compile_cmd then
        vim.opt_local.makeprg = compile_cmd
    end

    vim.cmd('silent wa')
    vim.cmd('make')
    vim.cmd('cwindow')
end, {})

vim.keymap.set('n', '<C-B>', function()
    if compile_cmd then
        vim.cmd('Rebuild')
    else
        vim.cmd('Build')
    end
end, { desc = "Build the project" })
