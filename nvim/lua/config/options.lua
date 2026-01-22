-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Additional optimizations
vim.opt.updatetime = 250  -- Faster completion/updates
vim.opt.signcolumn = "yes"  -- Keep gutter for consistent line numbers
vim.opt.timeoutlen = 300  -- Time to wait for a mapped sequence
vim.opt.shortmess:append("c")  -- Don't give |ins-completion-menu| messages

-- Optimized for GitHub theme and performance
vim.g.transparent_enabled = false  -- Ensure transparency is off for better performance