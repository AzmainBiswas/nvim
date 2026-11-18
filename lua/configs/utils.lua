vim.api.nvim_create_user_command("BackslashAlign", function(opts)
  local col = tonumber(opts.args) or 80
  local lines = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, false)
  for i, line in ipairs(lines) do
    if line:match("\\%s*$") then
      local text = line:gsub("%s*\\%s*$", "")
      local pad = math.max(1, col - 1 - vim.fn.strdisplaywidth(text))
      lines[i] = text .. string.rep(" ", pad) .. "\\"
    end
  end
  vim.api.nvim_buf_set_lines(0, opts.line1 - 1, opts.line2, false, lines)
end, { range = true, nargs = "?" })
