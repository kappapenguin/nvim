return {
  {
    "folke/tokyonight.nvim",
    opts = {
      on_highlights = function(hl, c)
        -- 通常のテキスト色、または通常ハイライトに強制リンク・上書き
        hl.DiagnosticUnnecessary = { fg = c.fg }
        hl["@lsp.tag.unnecessary"] = { fg = c.fg }
        hl["@lsp.mod.unresolvedReference"] = {}
        hl["@lsp.type.unresolvedReference"] = {}
      end,
    },
  },
}
