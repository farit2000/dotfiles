return require("lazy").setup({
  -- Themes
  { "navarasu/onedark.nvim" },

  -- Editor utils
  { "nmac427/guess-indent.nvim", config = function() require("guess-indent").setup({}) end },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "crispgm/nvim-tabline", config = function() require("tabline").setup({}) end },
  { "lewis6991/gitsigns.nvim" },
  { "numToStr/comment.nvim", config = function() require("Comment").setup() end },

  -- File tree
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- Telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }, tag = "0.1.2" },

  -- LSP & Mason
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },

  -- Completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/luasnip" },

  -- Debugger
  { "mfussenegger/nvim-dap" },
  { "leoluz/nvim-dap-go" },
})

