vim.opt.listchars = { tab = '>-', trail = '~', extends = '>' , precedes = '<' }
vim.opt.list = true

vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.shiftwidth = 8

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.number = true

vim.opt.spelllang= { 'en_us', 'ru' }

-- all for search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- encoding
vim.opt.fileencodings = { "utf-8", "cp1251", "koi8" }
vim.opt.encoding = "utf-8"

-- 
-- set statusline=%F%m%r%h%w\ [%04l,%04v][%p%%] " формат строки состояния
-- "hi statusline gui=reverse cterm=reverse " делать ее черной, а не белой
-- set laststatus=2 " всегда показывать строку состояния

