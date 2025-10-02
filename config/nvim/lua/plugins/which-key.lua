return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		---@type false | "classic" | "modern" | "helix"
		preset = "helix",
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
		{
			"<leader>q",
			"",
			desc = "Quit",
		},
		{
			"<leader>s",
			"",
			desc = "Search",
		},
		{
			"<leader>c",
			"",
			desc = "Code",
		},
		{
			"<leader>l",
			"",
			desc = "Lazy/Laravel",
		},
		{
			"<leader>n",
			"",
			desc = "Notification History",
		},
		{
			"<leader>t",
			"",
			desc = "Tab",
		},
		{
			"<leader>e",
			"",
			desc = "Explorer",
		},
		{ "<leader>x", "", desc = "Diagnostics" },
		{ "<leader>f", "", desc = "File/Find" },
		{ "<leader>g", "", desc = "Git" },
		{ "<leader>b", "", desc = "Buffer" },
		{ "<leader>u", "", desc = "UI" },
		{ "<leader>r", "", desc = "Restart" },
	},
}
