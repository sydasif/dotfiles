return {
  {
    "projekt0n/github-nvim-theme",
    lazy = false, -- Must be false to load at startup
    priority = 1000, -- Highest priority to load first
    opts = {
      options = {
        bold_vert_split = false,
        hide_end_of_buffer = true,
        hide_nc_statusline = false,
        transparent = false,
        dim_inactive = false,
        group_separator = nil,
        comment_style = "italic",
        keyword_style = "bold",
        function_style = "bold",
        variable_style = "bold",
      },
    },
    config = function(_, opts)
      require('github-theme').setup(opts)
      -- Apply the colorscheme after setup
      vim.cmd.colorscheme("github_dark")
    end,
  },
}