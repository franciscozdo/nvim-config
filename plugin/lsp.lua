local on_attach = function(ev)
  local opts = { buffer = ev.buf }

  -- Info
  vim.keymap.set('n', 'gd',  vim.lsp.buf.definition,    opts)
  vim.keymap.set('n', 'gD',  vim.lsp.buf.declaration,   opts)
  vim.keymap.set('n', 'gtd', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gr',  vim.lsp.buf.references,    opts)
  vim.keymap.set('n', 'gi',  vim.lsp.buf.implementation,  opts)
  vim.keymap.set('n', 'gk',  vim.lsp.buf.hover,       opts)

  -- Editing
  vim.keymap.set('n', 'gA',  vim.lsp.buf.code_action,   opts)
  vim.keymap.set('n', 'gF',  function() vim.lsp.buf.format { async = true } end, opts)

  -- This function fails because it doesn't get new_name string
  -- vim.keymap.set("n", "gR",  vim.lsp.util.rename,     opts)

  -- Diagnostics
  vim.keymap.set('n', 'gw',  vim.diagnostic.open_float,   opts)
  vim.keymap.set('n', 'g]',  vim.diagnostic.goto_next,  opts)
  vim.keymap.set('n', 'g[',  vim.diagnostic.goto_prev,  opts)
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = on_attach,
})

local lsp = require("lspconfig")

-- NOTE:
--   * each lsp must be installed (e.g. using Mason)
--   * enable lsp that will be used

lsp.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  },
})

lsp.quick_lint_js.setup({})

lsp.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
    }
  }
})

-- lsp.clangd.setup({})
-- 
-- require("clangd_extensions").setup({
--   extensions = {
--       -- defaults:
--       -- Automatically set inlay hints (type hints)
--       autoSetHints = true,
--       -- These apply to the default ClangdSetInlayHints command
--       inlay_hints = {
--           -- Only show inlay hints for the current line
--           only_current_line = false,
--           -- Event which triggers a refersh of the inlay hints.
--           -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
--           -- not that this may cause  higher CPU usage.
--           -- This option is only respected when only_current_line and
--           -- autoSetHints both are true.
--           only_current_line_autocmd = "CursorHold",
--           -- whether to show parameter hints with the inlay hints or not
--           show_parameter_hints = true,
--           -- prefix for parameter hints
--           parameter_hints_prefix = "<- ",
--           -- prefix for all the other hints (type, chaining)
--           other_hints_prefix = "=> ",
--           -- whether to align to the length of the longest line in the file
--           max_len_align = false,
--           -- padding from the left if max_len_align is true
--           max_len_align_padding = 1,
--           -- whether to align to the extreme right or not
--           right_align = false,
--           -- padding from the right if right_align is true
--           right_align_padding = 7,
--           -- The color of the hints
--           highlight = "Comment",
--           -- The highlight group priority for extmark
--           priority = 100,
--       },
--   },
-- })

-- lsp.pyright.setup({})
-- lsp.ltex.setup({})

local signature_opts = {
    bind = true,
    floating_window = false,
    hint_enable = true,
    hint_prefix = "󰛨 ",
    toggle_key = '<M-s>',
}

require('lsp_signature').setup(signature_opts)
