local config = { -- overrides `require("mason-lspconfig").setup(...)`
  ensure_installed = { "tsserver", "zls", "rust_analyzer", "sumneko_lua" },
}

return config
