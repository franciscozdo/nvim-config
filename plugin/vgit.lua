vim.wo.signcolumn = 'yes'

local vgit_options = {
    keymaps = {
        ['n <C-k>'] = function() require('vgit').hunk_up() end,
        ['n <C-j>'] = function() require('vgit').hunk_down() end,
        ['n <leader>gs']  = function() require('vgit').buffer_hunk_stage() end,
        ['n <leader>gr']  = function() require('vgit').buffer_hunk_reset() end,
        ['n <leader>gp']  = function() require('vgit').buffer_hunk_preview() end,
        ['n <leader>gb']  = function() require('vgit').buffer_blame_preview() end,
        ['n <leader>gf']  = function() require('vgit').buffer_diff_preview() end,
        ['n <leader>gh']  = function() require('vgit').buffer_history_preview() end,
        ['n <leader>gu']  = function() require('vgit').buffer_reset() end,
        ['n <leader>gg']  = function() require('vgit').buffer_gutter_blame_preview() end,
        ['n <leader>glu'] = function() require('vgit').buffer_hunks_preview() end,
        ['n <leader>gls'] = function() require('vgit').project_hunks_staged_preview() end,
        ['n <leader>gd']  = function() require('vgit').project_diff_preview() end,
        ['n <leader>gq']  = function() require('vgit').project_hunks_qf() end,
        ['n <leader>gx']  = function() require('vgit').toggle_diff_preference() end,
    },
    settings = {
        live_blame = { enabled = false, },
        signs = {
            priority = 10,
            definitions = {
                GitSignsAddLn = {
                    linehl = 'GitSignsAddLn',
                    texthl = nil,
                    numhl = nil,
                    icon = nil,
                    text = '',
                },
                GitSignsDeleteLn = {
                    linehl = 'GitSignsDeleteLn',
                    texthl = nil,
                    numhl = nil,
                    icon = nil,
                    text = '',
                },
                GitSignsAdd = {
                    texthl = 'GitSignsAdd',
                    numhl = nil,
                    icon = nil,
                    linehl = nil,
                    text = '+',
                },
                GitSignsDelete = {
                    texthl = 'GitSignsDelete',
                    numhl = nil,
                    icon = nil,
                    linehl = nil,
                    text = '_',
                },
                GitSignsChange = {
                    texthl = 'GitSignsChange',
                    numhl = nil,
                    icon = nil,
                    linehl = nil,
                    text = '~',
                },
            },
            usage = {
                screen = {
                    add = 'GitSignsAddLn',
                    remove = 'GitSignsDeleteLn',
                },
                main = {
                    add = 'GitSignsAdd',
                    remove = 'GitSignsDelete',
                    change = 'GitSignsChange',
                },
            },
        },
    },
}

require('vgit').setup(vgit_options)
