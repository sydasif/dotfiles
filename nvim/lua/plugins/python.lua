return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "python", "yaml" }, -- Combine with yaml from yaml.lua to avoid duplication
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = { theme = "auto" },
    },
  },
}
