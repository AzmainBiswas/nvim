return {
	{ "folke/which-key.nvim", lazy = true },
	{
		"norcalli/nvim-colorizer.lua",
		lazy = true,
		config = function()
			require("colorizer").setup()
		end,
	},
	{ "dstein64/vim-startuptime" },
	{ "mbbill/undotree" },
	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
	},
	-- alpha nvim dashbord
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"linrongbin16/lsp-progress.nvim",
		},
	},
	{
		"linrongbin16/lsp-progress.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lsp-progress").setup()
		end,
	},
	-- tree-sitter
	{
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		"nvim-treesitter/nvim-treesitter-context",
	},
	{ "lukas-reineke/indent-blankline.nvim" },
	-- useless
	-- { "eandrju/cellular-automaton.nvim" },

	-- lsp
	{
		"vonheikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- lsp support
			{ "neovim/nvim-lspconfig" }, -- required
			{ -- optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "masonupdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- optional

			-- autocompletion
			{ "hrsh7th/nvim-cmp" }, -- required
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lsp" }, -- required
			{ "hrsh7th/cmp-cmdline" },
		},
	},
	-- snipets
	{ "l3mon4d3/luasnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	-- { "SirVer/ultisnips" },
	-- vimtex
	{
		"lervag/vimtex",
	},
	-- vim-tmux-navigator
	{ "christoomey/vim-tmux-navigator", lazy = false },
	-- colorschemes
	"folke/tokyonight.nvim",
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
}
