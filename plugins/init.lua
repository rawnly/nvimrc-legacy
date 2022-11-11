local config = {
  {
    "simrat39/rust-tools.nvim",
    after = "mason-lspconfig.nvim",
    config = function()
      require("rust-tools").setup {
        server = astronvim.lsp.server_settings "rust_analyzer",
      }
    end,
  },
  { "Hiroya-W/sequoia-moonlight.nvim" },
  { "b0o/schemastore.nvim" },
  { "folke/tokyonight.nvim" },
  -- {
  --   "glepnir/lspsaga.nvim",
  --   branch = "main",
  --   config = function()
  --     local saga = require "lspsaga"
  --
  --     saga.init_lsp_saga {}
  --   end,
  -- },

  -- THEMES
  { "shaunsingh/nord.nvim" },
  { "cocopon/iceberg.vim" },
  { "projekt0n/github-nvim-theme" },
  { "nikolvs/vim-sunbather" },
  { "EdenEast/nightfox.nvim" },
  {
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      require("rose-pine").setup {
        dark_variant = "moon",
      }
    end,
  },
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      vim.g.catppuccin_flavour = "mocha"
      require("catppuccin").setup {}
    end,
  },

  -- EXTRA
  { "yasuhiroki/github-actions-yaml.vim" },
  { "wakatime/vim-wakatime" },
  { "junegunn/limelight.vim" },
  { "junegunn/goyo.vim" },
  { "github/copilot.vim" },
  { "justinmk/vim-sneak" },
}

return config
