return {
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      --highlight
      require("nvim-highlight-colors").setup({})
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
}
