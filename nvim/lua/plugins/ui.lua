return {
  -- Optimized UI components
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        -- Optimize for GitHub theme
        default = {
          icon = "󰈔",
          color = "#65748a",
          cterm_color = "243",
          name = "Default",
        },
      },
    },
  },
}