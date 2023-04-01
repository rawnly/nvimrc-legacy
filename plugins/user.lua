return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
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
  "ziglang/zig.vim",
  "yasuhiroki/github-actions-yaml.vim",
  {
    "nvim-neotest/neotest",
    dependencies = { "marilari88/neotest-vitest" },
    opts = function(_, opts)
      require("astronvim.utils").extend_tbl(opts, {
        adapters = {
          require "neotest-vitest",
        },
        ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
      })
    end,
  },

  {
    "edkolev/tmuxline.vim",
    lazy = false,
  },
}
