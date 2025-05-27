return {
  "saghen/blink.cmp",
  optional = true,
  opts = {
    sources = {
      default = { "dadbod" },
      providers = {
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
      },
    },
  },
  dependencies = {
    "kristijanhusak/vim-dadbod-completion",
  },
}
