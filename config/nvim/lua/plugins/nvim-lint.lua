return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = function(_, opts)
    opts.linters_by_ft = {
      dockerfile = { "hadolint" },
      markdown = { "markdownlint-cli2" },
      php = { "tlint" },
      sql = { "sqlfluff" },
      rust = { "bacon" },
      blade = { "tlint" },
    }
    opts.linters = {}
  end,
}
