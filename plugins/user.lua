return {
  "nvim-treesitter/nvim-treesitter-context",
  "yasuhiroki/github-actions-yaml.vim",
  "antonk52/bad-practices.nvim",
  -- GLEAM
  "gleam-lang/gleam.vim",
  -- /GLEAM

  { "shortcuts/no-neck-pain.nvim", lazy = false },
  {
    "rawnly/profiles.nvim",
    dev = true,
    lazy = false,
    priority = 9000,
    config = function()
      require("profiles").setup {
        global_path = "~",
        filename = ".profile",
      }
    end,
  },
  {
    "wfxr/minimap.vim",
    lazy = false,
  },
  {
    "nacro90/numb.nvim",
    lazy = false,
    opts = {
      show_numbers = true,
      show_cursorline = true,
    },
  },
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
  {
    "dnlhc/glance.nvim",
    cmd = { "Glance" },
    opts = {
      hooks = {
        before_open = function(results, open, jump)
          if #results == 1 then
            jump(results[1])
          else
            open(results)
          end
        end,
      },
    },
  },
  {
    "samjwill/nvim-unception",
    lazy = false,
    init = function() vim.g.unception_block_while_host_edits = true end,
  },
  {
    "mvllow/modes.nvim",
    as = "modes",
    lazy = false,
    opts = function()
      return {
        line_opacity = 0.25,
      }
    end,
  },
  {
    "rainbowhxch/accelerated-jk.nvim",
  },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      { -- example for lazy-loading on keystroke
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { "n", "o", "x" },
      },
      { -- example using an explicit function
        "w",
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { "n", "o", "x" },
      },
      { -- example using an explicit function
        "b",
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = { "n", "o", "x" },
      },
    },
  },
}
