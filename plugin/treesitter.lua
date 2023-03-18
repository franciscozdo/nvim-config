local treesitter_options = {
  ensure_installed = {
    "c",
    "cpp",
    "lua",
    "vim",
    "help",
    "query",
    "python",
    "latex",
    "bash",
    "make",
    "diff",
    "markdown",
  },
  sync_install = true,
  highlight = { enable = true },
}

require('nvim-treesitter.configs').setup(treesitter_options)
