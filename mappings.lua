-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    ["<leader>ul"] = { "<cmd>Limelight!! 0.7<CR>", desc = "Toggle LimeLight" },
    ["<leader>uz"] = { "<cmd>Goyo 80%x80%<CR>", desc = "Toggle zen mode" },

    ["f"] = { "<cmd>call sneak#wrap('', 1, 0, 1, 1)<CR>" }, -- cmd
    ["F"] = { "<cmd>call sneak#wrap('', 1, 1, 1, 1)<CR>" }, -- cmd

    ["<leader><leader>"] = { "<cmd>Telescope frecency<CR>", desc = "Frecency" },

    ["<leader>lR"] = { "<cmd>Telescope lsp_references<CR>", desc = "References" },
    ["<leader>bp"] = { "<cmd>BufferlineTogglePin<CR>", desc = "Toggle pin tab" },

    -- Telescope file browser
    ["<leader>fe"] = { "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "File Browser" },
  },
  v = {
    ["f"] = { "<cmd>call sneak#wrap(visualmode(), 1, 0, 1, 1)<CR>" }, -- cmd
    ["F"] = { "<cmd>call sneak#wrap(visualmode(), 1, 1, 1, 1)<CR>" }, -- cmd
  },
}
