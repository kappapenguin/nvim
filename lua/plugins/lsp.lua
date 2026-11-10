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
        -- Dioxus Tailwind
        tailwindcss = {
          filetypes_include = { "rust" },
          settings = {
            tailwindCSS = {
              includeLanguages = {
                rust = "html",
              },
              experimental = {
                classRegex = {
                  'class:\\s*"([^"]*)"',
                  'class:\\s*"([^"\\s]*)"',
                },
              },
            },
          },
        },
      },
    },
  },
}
