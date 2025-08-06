return {
  -- {
  --   "olimorris/onedarkpro.nvim",
  --   priority = 1000, -- Ensure it loads first
  --   config = function()
  --     require("onedarkpro").setup({
  --       options = {
  --         transparency = true,
  --         lualine_transparency = true,
  --         cursorline = true,
  --         highlight_inactive_windows = true,
  --       },
  --     })
  --     vim.cmd("colorscheme onedark_dark")
  --   end,
  -- },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
