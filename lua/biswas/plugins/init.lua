return {
	{ "dstein64/vim-startuptime" },
	-- LSP progress messages.
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	},
}
