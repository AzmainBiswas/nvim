return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = { "nvim-treesitter/nvim-treesitter-context" },
		config = function()
			-- configuration start there
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "query", "python", "c", "cpp", "bash" },
				sync_install = true,
				auto_install = true,
				ignore_install = { "tex", "bibtex", "latex"  },
				highlight = {
					enable = true,
					disable = { "tex", "bibtex", "latex"  },
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
					disable = { "tex", "latex", "bibtex" },
				},
			})

			require("treesitter-context").setup({})

			vim.keymap.set("n", "[c", function()
				require("treesitter-context").go_to_context()
			end, { silent = true })
		end, -- config end there
	},
}
