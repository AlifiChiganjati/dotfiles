return {
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "fredrikaverpil/neotest-golang",
    "nvim-neotest/neotest-python",
    "haydenmeade/neotest-jest",
    "marilari88/neotest-vitest",
    "V13Axel/neotest-pest",
    "lawrence-laz/neotest-zig",
    "sidlatau/neotest-dart",
  },
  keys = {
    {
      "<leader>tl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run Last Test",
    },
    {
      "<leader>tL",
      function()
        require("neotest").run.run_last({ strategy = "dap", suite = true })
      end,
      desc = "Debug Last Test",
    },
    {
      "<leader>tw",
      "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch' })<cr>",
      desc = "Run Watch",
    },
  },
  opts = function(_, opts)
    table.insert(
      opts.adapters,
      require("neotest-jest")({
        jestCommand = "npm test --",
        jestConfigFile = "custom.jest.config.ts",
        env = { CI = true },
        cwd = function()
          return vim.fn.getcwd()
        end,
      })
    )
    table.insert(opts.adapters, require("neotest-vitest"))
    table.insert(
      opts.adapters,
      require("neotest-python")({
        -- Here you can specify the settings for the adapter, i.e.
        --       -- runner = "pytest",
        --       -- python = ".venv/bin/python",
      })
    )
    table.insert(
      opts.adapters,
      require("neotest-golang")({
        -- Here we can set options for neotest-golang, e.g.
        --       -- go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
        dap_go_enabled = true, -- requires leoluz/nvim-dap-go
      })
    )
    table.insert(opts.adapters, require("neotest-pest"))
    table.insert(opts.adapters, require("rustaceanvim.neotest"))
    table.insert(opts.adapters, require("neotest-zig"))
    table.insert(opts.adapters, require("neotest-dart"))
  end,
}
