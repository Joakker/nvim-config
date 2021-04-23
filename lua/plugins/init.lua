local packer = require 'packer'

packer.init {
    git = {clone_timeout = 3600},
    display = {working_sym = '', error_sym = '', done_sym = ''},
    luarocks = {python_cmd = 'python3'},
}

local use = packer.use
local use_rocks = packer.use_rocks

packer.startup(function()
    use_rocks 'lua-cjson'

    -- Let packer manage itself
    use 'wbthomason/packer.nvim'

    -- Plugins with configuration/dependencies
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require 'plugins.statusline'
        end,
    }
    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require 'plugins.bufferline'
        end,
    }
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'nvim-lua/completion-nvim', 'SirVer/ultisnips',
            'glepnir/lspsaga.nvim',
        },
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {'p00f/nvim-ts-rainbow'},
        config = function()
            require 'plugins.treesitter'
        end,
    }
    use {
        'crispgm/nvim-go',
        requires = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'},
        config = function()
            require 'plugins.go'
        end,
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'},
        config = function()
            require 'plugins.telescope'
        end,
    }
    use {
        'numtostr/FTerm.nvim',
        as = 'fterm',
        config = function()
            require 'plugins.fterm'
        end,
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require 'plugins.nvim-tree'
        end,
    }
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            require 'plugins.hop'
        end,
    }
    use {
        '~/Projects/godot.nvim',
        config = function()
            require'godot'.setup {versionmsg = false}
        end,
    }

    -- Simple Plugins
    use 'Joakker/vim-antlr4'
    use 'christianchiarulli/nvcode-color-schemes.vim'
    use 'windwp/nvim-autopairs'
    use 'rktjmp/lush.nvim'
    use 'b3nj5m1n/kommentary'
    use 'rafcamlet/nvim-luapad'
end)
