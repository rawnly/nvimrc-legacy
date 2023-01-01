return function(opts)
  local cmp = require "cmp"

  -- opts.mapping["<C-x>"] = cmp.mapping.select_next_item()
  opts.mapping["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }, { "i", "c" })
  opts.mapping["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }, { "i", "c" })

  -- check if copilot is enabled
  -- if not then use the default mapping
  if vim.g.copilot_enabled then
    -- remove the default mapping for <Tab> and <S-Tab>
    -- so we can use C-k and C-j for selecting items
    -- and use <Tab> and <S-Tab> for completion given by Copilot
    opts.mapping["<Tab>"] = nil
    opts.mapping["<S-Tab>"] = nil
  end

  cmp.source_priority = {
    nvim_lsp = 1000,
    luasnip = 750,
    buffer = 500,
    path = 250,
  }

  return opts
end
