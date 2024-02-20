return {
  "nvim-treesitter/nvim-treesitter-context",
  "folke/neodev.nvim",
  "antonk52/bad-practices.nvim",
  "shortcuts/no-neck-pain.nvim",
  "jeffkreeftmeijer/vim-numbertoggle",
  {
    "simonmclean/triptych.nvim",
    event = "VeryLazy",
    dev = true,
    dir = "~/Developer/triptych.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-tree/nvim-web-devicons", -- optional
    },
    opts = {
      mappings = {
        quit = "<esc>",
      },
    },
  },
  {
    "rawnly/profiles.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      return {
        global_path = "~",
        profile_file = ".nvim-profile.json",
      }
    end,
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
}
