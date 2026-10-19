------------------
--    Keymap    --
------------------
-- jj instead of Esc
vim.keymap.set("i", "jj", "<Esc>", { remap = false })
-- <C-l> instead of delete
vim.keymap.set("i", "<C-l>", "<Del>", { remap = false })
-- <C-k> instead of <C-o><S-o> (line break above)
vim.keymap.set("i", "<C-k>", "<C-o><S-o>", { remap = false })
-- <C-u>  instead of 5k
vim.keymap.set("n", "<C-u>", "5k", { remap = false })
-- <C-d>  instead of 5j
vim.keymap.set("n", "<C-d>", "5j", { remap = false })
-- j  instead of gj
vim.keymap.set({ "n", "v" }, "j", "gj", { remap = false })
-- k  instead of gk
vim.keymap.set({ "n", "v" }, "k", "gk", { remap = false })
-- move cursor down after paste
vim.keymap.set({ "n", "v" }, "P", "gP", { remap = false })

--------------------------
--      Settings        --
--------------------------
-- synchronize unnamed register and clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.spell = false

-- set after loaded
function Set_force()
  -- smartindent
  vim.opt.smartindent = true
  -- disable auto comment
  vim.opt.formatoptions = ""
  -- tab settings
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.expandtab = true
end

-- set format
Set_force()
-- set format for auto implemented file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = Set_force,
})

-- notify copletion
vim.notify("initialization completed")
