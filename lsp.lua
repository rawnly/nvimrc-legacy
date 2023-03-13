return {
  -- enable servers that you already have installed without mason
  skip_setup = {
    "rust_analyzer",
    "tsserver",
  },
  servers = {
    -- "pyright"
  },
  formatting = {
    format_on_save = true, -- enable or disable auto formatting on save
    disabled = { -- disable formatting capabilities for the listed clients
      -- "sumneko_lua",
    },
    -- filter = function(client) -- fully override the default formatting function
    --   return true
    -- end
  },
  -- easily add or disable built in mappings added during LSP attaching
  mappings = {
    n = {
      -- ["<leader>lf"] = false -- disable formatting keymap
    },
  },
  -- add to the global LSP on_attach function
  -- on_attach = function(client, bufnr)
  -- end,

  -- override the mason server-registration function
  -- server_registration = function(server, opts)
  --   require("lspconfig")[server].setup(opts)
  -- end,

  -- Add overrides for LSP server settings, the keys are the name of the server
  ["server-settings"] = {
    rust_analyzer = {
      settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
          -- enable clippy diagnostics
          checkOnSave = {
            command = "clippy",
            extraArgs = { "--no-deps" },
          },
        },
      },
    },
    sumneko_lua = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "astronvim" },
          },
          workspace = {
            -- make the server aware of neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          hint = {
            enable = true,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    },
    jsonls = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = {
          enable = true,
        },
      },
    },
    -- example for addings schemas to yamlls
    -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
    --   settings = {
    --     yaml = {
    --       schemas = {
    --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
    --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
    --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
    --       },
    --     },
    --   },
    -- },
  },
}
