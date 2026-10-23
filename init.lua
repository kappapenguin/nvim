------------------
--   LazyVim    --
------------------
-- load lazyvim
require("config.lazy")

---------------
--  Options  --
---------------
local function options()
  -- options
  vim.opt.clipboard = "unnamedplus"
  vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  vim.opt.spell = false
  vim.opt.wrap = true
  vim.opt.breakindent = true

  -- format
  vim.opt.smartindent = true
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.expandtab = true
end

options()
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = options,
})

---------------
--  Keymaps  --
---------------
local opts = { noremap = true, silent = true }

-- insert
vim.keymap.set("i", "jj", "<Esc>", opts)
vim.keymap.set("i", "<C-l>", "<Del>", opts)
vim.keymap.set("i", "<C-k>", "<C-o>O", opts)

-- normal
vim.keymap.set({ "n", "v" }, "<C-u>", "5k", opts)
vim.keymap.set({ "n", "v" }, "<C-d>", "5j", opts)
vim.keymap.set({ "n", "v" }, "j", "gj", opts)
vim.keymap.set({ "n", "v" }, "k", "gk", opts)
vim.keymap.set({ "n", "v" }, "P", "gP", opts)

-- notify completion
vim.notify("initialization completed")
