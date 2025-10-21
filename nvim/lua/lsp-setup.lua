-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "gopls", "pyright", "lua_ls" },
})

-- Общая функция attach для LSP
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- Основные LSP команды
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

  -- Форматирование
  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end

-- Настройка LSP серверов
local servers = { "gopls", "pyright", "lua_ls" }

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
  })
  vim.lsp.enable(server)
end

-- Diagnostics
vim.diagnostic.config({
  virtual_text = false,     -- отключаем встроенный текст в строке
  signs = true,             -- показываем E/W/H/I в колонке
  underline = true,         -- подчеркиваем ошибки/предупреждения
  update_in_insert = false, -- не обновлять во время вставки
  severity_sort = true,     -- сортировка по серьезности
})

-- Всплывающая подсказка при наведении курсора
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focus = false,
      scope = "cursor",
      border = "rounded",
      source = "always",
      prefix = "",
    })
  end,
})

-- Подсказка аргументов функции при вводе
vim.api.nvim_create_autocmd("CursorHoldI", {
  callback = function()
    vim.lsp.buf.signature_help()
  end,
})

-- Автоформатирование при сохранении
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    local clients = vim.lsp.get_active_clients({ bufnr = args.buf })
    if #clients > 0 then
      vim.lsp.buf.format({ async = false })
    end
  end,
})
