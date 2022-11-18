local actions = require "telescope.actions"
local telescope = require "telescope"

return function(config)
  config.defaults.history = {
    path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
    limit = 100,
  }

  telescope.load_extension "smart_history"
  telescope.load_extension "frecency"
  telescope.load_extension "gh"

  return config
end
