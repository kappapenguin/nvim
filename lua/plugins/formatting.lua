return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        gdscript = { "gdformat" },
        rust = { "rustfmt", "dioxus" },
      },
      formatters = {
        dioxus = {
          condition = function(_, ctx)
            return vim.fs.find("Dioxus.toml", { upward = true, path = ctx.filename })[1] ~= nil
          end,
        },
      },
    },
  },
}
