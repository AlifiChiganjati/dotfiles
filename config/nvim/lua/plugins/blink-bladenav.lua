return {
  "saghen/blink.cmp",
  dependencies = {
    "ricardoramirezr/blade-nav.nvim",
  },
  optional = true,
  opts = {
    sources = {
      -- Add 'blade-nav' to the default list
      default = { "blade-nav" },

      providers = {
        ["blade-nav"] = {
          module = "blade-nav.blink",
          opts = {
            close_tag_on_complete = true, -- default: true,
          },
        },
      },
    },
  },
}
