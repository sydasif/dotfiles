return {
  -- Core LSP setup through LazyVim
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        ruff_lsp = {},
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
