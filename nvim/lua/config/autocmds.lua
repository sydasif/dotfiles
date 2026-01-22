-- Optimized file type specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = true
  end,
})

-- YAML: 2 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "yaml", "yml" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- Optimize startup time by deferring some UI updates
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.opt.timeoutlen = 500  -- Increase after startup for better UX
  end,
})
