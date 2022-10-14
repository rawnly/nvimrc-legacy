return function(opts)
  local cmp = require "cmp"

  -- opts.mapping["<C-x>"] = cmp.mapping.select_next_item()
  opts.mapping["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }, { "i", "c" })
  opts.mapping["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }, { "i", "c" })

  cmp.source_priority = {
    nvim_lsp = 1000,
    luasnip = 750,
    buffer = 500,
    path = 250,
  }

  return opts
end
