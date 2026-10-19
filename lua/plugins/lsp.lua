return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            -- disable <C-K>
            { "<c-k>", false, mode = "i" },
          },
        },
        -- Godot
        gdscript = {
          name = "godot",
          cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
        },
      },
    },
  },
}
