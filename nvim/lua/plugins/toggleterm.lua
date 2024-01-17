return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mapping = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = "fish",
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "kj", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>tl", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })

    local node = Terminal:new({ cmd = "node", hidden = true })

    function _NODE_TOGGLE()
      node:toggle()
    end
    vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>lua _NODE_TOGGLE()<CR>", { noremap = true, silent = true })

    local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

    function _NCDU_TOGGLE()
      ncdu:toggle()
    end
    vim.api.nvim_set_keymap("n", "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<CR>", { noremap = true, silent = true })

    local htop = Terminal:new({ cmd = "htop", hidden = true })
    function _HTOP_TOGGLE()
      htop:toggle()
    end
    vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<CR>", { noremap = true, silent = true })

    local python = Terminal:new({ cmd = "python", hidden = true })
    function _PYTHON_TOGGLE()
      python:toggle()
    end
    vim.api.nvim_set_keymap("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>", { noremap = true, silent = true })
  end,
}
