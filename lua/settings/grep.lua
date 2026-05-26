local function grep_word(word)
    local escaped_word = vim.fn.escape(word, " ")
    local success, _ = pcall(function()
        vim.api.nvim_cmd({
            cmd = "vimgrep",
            args = { string.format("/%s/j", escaped_word), "**/*" }
        }, {})
    end)

    if success then
        vim.cmd.copen()
    end
end

local function grep_yanked_text()
    local copied = vim.fn.getreg('"')
    copied = copied:gsub("^%s+", ""):gsub("%s+$", "")
    grep_word(copied)
end

local function grep_visual_selection()
  local _, srow, scol, _ = unpack(vim.fn.getpos("'<"))
  local _, erow, ecol, _ = unpack(vim.fn.getpos("'>"))

  if ecol > 2147483647 then
    ecol = vim.fn.col("'>")
  end

  local lines = vim.api.nvim_buf_get_text(0, srow - 1, scol - 1, erow - 1, ecol, {})
  local selection = table.concat(lines, " ")
  selection = selection:gsub("^%s+", ""):gsub("%s+$", "")
  grep_word(selection)
end

vim.keymap.set('v', '<leader>gv', function()
  vim.cmd('normal! \x1b') 
  grep_visual_selection()
end, { desc = "Grep visually selected text" })


vim.keymap.set('n', '<leader>gy', function()
  grep_yanked_text()
end, { desc = "Grep last yanked text" })
