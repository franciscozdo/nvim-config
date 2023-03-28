local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  --'clangd',
  'lua_ls',
  'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '',
        warn =  '',
        hint =  '⚑',
        info =  ''
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  -- Info
  vim.keymap.set('n', 'gd',  vim.lsp.buf.definition,    opts)
  vim.keymap.set('n', 'gD',  vim.lsp.buf.declaration,   opts)
  vim.keymap.set('n', 'gtd', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gr',  vim.lsp.buf.references,    opts)
  vim.keymap.set('n', 'gi',  vim.lsp.buf.implementation,  opts)
  vim.keymap.set('n', 'gk',  vim.lsp.buf.hover,       opts)
  vim.keymap.set('n', 'gds', vim.lsp.buf.document_symbol, opts)

  -- Editing
  vim.keymap.set('n', 'gA',  vim.lsp.buf.code_action,   opts)
  vim.keymap.set('n', 'gF',  vim.lsp.buf.format,      opts)
  vim.keymap.set("n", "gRn", vim.lsp.util.rename,     opts)

  -- Diagnostics
  vim.keymap.set('n', 'gw',  vim.diagnostic.open_float,   opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)

  --vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  --vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  --vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

local signature_opts = {
    bind = true,
    floating_window = false,
    hint_enable = true,
    hint_prefix = "󰛨 ",
    toggle_key = '<M-s>',
}

require('lsp_signature').setup(signature_opts)
