local telescope_options = {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

local def_map = function(keys, fun, descr)
  vim.keymap.set('n', keys, fun, {desc = descr})
end

def_map('<leader>sf', require('telescope.builtin').find_files,  '[S]earch [F]iles')
def_map('<leader>sh', require('telescope.builtin').help_tags,   '[S]earch [H]elp')
def_map('<leader>sw', require('telescope.builtin').grep_string, '[S]earch current [W]ord')
def_map('<leader>sg', require('telescope.builtin').live_grep,   '[S]earch by [G]rep')
def_map('<leader>sd', require('telescope.builtin').diagnostics, '[S]earch [D]iagnostics')
def_map('<leader>so', require('telescope.builtin').oldfiles,  '[S]earch [O]ld files')

def_map('<leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    previewer = true,
    })
  end,
  '[/] Fuzzily search in current buffer')

require('telescope').setup(telescope_options)
