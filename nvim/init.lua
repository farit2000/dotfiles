-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup modules
require("plugins-setup")
require("options-setup")
require("keymaps-setup")
require("treesitter-setup")
require("lsp-setup")
require("cmp-setup")
require("dap-setup")

-- UI
require("onedark").setup({ style = "cool" })
require("onedark").load()
require("nvim-tree").setup()
require("gitsigns").setup()
require("Comment").setup()
