local mason_options = {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}

require("mason").setup(mason_options)
require("mason-lspconfig").setup()
