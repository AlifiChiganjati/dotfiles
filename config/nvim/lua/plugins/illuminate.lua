return {
	"RRethy/vim-illuminate",
	config = function()
		require("illuminate").configure({
			delay = 200,

			filetypes_denylist = {
				"NvimTree",
				"dirvish",
				"fugitive",
				"TelescopePrompt",
				"gitcommit",
				"help",
			},

			-- ✅ hanya aktif di visual mode
			modes_denylist = {},

			case_insensitive = false,
		})

		-- ganti style highlight jadi underline (tanpa block background)
		vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true })
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true })
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true })

		-- navigasi reference tetap aktif
		vim.keymap.set("n", "]r", require("illuminate").goto_next_reference, { desc = "Next reference" })
		vim.keymap.set("n", "[r", require("illuminate").goto_prev_reference, { desc = "Prev reference" })
	end,
}
