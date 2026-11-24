------------------
--   LazyVim    --
------------------
-- load lazyvim
require("config.lazy")

---------------
--  Function --
---------------
-- mark cursor before scrolling
local last_scroll_time = 0
local function mark_scroll(cmd)
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  return function()
    local now = vim.uv.now()

    if now - last_scroll_time > 700 then
      vim.cmd("normal! m'")
    end
    last_scroll_time = now
    vim.cmd("normal! " .. keys)
  end
end

---------------
--  Options  --
---------------
local function options(expandtab)
  -- use space indent in default
  if expandtab == nil then
    expandtab = true
  end

  -- options
  vim.opt.clipboard = "unnamedplus"
  vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  vim.opt.spell = false
  vim.opt.wrap = true
  vim.opt.breakindent = true

  -- format
  vim.opt_local.smartindent = true
  vim.opt_local.tabstop = 2
  vim.opt_local.shiftwidth = 2
  vim.opt_local.expandtab = expandtab
end

-- apply options
options()
--   space indent
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    options()
  end,
})
--   tab indent
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gdscript",
  callback = function()
    options(false)
  end,
})

---------------
--  Keymaps  --
---------------
local opts = { noremap = true, silent = true }

-- insert
vim.keymap.set("i", "jj", "<Esc>", opts)
vim.keymap.set("i", "<C-l>", "<Del>", opts)
vim.keymap.set("i", "<C-k>", "<C-o>O", opts)

-- viewing
vim.keymap.set({ "n", "v" }, "<C-u>", "5k", opts)
vim.keymap.set({ "n", "v" }, "<C-d>", "5j", opts)
vim.keymap.set({ "n", "v" }, "j", "gj", opts)
vim.keymap.set({ "n", "v" }, "k", "gk", opts)
vim.keymap.set({ "n", "v" }, "P", "gP", opts)
vim.keymap.set({ "n", "v" }, "<ScrollWheelDown>", mark_scroll("3<C-e>"), opts)
vim.keymap.set({ "n", "v" }, "<ScrollWheelUp>", mark_scroll("3<C-y>"), opts)

-- notify completion
vim.notify("initialization completed")
