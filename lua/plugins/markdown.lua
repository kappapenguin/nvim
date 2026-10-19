return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      local lint = require("lint")
      if lint.linters["markdownlint-cli2"] then
        lint.linters["markdownlint-cli2"].args = {
          "--config",
          '{"MD013":false,"MD033":false,"MD041":false}',
          "--",
        }
      end
    end,
  },
}
