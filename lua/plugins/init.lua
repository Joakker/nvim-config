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
-- local use_rocks = packer.use_rocks

packer.init {
    git = { clone_timeout = 3600 },
    luarocks = { python_cmd = 'python3' },
}

return packer.startup(function()
    use 'wbthomason/packer.nvim'

    use { -- lua-json5
        '~/Projects/lua-json5',
        run = './install.sh',
    }

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
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'nvim-treesitter/playground',
            'p00f/nvim-ts-rainbow',
        },
        config = function()
            require 'plugins.tree-sitter'
        end,
        run = ':TSUpdate',
    }
    use { -- kommentary
        'b3nj5m1n/kommentary',
        config = function()
            require 'plugins.kommentary'
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
    use { -- feline.nvim
        'famiu/feline.nvim',
        config = function()
            require 'plugins.statusline'
        end,
    }
    use { -- neorg
        'vhyrro/neorg',
        config = function()
            require 'plugins.norg'
        end,
        requires = 'nvim-lua/plenary.nvim',
    }
    use { -- which-key.nvim
        'folke/which-key.nvim',
        config = function()
            require 'plugins.which-key'
        end,
    }
    use { -- todo-comments.nvim
        'folke/todo-comments.nvim',
        config = function()
            require 'plugins.comments'
        end,
        requires = 'nvim-lua/plenary.nvim',
    }

    use 'ray-x/go.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'rktjmp/lush.nvim'
    use 'rafcamlet/nvim-luapad'
end)
