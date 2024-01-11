return {
  "onsails/lspkind.nvim",
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local lspkind = require "lspkind"

      opts.formatting = {
        format = lspkind.cmp_format {
          mode = "symbol",
          maxwidth = 50,
          ellipsis_char = "…",
          symbol_map = {
            Copilot = "",
          },
        },
      }

      return opts
    end,
  },
}
