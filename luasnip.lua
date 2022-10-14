local config = {
  -- Add paths for including more VS Code style snippets in luasnip
  vscode_snippet_paths = {
    "./lua/user/snippets",
  },
  -- Extend filetypes
  filetype_extend = {
    javascript = { "javascriptreact" },
    typescript = { "typescriptreact" },
  },
}

return config
