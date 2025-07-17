local modes = {
	["n"] = "NORMAL",
	["no"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "VISUAL LINE",
	[""] = "VISUAL BLOCK",
	["s"] = "SELECT",
	["S"] = "SELECT LINE",
	[""] = "SELECT BLOCK",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["R"] = "REPLACE",
	["Rv"] = "VISUAL REPLACE",
	["c"] = "COMMAND",
	["cv"] = "VIM EX",
	["ce"] = "EX",
	["r"] = "PROMPT",
	["rm"] = "MOAR",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERMINAL",
}

-- mode in statusline
function Mode()
	local current_mode = vim.api.nvim_get_mode().mode
	return string.format("[%s]", modes[current_mode]):upper()
end

-- Function to get Git branch
function Get_git_branch()
	local fd = io.popen("git branch --show-current 2>/dev/null")
	if fd then
		local branch = fd:read("*l")
		fd:close()
		if branch then
			return string.format(" %s ", branch)
		else
			return ""
		end
	else
		return ""
	end
end

local statusline = {
	" %{v:lua.Mode()}",
	" %{v:lua.Get_git_branch()}",

	"%=", -- middle
	"%F", -- f / t / F
	"%r",
	"%m",
    "%h",

	"%=", -- right
	"[L:%l/%L] ",
	"%p%% ",
	"%y ",
}

local winbar = {
	"%=",
	"%m",
	"%t",
}

vim.o.statusline = table.concat(statusline, "")
--vim.o.winbar = table.concat(winbar, "")
