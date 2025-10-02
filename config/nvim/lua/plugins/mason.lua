return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			automatic_installation = true,
			-- list of servers for mason to install
			ensure_installed = {
				"vtsls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"gopls",
				"intelephense",
				"marksman",
				"eslint",
				"jsonls",
			},
		})

		mason_tool_installer.setup({
			automatic_installation = true,
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"eslint_d",
				"prettierd",
				"goimports",
				"gofumpt",
				"gomodifytags",
				"impl",
				"google-java-format",
				"htmlbeautifier",
				"beautysh",
				"buf",
				"yamlfix",
				"taplo",
				"shellcheck",
				"delve",
				"astro-language-server",
				"blade-formatter",
				"phpstan",
				"pint",
				"markdownlint-cli2",
				"hadolint",
				"tlint",
			},
		})
	end,
}
