return {
	"stevearc/conform.nvim",
	enabled = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({

			formatters = {
				["markdown-toc"] = {
					condition = function(_, ctx)
						for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
							if line:find("<!%-%- toc %-%->") then
								return true
							end
						end
						return false
					end,
				},
				["markdownlint-cli2"] = {
					condition = function(_, ctx)
						local diag = vim.tbl_filter(function(d)
							return d.source == "markdownlint"
						end, vim.diagnostic.get(ctx.buf))
						return #diag > 0
					end,
				},
			},

			formatters_by_ft = {
				lua = { "stylua" },
				svelte = { "prettierd", "prettier", stop_after_first = true },
				astro = { "prettierd", "prettier", stop_after_first = true },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				graphql = { "prettierd", "prettier", stop_after_first = true },
				java = { "google-java-format" },
				ruby = { "standardrb" },
				markdown = { "markdownlint-cli2" },
				erb = { "htmlbeautifier" },
				html = { "htmlbeautifier" },
				bash = { "beautysh" },
				proto = { "buf" },
				yaml = { "yamlfix" },
				toml = { "taplo" },
				css = { "prettierd", "prettier", stop_after_first = true },
				scss = { "prettierd", "prettier", stop_after_first = true },
				sh = { "shellcheck" },
				go = { "goimports", "gofumpt" },
				xml = { "xmllint" },
				php = { "pint" },
				blade = { "blade-formatter" },
			},

			format_on_save = {
				timeout_ms = 3000,
				lsp_fallback = true,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
