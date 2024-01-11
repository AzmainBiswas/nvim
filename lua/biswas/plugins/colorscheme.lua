return {
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				no_italic = false,
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					loops = { "italic" },
					functions = { "italic" },
					keywords = { "bold" },
					strings = {},
					variables = {},
					numbers = { "italic" },
					booleans = { "italic" },
					properties = {},
					types = { "bold" },
					operators = {},
				},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
				},
			})
		end, -- config end for catppuccin
	},

	-- tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = true,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				styles = {
					comments = { italic = true },
					functions = {},
				},
				sidebars = { "qf", "vista_kind", "terminal", "packer" },
			})
		end, -- config ends here for tokyonight
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
		config = function()
			require("gruvbox").setup({
				undercurl = true,
				underline = true,
				bold = false,
				italic = {
					strings = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "hard", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = true,
				transparent_mode = true,
			})
		end, -- gruvbox
	},
}
