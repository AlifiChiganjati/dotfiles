return {
	"mfussenegger/nvim-lint",
	enabled = true,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local M = {}

		local lint = require("lint")

		local opts = {
			linters = {
				eslint_d = {
					name = "eslint_d",
					parser = {},
					cmd = "eslint_d",
					args = {
						"--no-warn-ignored",
						"--format",
						"json",
						"--stdin",
						"--stdin-filename",
						function()
							return vim.api.nvim_buf_get_name(0)
						end,
					},
					prepend_args = {
						"--config",
						function()
							return vim.fn.getcwd() .. "/eslint.config.js"
						end,
					},
				},
			},
			linters_by_ft = {
				dockerfile = { "hadolint" },
				markdown = { "markdownlint-cli2" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				svelte = { "eslint_d" },
				terraform = { "tflint" },
				php = { "phpstan" },
				-- php = { "phpcs" },
				blade = { "phpstan" },
				["_"] = {}, -- fallback
				["*"] = {}, -- global
			},
			events = { "BufWritePost", "InsertLeave" },
		}

		-- Merge linters
		for name, linter in pairs(opts.linters) do
			if type(linter) == "table" and type(lint.linters[name]) == "table" then
				lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name], linter)
				if type(linter.prepend_args) == "table" then
					lint.linters[name].args = lint.linters[name].args or {}
					vim.list_extend(lint.linters[name].args, linter.prepend_args)
				end
			else
				lint.linters[name] = linter
			end
		end

		lint.linters_by_ft = opts.linters_by_ft

		function M.debounce(ms, fn)
			local timer = vim.uv.new_timer()
			return function(...)
				local argv = { ... }
				timer:start(ms, 0, function()
					timer:stop()
					vim.schedule_wrap(fn)(table.unpack(argv))
				end)
			end
		end

		function M.lint()
			local names = lint._resolve_linter_by_ft(vim.bo.filetype)
			names = vim.list_extend({}, names)

			if #names == 0 then
				vim.list_extend(names, lint.linters_by_ft["_"] or {})
			end

			vim.list_extend(names, lint.linters_by_ft["*"] or {})

			local ctx = { filename = vim.api.nvim_buf_get_name(0) }
			ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
			names = vim.tbl_filter(function(name)
				local linter = lint.linters[name]
				if not linter then
					vim.notify("Linter not found: " .. name, vim.log.levels.WARN)
				end
				return linter and not (type(linter) == "table" and linter.condition and not linter.condition(ctx))
			end, names)

			if #names > 0 then
				lint.try_lint(names)
			end
		end

		-- Setup autocmd with debounce
		vim.api.nvim_create_autocmd(opts.events, {
			group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
			callback = M.debounce(100, M.lint),
		})

		-- Manual lint trigger
		vim.keymap.set("n", "<leader>ll", function()
			M.lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
