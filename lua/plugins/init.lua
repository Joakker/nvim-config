---@diagnostic disable: lowercase-global
local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'

    use {
        'mhartington/formatter.nvim',
        config = function()
            import 'plugins.formatter'
        end,
    } -- formatter.nvim
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
        {
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-cmdline',
            },
        },
        {
            'L3MON4D3/LuaSnip',
            requires = {
                'saadparwaiz1/cmp_luasnip',
            },
        },
    } -- lsp stuff
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            import 'plugins.tree-sitter'
        end,
        requires = {
            'nvim-treesitter/playground',
        },
    } -- nvim-treesitter
    use {
        'folke/which-key.nvim',
        config = function()
            import 'plugins.which-key'
        end,
    } -- which-key.nvim
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            import 'plugins.bufferline'
        end,
    } -- bufferline.nvim
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            import 'plugins.nvim-tree'
        end,
    } -- nvim-tree.lua
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            import 'plugins.gitsigns'
        end,
    } -- gitsigns.nvim
    use {
        'steelsojka/pears.nvim',
        config = function()
            import 'plugins.pears'
        end,
    } -- pears.nvim
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            import 'plugins.telescope'
        end,
    } -- telescope.nvim
    use {
        'phaazon/hop.nvim',
        config = function()
            import 'plugins.hop'
        end,
    } -- hop.nvim
    use {
        'numToStr/Comment.nvim',
        config = function()
            import 'plugins.comment'
        end,
    } -- Comment.nvim
    use {
        'famiu/feline.nvim',
        config = function()
            import 'plugins.statusline'
        end,
    } -- feline.nvim
    use {
        'numToStr/FTerm.nvim',
        config = function()
            import 'plugins.fterm'
        end,
    } -- FTerm.nvim

    if packer_bootstrap then
        require('packer').sync()
    end
end)
