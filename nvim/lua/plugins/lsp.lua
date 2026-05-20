return {
  -- Core LSP setup through LazyVim
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {},
        ruff = {},
        yamlls = {
          settings = {
            yaml = {
              validate = true,
              completion = true,
              hover = true,
            },
          },
        },
      },
    },
  },
}
