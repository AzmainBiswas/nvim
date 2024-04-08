local statusline = {
	" %f",
	" %r",
	" %m",
	"%=", -- side change
	"[line:%l/%L] ",
    "[%p%%] ",
	"%y ",
}

vim.o.statusline = table.concat(statusline, "")
