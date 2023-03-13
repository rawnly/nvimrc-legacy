return {
  settings = {
    cmd = { "typescript-language-server", "--stdio" },
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayParameterNameHints = "all", -- "none" | "literals" | "all",
      },
    },
  },
}
