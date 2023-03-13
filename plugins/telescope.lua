local telescope = require "telescope"

return function(config)
  telescope.load_extension "smart_history"
  telescope.load_extension "frecency"
  telescope.load_extension "file_browser"
  telescope.load_extension "gh"

  config.defaults.history = {
    path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
    limit = 1000,
  }

  local fb_actions = require("telescope").extensions.file_browser.actions
  config.extensions = {
    file_browser = {
      mappings = {
        n = {
          ["<BS>"] = fb_actions.goto_parent_dir,
          ["<C-e>"] = fb_actions.create_from_prompt,
        },
      },
    },
  }

  return config
end
