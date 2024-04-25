return {
	"Tsuzat/NeoSolarized.nvim",
    lazy = true,
	config = function()
		require("NeoSolarized").setup({
			transparent = true,
			style = "dark",
		})
	end,
}
