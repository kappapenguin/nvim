return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "none", -- デフォルト設定をリセット
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<Tab>"] = { "accept", "fallback" },
      ["<C-e>"] = { "cancel", "fallback" }, -- 補完ウィンドウを閉じる
    },
  },
}
