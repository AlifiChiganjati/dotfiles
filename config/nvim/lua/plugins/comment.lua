return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		-- import comment plugin safely
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- enable comment
		comment.setup({
			padding = true,
			sticky = true,
			ignore = "",
			mappings = false,
			toggler = { line = "gcc", block = "gcb" },
			opleader = { line = "gc", block = "gb" },
			extra = { above = "gc0", below = "gco", eol = "gcA" },
			-- for commenting tsx, jsx, svelte, html files
			pre_hook = ts_context_commentstring.create_pre_hook(),
			post_hook = function() end,
		})
	end,
}
