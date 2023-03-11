local on_attach = function(client, bufnr)

    local opts = { noremap = true, silent = true }

    -- Info
    vim.keymap.set('n', 'gd',  vim.lsp.buf.definition,      opts)
    vim.keymap.set('n', 'gD',  vim.lsp.buf.declaration,     opts)
    vim.keymap.set('n', 'gtd', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr',  vim.lsp.buf.references,      opts)
    vim.keymap.set('n', 'gi',  vim.lsp.buf.implementation,  opts)
    vim.keymap.set('n', 'gk',  vim.lsp.buf.hover,           opts)
    vim.keymap.set('n', 'gds', vim.lsp.buf.document_symbol, opts)

    -- Editing
    vim.keymap.set('n', 'gA',  vim.lsp.buf.code_action,     opts)
    vim.keymap.set('n', 'gF',  vim.lsp.buf.format,          opts)
    vim.keymap.set("n", "gRn", vim.lsp.util.rename,         opts)

    -- Diagnostics
    vim.keymap.set('n', 'gw',  vim.diagnostic.open_float,   opts)
    vim.keymap.set('n', 'g]',  vim.diagnostic.goto_next,    opts)
    vim.keymap.set('n', 'g[',  vim.diagnostic.goto_prev,    opts)
end

local setup_opts = { on_attach = on_attach }

require("lspconfig").clangd.setup(setup_opts)
require("lspconfig").pyright.setup(setup_opts)
require("lspconfig").ltex.setup(setup_opts)

require("lspconfig").lua_ls.setup({
    on_attach = on_attach,
    diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
    },
})