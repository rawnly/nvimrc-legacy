local config = {
  { "neomake/neomake" },
  { "NoahTheDuke/vim-just" },
  { "posva/vim-vue" },
  {
    "simrat39/inlay-hints.nvim",
    config = function() require("inlay-hints").setup {} end,
  },
  {
    "simrat39/rust-tools.nvim",
    after = "mason-lspconfig.nvim",
    config = function()
      -- local mason_registry = require "mason-registry"
      -- local codelldb = mason_registry.get_package "codelldb"
      -- local codelldb_path = codelldb:get_install_path()

      local ext_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/"
      local codelldb_path = ext_path .. "adapter/codelldb"
      local liblld_path = ext_path .. "lldb/lib/liblldb.so"

      require("rust-tools").setup {
        server = astronvim.lsp.server_settings "rust_analyzer",
        tools = {
          dap = {
            adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblld_path),
          },
        },
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
  {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npm run compile",
    config = function()
      require("dap-vscode-js").setup {
        adapters = { "pwa-node" },
      }
    end,
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    after = "mason-nvim-dap.nvim",
    config = function()
      require("dap-vscode-js").setup {
        debugger_cmd = { "js-debug-adapter" },
        adapters = { "pwa-node" },
      }
    end,
  },

  --
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
    config = function() require("catppuccin").setup {} end,
  },
  {
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      require("rose-pine").setup {
        dark_variant = "main",
      }
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
