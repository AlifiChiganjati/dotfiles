return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },

	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "enter",
			["<C-y>"] = { "select_and_accept" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },

			-- disable a keymap from the preset
			["<C-e>"] = false, -- or {}

			-- show with a list of providers
			-- ["<C-space>"] = {
			-- 	function(cmp)
			-- 		cmp.show({ providers = { "snippets" } })
			-- 	end,
			-- },
		},

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "Nerd Font",
		},

		cmdline = {
			enabled = false,
		},
		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			accept = {
				-- experimental auto-brackets support
				auto_brackets = {
					enabled = true,
				},
			},
			menu = {
				draw = {
					treesitter = { "lsp" },
				},
			},
			-- Show documentation when selecting a completion item
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},

			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
			-- Display a preview of the selected item on the current line
			ghost_text = { enabled = true },
		},
		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" },
		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
