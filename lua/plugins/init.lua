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
    use '~/Projects/nvcode-color-schemes.vim'
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
        requires = {
            'nvim-lua/completion-nvim',
            'glepnir/lspsaga.nvim',
            'nvim-lua/lsp_extensions.nvim'
        },
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
    use {
        'numToStr/FTerm.nvim',
        config = function()
            import 'plugins.fterm'
        end
    }
    use {
        '~/Projects/surround.nvim',
        config = function()
            require'surround'.setup {}
        end
    }
    use { '~/Projects/godot.nvim',
        config = function()
            require'godot'.setup{
                versionmsg = false
            }
        end
    }
    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'bufferline'.setup{} end
    }
    use {
        'glepnir/indent-guides.nvim',
        config = function()
            require'indent_guides'.setup{
                indent_soft_pattern = '\\s',
                indent_char = '|',
                even_colors = { fg = '#DEADBEEF', bg = '#332b36' },
                odd_colors =  { fg = '#DEADBEEF', bg = '#2a3834' },
            }
        end
    }
    use 'ThePrimeagen/vim-be-good'
    use 'b3nj5m1n/kommentary'
    use 'phaazon/hop.nvim'
    use 'kyazdani42/nvim-tree.lua'
    use 'rktjmp/lush.nvim'
end)
