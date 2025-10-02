return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter.configs")

		-- wrapper notify biar ada info di UI
		local function notify(msg, level)
			vim.notify("[TreeSitter] " .. msg, level or vim.log.levels.INFO, { title = "nvim-treesitter" })
		end

		ts.setup({
			auto_install = true, -- install otomatis parser yg hilang
			highlight = { enable = true },
			indent = { enable = true },
			ignore_install = {},
			sync_install = false, -- ⚡ non-blocking biar gak freeze
			modules = {},
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"kotlin",
				"c_sharp",
				"java",
				"diff",
				"fish",
				"jsdoc",
				"jsonc",
				"luadoc",
				"luap",
				"python",
				"regex",
				"svelte",
				"go",
				"gomod",
				"gowork",
				"gosum",
				"toml",
				"vimdoc",
				"yaml",
				"vue",
				"astro",
				"json",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"xml",
				"prisma",
				"markdown",
				"http",
				"markdown_inline",
				"sql",
				"graphql",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"php",
				"angular",
				"dart",
				"blade",
				"php_only",
				"norg",
				"scss",
				"typst",
				"latex",
			},
		})

		-- event hook: setelah parser diinstall
		local install = require("nvim-treesitter.install")
		install.prefer_git = true
		install.compilers = { "clang", "gcc" }

		vim.api.nvim_create_autocmd("User", {
			pattern = "TSUpdate",
			callback = function()
				notify("Parsers updated successfully ✅")
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "TSInstall",
			callback = function()
				notify("Parser installed ✅")
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "TSInstallInfo",
			callback = function()
				notify("Parser installation started ⏳")
			end,
		})
	end,
}
