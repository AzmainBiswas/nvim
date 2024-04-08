local ls = require("luasnip") --{{{
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
	s({ trig = "cmd" }, fmta("vim.cmd[[<>]]", { i(1, "vim commends") })),
	s({ trig = "vimkey" }, fmta("vim.keymap.set('<>', '<>', '<>', { desc = '<>' })", { i(1, "mode"), i(2, "key"), i(3, "commends"), i(4, "desc") })),
}
