-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    ["<leader>lr"] = { "<cmd>Lspsaga rename<CR>", desc = "Rename current symbol" },

    ["<leader>ul"] = { "<cmd>Limelight!! 0.7<CR>", desc = "Toggle LimeLight" },
    ["<leader>uz"] = { "<cmd>Goyo 80%x80%<CR>", desc = "Toggle zen mode" },

    ["f"] = { "<cmd>call sneak#wrap('', 1, 0, 1, 1)<CR>" }, -- cmd
    ["F"] = { "<cmd>call sneak#wrap('', 1, 1, 1, 1)<CR>" }, -- cmd
  },
  v = {
    ["f"] = { "<cmd>call sneak#wrap(visualmode(), 1, 0, 1, 1)<CR>" }, -- cmd
    ["F"] = { "<cmd>call sneak#wrap(visualmode(), 1, 1, 1, 1)<CR>" }, -- cmd
  },
}
