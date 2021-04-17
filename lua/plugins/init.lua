local fn   = vim.fn

local install_path = fn.stdpath('data') .. 'site/pack/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system{
        'git', 'clone',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    }
end

local packer = require 'packer'

packer.init {
    git = {
        clone_timeout = 3600
    },
    display = {
        working_sym = '',
        error_sym   = '',
        done_sym    = '',
    },
    luarocks = {
        python_cmd = 'python3'
    }
}

local use = packer.use

packer.startup(function()
    -- Let packer manage itself
    use 'wbthomason/packer.nvim'

    -- Plugins with configuration/dependencies
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require 'plugins.statusline' end
    }
    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require 'plugins.bufferline' end
    }
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'nvim-lua/completion-nvim',
            'SirVer/ultisnips',
            'honza/vim-snippets'
        },
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            'p00f/nvim-ts-rainbow'
        },
        config = function() require 'plugins.treesitter' end
    }
    use {
        'crispgm/nvim-go',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim'
        },
        config = function() require 'plugins.go' end
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim'
        },
        config = function() require 'plugins.telescope' end
    }
    use {
        'numtostr/FTerm.nvim',
        config = function() require 'plugins.fterm' end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require 'plugins.nvim-tree' end
    }

    -- Simple Plugins
    use 'christianchiarulli/nvcode-color-schemes.vim'
    use 'windwp/nvim-autopairs'
end)
