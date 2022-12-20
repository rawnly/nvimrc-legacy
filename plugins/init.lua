local config = {
  { "neomake/neomake" },
  -- justfile syntax and support
  { "NoahTheDuke/vim-just" },
  -- vue
  { "posva/vim-vue" },
  -- inlay hints
  {
    "simrat39/inlay-hints.nvim",
    config = function() require("inlay-hints").setup {} end,
  },
  -- rust support
  {
    "simrat39/rust-tools.nvim",
    after = "mason-lspconfig.nvim",
    config = function()
      -- local mason_registry = require "mason-registry"
      -- local codelldb = mason_registry.get_package "codelldb"
      -- local codelldb_path = codelldb:get_install_path()

      -- setup dap for rust
      -- NOT WORKING...
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
  -- tsserver
  {
    "jose-elias-alvarez/typescript.nvim",
    after = "mason-lspconfig.nvim",
    config = function()
      require("typescript").setup {
        server = astronvim.lsp.server_settings "tsserver",
      }
    end,
  },
  -- debugger for js and ts
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
  -- debugger for js
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

  -- support for json schemas
  { "b0o/schemastore.nvim" },

  -- highlights modes
  { "mvllow/modes.nvim", as = "modes", config = function() require("modes").setup() end },

  -- history in telescope
  { "kkharji/sqlite.lua" },
  { "nvim-telescope/telescope-smart-history.nvim", requires = { "kkharji/sqlite.lua" } },

  -- navigate PRs and Issues
  { "nvim-telescope/telescope-github.nvim" },

  -- navigate recent files
  { "nvim-telescope/telescope-frecency.nvim" },

  -- THEMES
  { "srcery-colors/srcery-vim", as = "srcery" },
  { "folke/tokyonight.nvim" },
  {
    "cranberry-clockworks/coal.nvim",
    config = function() require("coal").setup() end,
  },
  { "cocopon/iceberg.vim" },
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
  -- github actions support
  { "yasuhiroki/github-actions-yaml.vim" },
  -- time tracking
  { "wakatime/vim-wakatime" },
  -- focus mode
  { "junegunn/limelight.vim" },
  { "junegunn/goyo.vim" },
  -- copilot
  { "github/copilot.vim" },
  -- fast moves
  { "justinmk/vim-sneak" },
}

return config
