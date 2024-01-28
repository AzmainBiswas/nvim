-- maps and settings
require("biswas.pre")

-- Lazy
require("biswas.lazy")

require("biswas.after")

-- set Color Scheme
-- local color = color or "gruvbox"
local color = color or "catppuccin-mocha"
vim.cmd.colorscheme(color)

-- auto cmd groups for formating lua and python on seved
local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

-- not working
vim.api.nvim_create_autocmd({ "BufEnter", "BufRead" }, {
	pattern = { ".c", ".cpp" },
	desc = "set tab to 2 space for c cpp files",
	callback = function()
		vim.cmd([[set tabstop=2 shiftwidth=2]])
	end,
	group = autocmd_group,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.py" },
	desc = "Auto-format Python files after saving",
	callback = function()
		local fileName = vim.api.nvim_buf_get_name(0)
		vim.cmd(":silent !black " .. fileName)
	end,
	group = autocmd_group,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.lua" },
	desc = "Auto-format Lua files after saving",
	callback = function()
		local fileName = vim.api.nvim_buf_get_name(0)
		vim.cmd(":silent !stylua  " .. fileName)
	end,
	group = autocmd_group,
})
