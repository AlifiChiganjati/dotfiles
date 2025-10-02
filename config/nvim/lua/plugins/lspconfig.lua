return {
	"neovim/nvim-lspconfig",
	enabled = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "saghen/blink.cmp" },
	},
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local lspconfig = vim.lsp.config
		local keymap = vim.keymap

		-- Common keymaps on attach
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				local mappings = {
					{ "n", "gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references" },
					{ "n", "gD", vim.lsp.buf.declaration, "Go to declaration" },
					{ "n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions" },
					{ "n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations" },
					{ "n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions" },
					{ { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "See available code actions" },
					{ "n", "<leader>rn", vim.lsp.buf.rename, "Smart rename" },
					{ "n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics" },
					{ "n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics" },
					{ "n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic" },
					{ "n", "]d", vim.diagnostic.goto_next, "Next diagnostic" },
					{ "n", "K", vim.lsp.buf.hover, "Hover documentation" },
					{ "n", "<leader>rs", ":LspRestart<CR>", "Restart LSP" },
				}
				for _, m in ipairs(mappings) do
					opts.desc = m[4]
					keymap.set(m[1], m[2], m[3], opts)
				end
			end,
		})

		-- Diagnostic UI
		vim.diagnostic.config({
			virtual_text = {
				prefix = "●",
				spacing = 2,
				source = "if_many",
				severity = { min = vim.diagnostic.severity.ERROR },
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "󰠠",
				},
			},
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})
		-- Hilangkan blok saat cursor di atas LSP reference
		vim.api.nvim_set_hl(0, "LspReferenceText", { underline = true, bg = "NONE" })
		vim.api.nvim_set_hl(0, "LspReferenceRead", { underline = true, bg = "NONE" })
		vim.api.nvim_set_hl(0, "LspReferenceWrite", { underline = true, bg = "NONE" })

		-- Default capabilities
		lspconfig("*", { capabilities = capabilities })

		-- Language-specific configs
		lspconfig("svelte", {
			on_attach = function(client)
				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
					end,
				})
			end,
		})

		lspconfig("graphql", {
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		})

		lspconfig("emmet_ls", {
			filetypes = {
				"html",
				"typescriptreact",
				"javascriptreact",
				"css",
				"sass",
				"scss",
				"less",
				"svelte",
				"blade",
				"php",
			},
		})

		lspconfig("eslint", {
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		lspconfig("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					completion = { callSnippet = "Replace" },
				},
			},
		})

		lspconfig("gopls", {
			settings = {
				gopls = {
					gofumpt = true,
					codelenses = {
						generate = true,
						regenerate_cgo = true,
						run_govulncheck = true,
						test = true,
						tidy = true,
						upgrade_dependency = true,
						vendor = true,
					},
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
					analyses = {
						nilness = true,
						unusedparams = true,
						unusedwrite = true,
						useany = true,
					},
					usePlaceholders = true,
					completeUnimported = true,
					staticcheck = true,
					directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
					semanticTokens = true,
				},
			},
		})

		lspconfig("intelephense", {
			filetypes = { "php", "blade", "php_only" },
			settings = {
				intelephense = {
					files = {
						associations = { "*.php", "*.blade.php" },
						maxSize = 5000000,
					},
				},
			},
		})
	end,
}
