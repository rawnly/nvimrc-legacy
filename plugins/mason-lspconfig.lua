-- use mason-lspconfig to configure LSP installations
local config = {
  ensure_installed = { "tsserver", "rust_analyzer"},
}

return config
