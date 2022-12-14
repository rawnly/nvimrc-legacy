local config = {
  { "IndianBoy42/tree-sitter-just", config = function() require("tree-sitter-just").setup() end },
  { "neomake/neomake" },
  { "NoahTheDuke/vim-just" },
  { "posva/vim-vue" },
  {
    "simrat39/rust-tools.nvim",
    after = "mason-lspconfig.nvim",
    config = function()
      require("rust-tools").setup {
        server = astronvim.lsp.server_settings "rust_analyzer",
      }
    end,
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    after = "mason-lspconfig.nvim",
    config = function()
      require("typescript").setup {
        server = astronvim.lsp.server_settings "tsserver",
      }
    end,
  },
  { "b0o/schemastore.nvim" },
  { "mvllow/modes.nvim", as = "modes", config = function() require("modes").setup() end },
  { "srcery-colors/srcery-vim", as = "srcery" },
  { "kkharji/sqlite.lua" },
  { "nvim-telescope/telescope-smart-history.nvim", requires = { "kkharji/sqlite.lua" } },
  { "nvim-telescope/telescope-github.nvim" },
  { "nvim-telescope/telescope-frecency.nvim" },

  -- THEMES
  { "Hiroya-W/sequoia-moonlight.nvim" },
  { "folke/tokyonight.nvim" },
  {
    "cranberry-clockworks/coal.nvim",
    config = function() require("coal").setup() end,
  },
  { "shaunsingh/nord.nvim" },
  { "cocopon/iceberg.vim" },
  { "projekt0n/github-nvim-theme" },
  { "nikolvs/vim-sunbather" },
  { "EdenEast/nightfox.nvim" },
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      vim.g.catppuccin_flavour = "mocha"
      require("catppuccin").setup {}
    end,
  },
  {
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      require("rose-pine").setup {
        dark_variant = "main",
      }

      vim.cmd "colorscheme rose-pine"
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
