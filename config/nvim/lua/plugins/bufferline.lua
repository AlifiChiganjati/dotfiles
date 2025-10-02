return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"DaikyXendo/nvim-material-icon",
	},
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			numbers = "none",
			close_command = "bdelete! %d",
			right_mouse_command = "bdelete! %d",
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_tab_indicators = true,
			persist_buffer_sort = true,
			separator_style = "thin",
			always_show_bufferline = true,
			diagnostics = "nvim_lsp",
		},
	},
	config = function()
		require("bufferline").setup({})
	end,
}
