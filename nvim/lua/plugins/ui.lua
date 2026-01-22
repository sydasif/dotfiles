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

  -- Better startup screen
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = {
        "",
        "███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
        "████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
        "██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║", 
        "██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
        "██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
        "",
      }

      local opts = {
        theme = "doom",
        hide = {
          statusline = false,
        },
        config = {
          header = logo,
          center = {
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "New File",
              desc_hl = "String",
              key = "n",
              key_hl = "Number",
              action = "enew",
            },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "Find File",
              desc_hl = "String",
              key = "f",
              key_hl = "Number",
              action = "Telescope find_files",
            },
            {
              icon = "󰈞 ",
              icon_hl = "@variable", 
              desc = "Recent Files",
              desc_hl = "String",
              key = "r",
              key_hl = "Number",
              action = "Telescope oldfiles",
            },
            {
              icon = "󰒲 ",
              icon_hl = "@variable",
              desc = "Find Word",
              desc_hl = "String", 
              key = "w",
              key_hl = "Number",
              action = "Telescope live_grep",
            },
            {
              icon = "󰂺 ",
              icon_hl = "@variable",
              desc = "Load Last Session",
              desc_hl = "String",
              key = "s",
              key_hl = "Number", 
              action = "SessionLoad",
            },
          },
          footer = {
            "LazyVim + GitHub Theme",
          },
        },
      }
      return opts
    end,
  },
}