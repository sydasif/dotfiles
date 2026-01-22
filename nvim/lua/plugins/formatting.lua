return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" },
        yaml = { "yamlfmt" },
        jinja = { "djlint" },
      },
    },
  },
}
