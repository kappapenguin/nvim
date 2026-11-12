return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        gdscript = { "gdformat" },
        rust = { "rustfmt", "dioxus", "rustywind" },
      },
      formatters = {
        dioxus = {
          condition = function(_, ctx)
            return vim.fs.find("Dioxus.toml", { upward = true, path = ctx.filename })[1] ~= nil
          end,
        },
        rustywind = {
          prepend_args = { "--custom-regex", [[class:\s*\x22([^\x22]*)\x22]] },
          condition = function(_, ctx)
            return vim.fs.find("Dioxus.toml", { upward = true, path = ctx.filename })[1] ~= nil
          end,
        },
      },
    },
  },
}
