return {
	"saghen/blink.pairs",
	version = "*",
	dependencies = "saghen/blink.download",
	opts = {
		mappings = {
			enabled = true,
			disabled_filetypes = {},
			pairs = {}, -- add overrides if needed
		},
		highlights = {
			enabled = true,
			groups = {
				"BlinkPairsOrange",
				"BlinkPairsPurple",
				"BlinkPairsBlue",
			},
			matchparen = {
				enabled = true,
				group = "BlinkPairsMatchParen",
			},
		},
		debug = false,
	},
}
