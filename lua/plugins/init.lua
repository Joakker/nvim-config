local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system {
        'git',
        'clone',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    vim.cmd [[packadd packer.nvim]]
end

local packer = require 'packer'
local use = packer.use
local use_rocks = packer.use_rocks

packer.init {
    git = { clone_timeout = 3600 },
    luarocks = { python_cmd = 'python3' },
}

if not path_setup then
    ---@diagnostic disable-next-line: lowercase-global
    path_setup = true
    require('packer.luarocks').setup_paths()
end

return packer.startup(function()
    use 'wbthomason/packer.nvim'

    use_rocks 'lua-cjson'

    use { -- nvim-lspconfig
        'neovim/nvim-lspconfig',
        requires = {
            'hrsh7th/nvim-compe',
            'hrsh7th/vim-vsnip',
            'hrsh7th/vim-vsnip-integ',
            'windwp/nvim-autopairs',
            'glepnir/lspsaga.nvim',
            'simrat39/rust-tools.nvim',
        },
    }
    use { -- nvim-web-devicons
        'kyazdani42/nvim-web-devicons',
        config = function()
            require 'plugins.devicons'
        end,
    }
    use { -- nvim-treesitter
        '~/Projects/nvim-treesitter',
        requires = {
            'nvim-treesitter/playground',
        },
        config = function()
            require 'plugins.tree-sitter'
        end,
    }
    use { -- kommentary
        'b3nj5m1n/kommentary',
        config = function()
            require 'plugins.kommentary'
        end,
    }
    use { -- galaxyline.nvim
        'glepnir/galaxyline.nvim',
        config = function()
            require 'plugins.galaxyline'
        end,
    }
    use { -- hop.nvim
        'phaazon/hop.nvim',
        config = function()
            require 'plugins.hop'
        end,
    }
    use { -- FTerm.nvim
        'numToStr/FTerm.nvim',
        config = function()
            require 'plugins.fterm'
        end,
    }
    use { -- nvim-bufferline
        'akinsho/nvim-bufferline.lua',
        config = function()
            require 'plugins.tabline'
        end,
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
    }
    use { -- nvim-colorizer.lua
        'norcalli/nvim-colorizer.lua',
        config = function()
            require 'plugins.colorizer'
        end,
    }
    use { -- telescope.nvim
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-telescope/telescope-dap.nvim',
            'nvim-lua/plenary.nvim',
        },
        config = function()
            require 'plugins.telescope'
        end,
    }
    use { -- nvim-dap
        'mfussenegger/nvim-dap',
        requires = {
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',
        },
        config = function()
            require 'plugins.dap'
        end,
    }

    use 'ray-x/go.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'rktjmp/lush.nvim'
    use 'rafcamlet/nvim-luapad'
end)
