local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system {
        'git',
        'clone',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    vim.cmd [[ packadd packer.nvim ]]
end

local packer = require 'packer'
local use = packer.use

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
            'simrat39/rust-tools.nvim',
            'ray-x/go.nvim',
        },
    }
    use { -- nvim-cmp
        'hrsh7th/nvim-cmp',
        requires = {
            'onsails/lspkind-nvim',
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip',
        },
    }
    use { -- nvim-autopairs
        'windwp/nvim-autopairs',
        config = function()
            require 'plugins.pairs'
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
    use { -- nvim-web-devicons
        'kyazdani42/nvim-web-devicons',
        config = function()
            require 'plugins.devicons'
        end,
    }
    use { -- bufferline.nvim
        'akinsho/bufferline.nvim',
        config = function()
            require 'plugins.bufferline'
        end,
    }
    use { -- feline.nvim
        'famiu/feline.nvim',
        config = function()
            require 'plugins.statusline'
        end,
    }
    use { -- todo-comments.nvim
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require 'plugins.todo'
        end,
    }
    use { -- FTerm.nvim
        'numToStr/FTerm.nvim',
        config = function()
            require 'plugins.fterm'
        end,
    }
    use { -- gitsigns.nvim
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require 'plugins.gitsigns'
        end,
    }
    use { -- hop.nvim
        'phaazon/hop.nvim',
        config = function()
            require 'plugins.hop'
        end,
    }
    use { -- telescope.nvim
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require 'plugins.telescope'
        end,
    }
    use { -- nvim-tree.lua
        'kyazdani42/nvim-tree.lua',
        config = function()
            require 'plugins.nvim-tree'
        end,
    }
    use { -- trouble.nvim
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require 'plugins.trouble'
        end,
    }
    use { -- neorg
        'nvim-neorg/neorg',
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
    use { -- nvim-colorizer.lua
        'norcalli/nvim-colorizer.lua',
        config = function()
            require 'plugins.colorizer'
        end,
    }
    use { -- lush.nvim
        'rktjmp/lush.nvim',
        '~/Projects/astro.nvim',
    }

    use 'folke/lua-dev.nvim'
    use 'b3nj5m1n/kommentary'
    use 'folke/tokyonight.nvim'
end)
