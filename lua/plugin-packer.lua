local function startup_fun(use)
    use 'wbthomason/packer.nvim'

    use 'ellisonleao/gruvbox.nvim'

    use 'ethanholz/nvim-lastplace'

    use 'lewis6991/gitsigns.nvim'

    use 'ray-x/lsp_signature.nvim'

    use 'nmac427/guess-indent.nvim'

    use  {
        'ms-jpq/coq_nvim',
        branch = 'coq'
    }
    use  {
        'ms-jpq/coq.artifacts',
        branch = 'artifacts'
    }

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'neovim/nvim-lspconfig',
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
    }
end

-- Auto sync after modifying this file
local grp = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "plugin-packer.lua",
    command = "source <afile> | PackerSync",
    group = grp,
})

return require('packer').startup(startup_fun)
