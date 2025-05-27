return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = function(_, opts)
    opts.linters_by_ft = {
      dockerfile = { "hadolint" },
      markdown = { "markdownlint-cli2" },
      php = { "phpstan" },
      sql = { "sqlfluff" },
      rust = { "bacon" },
    }
    opts.linters = {}
  end,
}
