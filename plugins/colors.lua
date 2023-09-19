return {
  "sainnhe/everforest",
  "wuelnerdotexe/vim-enfocado",
  "folke/tokyonight.nvim",
  "sainnhe/gruvbox-material",
  "nyoom-engineering/oxocarbon.nvim",
  {

    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
  },
  "mcchrish/zenbones.nvim",
  "rktjmp/lush.nvim", -- required by zenbons
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      }
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      local c = require("kanagawa.colors").setup({ theme = "wave" }).palette

      -- custom colors
      local BG = "#17191c"
      local ALMOST_BG = "#1c1e20"
      local WHITE = "#9da2af"
      local GRAY = "#80838f"
      local FADED_GRAY = "#33373a"
      local STRONG_FADED_GRAY = "#2a2d30"

      return {
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
          palette = {
            oldWhite = WHITE, -- white text
            fujiWhite = WHITE, -- white text
            fujiGray = FADED_GRAY, -- comments
            sumiInk3 = BG, -- bg
          },
        },
        overrides = function(colors)
          local overrides = {

            --general
            Visual = { bg = ALMOST_BG }, -- bg on select
            ModeMsg = { fg = c.oniViolet },
            CursorLineNr = { fg = c.oniViolet },
            CursorLine = { bg = ALMOST_BG },
            WinSeparator = { fg = ALMOST_BG },

            -- bufferline
            BufferLineFill = { bg = BG },
            BufferLineBackground = { bg = BG, fg = FADED_GRAY }, -- unactive tabs to faded gray
            BufferLineSeparator = { fg = BG },
            BufferLineModified = { fg = BG },
            BufferlineBufferSelected = { fg = GRAY }, -- active tabs to gray
            BufferlineBufferVisible = { fg = GRAY }, -- active tabs to gray
            BufferLineIndicatorVisible = { fg = BG },

            -- indentline
            IndentBlanklineChar = { fg = ALMOST_BG },

            -- GitSigns
            GitSignsAdd = { fg = c.oniViolet },
            GitSignsAddNr = { fg = c.oniViolet },
            GitSignsAddLn = { fg = c.oniViolet },
            GitSignsChange = { fg = c.oniViolet },
            GitSignsChangeNr = { fg = c.oniViolet },
            GitSignsChangeLn = { fg = c.oniViolet },
            GitSignsCurrentLineBlame = { fg = FADED_GRAY },

            -- NvimTree
            NvimTreeGitDirty = { fg = c.oniViolet },
            NvimTreeGitStaged = { fg = c.oniViolet },
            NvimTreeGitMerge = { fg = c.oniViolet },
            NvimTreeGitRenamed = { fg = c.oniViolet },
            NvimTreeGitNew = { fg = c.oniViolet },
            NvimTreeGitDeleted = { fg = c.oniViolet },
            NvimTreeFolderName = { fg = WHITE },
            NvimTreeOpenedFolderName = { fg = WHITE },
            NvimTreeEmptyFolderName = { fg = WHITE },
            NvimTreeRootFolder = { fg = GRAY },
            NvimTreeSpecialFile = { fg = WHITE, bold = true },
            NvimTreeNormalFloat = { bg = BG },
            NvimTreeCursorLine = { bg = ALMOST_BG },
            NvimTreeIndentMarker = { fg = STRONG_FADED_GRAY },
            NvimTreeImageFile = { fg = WHITE },
            NvimTreeFolderIcon = { fg = GRAY },
            NvimTreeFolderIconOpen = { fg = GRAY },
            NvimTreeFolderSymlink = { fg = GRAY },
            NvimTreeDefault = { fg = GRAY },
            NvimTreeSymlink = { fg = GRAY },
            NvimTreeBookmark = { fg = GRAY },
          }
          return overrides
        end,
      }
    end,
    -- opts = {
    -- If you enable compilation, make sure to run :KanagawaCompile command every time you make changes to your config.
    --   compile = false,
    --   commentStyle = { italic = true },
    --   keywordStyle = { italic = true },
    --   colors = {
    --     theme = {
    --       all = {
    --         ui = {
    --           bg_gutter = "none",
    --         },
    --       },
    --     },
    --   },
    --   overrides = function(colors)
    --     local theme = colors.theme
    --
    --     return {
    --       NormalFloat = { bg = "none" },
    --       FloatBorder = { bg = "none" },
    --       FloatTitle = { bg = "none" },
    --       -- Save an hlgroup with dark background and dimmed foreground
    --       -- so that you can use it where your still want darker windows.
    --       -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
    --       NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
    --       -- Popular plugins that open floats will link to NormalFloat by default;
    --       -- set their background accordingly if you wish to keep them dark and borderless
    --       LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
    --       MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
    --       -- borderless telescope
    --       TelescopeTitle = { fg = theme.ui.special, bold = true },
    --       -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
    --       -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
    --       -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
    --       -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
    --       -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
    --       -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
    --
    --       Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
    --       PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
    --       PmenuSbar = { bg = theme.ui.bg_m1 },
    --       PmenuThumb = { bg = theme.ui.bg_p2 },
    --     }
    --   end,
    -- }
    -- { "srcery-colors/srcery-vim", as = "srcery" },
    -- "jaredgorski/SpaceCamp",
    -- "Shatur/neovim-ayu",
    -- "cocopon/iceberg.vim",
    -- "nikolvs/vim-sunbather",
    -- "Mofiqul/adwaita.nvim",
    -- {
    --   "marko-cerovac/material.nvim",
    --   opts = {
    --     plugins = {
    --       "telescope",
    --       "dap",
    --       "which-key",
    --     },
    --   },
    -- },
    -- {
    --   "AlexvZyl/nordic.nvim",
    --   lazy = false,
    --   priority = 1000,
    --   config = function() require("nordic").load() end,
    -- },
  },
}
