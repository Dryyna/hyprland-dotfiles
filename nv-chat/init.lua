return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- 🔇 FOR NO AUTOCOMPLETE
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
  },

  -- 🔇 FOR NO AUTOPAIRS
  {
    "windwp/nvim-autopairs",
    enabled = false,
  },
}

-- after in nvim command: :Lazy sync
