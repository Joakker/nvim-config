local cmd = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local use = require'packer'.use

return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            import 'plugins.treesitter'
        end,
        run = ':TSUpdate'
    }
    use 'christianchiarulli/nvcode-color-schemes.vim'
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            import 'plugins.statusline'
        end
    }
    use {
        'neovim/nvim-lspconfig',
        requires = {'nvim-lua/completion-nvim', 'onsails/lspkind-nvim'},
        config = function()
            import 'lsp-config'
        end
    }
    use {
        'norcalli/snippets.nvim',
        config = function()
            import 'plugins.snippets'
        end
    }
    use {
        'windwp/nvim-autopairs',
        config = function()
            import 'plugins.autopairs'
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require'gitsigns'.setup()
        end,
        requires = 'nvim-lua/plenary.nvim'
    }
    use 'ThePrimeagen/vim-be-good'
end)
