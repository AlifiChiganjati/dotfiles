return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		local colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			red = "#FF4A4A",
			fg = "#c3ccdc",
			bg = "#112638",
			inactive_bg = "#2c3043",
			semilightgray = "#7f849c",
			gray = "#3b4252",
		}

		local theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
				y = { bg = colors.gray, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
				y = { bg = colors.gray, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
				y = { bg = colors.gray, fg = colors.fg },
			},
			command = {
				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
				y = { bg = colors.gray, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
				y = { bg = colors.gray, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.semilightgray },
				c = { bg = colors.inactive_bg, fg = colors.semilightgray },
				y = { bg = colors.inactive_bg, fg = colors.semilightgray },
			},
		}

		-- track last pressed key
		local last_key = ""
		vim.on_key(function(key)
			if key ~= "" and key ~= "\r" then
				last_key = vim.fn.keytrans(key)
			end
		end, vim.api.nvim_create_namespace("last_key_logger"))

		local function show_last_key()
			if last_key ~= "" then
				return " " .. last_key
			end
			return ""
		end

		local function record_indicator()
			local rec = vim.fn.reg_recording()
			if rec ~= "" then
				return " REC @" .. rec
			end
			return ""
		end

		lualine.setup({
			options = {
				theme = theme,
				globalstatus = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
						colored = true,
						update_in_insert = false,
						always_visible = true,
					},
					{
						"filetype",
						icon_only = true,
						separator = "",
						padding = { left = 1, right = 0 },
					},
					{ "filename", path = 1 }, -- 0 = just name, 1 = relative path
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{
						show_last_key,
						cond = function()
							return last_key ~= ""
						end,
						color = { fg = "#a0a8cd" },
					},
					{ record_indicator, color = { fg = "#ff5c57" } },
					{ "fileformat" },
				},
				lualine_y = {
					{ "progress", separator = " ", padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
				lualine_z = {
					function()
						return " " .. os.date("%R")
					end,
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
