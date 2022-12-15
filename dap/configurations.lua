local attach_node = {
  type = "pwa-node",
  request = "attach",
  name = "Attach",
  processId = function(...) return require("dap.utils").pick_process(...) end,
  cwd = "${workspaceFolder}",
}

return {
  javascript = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch File",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    attach_node,
  },
  rust = {
    {
      type = "codelldb",
      request = "launch",
      program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
      cwd = "${workspaceFolder}",
      terminal = "integrated",
      sourceLanguages = { "rust" },
    },
  },
}
