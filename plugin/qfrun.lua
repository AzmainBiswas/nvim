vim.api.nvim_create_user_command('Qfrun', function(opts)
    -- Specify the file to log output
    local log_file = '/tmp/nvim_cmd_output.log'

    -- Run the command and capture the output
    local output = vim.fn.systemlist(opts.args .. ' 2>&1 | tee ' .. log_file)

    -- Check if command failed
    if vim.v.shell_error ~= 0 then
        print("Command failed: " .. table.concat(output, "\n"))
        return
    end

    -- Populate Quickfix list with formatted output
    vim.fn.setqflist({}, ' ', {
        title = 'Command Output',
        lines = output
    })
    vim.cmd('copen')
end, { nargs = '+' })
