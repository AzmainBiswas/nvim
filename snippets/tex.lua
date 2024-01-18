local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local tex_utils = {}
tex_utils.in_mathzone = function() -- math context detection
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex_utils.in_text = function()
	return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function() -- comment detection
	return vim.fn["vimtex#syntax#in_comment"]() == 1
end
tex_utils.in_env = function(name) -- generic environment detection
	local is_inside = vim.fn["vimtex#env#is_inside"](name)
	return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function() -- equation environment detection
	return tex_utils.in_env("equation")
end
tex_utils.in_itemize = function() -- itemize environment detection
	return tex_utils.in_env("itemize")
end
tex_utils.in_tikz = function() -- TikZ picture environment detection
	return tex_utils.in_env("tikzpicture")
end

-- get_visual
local get_visual = function(args, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else -- If LS_SELECT_RAW is empty, return a blank insert node
		return sn(nil, i(1))
	end
end
-- For beamer
tex_utils.in_beamer = function()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	for _, line in ipairs(lines) do
		if line:match("\\documentclass{beamer}") then
			return true
		end
	end
	return false
end

-- only expand in new line
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	-- greak latters
	s({ trig = ";a", snippetType = "autosnippet" }, { t("\\alpha") }, { condition = tex_utils.in_mathzone }),
	s({ trig = ";b", snippetType = "autosnippet" }, { t("\\beta") }, { condition = tex_utils.in_mathzone }),
	s({ trig = ";g", snippetType = "autosnippet" }, { t("\\gamma") }, { condition = tex_utils.in_mathzone }),
	s({ trig = ";G", snippetType = "autosnippet" }, { t("\\Gamma") }, { condition = tex_utils.in_mathzone }),
	s({ trig = ";t", snippetType = "autosnippet" }, { t("\\theta") }, { condition = tex_utils.in_mathzone }),
	s({ trig = ";T", snippetType = "autosnippet" }, { t("\\Theta") }, { condition = tex_utils.in_mathzone }),
	s({ trig = ";p", snippetType = "autosnippet" }, { t("\\phi") }, { condition = tex_utils.in_mathzone }),
	s({ trig = ";P", snippetType = "autosnippet" }, { t("\\pi") }, { condition = tex_utils.in_mathzone }),
	s({ trig = ";l", snippetType = "autosnippet" }, { t("\\lambda") }, { condition = tex_utils.in_mathzone }),
	s({ trig = ";L", snippetType = "autosnippet" }, { t("\\Lambda") }, { condition = tex_utils.in_mathzone }),
	s({ trig = ";m", snippetType = "autosnippet" }, { t("\\mu") }, { condition = tex_utils.in_mathzone }),
	s({ trig = ";e", snippetType = "autosnippet" }, { t("\\epsilon") }, { condition = tex_utils.in_mathzone }),
	s({ trig = ";s", snippetType = "autosnippet" }, { t("\\sigma") }, { condition = tex_utils.in_mathzone }),

	-- sets
	s({ trig = "NN", snippetType = "autosnippet" }, { t("\\mathds{N}") }, { condition = tex_utils.in_mathzone }),
	s({ trig = "QQ", snippetType = "autosnippet" }, { t("\\mathds{Q}") }, { condition = tex_utils.in_mathzone }),
	s({ trig = "RR", snippetType = "autosnippet" }, { t("\\mathds{R}") }, { condition = tex_utils.in_mathzone }),
	s({ trig = "CC", snippetType = "autosnippet" }, { t("\\mathds{C}") }, { condition = tex_utils.in_mathzone }),

	-- math tools
	s({ trig = "infty", snippetType = "autosnippet" }, { t("\\infty") }, { condition = tex_utils.in_mathzone }),
	s({ trig = "<=", snippetType = "autosnippet" }, { t("\\le") }, { condition = tex_utils.in_mathzone }),
	s({ trig = ">=", snippetType = "autosnippet" }, { t("\\ge") }, { condition = tex_utils.in_mathzone }),
	s({ trig = "...", snippetType = "autosnippet" }, { t("\\ldots") }, { condition = tex_utils.in_mathzone }),
	s({ trig = "sr", snippetType = "autosnippet" }, { t("^{2}") }, { condition = tex_utils.in_mathzone }),
	s(
		{ trig = "//", snippetType = "autosnippet", wordTrig = false },
		fmta("\\frac{<>}{<>}", { i(1), i(2) }),
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "__", snippetType = "autosnippet", wordTrig = false },
		fmta([[ _{<>} ]], { d(1, get_visual) }),
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "lr(", snippetType = "autosnippet", wordTrig = false },
		fmta("\\left( <> \\right)", { i(1) }),
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "lr[", snippetType = "autosnippet", wordTrig = false },
		fmta("\\left[ <> \\right]", { i(1) }),
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "tp", snippetType = "autosnippet", wordTrig = false },
		fmta([[ ^{<>} ]], { d(1, get_visual) }),
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "sum", snippetType = "autosnippet", wordTrig = false },
		fmta([[ \sum_{<>}^{<>} ]], { i(1, "i = 0"), i(2, "\\infty") }),
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "lim", snippetType = "autosnippet", wordTrig = false },
		fmta([[ \lim_{<>} ]], { i(1, "n \\to \\infty") }),
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "int", snippetType = "autosnippet", wordTrig = false },
		fmta([[ \int_{<>}^{<>} ]], { i(1, "0"), i(2, "\\infty") }),
		{ condition = tex_utils.in_mathzone }
	),

	-- environments
	s({ trig = "mk", snippetType = "autosnippet" }, fmta([[$ <> $]], { d(1, get_visual) })),
	s(
		{ trig = "dm", snippetType = "autosnippet" },
		fmta(
			[[
        \[
            <>
        \]
    ]],
			{ i(1, "equation") }
		)
	),

	s(
		{ trig = "beg", snippetType = "autosnippet" },
		fmta(
			[[
      \begin{<>}
          <>
      \end{<>}
    ]],
			{
				i(1),
				i(2),
				rep(1), -- this node repeats insert node i(1)
			}
		)
	),

	s(
		{ trig = "*eqn", snippetType = "autosnippet", dscr = "Expands 'eq' into an equation environment" },
		fmta(
			[[
       \begin{equation*}
           <>
       \end{equation*}
     ]],
			{ i(1) }
		)
	),

	s(
		{ trig = "eqn", snippetType = "autosnippet", dscr = "Expands 'eq' into an equation environment" },
		fmta(
			[[
       \begin{equation}
           <>
       \end{equation}
     ]],
			{ i(1) }
		)
	),

	s(
		{ trig = "*aln", snippetType = "autosnippet", dscr = "Expands 'eq' into an equation environment" },
		fmta(
			[[
       \begin{align*}
           <>
       \end{align*}
     ]],
			{ i(1) }
		)
	),

	s(
		{ trig = "aln", snippetType = "autosnippet", dscr = "Expands 'eq' into an equation environment" },
		fmta(
			[[
       \begin{align}
           <>
       \end{align}
     ]],
			{ i(1) }
		)
	),

	s(
		{ trig = "enumerate", dscr = "enumerate" },
		fmta(
			[[
        \begin{enumerate}
            \item <>
        \end{enumerate}
     ]],
			{ i(1) }
		)
	),

	s(
		{ trig = "itemize", dscr = "itemize" },
		fmta(
			[[
        \begin{itemize}
            \item <>
        \end{itemize}
     ]],
			{ i(1) }
		)
	),

	s({ trig = "itm", snippetType = "autosnippet" }, fmta([[ \item <> ]], { i(1, "item") })),
	s(
		{ trig = "figuer", dscr = "for picture insert in latex" },
		fmta(
			[[
        \begin{figure}[H]
            \centering
            \includegraphics[width=0.6\textwidth]{<>}
            \caption{<>}
            \label{<>}
        \end{figure}
            ]],
			{
				i(1, "picture location"),
				i(2, "caption"),
				i(3, "label"),
			}
		),
		{ condition = line_begin }
	),

	s(
		{ trig = "diff", snippetType = "autosnippet" },
		fmta(
			[[
            \begin{definition}[<>]
                <>
            \end{definition}
            <>
            ]],
			{ i(1), i(2), i(0) }
		),
		{ condition = line_begin }
	),

	s(
		{ trig = "thrm", snippetType = "autosnippet" },
		fmta(
			[[
            \begin{theorem}[<>]
                <>
            \end{theorem}
            <>
            ]],
			{ i(1), i(2), i(0) }
		),
		{ condition = line_begin }
	),

	s(
		{ trig = "prf", snippetType = "autosnippet" },
		fmta(
			[[
            \begin{proof}
                <>
            \end{proof}
            ]],
			{ i(1) }
		),
		{ condition = line_begin }
	),

	s(
		{ trig = "eg", snippetType = "autosnippet" },
		fmta(
			[[
            \begin{example}
                <>
            \end{example}
            ]],
			{ i(1) }
		),
		{ condition = line_begin }
	),

	s(
		{ trig = "cases", snippetType = "autosnippet" },
		fmta(
			[[
            \begin{cases}
                <>
            \end{cases}
            ]],
			{ i(1) }
		),
		{ condition = tex_utils.in_mathzone }
	),
	s(
		{ trig = "bfr", snippetType = "autosnippet", dscr = "Begin frame" },
		fmta(
			[[
            \begin{frame}{<>}
                <>
            \end{frame}
            ]],
			{ i(1), i(0) }
		)
	),

	-- text mods
	s(
		{ trig = "txt", snippetType = "autosnippet" },
		fmta([[ \text{<>} ]], { i(1) }),
		{ condition = tex_utils.in_mathzone }
	),
	s({ trig = "tii", snippetType = "autosnippet" }, fmta([[ \textit{<>} ]], { d(1, get_visual) })), -- seclect text and press tab and usr prefix
	s({ trig = "tbb", snippetType = "autosnippet" }, fmta([[ \textbf{<>} ]], { d(1, get_visual) })),
	s({ trig = "mbb", snippetType = "autosnippet" }, fmta([[ \mathbf{<>} ]], { d(1, get_visual) })),
	s({ trig = "mcl", snippetType = "autosnippet" }, fmta([[ \mathcal{<>} ]], { d(1, get_visual) })),

	-- sections chapter
	s(
		{ trig = "*chap", dscr = "un-numbered chapter", snippetType = "autosnippet" },
		fmta([[\chapter*{<>}]], { i(1) }),
		{ condition = line_begin }
	),
	s(
		{ trig = "*sec", dscr = "un-numbered section", snippetType = "autosnippet" },
		fmta([[\section*{<>}]], { i(1) }),
		{ condition = line_begin }
	),
	s(
		{ trig = "chap", dscr = "chapter", snippetType = "autosnippet" },
		fmta([[\chapter{<>}]], { i(1) }),
		{ condition = line_begin }
	),
	s(
		{ trig = "sec", dscr = "Top-level section", snippetType = "autosnippet" },
		fmta([[\section{<>}]], { i(1) }),
		{ condition = line_begin }
	),
	s(
		{ trig = "subsce", dscr = "sub section", snippetType = "autosnippet" },
		fmta([[\subsection{<>}]], { i(1) }),
		{ condition = line_begin }
	),
	s(
		{ trig = "*subsce", dscr = "nu-numbered dunsection" },
		fmta([[\subsection*{<>}]], { i(1) }),
		{ condition = line_begin }
	),
}
