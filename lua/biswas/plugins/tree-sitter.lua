return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = { "nvim-treesitter/nvim-treesitter-context" },
		config = function()
			-- configuration start there
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "query", "python", "c", "cpp", "bash" },
				sync_install = false,
				auto_install = true,
				ignore_install = { "" },
				highlight = {
					enable = true,
					disable = { "tex", "latex", "pa1" },
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
					disable = { "tex", "latex" },
				},
			})

			require("treesitter-context").setup({})

			vim.keymap.set("n", "[c", function()
				require("treesitter-context").go_to_context()
			end, { silent = true })
		end, -- config end there
	},
}
