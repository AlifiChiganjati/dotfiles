return {
	"utilyre/barbecue.nvim",
	enable = true,
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"DaikyXendo/nvim-material-icon",
	},
	opts = {
		show_dirname = false,
		show_basename = false, -- configurations go here
		{
			extra_groups = {
				"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
				"NvimTreeNormal", -- NvimTree
			},
		},
	},
}
