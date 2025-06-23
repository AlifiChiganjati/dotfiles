return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    default_format_opts = {
      timeout_ms = 3000,
      async = false, -- not recommended to change
      quiet = false, -- not recommended to change
      lsp_format = "fallback", -- not recommended to change
    },
    formatters = {
      sqlfluff = {
        args = { "format", "--dialect=ansi", "-" },
      },
      ["markdown-toc"] = {
        condition = function(_, ctx)
          for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
            if line:find("<!%-%- toc %-%->") then
              return true
            end
          end
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
      ["python"] = { "black" },
      go = { "goimports", "gofumpt" },
      ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
      ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
      htmlangular = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      astro = { "prettier" },
      php = { "blade-formatter" },
      blade = { "blade-formatter" },
      sql = { "sqlfluff" },
    },
  },
}
