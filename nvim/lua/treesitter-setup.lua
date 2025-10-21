require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "python", "go", "c", "vim", "vimdoc" },
  highlight = { enable = true },
  context_commentstring = { enable = true, enable_autocmd = false },
}
require('treesitter-context').setup {}

