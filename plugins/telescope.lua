return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "kkharji/sqlite.lua" },
    { "nvim-telescope/telescope-smart-history.nvim", requires = { "kkharji/sqlite.lua" } },
    { "nvim-telescope/telescope-file-browser.nvim" },
  },
  opts = function(_, opts)
    local telescope = require "telescope"
    local actions = require "telescope.actions"
    local fb_actions = require("telescope").extensions.file_browser.actions

    return require("astronvim.utils").extend_tbl(opts, {
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      defaults = {
        file_ignore_patterns = { "node_modules", ".next", ".DS_Store", ".git", "target", "dist", "build" },
        history = {
          path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
          limit = 1000,
        },
      },
      extensions = {
        file_browser = {
          mappings = {
            n = {
              ["<BS>"] = fb_actions.goto_parent_dir,
              ["H"] = fb_actions.toggle_hidden,
            },
            i = {
              ["<C-BS>"] = fb_actions.goto_parent_dir,
              ["<C-a>"] = fb_actions.create_from_prompt,
            },
          },
        },
      },
    })
  end,
  config = function(...)
    require "plugins.configs.telescope"(...)

    local telescope = require "telescope"
    telescope.load_extension "file_browser"
  end,
}
