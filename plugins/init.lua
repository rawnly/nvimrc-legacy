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
  -- {
  --   "jose-elias-alvarez/typescript.nvim",
  --   after = "mason-lspconfig.nvim",
  --   config = function()
  --     require("typescript").setup {
  --       server = astronvim.lsp.server_settings "tsserver",
  --     }
  --   end,
  -- },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      local saga = require "lspsaga"

      saga.init_lsp_saga {}
    end,
  },

  -- THEMES
  { "rawnly/oxocarbon.nvim", run = "./install.sh" },
  { "shaunsingh/nord.nvim" },
  { "AlessandroYorba/Sierra" },
  { "nikolvs/vim-sunbather" },
  { "whatyouhide/vim-gotham" },
  { "EdenEast/nightfox.nvim" },
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      vim.g.catppuccin_flavour = "macchiato"
      require("catppuccin").setup {}
      -- vim.api.nvim_command "colorscheme catppuccin"
    end,
  },

  -- EXTRA
  { "yasuhiroki/github-actions-yaml.vim" },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "wakatime/vim-wakatime" },
}

return config
