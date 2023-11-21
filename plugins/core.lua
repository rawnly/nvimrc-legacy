return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local alien = {
        "     _                       _______                       _",
        "  _dMMMb._               .adOOOOOOOOOba.               _,dMMMb_",
        " dP'  ~YMMb             dOOOOOOOOOOOOOOOb             aMMP~  `Yb",
        ' V      ~"Mb           dOOOOOOOOOOOOOOOOOb           dM"~      V',
        "          `Mb.        dOOOOOOOOOOOOOOOOOOOb        ,dM',",
        "           `YMb._    |OOOOOOOOOOOOOOOOOOOOO|    _,dMP',",
        "      __      `YMMM| OP'~\"YOOOOOOOOOOOP\"~`YO |MMMP'      __",
        "    ,dMMMb.      ~~' OO     `YOOOOOP'     OO `~~      ,dMMMb.",
        " _,dP~  `YMba_      OOb      `OOO'      dOO      _aMMP'  ~Yb._",
      }

      local hydra = {
        "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
        "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
        "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
        "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
        "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
        "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
        "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
        " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
        " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
        "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
        "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
      }

      -- customize the dashboard header
      opts.section.header.val = alien

      return opts
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"

      opts.mapping["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }
      opts.mapping["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }

      return opts
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2500,
      fps = 15,
      render = "minimal",
    },
  },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call

      -- add more custom luasnip configuration such as filetype extend or custom snippets
      -- local luasnip = require "luasnip"
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = {
          "./lua/user/snippets",
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require("neo-tree").setup {
        nesting_rules = {
          ["go"] = {
            pattern = "(.*)%.go$",
            files = { "%1_test.go" },
          },
          [".env"] = {
            pattern = "^%.env$",
            files = { "*.env", ".env.*", ".envrc", "env.d.ts" },
          },
          ["docker"] = {
            pattern = "^dockerfile$",
            ignore_case = true,
            files = { ".dockerignore", "docker-compose.*", "dockerfile*" },
          },
          ["ts"] = {
            pattern = "(.+)%.ts$",
            files = { "%1.test.ts", "%1.spec.ts" },
          },
          ["js"] = {
            pattern = "(.+)%.js$",
            files = { "%1.js.map", "%1.min.js", "%1.d.ts" },
          },
          ["next-config"] = {
            pattern = "next.config.js",
            files = {
              "next-env.d.ts",
              ".next",
            },
          },
          ["tsconfig"] = {
            pattern = "^tsconfig%.json$",
            files = {
              "tsconfig.*.json",
            },
          },
          ["package"] = {
            pattern = "^package%.json$",
            files = {
              "package-lock.json",
              "pnpm*",
              "yarn*",
              ".eslint*",
              ".prettier*",
              "*.config.json",
              ".npm*",
              "bun.lockb",
            },
          },
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = {
        enable = true,
        -- disable = {
        --   "python",
        -- },
      },
    },
  },
}
