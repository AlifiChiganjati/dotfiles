return {
	-- Add the blade-nav.nvim plugin which provides Goto File capabilities
	-- for Blade files.
	"ricardoramirezr/blade-nav.nvim",
	dependencies = {
		"jwalton512/vim-blade",
	},
	ft = { "blade", "php" }, -- optional, improves startup time
	opts = {
		-- This applies for nvim-cmp and coq, for blink refer to the configuration of this plugin
		close_tag_on_complete = true, -- default: true
	},
}
