-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.g.lazyvim_mini_snippets_in_completion = true
vim.g.lazyvim_picker = "fzf"
vim.g.lazyvim_eslint_auto_format = true
vim.g.lazyvim_php_lsp = "intelephense"
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_blink_main = false
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"

vim.opt.shortmess:append("c") -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append("-") -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
