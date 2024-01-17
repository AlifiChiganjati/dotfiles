-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = true }
local map = vim.keymap.set -- for conciseness
-- Press jk fast to exit insert mode
map("i", "jk", "<ESC>", opts)
map("i", "kj", "<ESC>", opts)

--emoji
map("i", "<c-i>", "<cmd>IconPickerInsert emoji<cr>", opts)

--terminal
map("n", "<leader>tf", "<cmd>ToggleTerm size=20 direction=float<cr>", { desc = "float" })
map("n", "<leader>tv", "<cmd>ToggleTerm size=60 direction=vertical<cr>", { desc = "vertical" })
map("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "hirozontal" })
