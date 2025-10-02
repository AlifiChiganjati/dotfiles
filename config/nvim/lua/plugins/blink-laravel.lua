return {
	"saghen/blink.cmp",
	optional = true,
	dependencies = {
		"adalessa/laravel.nvim",
		"saghen/blink.compat",
	},
	opts = {
		sources = {
			-- Add 'blade-nav' to the default list
			default = { "laravel" },

			providers = {
				laravel = {
					name = "laravel",
					module = "blink.compat.source",
					score_offset = 95, -- show at a higher priority than lsp
				},
			},
		},
	},
}
